package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 家属用户对象 website_family_user
 * 
 * @author smartnursinghome
 * @date 2024-03-15
 */
public class WebsiteFamilyUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户ID */
    private Long userId;

    /** 家属ID */
    @Excel(name = "家属ID")
    private Long familyId;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    /** 密码 */
    private String password;

    /** 家属姓名 */
    @Excel(name = "家属姓名")
    private String familyName;

    /** 性别 */
    @Excel(name = "性别", readConverterExp = "0=男,1=女")
    private String gender;

    /** 年龄 */
    @Excel(name = "年龄")
    private Integer age;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String idCard;

    /** 家庭住址 */
    @Excel(name = "家庭住址")
    private String address;

    /** 与老人关系 */
    @Excel(name = "与老人关系")
    private String relationship;

    /** 头像 */
    @Excel(name = "头像")
    private String avatar;

    /** 最后登录时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "最后登录时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date lastLoginTime;

    /** 登录IP */
    @Excel(name = "登录IP")
    private String loginIp;

    /** 最后登录IP */
    @Excel(name = "最后登录IP")
    private String lastLoginIp;

    /** 用户状态（0正常 1停用） */
    @Excel(name = "用户状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    public Long getUserId()
    {
        return userId;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getFamilyId()
    {
        return familyId;
    }

    public void setFamilyId(Long familyId)
    {
        this.familyId = familyId;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getFamilyName()
    {
        return familyName;
    }

    public void setFamilyName(String familyName)
    {
        this.familyName = familyName;
    }

    public String getGender()
    {
        return gender;
    }

    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public Integer getAge()
    {
        return age;
    }

    public void setAge(Integer age)
    {
        this.age = age;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getIdCard()
    {
        return idCard;
    }

    public void setIdCard(String idCard)
    {
        this.idCard = idCard;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getRelationship()
    {
        return relationship;
    }

    public void setRelationship(String relationship)
    {
        this.relationship = relationship;
    }

    public String getAvatar()
    {
        return avatar;
    }

    public void setAvatar(String avatar)
    {
        this.avatar = avatar;
    }

    public Date getLastLoginTime()
    {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime)
    {
        this.lastLoginTime = lastLoginTime;
    }

    public String getLoginIp()
    {
        return loginIp;
    }

    public void setLoginIp(String loginIp)
    {
        this.loginIp = loginIp;
    }

    public String getLastLoginIp()
    {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp)
    {
        this.lastLoginIp = lastLoginIp;
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
            .append("userId", getUserId())
            .append("username", getUsername())
            .append("password", getPassword())
            .append("familyName", getFamilyName())
            .append("gender", getGender())
            .append("age", getAge())
            .append("phone", getPhone())
            .append("email", getEmail())
            .append("idCard", getIdCard())
            .append("address", getAddress())
            .append("relationship", getRelationship())
            .append("avatar", getAvatar())
            .append("lastLoginTime", getLastLoginTime())
            .append("loginIp", getLoginIp())
            .append("lastLoginIp", getLastLoginIp())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}