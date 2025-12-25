package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteEntertainmentServices;

/**
 * 文娱活动服务Service接口
 * 
 * @author ruoyi
 * @date 2025-01-22
 */
public interface IWebsiteEntertainmentServicesService 
{
    /**
     * 查询文娱活动服务
     * 
     * @param activityId 文娱活动服务主键
     * @return 文娱活动服务
     */
    public WebsiteEntertainmentServices selectWebsiteEntertainmentServicesByActivityId(Long activityId);

    /**
     * 查询文娱活动服务列表
     * 
     * @param websiteEntertainmentServices 文娱活动服务
     * @return 文娱活动服务集合
     */
    public List<WebsiteEntertainmentServices> selectWebsiteEntertainmentServicesList(WebsiteEntertainmentServices websiteEntertainmentServices);

    /**
     * 新增文娱活动服务
     * 
     * @param websiteEntertainmentServices 文娱活动服务
     * @return 结果
     */
    public int insertWebsiteEntertainmentServices(WebsiteEntertainmentServices websiteEntertainmentServices);

    /**
     * 修改文娱活动服务
     * 
     * @param websiteEntertainmentServices 文娱活动服务
     * @return 结果
     */
    public int updateWebsiteEntertainmentServices(WebsiteEntertainmentServices websiteEntertainmentServices);

    /**
     * 批量删除文娱活动服务
     * 
     * @param activityIds 需要删除的文娱活动服务主键集合
     * @return 结果
     */
    public int deleteWebsiteEntertainmentServicesByActivityIds(Long[] activityIds);

    /**
     * 删除文娱活动服务信息
     * 
     * @param activityId 文娱活动服务主键
     * @return 结果
     */
    public int deleteWebsiteEntertainmentServicesByActivityId(Long activityId);
}






