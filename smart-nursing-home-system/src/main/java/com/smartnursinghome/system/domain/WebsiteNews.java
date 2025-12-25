package com.smartnursinghome.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smartnursinghome.common.annotation.Excel;
import com.smartnursinghome.common.core.domain.BaseEntity;

/**
 * 新闻对象 website_news
 * 
 * @author ruoyi
 * @date 2024-03-15
 */
public class WebsiteNews extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 新闻ID */
    private Long newsId;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 摘要 */
    @Excel(name = "摘要")
    private String summary;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 分类 */
    @Excel(name = "分类")
    private String category;

    /** 图片地址 */
    @Excel(name = "图片地址")
    private String imageUrl;

    /** 是否头条（0否 1是） */
    @Excel(name = "是否头条", readConverterExp = "0=否,1=是")
    private String isFeatured;

    /** 阅读量 */
    @Excel(name = "阅读量")
    private Long views;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setNewsId(Long newsId) 
    {
        this.newsId = newsId;
    }

    public Long getNewsId() 
    {
        return newsId;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setSummary(String summary) 
    {
        this.summary = summary;
    }

    public String getSummary() 
    {
        return summary;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setCategory(String category) 
    {
        this.category = category;
    }

    public String getCategory() 
    {
        return category;
    }
    public void setImageUrl(String imageUrl) 
    {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() 
    {
        return imageUrl;
    }
    public void setIsFeatured(String isFeatured) 
    {
        this.isFeatured = isFeatured;
    }

    public String getIsFeatured() 
    {
        return isFeatured;
    }
    public void setViews(Long views) 
    {
        this.views = views;
    }

    public Long getViews() 
    {
        return views;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("newsId", getNewsId())
            .append("title", getTitle())
            .append("summary", getSummary())
            .append("content", getContent())
            .append("category", getCategory())
            .append("imageUrl", getImageUrl())
            .append("isFeatured", getIsFeatured())
            .append("views", getViews())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}

















