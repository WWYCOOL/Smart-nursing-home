package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteNursingProject;

/**
 * 护理项目Service接口
 *
 * @author ruoyi
 * @date 2025-12-09
 */
public interface IWebsiteNursingProjectService
{
    /**
     * 查询护理项目
     *
     * @param projectId 护理项目主键
     * @return 护理项目
     */
    public WebsiteNursingProject selectWebsiteNursingProjectByProjectId(Long projectId);

    /**
     * 查询护理项目列表
     *
     * @param websiteNursingProject 护理项目
     * @return 护理项目集合
     */
    public List<WebsiteNursingProject> selectWebsiteNursingProjectList(WebsiteNursingProject websiteNursingProject);

    /**
     * 新增护理项目
     *
     * @param websiteNursingProject 护理项目
     * @return 结果
     */
    public int insertWebsiteNursingProject(WebsiteNursingProject websiteNursingProject);

    /**
     * 修改护理项目
     *
     * @param websiteNursingProject 护理项目
     * @return 结果
     */
    public int updateWebsiteNursingProject(WebsiteNursingProject websiteNursingProject);

    /**
     * 批量删除护理项目
     *
     * @param projectIds 需要删除的护理项目主键集合
     * @return 结果
     */
    public int deleteWebsiteNursingProjectByProjectIds(Long[] projectIds);

    /**
     * 删除护理项目信息
     *
     * @param projectId 护理项目主键
     * @return 结果
     */
    public int deleteWebsiteNursingProjectByProjectId(Long projectId);
}
