package com.smartnursinghome.system.service.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smartnursinghome.common.utils.DateUtils;
import com.smartnursinghome.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smartnursinghome.system.mapper.WebsiteFeeQueryMapper;
import com.smartnursinghome.system.mapper.WebsiteFeeDetailMapper;
import com.smartnursinghome.system.domain.WebsiteFeeQuery;
import com.smartnursinghome.system.domain.WebsiteFeeDetail;
import com.smartnursinghome.system.service.IWebsiteFeeQueryService;

/**
 * 费用查询Service业务层处�?
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
@Service
public class WebsiteFeeQueryServiceImpl implements IWebsiteFeeQueryService 
{
    @Autowired
    private WebsiteFeeQueryMapper websiteFeeQueryMapper;

    @Autowired
    private WebsiteFeeDetailMapper websiteFeeDetailMapper;

    /**
     * 查询费用查询
     * 
     * @param queryId 费用查询主键
     * @return 费用查询
     */
    @Override
    public WebsiteFeeQuery selectWebsiteFeeQueryByQueryId(Long queryId)
    {
        return websiteFeeQueryMapper.selectWebsiteFeeQueryByQueryId(queryId);
    }

    /**
     * 查询费用查询列表
     * 
     * @param websiteFeeQuery 费用查询
     * @return 费用查询
     */
    @Override
    public List<WebsiteFeeQuery> selectWebsiteFeeQueryList(WebsiteFeeQuery websiteFeeQuery)
    {
        return websiteFeeQueryMapper.selectWebsiteFeeQueryList(websiteFeeQuery);
    }

    /**
     * 新增费用查询
     * 
     * @param websiteFeeQuery 费用查询
     * @return 结果
     */
    @Override
    public int insertWebsiteFeeQuery(WebsiteFeeQuery websiteFeeQuery)
    {
        websiteFeeQuery.setQueryBy(SecurityUtils.getUsername());
        websiteFeeQuery.setQueryTime(DateUtils.getNowDate());
        websiteFeeQuery.setQueryStatus("0");
        return websiteFeeQueryMapper.insertWebsiteFeeQuery(websiteFeeQuery);
    }

    /**
     * 修改费用查询
     * 
     * @param websiteFeeQuery 费用查询
     * @return 结果
     */
    @Override
    public int updateWebsiteFeeQuery(WebsiteFeeQuery websiteFeeQuery)
    {
        return websiteFeeQueryMapper.updateWebsiteFeeQuery(websiteFeeQuery);
    }

    /**
     * 批量删除费用查询
     * 
     * @param queryIds 需要删除的费用查询主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFeeQueryByQueryIds(Long[] queryIds)
    {
        // 先删除相关的费用明细
        for (Long queryId : queryIds) {
            websiteFeeDetailMapper.deleteWebsiteFeeDetailByQueryId(queryId);
        }
        return websiteFeeQueryMapper.deleteWebsiteFeeQueryByQueryIds(queryIds);
    }

    /**
     * 删除费用查询信息
     * 
     * @param queryId 费用查询主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFeeQueryByQueryId(Long queryId)
    {
        // 先删除相关的费用明细
        websiteFeeDetailMapper.deleteWebsiteFeeDetailByQueryId(queryId);
        return websiteFeeQueryMapper.deleteWebsiteFeeQueryByQueryId(queryId);
    }

    /**
     * 处理费用查询
     * 
     * @param websiteFeeQuery 费用查询
     * @return 结果
     */
    @Override
    public int processWebsiteFeeQuery(WebsiteFeeQuery websiteFeeQuery)
    {
        websiteFeeQuery.setProcessBy(SecurityUtils.getUsername());
        return websiteFeeQueryMapper.processWebsiteFeeQuery(websiteFeeQuery);
    }

    /**
     * 发送费用查�?
     * 
     * @param websiteFeeQuery 费用查询
     * @return 结果
     */
    @Override
    public int sendWebsiteFeeQuery(WebsiteFeeQuery websiteFeeQuery)
    {
        return websiteFeeQueryMapper.sendWebsiteFeeQuery(websiteFeeQuery);
    }

    /**
     * 生成费用明细
     * 
     * @param queryId 查询ID
     * @return 结果
     */
    @Override
    public int generateFeeDetails(Long queryId)
    {
        WebsiteFeeQuery query = websiteFeeQueryMapper.selectWebsiteFeeQueryByQueryId(queryId);
        if (query == null) {
            return 0;
        }

        // 从费用明细表中查询指定期间的费用数据
        WebsiteFeeDetail searchDetail = new WebsiteFeeDetail();
        searchDetail.setElderlyId(query.getElderlyId());
        List<WebsiteFeeDetail> existingDetails = websiteFeeDetailMapper.selectWebsiteFeeDetailList(searchDetail);
        
        // 过滤出查询期间内的费用明�?
        List<WebsiteFeeDetail> filteredDetails = existingDetails.stream()
            .filter(detail -> {
                Date feeDate = detail.getFeeDate();
                return feeDate != null && 
                       !feeDate.before(query.getStartDate()) && 
                       !feeDate.after(query.getEndDate());
            })
            .collect(java.util.stream.Collectors.toList());
        
        if (filteredDetails.size() > 0) {
            // 计算总费�?
            BigDecimal totalAmount = filteredDetails.stream()
                .map(WebsiteFeeDetail::getFeeAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
            
            BigDecimal paidAmount = filteredDetails.stream()
                .filter(detail -> "1".equals(detail.getIsPaid()))
                .map(WebsiteFeeDetail::getFeeAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
            
            BigDecimal unpaidAmount = totalAmount.subtract(paidAmount);
            
        // 更新查询结果
        query.setTotalAmount(totalAmount);
        query.setPaidAmount(paidAmount);
        query.setUnpaidAmount(unpaidAmount);
        // 如果查询状态是待处理，则更新为已处理；否则保持原状态（用于刷新�?
        if ("0".equals(query.getQueryStatus())) {
            query.setQueryStatus("1");
            query.setProcessBy(SecurityUtils.getUsername());
            query.setProcessTime(DateUtils.getNowDate());
        } else {
            // 刷新操作，更新处理信�?
            query.setProcessBy(SecurityUtils.getUsername());
            query.setProcessTime(DateUtils.getNowDate());
        }
            
            // 将查询结果保存为JSON格式
            try {
                ObjectMapper objectMapper = new ObjectMapper();
                String queryResult = objectMapper.writeValueAsString(filteredDetails);
                query.setQueryResult(queryResult);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            websiteFeeQueryMapper.updateWebsiteFeeQuery(query);
        } else {
            // 如果没有找到费用明细，设置为0
            query.setTotalAmount(BigDecimal.ZERO);
            query.setPaidAmount(BigDecimal.ZERO);
            query.setUnpaidAmount(BigDecimal.ZERO);
            query.setQueryStatus("1");
            query.setProcessBy(SecurityUtils.getUsername());
            query.setProcessTime(DateUtils.getNowDate());
            query.setQueryResult("[]");
            
            websiteFeeQueryMapper.updateWebsiteFeeQuery(query);
        }

        return filteredDetails.size();
    }

    /**
     * 根据查询ID获取费用明细列表
     * 
     * @param queryId 查询ID
     * @return 费用明细列表
     */
    @Override
    public List<WebsiteFeeDetail> selectWebsiteFeeDetailListByQueryId(Long queryId)
    {
        WebsiteFeeQuery query = websiteFeeQueryMapper.selectWebsiteFeeQueryByQueryId(queryId);
        if (query == null || query.getQueryResult() == null) {
            return new ArrayList<>();
        }
        
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            List<WebsiteFeeDetail> details = objectMapper.readValue(query.getQueryResult(), 
                objectMapper.getTypeFactory().constructCollectionType(List.class, WebsiteFeeDetail.class));
            return details;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * 新增费用明细
     * 
     * @param websiteFeeDetail 费用明细
     * @return 结果
     */
    @Override
    public int insertWebsiteFeeDetail(WebsiteFeeDetail websiteFeeDetail)
    {
        // 设置费用月份
        if (websiteFeeDetail.getFeeDate() != null) {
            SimpleDateFormat monthSdf = new SimpleDateFormat("yyyy-MM");
            websiteFeeDetail.setFeeMonth(monthSdf.format(websiteFeeDetail.getFeeDate()));
        }
        
        return websiteFeeDetailMapper.insertWebsiteFeeDetail(websiteFeeDetail);
    }

    /**
     * 家属账单整单支付
     * 
     * @param queryId 账单ID
     * @param paymentMethod 支付方式
     * @return 结果
     */
    @Override
    @Transactional
    public int payBill(Long queryId, String paymentMethod)
    {
        // 1. 校验账单是否存在且已发送
        WebsiteFeeQuery query = websiteFeeQueryMapper.selectWebsiteFeeQueryByQueryId(queryId);
        if (query == null) {
            throw new RuntimeException("账单不存在");
        }
        if (!"2".equals(query.getQueryStatus())) {
             throw new RuntimeException("账单状态不正确，无法支付");
        }
        
        // 2. 获取明细并更新
        List<WebsiteFeeDetail> details = selectWebsiteFeeDetailListByQueryId(queryId);
        BigDecimal payAmount = BigDecimal.ZERO;
        boolean hasUpdate = false;
        
        for (WebsiteFeeDetail detail : details) {
            if ("0".equals(detail.getIsPaid())) {
                // 更新内存对象
                detail.setIsPaid("1");
                detail.setPaidDate(DateUtils.getNowDate());
                detail.setPaymentMethod(paymentMethod);
                detail.setUpdateTime(DateUtils.getNowDate());
                
                // 更新数据库
                websiteFeeDetailMapper.updatePaymentStatus(detail.getDetailId(), paymentMethod);
                
                payAmount = payAmount.add(detail.getFeeAmount());
                hasUpdate = true;
            }
        }
        
        if (!hasUpdate) {
            return 1; // 没有需要支付的明细，直接返回成功
        }
        
        // 3. 更新总账单金额
        BigDecimal newPaidAmount = query.getPaidAmount().add(payAmount);
        BigDecimal newUnpaidAmount = query.getUnpaidAmount().subtract(payAmount);
        
        if (newUnpaidAmount.compareTo(BigDecimal.ZERO) < 0) {
             newUnpaidAmount = BigDecimal.ZERO;
        }
        
        query.setPaidAmount(newPaidAmount);
        query.setUnpaidAmount(newUnpaidAmount);
        query.setUpdateTime(DateUtils.getNowDate());
        
        // 更新 queryResult JSON
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            String queryResult = objectMapper.writeValueAsString(details);
            query.setQueryResult(queryResult);
        } catch (Exception e) {
            throw new RuntimeException("更新账单明细数据失败");
        }
        
        return websiteFeeQueryMapper.updateWebsiteFeeQuery(query);
    }

    /**
     * 生成模拟费用明细数据
     */
    private List<WebsiteFeeDetail> generateMockFeeDetails(WebsiteFeeQuery query) {
        List<WebsiteFeeDetail> details = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat monthSdf = new SimpleDateFormat("yyyy-MM");
        
        try {
            Date startDate = query.getStartDate();
            Date endDate = query.getEndDate();
            
            Calendar cal = Calendar.getInstance();
            cal.setTime(startDate);
            
            while (!cal.getTime().after(endDate)) {
                Date currentDate = cal.getTime();
                String feeMonth = monthSdf.format(currentDate);
                
                // 生成床位费（每天）
                WebsiteFeeDetail roomFee = new WebsiteFeeDetail();
                roomFee.setQueryId(query.getQueryId());
                roomFee.setElderlyId(query.getElderlyId());
                roomFee.setFeeType("room");
                roomFee.setFeeName("床位费");
                roomFee.setFeeAmount(new BigDecimal("80.00"));
                roomFee.setFeeDate(currentDate);
                roomFee.setFeeMonth(feeMonth);
                roomFee.setIsPaid(Math.random() > 0.3 ? "1" : "0"); // 70%概率已付
                if ("1".equals(roomFee.getIsPaid())) {
                    roomFee.setPaidDate(currentDate);
                    roomFee.setPaymentMethod("bank");
                }
                roomFee.setCreateBy(SecurityUtils.getUsername());
                roomFee.setCreateTime(DateUtils.getNowDate());
                details.add(roomFee);
                
                // 生成餐饮费（每天）
                WebsiteFeeDetail mealFee = new WebsiteFeeDetail();
                mealFee.setQueryId(query.getQueryId());
                mealFee.setElderlyId(query.getElderlyId());
                mealFee.setFeeType("meal");
                mealFee.setFeeName("餐饮费");
                mealFee.setFeeAmount(new BigDecimal("45.00"));
                mealFee.setFeeDate(currentDate);
                mealFee.setFeeMonth(feeMonth);
                mealFee.setIsPaid(Math.random() > 0.2 ? "1" : "0"); // 80%概率已付
                if ("1".equals(mealFee.getIsPaid())) {
                    mealFee.setPaidDate(currentDate);
                    mealFee.setPaymentMethod("wechat");
                }
                mealFee.setCreateBy(SecurityUtils.getUsername());
                mealFee.setCreateTime(DateUtils.getNowDate());
                details.add(mealFee);
                
                // 生成护理费（每天）
                WebsiteFeeDetail nursingFee = new WebsiteFeeDetail();
                nursingFee.setQueryId(query.getQueryId());
                nursingFee.setElderlyId(query.getElderlyId());
                nursingFee.setFeeType("nursing");
                nursingFee.setFeeName("护理费");
                nursingFee.setFeeAmount(new BigDecimal("60.00"));
                nursingFee.setFeeDate(currentDate);
                nursingFee.setFeeMonth(feeMonth);
                nursingFee.setIsPaid(Math.random() > 0.4 ? "1" : "0"); // 60%概率已付
                if ("1".equals(nursingFee.getIsPaid())) {
                    nursingFee.setPaidDate(currentDate);
                    nursingFee.setPaymentMethod("alipay");
                }
                nursingFee.setCreateBy(SecurityUtils.getUsername());
                nursingFee.setCreateTime(DateUtils.getNowDate());
                details.add(nursingFee);
                
                // 随机生成医疗费（每周1-2次）
                if (Math.random() > 0.8) {
                    WebsiteFeeDetail medicalFee = new WebsiteFeeDetail();
                    medicalFee.setQueryId(query.getQueryId());
                    medicalFee.setElderlyId(query.getElderlyId());
                    medicalFee.setFeeType("medical");
                    medicalFee.setFeeName("医疗费");
                    medicalFee.setFeeAmount(new BigDecimal(String.valueOf(50 + Math.random() * 200)).setScale(2, BigDecimal.ROUND_HALF_UP));
                    medicalFee.setFeeDate(currentDate);
                    medicalFee.setFeeMonth(feeMonth);
                    medicalFee.setIsPaid(Math.random() > 0.5 ? "1" : "0");
                    if ("1".equals(medicalFee.getIsPaid())) {
                        medicalFee.setPaidDate(currentDate);
                        medicalFee.setPaymentMethod("cash");
                    }
                    medicalFee.setCreateBy(SecurityUtils.getUsername());
                    medicalFee.setCreateTime(DateUtils.getNowDate());
                    details.add(medicalFee);
                }
                
                cal.add(Calendar.DAY_OF_MONTH, 1);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return details;
    }
}
