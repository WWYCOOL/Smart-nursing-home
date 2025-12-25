package com.smartnursinghome.common.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * Referer过滤器
 * 
 * @author smartnursinghome
 */
@Component
public class RefererFilter implements Filter
{
    @Value("${referer.allowed-domains:}")
    private String allowedDomains;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException
    {
        // 初始化过滤器
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException
    {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String referer = req.getHeader("Referer");
        boolean allowed = true;

        // 如果没有配置允许的域名，则允许所有请求
        if (allowedDomains != null && !allowedDomains.trim().isEmpty())
        {
            List<String> allowedList = Arrays.asList(allowedDomains.split(","));
            
            // 如果没有Referer头，允许通过（可能是直接访问）
            if (referer == null || referer.trim().isEmpty())
            {
                allowed = true;
            }
            else
            {
                // 检查Referer是否在允许列表中
                allowed = allowedList.stream().anyMatch(domain -> 
                    referer.startsWith("http://" + domain) || 
                    referer.startsWith("https://" + domain));
            }
        }

        // 根据检查结果决定是否放行
        if (allowed)
        {
            chain.doFilter(request, response);
        }
        else
        {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied: Referer '" + referer + "' is not allowed");
        }
    }

    @Override
    public void destroy()
    {
        // 销毁过滤器
    }
}