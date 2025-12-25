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
import com.smartnursinghome.system.domain.WebsiteMedicalServices;
import com.smartnursinghome.system.service.IWebsiteMedicalServicesService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;
import com.smartnursinghome.common.annotation.Anonymous; // 导入 @Anonymous 注解

/**
 * 医疗护理服务Controller
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
@RestController
@RequestMapping("/website/medical-services")
public class WebsiteMedicalServicesController extends BaseController
{
    @Autowired
    private IWebsiteMedicalServicesService websiteMedicalServicesService;

    /**
     * 查询医疗护理服务列表
     */
    @PreAuthorize("@ss.hasPermi('system:medical-services:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteMedicalServices websiteMedicalServices)
    {
        startPage();
        List<WebsiteMedicalServices> list = websiteMedicalServicesService.selectWebsiteMedicalServicesList(websiteMedicalServices);
        return getDataTable(list);
    }

    /**
     * 导出医疗护理服务列表
     */
    @PreAuthorize("@ss.hasPermi('system:medical-services:export')")
    @Log(title = "医疗护理服务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteMedicalServices websiteMedicalServices)
    {
        List<WebsiteMedicalServices> list = websiteMedicalServicesService.selectWebsiteMedicalServicesList(websiteMedicalServices);
        ExcelUtil<WebsiteMedicalServices> util = new ExcelUtil<WebsiteMedicalServices>(WebsiteMedicalServices.class);
        util.exportExcel(response, list, "医疗护理服务数据");
    }

    /**
     * 获取医疗护理服务详细
     */
    @PreAuthorize("@ss.hasPermi('system:medical-services:query')")
    @GetMapping(value = "/{serviceId}")
    public AjaxResult getInfo(@PathVariable("serviceId") Long serviceId)
    {
        return success(websiteMedicalServicesService.selectWebsiteMedicalServicesByServiceId(serviceId));
    }

    /**
     * 新增医疗护理服务
     */
    @PreAuthorize("@ss.hasPermi('system:medical-services:add')")
    @Log(title = "医疗护理服务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteMedicalServices websiteMedicalServices)
    {
        return toAjax(websiteMedicalServicesService.insertWebsiteMedicalServices(websiteMedicalServices));
    }

    /**
     * 修改医疗护理服务
     */
    @PreAuthorize("@ss.hasPermi('system:medical-services:edit')")
    @Log(title = "医疗护理服务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteMedicalServices websiteMedicalServices)
    {
        return toAjax(websiteMedicalServicesService.updateWebsiteMedicalServices(websiteMedicalServices));
    }

    /**
     * 删除医疗护理服务
     */
    @PreAuthorize("@ss.hasPermi('system:medical-services:remove')")
    @Log(title = "医疗护理服务", businessType = BusinessType.DELETE)
    @DeleteMapping("/{serviceIds}")
    public AjaxResult remove(@PathVariable Long[] serviceIds)
    {
        return toAjax(websiteMedicalServicesService.deleteWebsiteMedicalServicesByServiceIds(serviceIds));
    }

    /**
     * 获取医疗护理服务列表（公开接口�?
     */
    @Anonymous
    @GetMapping("/public/list")
    public AjaxResult getPublicList()
    {
        WebsiteMedicalServices query = new WebsiteMedicalServices();
        query.setStatus("0"); // 只查询正常状态的
        List<WebsiteMedicalServices> list = websiteMedicalServicesService.selectWebsiteMedicalServicesList(query);
        return success(list);
    }
}








