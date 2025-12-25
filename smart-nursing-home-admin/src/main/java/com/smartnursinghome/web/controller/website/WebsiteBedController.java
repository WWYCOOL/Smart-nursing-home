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
import com.smartnursinghome.system.domain.WebsiteBed;
import com.smartnursinghome.system.service.IWebsiteBedService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 床位管理Controller
 *
 * @author ruoyi
 * @date 2025-12-10
 */
@RestController
@RequestMapping("/website/bed")
public class WebsiteBedController extends BaseController
{
    @Autowired
    private IWebsiteBedService websiteBedService;

    /**
     * 查询床位管理列表
     */
    @PreAuthorize("@ss.hasPermi('website:bed:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteBed websiteBed)
    {
        startPage();
        List<WebsiteBed> list = websiteBedService.selectWebsiteBedList(websiteBed);
        return getDataTable(list);
    }

    /**
     * 导出床位管理列表
     */
    @PreAuthorize("@ss.hasPermi('website:bed:export')")
    @Log(title = "床位管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteBed websiteBed)
    {
        List<WebsiteBed> list = websiteBedService.selectWebsiteBedList(websiteBed);
        ExcelUtil<WebsiteBed> util = new ExcelUtil<WebsiteBed>(WebsiteBed.class);
        util.exportExcel(response, list, "床位管理数据");
    }

    /**
     * 获取床位管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:bed:query')")
    @GetMapping(value = "/{bedId}")
    public AjaxResult getInfo(@PathVariable("bedId") Long bedId)
    {
        return success(websiteBedService.selectWebsiteBedByBedId(bedId));
    }

    /**
     * 新增床位管理
     */
    @PreAuthorize("@ss.hasPermi('website:bed:add')")
    @Log(title = "床位管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteBed websiteBed)
    {
        return toAjax(websiteBedService.insertWebsiteBed(websiteBed));
    }

    /**
     * 修改床位管理
     */
    @PreAuthorize("@ss.hasPermi('website:bed:edit')")
    @Log(title = "床位管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteBed websiteBed)
    {
        return toAjax(websiteBedService.updateWebsiteBed(websiteBed));
    }

    /**
     * 删除床位管理
     */
    @PreAuthorize("@ss.hasPermi('website:bed:remove')")
    @Log(title = "床位管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{bedIds}")
    public AjaxResult remove(@PathVariable Long[] bedIds)
    {
        return toAjax(websiteBedService.deleteWebsiteBedByBedIds(bedIds));
    }
}
