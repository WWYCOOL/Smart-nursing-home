package com.smartnursinghome.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 设施信息对象 website_facilities
 * 
 * @author smartnursinghome
 * @date 2024-03-15
 */
public class WebsiteFacilities extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设施ID */
    private Long facilityId;

    /** 设施名称 */
    @Excel(name = "设施名称")
    private String facilityName;

    /** 设施描述 */
    @Excel(name = "设施描述")
    private String facilityDescription;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 设施类型 */
    @Excel(name = "设施类型")
    private String facilityType;

    /** 设施图片 */
    @Excel(name = "设施图片")
    private String facilityImage;

    /** 图片地址 */
    @Excel(name = "图片地址")
    private String imageUrl;

    /** 图标类名 */
    @Excel(name = "图标类名")
    private String iconClass;

    /** 特色功能 */
    @Excel(name = "特色功能")
    private String features;

    /** 面积 */
    @Excel(name = "面积")
    private String area;

    /** 床位数量 */
    @Excel(name = "床位数量")
    private String beds;

    /** 价格 */
    @Excel(name = "价格")
    private String price;

    /** 设施图片列表 */
    private List<WebsiteFacilityImages> facilityImages;

    /** 设施位置 */
    @Excel(name = "设施位置")
    private String facilityLocation;

    /** 开放时间 */
    @Excel(name = "开放时间")
    private String openHours;

    /** 使用说明 */
    @Excel(name = "使用说明")
    private String usageInstructions;

    /** 注意事项 */
    @Excel(name = "注意事项")
    private String precautions;

    /** 房间类型 */
    @Excel(name = "房间类型", readConverterExp = "single=单人房,double=双人房,triple=三人房,quad=四人房,luxury=豪华房")
    private String roomType;

    /** 朝向 */
    @Excel(name = "朝向", readConverterExp = "south=南向,north=北向,east=东向,west=西向,southeast=东南,southwest=西南,northeast=东北,northwest=西北")
    private String orientation;

    /** 楼层 */
    @Excel(name = "楼层")
    private Integer floor;

    /** 房间号 */
    @Excel(name = "房间号")
    private String roomNumber;

    /** 床位数量 */
    @Excel(name = "床位数量")
    private Integer bedCount;

    /** 房间面积 */
    @Excel(name = "房间面积")
    private BigDecimal roomArea;

    /** 房间价格 */
    @Excel(name = "房间价格")
    private BigDecimal roomPrice;

    /** 设施设备 */
    @Excel(name = "设施设备")
    private String facilities;

    /** 排序 */
    @Excel(name = "排序")
    private Long sortOrder;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public Long getFacilityId()
    {
        return facilityId;
    }

    public void setFacilityId(Long facilityId)
    {
        this.facilityId = facilityId;
    }

    public String getFacilityName()
    {
        return facilityName;
    }

    public void setFacilityName(String facilityName)
    {
        this.facilityName = facilityName;
    }

    public String getFacilityDescription()
    {
        return facilityDescription;
    }

    public void setFacilityDescription(String facilityDescription)
    {
        this.facilityDescription = facilityDescription;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getFacilityType()
    {
        return facilityType;
    }

    public void setFacilityType(String facilityType)
    {
        this.facilityType = facilityType;
    }

    public String getFacilityImage()
    {
        return facilityImage;
    }

    public void setFacilityImage(String facilityImage)
    {
        this.facilityImage = facilityImage;
    }

    public String getImageUrl()
    {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl)
    {
        this.imageUrl = imageUrl;
    }

    public String getIconClass()
    {
        return iconClass;
    }

    public void setIconClass(String iconClass)
    {
        this.iconClass = iconClass;
    }

    public String getFeatures()
    {
        return features;
    }

    public void setFeatures(String features)
    {
        this.features = features;
    }

    public String getArea()
    {
        return area;
    }

    public void setArea(String area)
    {
        this.area = area;
    }

    public String getBeds()
    {
        return beds;
    }

    public void setBeds(String beds)
    {
        this.beds = beds;
    }

    public String getPrice()
    {
        return price;
    }

    public void setPrice(String price)
    {
        this.price = price;
    }

    public List<WebsiteFacilityImages> getFacilityImages()
    {
        return facilityImages;
    }

    public void setFacilityImages(List<WebsiteFacilityImages> facilityImages)
    {
        this.facilityImages = facilityImages;
    }

    public String getFacilityLocation()
    {
        return facilityLocation;
    }

    public void setFacilityLocation(String facilityLocation)
    {
        this.facilityLocation = facilityLocation;
    }

    public String getOpenHours()
    {
        return openHours;
    }

    public void setOpenHours(String openHours)
    {
        this.openHours = openHours;
    }

    public String getUsageInstructions()
    {
        return usageInstructions;
    }

    public void setUsageInstructions(String usageInstructions)
    {
        this.usageInstructions = usageInstructions;
    }

    public String getPrecautions()
    {
        return precautions;
    }

    public void setPrecautions(String precautions)
    {
        this.precautions = precautions;
    }

    public String getRoomType()
    {
        return roomType;
    }

    public void setRoomType(String roomType)
    {
        this.roomType = roomType;
    }

    public String getOrientation()
    {
        return orientation;
    }

    public void setOrientation(String orientation)
    {
        this.orientation = orientation;
    }

    public Integer getFloor()
    {
        return floor;
    }

    public void setFloor(Integer floor)
    {
        this.floor = floor;
    }

    public String getRoomNumber()
    {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber)
    {
        this.roomNumber = roomNumber;
    }

    public Integer getBedCount()
    {
        return bedCount;
    }

    public void setBedCount(Integer bedCount)
    {
        this.bedCount = bedCount;
    }

    public BigDecimal getRoomArea()
    {
        return roomArea;
    }

    public void setRoomArea(BigDecimal roomArea)
    {
        this.roomArea = roomArea;
    }

    public BigDecimal getRoomPrice()
    {
        return roomPrice;
    }

    public void setRoomPrice(BigDecimal roomPrice)
    {
        this.roomPrice = roomPrice;
    }

    public String getFacilities()
    {
        return facilities;
    }

    public void setFacilities(String facilities)
    {
        this.facilities = facilities;
    }

    public Long getSortOrder()
    {
        return sortOrder;
    }

    public void setSortOrder(Long sortOrder)
    {
        this.sortOrder = sortOrder;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("facilityId", getFacilityId())
            .append("facilityName", getFacilityName())
            .append("facilityDescription", getFacilityDescription())
            .append("description", getDescription())
            .append("facilityType", getFacilityType())
            .append("facilityImage", getFacilityImage())
            .append("imageUrl", getImageUrl())
            .append("iconClass", getIconClass())
            .append("features", getFeatures())
            .append("area", getArea())
            .append("beds", getBeds())
            .append("price", getPrice())
            .append("facilityLocation", getFacilityLocation())
            .append("openHours", getOpenHours())
            .append("usageInstructions", getUsageInstructions())
            .append("precautions", getPrecautions())
            .append("roomType", getRoomType())
            .append("orientation", getOrientation())
            .append("floor", getFloor())
            .append("roomNumber", getRoomNumber())
            .append("bedCount", getBedCount())
            .append("roomArea", getRoomArea())
            .append("roomPrice", getRoomPrice())
            .append("facilities", getFacilities())
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