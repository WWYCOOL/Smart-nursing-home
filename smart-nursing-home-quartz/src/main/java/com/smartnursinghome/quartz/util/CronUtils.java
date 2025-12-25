package com.smartnursinghome.quartz.util;

import java.text.ParseException;
import java.util.Date;
import org.quartz.CronExpression;

/**
 * cron表达式工具类
 * 
 * @author ruoyi
 *
 */
public class CronUtils
{
    /**
     * 返回一个布尔值代表一个给定的Cron表达式的有效�?
     *
     * @param cronExpression Cron表达�?
     * @return boolean 表达式是否有�?
     */
    public static boolean isValid(String cronExpression)
    {
        return CronExpression.isValidExpression(cronExpression);
    }

    /**
     * 返回一个字符串�?表示该消息无效Cron表达式给出有效�?
     *
     * @param cronExpression Cron表达�?
     * @return String 无效时返回表达式错误描述,如果有效返回null
     */
    public static String getInvalidMessage(String cronExpression)
    {
        try
        {
            new CronExpression(cronExpression);
            return null;
        }
        catch (ParseException pe)
        {
            return pe.getMessage();
        }
    }

    /**
     * 返回下一个执行时间根据给定的Cron表达�?
     *
     * @param cronExpression Cron表达�?
     * @return Date 下次Cron表达式执行时�?
     */
    public static Date getNextExecution(String cronExpression)
    {
        try
        {
            CronExpression cron = new CronExpression(cronExpression);
            return cron.getNextValidTimeAfter(new Date(System.currentTimeMillis()));
        }
        catch (ParseException e)
        {
            throw new IllegalArgumentException(e.getMessage());
        }
    }
}
