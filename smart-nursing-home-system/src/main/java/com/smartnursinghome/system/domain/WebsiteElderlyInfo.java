package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 老人信息对象 website_elderly_info
 * 
 * @author smartnursinghome
 * @date 2024-03-15
 */
public class WebsiteElderlyInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 老人ID */
    private Long elderlyId;

    /** 老人姓名 */
    @Excel(name = "老人姓名")
    private String elderlyName;

    /** 性别（0男 1女） */
    @Excel(name = "性别", readConverterExp = "0=男,1=女")
    private String gender;

    /** 出生日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出生日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date birthDate;

    /** 年龄 */
    @Excel(name = "年龄")
    private Integer age;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String idCard;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 家庭住址 */
    @Excel(name = "家庭住址")
    private String address;

    /** 紧急联系人 */
    @Excel(name = "紧急联系人")
    private String emergencyContact;

    /** 紧急联系电话 */
    @Excel(name = "紧急联系电话")
    private String emergencyPhone;

    /** 健康状况 */
    @Excel(name = "健康状况")
    private String healthStatus;

    /** 特殊需求 */
    @Excel(name = "特殊需求")
    private String specialNeeds;

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

    /** 入住日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入住日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date admissionDate;

    /** 房间号 */
    @Excel(name = "房间号")
    private String roomNumber;

    /** 床位号 */
    @Excel(name = "床位号")
    private String bedNumber;

    /** 护理等级 */
    @Excel(name = "护理等级")
    private String careLevel;

    /** 照片URL */
    @Excel(name = "照片")
    private String photoUrl;

    /** 状态（0正常 1离院 2请假） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=离院,2=请假")
    private String status;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    public Long getElderlyId()
    {
        return elderlyId;
    }

    public void setElderlyId(Long elderlyId)
    {
        this.elderlyId = elderlyId;
    }

    public String getElderlyName()
    {
        return elderlyName;
    }

    public void setElderlyName(String elderlyName)
    {
        this.elderlyName = elderlyName;
    }

    public String getGender()
    {
        return gender;
    }

    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public Date getBirthDate()
    {
        return birthDate;
    }

    public void setBirthDate(Date birthDate)
    {
        this.birthDate = birthDate;
    }

    public Integer getAge()
    {
        return age;
    }

    public void setAge(Integer age)
    {
        this.age = age;
    }

    public String getIdCard()
    {
        return idCard;
    }

    public void setIdCard(String idCard)
    {
        this.idCard = idCard;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
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

    public String getHealthStatus()
    {
        return healthStatus;
    }

    public void setHealthStatus(String healthStatus)
    {
        this.healthStatus = healthStatus;
    }

    public String getSpecialNeeds()
    {
        return specialNeeds;
    }

    public void setSpecialNeeds(String specialNeeds)
    {
        this.specialNeeds = specialNeeds;
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

    public Date getAdmissionDate()
    {
        return admissionDate;
    }

    public void setAdmissionDate(Date admissionDate)
    {
        this.admissionDate = admissionDate;
    }

    public String getRoomNumber()
    {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber)
    {
        this.roomNumber = roomNumber;
    }

    public String getBedNumber()
    {
        return bedNumber;
    }

    public void setBedNumber(String bedNumber)
    {
        this.bedNumber = bedNumber;
    }

    public String getCareLevel()
    {
        return careLevel;
    }

    public void setCareLevel(String careLevel)
    {
        this.careLevel = careLevel;
    }

    public String getPhotoUrl()
    {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl)
    {
        this.photoUrl = photoUrl;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("elderlyId", getElderlyId())
            .append("elderlyName", getElderlyName())
            .append("gender", getGender())
            .append("birthDate", getBirthDate())
            .append("age", getAge())
            .append("idCard", getIdCard())
            .append("phone", getPhone())
            .append("address", getAddress())
            .append("emergencyContact", getEmergencyContact())
            .append("emergencyPhone", getEmergencyPhone())
            .append("healthStatus", getHealthStatus())
            .append("specialNeeds", getSpecialNeeds())
            .append("medicalHistory", getMedicalHistory())
            .append("allergies", getAllergies())
            .append("medications", getMedications())
            .append("specialNotes", getSpecialNotes())
            .append("admissionDate", getAdmissionDate())
            .append("roomNumber", getRoomNumber())
            .append("bedNumber", getBedNumber())
            .append("careLevel", getCareLevel())
            .append("photoUrl", getPhotoUrl())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}