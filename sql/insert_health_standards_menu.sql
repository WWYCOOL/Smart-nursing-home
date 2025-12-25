-- 插入健康标准管理菜单
-- 先查询网站管理菜单ID
SET @website_management_id = (SELECT menu_id FROM sys_menu WHERE menu_name = '网站管理' LIMIT 1);

-- 插入健康标准管理菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(3200, '健康标准管理', @website_management_id, 6, 'health-standards', 'system/website/health-standards/index', '', 1, 0, 'C', '0', '0', 'website:health-standards:view', 'health', 'admin', '2023-01-01 00:00:00', '', NULL, '健康标准管理菜单');

-- 插入子菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(3201, '健康标准查询', 3200, 1, '', '', '', 1, 0, 'F', '0', '0', 'website:health-standards:list', '#', 'admin', '2023-01-01 00:00:00', '', NULL, ''),
(3202, '健康标准修改', 3200, 2, '', '', '', 1, 0, 'F', '0', '0', 'website:health-standards:edit', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');

-- 给超级管理员角色分配权限
INSERT INTO sys_role_menu (role_id, menu_id) VALUES
(1, 3200), -- 健康标准管理
(1, 3201), -- 健康标准查询
(1, 3202); -- 健康标准修改

-- 验证菜单插入结果
SELECT menu_id, menu_name, parent_id, path, component FROM sys_menu WHERE menu_id IN (3200, 3201, 3202);


