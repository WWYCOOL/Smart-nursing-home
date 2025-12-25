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
import com.smartnursinghome.system.domain.WebsiteCareServices;
import com.smartnursinghome.system.service.IWebsiteCareServicesService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;
import com.smartnursinghome.common.annotation.Anonymous; // 导入 @Anonymous 注解

/**
 * 生活照料服务Controller
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
@RestController
@RequestMapping("/website/care-services")
public class WebsiteCareServicesController extends BaseController
{
    @Autowired
    private IWebsiteCareServicesService websiteCareServicesService;

    /**
     * 查询生活照料服务列表
     */
    @PreAuthorize("@ss.hasPermi('system:care-services:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteCareServices websiteCareServices)
    {
        startPage();
        List<WebsiteCareServices> list = websiteCareServicesService.selectWebsiteCareServicesList(websiteCareServices);
        return getDataTable(list);
    }

    /**
     * 导出生活照料服务列表
     */
    @PreAuthorize("@ss.hasPermi('system:care-services:export')")
    @Log(title = "生活照料服务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteCareServices websiteCareServices)
    {
        List<WebsiteCareServices> list = websiteCareServicesService.selectWebsiteCareServicesList(websiteCareServices);
        ExcelUtil<WebsiteCareServices> util = new ExcelUtil<WebsiteCareServices>(WebsiteCareServices.class);
        util.exportExcel(response, list, "生活照料服务数据");
    }

    /**
     * 获取生活照料服务详细
     */
    @PreAuthorize("@ss.hasPermi('system:care-services:query')")
    @GetMapping(value = "/{serviceId}")
    public AjaxResult getInfo(@PathVariable("serviceId") Long serviceId)
    {
        return success(websiteCareServicesService.selectWebsiteCareServicesByServiceId(serviceId));
    }

    /**
     * 新增生活照料服务
     */
    @PreAuthorize("@ss.hasPermi('system:care-services:add')")
    @Log(title = "生活照料服务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteCareServices websiteCareServices)
    {
        return toAjax(websiteCareServicesService.insertWebsiteCareServices(websiteCareServices));
    }

    /**
     * 修改生活照料服务
     */
    @PreAuthorize("@ss.hasPermi('system:care-services:edit')")
    @Log(title = "生活照料服务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteCareServices websiteCareServices)
    {
        return toAjax(websiteCareServicesService.updateWebsiteCareServices(websiteCareServices));
    }

    /**
     * 删除生活照料服务
     */
    @PreAuthorize("@ss.hasPermi('system:care-services:remove')")
    @Log(title = "生活照料服务", businessType = BusinessType.DELETE)
    @DeleteMapping("/{serviceIds}")
    public AjaxResult remove(@PathVariable Long[] serviceIds)
    {
        return toAjax(websiteCareServicesService.deleteWebsiteCareServicesByServiceIds(serviceIds));
    }

    /**
     * 获取生活照料服务列表（公开接口�?
     */
    @Anonymous
    @GetMapping("/public/list")
    public AjaxResult getPublicList()
    {
        WebsiteCareServices query = new WebsiteCareServices();
        query.setStatus("0"); // 只查询正常状态的
        List<WebsiteCareServices> list = websiteCareServicesService.selectWebsiteCareServicesList(query);
        return success(list);
    }
}








