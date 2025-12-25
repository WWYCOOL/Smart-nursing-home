package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteFeedback;

/**
 * 意见反馈Service接口
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
public interface IWebsiteFeedbackService 
{
    /**
     * 查询意见反馈
     * 
     * @param feedbackId 意见反馈主键
     * @return 意见反馈
     */
    public WebsiteFeedback selectWebsiteFeedbackByFeedbackId(Long feedbackId);

    /**
     * 查询意见反馈列表
     * 
     * @param websiteFeedback 意见反馈
     * @return 意见反馈集合
     */
    public List<WebsiteFeedback> selectWebsiteFeedbackList(WebsiteFeedback websiteFeedback);

    /**
     * 新增意见反馈
     * 
     * @param websiteFeedback 意见反馈
     * @return 结果
     */
    public int insertWebsiteFeedback(WebsiteFeedback websiteFeedback);

    /**
     * 修改意见反馈
     * 
     * @param websiteFeedback 意见反馈
     * @return 结果
     */
    public int updateWebsiteFeedback(WebsiteFeedback websiteFeedback);

    /**
     * 批量删除意见反馈
     * 
     * @param feedbackIds 需要删除的意见反馈主键集合
     * @return 结果
     */
    public int deleteWebsiteFeedbackByFeedbackIds(Long[] feedbackIds);

    /**
     * 删除意见反馈信息
     * 
     * @param feedbackId 意见反馈主键
     * @return 结果
     */
    public int deleteWebsiteFeedbackByFeedbackId(Long feedbackId);

    /**
     * 回复意见反馈
     * 
     * @param websiteFeedback 意见反馈
     * @return 结果
     */
    public int replyWebsiteFeedback(WebsiteFeedback websiteFeedback);

    /**
     * 处理意见反馈
     * 
     * @param websiteFeedback 意见反馈
     * @return 结果
     */
    public int processWebsiteFeedback(WebsiteFeedback websiteFeedback);
}
