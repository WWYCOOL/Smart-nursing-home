package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 在线咨询对象 website_consultation
 * 
 * @author smartnursinghome
 * @date 2024-03-15
 */
public class WebsiteConsultation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 咨询ID */
    private Long consultationId;

    /** 咨询人姓名 */
    @Excel(name = "咨询人姓名")
    private String name;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 与老人关系 */
    @Excel(name = "与老人关系")
    private String relationship;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 咨询类型 */
    @Excel(name = "咨询类型")
    private String consultationType;

    /** 咨询主题 */
    @Excel(name = "咨询主题")
    private String subject;

    /** 咨询内容 */
    @Excel(name = "咨询内容")
    private String message;

    /** 处理状态（0待处理 1已处理 2已回复） */
    @Excel(name = "处理状态", readConverterExp = "0=待处理,1=已处理,2=已回复")
    private String status;

    /** 回复内容 */
    @Excel(name = "回复内容")
    private String replyContent;

    /** 回复人 */
    @Excel(name = "回复人")
    private String replyUser;

    /** 回复时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "回复时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date replyTime;

    /** 处理人 */
    @Excel(name = "处理人")
    private String handler;

    /** 处理时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "处理时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date handleTime;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    public Long getConsultationId()
    {
        return consultationId;
    }

    public void setConsultationId(Long consultationId)
    {
        this.consultationId = consultationId;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getRelationship()
    {
        return relationship;
    }

    public void setRelationship(String relationship)
    {
        this.relationship = relationship;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getConsultationType()
    {
        return consultationType;
    }

    public void setConsultationType(String consultationType)
    {
        this.consultationType = consultationType;
    }

    public String getSubject()
    {
        return subject;
    }

    public void setSubject(String subject)
    {
        this.subject = subject;
    }

    public String getMessage()
    {
        return message;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getReplyContent()
    {
        return replyContent;
    }

    public void setReplyContent(String replyContent)
    {
        this.replyContent = replyContent;
    }

    public String getReplyUser()
    {
        return replyUser;
    }

    public void setReplyUser(String replyUser)
    {
        this.replyUser = replyUser;
    }

    public Date getReplyTime()
    {
        return replyTime;
    }

    public void setReplyTime(Date replyTime)
    {
        this.replyTime = replyTime;
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

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("consultationId", getConsultationId())
            .append("name", getName())
            .append("phone", getPhone())
            .append("relationship", getRelationship())
            .append("email", getEmail())
            .append("consultationType", getConsultationType())
            .append("subject", getSubject())
            .append("message", getMessage())
            .append("status", getStatus())
            .append("replyContent", getReplyContent())
            .append("replyTime", getReplyTime())
            .append("handler", getHandler())
            .append("handleTime", getHandleTime())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}