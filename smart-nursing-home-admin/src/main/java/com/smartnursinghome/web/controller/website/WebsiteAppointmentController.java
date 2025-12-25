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
import com.smartnursinghome.system.domain.WebsiteAppointment;
import com.smartnursinghome.system.service.IWebsiteAppointmentService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;
import com.smartnursinghome.common.annotation.Anonymous;

/**
 * 网站预约信息Controller
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
@RestController
@RequestMapping("/website/appointment")
public class WebsiteAppointmentController extends BaseController
{
    @Autowired
    private IWebsiteAppointmentService websiteAppointmentService;

    /**
     * 查询网站预约信息列表
     */
    @PreAuthorize("@ss.hasPermi('website:appointment:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteAppointment websiteAppointment)
    {
        startPage();
        List<WebsiteAppointment> list = websiteAppointmentService.selectWebsiteAppointmentList(websiteAppointment);
        return getDataTable(list);
    }

    /**
     * 导出网站预约信息列表
     */
    @PreAuthorize("@ss.hasPermi('website:appointment:export')")
    @Log(title = "网站预约信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteAppointment websiteAppointment)
    {
        List<WebsiteAppointment> list = websiteAppointmentService.selectWebsiteAppointmentList(websiteAppointment);
        ExcelUtil<WebsiteAppointment> util = new ExcelUtil<WebsiteAppointment>(WebsiteAppointment.class);
        util.exportExcel(response, list, "网站预约信息数据");
    }

    /**
     * 获取网站预约信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:appointment:query')")
    @GetMapping(value = "/{appointmentId}")
    public AjaxResult getInfo(@PathVariable("appointmentId") Long appointmentId)
    {
        return success(websiteAppointmentService.selectWebsiteAppointmentByAppointmentId(appointmentId));
    }

    /**
     * 新增网站预约信息
     */
    @Anonymous
    @Log(title = "网站预约信息", businessType = BusinessType.INSERT)
    @PostMapping("/public/submit")
    public AjaxResult add(@RequestBody WebsiteAppointment websiteAppointment)
    {
        websiteAppointment.setStatus("0"); // 待确�?
        return toAjax(websiteAppointmentService.insertWebsiteAppointment(websiteAppointment));
    }

    /**
     * 修改网站预约信息
     */
    @PreAuthorize("@ss.hasPermi('website:appointment:edit')")
    @Log(title = "网站预约信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteAppointment websiteAppointment)
    {
        return toAjax(websiteAppointmentService.updateWebsiteAppointment(websiteAppointment));
    }

    /**
     * 删除网站预约信息
     */
    @PreAuthorize("@ss.hasPermi('website:appointment:remove')")
    @Log(title = "网站预约信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{appointmentIds}")
    public AjaxResult remove(@PathVariable Long[] appointmentIds)
    {
        return toAjax(websiteAppointmentService.deleteWebsiteAppointmentByAppointmentIds(appointmentIds));
    }

    /**
     * 确认预约
     */
    @PreAuthorize("@ss.hasPermi('website:appointment:confirm')")
    @Log(title = "确认预约", businessType = BusinessType.UPDATE)
    @PostMapping("/confirm")
    public AjaxResult confirm(@RequestBody WebsiteAppointment websiteAppointment)
    {
        return toAjax(websiteAppointmentService.confirmAppointment(
            websiteAppointment.getAppointmentId(), 
            getUsername()
        ));
    }

    /**
     * 取消预约
     */
    @PreAuthorize("@ss.hasPermi('website:appointment:cancel')")
    @Log(title = "取消预约", businessType = BusinessType.UPDATE)
    @PostMapping("/cancel")
    public AjaxResult cancel(@RequestBody WebsiteAppointment websiteAppointment)
    {
        return toAjax(websiteAppointmentService.cancelAppointment(
            websiteAppointment.getAppointmentId(), 
            websiteAppointment.getCancelReason()
        ));
    }
}



