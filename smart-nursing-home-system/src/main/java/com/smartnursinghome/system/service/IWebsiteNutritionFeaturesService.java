package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteNutritionFeatures;

/**
 * 营养膳食特色Service接口
 * 
 * @author ruoyi
 * @date 2025-01-22
 */
public interface IWebsiteNutritionFeaturesService 
{
    /**
     * 查询营养膳食特色
     * 
     * @param featureId 营养膳食特色主键
     * @return 营养膳食特色
     */
    public WebsiteNutritionFeatures selectWebsiteNutritionFeaturesByFeatureId(Long featureId);

    /**
     * 查询营养膳食特色列表
     * 
     * @param websiteNutritionFeatures 营养膳食特色
     * @return 营养膳食特色集合
     */
    public List<WebsiteNutritionFeatures> selectWebsiteNutritionFeaturesList(WebsiteNutritionFeatures websiteNutritionFeatures);

    /**
     * 新增营养膳食特色
     * 
     * @param websiteNutritionFeatures 营养膳食特色
     * @return 结果
     */
    public int insertWebsiteNutritionFeatures(WebsiteNutritionFeatures websiteNutritionFeatures);

    /**
     * 修改营养膳食特色
     * 
     * @param websiteNutritionFeatures 营养膳食特色
     * @return 结果
     */
    public int updateWebsiteNutritionFeatures(WebsiteNutritionFeatures websiteNutritionFeatures);

    /**
     * 批量删除营养膳食特色
     * 
     * @param featureIds 需要删除的营养膳食特色主键集合
     * @return 结果
     */
    public int deleteWebsiteNutritionFeaturesByFeatureIds(Long[] featureIds);

    /**
     * 删除营养膳食特色信息
     * 
     * @param featureId 营养膳食特色主键
     * @return 结果
     */
    public int deleteWebsiteNutritionFeaturesByFeatureId(Long featureId);
}




