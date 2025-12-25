package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteFamilyUser;

/**
 * 家属用户Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-15
 */
public interface WebsiteFamilyUserMapper 
{
    /**
     * 查询家属用户
     * 
     * @param familyId 家属用户主键
     * @return 家属用户
     */
    public WebsiteFamilyUser selectWebsiteFamilyUserByFamilyId(Long familyId);

    /**
     * 查询家属用户列表
     * 
     * @param websiteFamilyUser 家属用户
     * @return 家属用户集合
     */
    public List<WebsiteFamilyUser> selectWebsiteFamilyUserList(WebsiteFamilyUser websiteFamilyUser);

    /**
     * 新增家属用户
     * 
     * @param websiteFamilyUser 家属用户
     * @return 结果
     */
    public int insertWebsiteFamilyUser(WebsiteFamilyUser websiteFamilyUser);

    /**
     * 修改家属用户
     * 
     * @param websiteFamilyUser 家属用户
     * @return 结果
     */
    public int updateWebsiteFamilyUser(WebsiteFamilyUser websiteFamilyUser);

    /**
     * 删除家属用户
     * 
     * @param familyId 家属用户主键
     * @return 结果
     */
    public int deleteWebsiteFamilyUserByFamilyId(Long familyId);

    /**
     * 批量删除家属用户
     * 
     * @param familyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteFamilyUserByFamilyIds(Long[] familyIds);

    /**
     * 根据用户名查询家属用�?     * 
     * @param username 用户�?     * @return 家属用户
     */
    public WebsiteFamilyUser selectWebsiteFamilyUserByUsername(String username);

    /**
     * 根据手机号查询家属用�?     * 
     * @param phone 手机�?     * @return 家属用户
     */
    public WebsiteFamilyUser selectWebsiteFamilyUserByPhone(String phone);

    /**
     * 检查家属用户是否有已审核通过的绑定关�?     *
     * @param familyId 家属ID
     * @return 是否有已审核通过的绑定关�?     */
    public boolean hasApprovedRelation(Long familyId);
    
    /**
     * 根据老人ID获取家属ID
     *
     * @param elderlyId 老人ID
     * @return 家属ID
     */
    public Long getFamilyIdByElderlyId(Long elderlyId);

    /**
     * 查询家属用户总数
     * 
     * @return 家属用户总数
     */
    public int selectWebsiteFamilyUserCount();
}
