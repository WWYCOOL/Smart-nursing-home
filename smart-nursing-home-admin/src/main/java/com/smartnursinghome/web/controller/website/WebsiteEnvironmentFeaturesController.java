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
import com.smartnursinghome.system.domain.WebsiteEnvironmentFeatures;
import com.smartnursinghome.system.service.IWebsiteEnvironmentFeaturesService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 环境特色Controller
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
@RestController
@RequestMapping("/website/environment-features")
public class WebsiteEnvironmentFeaturesController extends BaseController
{
    @Autowired
    private IWebsiteEnvironmentFeaturesService websiteEnvironmentFeaturesService;

    /**
     * 查询环境特色列表
     */
    @PreAuthorize("@ss.hasPermi('system:environment-features:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteEnvironmentFeatures websiteEnvironmentFeatures)
    {
        startPage();
        List<WebsiteEnvironmentFeatures> list = websiteEnvironmentFeaturesService.selectWebsiteEnvironmentFeaturesList(websiteEnvironmentFeatures);
        return getDataTable(list);
    }

    /**
     * 导出环境特色列表
     */
    @PreAuthorize("@ss.hasPermi('system:environment-features:export')")
    @Log(title = "环境特色", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteEnvironmentFeatures websiteEnvironmentFeatures)
    {
        List<WebsiteEnvironmentFeatures> list = websiteEnvironmentFeaturesService.selectWebsiteEnvironmentFeaturesList(websiteEnvironmentFeatures);
        ExcelUtil<WebsiteEnvironmentFeatures> util = new ExcelUtil<WebsiteEnvironmentFeatures>(WebsiteEnvironmentFeatures.class);
        util.exportExcel(response, list, "环境特色数据");
    }

    /**
     * 获取环境特色详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:environment-features:query')")
    @GetMapping(value = "/{featureId}")
    public AjaxResult getInfo(@PathVariable("featureId") Long featureId)
    {
        return success(websiteEnvironmentFeaturesService.selectWebsiteEnvironmentFeaturesByFeatureId(featureId));
    }

    /**
     * 新增环境特色
     */
    @PreAuthorize("@ss.hasPermi('system:environment-features:add')")
    @Log(title = "环境特色", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteEnvironmentFeatures websiteEnvironmentFeatures)
    {
        return toAjax(websiteEnvironmentFeaturesService.insertWebsiteEnvironmentFeatures(websiteEnvironmentFeatures));
    }

    /**
     * 修改环境特色
     */
    @PreAuthorize("@ss.hasPermi('system:environment-features:edit')")
    @Log(title = "环境特色", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteEnvironmentFeatures websiteEnvironmentFeatures)
    {
        return toAjax(websiteEnvironmentFeaturesService.updateWebsiteEnvironmentFeatures(websiteEnvironmentFeatures));
    }

    /**
     * 删除环境特色
     */
    @PreAuthorize("@ss.hasPermi('system:environment-features:remove')")
    @Log(title = "环境特色", businessType = BusinessType.DELETE)
	@DeleteMapping("/{featureIds}")
    public AjaxResult remove(@PathVariable Long[] featureIds)
    {
        return toAjax(websiteEnvironmentFeaturesService.deleteWebsiteEnvironmentFeaturesByFeatureIds(featureIds));
    }

    /**
     * 获取环境特色列表（公开接口�?
     */
    @Anonymous
    @GetMapping("/public/list")
    public AjaxResult getPublicList()
    {
        WebsiteEnvironmentFeatures query = new WebsiteEnvironmentFeatures();
        query.setStatus("0"); // 只查询正常状态的
        List<WebsiteEnvironmentFeatures> list = websiteEnvironmentFeaturesService.selectWebsiteEnvironmentFeaturesList(query);
        return success(list);
    }
}








