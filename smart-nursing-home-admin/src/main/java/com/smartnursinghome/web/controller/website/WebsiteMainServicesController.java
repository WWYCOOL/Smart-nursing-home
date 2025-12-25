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
import com.smartnursinghome.system.domain.WebsiteMainServices;
import com.smartnursinghome.system.service.IWebsiteMainServicesService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;
import com.smartnursinghome.common.annotation.Anonymous; // 导入 @Anonymous 注解

/**
 * 主要服务项目Controller
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
@RestController
@RequestMapping("/website/main-services")
public class WebsiteMainServicesController extends BaseController
{
    @Autowired
    private IWebsiteMainServicesService websiteMainServicesService;

    /**
     * 查询主要服务项目列表
     */
    @PreAuthorize("@ss.hasPermi('system:main-services:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteMainServices websiteMainServices)
    {
        startPage();
        List<WebsiteMainServices> list = websiteMainServicesService.selectWebsiteMainServicesList(websiteMainServices);
        return getDataTable(list);
    }

    /**
     * 导出主要服务项目列表
     */
    @PreAuthorize("@ss.hasPermi('system:main-services:export')")
    @Log(title = "主要服务项目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteMainServices websiteMainServices)
    {
        List<WebsiteMainServices> list = websiteMainServicesService.selectWebsiteMainServicesList(websiteMainServices);
        ExcelUtil<WebsiteMainServices> util = new ExcelUtil<WebsiteMainServices>(WebsiteMainServices.class);
        util.exportExcel(response, list, "主要服务项目数据");
    }

    /**
     * 获取主要服务项目详细
     */
    @PreAuthorize("@ss.hasPermi('system:main-services:query')")
    @GetMapping(value = "/{serviceId}")
    public AjaxResult getInfo(@PathVariable("serviceId") Long serviceId)
    {
        return success(websiteMainServicesService.selectWebsiteMainServicesByServiceId(serviceId));
    }

    /**
     * 新增主要服务项目
     */
    @PreAuthorize("@ss.hasPermi('system:main-services:add')")
    @Log(title = "主要服务项目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteMainServices websiteMainServices)
    {
        return toAjax(websiteMainServicesService.insertWebsiteMainServices(websiteMainServices));
    }

    /**
     * 修改主要服务项目
     */
    @PreAuthorize("@ss.hasPermi('system:main-services:edit')")
    @Log(title = "主要服务项目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteMainServices websiteMainServices)
    {
        return toAjax(websiteMainServicesService.updateWebsiteMainServices(websiteMainServices));
    }

    /**
     * 删除主要服务项目
     */
    @PreAuthorize("@ss.hasPermi('system:main-services:remove')")
    @Log(title = "主要服务项目", businessType = BusinessType.DELETE)
    @DeleteMapping("/{serviceIds}")
    public AjaxResult remove(@PathVariable Long[] serviceIds)
    {
        return toAjax(websiteMainServicesService.deleteWebsiteMainServicesByServiceIds(serviceIds));
    }

    /**
     * 获取主要服务项目列表（公开接口�?
     */
    @Anonymous
    @GetMapping("/public/list")
    public AjaxResult getPublicList()
    {
        WebsiteMainServices query = new WebsiteMainServices();
        query.setStatus("0"); // 只查询正常状态的
        List<WebsiteMainServices> list = websiteMainServicesService.selectWebsiteMainServicesList(query);
        return success(list);
    }
}








