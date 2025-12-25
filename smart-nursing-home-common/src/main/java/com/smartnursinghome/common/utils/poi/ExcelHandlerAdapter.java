package com.smartnursinghome.common.utils.poi;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Workbook;

/**
 * Excel数据格式处理适配�?
 * 
 * @author ruoyi
 */
public interface ExcelHandlerAdapter
{
    /**
     * 格式�?
     * 
     * @param value 单元格数据�?
     * @param args excel注解args参数�?
     * @param cell 单元格对�?
     * @param wb 工作簿对�?
     *
     * @return 处理后的�?
     */
    Object format(Object value, String[] args, Cell cell, Workbook wb);
}
