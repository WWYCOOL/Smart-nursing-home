package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteFacilityImages;

/**
 * 设施图片Mapper接口
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
public interface WebsiteFacilityImagesMapper 
{
    /**
     * 查询设施图片
     * 
     * @param imageId 设施图片主键
     * @return 设施图片
     */
    public WebsiteFacilityImages selectWebsiteFacilityImagesByImageId(Long imageId);

    /**
     * 查询设施图片列表
     * 
     * @param websiteFacilityImages 设施图片
     * @return 设施图片集合
     */
    public List<WebsiteFacilityImages> selectWebsiteFacilityImagesList(WebsiteFacilityImages websiteFacilityImages);

    /**
     * 根据设施ID查询图片列表
     * 
     * @param facilityId 设施ID
     * @return 图片列表
     */
    public List<WebsiteFacilityImages> selectWebsiteFacilityImagesByFacilityId(Long facilityId);

    /**
     * 新增设施图片
     * 
     * @param websiteFacilityImages 设施图片
     * @return 结果
     */
    public int insertWebsiteFacilityImages(WebsiteFacilityImages websiteFacilityImages);

    /**
     * 修改设施图片
     * 
     * @param websiteFacilityImages 设施图片
     * @return 结果
     */
    public int updateWebsiteFacilityImages(WebsiteFacilityImages websiteFacilityImages);

    /**
     * 删除设施图片
     * 
     * @param imageId 设施图片主键
     * @return 结果
     */
    public int deleteWebsiteFacilityImagesByImageId(Long imageId);

    /**
     * 批量删除设施图片
     * 
     * @param imageIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteFacilityImagesByImageIds(Long[] imageIds);

    /**
     * 根据设施ID删除图片
     * 
     * @param facilityId 设施ID
     * @return 结果
     */
    public int deleteWebsiteFacilityImagesByFacilityId(Long facilityId);
}











