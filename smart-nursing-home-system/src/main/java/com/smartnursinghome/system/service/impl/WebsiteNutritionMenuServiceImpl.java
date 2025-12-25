package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteNutritionMenuMapper;
import com.smartnursinghome.system.domain.WebsiteNutritionMenu;
import com.smartnursinghome.system.service.IWebsiteNutritionMenuService;

/**
 * 今日菜单Service业务层处�?
 * 
 * @author ruoyi
 * @date 2025-01-22
 */
@Service
public class WebsiteNutritionMenuServiceImpl implements IWebsiteNutritionMenuService 
{
    @Autowired
    private WebsiteNutritionMenuMapper websiteNutritionMenuMapper;

    /**
     * 查询今日菜单
     * 
     * @param menuId 今日菜单主键
     * @return 今日菜单
     */
    @Override
    public WebsiteNutritionMenu selectWebsiteNutritionMenuByMenuId(Long menuId)
    {
        return websiteNutritionMenuMapper.selectWebsiteNutritionMenuByMenuId(menuId);
    }

    /**
     * 查询今日菜单列表
     * 
     * @param websiteNutritionMenu 今日菜单
     * @return 今日菜单
     */
    @Override
    public List<WebsiteNutritionMenu> selectWebsiteNutritionMenuList(WebsiteNutritionMenu websiteNutritionMenu)
    {
        return websiteNutritionMenuMapper.selectWebsiteNutritionMenuList(websiteNutritionMenu);
    }

    /**
     * 新增今日菜单
     * 
     * @param websiteNutritionMenu 今日菜单
     * @return 结果
     */
    @Override
    public int insertWebsiteNutritionMenu(WebsiteNutritionMenu websiteNutritionMenu)
    {
        websiteNutritionMenu.setCreateTime(DateUtils.getNowDate());
        return websiteNutritionMenuMapper.insertWebsiteNutritionMenu(websiteNutritionMenu);
    }

    /**
     * 修改今日菜单
     * 
     * @param websiteNutritionMenu 今日菜单
     * @return 结果
     */
    @Override
    public int updateWebsiteNutritionMenu(WebsiteNutritionMenu websiteNutritionMenu)
    {
        websiteNutritionMenu.setUpdateTime(DateUtils.getNowDate());
        return websiteNutritionMenuMapper.updateWebsiteNutritionMenu(websiteNutritionMenu);
    }

    /**
     * 批量删除今日菜单
     * 
     * @param menuIds 需要删除的今日菜单主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteNutritionMenuByMenuIds(Long[] menuIds)
    {
        return websiteNutritionMenuMapper.deleteWebsiteNutritionMenuByMenuIds(menuIds);
    }

    /**
     * 删除今日菜单信息
     * 
     * @param menuId 今日菜单主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteNutritionMenuByMenuId(Long menuId)
    {
        return websiteNutritionMenuMapper.deleteWebsiteNutritionMenuByMenuId(menuId);
    }
}




