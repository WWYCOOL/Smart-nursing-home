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
import com.smartnursinghome.system.domain.WebsiteNutritionFeatures;
import com.smartnursinghome.system.service.IWebsiteNutritionFeaturesService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;
import com.smartnursinghome.common.annotation.Anonymous;

/**
 * 营养膳食特色Controller
 * 
 * @author ruoyi
 * @date 2025-01-22
 */
@RestController
@RequestMapping("/website/nutrition-features")
public class WebsiteNutritionFeaturesController extends BaseController
{
    @Autowired
    private IWebsiteNutritionFeaturesService websiteNutritionFeaturesService;

    /**
     * 查询营养膳食特色列表
     */
    @PreAuthorize("@ss.hasPermi('website:nutrition:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteNutritionFeatures websiteNutritionFeatures)
    {
        startPage();
        List<WebsiteNutritionFeatures> list = websiteNutritionFeaturesService.selectWebsiteNutritionFeaturesList(websiteNutritionFeatures);
        return getDataTable(list);
    }

    /**
     * 导出营养膳食特色列表
     */
    @PreAuthorize("@ss.hasPermi('website:nutrition:export')")
    @Log(title = "营养膳食特色", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteNutritionFeatures websiteNutritionFeatures)
    {
        List<WebsiteNutritionFeatures> list = websiteNutritionFeaturesService.selectWebsiteNutritionFeaturesList(websiteNutritionFeatures);
        ExcelUtil<WebsiteNutritionFeatures> util = new ExcelUtil<WebsiteNutritionFeatures>(WebsiteNutritionFeatures.class);
        util.exportExcel(response, list, "营养膳食特色数据");
    }

    /**
     * 获取营养膳食特色详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:nutrition:query')")
    @GetMapping(value = "/{featureId}")
    public AjaxResult getInfo(@PathVariable("featureId") Long featureId)
    {
        return success(websiteNutritionFeaturesService.selectWebsiteNutritionFeaturesByFeatureId(featureId));
    }

    /**
     * 新增营养膳食特色
     */
    @PreAuthorize("@ss.hasPermi('website:nutrition:add')")
    @Log(title = "营养膳食特色", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteNutritionFeatures websiteNutritionFeatures)
    {
        return toAjax(websiteNutritionFeaturesService.insertWebsiteNutritionFeatures(websiteNutritionFeatures));
    }

    /**
     * 修改营养膳食特色
     */
    @PreAuthorize("@ss.hasPermi('website:nutrition:edit')")
    @Log(title = "营养膳食特色", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteNutritionFeatures websiteNutritionFeatures)
    {
        return toAjax(websiteNutritionFeaturesService.updateWebsiteNutritionFeatures(websiteNutritionFeatures));
    }

    /**
     * 删除营养膳食特色
     */
    @PreAuthorize("@ss.hasPermi('website:nutrition:remove')")
    @Log(title = "营养膳食特色", businessType = BusinessType.DELETE)
	@DeleteMapping("/{featureIds}")
    public AjaxResult remove(@PathVariable Long[] featureIds)
    {
        return toAjax(websiteNutritionFeaturesService.deleteWebsiteNutritionFeaturesByFeatureIds(featureIds));
    }

    /**
     * 获取营养膳食特色公开列表（无需登录�?
     */
    @Anonymous
    @GetMapping("/public/list")
    public AjaxResult listPublic()
    {
        WebsiteNutritionFeatures query = new WebsiteNutritionFeatures();
        query.setStatus("0"); // 只查询正常状态的数据
        List<WebsiteNutritionFeatures> list = websiteNutritionFeaturesService.selectWebsiteNutritionFeaturesList(query);
        return success(list);
    }
}




