package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteEntertainmentServicesMapper;
import com.smartnursinghome.system.domain.WebsiteEntertainmentServices;
import com.smartnursinghome.system.service.IWebsiteEntertainmentServicesService;

/**
 * 文娱活动服务Service业务层处�?
 * 
 * @author ruoyi
 * @date 2025-01-22
 */
@Service
public class WebsiteEntertainmentServicesServiceImpl implements IWebsiteEntertainmentServicesService 
{
    @Autowired
    private WebsiteEntertainmentServicesMapper websiteEntertainmentServicesMapper;

    /**
     * 查询文娱活动服务
     * 
     * @param activityId 文娱活动服务主键
     * @return 文娱活动服务
     */
    @Override
    public WebsiteEntertainmentServices selectWebsiteEntertainmentServicesByActivityId(Long activityId)
    {
        return websiteEntertainmentServicesMapper.selectWebsiteEntertainmentServicesByActivityId(activityId);
    }

    /**
     * 查询文娱活动服务列表
     * 
     * @param websiteEntertainmentServices 文娱活动服务
     * @return 文娱活动服务
     */
    @Override
    public List<WebsiteEntertainmentServices> selectWebsiteEntertainmentServicesList(WebsiteEntertainmentServices websiteEntertainmentServices)
    {
        return websiteEntertainmentServicesMapper.selectWebsiteEntertainmentServicesList(websiteEntertainmentServices);
    }

    /**
     * 新增文娱活动服务
     * 
     * @param websiteEntertainmentServices 文娱活动服务
     * @return 结果
     */
    @Override
    public int insertWebsiteEntertainmentServices(WebsiteEntertainmentServices websiteEntertainmentServices)
    {
        websiteEntertainmentServices.setCreateTime(DateUtils.getNowDate());
        return websiteEntertainmentServicesMapper.insertWebsiteEntertainmentServices(websiteEntertainmentServices);
    }

    /**
     * 修改文娱活动服务
     * 
     * @param websiteEntertainmentServices 文娱活动服务
     * @return 结果
     */
    @Override
    public int updateWebsiteEntertainmentServices(WebsiteEntertainmentServices websiteEntertainmentServices)
    {
        websiteEntertainmentServices.setUpdateTime(DateUtils.getNowDate());
        return websiteEntertainmentServicesMapper.updateWebsiteEntertainmentServices(websiteEntertainmentServices);
    }

    /**
     * 批量删除文娱活动服务
     * 
     * @param activityIds 需要删除的文娱活动服务主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteEntertainmentServicesByActivityIds(Long[] activityIds)
    {
        return websiteEntertainmentServicesMapper.deleteWebsiteEntertainmentServicesByActivityIds(activityIds);
    }

    /**
     * 删除文娱活动服务信息
     * 
     * @param activityId 文娱活动服务主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteEntertainmentServicesByActivityId(Long activityId)
    {
        return websiteEntertainmentServicesMapper.deleteWebsiteEntertainmentServicesByActivityId(activityId);
    }
}






