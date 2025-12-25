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
import com.smartnursinghome.system.domain.WebsiteNutritionMenu;
import com.smartnursinghome.system.service.IWebsiteNutritionMenuService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;
import com.smartnursinghome.common.annotation.Anonymous;

/**
 * 今日菜单Controller
 * 
 * @author ruoyi
 * @date 2025-01-22
 */
@RestController
@RequestMapping("/website/nutrition-menu")
public class WebsiteNutritionMenuController extends BaseController
{
    @Autowired
    private IWebsiteNutritionMenuService websiteNutritionMenuService;

    /**
     * 查询今日菜单列表
     */
    @PreAuthorize("@ss.hasPermi('website:nutrition:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteNutritionMenu websiteNutritionMenu)
    {
        startPage();
        List<WebsiteNutritionMenu> list = websiteNutritionMenuService.selectWebsiteNutritionMenuList(websiteNutritionMenu);
        return getDataTable(list);
    }

    /**
     * 导出今日菜单列表
     */
    @PreAuthorize("@ss.hasPermi('website:nutrition:export')")
    @Log(title = "今日菜单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteNutritionMenu websiteNutritionMenu)
    {
        List<WebsiteNutritionMenu> list = websiteNutritionMenuService.selectWebsiteNutritionMenuList(websiteNutritionMenu);
        ExcelUtil<WebsiteNutritionMenu> util = new ExcelUtil<WebsiteNutritionMenu>(WebsiteNutritionMenu.class);
        util.exportExcel(response, list, "今日菜单数据");
    }

    /**
     * 获取今日菜单详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:nutrition:query')")
    @GetMapping(value = "/{menuId}")
    public AjaxResult getInfo(@PathVariable("menuId") Long menuId)
    {
        return success(websiteNutritionMenuService.selectWebsiteNutritionMenuByMenuId(menuId));
    }

    /**
     * 新增今日菜单
     */
    @PreAuthorize("@ss.hasPermi('website:nutrition:add')")
    @Log(title = "今日菜单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteNutritionMenu websiteNutritionMenu)
    {
        return toAjax(websiteNutritionMenuService.insertWebsiteNutritionMenu(websiteNutritionMenu));
    }

    /**
     * 修改今日菜单
     */
    @PreAuthorize("@ss.hasPermi('website:nutrition:edit')")
    @Log(title = "今日菜单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteNutritionMenu websiteNutritionMenu)
    {
        return toAjax(websiteNutritionMenuService.updateWebsiteNutritionMenu(websiteNutritionMenu));
    }

    /**
     * 删除今日菜单
     */
    @PreAuthorize("@ss.hasPermi('website:nutrition:remove')")
    @Log(title = "今日菜单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{menuIds}")
    public AjaxResult remove(@PathVariable Long[] menuIds)
    {
        return toAjax(websiteNutritionMenuService.deleteWebsiteNutritionMenuByMenuIds(menuIds));
    }

    /**
     * 获取今日菜单公开列表（无需登录�?
     */
    @Anonymous
    @GetMapping("/public/list")
    public AjaxResult listPublic()
    {
        WebsiteNutritionMenu query = new WebsiteNutritionMenu();
        query.setStatus("0"); // 只查询正常状态的数据
        List<WebsiteNutritionMenu> list = websiteNutritionMenuService.selectWebsiteNutritionMenuList(query);
        return success(list);
    }
}



