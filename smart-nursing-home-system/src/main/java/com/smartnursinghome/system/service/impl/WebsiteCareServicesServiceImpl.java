package com.smartnursinghome.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteCareServicesMapper;
import com.smartnursinghome.system.domain.WebsiteCareServices;
import com.smartnursinghome.system.service.IWebsiteCareServicesService;

/**
 * 生活照料服务Service业务层处�?
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
@Service
public class WebsiteCareServicesServiceImpl implements IWebsiteCareServicesService 
{
    @Autowired
    private WebsiteCareServicesMapper websiteCareServicesMapper;

    /**
     * 查询生活照料服务
     * 
     * @param serviceId 生活照料服务主键
     * @return 生活照料服务
     */
    @Override
    public WebsiteCareServices selectWebsiteCareServicesByServiceId(Long serviceId)
    {
        return websiteCareServicesMapper.selectWebsiteCareServicesByServiceId(serviceId);
    }

    /**
     * 查询生活照料服务列表
     * 
     * @param websiteCareServices 生活照料服务
     * @return 生活照料服务
     */
    @Override
    public List<WebsiteCareServices> selectWebsiteCareServicesList(WebsiteCareServices websiteCareServices)
    {
        return websiteCareServicesMapper.selectWebsiteCareServicesList(websiteCareServices);
    }

    /**
     * 新增生活照料服务
     * 
     * @param websiteCareServices 生活照料服务
     * @return 结果
     */
    @Override
    public int insertWebsiteCareServices(WebsiteCareServices websiteCareServices)
    {
        return websiteCareServicesMapper.insertWebsiteCareServices(websiteCareServices);
    }

    /**
     * 修改生活照料服务
     * 
     * @param websiteCareServices 生活照料服务
     * @return 结果
     */
    @Override
    public int updateWebsiteCareServices(WebsiteCareServices websiteCareServices)
    {
        return websiteCareServicesMapper.updateWebsiteCareServices(websiteCareServices);
    }

    /**
     * 批量删除生活照料服务
     * 
     * @param serviceIds 需要删除的生活照料服务主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteCareServicesByServiceIds(Long[] serviceIds)
    {
        return websiteCareServicesMapper.deleteWebsiteCareServicesByServiceIds(serviceIds);
    }

    /**
     * 删除生活照料服务信息
     * 
     * @param serviceId 生活照料服务主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteCareServicesByServiceId(Long serviceId)
    {
        return websiteCareServicesMapper.deleteWebsiteCareServicesByServiceId(serviceId);
    }
}








