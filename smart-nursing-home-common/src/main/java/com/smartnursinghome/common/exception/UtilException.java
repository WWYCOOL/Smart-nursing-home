package com.smartnursinghome.common.exception;

/**
 * 工具类异常
 * 
 * @author smartnursinghome
 */
public class UtilException extends RuntimeException
{
    private static final long serialVersionUID = 1L;

    protected final String module;

    public UtilException(String module, String defaultMessage)
    {
        super(defaultMessage);
        this.module = module;
    }

    public UtilException(String module, String defaultMessage, Throwable cause)
    {
        super(defaultMessage, cause);
        this.module = module;
    }

    public String getModule()
    {
        return module;
    }
}