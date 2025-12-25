package com.smartnursinghome.system.service.impl;

import java.util.Date;
import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteConsultationMapper;
import com.smartnursinghome.system.domain.WebsiteConsultation;
import com.smartnursinghome.system.service.IWebsiteConsultationService;

/**
 * 网站咨询信息Service业务层处�?
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
@Service
public class WebsiteConsultationServiceImpl implements IWebsiteConsultationService 
{
    @Autowired
    private WebsiteConsultationMapper websiteConsultationMapper;

    /**
     * 查询网站咨询信息
     * 
     * @param consultationId 网站咨询信息主键
     * @return 网站咨询信息
     */
    @Override
    public WebsiteConsultation selectWebsiteConsultationByConsultationId(Long consultationId)
    {
        return websiteConsultationMapper.selectWebsiteConsultationByConsultationId(consultationId);
    }

    /**
     * 查询网站咨询信息列表
     * 
     * @param websiteConsultation 网站咨询信息
     * @return 网站咨询信息
     */
    @Override
    public List<WebsiteConsultation> selectWebsiteConsultationList(WebsiteConsultation websiteConsultation)
    {
        return websiteConsultationMapper.selectWebsiteConsultationList(websiteConsultation);
    }

    /**
     * 新增网站咨询信息
     * 
     * @param websiteConsultation 网站咨询信息
     * @return 结果
     */
    @Override
    public int insertWebsiteConsultation(WebsiteConsultation websiteConsultation)
    {
        websiteConsultation.setCreateTime(DateUtils.getNowDate());
        return websiteConsultationMapper.insertWebsiteConsultation(websiteConsultation);
    }

    /**
     * 修改网站咨询信息
     * 
     * @param websiteConsultation 网站咨询信息
     * @return 结果
     */
    @Override
    public int updateWebsiteConsultation(WebsiteConsultation websiteConsultation)
    {
        websiteConsultation.setUpdateTime(DateUtils.getNowDate());
        return websiteConsultationMapper.updateWebsiteConsultation(websiteConsultation);
    }

    /**
     * 批量删除网站咨询信息
     * 
     * @param consultationIds 需要删除的网站咨询信息主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteConsultationByConsultationIds(Long[] consultationIds)
    {
        return websiteConsultationMapper.deleteWebsiteConsultationByConsultationIds(consultationIds);
    }

    /**
     * 删除网站咨询信息信息
     * 
     * @param consultationId 网站咨询信息主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteConsultationByConsultationId(Long consultationId)
    {
        return websiteConsultationMapper.deleteWebsiteConsultationByConsultationId(consultationId);
    }

    /**
     * 回复咨询
     * 
     * @param consultationId 咨询ID
     * @param replyContent 回复内容
     * @param replyUser 回复�?
     * @return 结果
     */
    @Override
    public int replyConsultation(Long consultationId, String replyContent, String replyUser)
    {
        WebsiteConsultation consultation = new WebsiteConsultation();
        consultation.setConsultationId(consultationId);
        consultation.setReplyContent(replyContent);
        consultation.setReplyUser(replyUser);
        consultation.setReplyTime(new Date());
        consultation.setStatus("2"); // 已回�?
        consultation.setUpdateTime(DateUtils.getNowDate());
        return websiteConsultationMapper.updateWebsiteConsultation(consultation);
    }
}



