package com.smartnursinghome.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.math.BigDecimal;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import com.smartnursinghome.common.utils.poi.ExcelHandlerAdapter;

/**
 * 自定义导出Excel数据注解
 * 
 * @author ruoyi
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface Excel
{
    /**
     * 导出时在excel中排�?
     */
    public int sort() default Integer.MAX_VALUE;

    /**
     * 导出到Excel中的名字.
     */
    public String name() default "";

    /**
     * 日期格式, �? yyyy-MM-dd
     */
    public String dateFormat() default "";

    /**
     * 如果是字典类型，请设置字典的type�?(�? sys_user_sex)
     */
    public String dictType() default "";

    /**
     * 读取内容转表达式 (�? 0=�?1=�?2=未知)
     */
    public String readConverterExp() default "";

    /**
     * 分隔符，读取字符串组内容
     */
    public String separator() default ",";

    /**
     * BigDecimal 精度 默认:-1(默认不开启BigDecimal格式�?
     */
    public int scale() default -1;

    /**
     * BigDecimal 舍入规则 默认:BigDecimal.ROUND_HALF_EVEN
     */
    public int roundingMode() default BigDecimal.ROUND_HALF_EVEN;

    /**
     * 导出时在excel中每个列的高�?
     */
    public double height() default 14;

    /**
     * 导出时在excel中每个列的宽�?
     */
    public double width() default 16;

    /**
     * 文字后缀,�? 90 变成90%
     */
    public String suffix() default "";

    /**
     * 当值为空时,字段的默认�?
     */
    public String defaultValue() default "";

    /**
     * 提示信息
     */
    public String prompt() default "";

    /**
     * 是否允许内容换行 
     */
    public boolean wrapText() default false;

    /**
     * 设置只能选择不能输入的列内容.
     */
    public String[] combo() default {};

    /**
     * 是否从字典读数据到combo,默认不读�?如读取需要设置dictType注解.
     */
    public boolean comboReadDict() default false;

    /**
     * 是否需要纵向合并单元格,应对需�?含有list集合单元�?
     */
    public boolean needMerge() default false;

    /**
     * 是否导出数据,应对需�?有时我们需要导出一份模�?这是标题需要但内容需要用户手工填�?
     */
    public boolean isExport() default true;

    /**
     * 另一个类中的属性名�?支持多级获取,以小数点隔开
     */
    public String targetAttr() default "";

    /**
     * 是否自动统计数据,在最后追加一行统计数据总和
     */
    public boolean isStatistics() default false;

    /**
     * 导出类型�?数字 1字符�?2图片�?
     */
    public ColumnType cellType() default ColumnType.STRING;

    /**
     * 导出列头背景颜色
     */
    public IndexedColors headerBackgroundColor() default IndexedColors.GREY_50_PERCENT;

    /**
     * 导出列头字体颜色
     */
    public IndexedColors headerColor() default IndexedColors.WHITE;

    /**
     * 导出单元格背景颜�?
     */
    public IndexedColors backgroundColor() default IndexedColors.WHITE;

    /**
     * 导出单元格字体颜�?
     */
    public IndexedColors color() default IndexedColors.BLACK;

    /**
     * 导出字段对齐方式
     */
    public HorizontalAlignment align() default HorizontalAlignment.CENTER;

    /**
     * 自定义数据处理器
     */
    public Class<?> handler() default ExcelHandlerAdapter.class;

    /**
     * 自定义数据处理器参数
     */
    public String[] args() default {};

    /**
     * 字段类型�?：导出导入；1：仅导出�?：仅导入�?
     */
    Type type() default Type.ALL;

    public enum Type
    {
        ALL(0), EXPORT(1), IMPORT(2);
        private final int value;

        Type(int value)
        {
            this.value = value;
        }

        public int value()
        {
            return this.value;
        }
    }

    public enum ColumnType
    {
        NUMERIC(0), STRING(1), IMAGE(2), TEXT(3);
        private final int value;

        ColumnType(int value)
        {
            this.value = value;
        }

        public int value()
        {
            return this.value;
        }
    }
}
