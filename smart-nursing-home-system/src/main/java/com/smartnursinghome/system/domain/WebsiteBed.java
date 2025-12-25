package com.smartnursinghome.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 床位管理对象 website_bed
 *
 * @author ruoyi
 * @date 2025-12-10
 */
public class WebsiteBed extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 床位ID */
    private Long bedId;

    /** 床位编号 */
    @Excel(name = "床位编号")
    private String bedNumber;

    /** 所属房间ID */
    private Long roomId;

    /** 房间号（冗余字段，方便查询） */
    @Excel(name = "房间号", readConverterExp = "冗=余字段，方便查询")
    private String roomNumber;

    /** 绑定老人ID（空闲时为空） */
    private Long elderlyId;

    /** 床位价格（每日费用） */
    @Excel(name = "床位价格", readConverterExp = "每=日费用")
    private BigDecimal price;

    /** 床位状态（0-空闲 1-已入住 2-预留 3-维修） */
    @Excel(name = "床位状态", readConverterExp = "0=-空闲,1=-已入住,2=-预留,3=-维修")
    private String bedStatus;

    /** 显示顺序 */
    private Long sortOrder;

    public void setBedId(Long bedId)
    {
        this.bedId = bedId;
    }

    public Long getBedId()
    {
        return bedId;
    }

    public void setBedNumber(String bedNumber)
    {
        this.bedNumber = bedNumber;
    }

    public String getBedNumber()
    {
        return bedNumber;
    }

    public void setRoomId(Long roomId)
    {
        this.roomId = roomId;
    }

    public Long getRoomId()
    {
        return roomId;
    }

    public void setRoomNumber(String roomNumber)
    {
        this.roomNumber = roomNumber;
    }

    public String getRoomNumber()
    {
        return roomNumber;
    }

    public void setElderlyId(Long elderlyId)
    {
        this.elderlyId = elderlyId;
    }

    public Long getElderlyId()
    {
        return elderlyId;
    }

    public void setPrice(BigDecimal price)
    {
        this.price = price;
    }

    public BigDecimal getPrice()
    {
        return price;
    }

    public void setBedStatus(String bedStatus)
    {
        this.bedStatus = bedStatus;
    }

    public String getBedStatus()
    {
        return bedStatus;
    }

    public void setSortOrder(Long sortOrder)
    {
        this.sortOrder = sortOrder;
    }

    public Long getSortOrder()
    {
        return sortOrder;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("bedId", getBedId())
            .append("bedNumber", getBedNumber())
            .append("roomId", getRoomId())
            .append("roomNumber", getRoomNumber())
            .append("elderlyId", getElderlyId())
            .append("price", getPrice())
            .append("bedStatus", getBedStatus())
            .append("sortOrder", getSortOrder())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
