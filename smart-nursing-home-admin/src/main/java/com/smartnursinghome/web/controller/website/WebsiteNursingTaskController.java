package com.smartnursinghome.web.controller.website;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

import com.smartnursinghome.common.annotation.Anonymous;
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
import com.smartnursinghome.system.domain.WebsiteNursingTask;
import com.smartnursinghome.system.service.IWebsiteNursingTaskService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 护理任务Controller
 *
 * @author ruoyi
 * @date 2025-12-09
 */
@RestController
@RequestMapping("/website/nursingTask")
public class WebsiteNursingTaskController extends BaseController
{
    @Autowired
    private IWebsiteNursingTaskService websiteNursingTaskService;

    /**
     * 查询护理任务列表
     */
    @Anonymous
    @GetMapping("/list")
    public TableDataInfo list(WebsiteNursingTask websiteNursingTask)
    {
        startPage();
        List<WebsiteNursingTask> list = websiteNursingTaskService.selectWebsiteNursingTaskList(websiteNursingTask);
        return getDataTable(list);
    }

    /**
     * 导出护理任务列表
     */
    @PreAuthorize("@ss.hasPermi('website:nursingTask:export')")
    @Log(title = "护理任务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteNursingTask websiteNursingTask)
    {
        List<WebsiteNursingTask> list = websiteNursingTaskService.selectWebsiteNursingTaskList(websiteNursingTask);
        ExcelUtil<WebsiteNursingTask> util = new ExcelUtil<WebsiteNursingTask>(WebsiteNursingTask.class);
        util.exportExcel(response, list, "护理任务数据");
    }

    /**
     * 获取护理任务详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:nursingTask:query')")
    @GetMapping(value = "/{taskId}")
    public AjaxResult getInfo(@PathVariable("taskId") Long taskId)
    {
        return success(websiteNursingTaskService.selectWebsiteNursingTaskByTaskId(taskId));
    }

    /**
     * 新增护理任务
     */
    @PreAuthorize("@ss.hasPermi('website:nursingTask:add')")
    @Log(title = "护理任务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteNursingTask websiteNursingTask)
    {
        return toAjax(websiteNursingTaskService.insertWebsiteNursingTask(websiteNursingTask));
    }

    /**
     * 修改护理任务
     */
    @PreAuthorize("@ss.hasPermi('website:nursingTask:edit')")
    @Log(title = "护理任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteNursingTask websiteNursingTask)
    {
        return toAjax(websiteNursingTaskService.updateWebsiteNursingTask(websiteNursingTask));
    }

    /**
     * 删除护理任务
     */
    @PreAuthorize("@ss.hasPermi('website:nursingTask:remove')")
    @Log(title = "护理任务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{taskIds}")
    public AjaxResult remove(@PathVariable Long[] taskIds)
    {
        return toAjax(websiteNursingTaskService.deleteWebsiteNursingTaskByTaskIds(taskIds));
    }
}
