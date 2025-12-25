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
import com.smartnursinghome.system.domain.WebsiteFacilities;
import com.smartnursinghome.system.service.IWebsiteFacilitiesService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;
import com.smartnursinghome.common.annotation.Anonymous;

/**
 * 设施管理Controller
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
@RestController
@RequestMapping("/website/facilities")
public class WebsiteFacilitiesController extends BaseController
{
    @Autowired
    private IWebsiteFacilitiesService websiteFacilitiesService;

    /**
     * 查询设施管理列表
     */
    @PreAuthorize("@ss.hasPermi('website:facilities:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteFacilities websiteFacilities)
    {
        startPage();
        List<WebsiteFacilities> list = websiteFacilitiesService.selectWebsiteFacilitiesList(websiteFacilities);
        return getDataTable(list);
    }

    /**
     * 导出设施管理列表
     */
    @PreAuthorize("@ss.hasPermi('website:facilities:export')")
    @Log(title = "设施管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteFacilities websiteFacilities)
    {
        List<WebsiteFacilities> list = websiteFacilitiesService.selectWebsiteFacilitiesList(websiteFacilities);
        ExcelUtil<WebsiteFacilities> util = new ExcelUtil<WebsiteFacilities>(WebsiteFacilities.class);
        util.exportExcel(response, list, "设施管理数据");
    }

    /**
     * 获取设施管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:facilities:query')")
    @GetMapping(value = "/{facilityId}")
    public AjaxResult getInfo(@PathVariable("facilityId") Long facilityId)
    {
        return success(websiteFacilitiesService.selectWebsiteFacilitiesByFacilityId(facilityId));
    }

    /**
     * 新增设施管理
     */
    @PreAuthorize("@ss.hasPermi('website:facilities:add')")
    @Log(title = "设施管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteFacilities websiteFacilities)
    {
        return toAjax(websiteFacilitiesService.insertWebsiteFacilities(websiteFacilities));
    }

    /**
     * 修改设施管理
     */
    @PreAuthorize("@ss.hasPermi('website:facilities:edit')")
    @Log(title = "设施管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteFacilities websiteFacilities)
    {
        return toAjax(websiteFacilitiesService.updateWebsiteFacilities(websiteFacilities));
    }

    /**
     * 删除设施管理
     */
    @PreAuthorize("@ss.hasPermi('website:facilities:remove')")
    @Log(title = "设施管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{facilityIds}")
    public AjaxResult remove(@PathVariable Long[] facilityIds)
    {
        return toAjax(websiteFacilitiesService.deleteWebsiteFacilitiesByFacilityIds(facilityIds));
    }

    /**
     * 根据设施类型查询设施列表（公开接口�?
     */
    @Anonymous
    @GetMapping("/public/list/{facilityType}")
    public AjaxResult publicListByType(@PathVariable("facilityType") String facilityType)
    {
        List<WebsiteFacilities> list = websiteFacilitiesService.selectWebsiteFacilitiesByType(facilityType);
        return success(list);
    }

    /**
     * 查询所有设施列表（公开接口�?
     */
    @Anonymous
    @GetMapping("/public/list")
    public AjaxResult publicList()
    {
        WebsiteFacilities queryParam = new WebsiteFacilities();
        queryParam.setStatus("0"); // 只查询正常状态的设施
        List<WebsiteFacilities> list = websiteFacilitiesService.selectWebsiteFacilitiesList(queryParam);
        return success(list);
    }
}











