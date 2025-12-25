package com.smartnursinghome.web.controller.website;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletRequest;
import com.smartnursinghome.common.annotation.Anonymous;
import com.smartnursinghome.common.annotation.Log;
import com.smartnursinghome.common.core.controller.BaseController;
import com.smartnursinghome.common.core.domain.AjaxResult;
import com.smartnursinghome.common.enums.BusinessType;
import com.smartnursinghome.system.domain.WebsiteNews;
import com.smartnursinghome.system.service.IWebsiteNewsService;
import com.smartnursinghome.system.service.WebsiteNewsViewsService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 新闻Controller
 * 
 * @author ruoyi
 * @date 2024-03-15
 */
@RestController
@RequestMapping("/website/news")
public class WebsiteNewsController extends BaseController
{
    @Autowired
    private IWebsiteNewsService websiteNewsService;

    @Autowired
    private WebsiteNewsViewsService websiteNewsViewsService;

    /**
     * 查询新闻列表
     */
    @PreAuthorize("@ss.hasPermi('website:news:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteNews websiteNews)
    {
        startPage();
        List<WebsiteNews> list = websiteNewsService.selectWebsiteNewsList(websiteNews);
        return getDataTable(list);
    }

    /**
     * 公开查询新闻列表（无需权限）
     */
    @Anonymous
    @GetMapping("/public/list")
    public TableDataInfo publicList(WebsiteNews websiteNews)
    {
        // 只查询状态为正常的新闻
        websiteNews.setStatus("0");
        startPage();
        List<WebsiteNews> list = websiteNewsService.selectWebsiteNewsList(websiteNews);
        return getDataTable(list);
    }

    /**
     * 导出新闻列表
     */
    @PreAuthorize("@ss.hasPermi('website:news:export')")
    @Log(title = "新闻", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteNews websiteNews)
    {
        List<WebsiteNews> list = websiteNewsService.selectWebsiteNewsList(websiteNews);
        ExcelUtil<WebsiteNews> util = new ExcelUtil<WebsiteNews>(WebsiteNews.class);
        util.exportExcel(response, list, "新闻数据");
    }

    /**
     * 获取新闻详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:news:query')")
    @GetMapping(value = "/{newsId}")
    public AjaxResult getInfo(@PathVariable("newsId") Long newsId)
    {
        return success(websiteNewsService.selectWebsiteNewsByNewsId(newsId));
    }

    /**
     * 新增新闻
     */
    @PreAuthorize("@ss.hasPermi('website:news:add')")
    @Log(title = "新闻", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteNews websiteNews)
    {
        return toAjax(websiteNewsService.insertWebsiteNews(websiteNews));
    }

    /**
     * 修改新闻
     */
    @PreAuthorize("@ss.hasPermi('website:news:edit')")
    @Log(title = "新闻", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteNews websiteNews)
    {
        return toAjax(websiteNewsService.updateWebsiteNews(websiteNews));
    }

    /**
     * 删除新闻
     */
    @PreAuthorize("@ss.hasPermi('website:news:remove')")
    @Log(title = "新闻", businessType = BusinessType.DELETE)
	@DeleteMapping("/{newsIds}")
    public AjaxResult remove(@PathVariable Long[] newsIds)
    {
        return toAjax(websiteNewsService.deleteWebsiteNewsByNewsIds(newsIds));
    }

    /**
     * 增加新闻阅读量（公开接口，无需权限，带防刷限制）
     */
    @Anonymous
    @PostMapping("/views/{newsId}")
    public AjaxResult incrementViews(@PathVariable("newsId") Long newsId, HttpServletRequest request)
    {
        String clientIp = getClientIpAddress(request);
        Long views = websiteNewsViewsService.incrementViewsWithLimit(newsId, clientIp);
        return AjaxResult.success("阅读量增加成功", views);
    }
    
    /**
     * 获取客户端真实IP地址
     */
    private String getClientIpAddress(HttpServletRequest request) {
        String xForwardedFor = request.getHeader("X-Forwarded-For");
        if (xForwardedFor != null && !xForwardedFor.isEmpty() && !"unknown".equalsIgnoreCase(xForwardedFor)) {
            // 多次反向代理后会有多个IP值，第一个为真实IP
            return xForwardedFor.split(",")[0].trim();
        }
        
        String xRealIp = request.getHeader("X-Real-IP");
        if (xRealIp != null && !xRealIp.isEmpty() && !"unknown".equalsIgnoreCase(xRealIp)) {
            return xRealIp;
        }
        
        String proxyClientIp = request.getHeader("Proxy-Client-IP");
        if (proxyClientIp != null && !proxyClientIp.isEmpty() && !"unknown".equalsIgnoreCase(proxyClientIp)) {
            return proxyClientIp;
        }
        
        String wlProxyClientIp = request.getHeader("WL-Proxy-Client-IP");
        if (wlProxyClientIp != null && !wlProxyClientIp.isEmpty() && !"unknown".equalsIgnoreCase(wlProxyClientIp)) {
            return wlProxyClientIp;
        }
        
        String httpClientIp = request.getHeader("HTTP_CLIENT_IP");
        if (httpClientIp != null && !httpClientIp.isEmpty() && !"unknown".equalsIgnoreCase(httpClientIp)) {
            return httpClientIp;
        }
        
        String httpXForwardedFor = request.getHeader("HTTP_X_FORWARDED_FOR");
        if (httpXForwardedFor != null && !httpXForwardedFor.isEmpty() && !"unknown".equalsIgnoreCase(httpXForwardedFor)) {
            return httpXForwardedFor;
        }
        
        // 最后获取远程地址
        return request.getRemoteAddr();
    }

    /**
     * 获取新闻阅读量（公开接口，无需权限）
     */
    @Anonymous
    @GetMapping("/views/{newsId}")
    public AjaxResult getViews(@PathVariable("newsId") Long newsId)
    {
        Long views = websiteNewsViewsService.getViews(newsId);
        return success(views);
    }
}