package com.smartnursinghome.system.service.impl;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.smartnursinghome.common.utils.DateUtils;
import com.smartnursinghome.system.domain.WebsiteFeeDetail;
import com.smartnursinghome.system.service.IWebsiteFeeDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteNursingTaskMapper;
import com.smartnursinghome.system.domain.WebsiteNursingTask;
import com.smartnursinghome.system.service.IWebsiteNursingTaskService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 护理任务Service业务层处理
 *
 * @author ruoyi
 * @date 2025-12-09
 */
@Service
public class WebsiteNursingTaskServiceImpl implements IWebsiteNursingTaskService
{
    @Autowired
    private IWebsiteFeeDetailService feeDetailService; // 注入费用服务
    @Autowired
    private WebsiteNursingTaskMapper websiteNursingTaskMapper;

    /**
     * 查询护理任务
     *
     * @param taskId 护理任务主键
     * @return 护理任务
     */
    @Override
    public WebsiteNursingTask selectWebsiteNursingTaskByTaskId(Long taskId)
    {
        return websiteNursingTaskMapper.selectWebsiteNursingTaskByTaskId(taskId);
    }

    /**
     * 查询护理任务列表
     *
     * @param websiteNursingTask 护理任务
     * @return 护理任务
     */
    @Override
    public List<WebsiteNursingTask> selectWebsiteNursingTaskList(WebsiteNursingTask websiteNursingTask)
    {
        return websiteNursingTaskMapper.selectWebsiteNursingTaskList(websiteNursingTask);
    }

    /**
     * 新增护理任务
     *
     * @param websiteNursingTask 护理任务
     * @return 结果
     */
    @Override
    public int insertWebsiteNursingTask(WebsiteNursingTask websiteNursingTask)
    {
        websiteNursingTask.setCreateTime(DateUtils.getNowDate());
        return websiteNursingTaskMapper.insertWebsiteNursingTask(websiteNursingTask);
    }

    /**
     * 修改护理任务
     *
     * @param task 护理任务
     * @return 结果
     */
    @Override
    @Transactional
    public int updateWebsiteNursingTask(WebsiteNursingTask task) {
        // 1. 获取更新前的旧数据（检查状态是否发生变化）
        WebsiteNursingTask oldTask = websiteNursingTaskMapper.selectWebsiteNursingTaskByTaskId(task.getTaskId());

        // 2. 执行常规更新
        int rows = websiteNursingTaskMapper.updateWebsiteNursingTask(task);

        // 3. 核心逻辑：如果状态变为"已完成"，且之前不是"已完成"，则触发自动计费
        if (rows > 0 && "1".equals(task.getStatus()) && !"1".equals(oldTask.getStatus())) {
            // 构建费用明细对象
            WebsiteFeeDetail fee = new WebsiteFeeDetail();
            fee.setElderlyId(oldTask.getElderlyId()); // 老人ID
            fee.setFeeType("nursing"); // 费用类型：护理费
            fee.setFeeName(oldTask.getProjectName()); // 费用名称：项目名
            fee.setFeeAmount(oldTask.getProjectPrice()); // 金额：当时记录的单价
            fee.setFeeDate(task.getExecuteTime() != null ? task.getExecuteTime() : new Date()); // 费用日期：实际执行时间
            fee.setFeeMonth(DateUtils.parseDateToStr("yyyy-MM", fee.getFeeDate())); // 费用月份
            fee.setIsPaid("0"); // 状态：未支付
            fee.setRemark("护理任务自动生成：" + (task.getTaskRemark() != null ? task.getTaskRemark() : ""));

            // 调用费用新增接口
            feeDetailService.insertWebsiteFeeDetail(fee);
        }

        return rows;
    }

    /**
     * 批量删除护理任务
     *
     * @param taskIds 需要删除的护理任务主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteNursingTaskByTaskIds(Long[] taskIds)
    {
        return websiteNursingTaskMapper.deleteWebsiteNursingTaskByTaskIds(taskIds);
    }

    /**
     * 删除护理任务信息
     *
     * @param taskId 护理任务主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteNursingTaskByTaskId(Long taskId)
    {
        return websiteNursingTaskMapper.deleteWebsiteNursingTaskByTaskId(taskId);
    }


}
