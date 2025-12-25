package com.smartnursinghome.system.service;

/**
 * 网站新闻阅读量统计服�? * 
 * @author ruoyi
 */
public interface WebsiteNewsViewsService
{
    /**
     * 增加新闻阅读�?     * 
     * @param newsId 新闻ID
     * @return 当前阅读�?     */
    Long incrementViews(Long newsId);
    
    /**
     * 增加新闻阅读量（带防刷限制）
     * 
     * @param newsId 新闻ID
     * @param clientIp 客户端IP地址
     * @return 当前阅读�?     */
    Long incrementViewsWithLimit(Long newsId, String clientIp);

    /**
     * 获取新闻阅读�?     * 
     * @param newsId 新闻ID
     * @return 阅读�?     */
    Long getViews(Long newsId);

    /**
     * 同步Redis阅读量到MySQL
     * 
     * @param newsId 新闻ID
     */
    void syncViewsToDatabase(Long newsId);

    /**
     * 批量同步所有新闻阅读量到MySQL
     */
    void syncAllViewsToDatabase();
}
