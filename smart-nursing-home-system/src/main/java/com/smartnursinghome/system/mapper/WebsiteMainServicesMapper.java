package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteMainServices;

/**
 * 主要服务项目Mapper接口
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
public interface WebsiteMainServicesMapper 
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
     * 删除主要服务项目
     * 
     * @param serviceId 主要服务项目主键
     * @return 结果
     */
    public int deleteWebsiteMainServicesByServiceId(Long serviceId);

    /**
     * 批量删除主要服务项目
     * 
     * @param serviceIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteMainServicesByServiceIds(Long[] serviceIds);
}








