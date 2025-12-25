package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteMainServices;

/**
 * 主要服务项目Service接口
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
public interface IWebsiteMainServicesService 
{
    /**
     * 查询主要服务项目
     * 
     * @param serviceId 主要服务项目主键
     * @return 主要服务项目
     */
    public WebsiteMainServices selectWebsiteMainServicesByServiceId(Long serviceId);

    /**
     * 查询主要服务项目列表
     * 
     * @param websiteMainServices 主要服务项目
     * @return 主要服务项目集合
     */
    public List<WebsiteMainServices> selectWebsiteMainServicesList(WebsiteMainServices websiteMainServices);

    /**
     * 新增主要服务项目
     * 
     * @param websiteMainServices 主要服务项目
     * @return 结果
     */
    public int insertWebsiteMainServices(WebsiteMainServices websiteMainServices);

    /**
     * 修改主要服务项目
     * 
     * @param websiteMainServices 主要服务项目
     * @return 结果
     */
    public int updateWebsiteMainServices(WebsiteMainServices websiteMainServices);

    /**
     * 批量删除主要服务项目
     * 
     * @param serviceIds 需要删除的主要服务项目主键集合
     * @return 结果
     */
    public int deleteWebsiteMainServicesByServiceIds(Long[] serviceIds);

    /**
     * 删除主要服务项目信息
     * 
     * @param serviceId 主要服务项目主键
     * @return 结果
     */
    public int deleteWebsiteMainServicesByServiceId(Long serviceId);
}








