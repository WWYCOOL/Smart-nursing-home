package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteFeedback;

/**
 * 意见反馈Mapper接口
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
public interface WebsiteFeedbackMapper 
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
     * 删除意见反馈
     * 
     * @param feedbackId 意见反馈主键
     * @return 结果
     */
    public int deleteWebsiteFeedbackByFeedbackId(Long feedbackId);

    /**
     * 批量删除意见反馈
     * 
     * @param feedbackIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteFeedbackByFeedbackIds(Long[] feedbackIds);
}
