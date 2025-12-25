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
import com.smartnursinghome.system.domain.WebsiteCommunication;
import com.smartnursinghome.system.service.IWebsiteCommunicationService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 网站沟通消息Controller
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
@RestController
@RequestMapping("/website/communication")
public class WebsiteCommunicationController extends BaseController
{
    @Autowired
    private IWebsiteCommunicationService websiteCommunicationService;

    /**
     * 查询网站沟通消息列表
     */
    @PreAuthorize("@ss.hasPermi('website:communication:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteCommunication websiteCommunication)
    {
        startPage();
        List<WebsiteCommunication> list = websiteCommunicationService.selectWebsiteCommunicationList(websiteCommunication);
        return getDataTable(list);
    }

    /**
     * 导出网站沟通消息列表
     */
    @PreAuthorize("@ss.hasPermi('website:communication:export')")
    @Log(title = "网站沟通消息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteCommunication websiteCommunication)
    {
        List<WebsiteCommunication> list = websiteCommunicationService.selectWebsiteCommunicationList(websiteCommunication);
        ExcelUtil<WebsiteCommunication> util = new ExcelUtil<WebsiteCommunication>(WebsiteCommunication.class);
        util.exportExcel(response, list, "网站沟通消息数据");
    }

    /**
     * 获取网站沟通消息详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:communication:query')")
    @GetMapping(value = "/{messageId}")
    public AjaxResult getInfo(@PathVariable("messageId") Long messageId)
    {
        return success(websiteCommunicationService.selectWebsiteCommunicationByMessageId(messageId));
    }

    /**
     * 新增网站沟通消息
     */
    @PreAuthorize("@ss.hasPermi('website:communication:add')")
    @Log(title = "网站沟通消息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteCommunication websiteCommunication)
    {
        return toAjax(websiteCommunicationService.insertWebsiteCommunication(websiteCommunication));
    }

    /**
     * 修改网站沟通消息
     */
    @PreAuthorize("@ss.hasPermi('website:communication:edit')")
    @Log(title = "网站沟通消息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteCommunication websiteCommunication)
    {
        return toAjax(websiteCommunicationService.updateWebsiteCommunication(websiteCommunication));
    }

    /**
     * 删除网站沟通消息
     */
    @PreAuthorize("@ss.hasPermi('website:communication:remove')")
    @Log(title = "网站沟通消息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{messageIds}")
    public AjaxResult remove(@PathVariable Long[] messageIds)
    {
        return toAjax(websiteCommunicationService.deleteWebsiteCommunicationByMessageIds(messageIds));
    }

    // ========== 家属端API接口 ==========

    /**
     * 查询家属沟通记录列表
     */
    @Anonymous
    @GetMapping("/family/list")
    public TableDataInfo familyList(WebsiteCommunication websiteCommunication)
    {
        startPage();
        List<WebsiteCommunication> list = websiteCommunicationService.selectWebsiteCommunicationList(websiteCommunication);
        return getDataTable(list);
    }

    /**
     * 发送消息
     */
    @Anonymous
    @PostMapping("/family/send")
    public AjaxResult familySendMessage(@RequestBody WebsiteCommunication websiteCommunication)
    {
        return toAjax(websiteCommunicationService.insertWebsiteCommunication(websiteCommunication));
    }

    /**
     * 标记消息为已读
     */
    @Anonymous
    @PutMapping("/family/read/{messageId}")
    public AjaxResult familyMarkAsRead(@PathVariable("messageId") Long messageId)
    {
        WebsiteCommunication communication = new WebsiteCommunication();
        communication.setMessageId(messageId);
        communication.setIsRead("1");
        return toAjax(websiteCommunicationService.updateWebsiteCommunication(communication));
    }

    /**
     * 获取未读消息数量
     */
    @Anonymous
    @GetMapping("/family/unread/{familyId}")
    public AjaxResult familyGetUnreadCount(@PathVariable("familyId") Long familyId)
    {
        int count = websiteCommunicationService.selectUnreadCountByFamilyId(familyId);
        return success(count);
    }
}