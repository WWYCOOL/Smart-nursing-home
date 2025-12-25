package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteFacilitiesMapper;
import com.smartnursinghome.system.mapper.WebsiteFacilityImagesMapper;
import com.smartnursinghome.system.domain.WebsiteFacilities;
import com.smartnursinghome.system.domain.WebsiteFacilityImages;
import com.smartnursinghome.system.service.IWebsiteFacilitiesService;

/**
 * 设施管理Service业务层处�?
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
@Service
public class WebsiteFacilitiesServiceImpl implements IWebsiteFacilitiesService 
{
    @Autowired
    private WebsiteFacilitiesMapper websiteFacilitiesMapper;

    @Autowired
    private WebsiteFacilityImagesMapper websiteFacilityImagesMapper;

    /**
     * 查询设施管理
     * 
     * @param facilityId 设施管理主键
     * @return 设施管理
     */
    @Override
    public WebsiteFacilities selectWebsiteFacilitiesByFacilityId(Long facilityId)
    {
        WebsiteFacilities facilities = websiteFacilitiesMapper.selectWebsiteFacilitiesByFacilityId(facilityId);
        if (facilities != null) {
            // 查询设施图片
            List<WebsiteFacilityImages> images = websiteFacilityImagesMapper.selectWebsiteFacilityImagesByFacilityId(facilityId);
            facilities.setFacilityImages(images);
        }
        return facilities;
    }

    /**
     * 查询设施管理列表
     * 
     * @param websiteFacilities 设施管理
     * @return 设施管理
     */
    @Override
    public List<WebsiteFacilities> selectWebsiteFacilitiesList(WebsiteFacilities websiteFacilities)
    {
        return websiteFacilitiesMapper.selectWebsiteFacilitiesList(websiteFacilities);
    }

    /**
     * 新增设施管理
     * 
     * @param websiteFacilities 设施管理
     * @return 结果
     */
    @Override
    public int insertWebsiteFacilities(WebsiteFacilities websiteFacilities)
    {
        websiteFacilities.setCreateTime(DateUtils.getNowDate());
        int result = websiteFacilitiesMapper.insertWebsiteFacilities(websiteFacilities);
        
        // 插入设施图片
        if (result > 0 && websiteFacilities.getFacilityImages() != null && !websiteFacilities.getFacilityImages().isEmpty()) {
            insertWebsiteFacilityImages(websiteFacilities);
        }
        
        return result;
    }

    /**
     * 修改设施管理
     * 
     * @param websiteFacilities 设施管理
     * @return 结果
     */
    @Override
    public int updateWebsiteFacilities(WebsiteFacilities websiteFacilities)
    {
        websiteFacilities.setUpdateTime(DateUtils.getNowDate());
        
        // 删除原有图片
        websiteFacilityImagesMapper.deleteWebsiteFacilityImagesByFacilityId(websiteFacilities.getFacilityId());
        
        // 插入新图�?
        if (websiteFacilities.getFacilityImages() != null && !websiteFacilities.getFacilityImages().isEmpty()) {
            insertWebsiteFacilityImages(websiteFacilities);
        }
        
        return websiteFacilitiesMapper.updateWebsiteFacilities(websiteFacilities);
    }

    /**
     * 批量删除设施管理
     * 
     * @param facilityIds 需要删除的设施管理主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFacilitiesByFacilityIds(Long[] facilityIds)
    {
        // 删除设施图片
        for (Long facilityId : facilityIds) {
            websiteFacilityImagesMapper.deleteWebsiteFacilityImagesByFacilityId(facilityId);
        }
        
        return websiteFacilitiesMapper.deleteWebsiteFacilitiesByFacilityIds(facilityIds);
    }

    /**
     * 删除设施管理信息
     * 
     * @param facilityId 设施管理主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFacilitiesByFacilityId(Long facilityId)
    {
        // 删除设施图片
        websiteFacilityImagesMapper.deleteWebsiteFacilityImagesByFacilityId(facilityId);
        
        return websiteFacilitiesMapper.deleteWebsiteFacilitiesByFacilityId(facilityId);
    }

    /**
     * 根据设施类型查询设施列表
     * 
     * @param facilityType 设施类型
     * @return 设施列表
     */
    @Override
    public List<WebsiteFacilities> selectWebsiteFacilitiesByType(String facilityType)
    {
        return websiteFacilitiesMapper.selectWebsiteFacilitiesByType(facilityType);
    }

    /**
     * 插入设施图片
     * 
     * @param websiteFacilities 设施管理
     */
    private void insertWebsiteFacilityImages(WebsiteFacilities websiteFacilities)
    {
        List<WebsiteFacilityImages> images = websiteFacilities.getFacilityImages();
        for (WebsiteFacilityImages image : images) {
            image.setFacilityId(websiteFacilities.getFacilityId());
            image.setCreateTime(DateUtils.getNowDate());
            websiteFacilityImagesMapper.insertWebsiteFacilityImages(image);
        }
    }
}











