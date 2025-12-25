package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 家属老人关系对象 website_family_elderly_relation
 * 
 * @author smartnursinghome
 * @date 2024-03-15
 */
public class WebsiteFamilyElderlyRelation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 关系ID */
    private Long relationId;

    /** 家属用户ID */
    @Excel(name = "家属用户ID")
    private Long familyUserId;

    /** 家属ID（简化引用） */
    @Excel(name = "家属ID")
    private Long familyId;

    /** 老人ID */
    @Excel(name = "老人ID")
    private Long elderlyId;

    /** 关系类型 */
    @Excel(name = "关系类型")
    private String relationType;

    /** 是否主要联系人 */
    @Excel(name = "是否主要联系人", readConverterExp = "0=否,1=是")
    private String isPrimary;

    /** 绑定状态 */
    @Excel(name = "绑定状态", readConverterExp = "0=待审核,1=已绑定,2=已拒绝")
    private String bindStatus;

    /** 绑定时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "绑定时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date bindTime;

    /** 审核人 */
    @Excel(name = "审核人")
    private String auditor;

    /** 审核时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date auditTime;

    /** 审核备注 */
    @Excel(name = "审核备注")
    private String auditRemark;

    /** 验证码（用于绑定验证） */
    @Excel(name = "验证码")
    private String verifyCode;

    /** 验证码过期时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "验证码过期时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date verifyExpireTime;

    /** 家属姓名 */
    @Excel(name = "家属姓名")
    private String familyName;

    /** 老人姓名 */
    @Excel(name = "老人姓名")
    private String elderlyName;

    /** 家属电话 */
    @Excel(name = "家属电话")
    private String familyPhone;

    /** 老人房间号 */
    @Excel(name = "老人房间号")
    private String elderlyRoomNumber;

    /** 出生日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出生日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date birthDate;

    /** 入住日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入住日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date admissionDate;

    /** 护理等级 */
    @Excel(name = "护理等级")
    private String careLevel;

    /** 健康状况 */
    @Excel(name = "健康状况")
    private String healthStatus;

    /** 性别 */
    @Excel(name = "性别")
    private String gender;

    /** 老人电话 */
    @Excel(name = "老人电话")
    private String elderlyPhone;

    /** 床位号 */
    @Excel(name = "床位号")
    private String bedNumber;

    /** 紧急联系人 */
    @Excel(name = "紧急联系人")
    private String emergencyContact;

    /** 紧急联系电话 */
    @Excel(name = "紧急联系电话")
    private String emergencyPhone;

    /** 病史记录 */
    @Excel(name = "病史记录")
    private String medicalHistory;

    /** 过敏史 */
    @Excel(name = "过敏史")
    private String allergies;

    /** 用药情况 */
    @Excel(name = "用药情况")
    private String medications;

    /** 特殊注意事项 */
    @Excel(name = "特殊注意事项")
    private String specialNotes;

    /** 照片URL */
    @Excel(name = "照片")
    private String photoUrl;

    /** 老人状态 */
    @Excel(name = "老人状态")
    private String elderlyStatus;

    /** 状态（0正常 1删除） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=删除")
    private String status;

    public Long getRelationId()
    {
        return relationId;
    }

    public void setRelationId(Long relationId)
    {
        this.relationId = relationId;
    }

    public Long getFamilyUserId()
    {
        return familyUserId;
    }

    public void setFamilyUserId(Long familyUserId)
    {
        this.familyUserId = familyUserId;
    }

    public Long getFamilyId()
    {
        return familyId;
    }

    public void setFamilyId(Long familyId)
    {
        this.familyId = familyId;
    }

    public Long getElderlyId()
    {
        return elderlyId;
    }

    public void setElderlyId(Long elderlyId)
    {
        this.elderlyId = elderlyId;
    }

    public String getRelationType()
    {
        return relationType;
    }

    public void setRelationType(String relationType)
    {
        this.relationType = relationType;
    }

    /**
     * 兼容服务层以 relationship 命名的访问器
     */
    public String getRelationship()
    {
        return relationType;
    }

    public void setRelationship(String relationship)
    {
        this.relationType = relationship;
    }

    public String getIsPrimary()
    {
        return isPrimary;
    }

    public void setIsPrimary(String isPrimary)
    {
        this.isPrimary = isPrimary;
    }

    public String getBindStatus()
    {
        return bindStatus;
    }

    public void setBindStatus(String bindStatus)
    {
        this.bindStatus = bindStatus;
    }

    public Date getBindTime()
    {
        return bindTime;
    }

    public void setBindTime(Date bindTime)
    {
        this.bindTime = bindTime;
    }

    public String getAuditor()
    {
        return auditor;
    }

    public void setAuditor(String auditor)
    {
        this.auditor = auditor;
    }

    public Date getAuditTime()
    {
        return auditTime;
    }

    public void setAuditTime(Date auditTime)
    {
        this.auditTime = auditTime;
    }

    public String getAuditRemark()
    {
        return auditRemark;
    }

    public void setAuditRemark(String auditRemark)
    {
        this.auditRemark = auditRemark;
    }

    public String getVerifyCode()
    {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode)
    {
        this.verifyCode = verifyCode;
    }

    public Date getVerifyExpireTime()
    {
        return verifyExpireTime;
    }

    public void setVerifyExpireTime(Date verifyExpireTime)
    {
        this.verifyExpireTime = verifyExpireTime;
    }

    public String getFamilyName()
    {
        return familyName;
    }

    public void setFamilyName(String familyName)
    {
        this.familyName = familyName;
    }

    public String getElderlyName()
    {
        return elderlyName;
    }

    public void setElderlyName(String elderlyName)
    {
        this.elderlyName = elderlyName;
    }

    public String getFamilyPhone()
    {
        return familyPhone;
    }

    public void setFamilyPhone(String familyPhone)
    {
        this.familyPhone = familyPhone;
    }

    public String getElderlyRoomNumber()
    {
        return elderlyRoomNumber;
    }

    public void setElderlyRoomNumber(String elderlyRoomNumber)
    {
        this.elderlyRoomNumber = elderlyRoomNumber;
    }

    public Date getBirthDate()
    {
        return birthDate;
    }

    public void setBirthDate(Date birthDate)
    {
        this.birthDate = birthDate;
    }

    public Date getAdmissionDate()
    {
        return admissionDate;
    }

    public void setAdmissionDate(Date admissionDate)
    {
        this.admissionDate = admissionDate;
    }

    public String getCareLevel()
    {
        return careLevel;
    }

    public void setCareLevel(String careLevel)
    {
        this.careLevel = careLevel;
    }

    public String getHealthStatus()
    {
        return healthStatus;
    }

    public void setHealthStatus(String healthStatus)
    {
        this.healthStatus = healthStatus;
    }

    public String getGender()
    {
        return gender;
    }

    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public String getElderlyPhone()
    {
        return elderlyPhone;
    }

    public void setElderlyPhone(String elderlyPhone)
    {
        this.elderlyPhone = elderlyPhone;
    }

    public String getBedNumber()
    {
        return bedNumber;
    }

    public void setBedNumber(String bedNumber)
    {
        this.bedNumber = bedNumber;
    }

    public String getEmergencyContact()
    {
        return emergencyContact;
    }

    public void setEmergencyContact(String emergencyContact)
    {
        this.emergencyContact = emergencyContact;
    }

    public String getEmergencyPhone()
    {
        return emergencyPhone;
    }

    public void setEmergencyPhone(String emergencyPhone)
    {
        this.emergencyPhone = emergencyPhone;
    }

    public String getMedicalHistory()
    {
        return medicalHistory;
    }

    public void setMedicalHistory(String medicalHistory)
    {
        this.medicalHistory = medicalHistory;
    }

    public String getAllergies()
    {
        return allergies;
    }

    public void setAllergies(String allergies)
    {
        this.allergies = allergies;
    }

    public String getMedications()
    {
        return medications;
    }

    public void setMedications(String medications)
    {
        this.medications = medications;
    }

    public String getSpecialNotes()
    {
        return specialNotes;
    }

    public void setSpecialNotes(String specialNotes)
    {
        this.specialNotes = specialNotes;
    }

    public String getPhotoUrl()
    {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl)
    {
        this.photoUrl = photoUrl;
    }

    public String getElderlyStatus()
    {
        return elderlyStatus;
    }

    public void setElderlyStatus(String elderlyStatus)
    {
        this.elderlyStatus = elderlyStatus;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("relationId", getRelationId())
            .append("familyUserId", getFamilyUserId())
            .append("elderlyId", getElderlyId())
            .append("relationType", getRelationType())
            .append("isPrimary", getIsPrimary())
            .append("bindStatus", getBindStatus())
            .append("bindTime", getBindTime())
            .append("auditor", getAuditor())
            .append("auditTime", getAuditTime())
            .append("auditRemark", getAuditRemark())
            .append("verifyCode", getVerifyCode())
            .append("verifyExpireTime", getVerifyExpireTime())
            .append("familyName", getFamilyName())
            .append("elderlyName", getElderlyName())
            .append("familyPhone", getFamilyPhone())
            .append("elderlyRoomNumber", getElderlyRoomNumber())
            .append("birthDate", getBirthDate())
            .append("admissionDate", getAdmissionDate())
            .append("careLevel", getCareLevel())
            .append("healthStatus", getHealthStatus())
            .append("gender", getGender())
            .append("elderlyPhone", getElderlyPhone())
            .append("bedNumber", getBedNumber())
            .append("emergencyContact", getEmergencyContact())
            .append("emergencyPhone", getEmergencyPhone())
            .append("medicalHistory", getMedicalHistory())
            .append("allergies", getAllergies())
            .append("medications", getMedications())
            .append("specialNotes", getSpecialNotes())
            .append("photoUrl", getPhotoUrl())
            .append("elderlyStatus", getElderlyStatus())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}