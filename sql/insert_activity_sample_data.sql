-- 插入家属动态测试数据
-- 先查询现有的家属和老人数据
SELECT '现有家属用户:' as info;
SELECT family_id, family_name, username FROM website_family_user LIMIT 5;

SELECT '现有老人数据:' as info;
SELECT elderly_id, elderly_name FROM website_elderly_info LIMIT 5;

SELECT '现有绑定关系:' as info;
SELECT family_id, elderly_id FROM website_family_elderly_relation LIMIT 5;

-- 插入动态数据（使用实际存在的ID）
INSERT INTO `website_activity` (`family_id`, `elderly_id`, `activity_type`, `activity_content`, `activity_time`, `related_id`, `is_read`, `create_by`, `create_time`) VALUES
(1, 8, 'health', '张大爷的健康报告已更新', NOW() - INTERVAL 1 HOUR, '101', '0', 'system', NOW()),
(1, 8, 'communication', '护理人员回复了您的咨询', NOW() - INTERVAL 2 HOUR, '301', '0', 'system', NOW()),
(1, 8, 'fee', '费用明细已更新', NOW() - INTERVAL 3 HOUR, '401', '0', 'system', NOW()),
(1, 8, 'care', '今日护理工作已完成', NOW() - INTERVAL 4 HOUR, '501', '0', 'system', NOW()),
(1, 8, 'health', '张大爷的体检报告已生成', NOW() - INTERVAL 1 DAY, '102', '0', 'system', NOW()),
(1, 8, 'communication', '您有新的消息回复', NOW() - INTERVAL 2 DAY, '302', '0', 'system', NOW()),
(1, 8, 'fee', '本月费用账单已生成', NOW() - INTERVAL 3 DAY, '402', '0', 'system', NOW()),
(1, 8, 'care', '护理计划已更新', NOW() - INTERVAL 4 DAY, '502', '0', 'system', NOW()),
(1, 8, 'health', '张大爷的医疗报告已更新', NOW() - INTERVAL 5 DAY, '103', '0', 'system', NOW()),
(1, 8, 'communication', '护理人员发送了重要通知', NOW() - INTERVAL 6 DAY, '303', '0', 'system', NOW());

-- 查询插入的数据
SELECT '插入的动态数据:' as info;
SELECT * FROM website_activity WHERE family_id = 1 ORDER BY activity_time DESC;
