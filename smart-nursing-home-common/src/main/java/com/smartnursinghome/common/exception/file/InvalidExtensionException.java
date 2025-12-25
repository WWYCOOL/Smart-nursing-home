package com.smartnursinghome.common.exception.file;

import java.util.Arrays;

/**
 * 文件上传 文件名大小 异常类
 * 
 * @author smartnursinghome
 */
public class InvalidExtensionException extends FileException
{
    private static final long serialVersionUID = 1L;

    private String[] allowedExtension;
    private String extension;
    private String filename;

    public InvalidExtensionException(String[] allowedExtension, String extension, String filename)
    {
        super("invalid.extension", new Object[]{filename, extension, Arrays.toString(allowedExtension)});
        this.allowedExtension = allowedExtension;
        this.extension = extension;
        this.filename = filename;
    }

    public String[] getAllowedExtension()
    {
        return allowedExtension;
    }

    public void setAllowedExtension(String[] allowedExtension)
    {
        this.allowedExtension = allowedExtension;
    }

    public String getExtension()
    {
        return extension;
    }

    public void setExtension(String extension)
    {
        this.extension = extension;
    }

    public String getFilename()
    {
        return filename;
    }

    public void setFilename(String filename)
    {
        this.filename = filename;
    }
}