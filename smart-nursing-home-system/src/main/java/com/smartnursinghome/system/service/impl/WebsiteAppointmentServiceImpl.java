package com.smartnursinghome.system.service.impl;

import java.util.Date;
import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteAppointmentMapper;
import com.smartnursinghome.system.domain.WebsiteAppointment;
import com.smartnursinghome.system.service.IWebsiteAppointmentService;

/**
 * 网站预约信息Service业务层处�?
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
@Service
public class WebsiteAppointmentServiceImpl implements IWebsiteAppointmentService 
{
    @Autowired
    private WebsiteAppointmentMapper websiteAppointmentMapper;

    /**
     * 查询网站预约信息
     * 
     * @param appointmentId 网站预约信息主键
     * @return 网站预约信息
     */
    @Override
    public WebsiteAppointment selectWebsiteAppointmentByAppointmentId(Long appointmentId)
    {
        return websiteAppointmentMapper.selectWebsiteAppointmentByAppointmentId(appointmentId);
    }

    /**
     * 查询网站预约信息列表
     * 
     * @param websiteAppointment 网站预约信息
     * @return 网站预约信息
     */
    @Override
    public List<WebsiteAppointment> selectWebsiteAppointmentList(WebsiteAppointment websiteAppointment)
    {
        return websiteAppointmentMapper.selectWebsiteAppointmentList(websiteAppointment);
    }

    /**
     * 新增网站预约信息
     * 
     * @param websiteAppointment 网站预约信息
     * @return 结果
     */
    @Override
    public int insertWebsiteAppointment(WebsiteAppointment websiteAppointment)
    {
        websiteAppointment.setCreateTime(DateUtils.getNowDate());
        return websiteAppointmentMapper.insertWebsiteAppointment(websiteAppointment);
    }

    /**
     * 修改网站预约信息
     * 
     * @param websiteAppointment 网站预约信息
     * @return 结果
     */
    @Override
    public int updateWebsiteAppointment(WebsiteAppointment websiteAppointment)
    {
        websiteAppointment.setUpdateTime(DateUtils.getNowDate());
        return websiteAppointmentMapper.updateWebsiteAppointment(websiteAppointment);
    }

    /**
     * 批量删除网站预约信息
     * 
     * @param appointmentIds 需要删除的网站预约信息主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteAppointmentByAppointmentIds(Long[] appointmentIds)
    {
        return websiteAppointmentMapper.deleteWebsiteAppointmentByAppointmentIds(appointmentIds);
    }

    /**
     * 删除网站预约信息信息
     * 
     * @param appointmentId 网站预约信息主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteAppointmentByAppointmentId(Long appointmentId)
    {
        return websiteAppointmentMapper.deleteWebsiteAppointmentByAppointmentId(appointmentId);
    }

    /**
     * 确认预约
     * 
     * @param appointmentId 预约ID
     * @param confirmUser 确认�?
     * @return 结果
     */
    @Override
    public int confirmAppointment(Long appointmentId, String confirmUser)
    {
        WebsiteAppointment appointment = new WebsiteAppointment();
        appointment.setAppointmentId(appointmentId);
        appointment.setStatus("1"); // 已确�?
        appointment.setConfirmTime(new Date());
        appointment.setConfirmUser(confirmUser);
        appointment.setUpdateTime(DateUtils.getNowDate());
        return websiteAppointmentMapper.updateWebsiteAppointment(appointment);
    }

    /**
     * 取消预约
     * 
     * @param appointmentId 预约ID
     * @param cancelReason 取消原因
     * @return 结果
     */
    @Override
    public int cancelAppointment(Long appointmentId, String cancelReason)
    {
        WebsiteAppointment appointment = new WebsiteAppointment();
        appointment.setAppointmentId(appointmentId);
        appointment.setStatus("2"); // 已取�?
        appointment.setCancelReason(cancelReason);
        appointment.setUpdateTime(DateUtils.getNowDate());
        return websiteAppointmentMapper.updateWebsiteAppointment(appointment);
    }
}



