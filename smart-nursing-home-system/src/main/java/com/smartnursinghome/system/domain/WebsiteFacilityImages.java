package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 设施图片对象 website_facility_images
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
public class WebsiteFacilityImages extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 图片ID */
    private Long imageId;

    /** 设施ID */
    @Excel(name = "设施ID")
    private Long facilityId;

    /** 图片地址 */
    @Excel(name = "图片地址")
    private String imageUrl;

    /** 排序 */
    @Excel(name = "排序")
    private Long sortOrder;

    public void setImageId(Long imageId) 
    {
        this.imageId = imageId;
    }

    public Long getImageId() 
    {
        return imageId;
    }
    public void setFacilityId(Long facilityId) 
    {
        this.facilityId = facilityId;
    }

    public Long getFacilityId() 
    {
        return facilityId;
    }
    public void setImageUrl(String imageUrl) 
    {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() 
    {
        return imageUrl;
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
            .append("imageId", getImageId())
            .append("facilityId", getFacilityId())
            .append("imageUrl", getImageUrl())
            .append("sortOrder", getSortOrder())
            .append("createTime", getCreateTime())
            .toString();
    }
}











