package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteRoom;

/**
 * 房间管理Mapper接口
 * 
 * @author wwy
 * @date 2025-12-10
 */
public interface WebsiteRoomMapper 
{
    /**
     * 查询房间管理
     * 
     * @param roomId 房间管理主键
     * @return 房间管理
     */
    public WebsiteRoom selectWebsiteRoomByRoomId(Long roomId);

    /**
     * 查询房间管理列表
     * 
     * @param websiteRoom 房间管理
     * @return 房间管理集合
     */
    public List<WebsiteRoom> selectWebsiteRoomList(WebsiteRoom websiteRoom);

    /**
     * 新增房间管理
     * 
     * @param websiteRoom 房间管理
     * @return 结果
     */
    public int insertWebsiteRoom(WebsiteRoom websiteRoom);

    /**
     * 修改房间管理
     * 
     * @param websiteRoom 房间管理
     * @return 结果
     */
    public int updateWebsiteRoom(WebsiteRoom websiteRoom);

    /**
     * 删除房间管理
     * 
     * @param roomId 房间管理主键
     * @return 结果
     */
    public int deleteWebsiteRoomByRoomId(Long roomId);

    /**
     * 批量删除房间管理
     * 
     * @param roomIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteRoomByRoomIds(Long[] roomIds);
}
