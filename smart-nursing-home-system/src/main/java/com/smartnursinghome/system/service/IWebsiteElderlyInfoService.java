package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteElderlyInfo;

/**
 * 老人信息Service接口
 * 
 * @author ruoyi
 * @date 2023-12-01
 */
public interface IWebsiteElderlyInfoService 
{
    /**
     * 查询老人信息
     * 
     * @param elderlyId 老人信息主键
     * @return 老人信息
     */
    public WebsiteElderlyInfo selectWebsiteElderlyInfoByElderlyId(Long elderlyId);

    /**
     * 查询老人信息列表
     * 
     * @param websiteElderlyInfo 老人信息
     * @return 老人信息集合
     */
    public List<WebsiteElderlyInfo> selectWebsiteElderlyInfoList(WebsiteElderlyInfo websiteElderlyInfo);

    /**
     * 新增老人信息
     * 
     * @param websiteElderlyInfo 老人信息
     * @return 结果
     */
    public int insertWebsiteElderlyInfo(WebsiteElderlyInfo websiteElderlyInfo);

    /**
     * 修改老人信息
     * 
     * @param websiteElderlyInfo 老人信息
     * @return 结果
     */
    public int updateWebsiteElderlyInfo(WebsiteElderlyInfo websiteElderlyInfo);

    /**
     * 批量删除老人信息
     * 
     * @param elderlyIds 需要删除的老人信息主键集合
     * @return 结果
     */
    public int deleteWebsiteElderlyInfoByElderlyIds(Long[] elderlyIds);

    /**
     * 删除老人信息信息
     * 
     * @param elderlyId 老人信息主键
     * @return 结果
     */
    public int deleteWebsiteElderlyInfoByElderlyId(Long elderlyId);

    /**
     * 查询老人信息总数
     * 
     * @return 老人信息总数
     */
    public int selectWebsiteElderlyInfoCount();
}




