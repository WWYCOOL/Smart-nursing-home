package com.smartnursinghome.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 费用明细对象 website_fee_detail
 * 
 * @author smartnursinghome
 * @date 2024-03-15
 */
public class WebsiteFeeDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 明细ID */
    private Long detailId;

    /** 关联查询ID（可选） */
    @Excel(name = "查询ID")
    private Long queryId;

    /** 老人ID */
    @Excel(name = "老人ID")
    private Long elderlyId;

    /** 家属ID（用于查询条件） */
    @Excel(name = "家属ID")
    private Long familyId;

    /** 老人姓名 */
    @Excel(name = "老人姓名")
    private String elderlyName;

    /** 费用类型 */
    @Excel(name = "费用类型")
    private String feeType;

    /** 费用名称 */
    @Excel(name = "费用名称")
    private String feeName;

    /** 费用项目 */
    @Excel(name = "费用项目")
    private String feeItem;

    /** 费用金额 */
    @Excel(name = "费用金额")
    private BigDecimal feeAmount;

    /** 费用日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "费用日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date feeDate;

    /** 结束日期（用于单条记录显示日期区间） */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endDate;

    /** 费用月份 (yyyy-MM) */
    @Excel(name = "费用月份")
    private String feeMonth;

    /** 计费周期开始 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "计费周期开始", width = 30, dateFormat = "yyyy-MM-dd")
    private Date periodStart;

    /** 计费周期结束 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "计费周期结束", width = 30, dateFormat = "yyyy-MM-dd")
    private Date periodEnd;

    /** 数量 */
    @Excel(name = "数量")
    private Integer quantity;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal unitPrice;

    /** 折扣率 */
    @Excel(name = "折扣率")
    private BigDecimal discountRate;

    /** 折扣金额 */
    @Excel(name = "折扣金额")
    private BigDecimal discountAmount;

    /** 实际金额 */
    @Excel(name = "实际金额")
    private BigDecimal actualAmount;

    /** 费用状态（0待支付 1已支付 2已退款） */
    @Excel(name = "费用状态", readConverterExp = "0=待支付,1=已支付,2=已退款")
    private String feeStatus;

    /** 是否已支付（0否 1是） */
    @Excel(name = "是否已支付", readConverterExp = "0=否,1=是")
    private String isPaid;

    /** 支付时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "支付时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date paymentTime;

    /** 已支付时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "已支付日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date paidDate;

    /** 支付方式：cash-现金，bank-银行转账，wechat-微信，alipay-支付宝 */
    @Excel(name = "支付方式", readConverterExp = "cash=现金,bank=银行转账,wechat=微信,alipay=支付宝")
    private String paymentMethod;

    /** 支付凭证 */
    @Excel(name = "支付凭证")
    private String paymentVoucher;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    public Long getDetailId()
    {
        return detailId;
    }

    public void setDetailId(Long detailId)
    {
        this.detailId = detailId;
    }

    public Long getQueryId()
    {
        return queryId;
    }

    public void setQueryId(Long queryId)
    {
        this.queryId = queryId;
    }

    public Long getElderlyId()
    {
        return elderlyId;
    }

    public void setElderlyId(Long elderlyId)
    {
        this.elderlyId = elderlyId;
    }

    public Long getFamilyId()
    {
        return familyId;
    }

    public void setFamilyId(Long familyId)
    {
        this.familyId = familyId;
    }

    public String getElderlyName()
    {
        return elderlyName;
    }

    public void setElderlyName(String elderlyName)
    {
        this.elderlyName = elderlyName;
    }

    public String getFeeType()
    {
        return feeType;
    }

    public void setFeeType(String feeType)
    {
        this.feeType = feeType;
    }

    public String getFeeName()
    {
        return feeName;
    }

    public void setFeeName(String feeName)
    {
        this.feeName = feeName;
    }

    public String getFeeItem()
    {
        return feeItem;
    }

    public void setFeeItem(String feeItem)
    {
        this.feeItem = feeItem;
    }

    public BigDecimal getFeeAmount()
    {
        return feeAmount;
    }

    public void setFeeAmount(BigDecimal feeAmount)
    {
        this.feeAmount = feeAmount;
    }

    public Date getFeeDate()
    {
        return feeDate;
    }

    public void setFeeDate(Date feeDate)
    {
        this.feeDate = feeDate;
    }

    public Date getEndDate()
    {
        return endDate;
    }

    public void setEndDate(Date endDate)
    {
        this.endDate = endDate;
    }

    public String getFeeMonth()
    {
        return feeMonth;
    }

    public void setFeeMonth(String feeMonth)
    {
        this.feeMonth = feeMonth;
    }

    public Date getPeriodStart()
    {
        return periodStart;
    }

    public void setPeriodStart(Date periodStart)
    {
        this.periodStart = periodStart;
    }

    public Date getPeriodEnd()
    {
        return periodEnd;
    }

    public void setPeriodEnd(Date periodEnd)
    {
        this.periodEnd = periodEnd;
    }

    public Integer getQuantity()
    {
        return quantity;
    }

    public void setQuantity(Integer quantity)
    {
        this.quantity = quantity;
    }

    public BigDecimal getUnitPrice()
    {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice)
    {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getDiscountRate()
    {
        return discountRate;
    }

    public void setDiscountRate(BigDecimal discountRate)
    {
        this.discountRate = discountRate;
    }

    public BigDecimal getDiscountAmount()
    {
        return discountAmount;
    }

    public void setDiscountAmount(BigDecimal discountAmount)
    {
        this.discountAmount = discountAmount;
    }

    public BigDecimal getActualAmount()
    {
        return actualAmount;
    }

    public void setActualAmount(BigDecimal actualAmount)
    {
        this.actualAmount = actualAmount;
    }

    public String getFeeStatus()
    {
        return feeStatus;
    }

    public void setFeeStatus(String feeStatus)
    {
        this.feeStatus = feeStatus;
    }

    public String getIsPaid()
    {
        return isPaid;
    }

    public void setIsPaid(String isPaid)
    {
        this.isPaid = isPaid;
    }

    public Date getPaymentTime()
    {
        return paymentTime;
    }

    public void setPaymentTime(Date paymentTime)
    {
        this.paymentTime = paymentTime;
    }

    public Date getPaidDate()
    {
        return paidDate;
    }

    public void setPaidDate(Date paidDate)
    {
        this.paidDate = paidDate;
    }

    public String getPaymentMethod()
    {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod)
    {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentVoucher()
    {
        return paymentVoucher;
    }

    public void setPaymentVoucher(String paymentVoucher)
    {
        this.paymentVoucher = paymentVoucher;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("detailId", getDetailId())
            .append("elderlyId", getElderlyId())
            .append("familyId", getFamilyId())
            .append("elderlyName", getElderlyName())
            .append("feeType", getFeeType())
            .append("feeName", getFeeName())
            .append("feeItem", getFeeItem())
            .append("feeAmount", getFeeAmount())
            .append("feeDate", getFeeDate())
            .append("endDate", getEndDate())
            .append("feeMonth", getFeeMonth())
            .append("periodStart", getPeriodStart())
            .append("periodEnd", getPeriodEnd())
            .append("quantity", getQuantity())
            .append("unitPrice", getUnitPrice())
            .append("discountRate", getDiscountRate())
            .append("discountAmount", getDiscountAmount())
            .append("actualAmount", getActualAmount())
            .append("feeStatus", getFeeStatus())
            .append("isPaid", getIsPaid())
            .append("paymentTime", getPaymentTime())
            .append("paidDate", getPaidDate())
            .append("paymentMethod", getPaymentMethod())
            .append("paymentVoucher", getPaymentVoucher())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}