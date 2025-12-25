package com.smartnursinghome.web.controller.website;

import java.util.List;
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
import com.smartnursinghome.common.core.controller.BaseController;
import com.smartnursinghome.common.core.domain.AjaxResult;
import com.smartnursinghome.common.enums.BusinessType;
import com.smartnursinghome.system.domain.WebsiteFeeQuery;
import com.smartnursinghome.system.domain.WebsiteFeeDetail;
import com.smartnursinghome.system.service.IWebsiteFeeQueryService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 费用查询Controller
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
@RestController
@RequestMapping("/website/feeQuery")
public class WebsiteFeeQueryController extends BaseController
{
    @Autowired
    private IWebsiteFeeQueryService websiteFeeQueryService;

    /**
     * 查询费用查询列表
     */
    @PreAuthorize("@ss.hasPermi('website:fee:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteFeeQuery websiteFeeQuery)
    {
        startPage();
        List<WebsiteFeeQuery> list = websiteFeeQueryService.selectWebsiteFeeQueryList(websiteFeeQuery);
        return getDataTable(list);
    }

    /**
     * 导出费用查询列表
     */
    @PreAuthorize("@ss.hasPermi('website:fee:export')")
    @Log(title = "费用查询", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteFeeQuery websiteFeeQuery)
    {
        List<WebsiteFeeQuery> list = websiteFeeQueryService.selectWebsiteFeeQueryList(websiteFeeQuery);
        ExcelUtil<WebsiteFeeQuery> util = new ExcelUtil<WebsiteFeeQuery>(WebsiteFeeQuery.class);
        util.exportExcel(response, list, "费用查询数据");
    }

    /**
     * 获取费用查询详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:fee:query')")
    @GetMapping(value = "/{queryId}")
    public AjaxResult getInfo(@PathVariable("queryId") Long queryId)
    {
        return success(websiteFeeQueryService.selectWebsiteFeeQueryByQueryId(queryId));
    }

    /**
     * 新增费用查询
     */
    @PreAuthorize("@ss.hasPermi('website:fee:add')")
    @Log(title = "费用查询", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteFeeQuery websiteFeeQuery)
    {
        return toAjax(websiteFeeQueryService.insertWebsiteFeeQuery(websiteFeeQuery));
    }

    /**
     * 修改费用查询
     */
    @PreAuthorize("@ss.hasPermi('website:fee:edit')")
    @Log(title = "费用查询", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteFeeQuery websiteFeeQuery)
    {
        return toAjax(websiteFeeQueryService.updateWebsiteFeeQuery(websiteFeeQuery));
    }

    /**
     * 删除费用查询
     */
    @PreAuthorize("@ss.hasPermi('website:fee:remove')")
    @Log(title = "费用查询", businessType = BusinessType.DELETE)
	@DeleteMapping("/{queryIds}")
    public AjaxResult remove(@PathVariable Long[] queryIds)
    {
        return toAjax(websiteFeeQueryService.deleteWebsiteFeeQueryByQueryIds(queryIds));
    }

    /**
     * 处理费用查询
     */
    @PreAuthorize("@ss.hasPermi('website:fee:process')")
    @Log(title = "费用查询", businessType = BusinessType.UPDATE)
    @PutMapping("/process/{queryId}")
    public AjaxResult process(@PathVariable Long queryId)
    {
        WebsiteFeeQuery websiteFeeQuery = new WebsiteFeeQuery();
        websiteFeeQuery.setQueryId(queryId);
        return toAjax(websiteFeeQueryService.processWebsiteFeeQuery(websiteFeeQuery));
    }

    /**
     * 发送费用查询
     */
    @PreAuthorize("@ss.hasPermi('website:fee:send')")
    @Log(title = "费用查询", businessType = BusinessType.UPDATE)
    @PutMapping("/send/{queryId}")
    public AjaxResult send(@PathVariable Long queryId)
    {
        WebsiteFeeQuery websiteFeeQuery = new WebsiteFeeQuery();
        websiteFeeQuery.setQueryId(queryId);
        return toAjax(websiteFeeQueryService.sendWebsiteFeeQuery(websiteFeeQuery));
    }

    /**
     * 生成费用明细
     */
    @PreAuthorize("@ss.hasPermi('website:fee:process')")
    @Log(title = "费用查询", businessType = BusinessType.UPDATE)
    @PostMapping("/generate/{queryId}")
    public AjaxResult generate(@PathVariable Long queryId)
    {
        int result = websiteFeeQueryService.generateFeeDetails(queryId);
        if (result > 0) {
            return success("成功生成 " + result + " 条费用明细");
        } else {
            return error("生成费用明细失败");
        }
    }

    /**
     * 获取费用明细列表
     */
    @PreAuthorize("@ss.hasPermi('website:fee:query')")
    @GetMapping("/detail/{queryId}")
    public AjaxResult getFeeDetailList(@PathVariable Long queryId)
    {
        List<WebsiteFeeDetail> list = websiteFeeQueryService.selectWebsiteFeeDetailListByQueryId(queryId);
        return success(list);
    }

    /**
     * 新增费用明细
     */
    @PreAuthorize("@ss.hasPermi('website:fee:add')")
    @Log(title = "费用明细", businessType = BusinessType.INSERT)
    @PostMapping("/detail")
    public AjaxResult addFeeDetail(@RequestBody WebsiteFeeDetail websiteFeeDetail)
    {
        return toAjax(websiteFeeQueryService.insertWebsiteFeeDetail(websiteFeeDetail));
    }
}