-- 测试动态记录功能
-- 1. 先查看当前动态记录
SELECT '当前动态记录:' as info;
SELECT * FROM website_activity ORDER BY activity_time DESC LIMIT 5;

-- 2. 手动插入一条测试动态记录
INSERT INTO `website_activity` (`family_id`, `elderly_id`, `elderly_name`, `activity_type`, `activity_content`, `activity_time`, `related_id`, `related_type`, `is_read`, `status`, `create_by`, `create_time`) 
VALUES (1, 8, '张大爷', 'health', '张大爷的健康报告已更新', NOW(), 999, 'health_report', '0', '0', 'system', NOW());

-- 3. 查看插入后的记录
SELECT '插入测试记录后:' as info;
SELECT * FROM website_activity ORDER BY activity_time DESC LIMIT 5;

-- 4. 检查家属和老人的绑定关系
SELECT '家属老人绑定关系:' as info;
SELECT r.family_id, r.elderly_id, f.family_name, e.elderly_name 
FROM website_family_elderly_relation r
LEFT JOIN website_family_user f ON r.family_id = f.family_id
LEFT JOIN website_elderly_info e ON r.elderly_id = e.elderly_id
WHERE r.bind_status = '1';


