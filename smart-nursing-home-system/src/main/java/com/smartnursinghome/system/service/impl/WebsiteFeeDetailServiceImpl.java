package com.smartnursinghome.system.service.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import com.smartnursinghome.common.utils.DateUtils;
import com.smartnursinghome.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.system.mapper.WebsiteFeeDetailMapper;
import com.smartnursinghome.system.mapper.WebsiteFamilyUserMapper;
import com.smartnursinghome.system.domain.WebsiteFeeDetail;
import com.smartnursinghome.system.service.IWebsiteFeeDetailService;
import com.smartnursinghome.system.service.IActivityRecordService;

/**
 * 费用明细Service业务层处理
 *
 * @author ruoyi
 * @date 2023-01-01
 */
@Service
public class WebsiteFeeDetailServiceImpl implements IWebsiteFeeDetailService
{
    @Autowired
    private WebsiteFeeDetailMapper websiteFeeDetailMapper;

    @Autowired
    private WebsiteFamilyUserMapper websiteFamilyUserMapper;

    @Autowired
    private IActivityRecordService activityRecordService;

    /**
     * 查询费用明细
     *
     * @param detailId 费用明细主键
     * @return 费用明细
     */
    @Override
    public WebsiteFeeDetail selectWebsiteFeeDetailByDetailId(Long detailId)
    {
        return websiteFeeDetailMapper.selectWebsiteFeeDetailByDetailId(detailId);
    }

    /**
     * 查询费用明细列表
     *
     * @param websiteFeeDetail 费用明细
     * @return 费用明细
     */
    @Override
    public List<WebsiteFeeDetail> selectWebsiteFeeDetailList(WebsiteFeeDetail websiteFeeDetail)
    {

        return websiteFeeDetailMapper.selectWebsiteFeeDetailList(websiteFeeDetail);
    }

    /**
     * 查询家属费用明细列表
     *
     * @param websiteFeeDetail 费用明细
     * @return 费用明细
     */
    @Override
    public List<WebsiteFeeDetail> selectFamilyFeeDetailList(WebsiteFeeDetail websiteFeeDetail)
    {
        return websiteFeeDetailMapper.selectFamilyFeeDetailList(websiteFeeDetail);
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
            java.text.SimpleDateFormat monthSdf = new java.text.SimpleDateFormat("yyyy-MM");
            websiteFeeDetail.setFeeMonth(monthSdf.format(websiteFeeDetail.getFeeDate()));
        }

