package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteNursingProjectMapper;
import com.smartnursinghome.system.domain.WebsiteNursingProject;
import com.smartnursinghome.system.service.IWebsiteNursingProjectService;

/**
 * 护理项目Service业务层处理
 *
 * @author ruoyi
 * @date 2025-12-09
 */
@Service
public class WebsiteNursingProjectServiceImpl implements IWebsiteNursingProjectService
{
    @Autowired
    private WebsiteNursingProjectMapper websiteNursingProjectMapper;

    /**
     * 查询护理项目
     *
     * @param projectId 护理项目主键
     * @return 护理项目
     */
    @Override
    public WebsiteNursingProject selectWebsiteNursingProjectByProjectId(Long projectId)
    {
        return websiteNursingProjectMapper.selectWebsiteNursingProjectByProjectId(projectId);
    }

    /**
     * 查询护理项目列表
     *
     * @param websiteNursingProject 护理项目
     * @return 护理项目
     */
    @Override
    public List<WebsiteNursingProject> selectWebsiteNursingProjectList(WebsiteNursingProject websiteNursingProject)
    {
        return websiteNursingProjectMapper.selectWebsiteNursingProjectList(websiteNursingProject);
    }

    /**
     * 新增护理项目
     *
     * @param websiteNursingProject 护理项目
     * @return 结果
     */
    @Override
    public int insertWebsiteNursingProject(WebsiteNursingProject websiteNursingProject)
    {
        websiteNursingProject.setCreateTime(DateUtils.getNowDate());
        return websiteNursingProjectMapper.insertWebsiteNursingProject(websiteNursingProject);
    }

    /**
     * 修改护理项目
     *
     * @param websiteNursingProject 护理项目
     * @return 结果
     */
    @Override
    public int updateWebsiteNursingProject(WebsiteNursingProject websiteNursingProject)
    {
        websiteNursingProject.setUpdateTime(DateUtils.getNowDate());
        return websiteNursingProjectMapper.updateWebsiteNursingProject(websiteNursingProject);
    }

    /**
     * 批量删除护理项目
     *
     * @param projectIds 需要删除的护理项目主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteNursingProjectByProjectIds(Long[] projectIds)
    {
        return websiteNursingProjectMapper.deleteWebsiteNursingProjectByProjectIds(projectIds);
    }

    /**
     * 删除护理项目信息
     *
     * @param projectId 护理项目主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteNursingProjectByProjectId(Long projectId)
    {
        return websiteNursingProjectMapper.deleteWebsiteNursingProjectByProjectId(projectId);
    }
}
