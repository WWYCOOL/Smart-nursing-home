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
import com.smartnursinghome.system.domain.WebsiteConsultation;
import com.smartnursinghome.system.service.IWebsiteConsultationService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;
import com.smartnursinghome.common.annotation.Anonymous;

/**
 * 网站咨询信息Controller
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
@RestController
@RequestMapping("/website/consultation")
public class WebsiteConsultationController extends BaseController
{
    @Autowired
    private IWebsiteConsultationService websiteConsultationService;

    /**
     * 查询网站咨询信息列表
     */
    @PreAuthorize("@ss.hasPermi('website:consultation:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteConsultation websiteConsultation)
    {
        startPage();
        List<WebsiteConsultation> list = websiteConsultationService.selectWebsiteConsultationList(websiteConsultation);
        return getDataTable(list);
    }

    /**
     * 导出网站咨询信息列表
     */
    @PreAuthorize("@ss.hasPermi('website:consultation:export')")
    @Log(title = "网站咨询信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteConsultation websiteConsultation)
    {
        List<WebsiteConsultation> list = websiteConsultationService.selectWebsiteConsultationList(websiteConsultation);
        ExcelUtil<WebsiteConsultation> util = new ExcelUtil<WebsiteConsultation>(WebsiteConsultation.class);
        util.exportExcel(response, list, "网站咨询信息数据");
    }

    /**
     * 获取网站咨询信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:consultation:query')")
    @GetMapping(value = "/{consultationId}")
    public AjaxResult getInfo(@PathVariable("consultationId") Long consultationId)
    {
        return success(websiteConsultationService.selectWebsiteConsultationByConsultationId(consultationId));
    }

    /**
     * 新增网站咨询信息
     */
    @Anonymous
    @Log(title = "网站咨询信息", businessType = BusinessType.INSERT)
    @PostMapping("/public/submit")
    public AjaxResult add(@RequestBody WebsiteConsultation websiteConsultation)
    {
        websiteConsultation.setStatus("0"); // 待处�?
        return toAjax(websiteConsultationService.insertWebsiteConsultation(websiteConsultation));
    }

    /**
     * 修改网站咨询信息
     */
    @PreAuthorize("@ss.hasPermi('website:consultation:edit')")
    @Log(title = "网站咨询信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteConsultation websiteConsultation)
    {
        return toAjax(websiteConsultationService.updateWebsiteConsultation(websiteConsultation));
    }

    /**
     * 删除网站咨询信息
     */
    @PreAuthorize("@ss.hasPermi('website:consultation:remove')")
    @Log(title = "网站咨询信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{consultationIds}")
    public AjaxResult remove(@PathVariable Long[] consultationIds)
    {
        return toAjax(websiteConsultationService.deleteWebsiteConsultationByConsultationIds(consultationIds));
    }

    /**
     * 回复咨询
     */
    @PreAuthorize("@ss.hasPermi('website:consultation:reply')")
    @Log(title = "回复咨询", businessType = BusinessType.UPDATE)
    @PostMapping("/reply")
    public AjaxResult reply(@RequestBody WebsiteConsultation websiteConsultation)
    {
        return toAjax(websiteConsultationService.replyConsultation(
            websiteConsultation.getConsultationId(), 
            websiteConsultation.getReplyContent(), 
            getUsername()
        ));
    }
}



