package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteElderlyInfoMapper;
import com.smartnursinghome.system.domain.WebsiteElderlyInfo;
import com.smartnursinghome.system.service.IWebsiteElderlyInfoService;

/**
 * 老人信息Service业务层处�? * 
 * @author ruoyi
 * @date 2023-12-01
 */
@Service
public class WebsiteElderlyInfoServiceImpl implements IWebsiteElderlyInfoService 
{
    @Autowired
    private WebsiteElderlyInfoMapper websiteElderlyInfoMapper;

    /**
     * 查询老人信息
     * 
     * @param elderlyId 老人信息主键
     * @return 老人信息
     */
    @Override
    public WebsiteElderlyInfo selectWebsiteElderlyInfoByElderlyId(Long elderlyId)
    {
        return websiteElderlyInfoMapper.selectWebsiteElderlyInfoByElderlyId(elderlyId);
    }

    /**
     * 查询老人信息列表
     * 
     * @param websiteElderlyInfo 老人信息
     * @return 老人信息
     */
    @Override
    public List<WebsiteElderlyInfo> selectWebsiteElderlyInfoList(WebsiteElderlyInfo websiteElderlyInfo)
    {
        return websiteElderlyInfoMapper.selectWebsiteElderlyInfoList(websiteElderlyInfo);
    }

    /**
     * 新增老人信息
     * 
     * @param websiteElderlyInfo 老人信息
     * @return 结果
     */
    @Override
    public int insertWebsiteElderlyInfo(WebsiteElderlyInfo websiteElderlyInfo)
    {
        websiteElderlyInfo.setCreateTime(DateUtils.getNowDate());
        return websiteElderlyInfoMapper.insertWebsiteElderlyInfo(websiteElderlyInfo);
    }

    /**
     * 修改老人信息
     * 
     * @param websiteElderlyInfo 老人信息
     * @return 结果
     */
    @Override
    public int updateWebsiteElderlyInfo(WebsiteElderlyInfo websiteElderlyInfo)
    {
        websiteElderlyInfo.setUpdateTime(DateUtils.getNowDate());
        return websiteElderlyInfoMapper.updateWebsiteElderlyInfo(websiteElderlyInfo);
    }

    /**
     * 批量删除老人信息
     * 
     * @param elderlyIds 需要删除的老人信息主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteElderlyInfoByElderlyIds(Long[] elderlyIds)
    {
        return websiteElderlyInfoMapper.deleteWebsiteElderlyInfoByElderlyIds(elderlyIds);
    }

    /**
     * 删除老人信息信息
     * 
     * @param elderlyId 老人信息主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteElderlyInfoByElderlyId(Long elderlyId)
    {
        return websiteElderlyInfoMapper.deleteWebsiteElderlyInfoByElderlyId(elderlyId);
    }

    @Override
    public int selectWebsiteElderlyInfoCount()
    {
        return websiteElderlyInfoMapper.selectWebsiteElderlyInfoCount();
    }
}




