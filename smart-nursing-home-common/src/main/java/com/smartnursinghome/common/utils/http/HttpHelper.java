package com.smartnursinghome.common.utils.http;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 通用http工具封装
 * 
 * @author smartnursinghome
 */
public class HttpHelper
{
    private static final Logger LOGGER = LoggerFactory.getLogger(HttpHelper.class);

    public static String getBodyString(ServletRequest request)
    {
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = null;
        try (InputStreamReader isr = new InputStreamReader(request.getInputStream(), StandardCharsets.UTF_8))
        {
            reader = new BufferedReader(isr);
            String line;
            while ((line = reader.readLine()) != null)
            {
                sb.append(line);
            }
        }
        catch (IOException e)
        {
            LOGGER.warn("getBodyString出现问题!");
        }
        finally
        {
            if (reader != null)
            {
                try
                {
                    reader.close();
                }
                catch (IOException e)
                {
                    LOGGER.error("关闭流异常", e);
                }
            }
        }
        return sb.toString();
    }
}