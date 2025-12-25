package com.smartnursinghome.common.utils.poi;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.annotation.Excel.Type;

/**
 * Excel工具类
 * 
 * @author smartnursinghome
 */
public class ExcelUtil<T>
{
    private static final Logger log = LoggerFactory.getLogger(ExcelUtil.class);

    /**
     * Excel sheet最大行数，默认65536
     */
    public static final int sheetSize = 65536;

    /**
     * 工作表名称
     */
    private String sheetName;

    /**
     * 导出类型（EXPORT:导出数据；IMPORT:导入模板）
     */
    private Type type;

    /**
     * 工作薄对象
     */
    private Workbook wb;

    /**
     * 工作表对象
     */
    private Sheet sheet;

    /**
     * 导入导出数据列表
     */
    private List<T> list;

    /**
     * 注解列表
     */
    private List<Object[]> fields;

    /**
     * 实体类
     */
    private Class<T> clazz;

    public ExcelUtil(Class<T> clazz)
    {
        this.clazz = clazz;
        fields = new ArrayList<Object[]>();
        initFields();
    }

    /**
     * 初始化字段信息
     */
    private void initFields()
    {
        List<Field> tempFields = new ArrayList<>();
        tempFields.addAll(Arrays.asList(clazz.getSuperclass().getDeclaredFields()));
        tempFields.addAll(Arrays.asList(clazz.getDeclaredFields()));
        for (Field field : tempFields)
        {
            // 单注解
            if (field.isAnnotationPresent(Excel.class))
            {
                putToFields(field, field.getAnnotation(Excel.class));
            }

            // 多注解
            if (field.isAnnotationPresent(Excel.class))
            {
                Excel[] excels = field.getAnnotationsByType(Excel.class);
                for (Excel excel : excels)
                {
                    putToFields(field, excel);
                }
            }
        }
    }

    /**
     * 放到字段集合中
     */
    private void putToFields(Field field, Excel attr)
    {
        if (attr != null && (attr.type() == Type.ALL || attr.type() == type))
        {
            this.fields.add(new Object[] { field, attr });
        }
    }

    /**
     * 创建工作表
     */
    public Sheet createSheet(InputStream is, String sheetName) throws IOException
    {
        this.wb = WorkbookFactory.create(is);
        Sheet sheet = wb.getSheet(sheetName);
        if (sheet == null)
        {
            throw new IOException("文件sheet不存在");
        }
        return sheet;
    }

    /**
     * 获取工作表
     */
    public Sheet getSheet()
    {
        return sheet;
    }

    /**
     * 获取工作簿
     */
    public Workbook getWorkbook()
    {
        return wb;
    }

    /**
     * 获取注解列表
     */
    public List<Object[]> getFields()
    {
        return fields;
    }

    /**
     * 获取导入数据列表
     */
    public List<T> getList()
    {
        return list;
    }

    /**
     * 设置导入数据列表
     */
    public void setList(List<T> list)
    {
        this.list = list;
    }

