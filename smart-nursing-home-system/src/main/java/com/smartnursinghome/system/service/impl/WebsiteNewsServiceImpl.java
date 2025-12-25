package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteNewsMapper;
import com.smartnursinghome.system.domain.WebsiteNews;
import com.smartnursinghome.system.service.IWebsiteNewsService;

/**
 * 新闻Service业务层处�?
 * 
 * @author ruoyi
 * @date 2024-03-15
 */
@Service
public class WebsiteNewsServiceImpl implements IWebsiteNewsService 
{
    @Autowired
    private WebsiteNewsMapper websiteNewsMapper;

    /**
     * 查询新闻
     * 
     * @param newsId 新闻主键
     * @return 新闻
     */
    @Override
    public WebsiteNews selectWebsiteNewsByNewsId(Long newsId)
    {
        return websiteNewsMapper.selectWebsiteNewsByNewsId(newsId);
    }

    /**
     * 查询新闻列表
     * 
     * @param websiteNews 新闻
     * @return 新闻
     */
    @Override
    public List<WebsiteNews> selectWebsiteNewsList(WebsiteNews websiteNews)
    {
        return websiteNewsMapper.selectWebsiteNewsList(websiteNews);
    }

    /**
     * 新增新闻
     * 
     * @param websiteNews 新闻
     * @return 结果
     */
    @Override
    public int insertWebsiteNews(WebsiteNews websiteNews)
    {
        websiteNews.setCreateTime(DateUtils.getNowDate());
        return websiteNewsMapper.insertWebsiteNews(websiteNews);
    }

    /**
     * 修改新闻
     * 
     * @param websiteNews 新闻
     * @return 结果
     */
    @Override
    public int updateWebsiteNews(WebsiteNews websiteNews)
    {
        websiteNews.setUpdateTime(DateUtils.getNowDate());
        return websiteNewsMapper.updateWebsiteNews(websiteNews);
    }

    /**
     * 批量删除新闻
     * 
     * @param newsIds 需要删除的新闻主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteNewsByNewsIds(Long[] newsIds)
    {
        return websiteNewsMapper.deleteWebsiteNewsByNewsIds(newsIds);
    }

    /**
     * 删除新闻信息
     * 
     * @param newsId 新闻主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteNewsByNewsId(Long newsId)
    {
        return websiteNewsMapper.deleteWebsiteNewsByNewsId(newsId);
    }

    @Override
    public int selectWebsiteNewsCount()
    {
        return websiteNewsMapper.selectWebsiteNewsCount();
    }
}

















