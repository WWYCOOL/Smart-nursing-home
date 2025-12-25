package com.smartnursinghome.web.controller.website;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.smartnursinghome.common.annotation.Anonymous;
import com.smartnursinghome.common.core.controller.BaseController;
import com.smartnursinghome.common.core.domain.AjaxResult;
import com.smartnursinghome.system.service.IWebsiteElderlyInfoService;
import com.smartnursinghome.system.service.IWebsiteFamilyUserService;
import com.smartnursinghome.system.service.IWebsiteHealthReportService;
import com.smartnursinghome.system.service.IWebsiteNewsService;

/**
 * 网站统计Controller
 * 
 * @author ruoyi
 * @date 2025-01-15
 */
@RestController
@RequestMapping("/website/statistics")
public class WebsiteStatisticsController extends BaseController
{
    @Autowired
    private IWebsiteElderlyInfoService websiteElderlyInfoService;
    
    @Autowired
    private IWebsiteFamilyUserService websiteFamilyUserService;
    
    @Autowired
    private IWebsiteHealthReportService websiteHealthReportService;
    
    @Autowired
    private IWebsiteNewsService websiteNewsService;

    /**
     * 获取系统概览统计数据
     */
    @Anonymous
    @GetMapping("/overview")
    public AjaxResult getOverviewStatistics()
    {
        try {
            Map<String, Object> result = new HashMap<>();
            
            // 获取老人数量
            int elderlyCount = websiteElderlyInfoService.selectWebsiteElderlyInfoCount();
            result.put("elderlyCount", elderlyCount);
            
            // 获取家属用户数量
            int familyCount = websiteFamilyUserService.selectWebsiteFamilyUserCount();
            result.put("familyCount", familyCount);
            
            // 获取健康报告数量
            int healthReports = websiteHealthReportService.selectWebsiteHealthReportCount();
            result.put("healthReports", healthReports);
            
            // 获取新闻动态数量
            int newsCount = websiteNewsService.selectWebsiteNewsCount();
            result.put("newsCount", newsCount);
            
            return success(result);
        } catch (Exception e) {
            return error("获取统计数据失败：" + e.getMessage());
        }
    }
}