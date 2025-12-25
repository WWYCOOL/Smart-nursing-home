package com.smartnursinghome.web.controller.website;

import com.smartnursinghome.common.annotation.Log;
import com.smartnursinghome.common.core.controller.BaseController;
import com.smartnursinghome.common.core.domain.AjaxResult;
import com.smartnursinghome.common.core.page.TableDataInfo;
import com.smartnursinghome.common.enums.BusinessType;
import com.smartnursinghome.system.domain.ElderlyResidence;
import com.smartnursinghome.system.domain.vo.ElderlyResidenceVo;
import com.smartnursinghome.system.service.IWebsiteChickInService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/website/checkIn")
public class WebsiteChickInController extends BaseController {
    @Autowired
    private IWebsiteChickInService websiteChickInService;
    @Log(title = "入退办理", businessType = BusinessType.INSERT)
    @PostMapping()
    public AjaxResult checkIn(@RequestBody ElderlyResidence elderlyResidence) {
        return toAjax(websiteChickInService.chickInOrOut(elderlyResidence));
    }

    @GetMapping("/list")
    public TableDataInfo list(ElderlyResidence elderlyResidence) {
        startPage();
        List<ElderlyResidenceVo> list = websiteChickInService.selectWebsiteChickInList(elderlyResidence);
        return getDataTable(list);
    }
}
