package com.smartnursinghome.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.smartnursinghome.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ElderlyResidence extends BaseEntity {
    // 居住类型常量定义
    public static final int TYPE_CHECK_IN = 0;   // 入住
    public static final int TYPE_CHECK_OUT = 1;  // 退住

    /**
     * 老人ID (必填)
     */
    private Long elderlyId;

    /**
     * 类型：1 入住, 2 退住 (必填)
     */
    private Integer type;

    /**
     * 入住日期 (type=1时必填)
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate checkInTime;

    /**
     * 房间ID (type=1时必填)
     */
    private Long roomId;

    /**
     * 房间号 (type=1时必填)
     */
    private String roomNumber;

    /**
     * 床位ID (type=1时必填)
     */
    private Long bedId;

    /**
     * 床位号 (type=1时必填)
     */
    private String bedNumber;

    /**
     * 备注信息 (选填)
     */
    private String remark;


}
