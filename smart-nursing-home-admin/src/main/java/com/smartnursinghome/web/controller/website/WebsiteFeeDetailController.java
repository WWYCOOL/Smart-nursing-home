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
import com.smartnursinghome.system.domain.WebsiteFeeDetail;
import com.smartnursinghome.system.service.IWebsiteFeeDetailService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 费用明细Controller
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
@RestController
@RequestMapping("/website/feeDetail")
public class WebsiteFeeDetailController extends BaseController
{
    @Autowired
    private IWebsiteFeeDetailService websiteFeeDetailService;

    /**
     * 查询费用明细列表
     */
    @PreAuthorize("@ss.hasPermi('website:feeDetail:list')")
    @GetMapping("/list")
    public TableDataInfo list(WebsiteFeeDetail websiteFeeDetail)
    {
        startPage();
        List<WebsiteFeeDetail> list = websiteFeeDetailService.selectWebsiteFeeDetailList(websiteFeeDetail);
        return getDataTable(list);
    }

    /**
     * 导出费用明细列表
     */
    @PreAuthorize("@ss.hasPermi('website:feeDetail:export')")
    @Log(title = "费用明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WebsiteFeeDetail websiteFeeDetail)
    {
        List<WebsiteFeeDetail> list = websiteFeeDetailService.selectWebsiteFeeDetailList(websiteFeeDetail);
        ExcelUtil<WebsiteFeeDetail> util = new ExcelUtil<WebsiteFeeDetail>(WebsiteFeeDetail.class);
        util.exportExcel(response, list, "费用明细数据");
    }

    /**
     * 获取费用明细详细信息
     */
    @PreAuthorize("@ss.hasPermi('website:feeDetail:query')")
    @GetMapping(value = "/{detailId}")
    public AjaxResult getInfo(@PathVariable("detailId") Long detailId)
    {
        return success(websiteFeeDetailService.selectWebsiteFeeDetailByDetailId(detailId));
    }

    /**
     * 新增费用明细
     */
    @PreAuthorize("@ss.hasPermi('website:feeDetail:add')")
    @Log(title = "费用明细", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WebsiteFeeDetail websiteFeeDetail)
    {
        return toAjax(websiteFeeDetailService.insertWebsiteFeeDetail(websiteFeeDetail));
    }

    /**
     * 修改费用明细
     */
    @PreAuthorize("@ss.hasPermi('website:feeDetail:edit')")
    @Log(title = "费用明细", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WebsiteFeeDetail websiteFeeDetail)
    {
        return toAjax(websiteFeeDetailService.updateWebsiteFeeDetail(websiteFeeDetail));
    }

    /**
     * 删除费用明细
     */
    @PreAuthorize("@ss.hasPermi('website:feeDetail:remove')")
    @Log(title = "费用明细", businessType = BusinessType.DELETE)
	@DeleteMapping("/{detailIds}")
    public AjaxResult remove(@PathVariable Long[] detailIds)
    {
        return toAjax(websiteFeeDetailService.deleteWebsiteFeeDetailByDetailIds(detailIds));
    }

    /**
     * 批量更新支付状�?
     */
    @PreAuthorize("@ss.hasPermi('website:feeDetail:batch')")
    @Log(title = "费用明细", businessType = BusinessType.UPDATE)
    @PutMapping("/batchUpdatePayment")
    public AjaxResult batchUpdatePayment(@RequestBody List<WebsiteFeeDetail> feeDetails)
    {
        return toAjax(websiteFeeDetailService.batchUpdatePayment(feeDetails));
    }
}
