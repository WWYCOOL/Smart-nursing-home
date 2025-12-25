package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteNutritionMenu;

/**
 * 今日菜单Service接口
 * 
 * @author ruoyi
 * @date 2025-01-22
 */
public interface IWebsiteNutritionMenuService 
{
    /**
     * 查询今日菜单
     * 
     * @param menuId 今日菜单主键
     * @return 今日菜单
     */
    public WebsiteNutritionMenu selectWebsiteNutritionMenuByMenuId(Long menuId);

    /**
     * 查询今日菜单列表
     * 
     * @param websiteNutritionMenu 今日菜单
     * @return 今日菜单集合
     */
    public List<WebsiteNutritionMenu> selectWebsiteNutritionMenuList(WebsiteNutritionMenu websiteNutritionMenu);

    /**
     * 新增今日菜单
     * 
     * @param websiteNutritionMenu 今日菜单
     * @return 结果
     */
    public int insertWebsiteNutritionMenu(WebsiteNutritionMenu websiteNutritionMenu);

    /**
     * 修改今日菜单
     * 
     * @param websiteNutritionMenu 今日菜单
     * @return 结果
     */
    public int updateWebsiteNutritionMenu(WebsiteNutritionMenu websiteNutritionMenu);

    /**
     * 批量删除今日菜单
     * 
     * @param menuIds 需要删除的今日菜单主键集合
     * @return 结果
     */
    public int deleteWebsiteNutritionMenuByMenuIds(Long[] menuIds);

    /**
     * 删除今日菜单信息
     * 
     * @param menuId 今日菜单主键
     * @return 结果
     */
    public int deleteWebsiteNutritionMenuByMenuId(Long menuId);
}




