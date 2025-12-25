package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteEnvironmentFeaturesMapper;
import com.smartnursinghome.system.domain.WebsiteEnvironmentFeatures;
import com.smartnursinghome.system.service.IWebsiteEnvironmentFeaturesService;

/**
 * 环境特色Service业务层处�?
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
@Service
public class WebsiteEnvironmentFeaturesServiceImpl implements IWebsiteEnvironmentFeaturesService 
{
    @Autowired
    private WebsiteEnvironmentFeaturesMapper websiteEnvironmentFeaturesMapper;

    /**
     * 查询环境特色
     * 
     * @param featureId 环境特色主键
     * @return 环境特色
     */
    @Override
    public WebsiteEnvironmentFeatures selectWebsiteEnvironmentFeaturesByFeatureId(Long featureId)
    {
        return websiteEnvironmentFeaturesMapper.selectWebsiteEnvironmentFeaturesByFeatureId(featureId);
    }

    /**
     * 查询环境特色列表
     * 
     * @param websiteEnvironmentFeatures 环境特色
     * @return 环境特色
     */
    @Override
    public List<WebsiteEnvironmentFeatures> selectWebsiteEnvironmentFeaturesList(WebsiteEnvironmentFeatures websiteEnvironmentFeatures)
    {
        return websiteEnvironmentFeaturesMapper.selectWebsiteEnvironmentFeaturesList(websiteEnvironmentFeatures);
    }

    /**
     * 新增环境特色
     * 
     * @param websiteEnvironmentFeatures 环境特色
     * @return 结果
     */
    @Override
    public int insertWebsiteEnvironmentFeatures(WebsiteEnvironmentFeatures websiteEnvironmentFeatures)
    {
        websiteEnvironmentFeatures.setCreateTime(DateUtils.getNowDate());
        return websiteEnvironmentFeaturesMapper.insertWebsiteEnvironmentFeatures(websiteEnvironmentFeatures);
    }

    /**
     * 修改环境特色
     * 
     * @param websiteEnvironmentFeatures 环境特色
     * @return 结果
     */
    @Override
    public int updateWebsiteEnvironmentFeatures(WebsiteEnvironmentFeatures websiteEnvironmentFeatures)
    {
        websiteEnvironmentFeatures.setUpdateTime(DateUtils.getNowDate());
        return websiteEnvironmentFeaturesMapper.updateWebsiteEnvironmentFeatures(websiteEnvironmentFeatures);
    }

    /**
     * 批量删除环境特色
     * 
     * @param featureIds 需要删除的环境特色主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteEnvironmentFeaturesByFeatureIds(Long[] featureIds)
    {
        return websiteEnvironmentFeaturesMapper.deleteWebsiteEnvironmentFeaturesByFeatureIds(featureIds);
    }

    /**
     * 删除环境特色信息
     * 
     * @param featureId 环境特色主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteEnvironmentFeaturesByFeatureId(Long featureId)
    {
        return websiteEnvironmentFeaturesMapper.deleteWebsiteEnvironmentFeaturesByFeatureId(featureId);
    }
}








