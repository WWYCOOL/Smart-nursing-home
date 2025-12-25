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
import com.smartnursinghome.common.annotation.Anonymous;
import com.smartnursinghome.common.core.controller.BaseController;
import com.smartnursinghome.common.core.domain.AjaxResult;
import com.smartnursinghome.common.enums.BusinessType;
import com.smartnursinghome.system.domain.WebsiteHealthReport;
import com.smartnursinghome.system.service.IWebsiteHealthReportService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 健康报告Controller
 * 
 * @author ruoyi
 * @date 2023-12-01
 */
@RestController
@RequestMapping("/website/healthReport")
public class WebsiteHealthReportController extends BaseController
{
    @Autowired
    private IWebsiteHealthReportService websiteHealthReportService;

    /**
     * 查询健康报告列表
     */
    @PreAuthorize("@ss.hasPermi('website:health:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteHealthReport websiteHealthReport)
    {
        startPage();
        List<WebsiteHealthReport> list = websiteHealthReportService.selectWebsiteHealthReportList(websiteHealthReport);
        return getDataTable(list);
    }

    /**
     * 导出健康报告列表
     */
    @PreAuthorize("@ss.hasPermi('website:health:export')")
    @Log(title = "健康报告", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteHealthReport websiteHealthReport)
    {
        List<WebsiteHealthReport> list = websiteHealthReportService.selectWebsiteHealthReportList(websiteHealthReport);
        ExcelUtil<WebsiteHealthReport> util = new ExcelUtil<WebsiteHealthReport>(WebsiteHealthReport.class);
        util.exportExcel(response, list, "健康报告数据");
    }

    /**
     * 获取健康报告详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:health:query')")
    @GetMapping(value = "/{reportId}")
    public AjaxResult getInfo(@PathVariable("reportId") Long reportId)
    {
        return success(websiteHealthReportService.selectWebsiteHealthReportByReportId(reportId));
    }

    /**
     * 新增健康报告
     */
    @PreAuthorize("@ss.hasPermi('website:health:add')")
    @Log(title = "健康报告", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteHealthReport websiteHealthReport)
    {
        return toAjax(websiteHealthReportService.insertWebsiteHealthReport(websiteHealthReport));
    }

    /**
     * 修改健康报告
     */
    @PreAuthorize("@ss.hasPermi('website:health:edit')")
    @Log(title = "健康报告", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteHealthReport websiteHealthReport)
    {
        return toAjax(websiteHealthReportService.updateWebsiteHealthReport(websiteHealthReport));
    }

    /**
     * 删除健康报告
     */
    @PreAuthorize("@ss.hasPermi('website:health:remove')")
    @Log(title = "健康报告", businessType = BusinessType.DELETE)
	@DeleteMapping("/{reportIds}")
    public AjaxResult remove(@PathVariable Long[] reportIds)
    {
        return toAjax(websiteHealthReportService.deleteWebsiteHealthReportByReportIds(reportIds));
    }

    /**
     * 家属端查询健康报告列�?     */
    @Anonymous
    @GetMapping("/family/list")
    public TableDataInfo familyList(WebsiteHealthReport websiteHealthReport)
    {
        startPage();
        List<WebsiteHealthReport> list = websiteHealthReportService.selectWebsiteHealthReportList(websiteHealthReport);
        return getDataTable(list);
    }

    /**
     * 家属端获取健康报告详细信�?     */
    @Anonymous
    @GetMapping(value = "/family/{reportId}")
    public AjaxResult familyGetInfo(@PathVariable("reportId") Long reportId)
    {
        return success(websiteHealthReportService.selectWebsiteHealthReportByReportId(reportId));
    }
    
    /**
     * 获取家属关联老人的最近一次健康报�?     */
    @Anonymous
    @GetMapping("/family/latest/{familyId}")
    public AjaxResult getLatestHealthReport(@PathVariable("familyId") Long familyId)
    {
        try {
            WebsiteHealthReport latestReport = websiteHealthReportService.getLatestHealthReportByFamilyId(familyId);
            return success(latestReport);
        } catch (Exception e) {
            return error("获取最近健康报告失败：" + e.getMessage());
        }
    }
}


