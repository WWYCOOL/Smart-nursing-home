package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteBedMapper;
import com.smartnursinghome.system.domain.WebsiteBed;
import com.smartnursinghome.system.service.IWebsiteBedService;

/**
 * 床位管理Service业务层处理
 *
 * @author ruoyi
 * @date 2025-12-10
 */
@Service
public class WebsiteBedServiceImpl implements IWebsiteBedService
{
    @Autowired
    private WebsiteBedMapper websiteBedMapper;

    /**
     * 查询床位管理
     *
     * @param bedId 床位管理主键
     * @return 床位管理
     */
    @Override
    public WebsiteBed selectWebsiteBedByBedId(Long bedId)
    {
        return websiteBedMapper.selectWebsiteBedByBedId(bedId);
    }

    /**
     * 查询床位管理列表
     *
     * @param websiteBed 床位管理
     * @return 床位管理
     */
    @Override
    public List<WebsiteBed> selectWebsiteBedList(WebsiteBed websiteBed)
    {
        return websiteBedMapper.selectWebsiteBedList(websiteBed);
    }

    /**
     * 新增床位管理
     *
     * @param websiteBed 床位管理
     * @return 结果
     */
    @Override
    public int insertWebsiteBed(WebsiteBed websiteBed)
    {
        websiteBed.setCreateTime(DateUtils.getNowDate());
        return websiteBedMapper.insertWebsiteBed(websiteBed);
    }

    /**
     * 修改床位管理
     *
     * @param websiteBed 床位管理
     * @return 结果
     */
    @Override
    public int updateWebsiteBed(WebsiteBed websiteBed)
    {
        websiteBed.setUpdateTime(DateUtils.getNowDate());
        return websiteBedMapper.updateWebsiteBed(websiteBed);
    }

    /**
     * 批量删除床位管理
     *
     * @param bedIds 需要删除的床位管理主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteBedByBedIds(Long[] bedIds)
    {
        return websiteBedMapper.deleteWebsiteBedByBedIds(bedIds);
    }

    /**
     * 删除床位管理信息
     *
     * @param bedId 床位管理主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteBedByBedId(Long bedId)
    {
        return websiteBedMapper.deleteWebsiteBedByBedId(bedId);
    }
}
