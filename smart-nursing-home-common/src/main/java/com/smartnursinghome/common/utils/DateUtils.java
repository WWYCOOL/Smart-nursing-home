package com.smartnursinghome.common.utils;

import java.lang.management.ManagementFactory;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;

/**
 * 时间工具类
 * 
 * @author smartnursinghome
 */
public class DateUtils extends org.apache.commons.lang3.time.DateUtils
{
    public static String YYYY = "yyyy";

    public static String YYYY_MM = "yyyy-MM";

    public static String YYYY_MM_DD = "yyyy-MM-dd";

    public static String YYYYMMDDHHMMSS = "yyyyMMddHHmmss";

    public static String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";

    private static String[] parsePatterns = {
            "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy-MM",
            "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy/MM",
            "yyyy.MM.dd", "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm", "yyyy.MM"};

    /**
     * 获取当前Date型日期
     * 
     * @return Date() 当前日期
     */
    public static Date getNowDate()
    {
        return new Date();
    }

    /**
     * 获取当前日期, 默认格式为yyyy-MM-dd
     * 
     * @return String
     */
    public static String getDate()
    {
        return dateTimeNow(YYYY_MM_DD);
    }

    public static final String getTime()
    {
        return dateTimeNow(YYYY_MM_DD_HH_MM_SS);
    }

    public static final String dateTimeNow()
    {
        return dateTimeNow(YYYYMMDDHHMMSS);
    }

    public static final String dateTimeNow(final String format)
    {
        return parseDateToStr(format, new Date());
    }

    public static final String dateTime(final Date date)
    {
        return parseDateToStr(YYYY_MM_DD, date);
    }

    public static final String parseDateToStr(final String format, final Date date)
    {
        return new SimpleDateFormat(format).format(date);
    }

    public static final Date dateTime(final String format, final String ts)
    {
        try
        {
            return new SimpleDateFormat(format).parse(ts);
        }
        catch (ParseException e)
        {
            throw new RuntimeException(e);
        }
    }

    /**
     * 日期路径 年/月/日 如2018/08/08
     */
    public static final String datePath()
    {
        Date now = new Date();
        return new SimpleDateFormat("yyyy/MM/dd").format(now);
    }

    /**
     * 日期路径 年/月/日 如20180808
     */
    public static final String dateTime()
    {
        Date now = new Date();
        return new SimpleDateFormat("yyyyMMdd").format(now);
    }

    /**
     * 日期型字符串转化为日期 格式
     */
    public static Date parseDate(Object str)
    {
        if (str == null)
        {
            return null;
        }
        try
        {
            return parseDate(str.toString(), parsePatterns);
        }
        catch (ParseException e)
        {
            return null;
        }
    }

    /**
     * 获取服务器启动时间
     */
    public static Date getServerStartDate()
    {
        long time = ManagementFactory.getRuntimeMXBean().getStartTime();
        return new Date(time);
    }

    /**
     * 计算两个时间差
     */
    public static String getDatePoor(Date endDate, Date nowDate)
    {
        long nd = 1000 * 24 * 60 * 60;
        long nh = 1000 * 60 * 60;
        long nm = 1000 * 60;
        // long ns = 1000;
        // 获得两个时间的毫秒时间差异
        long diff = endDate.getTime() - nowDate.getTime();
        // 计算差多少天
        long day = diff / nd;
        // 计算差多少小时
        long hour = diff % nd / nh;
        // 计算差多少分钟
        long min = diff % nd % nh / nm;
        // 计算差多少秒//输出结果
        // long sec = diff % nd % nh % nm / ns;
        return day + "天" + hour + "小时" + min + "分钟";
    }

    /**
     * 增加 LocalDateTime ==> Date
     */
    public static Date toDate(LocalDateTime temporalAccessor)
    {
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = temporalAccessor.atZone(zoneId);
        return Date.from(zdt.toInstant());
    }

    /**
     * 增加 LocalDate ==> Date
     */
    public static Date toDate(LocalDate temporalAccessor)
    {
        ZoneId zoneId = ZoneId.systemDefault();
        LocalDateTime localDateTime = temporalAccessor.atStartOfDay();
        ZonedDateTime zdt = localDateTime.atZone(zoneId);
        return Date.from(zdt.toInstant());
    }

    /**
     * 增加 LocalTime ==> Date
     */
    public static Date toDate(LocalTime temporalAccessor)
    {
        LocalDate localDate = LocalDate.now();
        LocalDateTime localDateTime = LocalDateTime.of(localDate, temporalAccessor);
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = localDateTime.atZone(zoneId);
        return Date.from(zdt.toInstant());
    }

    /**
     * Date ==> LocalDateTime
     */
    public static LocalDateTime toLocalDateTime(Date date)
    {
        ZoneId zoneId = ZoneId.systemDefault();
        Instant instant = date.toInstant();
        return LocalDateTime.ofInstant(instant, zoneId);
    }

    /**
     * LocalDateTime ==> String
     */
    public static String toLocalDateTimeString(LocalDateTime localDateTime)
    {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(YYYY_MM_DD_HH_MM_SS);
        return localDateTime.format(formatter);
    }

    /**
     * LocalDate ==> String
     */
    public static String toLocalDateString(LocalDate localDate)
    {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(YYYY_MM_DD);
        return localDate.format(formatter);
    }

    /**
     * LocalTime ==> String
     */
    public static String toLocalTimeString(LocalTime localTime)
    {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        return localTime.format(formatter);
    }

    /**
     * 计算两个时间差
     */
    public static long between(LocalDateTime start, LocalDateTime end)
    {
        return ChronoUnit.DAYS.between(start, end);
    }

    /**
     * 计算两个时间差
     */
    public static long between(LocalDate start, LocalDate end)
    {
        return ChronoUnit.DAYS.between(start, end);
    }

    /**
     * 计算两个时间差（与getDatePoor方法功能相同，但参数顺序不同）
     */
    public static String timeDistance(Date startDate, Date endDate)
    {
        return getDatePoor(endDate, startDate);
    }

    /**
     * 计算两个日期之间的天数差（毫秒计算）
     */
    public static long differentDaysByMillisecond(Date date1, Date date2)
    {
        if (date1 == null || date2 == null) {
            return 0;
        }
        long diff = Math.abs(date1.getTime() - date2.getTime());
        return diff / (24 * 60 * 60 * 1000);
    }
}