package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteHealthReportMapper;
import com.smartnursinghome.system.mapper.WebsiteFamilyUserMapper;
import com.smartnursinghome.system.domain.WebsiteHealthReport;
import com.smartnursinghome.system.service.IWebsiteHealthReportService;
import com.smartnursinghome.system.service.IActivityRecordService;

/**
 * 健康报告Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-12-01
 */
@Service
public class WebsiteHealthReportServiceImpl implements IWebsiteHealthReportService 
{
    @Autowired
    private WebsiteHealthReportMapper websiteHealthReportMapper;
    
    @Autowired
    private WebsiteFamilyUserMapper websiteFamilyUserMapper;
    
    @Autowired
    private IActivityRecordService activityRecordService;

    /**
     * 查询健康报告
     * 
     * @param reportId 健康报告主键
     * @return 健康报告
     */
    @Override
    public WebsiteHealthReport selectWebsiteHealthReportByReportId(Long reportId)
    {
        return websiteHealthReportMapper.selectWebsiteHealthReportByReportId(reportId);
    }

    /**
     * 查询健康报告列表
     * 
     * @param websiteHealthReport 健康报告
     * @return 健康报告
     */
    @Override
    public List<WebsiteHealthReport> selectWebsiteHealthReportList(WebsiteHealthReport websiteHealthReport)
    {
        return websiteHealthReportMapper.selectWebsiteHealthReportList(websiteHealthReport);
    }

    /**
     * 新增健康报告
     * 
     * @param websiteHealthReport 健康报告
     * @return 结果
     */
    @Override
    public int insertWebsiteHealthReport(WebsiteHealthReport websiteHealthReport)
    {
        websiteHealthReport.setCreateTime(DateUtils.getNowDate());
        int result = websiteHealthReportMapper.insertWebsiteHealthReport(websiteHealthReport);
        
        // 记录动�?
        if (result > 0 && websiteHealthReport.getReportId() != null) {
            try {
                System.out.println("开始记录健康报告动�?..");
                // 获取老人信息
                String elderlyName = websiteHealthReport.getElderlyName();
                if (elderlyName == null || elderlyName.isEmpty()) {
                    elderlyName = "老人"; // 默认名称
                }
                
                // 获取家属ID（这里需要根据实际业务逻辑获取�?
                Long familyId = getFamilyIdByElderlyId(websiteHealthReport.getElderlyId());
                System.out.println("获取到的家属ID: " + familyId);
                System.out.println("老人ID: " + websiteHealthReport.getElderlyId());
                System.out.println("老人姓名: " + elderlyName);
                System.out.println("报告ID: " + websiteHealthReport.getReportId());
                
                if (familyId != null) {
                    activityRecordService.recordHealthActivity(
                        familyId, 
                        websiteHealthReport.getElderlyId(), 
                        elderlyName, 
                        websiteHealthReport.getReportId(), 
                        "add", 
                        websiteHealthReport.getReportType()
                    );
                    System.out.println("健康报告动态记录成功");
                } else {
                    System.out.println("家属ID为空，跳过动态记录");
                }
            } catch (Exception e) {
                // 记录动态失败不影响主业务
                System.err.println("记录健康报告动态失败 " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            System.out.println("健康报告插入失败或报告ID为空，跳过动态记录");
        }
        
        return result;
    }

    /**
     * 修改健康报告
     * 
     * @param websiteHealthReport 健康报告
     * @return 结果
     */
    @Override
    public int updateWebsiteHealthReport(WebsiteHealthReport websiteHealthReport)
    {
        websiteHealthReport.setUpdateTime(DateUtils.getNowDate());
        int result = websiteHealthReportMapper.updateWebsiteHealthReport(websiteHealthReport);
        
        // 记录动�?
        if (result > 0) {
            try {
                // 获取老人信息
                String elderlyName = websiteHealthReport.getElderlyName();
                if (elderlyName == null || elderlyName.isEmpty()) {
                    elderlyName = "老人"; // 默认名称
                }
                
                // 获取家属ID
                Long familyId = getFamilyIdByElderlyId(websiteHealthReport.getElderlyId());
                if (familyId != null) {
                    activityRecordService.recordHealthActivity(
                        familyId, 
                        websiteHealthReport.getElderlyId(), 
                        elderlyName, 
                        websiteHealthReport.getReportId(), 
                        "update", 
                        websiteHealthReport.getReportType()
                    );
                }
            } catch (Exception e) {
                System.err.println("记录健康报告动态失败 " + e.getMessage());
            }
        }
        
        return result;
    }

    /**
     * 批量删除健康报告
     * 
     * @param reportIds 需要删除的健康报告主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteHealthReportByReportIds(Long[] reportIds)
    {
        return websiteHealthReportMapper.deleteWebsiteHealthReportByReportIds(reportIds);
    }

    /**
     * 删除健康报告信息
     * 
     * @param reportId 健康报告主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteHealthReportByReportId(Long reportId)
    {
        return websiteHealthReportMapper.deleteWebsiteHealthReportByReportId(reportId);
    }
    
    @Override
    public WebsiteHealthReport getLatestHealthReportByFamilyId(Long familyId)
    {
        return websiteHealthReportMapper.getLatestHealthReportByFamilyId(familyId);
    }
    
    /**
     * 根据老人ID获取家属ID
     * 通过查询绑定关系表动态获取
     */
    private Long getFamilyIdByElderlyId(Long elderlyId) {
        try {
            if (elderlyId == null) {
                System.out.println("老人ID为空，无法获取家属ID");
                return null;
            }
            
            System.out.println("查询老人ID " + elderlyId + " 对应的家属ID");
            
            // 使用数据库查询获取真实的家属ID
            Long familyId = websiteFamilyUserMapper.getFamilyIdByElderlyId(elderlyId);
            
            if (familyId != null) {
                System.out.println("找到家属ID: " + familyId);
                return familyId;
            } else {
                System.out.println("未找到老人ID " + elderlyId + " 对应的家属，使用默认家属ID 25");
                return 25L; // 默认返回张大爷的家属ID
            }
        } catch (Exception e) {
            System.err.println("获取家属ID失败: " + e.getMessage());
            e.printStackTrace();
            return 25L; // 默认返回张大爷的家属ID
        }
    }

    @Override
    public int selectWebsiteHealthReportCount()
    {
        return websiteHealthReportMapper.selectWebsiteHealthReportCount();
    }
}


