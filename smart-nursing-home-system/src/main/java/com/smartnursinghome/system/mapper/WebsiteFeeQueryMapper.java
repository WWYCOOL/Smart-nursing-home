package com.smartnursinghome.system.mapper;

import java.util.List;
import com.smartnursinghome.system.domain.WebsiteFeeQuery;

/**
 * 费用查询Mapper接口
 * 
 * @author ruoyi
 * @date 2023-01-01
 */
public interface WebsiteFeeQueryMapper 
{
    /**
     * 查询费用查询
     * 
     * @param queryId 费用查询主键
     * @return 费用查询
     */
    public WebsiteFeeQuery selectWebsiteFeeQueryByQueryId(Long queryId);

    /**
     * 查询费用查询列表
     * 
     * @param websiteFeeQuery 费用查询
     * @return 费用查询集合
     */
    public List<WebsiteFeeQuery> selectWebsiteFeeQueryList(WebsiteFeeQuery websiteFeeQuery);

    /**
     * 新增费用查询
     * 
     * @param websiteFeeQuery 费用查询
     * @return 结果
     */
    public int insertWebsiteFeeQuery(WebsiteFeeQuery websiteFeeQuery);

    /**
     * 修改费用查询
     * 
     * @param websiteFeeQuery 费用查询
     * @return 结果
     */
    public int updateWebsiteFeeQuery(WebsiteFeeQuery websiteFeeQuery);

    /**
     * 删除费用查询
     * 
     * @param queryId 费用查询主键
     * @return 结果
     */
    public int deleteWebsiteFeeQueryByQueryId(Long queryId);

    /**
     * 批量删除费用查询
     * 
     * @param queryIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWebsiteFeeQueryByQueryIds(Long[] queryIds);

    /**
     * 处理费用查询
     * 
     * @param websiteFeeQuery 费用查询
     * @return 结果
     */
    public int processWebsiteFeeQuery(WebsiteFeeQuery websiteFeeQuery);

    /**
     * 发送费用查�?
     * 
     * @param websiteFeeQuery 费用查询
     * @return 结果
     */
    public int sendWebsiteFeeQuery(WebsiteFeeQuery websiteFeeQuery);
}


