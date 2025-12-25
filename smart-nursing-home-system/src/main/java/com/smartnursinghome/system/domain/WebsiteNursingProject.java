package com.smartnursinghome.system.domain;

import java.math.BigDecimal;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 护理项目对象 website_nursing_project
 *
 * @author ruoyi
 * @date 2025-12-09
 */
public class WebsiteNursingProject extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 项目ID
     */
    private Long projectId;
    /**
     * 老人ID
     */
    private int elderlyId;
    /**
     * 项目名称
     */
    @Excel(name = "项目名称")
    private String projectName;

    /**
     * 项目类型（1生活照料 2医疗护理 3康复护理 4其他）
     */
    @Excel(name = "项目类型", readConverterExp = "1=生活照料,2=医疗护理,3=康复护理,4=其他")
    private String projectType;

    /**
     * 单价
     */
    @Excel(name = "单价")
    private BigDecimal price;

    /**
     * 单位（如：次、小时、天）
     */
    @Excel(name = "单位", readConverterExp = "如=：次、小时、天")
    private String unit;

    /**
     * 服务标准
     */
    @Excel(name = "服务标准")
    private String serviceStandard;

    /**
     * 显示顺序
     */
    private Long orderNum;

    /**
     * 状态（0正常 1停用）
     */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectType(String projectType) {
        this.projectType = projectType;
    }

    public String getProjectType() {
        return projectType;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getUnit() {
        return unit;
    }

    public void setServiceStandard(String serviceStandard) {
        this.serviceStandard = serviceStandard;
    }

    public String getServiceStandard() {
        return serviceStandard;
    }

    public void setOrderNum(Long orderNum) {
        this.orderNum = orderNum;
    }

    public Long getOrderNum() {
        return orderNum;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getDelFlag() {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("projectId", getProjectId())
                .append("projectName", getProjectName())
                .append("projectType", getProjectType())
                .append("price", getPrice())
                .append("unit", getUnit())
                .append("serviceStandard", getServiceStandard())
                .append("orderNum", getOrderNum())
                .append("status", getStatus())
                .append("delFlag", getDelFlag())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
