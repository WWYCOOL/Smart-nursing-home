package com.smartnursinghome.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 房间管理对象 website_room
 *
 * @author wwy
 * @date 2025-12-10
 */
public class WebsiteRoom extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 房间ID */
    private Long roomId;

    /** 房间号 */
    @Excel(name = "房间号")
    private String roomNumber;

    /** 房间类型（single单人 double双人 triple三人） */
    @Excel(name = "房间类型", readConverterExp = "s=ingle单人,d=ouble双人,t=riple三人")
    private String roomType;

    /** 床位总数 */
    @Excel(name = "床位总数")
    private Long totalBeds;

    /** 房间照片 */
    @Excel(name = "房间照片")
    private String imageUrl;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

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

    public void setRoomType(String roomType)
    {
        this.roomType = roomType;
    }

    public String getRoomType()
    {
        return roomType;
    }

    public void setTotalBeds(Long totalBeds)
    {
        this.totalBeds = totalBeds;
    }

    public Long getTotalBeds()
    {
        return totalBeds;
    }

    public void setImageUrl(String imageUrl)
    {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl()
    {
        return imageUrl;
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
            .append("roomId", getRoomId())
            .append("roomNumber", getRoomNumber())
            .append("roomType", getRoomType())
            .append("totalBeds", getTotalBeds())
            .append("imageUrl", getImageUrl())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
