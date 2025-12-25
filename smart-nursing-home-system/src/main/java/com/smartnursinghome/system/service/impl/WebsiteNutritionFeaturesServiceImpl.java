package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteNutritionFeaturesMapper;
import com.smartnursinghome.system.domain.WebsiteNutritionFeatures;
import com.smartnursinghome.system.service.IWebsiteNutritionFeaturesService;

/**
 * 营养膳食特色Service业务层处�?
 * 
 * @author ruoyi
 * @date 2025-01-22
 */
@Service
public class WebsiteNutritionFeaturesServiceImpl implements IWebsiteNutritionFeaturesService 
{
    @Autowired
    private WebsiteNutritionFeaturesMapper websiteNutritionFeaturesMapper;

    /**
     * 查询营养膳食特色
     * 
     * @param featureId 营养膳食特色主键
     * @return 营养膳食特色
     */
    @Override
    public WebsiteNutritionFeatures selectWebsiteNutritionFeaturesByFeatureId(Long featureId)
    {
        return websiteNutritionFeaturesMapper.selectWebsiteNutritionFeaturesByFeatureId(featureId);
    }

    /**
     * 查询营养膳食特色列表
     * 
     * @param websiteNutritionFeatures 营养膳食特色
     * @return 营养膳食特色
     */
    @Override
    public List<WebsiteNutritionFeatures> selectWebsiteNutritionFeaturesList(WebsiteNutritionFeatures websiteNutritionFeatures)
    {
        return websiteNutritionFeaturesMapper.selectWebsiteNutritionFeaturesList(websiteNutritionFeatures);
    }

    /**
     * 新增营养膳食特色
     * 
     * @param websiteNutritionFeatures 营养膳食特色
     * @return 结果
     */
    @Override
    public int insertWebsiteNutritionFeatures(WebsiteNutritionFeatures websiteNutritionFeatures)
    {
        websiteNutritionFeatures.setCreateTime(DateUtils.getNowDate());
        return websiteNutritionFeaturesMapper.insertWebsiteNutritionFeatures(websiteNutritionFeatures);
    }

    /**
     * 修改营养膳食特色
     * 
     * @param websiteNutritionFeatures 营养膳食特色
     * @return 结果
     */
    @Override
    public int updateWebsiteNutritionFeatures(WebsiteNutritionFeatures websiteNutritionFeatures)
    {
        websiteNutritionFeatures.setUpdateTime(DateUtils.getNowDate());
        return websiteNutritionFeaturesMapper.updateWebsiteNutritionFeatures(websiteNutritionFeatures);
    }

    /**
     * 批量删除营养膳食特色
     * 
     * @param featureIds 需要删除的营养膳食特色主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteNutritionFeaturesByFeatureIds(Long[] featureIds)
    {
        return websiteNutritionFeaturesMapper.deleteWebsiteNutritionFeaturesByFeatureIds(featureIds);
    }

    /**
     * 删除营养膳食特色信息
     * 
     * @param featureId 营养膳食特色主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteNutritionFeaturesByFeatureId(Long featureId)
    {
        return websiteNutritionFeaturesMapper.deleteWebsiteNutritionFeaturesByFeatureId(featureId);
    }
}




