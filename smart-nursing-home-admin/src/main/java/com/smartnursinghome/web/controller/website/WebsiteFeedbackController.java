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
import com.smartnursinghome.system.domain.WebsiteFeedback;
import com.smartnursinghome.system.service.IWebsiteFeedbackService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 意见反馈Controller
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
@RestController
@RequestMapping("/website/feedback")
public class WebsiteFeedbackController extends BaseController
{
    @Autowired
    private IWebsiteFeedbackService websiteFeedbackService;

    /**
     * 查询意见反馈列表
     */
    @PreAuthorize("@ss.hasPermi('website:feedback:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteFeedback websiteFeedback)
    {
        startPage();
        List<WebsiteFeedback> list = websiteFeedbackService.selectWebsiteFeedbackList(websiteFeedback);
        return getDataTable(list);
    }

    /**
     * 导出意见反馈列表
     */
    @PreAuthorize("@ss.hasPermi('website:feedback:export')")
    @Log(title = "意见反馈", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteFeedback websiteFeedback)
    {
        List<WebsiteFeedback> list = websiteFeedbackService.selectWebsiteFeedbackList(websiteFeedback);
        ExcelUtil<WebsiteFeedback> util = new ExcelUtil<WebsiteFeedback>(WebsiteFeedback.class);
        util.exportExcel(response, list, "意见反馈数据");
    }

    /**
     * 获取意见反馈详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:feedback:query')")
    @GetMapping(value = "/{feedbackId}")
    public AjaxResult getInfo(@PathVariable("feedbackId") Long feedbackId)
    {
        return success(websiteFeedbackService.selectWebsiteFeedbackByFeedbackId(feedbackId));
    }

    /**
     * 新增意见反馈
     */
    @PreAuthorize("@ss.hasPermi('website:feedback:add')")
    @Log(title = "意见反馈", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteFeedback websiteFeedback)
    {
        return toAjax(websiteFeedbackService.insertWebsiteFeedback(websiteFeedback));
    }

    /**
     * 修改意见反馈
     */
    @PreAuthorize("@ss.hasPermi('website:feedback:edit')")
    @Log(title = "意见反馈", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteFeedback websiteFeedback)
    {
        return toAjax(websiteFeedbackService.updateWebsiteFeedback(websiteFeedback));
    }

    /**
     * 删除意见反馈
     */
    @PreAuthorize("@ss.hasPermi('website:feedback:remove')")
    @Log(title = "意见反馈", businessType = BusinessType.DELETE)
	@DeleteMapping("/{feedbackIds}")
    public AjaxResult remove(@PathVariable Long[] feedbackIds)
    {
        return toAjax(websiteFeedbackService.deleteWebsiteFeedbackByFeedbackIds(feedbackIds));
    }

    /**
     * 回复意见反馈
     */
    @PreAuthorize("@ss.hasPermi('website:feedback:reply')")
    @Log(title = "意见反馈", businessType = BusinessType.UPDATE)
    @PutMapping("/reply")
    public AjaxResult reply(@RequestBody WebsiteFeedback websiteFeedback)
    {
        return toAjax(websiteFeedbackService.replyWebsiteFeedback(websiteFeedback));
    }

    /**
     * 处理意见反馈
     */
    @PreAuthorize("@ss.hasPermi('website:feedback:process')")
    @Log(title = "意见反馈", businessType = BusinessType.UPDATE)
    @PutMapping("/process")
    public AjaxResult process(@RequestBody WebsiteFeedback websiteFeedback)
    {
        return toAjax(websiteFeedbackService.processWebsiteFeedback(websiteFeedback));
    }
}
