package com.smartnursinghome.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.smartnursinghome.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ElderlyResidenceVo extends BaseEntity {

    /**
     * 入住记录ID
     */
    private Long checkInId;

    /**
     * 老人姓名
     */
    private String elderlyName;

    /**
     * 类型：1 入住, 2 退住
     */
    private Integer type;


    /**
     * 房间号
     */
    private String roomNumber;

    /**
     * 床位号
     */
    private String bedNumber;

    /**
     * 备注信息
     */
    private String remark;
    /**
     * 老人身份证号
     */
    private String idCard;
    //办理时间
    private LocalDate checkInTime;
}
