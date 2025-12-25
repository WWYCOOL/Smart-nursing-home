package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 设施概览对象 website_facility_overview
 * 
 * @author smartnursinghome
 * @date 2024-03-15
 */
public class WebsiteFacilityOverview extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 概览ID */
    private Long overviewId;

    /** 概览标题 */
    @Excel(name = "概览标题")
    private String overviewTitle;

    /** 概览描述 */
    @Excel(name = "概览描述")
    private String overviewDescription;

    /** 概览内容 */
    @Excel(name = "概览内容")
    private String overviewContent;

    /** 概览图片 */
    @Excel(name = "概览图片")
    private String overviewImage;

    /** 概览类型 */
    @Excel(name = "概览类型")
    private String overviewType;

    /** 排序 */
    @Excel(name = "排序")
    private Long sortOrder;

    /** 状态 */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setOverviewId(Long overviewId) 
    {
        this.overviewId = overviewId;
    }

    public Long getOverviewId() 
    {
        return overviewId;
    }

    public void setOverviewTitle(String overviewTitle) 
    {
        this.overviewTitle = overviewTitle;
    }

    public String getOverviewTitle() 
    {
        return overviewTitle;
    }

    public void setOverviewDescription(String overviewDescription) 
    {
        this.overviewDescription = overviewDescription;
    }

    public String getOverviewDescription() 
    {
        return overviewDescription;
    }

    public void setOverviewContent(String overviewContent) 
    {
        this.overviewContent = overviewContent;
    }

    public String getOverviewContent() 
    {
        return overviewContent;
    }

    public void setOverviewImage(String overviewImage) 
    {
        this.overviewImage = overviewImage;
    }

    public String getOverviewImage() 
    {
        return overviewImage;
    }

    public void setOverviewType(String overviewType) 
    {
        this.overviewType = overviewType;
    }

    public String getOverviewType() 
    {
        return overviewType;
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
            .append("overviewId", getOverviewId())
            .append("overviewTitle", getOverviewTitle())
            .append("overviewDescription", getOverviewDescription())
            .append("overviewContent", getOverviewContent())
            .append("overviewImage", getOverviewImage())
            .append("overviewType", getOverviewType())
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