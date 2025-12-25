package com.smartnursinghome.system.service;

import com.smartnursinghome.system.domain.ElderlyResidence;
import com.smartnursinghome.system.domain.vo.ElderlyResidenceVo;

import java.util.List;

public interface IWebsiteChickInService {

    List<ElderlyResidenceVo> selectWebsiteChickInList(ElderlyResidence elderlyResidence);

    boolean chickInOrOut(ElderlyResidence elderlyResidence);

}
