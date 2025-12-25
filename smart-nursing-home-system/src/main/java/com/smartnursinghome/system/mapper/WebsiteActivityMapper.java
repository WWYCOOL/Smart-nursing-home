package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteActivity;

/**
 * 动态记录Mapper接口
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
public interface WebsiteActivityMapper 
{
    /**
     * 查询动态记�?
     * 
     * @param activityId 动态记录主�?
     * @return 动态记�?
     */
    public WebsiteActivity selectWebsiteActivityByActivityId(Long activityId);

    /**
     * 查询动态记录列�?
     * 
     * @param websiteActivity 动态记�?
     * @return 动态记录集�?
     */
    public List<WebsiteActivity> selectWebsiteActivityList(WebsiteActivity websiteActivity);

    /**
     * 查询家属最新动�?
     * 
     * @param familyId 家属ID
     * @return 动态记录集�?
     */
    public List<WebsiteActivity> selectFamilyRecentActivities(Long familyId);

    /**
     * 新增动态记�?
     * 
     * @param websiteActivity 动态记�?
     * @return 结果
     */
    public int insertWebsiteActivity(WebsiteActivity websiteActivity);

    /**
     * 修改动态记�?
     * 
     * @param websiteActivity 动态记�?
     * @return 结果
     */
    public int updateWebsiteActivity(WebsiteActivity websiteActivity);

    /**
     * 删除动态记�?
     * 
     * @param activityId 动态记录主�?
     * @return 结果
     */
    public int deleteWebsiteActivityByActivityId(Long activityId);

    /**
     * 批量删除动态记�?
     * 
     * @param activityIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteActivityByActivityIds(Long[] activityIds);

    /**
     * 标记动态为已读
     * 
     * @param activityId 动态ID
     * @return 结果
     */
    public int markActivityAsRead(Long activityId);
}
