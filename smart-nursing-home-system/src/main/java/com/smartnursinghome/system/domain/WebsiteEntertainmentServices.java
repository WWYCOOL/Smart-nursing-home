package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 娱乐服务对象 website_entertainment_services
 * 
 * @author smartnursinghome
 * @date 2024-03-15
 */
public class WebsiteEntertainmentServices extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 活动ID */
    private Long activityId;

    /** 活动名称 */
    @Excel(name = "活动名称")
    private String activityName;

    /** 活动描述 */
    @Excel(name = "活动描述")
    private String activityDescription;

    /** 活动类型 */
    @Excel(name = "活动类型")
    private String activityType;

    /** 分类ID */
    @Excel(name = "分类ID")
    private Long categoryId;

    /** 分类名称 */
    @Excel(name = "分类名称")
    private String categoryName;

    /** 分类图标 */
    @Excel(name = "分类图标")
    private String categoryIcon;

    /** 活动时间 */
    @Excel(name = "活动时间")
    private String activityTime;

    /** 活动地点 */
    @Excel(name = "活动地点")
    private String activityLocation;

    /** 参与人数限制 */
    @Excel(name = "参与人数限制")
    private Integer maxParticipants;

    /** 活动费用 */
    @Excel(name = "活动费用")
    private String activityFee;

    /** 活动图片 */
    @Excel(name = "活动图片")
    private String activityImage;

    /** 活动内容 */
    @Excel(name = "活动内容")
    private String activityContent;

    /** 注意事项 */
    @Excel(name = "注意事项")
    private String precautions;

    /** 负责人 */
    @Excel(name = "负责人")
    private String organizer;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String contactPhone;

    /** 排序 */
    @Excel(name = "排序")
    private Long sortOrder;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setActivityId(Long activityId) 
    {
        this.activityId = activityId;
    }

    public Long getActivityId() 
    {
        return activityId;
    }

    public void setActivityName(String activityName) 
    {
        this.activityName = activityName;
    }

    public String getActivityName() 
    {
        return activityName;
    }

    public void setActivityDescription(String activityDescription) 
    {
        this.activityDescription = activityDescription;
    }

    public String getActivityDescription() 
    {
        return activityDescription;
    }

    public void setActivityType(String activityType) 
    {
        this.activityType = activityType;
    }

    public String getActivityType() 
    {
        return activityType;
    }

    public void setCategoryId(Long categoryId) 
    {
        this.categoryId = categoryId;
    }

    public Long getCategoryId() 
    {
        return categoryId;
    }

    public String getCategoryName() 
    {
        return categoryName;
    }

    public void setCategoryName(String categoryName) 
    {
        this.categoryName = categoryName;
    }

    public String getCategoryIcon() 
    {
        return categoryIcon;
    }

    public void setCategoryIcon(String categoryIcon) 
    {
        this.categoryIcon = categoryIcon;
    }

    public void setActivityTime(String activityTime) 
    {
        this.activityTime = activityTime;
    }

    public String getActivityTime() 
    {
        return activityTime;
    }

    public void setActivityLocation(String activityLocation) 
    {
        this.activityLocation = activityLocation;
    }

    public String getActivityLocation() 
    {
        return activityLocation;
    }

    public void setMaxParticipants(Integer maxParticipants) 
    {
        this.maxParticipants = maxParticipants;
    }

    public Integer getMaxParticipants() 
    {
        return maxParticipants;
    }

    public void setActivityFee(String activityFee) 
    {
        this.activityFee = activityFee;
    }

    public String getActivityFee() 
    {
        return activityFee;
    }

    public void setActivityImage(String activityImage) 
    {
        this.activityImage = activityImage;
    }

    public String getActivityImage() 
    {
        return activityImage;
    }

    public void setActivityContent(String activityContent) 
    {
        this.activityContent = activityContent;
    }

    public String getActivityContent() 
    {
        return activityContent;
    }

    public void setPrecautions(String precautions) 
    {
        this.precautions = precautions;
    }

    public String getPrecautions() 
    {
        return precautions;
    }

    public void setOrganizer(String organizer) 
    {
        this.organizer = organizer;
    }

    public String getOrganizer() 
    {
        return organizer;
    }

    public void setContactPhone(String contactPhone) 
    {
        this.contactPhone = contactPhone;
    }

    public String getContactPhone() 
    {
        return contactPhone;
    }

    public void setSortOrder(Long sortOrder) 
    {
        this.sortOrder = sortOrder;
    }

    public Long getSortOrder() 
    {
        return sortOrder;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("activityId", getActivityId())
            .append("activityName", getActivityName())
            .append("activityDescription", getActivityDescription())
            .append("activityType", getActivityType())
            .append("categoryId", getCategoryId())
            .append("categoryName", getCategoryName())
            .append("categoryIcon", getCategoryIcon())
            .append("activityTime", getActivityTime())
            .append("activityLocation", getActivityLocation())
            .append("maxParticipants", getMaxParticipants())
            .append("activityFee", getActivityFee())
            .append("activityImage", getActivityImage())
            .append("activityContent", getActivityContent())
            .append("precautions", getPrecautions())
            .append("organizer", getOrganizer())
            .append("contactPhone", getContactPhone())
            .append("sortOrder", getSortOrder())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}