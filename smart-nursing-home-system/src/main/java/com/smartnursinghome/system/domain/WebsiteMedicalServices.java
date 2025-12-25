package com.smartnursinghome.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 医疗护理服务对象 website_medical_services
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
public class WebsiteMedicalServices extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 服务ID */
    private Long serviceId;

    /** 服务标题 */
    @Excel(name = "服务标题")
    private String serviceTitle;

    /** 服务图标 */
    @Excel(name = "服务图标")
    private String serviceIcon;

    /** 服务描述 */
    @Excel(name = "服务描述")
    private String serviceDescription;

    /** 服务时间 */
    @Excel(name = "服务时间")
    private String serviceTime;

    /** 服务人员 */
    @Excel(name = "服务人员")
    private String serviceStaff;

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
    public void setServiceTitle(String serviceTitle) 
    {
        this.serviceTitle = serviceTitle;
    }

    public String getServiceTitle() 
    {
        return serviceTitle;
    }
    public void setServiceIcon(String serviceIcon) 
    {
        this.serviceIcon = serviceIcon;
    }

    public String getServiceIcon() 
    {
        return serviceIcon;
    }
    public void setServiceDescription(String serviceDescription) 
    {
        this.serviceDescription = serviceDescription;
    }

    public String getServiceDescription() 
    {
        return serviceDescription;
    }
    public void setServiceTime(String serviceTime) 
    {
        this.serviceTime = serviceTime;
    }

    public String getServiceTime() 
    {
        return serviceTime;
    }
    public void setServiceStaff(String serviceStaff) 
    {
        this.serviceStaff = serviceStaff;
    }

    public String getServiceStaff() 
    {
        return serviceStaff;
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
            .append("serviceTitle", getServiceTitle())
            .append("serviceIcon", getServiceIcon())
            .append("serviceDescription", getServiceDescription())
            .append("serviceTime", getServiceTime())
            .append("serviceStaff", getServiceStaff())
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








