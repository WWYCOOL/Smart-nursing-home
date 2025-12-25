package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteMedicalServices;

/**
 * 医疗护理服务Service接口
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
public interface IWebsiteMedicalServicesService 
{
    /**
     * 查询医疗护理服务
     * 
     * @param serviceId 医疗护理服务主键
     * @return 医疗护理服务
     */
    public WebsiteMedicalServices selectWebsiteMedicalServicesByServiceId(Long serviceId);

    /**
     * 查询医疗护理服务列表
     * 
     * @param websiteMedicalServices 医疗护理服务
     * @return 医疗护理服务集合
     */
    public List<WebsiteMedicalServices> selectWebsiteMedicalServicesList(WebsiteMedicalServices websiteMedicalServices);

    /**
     * 新增医疗护理服务
     * 
     * @param websiteMedicalServices 医疗护理服务
     * @return 结果
     */
    public int insertWebsiteMedicalServices(WebsiteMedicalServices websiteMedicalServices);

    /**
     * 修改医疗护理服务
     * 
     * @param websiteMedicalServices 医疗护理服务
     * @return 结果
     */
    public int updateWebsiteMedicalServices(WebsiteMedicalServices websiteMedicalServices);

    /**
     * 批量删除医疗护理服务
     * 
     * @param serviceIds 需要删除的医疗护理服务主键集合
     * @return 结果
     */
    public int deleteWebsiteMedicalServicesByServiceIds(Long[] serviceIds);

    /**
     * 删除医疗护理服务信息
     * 
     * @param serviceId 医疗护理服务主键
     * @return 结果
     */
    public int deleteWebsiteMedicalServicesByServiceId(Long serviceId);
}








