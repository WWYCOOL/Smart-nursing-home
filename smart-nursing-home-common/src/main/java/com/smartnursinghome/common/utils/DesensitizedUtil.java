package com.smartnursinghome.common.utils;

/**
 * 脱敏工具类
 * 
 * @author smartnursinghome
 */
public class DesensitizedUtil
{
    /**
     * 手机号脱敏
     */
    public static String mobilePhone(String mobilePhone)
    {
        if (StringUtils.isEmpty(mobilePhone))
        {
            return mobilePhone;
        }
        return StringUtils.hide(mobilePhone, 3, 7);
    }

    /**
     * 身份证号脱敏
     */
    public static String idCard(String idCard)
    {
        if (StringUtils.isEmpty(idCard))
        {
            return idCard;
        }
        return StringUtils.hide(idCard, 4, 14);
    }

    /**
     * 银行卡号脱敏
     */
    public static String bankCard(String bankCard)
    {
        if (StringUtils.isEmpty(bankCard))
        {
            return bankCard;
        }
        return StringUtils.hide(bankCard, 4, 12);
    }

    /**
     * 车牌号脱敏
     */
    public static String carLicense(String carLicense)
    {
        if (StringUtils.isEmpty(carLicense))
        {
            return carLicense;
        }
        // 普通车牌
        if (carLicense.length() == 7)
        {
            carLicense = StringUtils.hide(carLicense, 3, 6);
        }
        else if (carLicense.length() == 8)
        {
            // 新能源车牌
            carLicense = StringUtils.hide(carLicense, 3, 7);
        }
        return carLicense;
    }

    /**
     * 邮箱脱敏
     */
    public static String email(String email)
    {
        if (StringUtils.isEmpty(email))
        {
            return email;
        }
        int index = email.indexOf("@");
        if (index <= 1)
        {
            return email;
        }
        return StringUtils.hide(email, 1, index - 1);
    }

    /**
     * 姓名脱敏
     */
    public static String chineseName(String chineseName)
    {
        if (StringUtils.isEmpty(chineseName))
        {
            return chineseName;
        }
        return StringUtils.hide(chineseName, 1, chineseName.length());
    }

    /**
     * 密码脱敏
     */
    public static String password(String password)
    {
        if (StringUtils.isEmpty(password))
        {
            return password;
        }
        return "******";
    }
}