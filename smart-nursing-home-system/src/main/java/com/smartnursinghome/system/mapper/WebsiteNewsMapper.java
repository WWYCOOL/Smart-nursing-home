package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteNews;

/**
 * 新闻Mapper接口
 * 
 * @author ruoyi
 * @date 2024-03-15
 */
public interface WebsiteNewsMapper 
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
     * 删除新闻
     * 
     * @param newsId 新闻主键
     * @return 结果
     */
    public int deleteWebsiteNewsByNewsId(Long newsId);

    /**
     * 批量删除新闻
     * 
     * @param newsIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteNewsByNewsIds(Long[] newsIds);

    /**
     * 更新新闻阅读�?
     * 
     * @param websiteNews 新闻（只包含newsId和views�?
     * @return 结果
     */
    public int updateWebsiteNewsViews(WebsiteNews websiteNews);

    /**
     * 查询新闻总数
     * 
     * @return 新闻总数
     */
    public int selectWebsiteNewsCount();
}

