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
import com.smartnursinghome.system.domain.WebsiteActivity;
import com.smartnursinghome.system.service.IWebsiteActivityService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 动态记录Controller
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
@RestController
@RequestMapping("/website/activity")
public class WebsiteActivityController extends BaseController
{
    @Autowired
    private IWebsiteActivityService websiteActivityService;

    /**
     * 查询动态记录列表
     */
    @PreAuthorize("@ss.hasPermi('website:activity:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteActivity websiteActivity)
    {
        startPage();
        List<WebsiteActivity> list = websiteActivityService.selectWebsiteActivityList(websiteActivity);
        return getDataTable(list);
    }

    /**
     * 导出动态记录列表
     */
    @PreAuthorize("@ss.hasPermi('website:activity:export')")
    @Log(title = "动态记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteActivity websiteActivity)
    {
        List<WebsiteActivity> list = websiteActivityService.selectWebsiteActivityList(websiteActivity);
        ExcelUtil<WebsiteActivity> util = new ExcelUtil<WebsiteActivity>(WebsiteActivity.class);
        util.exportExcel(response, list, "动态记录数据");
    }

    /**
     * 获取动态记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:activity:query')")
    @GetMapping(value = "/{activityId}")
    public AjaxResult getInfo(@PathVariable("activityId") Long activityId)
    {
        return success(websiteActivityService.selectWebsiteActivityByActivityId(activityId));
    }

    /**
     * 新增动态记录
     */
    @PreAuthorize("@ss.hasPermi('website:activity:add')")
    @Log(title = "动态记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteActivity websiteActivity)
    {
        return toAjax(websiteActivityService.insertWebsiteActivity(websiteActivity));
    }

    /**
     * 修改动态记录
     */
    @PreAuthorize("@ss.hasPermi('website:activity:edit')")
    @Log(title = "动态记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteActivity websiteActivity)
    {
        return toAjax(websiteActivityService.updateWebsiteActivity(websiteActivity));
    }

    /**
     * 删除动态记录
     */
    @PreAuthorize("@ss.hasPermi('website:activity:remove')")
    @Log(title = "动态记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{activityIds}")
    public AjaxResult remove(@PathVariable Long[] activityIds)
    {
        return toAjax(websiteActivityService.deleteWebsiteActivityByActivityIds(activityIds));
    }

    /**
     * 查询家属最新动态
     */
    @Anonymous
    @GetMapping("/family/recent/{familyId}")
    public AjaxResult getFamilyRecentActivities(@PathVariable("familyId") Long familyId)
    {
        try {
            List<WebsiteActivity> activities = websiteActivityService.selectFamilyRecentActivities(familyId);
            return success(activities);
        } catch (Exception e) {
            return error("获取动态失败：" + e.getMessage());
        }
    }

    /**
     * 标记动态为已读
     */
    @Anonymous
    @PutMapping("/read/{activityId}")
    public AjaxResult markAsRead(@PathVariable("activityId") Long activityId)
    {
        try {
            int result = websiteActivityService.markActivityAsRead(activityId);
            if (result > 0) {
                return success("标记成功");
            } else {
                return error("标记失败");
            }
        } catch (Exception e) {
            return error("标记失败：" + e.getMessage());
        }
    }
}