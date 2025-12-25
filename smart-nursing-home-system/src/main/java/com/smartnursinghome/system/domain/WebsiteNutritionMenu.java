package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 今日菜单对象 website_nutrition_menu
 * 
 * @author ruoyi
 * @date 2025-01-22
 */
public class WebsiteNutritionMenu extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 菜单ID */
    private Long menuId;

    /** 用餐时间 */
    @Excel(name = "用餐时间")
    private String mealTime;

    /** 餐次名称 */
    @Excel(name = "餐次名称")
    private String mealName;

    /** 菜品信息（JSON格式） */
    @Excel(name = "菜品信息")
    private String menuDishes;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long sortOrder;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setMenuId(Long menuId) 
    {
        this.menuId = menuId;
    }

    public Long getMenuId() 
    {
        return menuId;
    }
    public void setMealTime(String mealTime) 
    {
        this.mealTime = mealTime;
    }

    public String getMealTime() 
    {
        return mealTime;
    }
    public void setMealName(String mealName) 
    {
        this.mealName = mealName;
    }

    public String getMealName() 
    {
        return mealName;
    }
    public void setMenuDishes(String menuDishes) 
    {
        this.menuDishes = menuDishes;
    }

    public String getMenuDishes() 
    {
        return menuDishes;
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
            .append("menuId", getMenuId())
            .append("mealTime", getMealTime())
            .append("mealName", getMealName())
            .append("menuDishes", getMenuDishes())
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






