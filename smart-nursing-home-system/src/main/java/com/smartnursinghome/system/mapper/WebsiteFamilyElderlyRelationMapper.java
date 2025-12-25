package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteFamilyElderlyRelation;

/**
 * 家属老人关系Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-15
 */
public interface WebsiteFamilyElderlyRelationMapper 
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
     * 删除家属老人关系
     * 
     * @param relationId 家属老人关系主键
     * @return 结果
     */
    public int deleteWebsiteFamilyElderlyRelationByRelationId(Long relationId);

    /**
     * 批量删除家属老人关系
     * 
     * @param relationIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteFamilyElderlyRelationByRelationIds(Long[] relationIds);

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
}
