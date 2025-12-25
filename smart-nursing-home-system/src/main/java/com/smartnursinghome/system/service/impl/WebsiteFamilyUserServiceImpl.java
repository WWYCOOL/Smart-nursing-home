package com.smartnursinghome.system.service.impl;

import java.util.List;
import com.smartnursinghome.common.utils.DateUtils;
import com.smartnursinghome.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteFamilyUserMapper;
import com.smartnursinghome.system.domain.WebsiteFamilyUser;
import com.smartnursinghome.system.service.IWebsiteFamilyUserService;

/**
 * 家属用户Service业务层处理
 * @author ruoyi
 * @date 2024-01-15
 */
@Service
public class WebsiteFamilyUserServiceImpl implements IWebsiteFamilyUserService 
{
    @Autowired
    private WebsiteFamilyUserMapper websiteFamilyUserMapper;

    /**
     * 查询家属用户
     * 
     * @param familyId 家属用户主键
     * @return 家属用户
     */
    @Override
    public WebsiteFamilyUser selectWebsiteFamilyUserByFamilyId(Long familyId)
    {
        return websiteFamilyUserMapper.selectWebsiteFamilyUserByFamilyId(familyId);
    }

    /**
     * 查询家属用户列表
     * 
     * @param websiteFamilyUser 家属用户
     * @return 家属用户
     */
    @Override
    public List<WebsiteFamilyUser> selectWebsiteFamilyUserList(WebsiteFamilyUser websiteFamilyUser)
    {
        return websiteFamilyUserMapper.selectWebsiteFamilyUserList(websiteFamilyUser);
    }

    /**
     * 新增家属用户
     * 
     * @param websiteFamilyUser 家属用户
     * @return 结果
     */
    @Override
    public int insertWebsiteFamilyUser(WebsiteFamilyUser websiteFamilyUser)
    {
        websiteFamilyUser.setCreateTime(DateUtils.getNowDate());
        return websiteFamilyUserMapper.insertWebsiteFamilyUser(websiteFamilyUser);
    }

    /**
     * 修改家属用户
     * 
     * @param websiteFamilyUser 家属用户
     * @return 结果
     */
    @Override
    public int updateWebsiteFamilyUser(WebsiteFamilyUser websiteFamilyUser)
    {
        websiteFamilyUser.setUpdateTime(DateUtils.getNowDate());
        return websiteFamilyUserMapper.updateWebsiteFamilyUser(websiteFamilyUser);
    }

    /**
     * 批量删除家属用户
     * 
     * @param familyIds 需要删除的家属用户主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFamilyUserByFamilyIds(Long[] familyIds)
    {
        return websiteFamilyUserMapper.deleteWebsiteFamilyUserByFamilyIds(familyIds);
    }

    /**
     * 删除家属用户信息
     * 
     * @param familyId 家属用户主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFamilyUserByFamilyId(Long familyId)
    {
        return websiteFamilyUserMapper.deleteWebsiteFamilyUserByFamilyId(familyId);
    }

    /**
     * 根据用户名查询家属用户
     * 
     * @param username 用户名
     * @return 家属用户
     */
    @Override
    public WebsiteFamilyUser selectWebsiteFamilyUserByUsername(String username)
    {
        return websiteFamilyUserMapper.selectWebsiteFamilyUserByUsername(username);
    }

    /**
     * 根据手机号查询家属用户
     * 
     * @param phone 手机号
     * @return 家属用户
     */
    @Override
    public WebsiteFamilyUser selectWebsiteFamilyUserByPhone(String phone)
    {
        return websiteFamilyUserMapper.selectWebsiteFamilyUserByPhone(phone);
    }

    /**
     * 家属用户注册
     * 
     * @param websiteFamilyUser 家属用户信息
     * @return 结果
     */
    @Override
    public int registerFamilyUser(WebsiteFamilyUser websiteFamilyUser)
    {
        // 检查用户名是否已存在
        WebsiteFamilyUser existUser = websiteFamilyUserMapper.selectWebsiteFamilyUserByUsername(websiteFamilyUser.getUsername());
        if (existUser != null) {
            throw new RuntimeException("用户名已存在");
        }
        
        // 检查手机号是否已存在
        WebsiteFamilyUser existPhone = websiteFamilyUserMapper.selectWebsiteFamilyUserByPhone(websiteFamilyUser.getPhone());
        if (existPhone != null) {
            throw new RuntimeException("手机号已存在");
        }
        
        // 加密密码
        websiteFamilyUser.setPassword(SecurityUtils.encryptPassword(websiteFamilyUser.getPassword()));
        websiteFamilyUser.setStatus("0"); // 默认正常状态
        websiteFamilyUser.setCreateBy("system");
        
        int result = websiteFamilyUserMapper.insertWebsiteFamilyUser(websiteFamilyUser);
        return result;
    }

    /**
     * 家属用户登录
     * 
     * @param username 用户名
     * @param password 密码
     * @return 家属用户
     */
    @Override
    public WebsiteFamilyUser loginFamilyUser(String username, String password)
    {
        WebsiteFamilyUser familyUser = websiteFamilyUserMapper.selectWebsiteFamilyUserByUsername(username);
        if (familyUser == null) {
            throw new RuntimeException("用户不存在");
        }
        
        if (!SecurityUtils.matchesPassword(password, familyUser.getPassword())) {
            throw new RuntimeException("密码错误");
        }
        
        if ("1".equals(familyUser.getStatus())) {
            throw new RuntimeException("用户已被停用");
        }
        
        // 检查是否有已审核通过的绑定关系
        boolean hasApprovedRelation = websiteFamilyUserMapper.hasApprovedRelation(familyUser.getFamilyId());
        if (!hasApprovedRelation) {
            throw new RuntimeException("您的账号尚未通过审核，请联系管理员审核绑定关系");
        }
        
        return familyUser;
    }

    @Override
    public int selectWebsiteFamilyUserCount()
    {
        return websiteFamilyUserMapper.selectWebsiteFamilyUserCount();
    }
}
