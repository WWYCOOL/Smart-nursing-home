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
import com.smartnursinghome.common.annotation.Log;
import com.smartnursinghome.common.core.controller.BaseController;
import com.smartnursinghome.common.core.domain.AjaxResult;
import com.smartnursinghome.common.enums.BusinessType;
import com.smartnursinghome.system.domain.WebsiteEntertainmentServices;
import com.smartnursinghome.system.service.IWebsiteEntertainmentServicesService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;
import com.smartnursinghome.common.annotation.Anonymous;

/**
 * 文娱活动服务Controller
 * 
 * @author ruoyi
 * @date 2025-01-22
 */
@RestController
@RequestMapping("/website/entertainment-services")
public class WebsiteEntertainmentServicesController extends BaseController
{
    @Autowired
    private IWebsiteEntertainmentServicesService websiteEntertainmentServicesService;

    /**
     * 查询文娱活动服务列表
     */
    @PreAuthorize("@ss.hasPermi('website:entertainment:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteEntertainmentServices websiteEntertainmentServices)
    {
        startPage();
        List<WebsiteEntertainmentServices> list = websiteEntertainmentServicesService.selectWebsiteEntertainmentServicesList(websiteEntertainmentServices);
        return getDataTable(list);
    }

    /**
     * 导出文娱活动服务列表
     */
    @PreAuthorize("@ss.hasPermi('website:entertainment:export')")
    @Log(title = "文娱活动服务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteEntertainmentServices websiteEntertainmentServices)
    {
        List<WebsiteEntertainmentServices> list = websiteEntertainmentServicesService.selectWebsiteEntertainmentServicesList(websiteEntertainmentServices);
        ExcelUtil<WebsiteEntertainmentServices> util = new ExcelUtil<WebsiteEntertainmentServices>(WebsiteEntertainmentServices.class);
        util.exportExcel(response, list, "文娱活动服务数据");
    }

    /**
     * 获取文娱活动服务详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:entertainment:query')")
    @GetMapping(value = "/{activityId}")
    public AjaxResult getInfo(@PathVariable("activityId") Long activityId)
    {
        return success(websiteEntertainmentServicesService.selectWebsiteEntertainmentServicesByActivityId(activityId));
    }

    /**
     * 新增文娱活动服务
     */
    @PreAuthorize("@ss.hasPermi('website:entertainment:add')")
    @Log(title = "文娱活动服务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteEntertainmentServices websiteEntertainmentServices)
    {
        return toAjax(websiteEntertainmentServicesService.insertWebsiteEntertainmentServices(websiteEntertainmentServices));
    }

    /**
     * 修改文娱活动服务
     */
    @PreAuthorize("@ss.hasPermi('website:entertainment:edit')")
    @Log(title = "文娱活动服务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteEntertainmentServices websiteEntertainmentServices)
    {
        return toAjax(websiteEntertainmentServicesService.updateWebsiteEntertainmentServices(websiteEntertainmentServices));
    }

    /**
     * 删除文娱活动服务
     */
    @PreAuthorize("@ss.hasPermi('website:entertainment:remove')")
    @Log(title = "文娱活动服务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{activityIds}")
    public AjaxResult remove(@PathVariable Long[] activityIds)
    {
        return toAjax(websiteEntertainmentServicesService.deleteWebsiteEntertainmentServicesByActivityIds(activityIds));
    }

    /**
     * 获取文娱活动服务公开列表（无需登录�?
     */
    @Anonymous
    @GetMapping("/public/list")
    public AjaxResult listPublic()
    {
        WebsiteEntertainmentServices query = new WebsiteEntertainmentServices();
        query.setStatus("0"); // 只查询正常状态的数据
        List<WebsiteEntertainmentServices> list = websiteEntertainmentServicesService.selectWebsiteEntertainmentServicesList(query);
        return success(list);
    }
}






