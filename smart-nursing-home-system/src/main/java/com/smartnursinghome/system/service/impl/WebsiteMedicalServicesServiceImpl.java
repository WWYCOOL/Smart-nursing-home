package com.smartnursinghome.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteMedicalServicesMapper;
import com.smartnursinghome.system.domain.WebsiteMedicalServices;
import com.smartnursinghome.system.service.IWebsiteMedicalServicesService;

/**
 * 医疗护理服务Service业务层处�?
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
@Service
public class WebsiteMedicalServicesServiceImpl implements IWebsiteMedicalServicesService 
{
    @Autowired
    private WebsiteMedicalServicesMapper websiteMedicalServicesMapper;

    /**
     * 查询医疗护理服务
     * 
     * @param serviceId 医疗护理服务主键
     * @return 医疗护理服务
     */
    @Override
    public WebsiteMedicalServices selectWebsiteMedicalServicesByServiceId(Long serviceId)
    {
        return websiteMedicalServicesMapper.selectWebsiteMedicalServicesByServiceId(serviceId);
    }

    /**
     * 查询医疗护理服务列表
     * 
     * @param websiteMedicalServices 医疗护理服务
     * @return 医疗护理服务
     */
    @Override
    public List<WebsiteMedicalServices> selectWebsiteMedicalServicesList(WebsiteMedicalServices websiteMedicalServices)
    {
        return websiteMedicalServicesMapper.selectWebsiteMedicalServicesList(websiteMedicalServices);
    }

    /**
     * 新增医疗护理服务
     * 
     * @param websiteMedicalServices 医疗护理服务
     * @return 结果
     */
    @Override
    public int insertWebsiteMedicalServices(WebsiteMedicalServices websiteMedicalServices)
    {
        return websiteMedicalServicesMapper.insertWebsiteMedicalServices(websiteMedicalServices);
    }

    /**
     * 修改医疗护理服务
     * 
     * @param websiteMedicalServices 医疗护理服务
     * @return 结果
     */
    @Override
    public int updateWebsiteMedicalServices(WebsiteMedicalServices websiteMedicalServices)
    {
        return websiteMedicalServicesMapper.updateWebsiteMedicalServices(websiteMedicalServices);
    }

    /**
     * 批量删除医疗护理服务
     * 
     * @param serviceIds 需要删除的医疗护理服务主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteMedicalServicesByServiceIds(Long[] serviceIds)
    {
        return websiteMedicalServicesMapper.deleteWebsiteMedicalServicesByServiceIds(serviceIds);
    }

    /**
     * 删除医疗护理服务信息
     * 
     * @param serviceId 医疗护理服务主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteMedicalServicesByServiceId(Long serviceId)
    {
        return websiteMedicalServicesMapper.deleteWebsiteMedicalServicesByServiceId(serviceId);
    }
}








