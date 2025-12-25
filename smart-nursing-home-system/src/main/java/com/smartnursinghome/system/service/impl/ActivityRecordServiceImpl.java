package com.smartnursinghome.system.service.impl;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smartnursinghome.common.utils.DateUtils;
import com.smartnursinghome.system.domain.WebsiteActivity;
import com.smartnursinghome.system.service.IActivityRecordService;
import com.smartnursinghome.system.service.IWebsiteActivityService;

/**
 * 动态记录服务实现类
 * 用于自动记录各种业务操作产生的动�?
 * 
 * @author ruoyi
 * @date 2024-01-01
 */
@Service
public class ActivityRecordServiceImpl implements IActivityRecordService {
    
    @Autowired
    private IWebsiteActivityService websiteActivityService;
    
    @Override
    public void recordHealthActivity(Long familyId, Long elderlyId, String elderlyName, Long reportId, String action, String reportType) {
        try {
            System.out.println("ActivityRecordService.recordHealthActivity 被调用");
            System.out.println("参数: familyId=" + familyId + ", elderlyId=" + elderlyId + ", elderlyName=" + elderlyName + ", reportId=" + reportId + ", action=" + action + ", reportType=" + reportType);
            
            WebsiteActivity activity = new WebsiteActivity();
            activity.setFamilyId(familyId);
            activity.setElderlyId(elderlyId);
            activity.setElderlyName(elderlyName);
            activity.setActivityType("health");
            activity.setActivityTime(new Date());
            activity.setRelatedId(reportId);
            activity.setRelatedType("health_report");
            activity.setIsRead("0");
            activity.setStatus("0");
            activity.setCreateBy("system");
            activity.setCreateTime(DateUtils.getNowDate());
            
            // 根据操作类型和报告类型生成动态内容
            String content = generateHealthContent(elderlyName, action, reportType);
            activity.setActivityContent(content);
            
            // 设置动态标题
            String title = generateHealthTitle(elderlyName, action, reportType);
            activity.setActivityTitle(title);
            
            System.out.println("准备插入动态记录 " + activity.toString());
            int result = websiteActivityService.insertWebsiteActivity(activity);
            System.out.println("动态记录插入结果 " + result);
        } catch (Exception e) {
            // 记录动态失败不应该影响主业务流程
            System.err.println("记录健康报告动态失败 " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    @Override
    public void recordCommunicationActivity(Long familyId, Long elderlyId, String elderlyName, Long messageId, String action, String senderType) {
        try {
            WebsiteActivity activity = new WebsiteActivity();
            activity.setFamilyId(familyId);
            activity.setElderlyId(elderlyId);
            activity.setElderlyName(elderlyName);
            activity.setActivityType("communication");
            activity.setActivityTime(new Date());
            activity.setRelatedId(messageId);
            activity.setRelatedType("communication");
            activity.setIsRead("0");
            activity.setStatus("0");
            activity.setCreateBy("system");
            activity.setCreateTime(DateUtils.getNowDate());
            
            // 根据操作类型和发送者类型生成动态内容
            String content = generateCommunicationContent(elderlyName, action, senderType);
            activity.setActivityContent(content);
            
            // 设置动态标题
            String title = generateCommunicationTitle(elderlyName, action, senderType);
            activity.setActivityTitle(title);
            
            websiteActivityService.insertWebsiteActivity(activity);
        } catch (Exception e) {
            System.err.println("记录沟通动态失败 " + e.getMessage());
        }
    }
    
    @Override
    public void recordFeeActivity(Long familyId, Long elderlyId, String elderlyName, Long feeId, String action, String feeType) {
        try {
            WebsiteActivity activity = new WebsiteActivity();
            activity.setFamilyId(familyId);
            activity.setElderlyId(elderlyId);
            activity.setElderlyName(elderlyName);
            activity.setActivityType("fee");
            activity.setActivityTime(new Date());
            activity.setRelatedId(feeId);
            activity.setRelatedType("fee_detail");
            activity.setIsRead("0");
            activity.setStatus("0");
            activity.setCreateBy("system");
            activity.setCreateTime(DateUtils.getNowDate());
            
            // 根据操作类型生成动态内容
            String content = generateFeeContent(elderlyName, action, feeType);
            activity.setActivityContent(content);
            
            // 设置动态标题
            String title = generateFeeTitle(elderlyName, action, feeType);
            activity.setActivityTitle(title);
            
            websiteActivityService.insertWebsiteActivity(activity);
        } catch (Exception e) {
            System.err.println("记录费用动态失败 " + e.getMessage());
        }
    }
    
    @Override
    public void recordCareActivity(Long familyId, Long elderlyId, String elderlyName, Long careId, String action) {
        try {
            WebsiteActivity activity = new WebsiteActivity();
            activity.setFamilyId(familyId);
            activity.setElderlyId(elderlyId);
            activity.setElderlyName(elderlyName);
            activity.setActivityType("care");
            activity.setActivityTime(new Date());
            activity.setRelatedId(careId);
            activity.setRelatedType("care_record");
            activity.setIsRead("0");
            activity.setStatus("0");
            activity.setCreateBy("system");
            activity.setCreateTime(DateUtils.getNowDate());
            
            // 根据操作类型生成动态内容
            String content = generateCareContent(elderlyName, action);
            activity.setActivityContent(content);
            
            // 设置动态标题
            String title = generateCareTitle(elderlyName, action);
            activity.setActivityTitle(title);
            
            websiteActivityService.insertWebsiteActivity(activity);
        } catch (Exception e) {
            System.err.println("记录护理动态失败 " + e.getMessage());
        }
    }
    
    @Override
    public void recordPhotoActivity(Long familyId, Long elderlyId, String elderlyName, Long photoId, String action, Integer photoCount) {
        try {
            WebsiteActivity activity = new WebsiteActivity();
            activity.setFamilyId(familyId);
            activity.setElderlyId(elderlyId);
            activity.setElderlyName(elderlyName);
            activity.setActivityType("photo");
            activity.setActivityTime(new Date());
            activity.setRelatedId(photoId);
            activity.setRelatedType("photo");
            activity.setIsRead("0");
            activity.setStatus("0");
            activity.setCreateBy("system");
            activity.setCreateTime(DateUtils.getNowDate());
            
            // 根据操作类型生成动态内容
            String content = generatePhotoContent(elderlyName, action, photoCount);
            activity.setActivityContent(content);
            
            // 设置动态标题
            String title = generatePhotoTitle(elderlyName, action, photoCount);
            activity.setActivityTitle(title);
            
            websiteActivityService.insertWebsiteActivity(activity);
        } catch (Exception e) {
            System.err.println("记录照片动态失败 " + e.getMessage());
        }
    }
    
    /**
     * 生成健康报告动态内?
     */
    private String generateHealthContent(String elderlyName, String action, String reportType) {
        String reportTypeName = getReportTypeName(reportType);
        if ("add".equals(action)) {
            return elderlyName + "的" + reportTypeName + "已生成";
        } else if ("update".equals(action)) {
            return elderlyName + "的" + reportTypeName + "已更新";
        }
        return elderlyName + "的" + reportTypeName + "有变化";
    }
    
    /**
     * 生成沟通动态内?
     */
    private String generateCommunicationContent(String elderlyName, String action, String senderType) {
        if ("send".equals(action) && "family".equals(senderType)) {
            return "您向护理人员发送了关于" + elderlyName + "的咨询";
        } else if ("reply".equals(action) && "staff".equals(senderType)) {
            return "护理人员回复了您关于" + elderlyName + "的咨询";
        } else if ("send".equals(action) && "staff".equals(senderType)) {
            return "护理人员向您发送了关于" + elderlyName + "的重要通知";
        }
        return "您与护理人员关于" + elderlyName + "的沟通有新消息";
    }
    
    /**
     * 生成费用动态内?
     */
    private String generateFeeContent(String elderlyName, String action, String feeType) {
        String feeTypeName = getFeeTypeName(feeType);
        if ("add".equals(action)) {
            return elderlyName + "的" + feeTypeName + "费用已生成";
        } else if ("pay".equals(action)) {
            return elderlyName + "的" + feeTypeName + "费用已支付";
        } else if ("update".equals(action)) {
            return elderlyName + "的" + feeTypeName + "费用已更新";
        }
        return elderlyName + "的" + feeTypeName + "费用有变化";
    }
    
    /**
     * 生成护理动态内?
     */
    private String generateCareContent(String elderlyName, String action) {
        if ("add".equals(action)) {
            return elderlyName + "的护理计划已制定";
        } else if ("update".equals(action)) {
            return elderlyName + "的护理计划已更新";
        } else if ("complete".equals(action)) {
            return elderlyName + "的今日护理工作已完成";
        }
        return elderlyName + "的护理记录有更新";
    }
    
    /**
     * 生成照片动态内�?
     */
    private String generatePhotoContent(String elderlyName, String action, Integer photoCount) {
        if ("add".equals(action)) {
            return "新增" + elderlyName + "的" + photoCount + "张生活照片";
        } else if ("delete".equals(action)) {
            return "删除" + elderlyName + "的" + photoCount + "张生活照片";
        }
        return elderlyName + "的生活照片有变化";
    }
    
    /**
     * 获取报告类型名称
     */
    private String getReportTypeName(String reportType) {
        switch (reportType) {
            case "health": return "健康报告";
            case "medical": return "医疗报告";
            case "physical": return "体检报告";
            default: return "健康报告";
        }
    }
    
    /**
     * 获取费用类型名称
     */
    private String getFeeTypeName(String feeType) {
        switch (feeType) {
            case "accommodation": return "住宿";
            case "meal": return "餐饮";
            case "medical": return "医疗";
            case "nursing": return "护理";
            case "other": return "其他";
            default: return "费用";
        }
    }
    
    /**
     * 生成健康报告动态标�?
     */
    private String generateHealthTitle(String elderlyName, String action, String reportType) {
        String reportTypeName = getReportTypeName(reportType);
        if ("add".equals(action)) {
            return elderlyName + "的" + reportTypeName + "已生成";
        } else if ("update".equals(action)) {
            return elderlyName + "的" + reportTypeName + "已更新";
        }
        return elderlyName + "的" + reportTypeName + "有变化";
    }
    
    /**
     * 生成沟通动态标?
     */
    private String generateCommunicationTitle(String elderlyName, String action, String senderType) {
        if ("send".equals(action) && "family".equals(senderType)) {
            return "您向护理人员发送了关于" + elderlyName + "的咨询";
        } else if ("reply".equals(action) && "staff".equals(senderType)) {
            return "护理人员回复了您关于" + elderlyName + "的咨询";
        } else if ("send".equals(action) && "staff".equals(senderType)) {
            return "护理人员向您发送了关于" + elderlyName + "的重要通知";
        }
        return "您与护理人员关于" + elderlyName + "的沟通有新消息";
    }
    
    /**
     * 生成费用动态标?
     */
    private String generateFeeTitle(String elderlyName, String action, String feeType) {
        String feeTypeName = getFeeTypeName(feeType);
        if ("add".equals(action)) {
            return elderlyName + "的" + feeTypeName + "费用已生成";
        } else if ("pay".equals(action)) {
            return elderlyName + "的" + feeTypeName + "费用已支付";
        } else if ("update".equals(action)) {
            return elderlyName + "的" + feeTypeName + "费用已更新";
        }
        return elderlyName + "的" + feeTypeName + "费用有变化";
    }
    
    /**
     * 生成护理动态标?
     */
    private String generateCareTitle(String elderlyName, String action) {
        if ("add".equals(action)) {
            return elderlyName + "的护理计划已制定";
        } else if ("update".equals(action)) {
            return elderlyName + "的护理计划已更新";
        } else if ("complete".equals(action)) {
            return elderlyName + "的今日护理工作已完成";
        }
        return elderlyName + "的护理记录有更新";
    }
    
    /**
     * 生成照片动态标�?
     */
    private String generatePhotoTitle(String elderlyName, String action, Integer photoCount) {
        if ("add".equals(action)) {
            return "新增" + elderlyName + "的" + photoCount + "张生活照片";
        } else if ("delete".equals(action)) {
            return "删除" + elderlyName + "的" + photoCount + "张生活照片";
        }
        return elderlyName + "的生活照片有变化";
    }
}
