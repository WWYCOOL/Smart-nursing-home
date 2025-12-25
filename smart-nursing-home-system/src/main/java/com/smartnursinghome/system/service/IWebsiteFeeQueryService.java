package com.smartnursinghome.system.service;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteFeeQuery;
import com.smartnursinghome.system.domain.WebsiteFeeDetail;

/**
 * 费用查询Service接口
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
public interface IWebsiteFeeQueryService 
{
    /**
     * 查询费用查询
     * 
     * @param queryId 费用查询主键
     * @return 费用查询
     */
    public WebsiteFeeQuery selectWebsiteFeeQueryByQueryId(Long queryId);

    /**
     * 查询费用查询列表
     * 
     * @param websiteFeeQuery 费用查询
     * @return 费用查询集合
     */
    public List<WebsiteFeeQuery> selectWebsiteFeeQueryList(WebsiteFeeQuery websiteFeeQuery);

    /**
     * 新增费用查询
     * 
     * @param websiteFeeQuery 费用查询
     * @return 结果
     */
    public int insertWebsiteFeeQuery(WebsiteFeeQuery websiteFeeQuery);

    /**
     * 修改费用查询
     * 
     * @param websiteFeeQuery 费用查询
     * @return 结果
     */
    public int updateWebsiteFeeQuery(WebsiteFeeQuery websiteFeeQuery);

    /**
     * 批量删除费用查询
     * 
     * @param queryIds 需要删除的费用查询主键集合
     * @return 结果
     */
    public int deleteWebsiteFeeQueryByQueryIds(Long[] queryIds);

    /**
     * 删除费用查询信息
     * 
     * @param queryId 费用查询主键
     * @return 结果
     */
    public int deleteWebsiteFeeQueryByQueryId(Long queryId);

    /**
     * 处理费用查询
     * 
     * @param websiteFeeQuery 费用查询
     * @return 结果
     */
    public int processWebsiteFeeQuery(WebsiteFeeQuery websiteFeeQuery);

    /**
     * 发送费用查�?     * 
     * @param websiteFeeQuery 费用查询
     * @return 结果
     */
    public int sendWebsiteFeeQuery(WebsiteFeeQuery websiteFeeQuery);

    /**
     * 生成费用明细
     * 
     * @param queryId 查询ID
     * @return 结果
     */
    public int generateFeeDetails(Long queryId);

    /**
     * 根据查询ID获取费用明细列表
     * 
     * @param queryId 查询ID
     * @return 费用明细列表
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
     * 家属账单整单支付
     * 
     * @param queryId 账单ID
     * @param paymentMethod 支付方式
     * @return 结果
     */
    public int payBill(Long queryId, String paymentMethod);
}
