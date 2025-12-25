package com.smartnursinghome.system.service;

import java.util.List;
import java.util.Map;
import com.smartnursinghome.system.domain.WebsiteFeeDetail;

/**
 * 费用明细Service接口
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
public interface IWebsiteFeeDetailService 
{
    /**
     * 查询费用明细
     * 
     * @param detailId 费用明细主键
     * @return 费用明细
     */
    public WebsiteFeeDetail selectWebsiteFeeDetailByDetailId(Long detailId);

    /**
     * 查询费用明细列表
     * 
     * @param websiteFeeDetail 费用明细
     * @return 费用明细集合
     */
    public List<WebsiteFeeDetail> selectWebsiteFeeDetailList(WebsiteFeeDetail websiteFeeDetail);

    /**
     * 查询家属费用明细列表
     * 
     * @param websiteFeeDetail 费用明细
     * @return 费用明细集合
     */
    public List<WebsiteFeeDetail> selectFamilyFeeDetailList(WebsiteFeeDetail websiteFeeDetail);

    /**
     * 新增费用明细
     * 
     * @param websiteFeeDetail 费用明细
     * @return 结果
     */
    public int insertWebsiteFeeDetail(WebsiteFeeDetail websiteFeeDetail);

    /**
     * 修改费用明细
     * 
     * @param websiteFeeDetail 费用明细
     * @return 结果
     */
    public int updateWebsiteFeeDetail(WebsiteFeeDetail websiteFeeDetail);

    /**
     * 批量删除费用明细
     * 
     * @param detailIds 需要删除的费用明细主键集合
     * @return 结果
     */
    public int deleteWebsiteFeeDetailByDetailIds(Long[] detailIds);

    /**
     * 删除费用明细信息
     * 
     * @param detailId 费用明细主键
     * @return 结果
     */
    public int deleteWebsiteFeeDetailByDetailId(Long detailId);

    /**
     * 批量更新支付状�?
     * 
     * @param feeDetails 费用明细列表
     * @return 结果
     */
    public int batchUpdatePayment(List<WebsiteFeeDetail> feeDetails);

    /**
     * 获取家属费用统计
     * 
     * @param websiteFeeDetail 费用明细查询条件
     * @return 费用统计
     */
    public Map<String, Object> getFamilyFeeStatistics(WebsiteFeeDetail websiteFeeDetail);

    /**
     * 获取家属费用类型统计
     * 
     * @param websiteFeeDetail 费用明细查询条件
     * @return 费用类型统计
     */
    public List<Map<String, Object>> getFamilyFeeTypeStatistics(WebsiteFeeDetail websiteFeeDetail);

    /**
     * 获取家属月度费用汇�?
     * 
     * @param websiteFeeDetail 费用明细查询条件
     * @return 月度费用汇�?
     */
    public List<Map<String, Object>> getFamilyMonthlyFee(WebsiteFeeDetail websiteFeeDetail);

    /**
     * 更新支付状�?
     * 
     * @param detailId 费用明细ID
     * @param paymentMethod 支付方式
     * @return 结果
     */
    public int updatePaymentStatus(Long detailId, String paymentMethod);
}
