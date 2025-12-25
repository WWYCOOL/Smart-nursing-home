-- 测试获取家属ID 26 的最近一次健康报告
SELECT '测试家属ID 26的绑定关系:' as info;
SELECT r.family_id, r.elderly_id, r.bind_status, f.family_name, e.elderly_name 
FROM website_family_elderly_relation r
LEFT JOIN website_family_user f ON r.family_id = f.family_id
LEFT JOIN website_elderly_info e ON r.elderly_id = e.elderly_id
WHERE r.family_id = 26;

SELECT '测试家属ID 26关联老人的健康报告:' as info;
SELECT h.report_id, h.elderly_id, h.report_date, h.blood_pressure, h.heart_rate, h.temperature, h.status
FROM website_health_report h
INNER JOIN website_family_elderly_relation r ON h.elderly_id = r.elderly_id
WHERE r.family_id = 26 AND r.bind_status = '1' AND h.status = '0'
ORDER BY h.report_date DESC
LIMIT 5;

SELECT '测试完整查询（模拟API查询）:' as info;
SELECT h.report_id, h.elderly_id, h.elderly_name, h.report_date, h.blood_pressure, h.heart_rate, h.temperature
FROM website_health_report h
WHERE h.report_id IN (
    SELECT h2.report_id 
    FROM website_health_report h2
    INNER JOIN website_family_elderly_relation r ON h2.elderly_id = r.elderly_id
    WHERE r.family_id = 26 AND r.bind_status = '1' AND h2.status = '0'
    ORDER BY h2.report_date DESC
    LIMIT 1
);


