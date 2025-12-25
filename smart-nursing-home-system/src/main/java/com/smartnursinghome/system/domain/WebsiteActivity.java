package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.annotation.Excel.ColumnType;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 老人动态记录表 website_activity
 * 
 * @author smartnursinghome
 */
public class WebsiteActivity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 动态ID */
    @Excel(name = "动态序号", cellType = ColumnType.NUMERIC)
    private Long activityId;

    /** 老人ID */
    @Excel(name = "老人ID")
    private Long elderlyId;

    /** 老人姓名 */
    @Excel(name = "老人姓名")
    private String elderlyName;

    /** 动态类型：health-健康报告，fee-费用相关，communication-沟通消息，care-护理记录，photo-生活照片 */
    @Excel(name = "动态类型", readConverterExp = "health=健康报告,fee=费用相关,communication=沟通消息,care=护理记录,photo=生活照片")
    private String activityType;

    /** 动态标题 */
    @Excel(name = "动态标题")
    private String activityTitle;

    /** 动态内容 */
    @Excel(name = "动态内容")
    private String activityContent;

    /** 相关图片URL */
    @Excel(name = "相关图片")
    private String imageUrl;

    /** 动态时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "动态时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date activityTime;

    /** 创建人 */
    @Excel(name = "创建人")
    private String createBy;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 更新人 */
    @Excel(name = "更新人")
    private String updateBy;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    /** 家属ID */
    @Excel(name = "家属ID")
    private Long familyId;

    /** 关联记录ID */
    @Excel(name = "关联记录ID")
    private Long relatedId;

    /** 关联类型 */
    @Excel(name = "关联类型")
    private String relatedType;

    /** 是否已读（0未读 1已读） */
    @Excel(name = "是否已读", readConverterExp = "0=未读,1=已读")
    private String isRead;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public Long getActivityId()
    {
        return activityId;
    }

    public void setActivityId(Long activityId)
    {
        this.activityId = activityId;
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

    public String getActivityType()
    {
        return activityType;
    }

    public void setActivityType(String activityType)
    {
        this.activityType = activityType;
    }

    public String getActivityTitle()
    {
        return activityTitle;
    }

    public void setActivityTitle(String activityTitle)
    {
        this.activityTitle = activityTitle;
    }

    public String getActivityContent()
    {
        return activityContent;
    }

    public void setActivityContent(String activityContent)
    {
        this.activityContent = activityContent;
    }

    public String getImageUrl()
    {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl)
    {
        this.imageUrl = imageUrl;
    }

    public Date getActivityTime()
    {
        return activityTime;
    }

    public void setActivityTime(Date activityTime)
    {
        this.activityTime = activityTime;
    }

    public String getCreateBy()
    {
        return createBy;
    }

    public void setCreateBy(String createBy)
    {
        this.createBy = createBy;
    }

    public Date getCreateTime()
    {
        return createTime;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    public String getUpdateBy()
    {
        return updateBy;
    }

    public void setUpdateBy(String updateBy)
    {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime()
    {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime)
    {
        this.updateTime = updateTime;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    public Long getFamilyId()
    {
        return familyId;
    }

    public void setFamilyId(Long familyId)
    {
        this.familyId = familyId;
    }

    public Long getRelatedId()
    {
        return relatedId;
    }

    public void setRelatedId(Long relatedId)
    {
        this.relatedId = relatedId;
    }

    public String getRelatedType()
    {
        return relatedType;
    }

    public void setRelatedType(String relatedType)
    {
        this.relatedType = relatedType;
    }

    public String getIsRead()
    {
        return isRead;
    }

    public void setIsRead(String isRead)
    {
        this.isRead = isRead;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }
}