package com.smartnursinghome.system.service.impl;

import java.util.Date;
import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import com.smartnursinghome.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteFeedbackMapper;
import com.smartnursinghome.system.domain.WebsiteFeedback;
import com.smartnursinghome.system.service.IWebsiteFeedbackService;

/**
 * 意见反馈Service业务层处�?
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
@Service
public class WebsiteFeedbackServiceImpl implements IWebsiteFeedbackService 
{
    @Autowired
    private WebsiteFeedbackMapper websiteFeedbackMapper;

    /**
     * 查询意见反馈
     * 
     * @param feedbackId 意见反馈主键
     * @return 意见反馈
     */
    @Override
    public WebsiteFeedback selectWebsiteFeedbackByFeedbackId(Long feedbackId)
    {
        return websiteFeedbackMapper.selectWebsiteFeedbackByFeedbackId(feedbackId);
    }

    /**
     * 查询意见反馈列表
     * 
     * @param websiteFeedback 意见反馈
     * @return 意见反馈
     */
    @Override
    public List<WebsiteFeedback> selectWebsiteFeedbackList(WebsiteFeedback websiteFeedback)
    {
        return websiteFeedbackMapper.selectWebsiteFeedbackList(websiteFeedback);
    }

    /**
     * 新增意见反馈
     * 
     * @param websiteFeedback 意见反馈
     * @return 结果
     */
    @Override
    public int insertWebsiteFeedback(WebsiteFeedback websiteFeedback)
    {
        websiteFeedback.setCreateTime(DateUtils.getNowDate());
        return websiteFeedbackMapper.insertWebsiteFeedback(websiteFeedback);
    }

    /**
     * 修改意见反馈
     * 
     * @param websiteFeedback 意见反馈
     * @return 结果
     */
    @Override
    public int updateWebsiteFeedback(WebsiteFeedback websiteFeedback)
    {
        websiteFeedback.setUpdateTime(DateUtils.getNowDate());
        return websiteFeedbackMapper.updateWebsiteFeedback(websiteFeedback);
    }

    /**
     * 批量删除意见反馈
     * 
     * @param feedbackIds 需要删除的意见反馈主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFeedbackByFeedbackIds(Long[] feedbackIds)
    {
        return websiteFeedbackMapper.deleteWebsiteFeedbackByFeedbackIds(feedbackIds);
    }

    /**
     * 删除意见反馈信息
     * 
     * @param feedbackId 意见反馈主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFeedbackByFeedbackId(Long feedbackId)
    {
        return websiteFeedbackMapper.deleteWebsiteFeedbackByFeedbackId(feedbackId);
    }

    /**
     * 回复意见反馈
     * 
     * @param websiteFeedback 意见反馈
     * @return 结果
     */
    @Override
    public int replyWebsiteFeedback(WebsiteFeedback websiteFeedback)
    {
        websiteFeedback.setReplyBy(SecurityUtils.getUsername());
        websiteFeedback.setReplyTime(DateUtils.getNowDate());
        websiteFeedback.setUpdateTime(DateUtils.getNowDate());
        return websiteFeedbackMapper.updateWebsiteFeedback(websiteFeedback);
    }

    /**
     * 处理意见反馈
     * 
     * @param websiteFeedback 意见反馈
     * @return 结果
     */
    @Override
    public int processWebsiteFeedback(WebsiteFeedback websiteFeedback)
    {
        websiteFeedback.setProcessBy(SecurityUtils.getUsername());
        websiteFeedback.setProcessTime(DateUtils.getNowDate());
        websiteFeedback.setUpdateTime(DateUtils.getNowDate());
        return websiteFeedbackMapper.updateWebsiteFeedback(websiteFeedback);
    }
}
