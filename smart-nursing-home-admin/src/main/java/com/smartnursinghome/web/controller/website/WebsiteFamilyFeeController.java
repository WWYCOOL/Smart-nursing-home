package com.smartnursinghome.web.controller.website;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
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
import com.smartnursinghome.system.domain.WebsiteFeeDetail;
import com.smartnursinghome.system.domain.WebsiteFeeQuery;
import com.smartnursinghome.system.service.IWebsiteFeeDetailService;
import com.smartnursinghome.system.service.IWebsiteFeeQueryService;
import com.smartnursinghome.common.utils.poi.ExcelUtil;
import com.smartnursinghome.common.core.page.TableDataInfo;

/**
 * 家属费用查询Controller
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
@RestController
@RequestMapping("/website/fee")
public class WebsiteFamilyFeeController extends BaseController
{
    @Autowired
    private IWebsiteFeeDetailService websiteFeeDetailService;

    @Autowired
    private IWebsiteFeeQueryService websiteFeeQueryService;

    /**
     * 查询家属费用明细列表
     */
    @Anonymous
    @GetMapping("/family/list")
    public TableDataInfo familyList(WebsiteFeeDetail websiteFeeDetail)
    {
        startPage();
        // 通过家属ID查询关联的老人费用
        List<WebsiteFeeDetail> list = websiteFeeDetailService.selectFamilyFeeDetailList(websiteFeeDetail);
        return getDataTable(list);
    }

    /**
     * 查询家属费用统计
     */
    @Anonymous
    @GetMapping("/family/statistics")
    public AjaxResult familyStatistics(WebsiteFeeDetail websiteFeeDetail)
    {
        try {
            Map<String, Object> result = new HashMap<>();
            
            // 获取费用统计
            Map<String, Object> statistics = websiteFeeDetailService.getFamilyFeeStatistics(websiteFeeDetail);
            result.put("statistics", statistics);
            
            // 获取费用类型统计
            List<Map<String, Object>> feeTypeStatistics = websiteFeeDetailService.getFamilyFeeTypeStatistics(websiteFeeDetail);
            result.put("feeTypeStatistics", feeTypeStatistics);
            
            return success(result);
        } catch (Exception e) {
            return error("获取费用统计失败：" + e.getMessage());
        }
    }

    /**
     * 查询家属月度费用汇总
     */
    @Anonymous
    @GetMapping("/family/monthly")
    public AjaxResult familyMonthlyFee(WebsiteFeeDetail websiteFeeDetail)
    {
        try {
            List<Map<String, Object>> monthlyData = websiteFeeDetailService.getFamilyMonthlyFee(websiteFeeDetail);
            return success(monthlyData);
        } catch (Exception e) {
            return error("获取月度费用失败：" + e.getMessage());
        }
    }

    /**
     * 家属支付费用
     */
    @Anonymous
    @PostMapping("/family/pay")
    public AjaxResult familyPayFee(@RequestBody Map<String, Object> payData)
    {
        try {
            Long detailId = Long.valueOf(payData.get("detailId").toString());
            String paymentMethod = payData.get("paymentMethod").toString();
            
            // 更新支付状态
            int result = websiteFeeDetailService.updatePaymentStatus(detailId, paymentMethod);
            if (result > 0) {
                return success("支付成功");
            } else {
                return error("支付失败，请重试");
            }
        } catch (Exception e) {
            return error("支付失败：" + e.getMessage());
        }
    }

    /**
     * 查询家属账单列表
     */
    @Anonymous
    @GetMapping("/family/bills")
    public TableDataInfo familyBills(WebsiteFeeQuery websiteFeeQuery)
    {
        // 默认查询已发送状态的账单
        if (websiteFeeQuery.getQueryStatus() == null) {
            websiteFeeQuery.setQueryStatus("2");
        }
        startPage();
        List<WebsiteFeeQuery> list = websiteFeeQueryService.selectWebsiteFeeQueryList(websiteFeeQuery);
        return getDataTable(list);
    }

    /**
     * 家属账单整单支付
     */
    @Anonymous
    @PostMapping("/family/pay-bill")
    public AjaxResult familyPayBill(@RequestBody Map<String, Object> payData)
    {
        try {
            Long queryId = Long.valueOf(payData.get("queryId").toString());
            String paymentMethod = payData.get("paymentMethod").toString();
            
            int result = websiteFeeQueryService.payBill(queryId, paymentMethod);
            if (result > 0) {
                return success("支付成功");
            } else {
                return error("支付失败，请重试");
            }
        } catch (Exception e) {
            return error("支付失败：" + e.getMessage());
        }
    }
}
