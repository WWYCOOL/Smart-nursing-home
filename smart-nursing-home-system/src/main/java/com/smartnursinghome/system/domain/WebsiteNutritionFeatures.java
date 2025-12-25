package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 营养膳食特色对象 website_nutrition_features
 * 
 * @author ruoyi
 * @date 2025-01-22
 */
public class WebsiteNutritionFeatures extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 特色ID */
    private Long featureId;

    /** 特色标题 */
    @Excel(name = "特色标题")
    private String featureTitle;

    /** 特色图标 */
    @Excel(name = "特色图标")
    private String featureIcon;

    /** 特色描述 */
    @Excel(name = "特色描述")
    private String featureDescription;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long sortOrder;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setFeatureId(Long featureId) 
    {
        this.featureId = featureId;
    }

    public Long getFeatureId() 
    {
        return featureId;
    }
    public void setFeatureTitle(String featureTitle) 
    {
        this.featureTitle = featureTitle;
    }

    public String getFeatureTitle() 
    {
        return featureTitle;
    }
    public void setFeatureIcon(String featureIcon) 
    {
        this.featureIcon = featureIcon;
    }

    public String getFeatureIcon() 
    {
        return featureIcon;
    }
    public void setFeatureDescription(String featureDescription) 
    {
        this.featureDescription = featureDescription;
    }

    public String getFeatureDescription() 
    {
        return featureDescription;
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
            .append("featureId", getFeatureId())
            .append("featureTitle", getFeatureTitle())
            .append("featureIcon", getFeatureIcon())
            .append("featureDescription", getFeatureDescription())
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






