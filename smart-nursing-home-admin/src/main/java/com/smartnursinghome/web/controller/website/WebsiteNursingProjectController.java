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
import com.smartnursinghome.system.domain.WebsiteNursingProject;
import com.smartnursinghome.system.service.IWebsiteNursingProjectService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 护理项目Controller
 *
 * @author ruoyi
 * @date 2025-12-09
 */
@RestController
@RequestMapping("/website/nursingProject")
public class WebsiteNursingProjectController extends BaseController
{
    @Autowired
    private IWebsiteNursingProjectService websiteNursingProjectService;

    /**
     * 查询护理项目列表
     */
    @PreAuthorize("@ss.hasPermi('website:nursingProject:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteNursingProject websiteNursingProject)
    {
        startPage();
        List<WebsiteNursingProject> list = websiteNursingProjectService.selectWebsiteNursingProjectList(websiteNursingProject);
        return getDataTable(list);
    }

    /**
     * 导出护理项目列表
     */
    @PreAuthorize("@ss.hasPermi('website:nursingProject:export')")
    @Log(title = "护理项目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteNursingProject websiteNursingProject)
    {
        List<WebsiteNursingProject> list = websiteNursingProjectService.selectWebsiteNursingProjectList(websiteNursingProject);
        ExcelUtil<WebsiteNursingProject> util = new ExcelUtil<WebsiteNursingProject>(WebsiteNursingProject.class);
        util.exportExcel(response, list, "护理项目数据");
    }

    /**
     * 获取护理项目详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:nursingProject:query')")
    @GetMapping(value = "/{projectId}")
    public AjaxResult getInfo(@PathVariable("projectId") Long projectId)
    {
        return success(websiteNursingProjectService.selectWebsiteNursingProjectByProjectId(projectId));
    }

    /**
     * 新增护理项目
     */
    @PreAuthorize("@ss.hasPermi('website:nursingProject:add')")
    @Log(title = "护理项目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteNursingProject websiteNursingProject)
    {
        return toAjax(websiteNursingProjectService.insertWebsiteNursingProject(websiteNursingProject));
    }

    /**
     * 修改护理项目
     */
    @PreAuthorize("@ss.hasPermi('website:nursingProject:edit')")
    @Log(title = "护理项目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteNursingProject websiteNursingProject)
    {
        return toAjax(websiteNursingProjectService.updateWebsiteNursingProject(websiteNursingProject));
    }

    /**
     * 删除护理项目
     */
    @PreAuthorize("@ss.hasPermi('website:nursingProject:remove')")
    @Log(title = "护理项目", businessType = BusinessType.DELETE)
	@DeleteMapping("/{projectIds}")
    public AjaxResult remove(@PathVariable Long[] projectIds)
    {
        return toAjax(websiteNursingProjectService.deleteWebsiteNursingProjectByProjectIds(projectIds));
    }
}
