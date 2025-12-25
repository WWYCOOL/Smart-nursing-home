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
import com.smartnursinghome.system.domain.WebsiteRoom;
import com.smartnursinghome.system.service.IWebsiteRoomService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 房间管理Controller
 *
 * @author wwy
 * @date 2025-12-10
 */
@RestController
@RequestMapping("/website/room")
public class WebsiteRoomController extends BaseController
{
    @Autowired
    private IWebsiteRoomService websiteRoomService;

    /**
     * 查询房间管理列表
     */
    @PreAuthorize("@ss.hasPermi('website:room:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteRoom websiteRoom)
    {
        startPage();
        List<WebsiteRoom> list = websiteRoomService.selectWebsiteRoomList(websiteRoom);
        return getDataTable(list);
    }

    /**
     * 导出房间管理列表
     */
    @PreAuthorize("@ss.hasPermi('website:room:export')")
    @Log(title = "房间管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteRoom websiteRoom)
    {
        List<WebsiteRoom> list = websiteRoomService.selectWebsiteRoomList(websiteRoom);
        ExcelUtil<WebsiteRoom> util = new ExcelUtil<WebsiteRoom>(WebsiteRoom.class);
        util.exportExcel(response, list, "房间管理数据");
    }

    /**
     * 获取房间管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:room:query')")
    @GetMapping(value = "/{roomId}")
    public AjaxResult getInfo(@PathVariable("roomId") Long roomId)
    {
        return success(websiteRoomService.selectWebsiteRoomByRoomId(roomId));
    }

    /**
     * 新增房间管理
     */
    @PreAuthorize("@ss.hasPermi('website:room:add')")
    @Log(title = "房间管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteRoom websiteRoom)
    {
        return toAjax(websiteRoomService.insertWebsiteRoom(websiteRoom));
    }

    /**
     * 修改房间管理
     */
    @PreAuthorize("@ss.hasPermi('website:room:edit')")
    @Log(title = "房间管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteRoom websiteRoom)
    {
        return toAjax(websiteRoomService.updateWebsiteRoom(websiteRoom));
    }

    /**
     * 删除房间管理
     */
    @PreAuthorize("@ss.hasPermi('website:room:remove')")
    @Log(title = "房间管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{roomIds}")
    public AjaxResult remove(@PathVariable Long[] roomIds)
    {
        return toAjax(websiteRoomService.deleteWebsiteRoomByRoomIds(roomIds));
    }
}
