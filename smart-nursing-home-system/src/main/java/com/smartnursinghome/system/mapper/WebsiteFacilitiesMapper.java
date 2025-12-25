package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteFacilities;

/**
 * 设施管理Mapper接口
 * 
 * @author ruoyi
 * @date 2025-01-27
 */
public interface WebsiteFacilitiesMapper 
{
    /**
     * 查询设施管理
     * 
     * @param facilityId 设施管理主键
     * @return 设施管理
     */
    public WebsiteFacilities selectWebsiteFacilitiesByFacilityId(Long facilityId);

    /**
     * 查询设施管理列表
     * 
     * @param websiteFacilities 设施管理
     * @return 设施管理集合
     */
    public List<WebsiteFacilities> selectWebsiteFacilitiesList(WebsiteFacilities websiteFacilities);

    /**
     * 新增设施管理
     * 
     * @param websiteFacilities 设施管理
     * @return 结果
     */
    public int insertWebsiteFacilities(WebsiteFacilities websiteFacilities);

    /**
     * 修改设施管理
     * 
     * @param websiteFacilities 设施管理
     * @return 结果
     */
    public int updateWebsiteFacilities(WebsiteFacilities websiteFacilities);

    /**
     * 删除设施管理
     * 
     * @param facilityId 设施管理主键
     * @return 结果
     */
    public int deleteWebsiteFacilitiesByFacilityId(Long facilityId);

    /**
     * 批量删除设施管理
     * 
     * @param facilityIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteFacilitiesByFacilityIds(Long[] facilityIds);

    /**
     * 根据设施类型查询设施列表
     * 
     * @param facilityType 设施类型
     * @return 设施列表
     */
    public List<WebsiteFacilities> selectWebsiteFacilitiesByType(String facilityType);
}











