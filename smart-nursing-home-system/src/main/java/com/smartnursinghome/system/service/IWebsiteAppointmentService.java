package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteAppointment;

/**
 * 网站预约信息Service接口
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
public interface IWebsiteAppointmentService 
{
    /**
     * 查询网站预约信息
     * 
     * @param appointmentId 网站预约信息主键
     * @return 网站预约信息
     */
    public WebsiteAppointment selectWebsiteAppointmentByAppointmentId(Long appointmentId);

    /**
     * 查询网站预约信息列表
     * 
     * @param websiteAppointment 网站预约信息
     * @return 网站预约信息集合
     */
    public List<WebsiteAppointment> selectWebsiteAppointmentList(WebsiteAppointment websiteAppointment);

    /**
     * 新增网站预约信息
     * 
     * @param websiteAppointment 网站预约信息
     * @return 结果
     */
    public int insertWebsiteAppointment(WebsiteAppointment websiteAppointment);

    /**
     * 修改网站预约信息
     * 
     * @param websiteAppointment 网站预约信息
     * @return 结果
     */
    public int updateWebsiteAppointment(WebsiteAppointment websiteAppointment);

    /**
     * 批量删除网站预约信息
     * 
     * @param appointmentIds 需要删除的网站预约信息主键集合
     * @return 结果
     */
    public int deleteWebsiteAppointmentByAppointmentIds(Long[] appointmentIds);

    /**
     * 删除网站预约信息信息
     * 
     * @param appointmentId 网站预约信息主键
     * @return 结果
     */
    public int deleteWebsiteAppointmentByAppointmentId(Long appointmentId);

    /**
     * 确认预约
     * 
     * @param appointmentId 预约ID
     * @param confirmUser 确认�?
     * @return 结果
     */
    public int confirmAppointment(Long appointmentId, String confirmUser);

    /**
     * 取消预约
     * 
     * @param appointmentId 预约ID
     * @param cancelReason 取消原因
     * @return 结果
     */
    public int cancelAppointment(Long appointmentId, String cancelReason);
}



