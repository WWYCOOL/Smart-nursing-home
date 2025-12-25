package com.smartnursinghome.system.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.smartnursinghome.system.domain.WebsiteFeeDetail;

/**
 * 费用明细Mapper接口
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
public interface WebsiteFeeDetailMapper 
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
     * 根据查询ID查询费用明细列表
     * 
     * @param queryId 查询ID
     * @return 费用明细集合
     */
    public List<WebsiteFeeDetail> selectWebsiteFeeDetailListByQueryId(Long queryId);

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
     * 删除费用明细
     * 
     * @param detailId 费用明细主键
     * @return 结果
     */
    public int deleteWebsiteFeeDetailByDetailId(Long detailId);

    /**
     * 批量删除费用明细
     * 
     * @param detailIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteFeeDetailByDetailIds(Long[] detailIds);

    /**
     * 根据查询ID删除费用明细
     * 
     * @param queryId 查询ID
     * @return 结果
     */
    public int deleteWebsiteFeeDetailByQueryId(Long queryId);

    /**
     * 批量新增费用明细
     * 
     * @param websiteFeeDetailList 费用明细列表
     * @return 结果
     */
    public int batchInsertWebsiteFeeDetail(List<WebsiteFeeDetail> websiteFeeDetailList);

    /**
     * 获取家属总费�?
     * 
     * @param websiteFeeDetail 查询条件
     * @return 总费�?
     */
    public Double getFamilyTotalAmount(WebsiteFeeDetail websiteFeeDetail);

    /**
     * 获取家属已付费用
     * 
     * @param websiteFeeDetail 查询条件
     * @return 已付费用
     */
    public Double getFamilyPaidAmount(WebsiteFeeDetail websiteFeeDetail);

    /**
     * 获取家属未付费用
     * 
     * @param websiteFeeDetail 查询条件
     * @return 未付费用
     */
    public Double getFamilyUnpaidAmount(WebsiteFeeDetail websiteFeeDetail);

    /**
     * 获取家属费用类型统计
     * 
     * @param websiteFeeDetail 查询条件
     * @return 费用类型统计
     */
    public List<Map<String, Object>> getFamilyFeeTypeStatistics(WebsiteFeeDetail websiteFeeDetail);

    /**
     * 获取家属月度费用汇�?
     * 
     * @param websiteFeeDetail 查询条件
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
    public int updatePaymentStatus(@Param("detailId") Long detailId, @Param("paymentMethod") String paymentMethod);
}

