package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 护理服务对象 website_care_services
 * 
 * @author smartnursinghome
 * @date 2024-03-15
 */
public class WebsiteCareServices extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 服务ID */
    private Long serviceId;

    /** 服务名称 */
    @Excel(name = "服务名称")
    private String serviceName;

    /** 服务标题 */
    @Excel(name = "服务标题")
    private String serviceTitle;

    /** 服务时间 */
    @Excel(name = "服务时间")
    private String serviceTime;

    /** 服务描述 */
    @Excel(name = "服务描述")
    private String serviceDescription;

    /** 服务特色 */
    @Excel(name = "服务特色")
    private String serviceFeatures;

    /** 服务内容 */
    @Excel(name = "服务内容")
    private String serviceContent;

    /** 服务价格 */
    @Excel(name = "服务价格")
    private String servicePrice;

    /** 服务时长 */
    @Excel(name = "服务时长")
    private String serviceDuration;

    /** 服务类型 */
    @Excel(name = "服务类型")
    private String serviceType;

    /** 适用人群 */
    @Excel(name = "适用人群")
    private String targetGroup;

    /** 注意事项 */
    @Excel(name = "注意事项")
    private String precautions;

    /** 服务图片 */
    @Excel(name = "服务图片")
    private String serviceImage;

    /** 排序 */
    @Excel(name = "排序")
    private Long sortOrder;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setServiceId(Long serviceId) 
    {
        this.serviceId = serviceId;
    }

    public Long getServiceId() 
    {
        return serviceId;
    }

    public void setServiceName(String serviceName) 
    {
        this.serviceName = serviceName;
    }

    public String getServiceName() 
    {
        return serviceName;
    }

    public void setServiceTitle(String serviceTitle) 
    {
        this.serviceTitle = serviceTitle;
    }

    public String getServiceTitle() 
    {
        return serviceTitle;
    }

    public String getServiceTime() 
    {
        return serviceTime;
    }

    public void setServiceTime(String serviceTime) 
    {
        this.serviceTime = serviceTime;
    }

    public void setServiceDescription(String serviceDescription) 
    {
        this.serviceDescription = serviceDescription;
    }

    public String getServiceDescription() 
    {
        return serviceDescription;
    }

    public String getServiceFeatures() 
    {
        return serviceFeatures;
    }

    public void setServiceFeatures(String serviceFeatures) 
    {
        this.serviceFeatures = serviceFeatures;
    }

    public void setServiceContent(String serviceContent) 
    {
        this.serviceContent = serviceContent;
    }

    public String getServiceContent() 
    {
        return serviceContent;
    }

    public void setServicePrice(String servicePrice) 
    {
        this.servicePrice = servicePrice;
    }

    public String getServicePrice() 
    {
        return servicePrice;
    }

    public void setServiceDuration(String serviceDuration) 
    {
        this.serviceDuration = serviceDuration;
    }

    public String getServiceDuration() 
    {
        return serviceDuration;
    }

    public void setServiceType(String serviceType) 
    {
        this.serviceType = serviceType;
    }

    public String getServiceType() 
    {
        return serviceType;
    }

    public void setTargetGroup(String targetGroup) 
    {
        this.targetGroup = targetGroup;
    }

    public String getTargetGroup() 
    {
        return targetGroup;
    }

    public void setPrecautions(String precautions) 
    {
        this.precautions = precautions;
    }

    public String getPrecautions() 
    {
        return precautions;
    }

    public void setServiceImage(String serviceImage) 
    {
        this.serviceImage = serviceImage;
    }

    public String getServiceImage() 
    {
        return serviceImage;
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
            .append("serviceId", getServiceId())
            .append("serviceName", getServiceName())
            .append("serviceTitle", getServiceTitle())
            .append("serviceTime", getServiceTime())
            .append("serviceDescription", getServiceDescription())
            .append("serviceFeatures", getServiceFeatures())
            .append("serviceContent", getServiceContent())
            .append("servicePrice", getServicePrice())
            .append("serviceDuration", getServiceDuration())
            .append("serviceType", getServiceType())
            .append("targetGroup", getTargetGroup())
            .append("precautions", getPrecautions())
            .append("serviceImage", getServiceImage())
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