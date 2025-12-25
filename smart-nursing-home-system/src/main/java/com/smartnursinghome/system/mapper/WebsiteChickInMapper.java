package com.smartnursinghome.system.mapper;

import com.smartnursinghome.system.domain.ElderlyResidence;
import com.smartnursinghome.system.domain.vo.ElderlyResidenceVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;


public interface WebsiteChickInMapper {

    List<ElderlyResidenceVo> selectWebsiteChickInList(ElderlyResidence elderlyResidence);

    int chickIn(ElderlyResidence elderlyResidence);

//   int chickOut(ElderlyResidence elderlyResidence);

}
