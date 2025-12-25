package com.smartnursinghome.web.controller.website;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.smartnursinghome.common.annotation.Anonymous;
import com.smartnursinghome.common.core.controller.BaseController;
import com.smartnursinghome.common.core.domain.AjaxResult;
import com.smartnursinghome.common.core.page.TableDataInfo;
import com.smartnursinghome.system.domain.SysNotice;
import com.smartnursinghome.system.service.ISysNoticeService;

/**
 * 网站通知公告Controller
 * 
 * @author smartnursinghome
 */
@RestController
@RequestMapping("/website/notice")
public class WebsiteNoticeController extends BaseController
{
    @Autowired
    private ISysNoticeService noticeService;

    /**
     * 获取公开的通知公告列表（家属端使用）
     */
    @Anonymous
    @GetMapping("/list")
    public TableDataInfo list(SysNotice notice)
    {
        // 只获取状态为正常(0)的通知
        notice.setStatus("0");
        startPage();
        List<SysNotice> list = noticeService.selectNoticeList(notice);
        return getDataTable(list);
    }

    /**
     * 根据通知公告编号获取详细信息（家属端使用）
     */
    @Anonymous
    @GetMapping(value = "/{noticeId}")
    public AjaxResult getInfo(@PathVariable Long noticeId)
    {
        SysNotice notice = noticeService.selectNoticeById(noticeId);
        // 只返回状态为正常的通知
        if (notice != null && "0".equals(notice.getStatus())) {
            return success(notice);
        }
        return error("通知不存在或已关闭");
    }
}
