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
import com.smartnursinghome.system.domain.WebsiteFacilityOverview;
import com.smartnursinghome.system.service.IWebsiteFacilityOverviewService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;
import com.smartnursinghome.common.annotation.Anonymous;

/**
 * 环境概览配置Controller
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
@RestController
@RequestMapping("/website/facility-overview")
public class WebsiteFacilityOverviewController extends BaseController
{
    @Autowired
    private IWebsiteFacilityOverviewService websiteFacilityOverviewService;

    /**
     * 查询环境概览配置列表
     */
    @PreAuthorize("@ss.hasPermi('website:facility-overview:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteFacilityOverview websiteFacilityOverview)
    {
        startPage();
        List<WebsiteFacilityOverview> list = websiteFacilityOverviewService.selectWebsiteFacilityOverviewList(websiteFacilityOverview);
        return getDataTable(list);
    }

    /**
     * 导出环境概览配置列表
     */
    @PreAuthorize("@ss.hasPermi('website:facility-overview:export')")
    @Log(title = "环境概览配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteFacilityOverview websiteFacilityOverview)
    {
        List<WebsiteFacilityOverview> list = websiteFacilityOverviewService.selectWebsiteFacilityOverviewList(websiteFacilityOverview);
        ExcelUtil<WebsiteFacilityOverview> util = new ExcelUtil<WebsiteFacilityOverview>(WebsiteFacilityOverview.class);
        util.exportExcel(response, list, "环境概览配置数据");
    }

    /**
     * 获取环境概览配置详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:facility-overview:query')")
    @GetMapping(value = "/{overviewId}")
    public AjaxResult getInfo(@PathVariable("overviewId") Long overviewId)
    {
        return success(websiteFacilityOverviewService.selectWebsiteFacilityOverviewByOverviewId(overviewId));
    }

    /**
     * 新增环境概览配置
     */
    @PreAuthorize("@ss.hasPermi('website:facility-overview:add')")
    @Log(title = "环境概览配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteFacilityOverview websiteFacilityOverview)
    {
        return toAjax(websiteFacilityOverviewService.insertWebsiteFacilityOverview(websiteFacilityOverview));
    }

    /**
     * 修改环境概览配置
     */
    @PreAuthorize("@ss.hasPermi('website:facility-overview:edit')")
    @Log(title = "环境概览配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteFacilityOverview websiteFacilityOverview)
    {
        return toAjax(websiteFacilityOverviewService.updateWebsiteFacilityOverview(websiteFacilityOverview));
    }

    /**
     * 删除环境概览配置
     */
    @PreAuthorize("@ss.hasPermi('website:facility-overview:remove')")
    @Log(title = "环境概览配置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{overviewIds}")
    public AjaxResult remove(@PathVariable Long[] overviewIds)
    {
        return toAjax(websiteFacilityOverviewService.deleteWebsiteFacilityOverviewByOverviewIds(overviewIds));
    }

    /**
     * 获取当前环境概览配置（公开接口�?
     */
    @Anonymous
    @GetMapping("/public/current")
    public AjaxResult getCurrentOverview()
    {
        WebsiteFacilityOverview overview = websiteFacilityOverviewService.getCurrentOverview();
        return success(overview);
    }
}











