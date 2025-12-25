package com.smartnursinghome.system.service.impl;

import java.util.Collection;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.smartnursinghome.common.core.redis.RedisCache;
import com.smartnursinghome.system.domain.WebsiteNews;
import com.smartnursinghome.system.mapper.WebsiteNewsMapper;
import com.smartnursinghome.system.service.WebsiteNewsViewsService;

/**
 * 网站新闻阅读量统计服务实�? * 
 * @author ruoyi
 */
@Service
public class WebsiteNewsViewsServiceImpl implements WebsiteNewsViewsService
{
    @Autowired
    private RedisCache redisCache;

    @Autowired
    private WebsiteNewsMapper websiteNewsMapper;

    /**
     * Redis key前缀
     */
    private static final String NEWS_VIEWS_KEY_PREFIX = "news:views:";
    
    /**
     * 防刷限制key前缀
     */
    private static final String VIEW_LIMIT_KEY_PREFIX = "news:view_limit:";

    /**
     * 阅读量缓存过期时间（7天）
     */
    private static final long VIEWS_CACHE_EXPIRE = 7 * 24 * 60 * 60;
    
    /**
     * 演示模式开关（true=演示模式，false=生产模式�?     */
    private static final boolean DEMO_MODE = true;
    
    /**
     * 防刷限制过期时间
     * 演示模式�?0秒，生产模式�?小时
     */
    private static final long VIEW_LIMIT_EXPIRE = DEMO_MODE ? 10 : 60 * 60;

    @Override
    public Long incrementViews(Long newsId)
    {
        if (newsId == null)
        {
            return 0L;
        }

        String key = NEWS_VIEWS_KEY_PREFIX + newsId;
        
        // 使用Redis的INCR命令原子性增加阅读量
        Long views = redisCache.increment(key);
        
        // 设置过期时间（如果key不存在）
        redisCache.expire(key, VIEWS_CACHE_EXPIRE);
        
        return views;
    }
    
    /**
     * 增加新闻阅读量（带防刷限制）
     * 
     * @param newsId 新闻ID
     * @param clientIp 客户端IP地址
     * @return 当前阅读量，如果被限制则返回-1
     */
    public Long incrementViewsWithLimit(Long newsId, String clientIp)
    {
        if (newsId == null || clientIp == null)
        {
            return 0L;
        }

        // 生成防刷限制key：IP + 新闻ID
        String limitKey = VIEW_LIMIT_KEY_PREFIX + clientIp + ":" + newsId;
        
        // 检查是否已经访问过
        if (redisCache.hasKey(limitKey))
        {
            // 已经访问过，返回当前阅读量但不增加
            Long currentViews = getViews(newsId);
            if (DEMO_MODE) {
                System.out.println("防刷机制生效！IP: " + clientIp + ", 新闻ID: " + newsId + 
                    ", 当前阅读量 " + currentViews + " (未增加)");
            }
            return currentViews;
        }
        
        // 设置防刷限制
        redisCache.setCacheObject(limitKey, "1", (int)VIEW_LIMIT_EXPIRE, TimeUnit.SECONDS);
        
        // 增加阅读量
        Long newViews = incrementViews(newsId);
        if (DEMO_MODE) {
            System.out.println("阅读量增加成功！IP: " + clientIp + ", 新闻ID: " + newsId + 
                ", 新阅读量: " + newViews + ", 限制时间: " + VIEW_LIMIT_EXPIRE + "秒");
        }
        return newViews;
    }

    @Override
    public Long getViews(Long newsId)
    {
        if (newsId == null)
        {
            return 0L;
        }

        String key = NEWS_VIEWS_KEY_PREFIX + newsId;
        Object views = redisCache.getCacheObject(key);
        
        if (views == null)
        {
            // 如果Redis中没有，从数据库获取
            WebsiteNews news = websiteNewsMapper.selectWebsiteNewsByNewsId(newsId);
            if (news != null && news.getViews() != null)
            {
                // 将数据库的阅读量同步到Redis
                redisCache.setCacheObject(key, news.getViews(), (int)VIEWS_CACHE_EXPIRE, TimeUnit.SECONDS);
                return news.getViews();
            }
            return 0L;
        }
        
        return Long.valueOf(views.toString());
    }

    @Override
    public void syncViewsToDatabase(Long newsId)
    {
        if (newsId == null)
        {
            return;
        }

        String key = NEWS_VIEWS_KEY_PREFIX + newsId;
        Object views = redisCache.getCacheObject(key);
        
        if (views != null)
        {
            Long viewsCount = Long.valueOf(views.toString());
            
            // 更新数据库中的阅读量
            WebsiteNews news = new WebsiteNews();
            news.setNewsId(newsId);
            news.setViews(viewsCount);
            websiteNewsMapper.updateWebsiteNewsViews(news);
        }
    }

    @Override
    public void syncAllViewsToDatabase()
    {
        // 获取所有新闻阅读量的Redis key
        Collection<String> keys = redisCache.keys(NEWS_VIEWS_KEY_PREFIX + "*");
        
        for (String key : keys)
        {
            // 提取新闻ID
            String newsIdStr = key.substring(NEWS_VIEWS_KEY_PREFIX.length());
            try
            {
                Long newsId = Long.valueOf(newsIdStr);
                syncViewsToDatabase(newsId);
            }
            catch (NumberFormatException e)
            {
                // 忽略无效的key
                continue;
            }
        }
    }
}



