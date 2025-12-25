package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 环境设施对象 website_environment_features
 * 
 * @author smartnursinghome
 * @date 2024-03-15
 */
public class WebsiteEnvironmentFeatures extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设施ID */
    private Long featureId;

    /** 设施名称 */
    @Excel(name = "设施名称")
    private String featureName;

    /** 设施描述 */
    @Excel(name = "设施描述")
    private String featureDescription;

    /** 设施类型 */
    @Excel(name = "设施类型")
    private String featureType;

    /** 设施图片 */
    @Excel(name = "设施图片")
    private String featureImage;

    /** 设施图标 */
    @Excel(name = "设施图标")
    private String featureIcon;

    /** 设施位置 */
    @Excel(name = "设施位置")
    private String featureLocation;

    /** 开放时间 */
    @Excel(name = "开放时间")
    private String openHours;

    /** 使用说明 */
    @Excel(name = "使用说明")
    private String usageInstructions;

    /** 注意事项 */
    @Excel(name = "注意事项")
    private String precautions;

    /** 排序 */
    @Excel(name = "排序")
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

    public void setFeatureName(String featureName) 
    {
        this.featureName = featureName;
    }

    public String getFeatureName() 
    {
        return featureName;
    }

    public void setFeatureDescription(String featureDescription) 
    {
        this.featureDescription = featureDescription;
    }

    public String getFeatureDescription() 
    {
        return featureDescription;
    }

    public void setFeatureType(String featureType) 
    {
        this.featureType = featureType;
    }

    public String getFeatureType() 
    {
        return featureType;
    }

    public void setFeatureImage(String featureImage) 
    {
        this.featureImage = featureImage;
    }

    public String getFeatureImage() 
    {
        return featureImage;
    }

    public void setFeatureIcon(String featureIcon) 
    {
        this.featureIcon = featureIcon;
    }

    public String getFeatureIcon() 
    {
        return featureIcon;
    }

    public void setFeatureLocation(String featureLocation) 
    {
        this.featureLocation = featureLocation;
    }

    public String getFeatureLocation() 
    {
        return featureLocation;
    }

    public void setOpenHours(String openHours) 
    {
        this.openHours = openHours;
    }

    public String getOpenHours() 
    {
        return openHours;
    }

    public void setUsageInstructions(String usageInstructions) 
    {
        this.usageInstructions = usageInstructions;
    }

    public String getUsageInstructions() 
    {
        return usageInstructions;
    }

    public void setPrecautions(String precautions) 
    {
        this.precautions = precautions;
    }

    public String getPrecautions() 
    {
        return precautions;
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
            .append("featureName", getFeatureName())
            .append("featureDescription", getFeatureDescription())
            .append("featureType", getFeatureType())
            .append("featureImage", getFeatureImage())
            .append("featureIcon", getFeatureIcon())
            .append("featureLocation", getFeatureLocation())
            .append("openHours", getOpenHours())
            .append("usageInstructions", getUsageInstructions())
            .append("precautions", getPrecautions())
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