package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 意见反馈对象 website_feedback
 * 
 * @author smartnursinghome
 * @date 2024-03-15
 */
public class WebsiteFeedback extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 反馈ID */
    private Long feedbackId;

    /** 反馈类型 */
    @Excel(name = "反馈类型")
    private String feedbackType;

    /** 反馈标题 */
    @Excel(name = "反馈标题")
    private String title;

    /** 反馈内容 */
    @Excel(name = "反馈内容")
    private String content;

    /** 关联老人ID（如果是家属反馈） */
    @Excel(name = "老人ID")
    private Long elderlyId;

    /** 老人姓名 */
    @Excel(name = "老人姓名")
    private String elderlyName;

    /** 处理状态：0-待处理，1-处理中，2-已处理，3-已关闭 */
    @Excel(name = "处理状态", readConverterExp = "0=待处理,1=处理中,2=已处理,3=已关闭")
    private String feedbackStatus;

    /** 优先级：1-低，2-中，3-高，4-紧急 */
    @Excel(name = "优先级", readConverterExp = "1=低,2=中,3=高,4=紧急")
    private String priority;

    /** 联系人姓名 */
    @Excel(name = "联系人姓名")
    private String contactName;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String contactPhone;

    /** 联系邮箱 */
    @Excel(name = "联系邮箱")
    private String contactEmail;

    /** 处理状态（0待处理 1处理中 2已处理 3已关闭） */
    @Excel(name = "处理状态", readConverterExp = "0=待处理,1=处理中,2=已处理,3=已关闭")
    private String status;

    /** 处理人 */
    @Excel(name = "处理人")
    private String handler;

    /** 处理时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "处理时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date handleTime;

    /** 处理结果 */
    @Excel(name = "处理结果")
    private String handleResult;

    /** 处理备注 */
    @Excel(name = "处理备注")
    private String handleRemark;

    /** 满意度评分（1-5分） */
    @Excel(name = "满意度评分")
    private Integer satisfactionScore;

    /** 满意度评价 */
    @Excel(name = "满意度评价")
    private String satisfactionComment;

    /** 回复内容 */
    @Excel(name = "回复内容")
    private String replyContent;

    /** 回复人 */
    @Excel(name = "回复人")
    private String replyBy;

    /** 回复时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "回复时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date replyTime;

    /** 处理人（流程处理） */
    @Excel(name = "处理人（流程）")
    private String processBy;

    /** 处理时间（流程处理） */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "处理时间（流程）", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date processTime;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    public Long getFeedbackId()
    {
        return feedbackId;
    }

    public void setFeedbackId(Long feedbackId)
    {
        this.feedbackId = feedbackId;
    }

    public String getFeedbackType()
    {
        return feedbackType;
    }

    public void setFeedbackType(String feedbackType)
    {
        this.feedbackType = feedbackType;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public Long getElderlyId()
    {
        return elderlyId;
    }

    public void setElderlyId(Long elderlyId)
    {
        this.elderlyId = elderlyId;
    }

    public String getElderlyName()
    {
        return elderlyName;
    }

    public void setElderlyName(String elderlyName)
    {
        this.elderlyName = elderlyName;
    }

    public String getFeedbackStatus()
    {
        return feedbackStatus;
    }

    public void setFeedbackStatus(String feedbackStatus)
    {
        this.feedbackStatus = feedbackStatus;
    }

    public String getPriority()
    {
        return priority;
    }

    public void setPriority(String priority)
    {
        this.priority = priority;
    }

    public String getContactName()
    {
        return contactName;
    }

    public void setContactName(String contactName)
    {
        this.contactName = contactName;
    }

    public String getContactPhone()
    {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone)
    {
        this.contactPhone = contactPhone;
    }

    public String getContactEmail()
    {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail)
    {
        this.contactEmail = contactEmail;
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

    public String getHandleResult()
    {
        return handleResult;
    }

    public void setHandleResult(String handleResult)
    {
        this.handleResult = handleResult;
    }

    public String getHandleRemark()
    {
        return handleRemark;
    }

    public void setHandleRemark(String handleRemark)
    {
        this.handleRemark = handleRemark;
    }

    public Integer getSatisfactionScore()
    {
        return satisfactionScore;
    }

    public void setSatisfactionScore(Integer satisfactionScore)
    {
        this.satisfactionScore = satisfactionScore;
    }

    public String getSatisfactionComment()
    {
        return satisfactionComment;
    }

    public void setSatisfactionComment(String satisfactionComment)
    {
        this.satisfactionComment = satisfactionComment;
    }

    public String getReplyContent()
    {
        return replyContent;
    }

    public void setReplyContent(String replyContent)
    {
        this.replyContent = replyContent;
    }

    public String getReplyBy()
    {
        return replyBy;
    }

    public void setReplyBy(String replyBy)
    {
        this.replyBy = replyBy;
    }

    public Date getReplyTime()
    {
        return replyTime;
    }

    public void setReplyTime(Date replyTime)
    {
        this.replyTime = replyTime;
    }

    public String getProcessBy()
    {
        return processBy;
    }

    public void setProcessBy(String processBy)
    {
        this.processBy = processBy;
    }

    public Date getProcessTime()
    {
        return processTime;
    }

    public void setProcessTime(Date processTime)
    {
        this.processTime = processTime;
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
            .append("feedbackId", getFeedbackId())
            .append("feedbackType", getFeedbackType())
            .append("title", getTitle())
            .append("content", getContent())
            .append("elderlyId", getElderlyId())
            .append("elderlyName", getElderlyName())
            .append("feedbackStatus", getFeedbackStatus())
            .append("priority", getPriority())
            .append("contactName", getContactName())
            .append("contactPhone", getContactPhone())
            .append("contactEmail", getContactEmail())
            .append("status", getStatus())
            .append("handler", getHandler())
            .append("handleTime", getHandleTime())
            .append("handleResult", getHandleResult())
            .append("handleRemark", getHandleRemark())
            .append("satisfactionScore", getSatisfactionScore())
            .append("satisfactionComment", getSatisfactionComment())
            .append("replyContent", getReplyContent())
            .append("replyTime", getReplyTime())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}