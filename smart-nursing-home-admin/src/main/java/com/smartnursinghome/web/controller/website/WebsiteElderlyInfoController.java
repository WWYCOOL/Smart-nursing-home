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
import com.smartnursinghome.system.domain.WebsiteElderlyInfo;
import com.smartnursinghome.system.service.IWebsiteElderlyInfoService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 老人信息Controller
 * 
 * @author ruoyi
 * @date 2023-12-01
 */
@RestController
@RequestMapping("/website/elderlyInfo")
public class WebsiteElderlyInfoController extends BaseController
{
    @Autowired
    private IWebsiteElderlyInfoService websiteElderlyInfoService;

    /**
     * 查询老人信息列表
     */
    @PreAuthorize("@ss.hasPermi('website:elderly:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteElderlyInfo websiteElderlyInfo)
    {
        startPage();
        List<WebsiteElderlyInfo> list = websiteElderlyInfoService.selectWebsiteElderlyInfoList(websiteElderlyInfo);
        return getDataTable(list);
    }

    /**
     * 导出老人信息列表
     */
    @PreAuthorize("@ss.hasPermi('website:elderly:export')")
    @Log(title = "老人信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteElderlyInfo websiteElderlyInfo)
    {
        List<WebsiteElderlyInfo> list = websiteElderlyInfoService.selectWebsiteElderlyInfoList(websiteElderlyInfo);
        ExcelUtil<WebsiteElderlyInfo> util = new ExcelUtil<WebsiteElderlyInfo>(WebsiteElderlyInfo.class);
        util.exportExcel(response, list, "老人信息数据");
    }

    /**
     * 获取老人信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:elderly:query')")
    @GetMapping(value = "/{elderlyId}")
    public AjaxResult getInfo(@PathVariable("elderlyId") Long elderlyId)
    {
        return success(websiteElderlyInfoService.selectWebsiteElderlyInfoByElderlyId(elderlyId));
    }

    /**
     * 新增老人信息
     */
    @PreAuthorize("@ss.hasPermi('website:elderly:add')")
    @Log(title = "老人信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteElderlyInfo websiteElderlyInfo)
    {
        return toAjax(websiteElderlyInfoService.insertWebsiteElderlyInfo(websiteElderlyInfo));
    }

    /**
     * 修改老人信息
     */
    @PreAuthorize("@ss.hasPermi('website:elderly:edit')")
    @Log(title = "老人信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteElderlyInfo websiteElderlyInfo)
    {
        return toAjax(websiteElderlyInfoService.updateWebsiteElderlyInfo(websiteElderlyInfo));
    }

    /**
     * 删除老人信息
     */
    @PreAuthorize("@ss.hasPermi('website:elderly:remove')")
    @Log(title = "老人信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{elderlyIds}")
    public AjaxResult remove(@PathVariable Long[] elderlyIds)
    {
        return toAjax(websiteElderlyInfoService.deleteWebsiteElderlyInfoByElderlyIds(elderlyIds));
    }
}



