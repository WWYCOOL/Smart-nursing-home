package com.smartnursinghome.common.exception.user;

import com.smartnursinghome.common.exception.base.BaseException;

/**
 * 用户信息异常�?
 * 
 * @author ruoyi
 */
public class UserException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public UserException(String code, Object[] args)
    {
        super("user", code, args, null);
    }
}
