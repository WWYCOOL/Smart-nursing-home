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
import com.smartnursinghome.common.annotation.Anonymous;
import com.smartnursinghome.common.annotation.Log;
import com.smartnursinghome.common.core.controller.BaseController;
import com.smartnursinghome.common.core.domain.AjaxResult;
import com.smartnursinghome.common.enums.BusinessType;
import com.smartnursinghome.system.domain.WebsiteCarousel;
import com.smartnursinghome.system.service.IWebsiteCarouselService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 轮播图Controller
 * 
 * @author ruoyi
 * @date 2024-03-15
 */
@RestController
@RequestMapping("/website/carousel")
public class WebsiteCarouselController extends BaseController
{
    @Autowired
    private IWebsiteCarouselService websiteCarouselService;

    /**
     * 查询轮播图列表
     */
    @PreAuthorize("@ss.hasPermi('website:carousel:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteCarousel websiteCarousel)
    {
        startPage();
        List<WebsiteCarousel> list = websiteCarouselService.selectWebsiteCarouselList(websiteCarousel);
        return getDataTable(list);
    }

    /**
     * 公开查询轮播图列表（无需权限）
     */
    @Anonymous
    @GetMapping("/public/list")
    public AjaxResult publicList(WebsiteCarousel websiteCarousel)
    {
        // 只查询状态为正常的轮播图
        websiteCarousel.setStatus("0");
        List<WebsiteCarousel> list = websiteCarouselService.selectWebsiteCarouselList(websiteCarousel);
        return success(list);
    }

    /**
     * 导出轮播图列表
     */
    @PreAuthorize("@ss.hasPermi('website:carousel:export')")
    @Log(title = "轮播图", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteCarousel websiteCarousel)
    {
        List<WebsiteCarousel> list = websiteCarouselService.selectWebsiteCarouselList(websiteCarousel);
        ExcelUtil<WebsiteCarousel> util = new ExcelUtil<WebsiteCarousel>(WebsiteCarousel.class);
        util.exportExcel(response, list, "轮播图数据");
    }

    /**
     * 获取轮播图详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:carousel:query')")
    @GetMapping(value = "/{carouselId}")
    public AjaxResult getInfo(@PathVariable("carouselId") Long carouselId)
    {
        return success(websiteCarouselService.selectWebsiteCarouselByCarouselId(carouselId));
    }

    /**
     * 新增轮播图
     */
    @PreAuthorize("@ss.hasPermi('website:carousel:add')")
    @Log(title = "轮播图", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteCarousel websiteCarousel)
    {
        return toAjax(websiteCarouselService.insertWebsiteCarousel(websiteCarousel));
    }

    /**
     * 修改轮播图
     */
    @PreAuthorize("@ss.hasPermi('website:carousel:edit')")
    @Log(title = "轮播图", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteCarousel websiteCarousel)
    {
        return toAjax(websiteCarouselService.updateWebsiteCarousel(websiteCarousel));
    }

    /**
     * 删除轮播图
     */
    @PreAuthorize("@ss.hasPermi('website:carousel:remove')")
    @Log(title = "轮播图", businessType = BusinessType.DELETE)
	@DeleteMapping("/{carouselIds}")
    public AjaxResult remove(@PathVariable Long[] carouselIds)
    {
        return toAjax(websiteCarouselService.deleteWebsiteCarouselByCarouselIds(carouselIds));
    }
}