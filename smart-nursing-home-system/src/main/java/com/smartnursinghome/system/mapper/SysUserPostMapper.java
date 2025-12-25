package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.SysUserPost;

/**
 * 用户与岗位关联表 数据�?
 * 
 * @author ruoyi
 */
public interface SysUserPostMapper
{
    /**
     * 通过用户ID删除用户和岗位关�?
     * 
     * @param userId 用户ID
     * @return 结果
     */
    public int deleteUserPostByUserId(Long userId);

    /**
     * 通过岗位ID查询岗位使用数量
     * 
     * @param postId 岗位ID
     * @return 结果
     */
    public int countUserPostById(Long postId);

    /**
     * 批量删除用户和岗位关�?
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserPost(Long[] ids);

    /**
     * 批量新增用户岗位信息
     * 
     * @param userPostList 用户岗位列表
     * @return 结果
     */
    public int batchUserPost(List<SysUserPost> userPostList);
}
