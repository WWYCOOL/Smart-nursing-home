package com.smartnursinghome.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 费用查询对象 website_fee_query
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
public class WebsiteFeeQuery extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 查询ID */
    private Long queryId;

    /** 老人ID */
    @Excel(name = "老人ID")
    private Long elderlyId;

    /** 老人姓名 */
    @Excel(name = "老人姓名")
    private String elderlyName;

    /** 查询类型：monthly-月度费用，quarterly-季度费用，yearly-年度费用，custom-自定义期间 */
    @Excel(name = "查询类型", readConverterExp = "monthly=月度费用,quarterly=季度费用,yearly=年度费用,custom=自定义期间")
    private String queryType;

    /** 查询开始日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "查询开始日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startDate;

    /** 查询结束日期 */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @Excel(name = "查询结束日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endDate;

    /** 查询状态：0-待处理，1-已处理，2-已发送 */
    @Excel(name = "查询状态", readConverterExp = "0=待处理,1=已处理,2=已发送")
    private String queryStatus;

    /** 查询结果JSON */
    private String queryResult;

    /** 总费用 */
    @Excel(name = "总费用")
    private BigDecimal totalAmount;

    /** 已付费用 */
    @Excel(name = "已付费用")
    private BigDecimal paidAmount;

    /** 未付费用 */
    @Excel(name = "未付费用")
    private BigDecimal unpaidAmount;

    /** 查询人 */
    @Excel(name = "查询人")
    private String queryBy;

    /** 查询时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "查询时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date queryTime;

    /** 处理人 */
    @Excel(name = "处理人")
    private String processBy;

    /** 处理时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "处理时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date processTime;

    /** 发送时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "发送时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date sendTime;

    public void setQueryId(Long queryId) 
    {
        this.queryId = queryId;
    }

    public Long getQueryId() 
    {
        return queryId;
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
    public void setQueryType(String queryType) 
    {
        this.queryType = queryType;
    }

    public String getQueryType() 
    {
        return queryType;
    }
    public void setStartDate(Date startDate) 
    {
        this.startDate = startDate;
    }

    public Date getStartDate() 
    {
        return startDate;
    }
    public void setEndDate(Date endDate) 
    {
        this.endDate = endDate;
    }

    public Date getEndDate() 
    {
        return endDate;
    }
    public void setQueryStatus(String queryStatus) 
    {
        this.queryStatus = queryStatus;
    }

    public String getQueryStatus() 
    {
        return queryStatus;
    }
    public void setQueryResult(String queryResult) 
    {
        this.queryResult = queryResult;
    }

    public String getQueryResult() 
    {
        return queryResult;
    }
    public void setTotalAmount(BigDecimal totalAmount) 
    {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getTotalAmount() 
    {
        return totalAmount;
    }
    public void setPaidAmount(BigDecimal paidAmount) 
    {
        this.paidAmount = paidAmount;
    }

    public BigDecimal getPaidAmount() 
    {
        return paidAmount;
    }
    public void setUnpaidAmount(BigDecimal unpaidAmount) 
    {
        this.unpaidAmount = unpaidAmount;
    }

    public BigDecimal getUnpaidAmount() 
    {
        return unpaidAmount;
    }
    public void setQueryBy(String queryBy) 
    {
        this.queryBy = queryBy;
    }

    public String getQueryBy() 
    {
        return queryBy;
    }
    public void setQueryTime(Date queryTime) 
    {
        this.queryTime = queryTime;
    }

    public Date getQueryTime() 
    {
        return queryTime;
    }
    public void setProcessBy(String processBy) 
    {
        this.processBy = processBy;
    }

    public String getProcessBy() 
    {
        return processBy;
    }
    public void setProcessTime(Date processTime) 
    {
        this.processTime = processTime;
    }

    public Date getProcessTime() 
    {
        return processTime;
    }
    public void setSendTime(Date sendTime) 
    {
        this.sendTime = sendTime;
    }

    public Date getSendTime() 
    {
        return sendTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("queryId", getQueryId())
            .append("elderlyId", getElderlyId())
            .append("elderlyName", getElderlyName())
            .append("queryType", getQueryType())
            .append("startDate", getStartDate())
            .append("endDate", getEndDate())
            .append("queryStatus", getQueryStatus())
            .append("queryResult", getQueryResult())
            .append("totalAmount", getTotalAmount())
            .append("paidAmount", getPaidAmount())
            .append("unpaidAmount", getUnpaidAmount())
            .append("queryBy", getQueryBy())
            .append("queryTime", getQueryTime())
            .append("processBy", getProcessBy())
            .append("processTime", getProcessTime())
            .append("sendTime", getSendTime())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
