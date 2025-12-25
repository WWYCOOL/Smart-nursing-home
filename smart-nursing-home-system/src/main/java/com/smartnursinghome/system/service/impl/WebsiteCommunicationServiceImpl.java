package com.smartnursinghome.system.service.impl;

import java.util.Comparator;
import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteCommunicationMapper;
import com.smartnursinghome.system.domain.WebsiteCommunication;
import com.smartnursinghome.system.service.IWebsiteCommunicationService;
import com.smartnursinghome.system.service.IActivityRecordService;

/**
 * 网站沟通消息Service业务层处�?
 *
 * @author ruoyi
 * @date 2023-01-01
 */
@Service
public class WebsiteCommunicationServiceImpl implements IWebsiteCommunicationService
{
    @Autowired
    private WebsiteCommunicationMapper websiteCommunicationMapper;

    @Autowired
    private IActivityRecordService activityRecordService;

    /**
     * 查询网站沟通消�?
     *
     * @param messageId 网站沟通消息主�?
     * @return 网站沟通消�?
     */
    @Override
    public WebsiteCommunication selectWebsiteCommunicationByMessageId(Long messageId)
    {
        return websiteCommunicationMapper.selectWebsiteCommunicationByMessageId(messageId);
    }

    /**
     * 查询网站沟通消息列�?
     *
     * @param websiteCommunication 网站沟通消�?
     * @return 网站沟通消�?
     */
    @Override
    public List<WebsiteCommunication> selectWebsiteCommunicationList(WebsiteCommunication websiteCommunication)
    {
        List<WebsiteCommunication> websiteCommunications = websiteCommunicationMapper.selectWebsiteCommunicationList(websiteCommunication);
//根据sendTime降序
        Comparator<WebsiteCommunication> comparator = (o1, o2) -> o2.getSendTime().compareTo(o1.getSendTime());
        return websiteCommunications;
    }

    /**
     * 新增网站沟通消�?
     *
     * @param websiteCommunication 网站沟通消�?
     * @return 结果
     */
    @Override
    public int insertWebsiteCommunication(WebsiteCommunication websiteCommunication)
    {
        websiteCommunication.setCreateTime(DateUtils.getNowDate());
        websiteCommunication.setSendTime(DateUtils.getNowDate());
        if (websiteCommunication.getIsRead() == null) {
            websiteCommunication.setIsRead("0");
        }
        if (websiteCommunication.getMessageType() == null) {
            websiteCommunication.setMessageType("text");
        }
        if (websiteCommunication.getStatus() == null) {
            websiteCommunication.setStatus("0");
        }
        int result = websiteCommunicationMapper.insertWebsiteCommunication(websiteCommunication);

        // 记录动�?
        if (result > 0 && websiteCommunication.getMessageId() != null) {
            try {
                String elderlyName = websiteCommunication.getElderlyName();
                if (elderlyName == null || elderlyName.isEmpty()) {
                    elderlyName = "老人";
                }

                activityRecordService.recordCommunicationActivity(
                    websiteCommunication.getFamilyId(),
                    websiteCommunication.getElderlyId(),
                    elderlyName,
                    websiteCommunication.getMessageId(),
                    "send",
                    websiteCommunication.getSenderType()
                );
            } catch (Exception e) {
                System.err.println("记录沟通动态失�? " + e.getMessage());
            }
        }

        return result;
    }

    /**
     * 修改网站沟通消�?
     *
     * @param websiteCommunication 网站沟通消�?
     * @return 结果
     */
    @Override
    public int updateWebsiteCommunication(WebsiteCommunication websiteCommunication)
    {
        websiteCommunication.setUpdateTime(DateUtils.getNowDate());
        return websiteCommunicationMapper.updateWebsiteCommunication(websiteCommunication);
    }

    /**
     * 批量删除网站沟通消�?
     *
     * @param messageIds 需要删除的网站沟通消息主�?
     * @return 结果
     */
    @Override
    public int deleteWebsiteCommunicationByMessageIds(Long[] messageIds)
    {
        return websiteCommunicationMapper.deleteWebsiteCommunicationByMessageIds(messageIds);
    }

    /**
     * 删除网站沟通消息信�?
     *
     * @param messageId 网站沟通消息主�?
     * @return 结果
     */
    @Override
    public int deleteWebsiteCommunicationByMessageId(Long messageId)
    {
        return websiteCommunicationMapper.deleteWebsiteCommunicationByMessageId(messageId);
    }

    /**
     * 查询家属未读消息数量
     *
     * @param familyId 家属ID
     * @return 未读消息数量
     */
    @Override
    public int selectUnreadCountByFamilyId(Long familyId)
    {
        return websiteCommunicationMapper.selectUnreadCountByFamilyId(familyId);
    }
}
