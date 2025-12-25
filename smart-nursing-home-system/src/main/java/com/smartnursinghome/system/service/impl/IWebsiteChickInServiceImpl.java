package com.smartnursinghome.system.service.impl;

import com.smartnursinghome.common.exception.ServiceException;
import com.smartnursinghome.system.domain.ElderlyResidence;
import com.smartnursinghome.system.domain.WebsiteBed;
import com.smartnursinghome.system.domain.WebsiteElderlyInfo;
import com.smartnursinghome.system.domain.vo.ElderlyResidenceVo;
import com.smartnursinghome.system.mapper.WebsiteBedMapper;
import com.smartnursinghome.system.mapper.WebsiteChickInMapper;
import com.smartnursinghome.system.mapper.WebsiteElderlyInfoMapper;
import com.smartnursinghome.system.service.IWebsiteChickInService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

import static com.smartnursinghome.system.domain.ElderlyResidence.TYPE_CHECK_IN;

@Service
@RequiredArgsConstructor
public class IWebsiteChickInServiceImpl implements IWebsiteChickInService {

    private final WebsiteElderlyInfoMapper websiteElderlyInfoMapper;
    private final WebsiteChickInMapper websiteChickInMapper;
    private final WebsiteBedMapper websiteBedMapper;

    @Override
    public List<ElderlyResidenceVo> selectWebsiteChickInList(ElderlyResidence elderlyResidence) {
        return websiteChickInMapper.selectWebsiteChickInList(elderlyResidence);
    }

    /***
     *     根据输入的参数进行入住或退住
     * @param elderlyResidence
     * @return
     */

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean chickInOrOut(ElderlyResidence elderlyResidence) {
        WebsiteElderlyInfo elderlyInfo = new WebsiteElderlyInfo();
        elderlyInfo.setElderlyId(elderlyResidence.getElderlyId());
        
        if (elderlyResidence.getType() == TYPE_CHECK_IN) {
            // --- 入住逻辑 ---
            
            // 1. 校验床位状态
            Long bedId = elderlyResidence.getBedId();
            if (bedId == null) {
                throw new ServiceException("入住办理必须选择床位");
            }
            WebsiteBed bed = websiteBedMapper.selectWebsiteBedByBedId(bedId);
            if (bed == null) {
                throw new ServiceException("选择的床位不存在");
            }
            if (!"0".equals(bed.getBedStatus())) {
                throw new ServiceException("该床位非空闲状态，无法办理入住");
            }

            // 2. 更新床位状态 -> 已入住 (1) 并绑定老人
            bed.setBedStatus("1");
            bed.setElderlyId(elderlyResidence.getElderlyId());
            websiteBedMapper.updateWebsiteBed(bed);

            // 3. 更新老人信息 (状态、入住日期、房间号、床位号)
            elderlyInfo.setStatus("0"); // 0: 在院
            elderlyInfo.setAdmissionDate(Date.valueOf(elderlyResidence.getCheckInTime()));
            elderlyInfo.setRoomNumber(elderlyResidence.getRoomNumber());
            elderlyInfo.setBedNumber(elderlyResidence.getBedNumber());
            websiteElderlyInfoMapper.updateWebsiteElderlyInfo(elderlyInfo);

            // 4. 插入入住记录
            websiteChickInMapper.chickIn(elderlyResidence);

        } else {
            // --- 退住逻辑 ---
            
            // 1. 获取老人当前信息，找到他占用的床位
            WebsiteElderlyInfo currentElderly = websiteElderlyInfoMapper.selectWebsiteElderlyInfoByElderlyId(elderlyResidence.getElderlyId());
            if (currentElderly != null) {
                // 尝试通过老人信息里的 roomNumber/bedNumber 找床位，或者直接去床位表反查
                // 这里更稳妥的是去床位表查：谁绑定了这个老人
                WebsiteBed queryBed = new WebsiteBed();
                queryBed.setElderlyId(elderlyResidence.getElderlyId());
                List<WebsiteBed> beds = websiteBedMapper.selectWebsiteBedList(queryBed);
                
                // 释放所有该老人占用的床位 (理论上应该只有一个)
                for (WebsiteBed occupiedBed : beds) {
                    occupiedBed.setBedStatus("0"); // 变回空闲
                    occupiedBed.setElderlyId(null); // 解绑
                    websiteBedMapper.updateWebsiteBed(occupiedBed);
                }
            }

            // 2. 更新老人信息 (状态 -> 1: 出院/离院)
            elderlyInfo.setStatus("1");
            // 退住时，清空老人的房间和床位显示
            elderlyInfo.setRoomNumber(""); 
            elderlyInfo.setBedNumber("");
            // 注意：这里是否要更新 admissionDate 取决于业务，通常退住不改写入住日期，而是更新出院日期
            // 但原逻辑是 setAdmissionDate，暂时保留原样或按需调整。这里暂不覆盖原逻辑的日期设置
            // elderlyInfo.setAdmissionDate(...); 
            
            websiteElderlyInfoMapper.updateWebsiteElderlyInfo(elderlyInfo);

            // 3. 插入退住记录
            websiteChickInMapper.chickIn(elderlyResidence);
        }
        return true;
    }
}
