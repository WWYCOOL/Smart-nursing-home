package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteCarousel;

/**
 * 轮播图Service接口
 * 
 * @author ruoyi
 * @date 2024-03-15
 */
public interface IWebsiteCarouselService 
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
     * 批量删除轮播�?
     * 
     * @param carouselIds 需要删除的轮播图主键集�?
     * @return 结果
     */
    public int deleteWebsiteCarouselByCarouselIds(Long[] carouselIds);

    /**
     * 删除轮播图信�?
     * 
     * @param carouselId 轮播图主�?
     * @return 结果
     */
    public int deleteWebsiteCarouselByCarouselId(Long carouselId);
}

















