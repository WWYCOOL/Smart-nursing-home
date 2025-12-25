package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteCommunication;

/**
 * 网站沟通消息Mapper接口
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
public interface WebsiteCommunicationMapper 
{
    /**
     * 查询网站沟通消�?
     * 
     * @param messageId 网站沟通消息主�?
     * @return 网站沟通消�?
     */
    public WebsiteCommunication selectWebsiteCommunicationByMessageId(Long messageId);

    /**
     * 查询网站沟通消息列�?
     * 
     * @param websiteCommunication 网站沟通消�?
     * @return 网站沟通消息集�?
     */
    public List<WebsiteCommunication> selectWebsiteCommunicationList(WebsiteCommunication websiteCommunication);

    /**
     * 新增网站沟通消�?
     * 
     * @param websiteCommunication 网站沟通消�?
     * @return 结果
     */
    public int insertWebsiteCommunication(WebsiteCommunication websiteCommunication);

    /**
     * 修改网站沟通消�?
     * 
     * @param websiteCommunication 网站沟通消�?
     * @return 结果
     */
    public int updateWebsiteCommunication(WebsiteCommunication websiteCommunication);

    /**
     * 删除网站沟通消�?
     * 
     * @param messageId 网站沟通消息主�?
     * @return 结果
     */
    public int deleteWebsiteCommunicationByMessageId(Long messageId);

    /**
     * 批量删除网站沟通消�?
     * 
     * @param messageIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteCommunicationByMessageIds(Long[] messageIds);

    /**
     * 查询家属未读消息数量
     * 
     * @param familyId 家属ID
     * @return 未读消息数量
     */
    public int selectUnreadCountByFamilyId(Long familyId);
}
