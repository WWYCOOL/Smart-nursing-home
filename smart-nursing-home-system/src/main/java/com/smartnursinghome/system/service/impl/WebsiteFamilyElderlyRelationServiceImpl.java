package com.smartnursinghome.system.service.impl;

import java.util.List;
import java.util.Date;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteFamilyElderlyRelationMapper;
import com.smartnursinghome.system.domain.WebsiteFamilyElderlyRelation;
import com.smartnursinghome.system.service.IWebsiteFamilyElderlyRelationService;

/**
 * 家属老人关系Service业务层处理
 *
 * @author ruoyi
 * @date 2024-01-15
 */
@Service
public class WebsiteFamilyElderlyRelationServiceImpl implements IWebsiteFamilyElderlyRelationService
{
    @Autowired
    private WebsiteFamilyElderlyRelationMapper websiteFamilyElderlyRelationMapper;

    /**
     * 查询家属老人关系
     *
     * @param relationId 家属老人关系主键
     * @return 家属老人关系
     */
    @Override
    public WebsiteFamilyElderlyRelation selectWebsiteFamilyElderlyRelationByRelationId(Long relationId)
    {
        return websiteFamilyElderlyRelationMapper.selectWebsiteFamilyElderlyRelationByRelationId(relationId);
    }

    /**
     * 查询家属老人关系列表
     *
     * @param websiteFamilyElderlyRelation 家属老人关系
     * @return 家属老人关系
     */
    @Override
    public List<WebsiteFamilyElderlyRelation> selectWebsiteFamilyElderlyRelationList(WebsiteFamilyElderlyRelation websiteFamilyElderlyRelation)
    {
        return websiteFamilyElderlyRelationMapper.selectWebsiteFamilyElderlyRelationList(websiteFamilyElderlyRelation);
    }

    /**
     * 新增家属老人关系
     *
     * @param websiteFamilyElderlyRelation 家属老人关系
     * @return 结果
     */
    @Override
    public int insertWebsiteFamilyElderlyRelation(WebsiteFamilyElderlyRelation websiteFamilyElderlyRelation)
    {
        websiteFamilyElderlyRelation.setCreateTime(DateUtils.getNowDate());
        return websiteFamilyElderlyRelationMapper.insertWebsiteFamilyElderlyRelation(websiteFamilyElderlyRelation);
    }

    /**
     * 修改家属老人关系
     *
     * @param websiteFamilyElderlyRelation 家属老人关系
     * @return 结果
     */
    @Override
    public int updateWebsiteFamilyElderlyRelation(WebsiteFamilyElderlyRelation websiteFamilyElderlyRelation)
    {
        websiteFamilyElderlyRelation.setUpdateTime(DateUtils.getNowDate());
        return websiteFamilyElderlyRelationMapper.updateWebsiteFamilyElderlyRelation(websiteFamilyElderlyRelation);
    }

    /**
     * 批量删除家属老人关系
     *
     * @param relationIds 需要删除的家属老人关系主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFamilyElderlyRelationByRelationIds(Long[] relationIds)
    {
        return websiteFamilyElderlyRelationMapper.deleteWebsiteFamilyElderlyRelationByRelationIds(relationIds);
    }

    /**
     * 删除家属老人关系信息
     *
     * @param relationId 家属老人关系主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFamilyElderlyRelationByRelationId(Long relationId)
    {
        return websiteFamilyElderlyRelationMapper.deleteWebsiteFamilyElderlyRelationByRelationId(relationId);
    }

    /**
     * 根据家属ID查询绑定的老人列表
     *
     * @param familyId 家属ID
     * @return 老人关系列表
     */
    @Override
    public List<WebsiteFamilyElderlyRelation> selectElderlyListByFamilyId(Long familyId)
    {
        return websiteFamilyElderlyRelationMapper.selectElderlyListByFamilyId(familyId);
    }

    /**
     * 根据老人ID查询绑定的家属列表
     *
     * @param elderlyId 老人ID
     * @return 家属关系列表
     */
    @Override
    public List<WebsiteFamilyElderlyRelation> selectFamilyListByElderlyId(Long elderlyId)
    {
        return websiteFamilyElderlyRelationMapper.selectFamilyListByElderlyId(elderlyId);
    }

    /**
     * 根据老人身份证号查询老人信息
     *
     * @param idCard 身份证号
     * @return 老人信息
     */
    @Override
    public WebsiteFamilyElderlyRelation selectElderlyByIdCard(String idCard)
    {
        return websiteFamilyElderlyRelationMapper.selectElderlyByIdCard(idCard);
    }

    /**
     * 创建家属老人绑定关系
     *
     * @param familyId 家属ID
     * @param elderlyIdCard 老人身份证号
     * @param relationship 关系类型
     * @return 结果
     */
    @Override
    public int createFamilyElderlyRelation(Long familyId, String elderlyIdCard, String relationship)
    {
        // 根据身份证号查询老人信息
        WebsiteFamilyElderlyRelation elderlyInfo = websiteFamilyElderlyRelationMapper.selectElderlyByIdCard(elderlyIdCard);
        if (elderlyInfo == null) {
            throw new RuntimeException("未找到对应的老人信息，请检查身份证号是否正确");
        }

        // 检查是否已经存在绑定关系
        WebsiteFamilyElderlyRelation existRelation = new WebsiteFamilyElderlyRelation();
        existRelation.setFamilyId(familyId);
        existRelation.setElderlyId(elderlyInfo.getElderlyId());
        List<WebsiteFamilyElderlyRelation> existList = websiteFamilyElderlyRelationMapper.selectWebsiteFamilyElderlyRelationList(existRelation);
        if (!existList.isEmpty()) {
            throw new RuntimeException("该家属与老人已存在绑定关系");
        }

        // 创建新的绑定关系
        WebsiteFamilyElderlyRelation relation = new WebsiteFamilyElderlyRelation();
        relation.setFamilyId(familyId);
        relation.setElderlyId(elderlyInfo.getElderlyId());
        relation.setRelationship(relationship);
        relation.setIsPrimary("0"); // 默认非主要联系人
        relation.setBindStatus("0"); // 待审核状态
        relation.setCreateBy("system");
        relation.setCreateTime(DateUtils.getNowDate());
        relation.setRemark("家属注册时自动创建");

        return websiteFamilyElderlyRelationMapper.insertWebsiteFamilyElderlyRelation(relation);
    }

    /**
     * 审核家属老人关系
     *
     * @param relationId 关系ID
     * @param bindStatus 绑定状态
     * @return 结果
     */
    @Override
    public int auditFamilyElderlyRelation(Long relationId, String bindStatus)
    {
        WebsiteFamilyElderlyRelation relation = websiteFamilyElderlyRelationMapper.selectWebsiteFamilyElderlyRelationByRelationId(relationId);
        if (relation == null) {
            throw new RuntimeException("关系记录不存在");
        }

        relation.setBindStatus(bindStatus);
        relation.setUpdateBy("admin");
        relation.setUpdateTime(DateUtils.getNowDate());

        if ("1".equals(bindStatus)) {
            relation.setBindTime(DateUtils.getNowDate());
        }

        return websiteFamilyElderlyRelationMapper.updateWebsiteFamilyElderlyRelation(relation);
    }
}
