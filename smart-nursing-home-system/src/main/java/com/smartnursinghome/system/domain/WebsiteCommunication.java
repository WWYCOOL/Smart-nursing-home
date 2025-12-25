package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 沟通消息对象 website_communication
 * 
 * @author smartnursinghome
 * @date 2024-03-15
 */
public class WebsiteCommunication extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 消息ID */
    private Long messageId;

    /** 老人ID */
    @Excel(name = "老人ID")
    private Long elderlyId;

    /** 家属ID */
    @Excel(name = "家属ID")
    private Long familyId;

    /** 家属姓名 */
    @Excel(name = "家属姓名")
    private String familyName;

    /** 老人姓名 */
    @Excel(name = "老人姓名")
    private String elderlyName;

    /** 发送者类型（family家属 staff护理人员） */
    @Excel(name = "发送者类型", readConverterExp = "family=家属,staff=护理人员")
    private String senderType;

    /** 发送者姓名 */
    @Excel(name = "发送者姓名")
    private String senderName;

    /** 消息内容 */
    @Excel(name = "消息内容")
    private String messageContent;

    /** 消息内容（数据库字段名） */
    @Excel(name = "消息内容")
    private String content;

    /** 消息类型（text文本 image图片 video视频） */
    @Excel(name = "消息类型", readConverterExp = "text=文本,image=图片,video=视频")
    private String messageType;

    /** 相关图片/视频URL */
    @Excel(name = "相关文件")
    private String fileUrl;

    /** 附件路径（数据库字段名） */
    @Excel(name = "附件路径")
    private String attachmentPath;

    /** 发送时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "发送时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date sendTime;

    /** 是否已读（0未读 1已读） */
    @Excel(name = "是否已读", readConverterExp = "0=未读,1=已读")
    private String isRead;

    /** 阅读时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "阅读时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date readTime;

    /** 回复内容 */
    @Excel(name = "回复内容")
    private String replyContent;

    /** 回复时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "回复时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date replyTime;

    /** 状态（0正常 1删除） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=删除")
    private String status;

    public Long getMessageId()
    {
        return messageId;
    }

    public void setMessageId(Long messageId)
    {
        this.messageId = messageId;
    }

    public Long getElderlyId()
    {
        return elderlyId;
    }

    public void setElderlyId(Long elderlyId)
    {
        this.elderlyId = elderlyId;
    }

    public Long getFamilyId()
    {
        return familyId;
    }

    public void setFamilyId(Long familyId)
    {
        this.familyId = familyId;
    }

    public String getFamilyName()
    {
        return familyName;
    }

    public void setFamilyName(String familyName)
    {
        this.familyName = familyName;
    }

    public String getElderlyName()
    {
        return elderlyName;
    }

    public void setElderlyName(String elderlyName)
    {
        this.elderlyName = elderlyName;
    }

    public String getSenderType()
    {
        return senderType;
    }

    public void setSenderType(String senderType)
    {
        this.senderType = senderType;
    }

    public String getSenderName()
    {
        return senderName;
    }

    public void setSenderName(String senderName)
    {
        this.senderName = senderName;
    }

    public String getMessageContent()
    {
        return messageContent;
    }

    public void setMessageContent(String messageContent)
    {
        this.messageContent = messageContent;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public String getMessageType()
    {
        return messageType;
    }

    public void setMessageType(String messageType)
    {
        this.messageType = messageType;
    }

    public String getFileUrl()
    {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl)
    {
        this.fileUrl = fileUrl;
    }

    public String getAttachmentPath()
    {
        return attachmentPath;
    }

    public void setAttachmentPath(String attachmentPath)
    {
        this.attachmentPath = attachmentPath;
    }

    public Date getSendTime()
    {
        return sendTime;
    }

    public void setSendTime(Date sendTime)
    {
        this.sendTime = sendTime;
    }

    public String getIsRead()
    {
        return isRead;
    }

    public void setIsRead(String isRead)
    {
        this.isRead = isRead;
    }

    public Date getReadTime()
    {
        return readTime;
    }

    public void setReadTime(Date readTime)
    {
        this.readTime = readTime;
    }

    public String getReplyContent()
    {
        return replyContent;
    }

    public void setReplyContent(String replyContent)
    {
        this.replyContent = replyContent;
    }

    public Date getReplyTime()
    {
        return replyTime;
    }

    public void setReplyTime(Date replyTime)
    {
        this.replyTime = replyTime;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("messageId", getMessageId())
            .append("elderlyId", getElderlyId())
            .append("familyId", getFamilyId())
            .append("familyName", getFamilyName())
            .append("elderlyName", getElderlyName())
            .append("senderType", getSenderType())
            .append("senderName", getSenderName())
            .append("messageContent", getMessageContent())
            .append("content", getContent())
            .append("messageType", getMessageType())
            .append("fileUrl", getFileUrl())
            .append("attachmentPath", getAttachmentPath())
            .append("sendTime", getSendTime())
            .append("isRead", getIsRead())
            .append("readTime", getReadTime())
            .append("replyContent", getReplyContent())
            .append("replyTime", getReplyTime())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}