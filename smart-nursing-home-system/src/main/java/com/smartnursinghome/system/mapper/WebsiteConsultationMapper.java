package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteConsultation;

/**
 * 网站咨询信息Mapper接口
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
public interface WebsiteConsultationMapper 
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
     * 删除网站咨询信息
     * 
     * @param consultationId 网站咨询信息主键
     * @return 结果
     */
    public int deleteWebsiteConsultationByConsultationId(Long consultationId);

    /**
     * 批量删除网站咨询信息
     * 
     * @param consultationIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteConsultationByConsultationIds(Long[] consultationIds);
}



