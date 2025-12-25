package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteFacilityOverview;

/**
 * 环境概览配置Service接口
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
public interface IWebsiteFacilityOverviewService 
{
    /**
     * 查询环境概览配置
     * 
     * @param overviewId 环境概览配置主键
     * @return 环境概览配置
     */
    public WebsiteFacilityOverview selectWebsiteFacilityOverviewByOverviewId(Long overviewId);

    /**
     * 查询环境概览配置列表
     * 
     * @param websiteFacilityOverview 环境概览配置
     * @return 环境概览配置集合
     */
    public List<WebsiteFacilityOverview> selectWebsiteFacilityOverviewList(WebsiteFacilityOverview websiteFacilityOverview);

    /**
     * 新增环境概览配置
     * 
     * @param websiteFacilityOverview 环境概览配置
     * @return 结果
     */
    public int insertWebsiteFacilityOverview(WebsiteFacilityOverview websiteFacilityOverview);

    /**
     * 修改环境概览配置
     * 
     * @param websiteFacilityOverview 环境概览配置
     * @return 结果
     */
    public int updateWebsiteFacilityOverview(WebsiteFacilityOverview websiteFacilityOverview);

    /**
     * 批量删除环境概览配置
     * 
     * @param overviewIds 需要删除的环境概览配置主键集合
     * @return 结果
     */
    public int deleteWebsiteFacilityOverviewByOverviewIds(Long[] overviewIds);

    /**
     * 删除环境概览配置信息
     * 
     * @param overviewId 环境概览配置主键
     * @return 结果
     */
    public int deleteWebsiteFacilityOverviewByOverviewId(Long overviewId);

    /**
     * 获取当前环境概览配置
     * 
     * @return 环境概览配置
     */
    public WebsiteFacilityOverview getCurrentOverview();
}