    /**
     * 导出Excel
     */
    public void exportExcel(HttpServletResponse response, List<T> list, String sheetName)
    {
        try
        {
            this.list = list;
            this.sheetName = sheetName;
            this.type = Type.EXPORT;
            
            // 创建工作簿
            this.wb = org.apache.poi.xssf.usermodel.XSSFWorkbook.class.newInstance();
            this.sheet = wb.createSheet(sheetName);
            
            // 写入数据
            writeDataToSheet();
            
            // 设置响应头
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setCharacterEncoding("utf-8");
            response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + 
                java.net.URLEncoder.encode(sheetName + ".xlsx", "UTF-8"));
            
            // 输出到响应流
            wb.write(response.getOutputStream());
            wb.close();
        }
        catch (Exception e)
        {
            log.error("导出Excel失败", e);
            throw new RuntimeException("导出Excel失败：" + e.getMessage());
        }
    }

    /**
     * 写入数据到工作表
     */
    private void writeDataToSheet() throws Exception
    {
        if (list == null || list.isEmpty())
        {
            return;
        }
        
        // 创建标题行
        createTitleRow();
        
        // 写入数据行
        int rowIndex = 1;
        for (T obj : list)
        {
            createDataRow(obj, rowIndex++);
        }
        
        // 自动调整列宽
        for (int i = 0; i < fields.size(); i++)
        {
            sheet.autoSizeColumn(i);
        }
    }

    /**
     * 创建标题行
     */
    private void createTitleRow() throws Exception
    {
        org.apache.poi.ss.usermodel.Row titleRow = sheet.createRow(0);
        int colIndex = 0;
        
        for (Object[] fieldInfo : fields)
        {
            Field field = (Field) fieldInfo[0];
            Excel excel = (Excel) fieldInfo[1];
            
            org.apache.poi.ss.usermodel.Cell cell = titleRow.createCell(colIndex++);
            cell.setCellValue(excel.name());
            
            // 设置样式
            org.apache.poi.ss.usermodel.CellStyle style = wb.createCellStyle();
            org.apache.poi.ss.usermodel.Font font = wb.createFont();
            font.setBold(true);
            style.setFont(font);
            cell.setCellStyle(style);
        }
    }

    /**
     * 创建数据行
     */
    private void createDataRow(T obj, int rowIndex) throws Exception
    {
        org.apache.poi.ss.usermodel.Row dataRow = sheet.createRow(rowIndex);
        int colIndex = 0;
        
        for (Object[] fieldInfo : fields)
        {
            Field field = (Field) fieldInfo[0];
            Excel excel = (Excel) fieldInfo[1];
            
            org.apache.poi.ss.usermodel.Cell cell = dataRow.createCell(colIndex++);
            
            // 设置字段可访问
            field.setAccessible(true);
            Object value = field.get(obj);
            
            if (value != null)
            {
                cell.setCellValue(value.toString());
            }
            else
            {
                cell.setCellValue("");
            }
        }
    }

    /**
     * 导入Excel
     */
    public List<T> importExcel(InputStream inputStream) throws Exception
    {
        try
        {
            // 创建工作簿
            this.wb = WorkbookFactory.create(inputStream);
            this.sheet = wb.getSheetAt(0);
            
            // 获取字段信息
            initFields();
            
            // 读取数据
            List<T> list = new ArrayList<>();
            int rowCount = sheet.getLastRowNum();
            
            for (int i = 1; i <= rowCount; i++) // 跳过标题行
            {
                org.apache.poi.ss.usermodel.Row row = sheet.getRow(i);
                if (row == null) continue;
                
                T obj = createObjectFromRow(row);
                if (obj != null)
                {
                    list.add(obj);
                }
            }
            
            return list;
        }
        catch (Exception e)
        {
            log.error("导入Excel失败", e);
            throw new RuntimeException("导入Excel失败：" + e.getMessage());
        }
        finally
        {
            if (wb != null)
            {
                try
                {
                    wb.close();
                }
                catch (IOException e)
                {
                    log.error("关闭工作簿失败", e);
                }
            }
        }
    }

    /**
     * 从行数据创建对象
     */
    @SuppressWarnings("unchecked")
    private T createObjectFromRow(org.apache.poi.ss.usermodel.Row row) throws Exception
    {
        T obj = (T) clazz.newInstance();
        int colIndex = 0;
        
        for (Object[] fieldInfo : fields)
        {
            Field field = (Field) fieldInfo[0];
            Excel excel = (Excel) fieldInfo[1];
            
            org.apache.poi.ss.usermodel.Cell cell = row.getCell(colIndex++);
            if (cell == null) continue;
            
            // 设置字段可访问
            field.setAccessible(true);
            
            // 根据字段类型设置值
            Object value = getCellValue(cell, field.getType());
            if (value != null)
            {
                field.set(obj, value);
            }
        }
        
        return obj;
    }

    /**
     * 获取单元格值
     */
    private Object getCellValue(org.apache.poi.ss.usermodel.Cell cell, Class<?> fieldType)
    {
        if (cell == null) return null;
        
        switch (cell.getCellType())
        {
            case STRING:
                String stringValue = cell.getStringCellValue();
                if (fieldType == String.class) return stringValue;
                if (fieldType == Long.class || fieldType == long.class) return Long.valueOf(stringValue);
                if (fieldType == Integer.class || fieldType == int.class) return Integer.valueOf(stringValue);
                if (fieldType == Double.class || fieldType == double.class) return Double.valueOf(stringValue);
                if (fieldType == Boolean.class || fieldType == boolean.class) return Boolean.valueOf(stringValue);
                return stringValue;
                
            case NUMERIC:
                double numericValue = cell.getNumericCellValue();
                if (fieldType == Long.class || fieldType == long.class) return (long) numericValue;
                if (fieldType == Integer.class || fieldType == int.class) return (int) numericValue;
                if (fieldType == Double.class || fieldType == double.class) return numericValue;
                if (fieldType == String.class) return String.valueOf(numericValue);
                return numericValue;
                
            case BOOLEAN:
                boolean booleanValue = cell.getBooleanCellValue();
                if (fieldType == Boolean.class || fieldType == boolean.class) return booleanValue;
                if (fieldType == String.class) return String.valueOf(booleanValue);
                return booleanValue;
                
            case FORMULA:
                return getCellValue(cell, fieldType); // 递归处理公式
                
            default:
                return null;
        }
    }

    /**
     * 导入模板Excel
     */
    public void importTemplateExcel(HttpServletResponse response, String sheetName)
    {
        try
        {
            // 设置导入模板类型
            this.type = Type.IMPORT;
            this.sheetName = sheetName;
            
            // 重新初始化字段（只包含导入字段）
            this.fields = new ArrayList<>();
            initFields();
            
            // 创建工作簿
            this.wb = org.apache.poi.xssf.usermodel.XSSFWorkbook.class.newInstance();
            this.sheet = wb.createSheet(sheetName);
            
            // 创建标题行
            createTitleRow();
            
            // 设置响应头
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setCharacterEncoding("utf-8");
            response.setHeader("Content-disposition", "attachment;filename*=utf-8''" +
                java.net.URLEncoder.encode(sheetName + ".xlsx", "UTF-8"));
            
            // 输出到响应流
            wb.write(response.getOutputStream());
            wb.close();
        }
        catch (Exception e)
        {
            log.error("导出导入模板失败", e);
            throw new RuntimeException("导出导入模板失败：" + e.getMessage());
        }
    }
}
