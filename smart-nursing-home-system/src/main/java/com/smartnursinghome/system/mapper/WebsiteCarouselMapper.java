package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteCarousel;

/**
 * 轮播图Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-15
 */
public interface WebsiteCarouselMapper 
{
    /**
     * 查询轮播�?
     * 
     * @param carouselId 轮播图主�?
     * @return 轮播�?
     */
    public WebsiteCarousel selectWebsiteCarouselByCarouselId(Long carouselId);

    /**
     * 查询轮播图列�?
     * 
     * @param websiteCarousel 轮播�?
     * @return 轮播图集�?
     */
    public List<WebsiteCarousel> selectWebsiteCarouselList(WebsiteCarousel websiteCarousel);

    /**
     * 新增轮播�?
     * 
     * @param websiteCarousel 轮播�?
     * @return 结果
     */
    public int insertWebsiteCarousel(WebsiteCarousel websiteCarousel);

    /**
     * 修改轮播�?
     * 
     * @param websiteCarousel 轮播�?
     * @return 结果
     */
    public int updateWebsiteCarousel(WebsiteCarousel websiteCarousel);

    /**
     * 删除轮播�?
     * 
     * @param carouselId 轮播图主�?
     * @return 结果
     */
    public int deleteWebsiteCarouselByCarouselId(Long carouselId);

    /**
     * 批量删除轮播�?
     * 
     * @param carouselIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteCarouselByCarouselIds(Long[] carouselIds);
}

















