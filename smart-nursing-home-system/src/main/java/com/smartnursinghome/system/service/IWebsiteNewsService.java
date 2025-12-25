package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteNews;

/**
 * 新闻Service接口
 * 
 * @author ruoyi
 * @date 2024-03-15
 */
public interface IWebsiteNewsService 
{
    /**
     * 查询新闻
     * 
     * @param newsId 新闻主键
     * @return 新闻
     */
    public WebsiteNews selectWebsiteNewsByNewsId(Long newsId);

    /**
     * 查询新闻列表
     * 
     * @param websiteNews 新闻
     * @return 新闻集合
     */
    public List<WebsiteNews> selectWebsiteNewsList(WebsiteNews websiteNews);

    /**
     * 新增新闻
     * 
     * @param websiteNews 新闻
     * @return 结果
     */
    public int insertWebsiteNews(WebsiteNews websiteNews);

    /**
     * 修改新闻
     * 
     * @param websiteNews 新闻
     * @return 结果
     */
    public int updateWebsiteNews(WebsiteNews websiteNews);

    /**
     * 批量删除新闻
     * 
     * @param newsIds 需要删除的新闻主键集合
     * @return 结果
     */
    public int deleteWebsiteNewsByNewsIds(Long[] newsIds);

    /**
     * 删除新闻信息
     * 
     * @param newsId 新闻主键
     * @return 结果
     */
    public int deleteWebsiteNewsByNewsId(Long newsId);

    /**
     * 查询新闻总数
     * 
     * @return 新闻总数
     */
    public int selectWebsiteNewsCount();
}

















