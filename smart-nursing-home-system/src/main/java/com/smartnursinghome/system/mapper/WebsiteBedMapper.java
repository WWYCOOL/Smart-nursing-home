package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteBed;

/**
 * 床位管理Mapper接口
 * 
 * @author ruoyi
 * @date 2025-12-10
 */
public interface WebsiteBedMapper 
{
    /**
     * 查询床位管理
     * 
     * @param bedId 床位管理主键
     * @return 床位管理
     */
    public WebsiteBed selectWebsiteBedByBedId(Long bedId);

    /**
     * 查询床位管理列表
     * 
     * @param websiteBed 床位管理
     * @return 床位管理集合
     */
    public List<WebsiteBed> selectWebsiteBedList(WebsiteBed websiteBed);

    /**
     * 新增床位管理
     * 
     * @param websiteBed 床位管理
     * @return 结果
     */
    public int insertWebsiteBed(WebsiteBed websiteBed);

    /**
     * 修改床位管理
     * 
     * @param websiteBed 床位管理
     * @return 结果
     */
    public int updateWebsiteBed(WebsiteBed websiteBed);

    /**
     * 删除床位管理
     * 
     * @param bedId 床位管理主键
     * @return 结果
     */
    public int deleteWebsiteBedByBedId(Long bedId);

    /**
     * 批量删除床位管理
     * 
     * @param bedIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteBedByBedIds(Long[] bedIds);
}
