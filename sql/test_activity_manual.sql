-- 手动测试动态记录功能
-- 1. 先查看当前动态记录
SELECT '当前动态记录:' as info;
SELECT activity_id, family_id, elderly_id, elderly_name, activity_type, activity_content, activity_time 
FROM website_activity 
ORDER BY activity_time DESC 
LIMIT 10;

-- 2. 手动插入一条测试动态记录（模拟系统自动生成）
INSERT INTO `website_activity` (
    `family_id`, 
    `elderly_id`, 
    `elderly_name`, 
    `activity_type`, 
    `activity_content`, 
    `activity_time`, 
    `related_id`, 
    `related_type`, 
    `is_read`, 
    `status`, 
    `create_by`, 
    `create_time`
) VALUES (
    25, 8, '张大爷', 'health', '张大爷的健康报告已更新', NOW(), 999, 'health_report', '0', '0', 'system', NOW()
);

-- 3. 查看插入后的记录
SELECT '插入测试记录后:' as info;
SELECT activity_id, family_id, elderly_id, elderly_name, activity_type, activity_content, activity_time 
FROM website_activity 
ORDER BY activity_time DESC 
LIMIT 10;

-- 4. 验证家属ID 25 对应的老人信息
SELECT '家属25对应的老人信息:' as info;
SELECT r.family_id, r.elderly_id, f.family_name, e.elderly_name 
FROM website_family_elderly_relation r
LEFT JOIN website_family_user f ON r.family_id = f.family_id
LEFT JOIN website_elderly_info e ON r.elderly_id = e.elderly_id
WHERE r.family_id = 25 AND r.bind_status = '1';


