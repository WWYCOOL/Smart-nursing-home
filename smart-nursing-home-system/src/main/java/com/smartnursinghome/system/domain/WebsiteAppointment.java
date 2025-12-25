package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 网站预约信息对象 website_appointment
 * 
 * @author smartnursinghome
 * @date 2023-01-01
 */
public class WebsiteAppointment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 预约ID */
    private Long appointmentId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 性别 */
    @Excel(name = "性别")
    private String gender;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 年龄 */
    @Excel(name = "年龄")
    private Integer age;

    /** 预约时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "预约时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date appointmentTime;

    /** 参观人数 */
    @Excel(name = "参观人数")
    private Integer visitorCount;

    /** 与老人关系 */
    @Excel(name = "与老人关系")
    private String relationship;

    /** 健康状况 */
    @Excel(name = "健康状况")
    private String healthStatus;

    /** 特殊需求 */
    @Excel(name = "特殊需求")
    private String specialNeeds;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    /** 预约状态（0待确认 1已确认 2已取消 3已完成） */
    @Excel(name = "预约状态", readConverterExp = "0=待确认,1=已确认,2=已取消,3=已完成")
    private String status;

    /** 处理人 */
    @Excel(name = "处理人")
    private String handler;

    /** 处理时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "处理时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date handleTime;

    /** 处理备注 */
    @Excel(name = "处理备注")
    private String handleRemark;

    /** 确认时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "确认时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date confirmTime;

    /** 确认人 */
    @Excel(name = "确认人")
    private String confirmUser;

    /** 取消原因 */
    @Excel(name = "取消原因")
    private String cancelReason;

    public Long getAppointmentId()
    {
        return appointmentId;
    }

    public void setAppointmentId(Long appointmentId)
    {
        this.appointmentId = appointmentId;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getGender()
    {
        return gender;
    }

    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public Integer getAge()
    {
        return age;
    }

    public void setAge(Integer age)
    {
        this.age = age;
    }

    public Date getAppointmentTime()
    {
        return appointmentTime;
    }

    public void setAppointmentTime(Date appointmentTime)
    {
        this.appointmentTime = appointmentTime;
    }

    public Integer getVisitorCount()
    {
        return visitorCount;
    }

    public void setVisitorCount(Integer visitorCount)
    {
        this.visitorCount = visitorCount;
    }

    public String getRelationship()
    {
        return relationship;
    }

    public void setRelationship(String relationship)
    {
        this.relationship = relationship;
    }

    public String getHealthStatus()
    {
        return healthStatus;
    }

    public void setHealthStatus(String healthStatus)
    {
        this.healthStatus = healthStatus;
    }

    public String getSpecialNeeds()
    {
        return specialNeeds;
    }

    public void setSpecialNeeds(String specialNeeds)
    {
        this.specialNeeds = specialNeeds;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getHandler()
    {
        return handler;
    }

    public void setHandler(String handler)
    {
        this.handler = handler;
    }

    public Date getHandleTime()
    {
        return handleTime;
    }

    public void setHandleTime(Date handleTime)
    {
        this.handleTime = handleTime;
    }

    public String getHandleRemark()
    {
        return handleRemark;
    }

    public void setHandleRemark(String handleRemark)
    {
        this.handleRemark = handleRemark;
    }

    public Date getConfirmTime()
    {
        return confirmTime;
    }

    public void setConfirmTime(Date confirmTime)
    {
        this.confirmTime = confirmTime;
    }

    public String getConfirmUser()
    {
        return confirmUser;
    }

    public void setConfirmUser(String confirmUser)
    {
        this.confirmUser = confirmUser;
    }

    public String getCancelReason()
    {
        return cancelReason;
    }

    public void setCancelReason(String cancelReason)
    {
        this.cancelReason = cancelReason;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("appointmentId", getAppointmentId())
            .append("name", getName())
            .append("gender", getGender())
            .append("phone", getPhone())
            .append("age", getAge())
            .append("appointmentTime", getAppointmentTime())
            .append("visitorCount", getVisitorCount())
            .append("relationship", getRelationship())
            .append("healthStatus", getHealthStatus())
            .append("specialNeeds", getSpecialNeeds())
            .append("remark", getRemark())
            .append("status", getStatus())
            .append("handler", getHandler())
            .append("handleTime", getHandleTime())
            .append("handleRemark", getHandleRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}