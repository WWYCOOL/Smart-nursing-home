-- 测试动态自动记录功能
-- 这个脚本用于验证当进行各种业务操作时，系统是否会自动在 website_activity 表中添加记录

-- 1. 查看当前动态记录
SELECT '当前动态记录:' as info;
SELECT * FROM website_activity ORDER BY activity_time DESC LIMIT 10;

-- 2. 模拟新增健康报告（这会触发动态记录）
INSERT INTO `website_health_report` (
    `elderly_id`, `elderly_name`, `report_type`, `report_date`, 
    `health_status`, `blood_pressure`, `heart_rate`, `temperature`, 
    `weight`, `height`, `blood_sugar`, `cholesterol`, 
    `doctor_name`, `diagnosis`, `treatment_plan`, `medications`, 
    `nursing_notes`, `recommendations`, `next_check_date`, 
    `attachments`, `status`, `create_by`, `create_time`
) VALUES (
    8, '张大爷', 'health', NOW(), 
    '良好', '120/80', '75', '36.5', 
    '70', '170', '5.5', '4.2', 
    '李医生', '身体状况良好', '继续观察', '无', 
    '日常护理正常', '定期检查', DATE_ADD(NOW(), INTERVAL 1 MONTH), 
    '', '0', 'admin', NOW()
);

-- 3. 模拟发送沟通消息（这会触发动态记录）
INSERT INTO `website_communication` (
    `family_id`, `elderly_id`, `family_name`, `elderly_name`, 
    `sender_type`, `sender_name`, `content`, `send_time`, 
    `is_read`, `message_type`, `status`, `create_by`, `create_time`
) VALUES (
    1, 8, '张先生', '张大爷', 
    'family', '张先生', '老人今天状态怎么样？', NOW(), 
    '0', 'text', '0', 'family_user', NOW()
);

-- 4. 模拟费用支付（这会触发动态记录）
-- 首先查看现有的费用明细
SELECT '现有费用明细:' as info;
SELECT detail_id, elderly_id, elderly_name, fee_type, fee_amount, is_paid 
FROM website_fee_detail 
WHERE elderly_id = 8 AND is_paid = '0' 
LIMIT 1;

-- 更新支付状态（这会触发动态记录）
UPDATE website_fee_detail 
SET is_paid = '1', paid_date = NOW(), payment_method = '微信支付', update_time = NOW()
WHERE elderly_id = 8 AND is_paid = '0' 
LIMIT 1;

-- 5. 查看新增的动态记录
SELECT '新增的动态记录:' as info;
SELECT * FROM website_activity 
WHERE activity_time >= DATE_SUB(NOW(), INTERVAL 5 MINUTE)
ORDER BY activity_time DESC;

-- 6. 统计各类型的动态记录数量
SELECT '动态记录统计:' as info;
SELECT 
    activity_type,
    COUNT(*) as count,
    MAX(activity_time) as latest_time
FROM website_activity 
GROUP BY activity_type
ORDER BY count DESC;
