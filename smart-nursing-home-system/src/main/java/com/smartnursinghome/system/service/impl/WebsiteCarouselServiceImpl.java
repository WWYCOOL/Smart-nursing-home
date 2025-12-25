package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteCarouselMapper;
import com.smartnursinghome.system.domain.WebsiteCarousel;
import com.smartnursinghome.system.service.IWebsiteCarouselService;

/**
 * 轮播图Service业务层处�?
 * 
 * @author ruoyi
 * @date 2024-03-15
 */
@Service
public class WebsiteCarouselServiceImpl implements IWebsiteCarouselService 
{
    @Autowired
    private WebsiteCarouselMapper websiteCarouselMapper;

    /**
     * 查询轮播�?
     * 
     * @param carouselId 轮播图主�?
     * @return 轮播�?
     */
    @Override
    public WebsiteCarousel selectWebsiteCarouselByCarouselId(Long carouselId)
    {
        return websiteCarouselMapper.selectWebsiteCarouselByCarouselId(carouselId);
    }

    /**
     * 查询轮播图列�?
     * 
     * @param websiteCarousel 轮播�?
     * @return 轮播�?
     */
    @Override
    public List<WebsiteCarousel> selectWebsiteCarouselList(WebsiteCarousel websiteCarousel)
    {
        return websiteCarouselMapper.selectWebsiteCarouselList(websiteCarousel);
    }

    /**
     * 新增轮播�?
     * 
     * @param websiteCarousel 轮播�?
     * @return 结果
     */
    @Override
    public int insertWebsiteCarousel(WebsiteCarousel websiteCarousel)
    {
        websiteCarousel.setCreateTime(DateUtils.getNowDate());
        return websiteCarouselMapper.insertWebsiteCarousel(websiteCarousel);
    }

    /**
     * 修改轮播�?
     * 
     * @param websiteCarousel 轮播�?
     * @return 结果
     */
    @Override
    public int updateWebsiteCarousel(WebsiteCarousel websiteCarousel)
    {
        websiteCarousel.setUpdateTime(DateUtils.getNowDate());
        return websiteCarouselMapper.updateWebsiteCarousel(websiteCarousel);
    }

    /**
     * 批量删除轮播�?
     * 
     * @param carouselIds 需要删除的轮播图主�?
     * @return 结果
     */
    @Override
    public int deleteWebsiteCarouselByCarouselIds(Long[] carouselIds)
    {
        return websiteCarouselMapper.deleteWebsiteCarouselByCarouselIds(carouselIds);
    }

    /**
     * 删除轮播图信�?
     * 
     * @param carouselId 轮播图主�?
     * @return 结果
     */
    @Override
    public int deleteWebsiteCarouselByCarouselId(Long carouselId)
    {
        return websiteCarouselMapper.deleteWebsiteCarouselByCarouselId(carouselId);
    }
}

















