package com.smartnursinghome.web.controller.website;

import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.smartnursinghome.common.annotation.Log;
import com.smartnursinghome.common.annotation.Anonymous;
import com.smartnursinghome.common.core.controller.BaseController;
import com.smartnursinghome.common.core.domain.AjaxResult;
import com.smartnursinghome.common.enums.BusinessType;
import com.smartnursinghome.system.domain.WebsiteFamilyElderlyRelation;
import com.smartnursinghome.system.domain.WebsiteElderlyInfo;
import com.smartnursinghome.system.service.IWebsiteFamilyElderlyRelationService;
import com.smartnursinghome.system.service.IWebsiteElderlyInfoService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 家属老人关系Controller
 * 
 * @author ruoyi
 * @date 2024-01-15
 */
@RestController
@RequestMapping("/website/relation")
public class WebsiteFamilyElderlyRelationController extends BaseController
{
    @Autowired
    private IWebsiteFamilyElderlyRelationService websiteFamilyElderlyRelationService;

    @Autowired
    private IWebsiteElderlyInfoService websiteElderlyInfoService;

    /**
     * 查询家属老人关系列表
     */
    @PreAuthorize("@ss.hasPermi('website:relation:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteFamilyElderlyRelation websiteFamilyElderlyRelation)
    {
        startPage();
        List<WebsiteFamilyElderlyRelation> list = websiteFamilyElderlyRelationService.selectWebsiteFamilyElderlyRelationList(websiteFamilyElderlyRelation);
        return getDataTable(list);
    }

    /**
     * 导出家属老人关系列表
     */
    @PreAuthorize("@ss.hasPermi('website:relation:export')")
    @Log(title = "家属老人关系", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteFamilyElderlyRelation websiteFamilyElderlyRelation)
    {
        List<WebsiteFamilyElderlyRelation> list = websiteFamilyElderlyRelationService.selectWebsiteFamilyElderlyRelationList(websiteFamilyElderlyRelation);
        ExcelUtil<WebsiteFamilyElderlyRelation> util = new ExcelUtil<WebsiteFamilyElderlyRelation>(WebsiteFamilyElderlyRelation.class);
        util.exportExcel(response, list, "家属老人关系数据");
    }

    /**
     * 获取家属老人关系详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:relation:query')")
    @GetMapping(value = "/{relationId}")
    public AjaxResult getInfo(@PathVariable("relationId") Long relationId)
    {
        return success(websiteFamilyElderlyRelationService.selectWebsiteFamilyElderlyRelationByRelationId(relationId));
    }

    /**
     * 新增家属老人关系
     */
    @PreAuthorize("@ss.hasPermi('website:relation:add')")
    @Log(title = "家属老人关系", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteFamilyElderlyRelation websiteFamilyElderlyRelation)
    {
        return toAjax(websiteFamilyElderlyRelationService.insertWebsiteFamilyElderlyRelation(websiteFamilyElderlyRelation));
    }

    /**
     * 修改家属老人关系
     */
    @PreAuthorize("@ss.hasPermi('website:relation:edit')")
    @Log(title = "家属老人关系", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteFamilyElderlyRelation websiteFamilyElderlyRelation)
    {
        return toAjax(websiteFamilyElderlyRelationService.updateWebsiteFamilyElderlyRelation(websiteFamilyElderlyRelation));
    }

    /**
     * 删除家属老人关系
     */
    @PreAuthorize("@ss.hasPermi('website:relation:remove')")
    @Log(title = "家属老人关系", businessType = BusinessType.DELETE)
	@DeleteMapping("/{relationIds}")
    public AjaxResult remove(@PathVariable Long[] relationIds)
    {
        return toAjax(websiteFamilyElderlyRelationService.deleteWebsiteFamilyElderlyRelationByRelationIds(relationIds));
    }

    /**
     * 根据家属ID查询绑定的老人列表
     */
    @Anonymous
    @GetMapping("/elderly/{familyId}")
    public AjaxResult getElderlyListByFamilyId(@PathVariable("familyId") Long familyId)
    {
        // 先通过关系表找到绑定的老人ID列表
        List<WebsiteFamilyElderlyRelation> relationList = websiteFamilyElderlyRelationService.selectElderlyListByFamilyId(familyId);
        
        if (relationList != null && !relationList.isEmpty()) {
            // 获取第一个绑定的老人ID
            Long elderlyId = relationList.get(0).getElderlyId();
            
            // 从老人信息主表获取完整的老人信息
            WebsiteElderlyInfo elderlyInfo = websiteElderlyInfoService.selectWebsiteElderlyInfoByElderlyId(elderlyId);
            
            if (elderlyInfo != null) {
                return success(elderlyInfo);
            }
        }
        
        return success(null);
    }

    /**
     * 根据老人ID查询绑定的家属列表
     */
    @GetMapping("/family/{elderlyId}")
    public AjaxResult getFamilyListByElderlyId(@PathVariable("elderlyId") Long elderlyId)
    {
        List<WebsiteFamilyElderlyRelation> list = websiteFamilyElderlyRelationService.selectFamilyListByElderlyId(elderlyId);
        return success(list);
    }

    /**
     * 根据老人身份证号查询老人信息
     */
    @Anonymous
    @GetMapping("/elderly/info")
    public AjaxResult getElderlyByIdCard(@RequestParam("idCard") String idCard)
    {
        // 清理身份证号，去除前后空格
        String cleanIdCard = idCard.trim();
        WebsiteFamilyElderlyRelation elderlyInfo = websiteFamilyElderlyRelationService.selectElderlyByIdCard(cleanIdCard);
        if (elderlyInfo == null) {
            return error("未找到对应的老人信息");
        }
        return success(elderlyInfo);
    }

    /**
     * 创建家属老人绑定关系
     */
    @Anonymous
    @PostMapping("/create")
    public AjaxResult createRelation(@RequestBody Map<String, Object> params)
    {
        try {
            Object familyIdObj = params.get("familyId");
            Object elderlyIdCardObj = params.get("elderlyIdCard");
            Object relationshipObj = params.get("relationship");
            
            if (familyIdObj == null || elderlyIdCardObj == null || relationshipObj == null) {
                return error("参数不完整");
            }
            
            Long familyId = Long.valueOf(familyIdObj.toString());
            String elderlyIdCard = elderlyIdCardObj.toString();
            String relationship = relationshipObj.toString();
            
            int result = websiteFamilyElderlyRelationService.createFamilyElderlyRelation(familyId, elderlyIdCard, relationship);
            if (result > 0) {
                return success("绑定关系创建成功，等待审核");
            } else {
                return error("绑定关系创建失败");
            }
        } catch (Exception e) {
            return error(e.getMessage());
        }
    }

    /**
     * 审核家属老人关系
     */
    @PreAuthorize("@ss.hasPermi('website:relation:audit')")
    @Log(title = "审核家属老人关系", businessType = BusinessType.UPDATE)
    @PostMapping("/audit")
    public AjaxResult auditRelation(@RequestParam("relationId") Long relationId, 
                                  @RequestParam("bindStatus") String bindStatus)
    {
        try {
            int result = websiteFamilyElderlyRelationService.auditFamilyElderlyRelation(relationId, bindStatus);
            if (result > 0) {
                String statusText = "1".equals(bindStatus) ? "审核通过" : "审核拒绝";
                return success(statusText + "成功");
            } else {
                return error("审核失败");
            }
        } catch (Exception e) {
            return error(e.getMessage());
        }
    }
}