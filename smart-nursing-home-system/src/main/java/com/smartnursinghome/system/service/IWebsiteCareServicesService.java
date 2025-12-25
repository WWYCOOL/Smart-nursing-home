package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteCareServices;

/**
 * 生活照料服务Service接口
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
public interface IWebsiteCareServicesService 
{
    /**
     * 查询生活照料服务
     * 
     * @param serviceId 生活照料服务主键
     * @return 生活照料服务
     */
    public WebsiteCareServices selectWebsiteCareServicesByServiceId(Long serviceId);

    /**
     * 查询生活照料服务列表
     * 
     * @param websiteCareServices 生活照料服务
     * @return 生活照料服务集合
     */
    public List<WebsiteCareServices> selectWebsiteCareServicesList(WebsiteCareServices websiteCareServices);

    /**
     * 新增生活照料服务
     * 
     * @param websiteCareServices 生活照料服务
     * @return 结果
     */
    public int insertWebsiteCareServices(WebsiteCareServices websiteCareServices);

    /**
     * 修改生活照料服务
     * 
     * @param websiteCareServices 生活照料服务
     * @return 结果
     */
    public int updateWebsiteCareServices(WebsiteCareServices websiteCareServices);

    /**
     * 批量删除生活照料服务
     * 
     * @param serviceIds 需要删除的生活照料服务主键集合
     * @return 结果
     */
    public int deleteWebsiteCareServicesByServiceIds(Long[] serviceIds);

    /**
     * 删除生活照料服务信息
     * 
     * @param serviceId 生活照料服务主键
     * @return 结果
     */
    public int deleteWebsiteCareServicesByServiceId(Long serviceId);
}








