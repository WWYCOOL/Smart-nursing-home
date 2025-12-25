package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteHealthReport;

/**
 * 健康报告Service接口
 * 
 * @author ruoyi
 * @date 2023-12-01
 */
public interface IWebsiteHealthReportService 
{
    /**
     * 查询健康报告
     * 
     * @param reportId 健康报告主键
     * @return 健康报告
     */
    public WebsiteHealthReport selectWebsiteHealthReportByReportId(Long reportId);

    /**
     * 查询健康报告列表
     * 
     * @param websiteHealthReport 健康报告
     * @return 健康报告集合
     */
    public List<WebsiteHealthReport> selectWebsiteHealthReportList(WebsiteHealthReport websiteHealthReport);

    /**
     * 新增健康报告
     * 
     * @param websiteHealthReport 健康报告
     * @return 结果
     */
    public int insertWebsiteHealthReport(WebsiteHealthReport websiteHealthReport);

    /**
     * 修改健康报告
     * 
     * @param websiteHealthReport 健康报告
     * @return 结果
     */
    public int updateWebsiteHealthReport(WebsiteHealthReport websiteHealthReport);

    /**
     * 批量删除健康报告
     * 
     * @param reportIds 需要删除的健康报告主键集合
     * @return 结果
     */
    public int deleteWebsiteHealthReportByReportIds(Long[] reportIds);

    /**
     * 删除健康报告信息
     * 
     * @param reportId 健康报告主键
     * @return 结果
     */
    public int deleteWebsiteHealthReportByReportId(Long reportId);
    
    /**
     * 根据家属ID获取最近一次健康报�?
     * 
     * @param familyId 家属ID
     * @return 最近一次健康报�?
     */
    public WebsiteHealthReport getLatestHealthReportByFamilyId(Long familyId);

    /**
     * 查询健康报告总数
     * 
     * @return 健康报告总数
     */
    public int selectWebsiteHealthReportCount();
}


