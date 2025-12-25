package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteFamilyElderlyRelation;

/**
 * 家属老人关系Service接口
 * 
 * @author ruoyi
 * @date 2024-01-15
 */
public interface IWebsiteFamilyElderlyRelationService 
{
    /**
     * 查询家属老人关系
     * 
     * @param relationId 家属老人关系主键
     * @return 家属老人关系
     */
    public WebsiteFamilyElderlyRelation selectWebsiteFamilyElderlyRelationByRelationId(Long relationId);

    /**
     * 查询家属老人关系列表
     * 
     * @param websiteFamilyElderlyRelation 家属老人关系
     * @return 家属老人关系集合
     */
    public List<WebsiteFamilyElderlyRelation> selectWebsiteFamilyElderlyRelationList(WebsiteFamilyElderlyRelation websiteFamilyElderlyRelation);

    /**
     * 新增家属老人关系
     * 
     * @param websiteFamilyElderlyRelation 家属老人关系
     * @return 结果
     */
    public int insertWebsiteFamilyElderlyRelation(WebsiteFamilyElderlyRelation websiteFamilyElderlyRelation);

    /**
     * 修改家属老人关系
     * 
     * @param websiteFamilyElderlyRelation 家属老人关系
     * @return 结果
     */
    public int updateWebsiteFamilyElderlyRelation(WebsiteFamilyElderlyRelation websiteFamilyElderlyRelation);

    /**
     * 批量删除家属老人关系
     * 
     * @param relationIds 需要删除的家属老人关系主键集合
     * @return 结果
     */
    public int deleteWebsiteFamilyElderlyRelationByRelationIds(Long[] relationIds);

    /**
     * 删除家属老人关系信息
     * 
     * @param relationId 家属老人关系主键
     * @return 结果
     */
    public int deleteWebsiteFamilyElderlyRelationByRelationId(Long relationId);

    /**
     * 根据家属ID查询绑定的老人列表
     * 
     * @param familyId 家属ID
     * @return 老人关系列表
     */
    public List<WebsiteFamilyElderlyRelation> selectElderlyListByFamilyId(Long familyId);

    /**
     * 根据老人ID查询绑定的家属列�?
     * 
     * @param elderlyId 老人ID
     * @return 家属关系列表
     */
    public List<WebsiteFamilyElderlyRelation> selectFamilyListByElderlyId(Long elderlyId);

    /**
     * 根据老人身份证号查询老人信息
     * 
     * @param idCard 身份证号
     * @return 老人信息
     */
    public WebsiteFamilyElderlyRelation selectElderlyByIdCard(String idCard);

    /**
     * 创建家属老人绑定关系
     * 
     * @param familyId 家属ID
     * @param elderlyIdCard 老人身份证号
     * @param relationship 关系类型
     * @return 结果
     */
    public int createFamilyElderlyRelation(Long familyId, String elderlyIdCard, String relationship);

    /**
     * 审核家属老人关系
     * 
     * @param relationId 关系ID
     * @param bindStatus 绑定状�?
     * @return 结果
     */
    public int auditFamilyElderlyRelation(Long relationId, String bindStatus);
}
