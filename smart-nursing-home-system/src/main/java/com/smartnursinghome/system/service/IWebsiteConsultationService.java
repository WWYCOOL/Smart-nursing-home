package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteConsultation;

/**
 * 网站咨询信息Service接口
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
public interface IWebsiteConsultationService 
{
    /**
     * 查询网站咨询信息
     * 
     * @param consultationId 网站咨询信息主键
     * @return 网站咨询信息
     */
    public WebsiteConsultation selectWebsiteConsultationByConsultationId(Long consultationId);

    /**
     * 查询网站咨询信息列表
     * 
     * @param websiteConsultation 网站咨询信息
     * @return 网站咨询信息集合
     */
    public List<WebsiteConsultation> selectWebsiteConsultationList(WebsiteConsultation websiteConsultation);

    /**
     * 新增网站咨询信息
     * 
     * @param websiteConsultation 网站咨询信息
     * @return 结果
     */
    public int insertWebsiteConsultation(WebsiteConsultation websiteConsultation);

    /**
     * 修改网站咨询信息
     * 
     * @param websiteConsultation 网站咨询信息
     * @return 结果
     */
    public int updateWebsiteConsultation(WebsiteConsultation websiteConsultation);

    /**
     * 批量删除网站咨询信息
     * 
     * @param consultationIds 需要删除的网站咨询信息主键集合
     * @return 结果
     */
    public int deleteWebsiteConsultationByConsultationIds(Long[] consultationIds);

    /**
     * 删除网站咨询信息信息
     * 
     * @param consultationId 网站咨询信息主键
     * @return 结果
     */
    public int deleteWebsiteConsultationByConsultationId(Long consultationId);

    /**
     * 回复咨询
     * 
     * @param consultationId 咨询ID
     * @param replyContent 回复内容
     * @param replyUser 回复�?
     * @return 结果
     */
    public int replyConsultation(Long consultationId, String replyContent, String replyUser);
}



