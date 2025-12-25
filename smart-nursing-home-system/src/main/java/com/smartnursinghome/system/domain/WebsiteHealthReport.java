package com.smartnursinghome.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 健康报告对象 website_health_report
 * 
 * @author smartnursinghome
 * @date 2023-12-01
 */
public class WebsiteHealthReport extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 报告ID */
    private Long reportId;

    /** 老人ID */
    @Excel(name = "老人ID")
    private Long elderlyId;

    /** 老人姓名 */
    @Excel(name = "老人姓名")
    private String elderlyName;

    /** 报告日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "报告日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reportDate;

    /** 报告类型（体检、医疗、护理） */
    @Excel(name = "报告类型", readConverterExp = "体检=体检,医疗=医疗,护理=护理")
    private String reportType;

    /** 医生姓名 */
    @Excel(name = "医生姓名")
    private String doctorName;

    /** 护士姓名 */
    @Excel(name = "护士姓名")
    private String nurseName;

    /** 生命体征（血压、心率、体温等） */
    @Excel(name = "生命体征")
    private String vitalSigns;

    /** 血压 */
    @Excel(name = "血压")
    private String bloodPressure;

    /** 心率 */
    @Excel(name = "心率")
    private Long heartRate;

    /** 体温 */
    @Excel(name = "体温")
    private BigDecimal temperature;

    /** 体重 */
    @Excel(name = "体重")
    private BigDecimal weight;

    /** 身高 */
    @Excel(name = "身高")
    private BigDecimal height;

    /** 血糖 */
    @Excel(name = "血糖")
    private BigDecimal bloodSugar;

    /** 血氧饱和度 */
    @Excel(name = "血氧饱和度")
    private Long bloodOxygen;

    /** 症状描述 */
    @Excel(name = "症状描述")
    private String symptoms;

    /** 诊断结果 */
    @Excel(name = "诊断结果")
    private String diagnosis;

    /** 治疗方案 */
    @Excel(name = "治疗方案")
    private String treatment;

    /** 用药情况 */
    @Excel(name = "用药情况")
    private String medications;

    /** 护理记录 */
    @Excel(name = "护理记录")
    private String nursingNotes;

    /** 建议 */
    @Excel(name = "建议")
    private String recommendations;

    /** 下次检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下次检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date nextCheckDate;

    /** 附件（检查报告图片等） */
    @Excel(name = "附件")
    private String attachments;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public Long getReportId()
    {
        return reportId;
    }

    public void setReportId(Long reportId)
    {
        this.reportId = reportId;
    }

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

    public Date getReportDate()
    {
        return reportDate;
    }

    public void setReportDate(Date reportDate)
    {
        this.reportDate = reportDate;
    }

    public String getReportType()
    {
        return reportType;
    }

    public void setReportType(String reportType)
    {
        this.reportType = reportType;
    }

    public String getDoctorName()
    {
        return doctorName;
    }

    public void setDoctorName(String doctorName)
    {
        this.doctorName = doctorName;
    }

    public String getNurseName()
    {
        return nurseName;
    }

    public void setNurseName(String nurseName)
    {
        this.nurseName = nurseName;
    }

    public String getVitalSigns()
    {
        return vitalSigns;
    }

    public void setVitalSigns(String vitalSigns)
    {
        this.vitalSigns = vitalSigns;
    }

    public String getBloodPressure()
    {
        return bloodPressure;
    }

    public void setBloodPressure(String bloodPressure)
    {
        this.bloodPressure = bloodPressure;
    }

    public Long getHeartRate()
    {
        return heartRate;
    }

    public void setHeartRate(Long heartRate)
    {
        this.heartRate = heartRate;
    }

    public BigDecimal getTemperature()
    {
        return temperature;
    }

    public void setTemperature(BigDecimal temperature)
    {
        this.temperature = temperature;
    }

    public BigDecimal getWeight()
    {
        return weight;
    }

    public void setWeight(BigDecimal weight)
    {
        this.weight = weight;
    }

    public BigDecimal getHeight()
    {
        return height;
    }

    public void setHeight(BigDecimal height)
    {
        this.height = height;
    }

    public BigDecimal getBloodSugar()
    {
        return bloodSugar;
    }

    public void setBloodSugar(BigDecimal bloodSugar)
    {
        this.bloodSugar = bloodSugar;
    }

    public Long getBloodOxygen()
    {
        return bloodOxygen;
    }

    public void setBloodOxygen(Long bloodOxygen)
    {
        this.bloodOxygen = bloodOxygen;
    }

    public String getSymptoms()
    {
        return symptoms;
    }

    public void setSymptoms(String symptoms)
    {
        this.symptoms = symptoms;
    }

    public String getDiagnosis()
    {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis)
    {
        this.diagnosis = diagnosis;
    }

    public String getTreatment()
    {
        return treatment;
    }

    public void setTreatment(String treatment)
    {
        this.treatment = treatment;
    }

    public String getMedications()
    {
        return medications;
    }

    public void setMedications(String medications)
    {
        this.medications = medications;
    }

    public String getNursingNotes()
    {
        return nursingNotes;
    }

    public void setNursingNotes(String nursingNotes)
    {
        this.nursingNotes = nursingNotes;
    }

    public String getRecommendations()
    {
        return recommendations;
    }

    public void setRecommendations(String recommendations)
    {
        this.recommendations = recommendations;
    }

    public Date getNextCheckDate()
    {
        return nextCheckDate;
    }

    public void setNextCheckDate(Date nextCheckDate)
    {
        this.nextCheckDate = nextCheckDate;
    }

    public String getAttachments()
    {
        return attachments;
    }

    public void setAttachments(String attachments)
    {
        this.attachments = attachments;
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
            .append("reportId", getReportId())
            .append("elderlyId", getElderlyId())
            .append("elderlyName", getElderlyName())
            .append("reportDate", getReportDate())
            .append("reportType", getReportType())
            .append("doctorName", getDoctorName())
            .append("nurseName", getNurseName())
            .append("vitalSigns", getVitalSigns())
            .append("bloodPressure", getBloodPressure())
            .append("heartRate", getHeartRate())
            .append("temperature", getTemperature())
            .append("weight", getWeight())
            .append("height", getHeight())
            .append("bloodSugar", getBloodSugar())
            .append("bloodOxygen", getBloodOxygen())
            .append("symptoms", getSymptoms())
            .append("diagnosis", getDiagnosis())
            .append("treatment", getTreatment())
            .append("medications", getMedications())
            .append("nursingNotes", getNursingNotes())
            .append("recommendations", getRecommendations())
            .append("nextCheckDate", getNextCheckDate())
            .append("attachments", getAttachments())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}


