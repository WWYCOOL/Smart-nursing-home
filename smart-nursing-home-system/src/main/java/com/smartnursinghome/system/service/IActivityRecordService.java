package com.smartnursinghome.system.service;

import com.smartnursinghome.system.domain.WebsiteActivity;

/**
 * 动态记录服务接�?
 * 用于自动记录各种业务操作产生的动�?
 * 
 * @author ruoyi
 * @date 2024-01-01
 */
public interface IActivityRecordService {
    
    /**
     * 记录健康报告相关动�?
     * 
     * @param familyId 家属ID
     * @param elderlyId 老人ID
     * @param elderlyName 老人姓名
     * @param reportId 报告ID
     * @param action 操作类型：add-新增，update-更新
     * @param reportType 报告类型：health-健康报告，medical-医疗报告，physical-体检报告
     */
    void recordHealthActivity(Long familyId, Long elderlyId, String elderlyName, Long reportId, String action, String reportType);
    
    /**
     * 记录沟通消息相关动�?
     * 
     * @param familyId 家属ID
     * @param elderlyId 老人ID
     * @param elderlyName 老人姓名
     * @param messageId 消息ID
     * @param action 操作类型：send-发送，reply-回复
     * @param senderType 发送者类型：family-家属，staff-医护人员
     */
    void recordCommunicationActivity(Long familyId, Long elderlyId, String elderlyName, Long messageId, String action, String senderType);
    
    /**
     * 记录费用相关动�?
     * 
     * @param familyId 家属ID
     * @param elderlyId 老人ID
     * @param elderlyName 老人姓名
     * @param feeId 费用ID
     * @param action 操作类型：add-新增，pay-支付，update-更新
     * @param feeType 费用类型
     */
    void recordFeeActivity(Long familyId, Long elderlyId, String elderlyName, Long feeId, String action, String feeType);
    
    /**
     * 记录护理相关动�?
     * 
     * @param familyId 家属ID
     * @param elderlyId 老人ID
     * @param elderlyName 老人姓名
     * @param careId 护理记录ID
     * @param action 操作类型：add-新增，update-更新，complete-完成
     */
    void recordCareActivity(Long familyId, Long elderlyId, String elderlyName, Long careId, String action);
    
    /**
     * 记录生活照片相关动�?
     * 
     * @param familyId 家属ID
     * @param elderlyId 老人ID
     * @param elderlyName 老人姓名
     * @param photoId 照片ID
     * @param action 操作类型：add-新增，delete-删除
     * @param photoCount 照片数量
     */
    void recordPhotoActivity(Long familyId, Long elderlyId, String elderlyName, Long photoId, String action, Integer photoCount);
}
