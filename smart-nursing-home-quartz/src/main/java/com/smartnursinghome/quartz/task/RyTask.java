package com.smartnursinghome.quartz.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.smartnursinghome.common.utils.StringUtils;
import com.smartnursinghome.system.service.WebsiteNewsViewsService;

/**
 * 定时任务调度测试
 * 
 * @author ruoyi
 */
@Component("ryTask")
public class RyTask
{
    @Autowired
    private WebsiteNewsViewsService websiteNewsViewsService;

    public void ryMultipleParams(String s, Boolean b, Long l, Double d, Integer i)
    {
        System.out.println(StringUtils.format("执行多参方法：字符串类型{}，布尔类型{}，长整型{}，浮点型{}，整形{}", s, b, l, d, i));
    }

    public void ryParams(String params)
    {
        System.out.println("执行有参方法：" + params);
    }

    public void ryNoParams()
    {
        System.out.println("执行无参方法");
    }

    /**
     * 同步新闻阅读量到数据库
     */
    public void syncNewsViews()
    {
        try
        {
            websiteNewsViewsService.syncAllViewsToDatabase();
            System.out.println("新闻阅读量同步任务执行成功");
        }
        catch (Exception e)
        {
            System.err.println("新闻阅读量同步任务执行失败：" + e.getMessage());
        }
    }
}