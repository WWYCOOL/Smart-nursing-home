package com.smartnursinghome.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 护理任务对象 website_nursing_task
 *
 * @author ruoyi
 * @date 2025-12-09
 */
public class WebsiteNursingTask extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 任务ID */
    private Long taskId;

    /** 老人ID */
    private Long elderlyId;

    /** 老人姓名 */
    @Excel(name = "老人姓名")
    private String elderlyName;

    /** 护理项目ID */
    private Long projectId;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private String projectName;

    /** 项目单价（备份） */
    @Excel(name = "项目单价", readConverterExp = "备=份")
    private BigDecimal projectPrice;

    /** 执行护士ID */
    private Long nurseId;

    /** 执行护士姓名 */
    @Excel(name = "执行护士姓名")
    private String nurseName;

    /** 计划执行时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "计划执行时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date planTime;

    /** 实际执行时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实际执行时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date executeTime;

    /** 任务状态（0待执行 1已完成 2已取消） */
    @Excel(name = "任务状态", readConverterExp = "0=待执行,1=已完成,2=已取消")
    private String status;

    /** 执行备注 */
    @Excel(name = "执行备注")
    private String taskRemark;

    /** 执行照片 */
    @Excel(name = "执行照片")
    private String imageUrl;

    public void setTaskId(Long taskId)
    {
        this.taskId = taskId;
    }

    public Long getTaskId()
    {
        return taskId;
    }

    public void setElderlyId(Long elderlyId)
    {
        this.elderlyId = elderlyId;
    }

    public Long getElderlyId()
    {
        return elderlyId;
    }

    public void setElderlyName(String elderlyName)
    {
        this.elderlyName = elderlyName;
    }

    public String getElderlyName()
    {
        return elderlyName;
    }

    public void setProjectId(Long projectId)
    {
        this.projectId = projectId;
    }

    public Long getProjectId()
    {
        return projectId;
    }

    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }

    public String getProjectName()
    {
        return projectName;
    }

    public void setProjectPrice(BigDecimal projectPrice)
    {
        this.projectPrice = projectPrice;
    }

    public BigDecimal getProjectPrice()
    {
        return projectPrice;
    }

    public void setNurseId(Long nurseId)
    {
        this.nurseId = nurseId;
    }

    public Long getNurseId()
    {
        return nurseId;
    }

    public void setNurseName(String nurseName)
    {
        this.nurseName = nurseName;
    }

    public String getNurseName()
    {
        return nurseName;
    }

    public void setPlanTime(Date planTime)
    {
        this.planTime = planTime;
    }

    public Date getPlanTime()
    {
        return planTime;
    }

    public void setExecuteTime(Date executeTime)
    {
        this.executeTime = executeTime;
    }

    public Date getExecuteTime()
    {
        return executeTime;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }

    public void setTaskRemark(String taskRemark)
    {
        this.taskRemark = taskRemark;
    }

    public String getTaskRemark()
    {
        return taskRemark;
    }

    public void setImageUrl(String imageUrl)
    {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl()
    {
        return imageUrl;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("taskId", getTaskId())
            .append("elderlyId", getElderlyId())
            .append("elderlyName", getElderlyName())
            .append("projectId", getProjectId())
            .append("projectName", getProjectName())
            .append("projectPrice", getProjectPrice())
            .append("nurseId", getNurseId())
            .append("nurseName", getNurseName())
            .append("planTime", getPlanTime())
            .append("executeTime", getExecuteTime())
            .append("status", getStatus())
            .append("taskRemark", getTaskRemark())
            .append("imageUrl", getImageUrl())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
