package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteRoomMapper;
import com.smartnursinghome.system.domain.WebsiteRoom;
import com.smartnursinghome.system.service.IWebsiteRoomService;

/**
 * 房间管理Service业务层处理
 *
 * @author wwy
 * @date 2025-12-10
 */
@Service
public class WebsiteRoomServiceImpl implements IWebsiteRoomService
{
    @Autowired
    private WebsiteRoomMapper websiteRoomMapper;

    /**
     * 查询房间管理
     *
     * @param roomId 房间管理主键
     * @return 房间管理
     */
    @Override
    public WebsiteRoom selectWebsiteRoomByRoomId(Long roomId)
    {
        return websiteRoomMapper.selectWebsiteRoomByRoomId(roomId);
    }

    /**
     * 查询房间管理列表
     *
     * @param websiteRoom 房间管理
     * @return 房间管理
     */
    @Override
    public List<WebsiteRoom> selectWebsiteRoomList(WebsiteRoom websiteRoom)
    {
        return websiteRoomMapper.selectWebsiteRoomList(websiteRoom);
    }

    /**
     * 新增房间管理
     *
     * @param websiteRoom 房间管理
     * @return 结果
     */
    @Override
    public int insertWebsiteRoom(WebsiteRoom websiteRoom)
    {
        websiteRoom.setCreateTime(DateUtils.getNowDate());
        return websiteRoomMapper.insertWebsiteRoom(websiteRoom);
    }

    /**
     * 修改房间管理
     *
     * @param websiteRoom 房间管理
     * @return 结果
     */
    @Override
    public int updateWebsiteRoom(WebsiteRoom websiteRoom)
    {
        websiteRoom.setUpdateTime(DateUtils.getNowDate());
        return websiteRoomMapper.updateWebsiteRoom(websiteRoom);
    }

    /**
     * 批量删除房间管理
     *
     * @param roomIds 需要删除的房间管理主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteRoomByRoomIds(Long[] roomIds)
    {
        return websiteRoomMapper.deleteWebsiteRoomByRoomIds(roomIds);
    }

    /**
     * 删除房间管理信息
     *
     * @param roomId 房间管理主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteRoomByRoomId(Long roomId)
    {
        return websiteRoomMapper.deleteWebsiteRoomByRoomId(roomId);
    }
}
