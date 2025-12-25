package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteFacilityOverviewMapper;
import com.smartnursinghome.system.domain.WebsiteFacilityOverview;
import com.smartnursinghome.system.service.IWebsiteFacilityOverviewService;

/**
 * 环境概览配置Service业务层处�?
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
@Service
public class WebsiteFacilityOverviewServiceImpl implements IWebsiteFacilityOverviewService 
{
    @Autowired
    private WebsiteFacilityOverviewMapper websiteFacilityOverviewMapper;

    /**
     * 查询环境概览配置
     * 
     * @param overviewId 环境概览配置主键
     * @return 环境概览配置
     */
    @Override
    public WebsiteFacilityOverview selectWebsiteFacilityOverviewByOverviewId(Long overviewId)
    {
        return websiteFacilityOverviewMapper.selectWebsiteFacilityOverviewByOverviewId(overviewId);
    }

    /**
     * 查询环境概览配置列表
     * 
     * @param websiteFacilityOverview 环境概览配置
     * @return 环境概览配置
     */
    @Override
    public List<WebsiteFacilityOverview> selectWebsiteFacilityOverviewList(WebsiteFacilityOverview websiteFacilityOverview)
    {
        return websiteFacilityOverviewMapper.selectWebsiteFacilityOverviewList(websiteFacilityOverview);
    }

    /**
     * 新增环境概览配置
     * 
     * @param websiteFacilityOverview 环境概览配置
     * @return 结果
     */
    @Override
    public int insertWebsiteFacilityOverview(WebsiteFacilityOverview websiteFacilityOverview)
    {
        websiteFacilityOverview.setCreateTime(DateUtils.getNowDate());
        return websiteFacilityOverviewMapper.insertWebsiteFacilityOverview(websiteFacilityOverview);
    }

    /**
     * 修改环境概览配置
     * 
     * @param websiteFacilityOverview 环境概览配置
     * @return 结果
     */
    @Override
    public int updateWebsiteFacilityOverview(WebsiteFacilityOverview websiteFacilityOverview)
    {
        websiteFacilityOverview.setUpdateTime(DateUtils.getNowDate());
        return websiteFacilityOverviewMapper.updateWebsiteFacilityOverview(websiteFacilityOverview);
    }

    /**
     * 批量删除环境概览配置
     * 
     * @param overviewIds 需要删除的环境概览配置主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFacilityOverviewByOverviewIds(Long[] overviewIds)
    {
        return websiteFacilityOverviewMapper.deleteWebsiteFacilityOverviewByOverviewIds(overviewIds);
    }

    /**
     * 删除环境概览配置信息
     * 
     * @param overviewId 环境概览配置主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFacilityOverviewByOverviewId(Long overviewId)
    {
        return websiteFacilityOverviewMapper.deleteWebsiteFacilityOverviewByOverviewId(overviewId);
    }

    /**
     * 获取当前环境概览配置
     * 
     * @return 环境概览配置
     */
    @Override
    public WebsiteFacilityOverview getCurrentOverview()
    {
        WebsiteFacilityOverview queryParam = new WebsiteFacilityOverview();
        queryParam.setStatus("0"); // 只查询正常状态的概览
        List<WebsiteFacilityOverview> list = websiteFacilityOverviewMapper.selectWebsiteFacilityOverviewList(queryParam);
        return list.isEmpty() ? null : list.get(0);
    }
}











