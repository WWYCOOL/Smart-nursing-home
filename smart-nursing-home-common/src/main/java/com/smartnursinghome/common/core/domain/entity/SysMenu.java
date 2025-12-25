package com.smartnursinghome.common.core.domain.entity;

import java.util.Date;
import java.util.List;
import javax.validation.constraints.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 菜单权限表 sys_menu
 * 
 * @author smartnursinghome
 */
public class SysMenu extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 菜单ID */
    @Excel(name = "菜单序号", cellType = Excel.ColumnType.NUMERIC)
    private Long menuId;

    /** 菜单名称 */
    @Excel(name = "菜单名称")
    @NotBlank(message = "菜单名称不能为空")
    @Size(min = 0, max = 50, message = "菜单名称长度不能超过50个字符")
    private String menuName;

    /** 父菜单ID */
    @Excel(name = "父菜单ID", cellType = Excel.ColumnType.NUMERIC)
    private Long parentId;

    /** 显示顺序 */
    @Excel(name = "显示顺序", cellType = Excel.ColumnType.NUMERIC)
    private Integer orderNum;

    /** 路由地址 */
    @Excel(name = "路由地址")
    @Size(min = 0, max = 200, message = "路由地址长度不能超过200个字符")
    private String path;

    /** 组件路径 */
    @Excel(name = "组件路径")
    @Size(min = 0, max = 255, message = "组件路径长度不能超过255个字符")
    private String component;

    /** 路由名称（可选） */
    @Excel(name = "路由名称")
    @Size(min = 0, max = 100, message = "路由名称长度不能超过100个字符")
    private String routeName;

    /** 路由参数 */
    @Excel(name = "路由参数")
    private String query;

    /** 是否为外链（0是 1否） */
    @Excel(name = "是否为外链", readConverterExp = "0=是,1=否")
    private String isFrame;

    /** 是否缓存（0缓存 1不缓存） */
    @Excel(name = "是否缓存", readConverterExp = "0=缓存,1=不缓存")
    private String isCache;

    /** 菜单类型（M目录 C菜单 F按钮） */
    @Excel(name = "菜单类型", readConverterExp = "M=目录,C=菜单,F=按钮")
    private String menuType;

    /** 菜单状态（0显示 1隐藏） */
    @Excel(name = "菜单状态", readConverterExp = "0=显示,1=隐藏")
    private String visible;

    /** 菜单状态（0正常 1停用） */
    @Excel(name = "菜单状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 权限标识 */
    @Excel(name = "权限标识")
    @Size(min = 0, max = 100, message = "权限标识长度不能超过100个字符")
    private String perms;

    /** 菜单图标 */
    @Excel(name = "菜单图标")
    private String icon;

    /** 子菜单 */
    private List<SysMenu> children;

    public Long getMenuId()
    {
        return menuId;
    }

    public void setMenuId(Long menuId)
    {
        this.menuId = menuId;
    }

    @NotBlank(message = "菜单名称不能为空")
    @Size(min = 0, max = 50, message = "菜单名称长度不能超过50个字符")
    public String getMenuName()
    {
        return menuName;
    }

    public void setMenuName(String menuName)
    {
        this.menuName = menuName;
    }

    public Long getParentId()
    {
        return parentId;
    }

    public void setParentId(Long parentId)
    {
        this.parentId = parentId;
    }

    public Integer getOrderNum()
    {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum)
    {
        this.orderNum = orderNum;
    }

    @Size(min = 0, max = 200, message = "路由地址长度不能超过200个字符")
    public String getPath()
    {
        return path;
    }

    public void setPath(String path)
    {
        this.path = path;
    }

    @Size(min = 0, max = 255, message = "组件路径长度不能超过255个字符")
    public String getComponent()
    {
        return component;
    }

    public void setComponent(String component)
    {
        this.component = component;
    }

    public String getRouteName()
    {
        return routeName;
    }

    public void setRouteName(String routeName)
    {
        this.routeName = routeName;
    }

    public String getQuery()
    {
        return query;
    }

    public void setQuery(String query)
    {
        this.query = query;
    }

    public String getIsFrame()
    {
        return isFrame;
    }

    public void setIsFrame(String isFrame)
    {
        this.isFrame = isFrame;
    }

    public String getIsCache()
    {
        return isCache;
    }

    public void setIsCache(String isCache)
    {
        this.isCache = isCache;
    }

    public String getMenuType()
    {
        return menuType;
    }

    public void setMenuType(String menuType)
    {
        this.menuType = menuType;
    }

    public String getVisible()
    {
        return visible;
    }

    public void setVisible(String visible)
    {
        this.visible = visible;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    @Size(min = 0, max = 100, message = "权限标识长度不能超过100个字符")
    public String getPerms()
    {
        return perms;
    }

    public void setPerms(String perms)
    {
        this.perms = perms;
    }

    public String getIcon()
    {
        return icon;
    }

    public void setIcon(String icon)
    {
        this.icon = icon;
    }

    public List<SysMenu> getChildren()
    {
        return children;
    }

    public void setChildren(List<SysMenu> children)
    {
        this.children = children;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("menuId", getMenuId())
            .append("menuName", getMenuName())
            .append("parentId", getParentId())
            .append("orderNum", getOrderNum())
            .append("path", getPath())
            .append("component", getComponent())
            .append("query", getQuery())
            .append("isFrame", getIsFrame())
            .append("isCache", getIsCache())
            .append("menuType", getMenuType())
            .append("visible", getVisible())
            .append("status", getStatus())
            .append("perms", getPerms())
            .append("icon", getIcon())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}