package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteActivity;

/**
 * 动态记录Service接口
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
public interface IWebsiteActivityService 
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
     * 批量删除动态记�?
     * 
     * @param activityIds 需要删除的动态记录主键集�?
     * @return 结果
     */
    public int deleteWebsiteActivityByActivityIds(Long[] activityIds);

    /**
     * 删除动态记录信�?
     * 
     * @param activityId 动态记录主�?
     * @return 结果
     */
    public int deleteWebsiteActivityByActivityId(Long activityId);

    /**
     * 标记动态为已读
     * 
     * @param activityId 动态ID
     * @return 结果
     */
    public int markActivityAsRead(Long activityId);

    /**
     * 创建健康报告动�?
     * 
     * @param familyId 家属ID
     * @param elderlyId 老人ID
     * @param elderlyName 老人姓名
     * @param reportId 报告ID
     * @return 结果
     */
    public int createHealthReportActivity(Long familyId, Long elderlyId, String elderlyName, Long reportId);

    /**
     * 创建费用相关动�?
     * 
     * @param familyId 家属ID
     * @param elderlyId 老人ID
     * @param elderlyName 老人姓名
     * @param feeId 费用ID
     * @param activityType 动态类�?
     * @param content 动态内�?
     * @return 结果
     */
    public int createFeeActivity(Long familyId, Long elderlyId, String elderlyName, Long feeId, String activityType, String content);

    /**
     * 创建沟通消息动�?
     * 
     * @param familyId 家属ID
     * @param elderlyId 老人ID
     * @param elderlyName 老人姓名
     * @param messageId 消息ID
     * @param content 动态内�?
     * @return 结果
     */
    public int createCommunicationActivity(Long familyId, Long elderlyId, String elderlyName, Long messageId, String content);
}
