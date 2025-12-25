package com.smartnursinghome.system.service.impl;

import java.util.List;
import java.util.Date;
import com.smartnursinghome.common.utils.DateUtils;
import com.smartnursinghome.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteActivityMapper;
import com.smartnursinghome.system.domain.WebsiteActivity;
import com.smartnursinghome.system.service.IWebsiteActivityService;

/**
 * 动态记录Service业务层处�?
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
@Service
public class WebsiteActivityServiceImpl implements IWebsiteActivityService 
{
    @Autowired
    private WebsiteActivityMapper websiteActivityMapper;

    /**
     * 查询动态记�?
     * 
     * @param activityId 动态记录主�?
     * @return 动态记�?
     */
    @Override
    public WebsiteActivity selectWebsiteActivityByActivityId(Long activityId)
    {
        return websiteActivityMapper.selectWebsiteActivityByActivityId(activityId);
    }

    /**
     * 查询动态记录列�?
     * 
     * @param websiteActivity 动态记�?
     * @return 动态记�?
     */
    @Override
    public List<WebsiteActivity> selectWebsiteActivityList(WebsiteActivity websiteActivity)
    {
        return websiteActivityMapper.selectWebsiteActivityList(websiteActivity);
    }

    /**
     * 查询家属最新动�?
     * 
     * @param familyId 家属ID
     * @return 动态记�?
     */
    @Override
    public List<WebsiteActivity> selectFamilyRecentActivities(Long familyId)
    {
        return websiteActivityMapper.selectFamilyRecentActivities(familyId);
    }

    /**
     * 新增动态记�?
     * 
     * @param websiteActivity 动态记�?
     * @return 结果
     */
    @Override
    public int insertWebsiteActivity(WebsiteActivity websiteActivity)
    {
        websiteActivity.setCreateTime(DateUtils.getNowDate());
        return websiteActivityMapper.insertWebsiteActivity(websiteActivity);
    }

    /**
     * 修改动态记�?
     * 
     * @param websiteActivity 动态记�?
     * @return 结果
     */
    @Override
    public int updateWebsiteActivity(WebsiteActivity websiteActivity)
    {
        websiteActivity.setUpdateTime(DateUtils.getNowDate());
        return websiteActivityMapper.updateWebsiteActivity(websiteActivity);
    }

    /**
     * 批量删除动态记�?
     * 
     * @param activityIds 需要删除的动态记录主�?
     * @return 结果
     */
    @Override
    public int deleteWebsiteActivityByActivityIds(Long[] activityIds)
    {
        return websiteActivityMapper.deleteWebsiteActivityByActivityIds(activityIds);
    }

    /**
     * 删除动态记录信�?
     * 
     * @param activityId 动态记录主�?
     * @return 结果
     */
    @Override
    public int deleteWebsiteActivityByActivityId(Long activityId)
    {
        return websiteActivityMapper.deleteWebsiteActivityByActivityId(activityId);
    }

    /**
     * 标记动态为已读
     * 
     * @param activityId 动态ID
     * @return 结果
     */
    @Override
    public int markActivityAsRead(Long activityId)
    {
        return websiteActivityMapper.markActivityAsRead(activityId);
    }

    /**
     * 创建健康报告动�?
     */
    @Override
    public int createHealthReportActivity(Long familyId, Long elderlyId, String elderlyName, Long reportId)
    {
        WebsiteActivity activity = new WebsiteActivity();
        activity.setFamilyId(familyId);
        activity.setElderlyId(elderlyId);
        activity.setElderlyName(elderlyName);
        activity.setActivityType("health");
        activity.setActivityTitle("健康报告更新");
        activity.setActivityContent(elderlyName + "的健康报告已更新");
        activity.setActivityTime(new Date());
        activity.setRelatedId(reportId);
        activity.setRelatedType("health_report");
        activity.setIsRead("0");
        activity.setStatus("0");
        activity.setCreateBy("system");
        return insertWebsiteActivity(activity);
    }

    /**
     * 创建费用相关动�?
     */
    @Override
    public int createFeeActivity(Long familyId, Long elderlyId, String elderlyName, Long feeId, String activityType, String content)
    {
        WebsiteActivity activity = new WebsiteActivity();
        activity.setFamilyId(familyId);
        activity.setElderlyId(elderlyId);
        activity.setElderlyName(elderlyName);
        activity.setActivityType("fee");
        activity.setActivityTitle("费用相关");
        activity.setActivityContent(content);
        activity.setActivityTime(new Date());
        activity.setRelatedId(feeId);
        activity.setRelatedType("fee_detail");
        activity.setIsRead("0");
        activity.setStatus("0");
        activity.setCreateBy("system");
        return insertWebsiteActivity(activity);
    }

    /**
     * 创建沟通消息动�?
     */
    @Override
    public int createCommunicationActivity(Long familyId, Long elderlyId, String elderlyName, Long messageId, String content)
    {
        WebsiteActivity activity = new WebsiteActivity();
        activity.setFamilyId(familyId);
        activity.setElderlyId(elderlyId);
        activity.setElderlyName(elderlyName);
        activity.setActivityType("communication");
        activity.setActivityTitle("沟通消息");
        activity.setActivityContent(content);
        activity.setActivityTime(new Date());
        activity.setRelatedId(messageId);
        activity.setRelatedType("communication");
        activity.setIsRead("0");
        activity.setStatus("0");
        activity.setCreateBy("system");
        return insertWebsiteActivity(activity);
    }
}
