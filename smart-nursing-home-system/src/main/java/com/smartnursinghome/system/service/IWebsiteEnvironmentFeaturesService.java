package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteEnvironmentFeatures;

/**
 * 环境特色Service接口
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
public interface IWebsiteEnvironmentFeaturesService 
{
    /**
     * 查询环境特色
     * 
     * @param featureId 环境特色主键
     * @return 环境特色
     */
    public WebsiteEnvironmentFeatures selectWebsiteEnvironmentFeaturesByFeatureId(Long featureId);

    /**
     * 查询环境特色列表
     * 
     * @param websiteEnvironmentFeatures 环境特色
     * @return 环境特色集合
     */
    public List<WebsiteEnvironmentFeatures> selectWebsiteEnvironmentFeaturesList(WebsiteEnvironmentFeatures websiteEnvironmentFeatures);

    /**
     * 新增环境特色
     * 
     * @param websiteEnvironmentFeatures 环境特色
     * @return 结果
     */
    public int insertWebsiteEnvironmentFeatures(WebsiteEnvironmentFeatures websiteEnvironmentFeatures);

    /**
     * 修改环境特色
     * 
     * @param websiteEnvironmentFeatures 环境特色
     * @return 结果
     */
    public int updateWebsiteEnvironmentFeatures(WebsiteEnvironmentFeatures websiteEnvironmentFeatures);

    /**
     * 批量删除环境特色
     * 
     * @param featureIds 需要删除的环境特色主键集合
     * @return 结果
     */
    public int deleteWebsiteEnvironmentFeaturesByFeatureIds(Long[] featureIds);

    /**
     * 删除环境特色信息
     * 
     * @param featureId 环境特色主键
     * @return 结果
     */
    public int deleteWebsiteEnvironmentFeaturesByFeatureId(Long featureId);
}








