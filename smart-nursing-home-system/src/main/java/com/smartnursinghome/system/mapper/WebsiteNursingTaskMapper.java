package com.smartnursinghome.system.mapper;

import java.util.List;
import java.util.Map;

import com.smartnursinghome.system.domain.WebsiteNursingTask;

/**
 * 护理任务Mapper接口
 *
 * @author ruoyi
 * @date 2025-12-09
 */
public interface WebsiteNursingTaskMapper
{
    /**
     * 查询护理任务
     *
     * @param taskId 护理任务主键
     * @return 护理任务
     */
    public WebsiteNursingTask selectWebsiteNursingTaskByTaskId(Long taskId);

    /**
     * 查询护理任务列表
     *
     * @param websiteNursingTask 护理任务
     * @return 护理任务集合
     */
    public List<WebsiteNursingTask> selectWebsiteNursingTaskList(WebsiteNursingTask websiteNursingTask);

    /**
     * 新增护理任务
     *
     * @param websiteNursingTask 护理任务
     * @return 结果
     */
    public int insertWebsiteNursingTask(WebsiteNursingTask websiteNursingTask);

    /**
     * 修改护理任务
     *
     * @param websiteNursingTask 护理任务
     * @return 结果
     */
    public int updateWebsiteNursingTask(WebsiteNursingTask websiteNursingTask);

    /**
     * 删除护理任务
     *
     * @param taskId 护理任务主键
     * @return 结果
     */
    public int deleteWebsiteNursingTaskByTaskId(Long taskId);

    /**
     * 批量删除护理任务
     *
     * @param taskIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteNursingTaskByTaskIds(Long[] taskIds);

}
