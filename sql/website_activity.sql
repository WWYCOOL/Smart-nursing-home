-- 动态记录表
CREATE TABLE IF NOT EXISTS `website_activity` (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '动态ID',
  `family_id` bigint(20) NOT NULL COMMENT '家属ID',
  `elderly_id` bigint(20) NOT NULL COMMENT '老人ID',
  `elderly_name` varchar(50) DEFAULT NULL COMMENT '老人姓名',
  `activity_type` varchar(20) NOT NULL COMMENT '动态类型：health-健康报告，fee-费用相关，communication-沟通消息，care-护理记录，photo-生活照片',
  `activity_title` varchar(200) NOT NULL COMMENT '动态标题',
  `activity_content` varchar(500) NOT NULL COMMENT '动态内容',
  `activity_time` datetime NOT NULL COMMENT '动态时间',
  `related_id` bigint(20) DEFAULT NULL COMMENT '相关ID（如健康报告ID、费用ID等）',
  `related_type` varchar(50) DEFAULT NULL COMMENT '相关类型（如health_report、fee_detail等）',
  `is_read` char(1) DEFAULT '0' COMMENT '是否已读：0-未读，1-已读',
  `status` char(1) DEFAULT '0' COMMENT '状态：0-正常，1-删除',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`activity_id`),
  KEY `idx_family_id` (`family_id`),
  KEY `idx_elderly_id` (`elderly_id`),
  KEY `idx_activity_type` (`activity_type`),
  KEY `idx_activity_time` (`activity_time`),
  KEY `idx_is_read` (`is_read`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='动态记录表';

-- 插入示例数据
INSERT INTO `website_activity` (`family_id`, `elderly_id`, `elderly_name`, `activity_type`, `activity_title`, `activity_content`, `activity_time`, `related_id`, `related_type`, `is_read`, `status`, `create_by`) VALUES
(1, 8, '张大爷', 'health', '健康报告更新', '张大爷的健康报告已更新', '2024-01-15 14:30:00', 1, 'health_report', '0', '0', 'system'),
(1, 8, '张大爷', 'photo', '生活照片更新', '新增了张大爷的3张生活照片', '2024-01-15 10:20:00', 1, 'photo', '0', '0', 'system'),
(1, 8, '张大爷', 'communication', '沟通消息', '护理人员回复了您的咨询', '2024-01-14 16:45:00', 1, 'communication', '0', '0', 'system'),
(1, 8, '张大爷', 'fee', '费用更新', '费用明细已更新', '2024-01-14 09:15:00', 1, 'fee_detail', '0', '0', 'system'),
(1, 8, '张大爷', 'care', '护理记录', '今日护理工作已完成', '2024-01-13 17:00:00', 1, 'care_record', '0', '0', 'system');
