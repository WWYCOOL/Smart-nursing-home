package com.smartnursinghome.common.core.controller;

import java.beans.PropertyEditorSupport;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.smartnursinghome.common.constant.HttpStatus;
import com.smartnursinghome.common.core.domain.AjaxResult;
import com.smartnursinghome.common.core.page.PageDomain;
import com.smartnursinghome.common.core.page.TableDataInfo;
import com.smartnursinghome.common.core.page.TableSupport;
import com.smartnursinghome.common.utils.DateUtils;
import com.smartnursinghome.common.utils.PageUtils;
import com.smartnursinghome.common.utils.SecurityUtils;
import com.smartnursinghome.common.utils.ServletUtils;
import com.smartnursinghome.common.utils.StringUtils;
import com.smartnursinghome.common.utils.sql.SqlUtil;

/**
 * web层通用数据处理
 * 
 * @author smartnursinghome
 */
public class BaseController
{
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 将前台传递过来的日期格式的字符串，自动转化为Date类型
     */
    @InitBinder
    public void initBinder(WebDataBinder binder)
    {
        // Date 类型转换
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport()
        {
            @Override
            public void setAsText(String text)
            {
                setValue(DateUtils.parseDate(text));
            }
        });
    }

    /**
     * 设置请求分页数据
     */
    protected void startPage()
    {
        PageUtils.startPage();
    }

    /**
     * 设置请求分页数据
     */
    protected void startPage(PageDomain pageDomain)
    {
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }
    }

    /**
     * 清理分页的线程变量
     */
    protected void clearPage()
    {
        PageUtils.clearPage();
    }

    /**
     * 设置请求排序数据
     */
    protected void startOrderBy()
    {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        if (StringUtils.isNotEmpty(pageDomain.getOrderBy()))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.orderBy(orderBy);
        }
    }

    /**
     * 清理排序的线程变量
     */
    protected void clearOrderBy()
    {
        PageUtils.clearOrderBy();
    }

    /**
     * 获取request
     */
    public HttpServletRequest getRequest()
    {
        return ServletUtils.getRequest();
    }

    /**
     * 获取response
     */
    public HttpServletResponse getResponse()
    {
        return ServletUtils.getResponse();
    }

    /**
     * 获取session
     */
    public HttpSession getSession()
    {
        return getRequest().getSession();
    }

    /**
     * 获取用户缓存信息
     */
    public String getUsername()
    {
        return SecurityUtils.getUsername();
    }

    /**
     * 获取用户缓存信息
     */
    public Long getUserId()
    {
        return SecurityUtils.getUserId();
    }

    /**
     * 获取登录用户信息
     */
    public String getLoginUser()
    {
        return SecurityUtils.getLoginUser().getUsername();
    }

    /**
     * 响应返回结果
     * 
     * @param rows 影响行数
     * @return 操作结果
     */
    protected AjaxResult toAjax(int rows)
    {
        return rows > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 响应返回结果
     * 
     * @param result 结果
     * @return 操作结果
     */
    protected AjaxResult toAjax(boolean result)
    {
        return result ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 页面跳转
     */
    public String redirect(String url)
    {
        return StringUtils.format("redirect:{}", url);
    }

    /**
     * 响应返回结果
     * 
     * @param rows 影响行数
     * @param msg 返回内容
     * @return 操作结果
     */
    protected AjaxResult toAjax(int rows, String msg)
    {
        return rows > 0 ? AjaxResult.success(msg) : AjaxResult.error(msg);
    }

    /**
     * 返回成功数据
     */
    public static AjaxResult success()
    {
        return AjaxResult.success();
    }

    /**
     * 返回失败消息
     */
    public static AjaxResult error()
    {
        return AjaxResult.error();
    }

    /**
     * 返回成功消息
     */
    public static AjaxResult success(String message)
    {
        return AjaxResult.success(message);
    }

    /**
     * 返回成功数据
     */
    public AjaxResult success(Object data)
    {
        return AjaxResult.success(data);
    }

    /**
     * 返回失败消息
     */
    public static AjaxResult error(String message)
    {
        return AjaxResult.error(message);
    }

    /**
     * 返回错误码消息
     */
    public static AjaxResult error(int httpStatus, String message)
    {
        return AjaxResult.error(httpStatus, message);
    }

    /**
     * 页面跳转
     */
    public String redirect(String url, Object... args)
    {
        return StringUtils.format("redirect:{}", StringUtils.format(url, args));
    }

    /**
     * 设置分页数据
     */
    protected void setDataTable(List<?> list, TableDataInfo rspData)
    {
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
    }

    /**
     * 设置分页数据
     */
    protected void setDataTable(PageInfo<?> pageInfo, TableDataInfo rspData)
    {
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        rspData.setRows(pageInfo.getList());
        rspData.setTotal(pageInfo.getTotal());
    }

    /**
     * 设置分页数据
     */
    protected void setDataTable(List<?> list, long total, TableDataInfo rspData)
    {
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        rspData.setRows(list);
        rspData.setTotal(total);
    }

    /**
     * 返回表格数据
     */
    protected TableDataInfo getDataTable(List<?> list)
    {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }
}
