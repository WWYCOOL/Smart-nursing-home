package com.smartnursinghome.web.controller.website;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.smartnursinghome.common.annotation.Log;
import com.smartnursinghome.common.annotation.Anonymous;
import com.smartnursinghome.common.core.controller.BaseController;
import com.smartnursinghome.common.core.domain.AjaxResult;
import com.smartnursinghome.common.enums.BusinessType;
import com.smartnursinghome.system.domain.WebsiteFamilyUser;
import com.smartnursinghome.system.service.IWebsiteFamilyUserService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 家属用户Controller
 * 
 * @author ruoyi
 * @date 2024-01-15
 */
@RestController
@RequestMapping("/website/family")
public class WebsiteFamilyUserController extends BaseController
{
    @Autowired
    private IWebsiteFamilyUserService websiteFamilyUserService;

    /**
     * 查询家属用户列表
     */
    @PreAuthorize("@ss.hasPermi('website:family:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteFamilyUser websiteFamilyUser)
    {
        startPage();
        List<WebsiteFamilyUser> list = websiteFamilyUserService.selectWebsiteFamilyUserList(websiteFamilyUser);
        return getDataTable(list);
    }

    /**
     * 导出家属用户列表
     */
    @PreAuthorize("@ss.hasPermi('website:family:export')")
    @Log(title = "家属用户", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteFamilyUser websiteFamilyUser)
    {
        List<WebsiteFamilyUser> list = websiteFamilyUserService.selectWebsiteFamilyUserList(websiteFamilyUser);
        ExcelUtil<WebsiteFamilyUser> util = new ExcelUtil<WebsiteFamilyUser>(WebsiteFamilyUser.class);
        util.exportExcel(response, list, "家属用户数据");
    }

    /**
     * 获取家属用户详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:family:query')")
    @GetMapping(value = "/{familyId}")
    public AjaxResult getInfo(@PathVariable("familyId") Long familyId)
    {
        return success(websiteFamilyUserService.selectWebsiteFamilyUserByFamilyId(familyId));
    }

    /**
     * 新增家属用户
     */
    @PreAuthorize("@ss.hasPermi('website:family:add')")
    @Log(title = "家属用户", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteFamilyUser websiteFamilyUser)
    {
        return toAjax(websiteFamilyUserService.insertWebsiteFamilyUser(websiteFamilyUser));
    }

    /**
     * 修改家属用户
     */
    @PreAuthorize("@ss.hasPermi('website:family:edit')")
    @Log(title = "家属用户", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteFamilyUser websiteFamilyUser)
    {
        return toAjax(websiteFamilyUserService.updateWebsiteFamilyUser(websiteFamilyUser));
    }

    /**
     * 删除家属用户
     */
    @PreAuthorize("@ss.hasPermi('website:family:remove')")
    @Log(title = "家属用户", businessType = BusinessType.DELETE)
	@DeleteMapping("/{familyIds}")
    public AjaxResult remove(@PathVariable Long[] familyIds)
    {
        return toAjax(websiteFamilyUserService.deleteWebsiteFamilyUserByFamilyIds(familyIds));
    }

    /**
     * 家属用户注册
     */
    @Anonymous
    @PostMapping("/register")
    public AjaxResult register(@RequestBody WebsiteFamilyUser websiteFamilyUser)
    {
        try {
            int result = websiteFamilyUserService.registerFamilyUser(websiteFamilyUser);
            if (result > 0) {
                // 返回家属用户ID，供前端创建绑定关系使用
                return AjaxResult.success("注册成功，请等待管理员审核绑定关系", websiteFamilyUser.getFamilyId());
            } else {
                return error("注册失败");
            }
        } catch (Exception e) {
            return error(e.getMessage());
        }
    }

    /**
     * 家属用户登录
     */
    @Anonymous
    @PostMapping("/login")
    public AjaxResult login(@RequestBody WebsiteFamilyUser loginUser)
    {
        try {
            WebsiteFamilyUser familyUser = websiteFamilyUserService.loginFamilyUser(
                loginUser.getUsername(), loginUser.getPassword());
            return success(familyUser);
        } catch (Exception e) {
            return error(e.getMessage());
        }
    }

    /**
     * 获取家属的最新活动记录
     */
    @Anonymous
    @GetMapping("/activities/{familyId}")
    public AjaxResult getFamilyRecentActivities(@PathVariable("familyId") Long familyId)
    {
        try {
            // 这里可以返回一些模拟的活动数据，或者从数据库查询真实的活动记录
            List<Map<String, Object>> activities = new ArrayList<>();
            
            // 模拟活动数据
            Map<String, Object> activity1 = new HashMap<>();
            activity1.put("id", 1);
            activity1.put("time", "2024-01-15 14:30");
            activity1.put("content", "健康报告已更新");
            activity1.put("type", "health");
            activities.add(activity1);
            
            Map<String, Object> activity2 = new HashMap<>();
            activity2.put("id", 2);
            activity2.put("time", "2024-01-15 10:20");
            activity2.put("content", "新增了1张生活照片");
            activity2.put("type", "photo");
            activities.add(activity2);
            
            Map<String, Object> activity3 = new HashMap<>();
            activity3.put("id", 3);
            activity3.put("time", "2024-01-14 16:45");
            activity3.put("content", "护理人员回复了您的咨询");
            activity3.put("type", "communication");
            activities.add(activity3);
            
            Map<String, Object> activity4 = new HashMap<>();
            activity4.put("id", 4);
            activity4.put("time", "2024-01-14 09:15");
            activity4.put("content", "费用明细已更新");
            activity4.put("type", "fee");
            activities.add(activity4);
            
            return success(activities);
        } catch (Exception e) {
            return error(e.getMessage());
        }
    }
}