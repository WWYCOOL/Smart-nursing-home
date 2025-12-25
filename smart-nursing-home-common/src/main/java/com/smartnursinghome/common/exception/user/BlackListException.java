package com.smartnursinghome.common.exception.user;

/**
 * 黑名单IP异常�? * 
 * @author ruoyi
 */
public class BlackListException extends UserException
{
    private static final long serialVersionUID = 1L;

    public BlackListException()
    {
        super("login.blocked", null);
    }
}
