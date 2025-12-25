package com.smartnursinghome.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteMainServicesMapper;
import com.smartnursinghome.system.domain.WebsiteMainServices;
import com.smartnursinghome.system.service.IWebsiteMainServicesService;

/**
 * 主要服务项目Service业务层处�?
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
@Service
public class WebsiteMainServicesServiceImpl implements IWebsiteMainServicesService 
{
    @Autowired
    private WebsiteMainServicesMapper websiteMainServicesMapper;

    /**
     * 查询主要服务项目
     * 
     * @param serviceId 主要服务项目主键
     * @return 主要服务项目
     */
    @Override
    public WebsiteMainServices selectWebsiteMainServicesByServiceId(Long serviceId)
    {
        return websiteMainServicesMapper.selectWebsiteMainServicesByServiceId(serviceId);
    }

    /**
     * 查询主要服务项目列表
     * 
     * @param websiteMainServices 主要服务项目
     * @return 主要服务项目
     */
    @Override
    public List<WebsiteMainServices> selectWebsiteMainServicesList(WebsiteMainServices websiteMainServices)
    {
        return websiteMainServicesMapper.selectWebsiteMainServicesList(websiteMainServices);
    }

    /**
     * 新增主要服务项目
     * 
     * @param websiteMainServices 主要服务项目
     * @return 结果
     */
    @Override
    public int insertWebsiteMainServices(WebsiteMainServices websiteMainServices)
    {
        return websiteMainServicesMapper.insertWebsiteMainServices(websiteMainServices);
    }

    /**
     * 修改主要服务项目
     * 
     * @param websiteMainServices 主要服务项目
     * @return 结果
     */
    @Override
    public int updateWebsiteMainServices(WebsiteMainServices websiteMainServices)
    {
        return websiteMainServicesMapper.updateWebsiteMainServices(websiteMainServices);
    }

    /**
     * 批量删除主要服务项目
     * 
     * @param serviceIds 需要删除的主要服务项目主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteMainServicesByServiceIds(Long[] serviceIds)
    {
        return websiteMainServicesMapper.deleteWebsiteMainServicesByServiceIds(serviceIds);
    }

    /**
     * 删除主要服务项目信息
     * 
     * @param serviceId 主要服务项目主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteMainServicesByServiceId(Long serviceId)
    {
        return websiteMainServicesMapper.deleteWebsiteMainServicesByServiceId(serviceId);
    }
}