        websiteFeeDetail.setCreateBy(SecurityUtils.getUsername());
        websiteFeeDetail.setCreateTime(DateUtils.getNowDate());
        return websiteFeeDetailMapper.insertWebsiteFeeDetail(websiteFeeDetail);
    }

    /**
     * 修改费用明细
     *
     * @param websiteFeeDetail 费用明细
     * @return 结果
     */
    @Override
    public int updateWebsiteFeeDetail(WebsiteFeeDetail websiteFeeDetail)
    {
        // 更新费用月份
        if (websiteFeeDetail.getFeeDate() != null) {
            java.text.SimpleDateFormat monthSdf = new java.text.SimpleDateFormat("yyyy-MM");
            websiteFeeDetail.setFeeMonth(monthSdf.format(websiteFeeDetail.getFeeDate()));
        }

        websiteFeeDetail.setUpdateBy(SecurityUtils.getUsername());
        websiteFeeDetail.setUpdateTime(DateUtils.getNowDate());
        return websiteFeeDetailMapper.updateWebsiteFeeDetail(websiteFeeDetail);
    }

    /**
     * 批量删除费用明细
     *
     * @param detailIds 需要删除的费用明细主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFeeDetailByDetailIds(Long[] detailIds)
    {
        return websiteFeeDetailMapper.deleteWebsiteFeeDetailByDetailIds(detailIds);
    }

    /**
     * 删除费用明细信息
     *
     * @param detailId 费用明细主键
     * @return 结果
     */
    @Override
    public int deleteWebsiteFeeDetailByDetailId(Long detailId)
    {
        return websiteFeeDetailMapper.deleteWebsiteFeeDetailByDetailId(detailId);
    }

    /**
     * 批量更新支付状态
     *
     * @param feeDetails 费用明细列表
     * @return 结果
     */
    @Override
    public int batchUpdatePayment(List<WebsiteFeeDetail> feeDetails)
    {
        int count = 0;
        for (WebsiteFeeDetail detail : feeDetails) {
            detail.setUpdateBy(SecurityUtils.getUsername());
            detail.setUpdateTime(DateUtils.getNowDate());
            count += websiteFeeDetailMapper.updateWebsiteFeeDetail(detail);
        }
        return count;
    }

    /**
     * 获取家属费用统计
     */
    @Override
    public Map<String, Object> getFamilyFeeStatistics(WebsiteFeeDetail websiteFeeDetail)
    {
        Map<String, Object> result = new HashMap<>();

        // 获取总费用
        Double totalAmount = websiteFeeDetailMapper.getFamilyTotalAmount(websiteFeeDetail);
        result.put("totalAmount", totalAmount != null ? totalAmount : 0.0);

        // 获取已付费用
        Double paidAmount = websiteFeeDetailMapper.getFamilyPaidAmount(websiteFeeDetail);
        result.put("paidAmount", paidAmount != null ? paidAmount : 0.0);

        // 获取未付费用
        Double unpaidAmount = websiteFeeDetailMapper.getFamilyUnpaidAmount(websiteFeeDetail);
        result.put("unpaidAmount", unpaidAmount != null ? unpaidAmount : 0.0);

        return result;
    }

    /**
     * 获取家属费用类型统计
     */
    @Override
    public List<Map<String, Object>> getFamilyFeeTypeStatistics(WebsiteFeeDetail websiteFeeDetail)
    {
        return websiteFeeDetailMapper.getFamilyFeeTypeStatistics(websiteFeeDetail);
    }

    /**
     * 获取家属月度费用汇总
     */
    @Override
    public List<Map<String, Object>> getFamilyMonthlyFee(WebsiteFeeDetail websiteFeeDetail)
    {
        return websiteFeeDetailMapper.getFamilyMonthlyFee(websiteFeeDetail);
    }

    /**
     * 更新支付状态
     */
    @Override
    public int updatePaymentStatus(Long detailId, String paymentMethod)
    {
        int result = websiteFeeDetailMapper.updatePaymentStatus(detailId, paymentMethod);

        // 记录动态
        if (result > 0) {
            try {
                // 获取费用明细信息
                WebsiteFeeDetail feeDetail = websiteFeeDetailMapper.selectWebsiteFeeDetailByDetailId(detailId);
                if (feeDetail != null) {
                    String elderlyName = feeDetail.getElderlyName();
                    if (elderlyName == null || elderlyName.isEmpty()) {
                        elderlyName = "老人";
                    }

                    // 获取家属ID（根据业务从关系表查询）
                    Long familyId = getFamilyIdByElderlyId(feeDetail.getElderlyId());
                    if (familyId != null) {
                        activityRecordService.recordFeeActivity(
                            familyId,
                            feeDetail.getElderlyId(),
                            elderlyName,
                            detailId,
                            "pay",
                            feeDetail.getFeeType()
                        );
                    }
                }
            } catch (Exception e) {
                System.err.println("记录费用支付动态失败 " + e.getMessage());
            }
        }

        return result;
    }

    /**
     * 根据老人ID获取家属ID
     * 通过查询绑定关系表动态获取
     */
    private Long getFamilyIdByElderlyId(Long elderlyId) {
        try {
            if (elderlyId == null) {
                System.out.println("老人ID为空，无法获取家属ID");
                return null;
            }

            System.out.println("查询老人ID " + elderlyId + " 对应的家属ID");

            // 使用数据库查询获取真实的家属ID
            Long familyId = websiteFamilyUserMapper.getFamilyIdByElderlyId(elderlyId);

            if (familyId != null) {
                System.out.println("找到家属ID: " + familyId);
                return familyId;
            } else {
                System.out.println("未找到老人ID " + elderlyId + " 对应的家属，使用默认家属ID 25");
                return 25L; // 默认返回张大爷的家属ID
            }
        } catch (Exception e) {
            System.err.println("获取家属ID失败: " + e.getMessage());
            e.printStackTrace();
            return 25L; // 默认返回张大爷的家属ID
        }
    }
}
