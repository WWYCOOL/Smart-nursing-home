/*
 Navicat Premium Data Transfer

 Source Server         : wangyiqian
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 10/10/2025 17:47:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-green', 'Y', 'admin', '2025-09-23 15:32:08', 'admin', '2025-09-24 12:01:24', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-09-23 15:32:08', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-09-23 15:32:08', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-09-23 15:32:08', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-09-23 15:32:08', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-09-23 15:32:08', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-09-23 15:32:08', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-09-23 15:32:08', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '智慧养老院', 0, '王院长', '15888888888', 'yly@qq.com', '0', '0', 'admin', '2025-09-23 15:32:08', 'admin', '2025-09-26 10:27:21');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '贵州总公司', 1, '李院长', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-23 15:32:08', 'admin', '2025-09-26 10:27:44');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-09-23 15:32:08', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-23 15:32:08', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-23 15:32:08', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-23 15:32:08', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-23 15:32:08', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-23 15:32:08', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-09-23 15:32:08', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2025-09-23 15:32:08', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4024 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (1000, 1, '床位费', 'room', 'fee_type', '', 'primary', 'Y', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '床位费用');
INSERT INTO `sys_dict_data` VALUES (1001, 2, '餐饮费', 'meal', 'fee_type', '', 'success', 'N', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '餐饮费用');
INSERT INTO `sys_dict_data` VALUES (1002, 3, '医疗费', 'medical', 'fee_type', '', 'warning', 'N', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '医疗费用');
INSERT INTO `sys_dict_data` VALUES (1003, 4, '护理费', 'nursing', 'fee_type', '', 'info', 'N', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '护理费用');
INSERT INTO `sys_dict_data` VALUES (1004, 5, '其他费用', 'other', 'fee_type', '', 'default', 'N', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '其他费用');
INSERT INTO `sys_dict_data` VALUES (1010, 1, '月度费用', 'monthly', 'query_type', '', 'primary', 'Y', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '月度费用查询');
INSERT INTO `sys_dict_data` VALUES (1011, 2, '季度费用', 'quarterly', 'query_type', '', 'success', 'N', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '季度费用查询');
INSERT INTO `sys_dict_data` VALUES (1012, 3, '年度费用', 'yearly', 'query_type', '', 'warning', 'N', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '年度费用查询');
INSERT INTO `sys_dict_data` VALUES (1013, 4, '自定义期间', 'custom', 'query_type', '', 'info', 'N', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '自定义期间查询');
INSERT INTO `sys_dict_data` VALUES (1020, 1, '现金', 'cash', 'payment_method', '', 'primary', 'Y', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '现金支付');
INSERT INTO `sys_dict_data` VALUES (1021, 2, '银行转账', 'bank', 'payment_method', '', 'success', 'N', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '银行转账');
INSERT INTO `sys_dict_data` VALUES (1022, 3, '微信支付', 'wechat', 'payment_method', '', 'success', 'N', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '微信支付');
INSERT INTO `sys_dict_data` VALUES (1023, 4, '支付宝', 'alipay', 'payment_method', '', 'warning', 'N', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '支付宝支付');
INSERT INTO `sys_dict_data` VALUES (4000, 1, '服务建议', 'service', 'feedback_type', '', 'primary', 'Y', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '服务相关建议');
INSERT INTO `sys_dict_data` VALUES (4001, 2, '设施问题', 'facility', 'feedback_type', '', 'warning', 'N', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '设施设备问题');
INSERT INTO `sys_dict_data` VALUES (4002, 3, '人员态度', 'staff', 'feedback_type', '', 'danger', 'N', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '工作人员态度问题');
INSERT INTO `sys_dict_data` VALUES (4003, 4, '其他', 'other', 'feedback_type', '', 'info', 'N', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '其他类型反馈');
INSERT INTO `sys_dict_data` VALUES (4010, 1, '待处理', '0', 'feedback_status', '', 'warning', 'Y', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '待处理状态');
INSERT INTO `sys_dict_data` VALUES (4011, 2, '处理中', '1', 'feedback_status', '', 'primary', 'N', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '处理中状态');
INSERT INTO `sys_dict_data` VALUES (4012, 3, '已处理', '2', 'feedback_status', '', 'success', 'N', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '已处理状态');
INSERT INTO `sys_dict_data` VALUES (4013, 4, '已关闭', '3', 'feedback_status', '', 'info', 'N', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '已关闭状态');
INSERT INTO `sys_dict_data` VALUES (4020, 1, '低', '1', 'feedback_priority', '', 'info', 'Y', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '低优先级');
INSERT INTO `sys_dict_data` VALUES (4021, 2, '中', '2', 'feedback_priority', '', 'primary', 'N', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '中优先级');
INSERT INTO `sys_dict_data` VALUES (4022, 3, '高', '3', 'feedback_priority', '', 'warning', 'N', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '高优先级');
INSERT INTO `sys_dict_data` VALUES (4023, 4, '紧急', '4', 'feedback_priority', '', 'danger', 'N', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '紧急优先级');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 402 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '费用类型', 'fee_type', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '费用类型列表');
INSERT INTO `sys_dict_type` VALUES (101, '查询类型', 'query_type', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '费用查询类型列表');
INSERT INTO `sys_dict_type` VALUES (102, '支付方式', 'payment_method', '0', 'admin', '2023-01-01 00:00:00', '', NULL, '支付方式列表');
INSERT INTO `sys_dict_type` VALUES (400, '反馈类型', 'feedback_type', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '意见反馈类型列表');
INSERT INTO `sys_dict_type` VALUES (401, '反馈状态', 'feedback_status', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '意见反馈处理状态列表');
INSERT INTO `sys_dict_type` VALUES (402, '优先级', 'feedback_priority', '0', 'admin', '2025-09-26 17:41:47', '', NULL, '意见反馈优先级列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (4, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '0 */2 * * * ?', '3', '1', '0', 'admin', '2025-09-24 17:20:53', 'admin', '2025-10-09 13:30:53', '每5分钟同步一次新闻阅读量数据从Redis到MySQL');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1976 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '新闻阅读量同步', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步 总共耗时：10毫秒', '0', '', '2025-09-24 17:26:00');
INSERT INTO `sys_job_log` VALUES (2, '新闻阅读量同步', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步 总共耗时：7毫秒', '0', '', '2025-09-24 17:27:00');
INSERT INTO `sys_job_log` VALUES (3, '新闻阅读量同步', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步 总共耗时：7毫秒', '0', '', '2025-09-24 17:28:00');
INSERT INTO `sys_job_log` VALUES (4, '新闻阅读量同步', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步 总共耗时：11毫秒', '0', '', '2025-09-24 17:29:00');
INSERT INTO `sys_job_log` VALUES (5, '新闻阅读量同步', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步 总共耗时：7毫秒', '0', '', '2025-09-24 17:30:00');
INSERT INTO `sys_job_log` VALUES (6, '新闻阅读量同步', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步 总共耗时：9毫秒', '0', '', '2025-09-24 17:31:00');
INSERT INTO `sys_job_log` VALUES (7, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-24 17:32:00');
INSERT INTO `sys_job_log` VALUES (8, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-24 17:33:00');
INSERT INTO `sys_job_log` VALUES (9, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-24 17:34:00');
INSERT INTO `sys_job_log` VALUES (10, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-24 17:35:00');
INSERT INTO `sys_job_log` VALUES (11, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-24 17:36:00');
INSERT INTO `sys_job_log` VALUES (12, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-24 17:37:00');
INSERT INTO `sys_job_log` VALUES (13, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-24 17:38:00');
INSERT INTO `sys_job_log` VALUES (14, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-24 17:39:00');
INSERT INTO `sys_job_log` VALUES (15, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-09-24 17:40:01');
INSERT INTO `sys_job_log` VALUES (16, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-24 17:41:00');
INSERT INTO `sys_job_log` VALUES (17, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：33毫秒', '0', '', '2025-09-24 17:43:00');
INSERT INTO `sys_job_log` VALUES (18, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-24 17:44:00');
INSERT INTO `sys_job_log` VALUES (19, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-24 17:45:00');
INSERT INTO `sys_job_log` VALUES (20, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-24 17:46:00');
INSERT INTO `sys_job_log` VALUES (21, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-24 17:47:00');
INSERT INTO `sys_job_log` VALUES (22, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-24 17:48:00');
INSERT INTO `sys_job_log` VALUES (23, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-24 17:49:00');
INSERT INTO `sys_job_log` VALUES (24, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-24 17:50:00');
INSERT INTO `sys_job_log` VALUES (25, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-24 17:51:00');
INSERT INTO `sys_job_log` VALUES (26, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-24 17:52:00');
INSERT INTO `sys_job_log` VALUES (27, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-24 17:53:00');
INSERT INTO `sys_job_log` VALUES (28, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-24 17:54:00');
INSERT INTO `sys_job_log` VALUES (29, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-24 17:55:00');
INSERT INTO `sys_job_log` VALUES (30, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-24 17:56:00');
INSERT INTO `sys_job_log` VALUES (31, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-24 17:57:00');
INSERT INTO `sys_job_log` VALUES (32, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-24 17:58:00');
INSERT INTO `sys_job_log` VALUES (33, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-24 17:59:00');
INSERT INTO `sys_job_log` VALUES (34, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-24 18:00:00');
INSERT INTO `sys_job_log` VALUES (35, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：39毫秒', '0', '', '2025-09-25 09:01:00');
INSERT INTO `sys_job_log` VALUES (36, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-25 09:02:00');
INSERT INTO `sys_job_log` VALUES (37, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 09:03:00');
INSERT INTO `sys_job_log` VALUES (38, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 09:04:00');
INSERT INTO `sys_job_log` VALUES (39, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 09:05:00');
INSERT INTO `sys_job_log` VALUES (40, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 09:06:00');
INSERT INTO `sys_job_log` VALUES (41, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 09:07:00');
INSERT INTO `sys_job_log` VALUES (42, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 09:08:00');
INSERT INTO `sys_job_log` VALUES (43, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 09:09:00');
INSERT INTO `sys_job_log` VALUES (44, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 09:10:00');
INSERT INTO `sys_job_log` VALUES (45, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 09:11:00');
INSERT INTO `sys_job_log` VALUES (46, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 09:12:00');
INSERT INTO `sys_job_log` VALUES (47, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 09:13:00');
INSERT INTO `sys_job_log` VALUES (48, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 09:14:00');
INSERT INTO `sys_job_log` VALUES (49, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 09:15:00');
INSERT INTO `sys_job_log` VALUES (50, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 09:16:00');
INSERT INTO `sys_job_log` VALUES (51, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 09:17:00');
INSERT INTO `sys_job_log` VALUES (52, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 09:18:00');
INSERT INTO `sys_job_log` VALUES (53, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-25 09:19:00');
INSERT INTO `sys_job_log` VALUES (54, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 09:20:00');
INSERT INTO `sys_job_log` VALUES (55, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 09:21:00');
INSERT INTO `sys_job_log` VALUES (56, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 09:22:00');
INSERT INTO `sys_job_log` VALUES (57, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 09:23:00');
INSERT INTO `sys_job_log` VALUES (58, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 09:24:00');
INSERT INTO `sys_job_log` VALUES (59, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 09:25:00');
INSERT INTO `sys_job_log` VALUES (60, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：30毫秒', '0', '', '2025-09-25 09:38:00');
INSERT INTO `sys_job_log` VALUES (61, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 09:39:00');
INSERT INTO `sys_job_log` VALUES (62, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 09:40:00');
INSERT INTO `sys_job_log` VALUES (63, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 09:41:00');
INSERT INTO `sys_job_log` VALUES (64, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-25 09:42:00');
INSERT INTO `sys_job_log` VALUES (65, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 09:43:00');
INSERT INTO `sys_job_log` VALUES (66, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 09:44:00');
INSERT INTO `sys_job_log` VALUES (67, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 09:45:00');
INSERT INTO `sys_job_log` VALUES (68, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 09:46:00');
INSERT INTO `sys_job_log` VALUES (69, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 09:47:00');
INSERT INTO `sys_job_log` VALUES (70, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 09:48:00');
INSERT INTO `sys_job_log` VALUES (71, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 09:49:00');
INSERT INTO `sys_job_log` VALUES (72, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 09:50:00');
INSERT INTO `sys_job_log` VALUES (73, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 09:51:00');
INSERT INTO `sys_job_log` VALUES (74, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 09:52:00');
INSERT INTO `sys_job_log` VALUES (75, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 09:53:00');
INSERT INTO `sys_job_log` VALUES (76, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 09:54:00');
INSERT INTO `sys_job_log` VALUES (77, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 09:55:00');
INSERT INTO `sys_job_log` VALUES (78, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 09:56:00');
INSERT INTO `sys_job_log` VALUES (79, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 09:57:00');
INSERT INTO `sys_job_log` VALUES (80, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 09:58:00');
INSERT INTO `sys_job_log` VALUES (81, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 09:59:00');
INSERT INTO `sys_job_log` VALUES (82, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 10:00:00');
INSERT INTO `sys_job_log` VALUES (83, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 10:01:00');
INSERT INTO `sys_job_log` VALUES (84, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 10:02:00');
INSERT INTO `sys_job_log` VALUES (85, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 10:03:00');
INSERT INTO `sys_job_log` VALUES (86, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 10:04:00');
INSERT INTO `sys_job_log` VALUES (87, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:05:00');
INSERT INTO `sys_job_log` VALUES (88, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:06:00');
INSERT INTO `sys_job_log` VALUES (89, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 10:07:00');
INSERT INTO `sys_job_log` VALUES (90, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 10:08:00');
INSERT INTO `sys_job_log` VALUES (91, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:09:00');
INSERT INTO `sys_job_log` VALUES (92, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 10:10:00');
INSERT INTO `sys_job_log` VALUES (93, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 10:11:00');
INSERT INTO `sys_job_log` VALUES (94, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 10:12:00');
INSERT INTO `sys_job_log` VALUES (95, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 10:13:00');
INSERT INTO `sys_job_log` VALUES (96, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 10:14:00');
INSERT INTO `sys_job_log` VALUES (97, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 10:15:00');
INSERT INTO `sys_job_log` VALUES (98, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 10:16:00');
INSERT INTO `sys_job_log` VALUES (99, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 10:17:00');
INSERT INTO `sys_job_log` VALUES (100, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 10:18:00');
INSERT INTO `sys_job_log` VALUES (101, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-25 10:19:00');
INSERT INTO `sys_job_log` VALUES (102, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：29毫秒', '0', '', '2025-09-25 10:20:00');
INSERT INTO `sys_job_log` VALUES (103, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 10:21:00');
INSERT INTO `sys_job_log` VALUES (104, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 10:22:00');
INSERT INTO `sys_job_log` VALUES (105, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 10:23:00');
INSERT INTO `sys_job_log` VALUES (106, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-25 10:24:00');
INSERT INTO `sys_job_log` VALUES (107, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 10:25:00');
INSERT INTO `sys_job_log` VALUES (108, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 10:26:00');
INSERT INTO `sys_job_log` VALUES (109, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-25 10:27:00');
INSERT INTO `sys_job_log` VALUES (110, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-25 10:28:00');
INSERT INTO `sys_job_log` VALUES (111, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-25 10:29:00');
INSERT INTO `sys_job_log` VALUES (112, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-25 10:30:00');
INSERT INTO `sys_job_log` VALUES (113, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 10:31:00');
INSERT INTO `sys_job_log` VALUES (114, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:32:00');
INSERT INTO `sys_job_log` VALUES (115, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:33:00');
INSERT INTO `sys_job_log` VALUES (116, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 10:34:00');
INSERT INTO `sys_job_log` VALUES (117, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:35:00');
INSERT INTO `sys_job_log` VALUES (118, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 10:36:00');
INSERT INTO `sys_job_log` VALUES (119, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:37:00');
INSERT INTO `sys_job_log` VALUES (120, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 10:38:00');
INSERT INTO `sys_job_log` VALUES (121, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:39:00');
INSERT INTO `sys_job_log` VALUES (122, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 10:40:00');
INSERT INTO `sys_job_log` VALUES (123, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:41:00');
INSERT INTO `sys_job_log` VALUES (124, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 10:42:00');
INSERT INTO `sys_job_log` VALUES (125, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:43:00');
INSERT INTO `sys_job_log` VALUES (126, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-25 10:44:00');
INSERT INTO `sys_job_log` VALUES (127, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 10:45:00');
INSERT INTO `sys_job_log` VALUES (128, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 10:46:00');
INSERT INTO `sys_job_log` VALUES (129, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 10:47:00');
INSERT INTO `sys_job_log` VALUES (130, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:48:00');
INSERT INTO `sys_job_log` VALUES (131, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:49:00');
INSERT INTO `sys_job_log` VALUES (132, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:50:00');
INSERT INTO `sys_job_log` VALUES (133, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 10:51:00');
INSERT INTO `sys_job_log` VALUES (134, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 10:52:00');
INSERT INTO `sys_job_log` VALUES (135, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 10:53:00');
INSERT INTO `sys_job_log` VALUES (136, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 10:54:00');
INSERT INTO `sys_job_log` VALUES (137, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 10:55:00');
INSERT INTO `sys_job_log` VALUES (138, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 10:56:00');
INSERT INTO `sys_job_log` VALUES (139, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 10:57:00');
INSERT INTO `sys_job_log` VALUES (140, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 10:58:00');
INSERT INTO `sys_job_log` VALUES (141, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 10:59:00');
INSERT INTO `sys_job_log` VALUES (142, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 11:00:00');
INSERT INTO `sys_job_log` VALUES (143, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 11:01:00');
INSERT INTO `sys_job_log` VALUES (144, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:02:00');
INSERT INTO `sys_job_log` VALUES (145, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:03:00');
INSERT INTO `sys_job_log` VALUES (146, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 11:04:00');
INSERT INTO `sys_job_log` VALUES (147, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:05:00');
INSERT INTO `sys_job_log` VALUES (148, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 11:06:00');
INSERT INTO `sys_job_log` VALUES (149, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:07:00');
INSERT INTO `sys_job_log` VALUES (150, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 11:08:00');
INSERT INTO `sys_job_log` VALUES (151, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 11:09:00');
INSERT INTO `sys_job_log` VALUES (152, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:10:00');
INSERT INTO `sys_job_log` VALUES (153, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 11:11:00');
INSERT INTO `sys_job_log` VALUES (154, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 11:12:00');
INSERT INTO `sys_job_log` VALUES (155, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:13:00');
INSERT INTO `sys_job_log` VALUES (156, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:14:00');
INSERT INTO `sys_job_log` VALUES (157, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:15:00');
INSERT INTO `sys_job_log` VALUES (158, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 11:16:00');
INSERT INTO `sys_job_log` VALUES (159, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:17:00');
INSERT INTO `sys_job_log` VALUES (160, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:18:00');
INSERT INTO `sys_job_log` VALUES (161, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 11:19:00');
INSERT INTO `sys_job_log` VALUES (162, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:20:00');
INSERT INTO `sys_job_log` VALUES (163, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:21:00');
INSERT INTO `sys_job_log` VALUES (164, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:22:00');
INSERT INTO `sys_job_log` VALUES (165, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:23:00');
INSERT INTO `sys_job_log` VALUES (166, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:24:00');
INSERT INTO `sys_job_log` VALUES (167, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:25:00');
INSERT INTO `sys_job_log` VALUES (168, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:26:00');
INSERT INTO `sys_job_log` VALUES (169, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 11:27:00');
INSERT INTO `sys_job_log` VALUES (170, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 11:28:00');
INSERT INTO `sys_job_log` VALUES (171, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:29:00');
INSERT INTO `sys_job_log` VALUES (172, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:30:00');
INSERT INTO `sys_job_log` VALUES (173, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:31:00');
INSERT INTO `sys_job_log` VALUES (174, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:32:00');
INSERT INTO `sys_job_log` VALUES (175, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 11:33:00');
INSERT INTO `sys_job_log` VALUES (176, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:34:00');
INSERT INTO `sys_job_log` VALUES (177, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 11:35:00');
INSERT INTO `sys_job_log` VALUES (178, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:36:00');
INSERT INTO `sys_job_log` VALUES (179, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 11:37:00');
INSERT INTO `sys_job_log` VALUES (180, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 11:38:00');
INSERT INTO `sys_job_log` VALUES (181, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:39:00');
INSERT INTO `sys_job_log` VALUES (182, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 11:40:00');
INSERT INTO `sys_job_log` VALUES (183, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:41:00');
INSERT INTO `sys_job_log` VALUES (184, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-25 11:42:00');
INSERT INTO `sys_job_log` VALUES (185, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:43:00');
INSERT INTO `sys_job_log` VALUES (186, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:44:00');
INSERT INTO `sys_job_log` VALUES (187, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 11:45:00');
INSERT INTO `sys_job_log` VALUES (188, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 11:46:00');
INSERT INTO `sys_job_log` VALUES (189, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 11:47:00');
INSERT INTO `sys_job_log` VALUES (190, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 11:48:00');
INSERT INTO `sys_job_log` VALUES (191, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 11:49:00');
INSERT INTO `sys_job_log` VALUES (192, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 11:50:00');
INSERT INTO `sys_job_log` VALUES (193, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 11:51:00');
INSERT INTO `sys_job_log` VALUES (194, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：41毫秒', '0', '', '2025-09-25 11:58:00');
INSERT INTO `sys_job_log` VALUES (195, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 11:59:00');
INSERT INTO `sys_job_log` VALUES (196, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-25 12:00:00');
INSERT INTO `sys_job_log` VALUES (197, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 12:01:00');
INSERT INTO `sys_job_log` VALUES (198, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 12:02:00');
INSERT INTO `sys_job_log` VALUES (199, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-25 12:03:00');
INSERT INTO `sys_job_log` VALUES (200, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 12:04:00');
INSERT INTO `sys_job_log` VALUES (201, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 12:05:00');
INSERT INTO `sys_job_log` VALUES (202, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 12:06:00');
INSERT INTO `sys_job_log` VALUES (203, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 12:07:00');
INSERT INTO `sys_job_log` VALUES (204, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 12:08:00');
INSERT INTO `sys_job_log` VALUES (205, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 12:09:00');
INSERT INTO `sys_job_log` VALUES (206, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 12:10:00');
INSERT INTO `sys_job_log` VALUES (207, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 12:11:00');
INSERT INTO `sys_job_log` VALUES (208, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 12:12:00');
INSERT INTO `sys_job_log` VALUES (209, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 12:13:00');
INSERT INTO `sys_job_log` VALUES (210, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 12:14:00');
INSERT INTO `sys_job_log` VALUES (211, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 12:15:00');
INSERT INTO `sys_job_log` VALUES (212, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 12:16:00');
INSERT INTO `sys_job_log` VALUES (213, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 12:17:00');
INSERT INTO `sys_job_log` VALUES (214, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 12:18:00');
INSERT INTO `sys_job_log` VALUES (215, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 12:19:00');
INSERT INTO `sys_job_log` VALUES (216, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 12:20:00');
INSERT INTO `sys_job_log` VALUES (217, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 12:21:00');
INSERT INTO `sys_job_log` VALUES (218, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 12:22:00');
INSERT INTO `sys_job_log` VALUES (219, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 12:23:00');
INSERT INTO `sys_job_log` VALUES (220, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 12:24:00');
INSERT INTO `sys_job_log` VALUES (221, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 12:25:00');
INSERT INTO `sys_job_log` VALUES (222, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 12:26:00');
INSERT INTO `sys_job_log` VALUES (223, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 12:27:00');
INSERT INTO `sys_job_log` VALUES (224, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 12:28:00');
INSERT INTO `sys_job_log` VALUES (225, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 12:29:00');
INSERT INTO `sys_job_log` VALUES (226, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-25 12:30:00');
INSERT INTO `sys_job_log` VALUES (227, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 12:31:00');
INSERT INTO `sys_job_log` VALUES (228, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 12:32:00');
INSERT INTO `sys_job_log` VALUES (229, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 12:33:00');
INSERT INTO `sys_job_log` VALUES (230, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 12:34:00');
INSERT INTO `sys_job_log` VALUES (231, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 12:35:00');
INSERT INTO `sys_job_log` VALUES (232, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 12:36:00');
INSERT INTO `sys_job_log` VALUES (233, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 12:37:00');
INSERT INTO `sys_job_log` VALUES (234, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 12:38:00');
INSERT INTO `sys_job_log` VALUES (235, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 12:39:00');
INSERT INTO `sys_job_log` VALUES (236, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 12:40:00');
INSERT INTO `sys_job_log` VALUES (237, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 12:41:00');
INSERT INTO `sys_job_log` VALUES (238, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 12:42:00');
INSERT INTO `sys_job_log` VALUES (239, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 12:43:00');
INSERT INTO `sys_job_log` VALUES (240, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 12:44:00');
INSERT INTO `sys_job_log` VALUES (241, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 12:45:00');
INSERT INTO `sys_job_log` VALUES (242, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 12:46:00');
INSERT INTO `sys_job_log` VALUES (243, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 12:47:00');
INSERT INTO `sys_job_log` VALUES (244, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 12:48:00');
INSERT INTO `sys_job_log` VALUES (245, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 12:49:00');
INSERT INTO `sys_job_log` VALUES (246, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 12:50:00');
INSERT INTO `sys_job_log` VALUES (247, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 12:51:00');
INSERT INTO `sys_job_log` VALUES (248, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 12:52:00');
INSERT INTO `sys_job_log` VALUES (249, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 12:53:00');
INSERT INTO `sys_job_log` VALUES (250, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 12:54:00');
INSERT INTO `sys_job_log` VALUES (251, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 12:55:00');
INSERT INTO `sys_job_log` VALUES (252, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 12:56:00');
INSERT INTO `sys_job_log` VALUES (253, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 12:57:00');
INSERT INTO `sys_job_log` VALUES (254, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 12:58:00');
INSERT INTO `sys_job_log` VALUES (255, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 12:59:00');
INSERT INTO `sys_job_log` VALUES (256, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 13:00:00');
INSERT INTO `sys_job_log` VALUES (257, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 13:01:00');
INSERT INTO `sys_job_log` VALUES (258, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 13:02:00');
INSERT INTO `sys_job_log` VALUES (259, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 13:03:00');
INSERT INTO `sys_job_log` VALUES (260, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 13:04:00');
INSERT INTO `sys_job_log` VALUES (261, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 13:05:00');
INSERT INTO `sys_job_log` VALUES (262, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-25 13:06:00');
INSERT INTO `sys_job_log` VALUES (263, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 13:07:00');
INSERT INTO `sys_job_log` VALUES (264, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 13:08:00');
INSERT INTO `sys_job_log` VALUES (265, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 13:09:00');
INSERT INTO `sys_job_log` VALUES (266, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 13:10:00');
INSERT INTO `sys_job_log` VALUES (267, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 13:11:00');
INSERT INTO `sys_job_log` VALUES (268, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 13:12:00');
INSERT INTO `sys_job_log` VALUES (269, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：39毫秒', '0', '', '2025-09-25 14:07:00');
INSERT INTO `sys_job_log` VALUES (270, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-25 14:08:00');
INSERT INTO `sys_job_log` VALUES (271, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：24毫秒', '0', '', '2025-09-25 14:09:00');
INSERT INTO `sys_job_log` VALUES (272, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-25 14:10:00');
INSERT INTO `sys_job_log` VALUES (273, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-25 14:11:00');
INSERT INTO `sys_job_log` VALUES (274, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 14:12:00');
INSERT INTO `sys_job_log` VALUES (275, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 14:13:00');
INSERT INTO `sys_job_log` VALUES (276, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-25 14:14:00');
INSERT INTO `sys_job_log` VALUES (277, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-25 14:15:00');
INSERT INTO `sys_job_log` VALUES (278, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 14:16:00');
INSERT INTO `sys_job_log` VALUES (279, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 14:17:00');
INSERT INTO `sys_job_log` VALUES (280, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-25 14:18:00');
INSERT INTO `sys_job_log` VALUES (281, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 14:19:00');
INSERT INTO `sys_job_log` VALUES (282, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 14:20:00');
INSERT INTO `sys_job_log` VALUES (283, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-25 14:21:00');
INSERT INTO `sys_job_log` VALUES (284, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-25 14:22:00');
INSERT INTO `sys_job_log` VALUES (285, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 14:23:00');
INSERT INTO `sys_job_log` VALUES (286, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 14:24:00');
INSERT INTO `sys_job_log` VALUES (287, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 14:25:00');
INSERT INTO `sys_job_log` VALUES (288, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 14:26:00');
INSERT INTO `sys_job_log` VALUES (289, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 14:27:00');
INSERT INTO `sys_job_log` VALUES (290, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:28:00');
INSERT INTO `sys_job_log` VALUES (291, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 14:29:00');
INSERT INTO `sys_job_log` VALUES (292, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 14:30:00');
INSERT INTO `sys_job_log` VALUES (293, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 14:31:00');
INSERT INTO `sys_job_log` VALUES (294, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 14:32:00');
INSERT INTO `sys_job_log` VALUES (295, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:33:00');
INSERT INTO `sys_job_log` VALUES (296, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 14:34:00');
INSERT INTO `sys_job_log` VALUES (297, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:35:00');
INSERT INTO `sys_job_log` VALUES (298, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 14:36:00');
INSERT INTO `sys_job_log` VALUES (299, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 14:37:00');
INSERT INTO `sys_job_log` VALUES (300, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:38:00');
INSERT INTO `sys_job_log` VALUES (301, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 14:39:00');
INSERT INTO `sys_job_log` VALUES (302, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:40:00');
INSERT INTO `sys_job_log` VALUES (303, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:41:00');
INSERT INTO `sys_job_log` VALUES (304, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:42:00');
INSERT INTO `sys_job_log` VALUES (305, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:43:00');
INSERT INTO `sys_job_log` VALUES (306, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 14:44:00');
INSERT INTO `sys_job_log` VALUES (307, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:45:00');
INSERT INTO `sys_job_log` VALUES (308, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 14:46:00');
INSERT INTO `sys_job_log` VALUES (309, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 14:47:00');
INSERT INTO `sys_job_log` VALUES (310, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:48:00');
INSERT INTO `sys_job_log` VALUES (311, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 14:49:00');
INSERT INTO `sys_job_log` VALUES (312, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:50:00');
INSERT INTO `sys_job_log` VALUES (313, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 14:51:00');
INSERT INTO `sys_job_log` VALUES (314, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 14:52:00');
INSERT INTO `sys_job_log` VALUES (315, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 14:53:00');
INSERT INTO `sys_job_log` VALUES (316, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 14:54:00');
INSERT INTO `sys_job_log` VALUES (317, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-25 14:55:00');
INSERT INTO `sys_job_log` VALUES (318, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:56:00');
INSERT INTO `sys_job_log` VALUES (319, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:57:00');
INSERT INTO `sys_job_log` VALUES (320, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 14:58:00');
INSERT INTO `sys_job_log` VALUES (321, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 14:59:00');
INSERT INTO `sys_job_log` VALUES (322, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 15:00:00');
INSERT INTO `sys_job_log` VALUES (323, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 15:01:00');
INSERT INTO `sys_job_log` VALUES (324, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 15:02:00');
INSERT INTO `sys_job_log` VALUES (325, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 15:03:00');
INSERT INTO `sys_job_log` VALUES (326, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 15:04:00');
INSERT INTO `sys_job_log` VALUES (327, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 15:05:00');
INSERT INTO `sys_job_log` VALUES (328, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 15:06:00');
INSERT INTO `sys_job_log` VALUES (329, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 15:07:00');
INSERT INTO `sys_job_log` VALUES (330, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 15:08:00');
INSERT INTO `sys_job_log` VALUES (331, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 15:09:00');
INSERT INTO `sys_job_log` VALUES (332, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 15:10:00');
INSERT INTO `sys_job_log` VALUES (333, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 15:11:00');
INSERT INTO `sys_job_log` VALUES (334, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 15:12:00');
INSERT INTO `sys_job_log` VALUES (335, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 15:13:00');
INSERT INTO `sys_job_log` VALUES (336, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 15:14:00');
INSERT INTO `sys_job_log` VALUES (337, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 15:15:00');
INSERT INTO `sys_job_log` VALUES (338, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 15:16:00');
INSERT INTO `sys_job_log` VALUES (339, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 15:17:00');
INSERT INTO `sys_job_log` VALUES (340, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 15:18:00');
INSERT INTO `sys_job_log` VALUES (341, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 15:19:00');
INSERT INTO `sys_job_log` VALUES (342, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 15:20:00');
INSERT INTO `sys_job_log` VALUES (343, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 15:21:00');
INSERT INTO `sys_job_log` VALUES (344, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 15:22:00');
INSERT INTO `sys_job_log` VALUES (345, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 15:23:00');
INSERT INTO `sys_job_log` VALUES (346, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 15:24:00');
INSERT INTO `sys_job_log` VALUES (347, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 15:25:00');
INSERT INTO `sys_job_log` VALUES (348, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-25 15:26:00');
INSERT INTO `sys_job_log` VALUES (349, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 15:27:00');
INSERT INTO `sys_job_log` VALUES (350, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 15:28:00');
INSERT INTO `sys_job_log` VALUES (351, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：40毫秒', '0', '', '2025-09-25 16:08:01');
INSERT INTO `sys_job_log` VALUES (352, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：24毫秒', '0', '', '2025-09-25 16:09:00');
INSERT INTO `sys_job_log` VALUES (353, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-25 16:10:00');
INSERT INTO `sys_job_log` VALUES (354, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-25 16:11:00');
INSERT INTO `sys_job_log` VALUES (355, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-25 16:12:00');
INSERT INTO `sys_job_log` VALUES (356, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-25 16:13:00');
INSERT INTO `sys_job_log` VALUES (357, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：26毫秒', '0', '', '2025-09-25 16:14:00');
INSERT INTO `sys_job_log` VALUES (358, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-25 16:15:00');
INSERT INTO `sys_job_log` VALUES (359, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-25 16:16:00');
INSERT INTO `sys_job_log` VALUES (360, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-25 16:17:00');
INSERT INTO `sys_job_log` VALUES (361, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-25 16:18:00');
INSERT INTO `sys_job_log` VALUES (362, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-25 16:19:00');
INSERT INTO `sys_job_log` VALUES (363, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 16:20:00');
INSERT INTO `sys_job_log` VALUES (364, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-25 16:21:00');
INSERT INTO `sys_job_log` VALUES (365, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：23毫秒', '0', '', '2025-09-25 16:22:00');
INSERT INTO `sys_job_log` VALUES (366, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：62毫秒', '0', '', '2025-09-25 16:24:00');
INSERT INTO `sys_job_log` VALUES (367, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-25 16:25:00');
INSERT INTO `sys_job_log` VALUES (368, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-25 16:26:00');
INSERT INTO `sys_job_log` VALUES (369, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-25 16:27:00');
INSERT INTO `sys_job_log` VALUES (370, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-25 16:28:00');
INSERT INTO `sys_job_log` VALUES (371, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-25 16:29:00');
INSERT INTO `sys_job_log` VALUES (372, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 16:30:00');
INSERT INTO `sys_job_log` VALUES (373, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-25 16:31:00');
INSERT INTO `sys_job_log` VALUES (374, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 16:32:00');
INSERT INTO `sys_job_log` VALUES (375, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-25 16:33:00');
INSERT INTO `sys_job_log` VALUES (376, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 16:34:00');
INSERT INTO `sys_job_log` VALUES (377, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 16:35:00');
INSERT INTO `sys_job_log` VALUES (378, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 16:36:00');
INSERT INTO `sys_job_log` VALUES (379, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：25毫秒', '0', '', '2025-09-25 16:38:00');
INSERT INTO `sys_job_log` VALUES (380, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 16:39:00');
INSERT INTO `sys_job_log` VALUES (381, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 16:40:00');
INSERT INTO `sys_job_log` VALUES (382, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-25 16:41:00');
INSERT INTO `sys_job_log` VALUES (383, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-25 16:42:00');
INSERT INTO `sys_job_log` VALUES (384, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-25 16:43:00');
INSERT INTO `sys_job_log` VALUES (385, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-25 16:44:00');
INSERT INTO `sys_job_log` VALUES (386, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 16:45:00');
INSERT INTO `sys_job_log` VALUES (387, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 16:46:00');
INSERT INTO `sys_job_log` VALUES (388, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 16:47:00');
INSERT INTO `sys_job_log` VALUES (389, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-25 16:48:00');
INSERT INTO `sys_job_log` VALUES (390, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-25 16:49:00');
INSERT INTO `sys_job_log` VALUES (391, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-25 16:50:00');
INSERT INTO `sys_job_log` VALUES (392, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 16:51:00');
INSERT INTO `sys_job_log` VALUES (393, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-25 16:52:00');
INSERT INTO `sys_job_log` VALUES (394, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-25 16:53:00');
INSERT INTO `sys_job_log` VALUES (395, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-25 16:54:00');
INSERT INTO `sys_job_log` VALUES (396, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 16:55:00');
INSERT INTO `sys_job_log` VALUES (397, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 16:56:00');
INSERT INTO `sys_job_log` VALUES (398, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 16:57:00');
INSERT INTO `sys_job_log` VALUES (399, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 16:58:00');
INSERT INTO `sys_job_log` VALUES (400, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 16:59:00');
INSERT INTO `sys_job_log` VALUES (401, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (402, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:01:00');
INSERT INTO `sys_job_log` VALUES (403, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-25 17:02:00');
INSERT INTO `sys_job_log` VALUES (404, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:03:00');
INSERT INTO `sys_job_log` VALUES (405, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:04:00');
INSERT INTO `sys_job_log` VALUES (406, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:05:00');
INSERT INTO `sys_job_log` VALUES (407, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:06:00');
INSERT INTO `sys_job_log` VALUES (408, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-25 17:07:00');
INSERT INTO `sys_job_log` VALUES (409, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:08:00');
INSERT INTO `sys_job_log` VALUES (410, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:09:00');
INSERT INTO `sys_job_log` VALUES (411, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:10:00');
INSERT INTO `sys_job_log` VALUES (412, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:11:00');
INSERT INTO `sys_job_log` VALUES (413, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:12:00');
INSERT INTO `sys_job_log` VALUES (414, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-25 17:13:00');
INSERT INTO `sys_job_log` VALUES (415, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:14:00');
INSERT INTO `sys_job_log` VALUES (416, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 17:15:00');
INSERT INTO `sys_job_log` VALUES (417, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:16:00');
INSERT INTO `sys_job_log` VALUES (418, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-25 17:17:00');
INSERT INTO `sys_job_log` VALUES (419, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:18:00');
INSERT INTO `sys_job_log` VALUES (420, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-25 17:19:00');
INSERT INTO `sys_job_log` VALUES (421, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-25 17:20:00');
INSERT INTO `sys_job_log` VALUES (422, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:21:00');
INSERT INTO `sys_job_log` VALUES (423, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:22:00');
INSERT INTO `sys_job_log` VALUES (424, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:23:00');
INSERT INTO `sys_job_log` VALUES (425, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-25 17:24:00');
INSERT INTO `sys_job_log` VALUES (426, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:25:00');
INSERT INTO `sys_job_log` VALUES (427, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:26:00');
INSERT INTO `sys_job_log` VALUES (428, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:27:00');
INSERT INTO `sys_job_log` VALUES (429, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:28:00');
INSERT INTO `sys_job_log` VALUES (430, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-25 17:29:00');
INSERT INTO `sys_job_log` VALUES (431, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-25 17:30:00');
INSERT INTO `sys_job_log` VALUES (432, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:31:00');
INSERT INTO `sys_job_log` VALUES (433, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:32:00');
INSERT INTO `sys_job_log` VALUES (434, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-25 17:33:00');
INSERT INTO `sys_job_log` VALUES (435, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:34:00');
INSERT INTO `sys_job_log` VALUES (436, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-25 17:35:00');
INSERT INTO `sys_job_log` VALUES (437, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:36:00');
INSERT INTO `sys_job_log` VALUES (438, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-25 17:37:00');
INSERT INTO `sys_job_log` VALUES (439, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:38:00');
INSERT INTO `sys_job_log` VALUES (440, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:39:00');
INSERT INTO `sys_job_log` VALUES (441, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:40:00');
INSERT INTO `sys_job_log` VALUES (442, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:41:00');
INSERT INTO `sys_job_log` VALUES (443, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-25 17:42:00');
INSERT INTO `sys_job_log` VALUES (444, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:43:00');
INSERT INTO `sys_job_log` VALUES (445, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:44:00');
INSERT INTO `sys_job_log` VALUES (446, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:45:00');
INSERT INTO `sys_job_log` VALUES (447, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-25 17:46:00');
INSERT INTO `sys_job_log` VALUES (448, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-25 17:47:00');
INSERT INTO `sys_job_log` VALUES (449, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-25 17:48:00');
INSERT INTO `sys_job_log` VALUES (450, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-25 17:49:00');
INSERT INTO `sys_job_log` VALUES (451, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-25 17:50:00');
INSERT INTO `sys_job_log` VALUES (452, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-25 17:51:00');
INSERT INTO `sys_job_log` VALUES (453, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:52:00');
INSERT INTO `sys_job_log` VALUES (454, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-25 17:53:00');
INSERT INTO `sys_job_log` VALUES (455, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:54:00');
INSERT INTO `sys_job_log` VALUES (456, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-25 17:55:00');
INSERT INTO `sys_job_log` VALUES (457, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:56:00');
INSERT INTO `sys_job_log` VALUES (458, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:57:00');
INSERT INTO `sys_job_log` VALUES (459, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:58:00');
INSERT INTO `sys_job_log` VALUES (460, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 17:59:00');
INSERT INTO `sys_job_log` VALUES (461, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 18:00:00');
INSERT INTO `sys_job_log` VALUES (462, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-25 18:01:00');
INSERT INTO `sys_job_log` VALUES (463, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-25 18:02:00');
INSERT INTO `sys_job_log` VALUES (464, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 09:11:00');
INSERT INTO `sys_job_log` VALUES (465, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-26 09:12:00');
INSERT INTO `sys_job_log` VALUES (466, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 09:13:00');
INSERT INTO `sys_job_log` VALUES (467, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 09:14:00');
INSERT INTO `sys_job_log` VALUES (468, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 09:15:00');
INSERT INTO `sys_job_log` VALUES (469, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 09:16:00');
INSERT INTO `sys_job_log` VALUES (470, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 09:17:00');
INSERT INTO `sys_job_log` VALUES (471, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 09:18:00');
INSERT INTO `sys_job_log` VALUES (472, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 09:19:00');
INSERT INTO `sys_job_log` VALUES (473, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 09:20:00');
INSERT INTO `sys_job_log` VALUES (474, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 09:21:00');
INSERT INTO `sys_job_log` VALUES (475, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 09:22:00');
INSERT INTO `sys_job_log` VALUES (476, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 09:23:00');
INSERT INTO `sys_job_log` VALUES (477, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 09:24:00');
INSERT INTO `sys_job_log` VALUES (478, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 09:25:00');
INSERT INTO `sys_job_log` VALUES (479, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 09:26:00');
INSERT INTO `sys_job_log` VALUES (480, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 09:27:00');
INSERT INTO `sys_job_log` VALUES (481, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 09:28:00');
INSERT INTO `sys_job_log` VALUES (482, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 09:29:00');
INSERT INTO `sys_job_log` VALUES (483, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 09:30:00');
INSERT INTO `sys_job_log` VALUES (484, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 09:31:00');
INSERT INTO `sys_job_log` VALUES (485, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 09:32:00');
INSERT INTO `sys_job_log` VALUES (486, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 09:33:00');
INSERT INTO `sys_job_log` VALUES (487, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 09:34:00');
INSERT INTO `sys_job_log` VALUES (488, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 09:35:00');
INSERT INTO `sys_job_log` VALUES (489, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 09:36:00');
INSERT INTO `sys_job_log` VALUES (490, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 09:37:00');
INSERT INTO `sys_job_log` VALUES (491, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 09:38:00');
INSERT INTO `sys_job_log` VALUES (492, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 09:39:00');
INSERT INTO `sys_job_log` VALUES (493, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 09:40:00');
INSERT INTO `sys_job_log` VALUES (494, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 09:41:00');
INSERT INTO `sys_job_log` VALUES (495, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 09:42:00');
INSERT INTO `sys_job_log` VALUES (496, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 09:43:00');
INSERT INTO `sys_job_log` VALUES (497, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 09:44:00');
INSERT INTO `sys_job_log` VALUES (498, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 09:45:00');
INSERT INTO `sys_job_log` VALUES (499, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 09:46:00');
INSERT INTO `sys_job_log` VALUES (500, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 09:47:00');
INSERT INTO `sys_job_log` VALUES (501, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-26 09:48:00');
INSERT INTO `sys_job_log` VALUES (502, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 09:49:00');
INSERT INTO `sys_job_log` VALUES (503, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 09:50:00');
INSERT INTO `sys_job_log` VALUES (504, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 09:51:00');
INSERT INTO `sys_job_log` VALUES (505, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 09:52:00');
INSERT INTO `sys_job_log` VALUES (506, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 09:53:00');
INSERT INTO `sys_job_log` VALUES (507, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 09:54:00');
INSERT INTO `sys_job_log` VALUES (508, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 09:55:00');
INSERT INTO `sys_job_log` VALUES (509, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 09:56:00');
INSERT INTO `sys_job_log` VALUES (510, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 09:57:00');
INSERT INTO `sys_job_log` VALUES (511, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 09:58:00');
INSERT INTO `sys_job_log` VALUES (512, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 09:59:00');
INSERT INTO `sys_job_log` VALUES (513, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:00:00');
INSERT INTO `sys_job_log` VALUES (514, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:01:00');
INSERT INTO `sys_job_log` VALUES (515, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 10:02:00');
INSERT INTO `sys_job_log` VALUES (516, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 10:03:00');
INSERT INTO `sys_job_log` VALUES (517, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:04:00');
INSERT INTO `sys_job_log` VALUES (518, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 10:05:00');
INSERT INTO `sys_job_log` VALUES (519, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:06:00');
INSERT INTO `sys_job_log` VALUES (520, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:07:00');
INSERT INTO `sys_job_log` VALUES (521, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:08:00');
INSERT INTO `sys_job_log` VALUES (522, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:09:00');
INSERT INTO `sys_job_log` VALUES (523, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:10:00');
INSERT INTO `sys_job_log` VALUES (524, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:11:00');
INSERT INTO `sys_job_log` VALUES (525, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 10:12:00');
INSERT INTO `sys_job_log` VALUES (526, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 10:13:00');
INSERT INTO `sys_job_log` VALUES (527, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:14:00');
INSERT INTO `sys_job_log` VALUES (528, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 10:15:00');
INSERT INTO `sys_job_log` VALUES (529, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 10:16:00');
INSERT INTO `sys_job_log` VALUES (530, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：34毫秒', '0', '', '2025-09-26 10:18:00');
INSERT INTO `sys_job_log` VALUES (531, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 10:19:00');
INSERT INTO `sys_job_log` VALUES (532, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 10:20:00');
INSERT INTO `sys_job_log` VALUES (533, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-26 10:21:00');
INSERT INTO `sys_job_log` VALUES (534, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:22:00');
INSERT INTO `sys_job_log` VALUES (535, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:23:00');
INSERT INTO `sys_job_log` VALUES (536, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 10:24:00');
INSERT INTO `sys_job_log` VALUES (537, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:25:00');
INSERT INTO `sys_job_log` VALUES (538, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:26:00');
INSERT INTO `sys_job_log` VALUES (539, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:27:00');
INSERT INTO `sys_job_log` VALUES (540, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:28:00');
INSERT INTO `sys_job_log` VALUES (541, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:29:00');
INSERT INTO `sys_job_log` VALUES (542, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:30:00');
INSERT INTO `sys_job_log` VALUES (543, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:31:00');
INSERT INTO `sys_job_log` VALUES (544, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:32:00');
INSERT INTO `sys_job_log` VALUES (545, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:33:00');
INSERT INTO `sys_job_log` VALUES (546, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:34:00');
INSERT INTO `sys_job_log` VALUES (547, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:35:00');
INSERT INTO `sys_job_log` VALUES (548, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:36:00');
INSERT INTO `sys_job_log` VALUES (549, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:37:00');
INSERT INTO `sys_job_log` VALUES (550, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:38:00');
INSERT INTO `sys_job_log` VALUES (551, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:39:00');
INSERT INTO `sys_job_log` VALUES (552, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:40:00');
INSERT INTO `sys_job_log` VALUES (553, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 10:41:00');
INSERT INTO `sys_job_log` VALUES (554, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:42:00');
INSERT INTO `sys_job_log` VALUES (555, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 10:43:00');
INSERT INTO `sys_job_log` VALUES (556, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:44:00');
INSERT INTO `sys_job_log` VALUES (557, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:45:00');
INSERT INTO `sys_job_log` VALUES (558, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:46:00');
INSERT INTO `sys_job_log` VALUES (559, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:47:00');
INSERT INTO `sys_job_log` VALUES (560, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:48:00');
INSERT INTO `sys_job_log` VALUES (561, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:49:00');
INSERT INTO `sys_job_log` VALUES (562, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:50:00');
INSERT INTO `sys_job_log` VALUES (563, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:51:00');
INSERT INTO `sys_job_log` VALUES (564, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:52:00');
INSERT INTO `sys_job_log` VALUES (565, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:53:00');
INSERT INTO `sys_job_log` VALUES (566, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:54:00');
INSERT INTO `sys_job_log` VALUES (567, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 10:55:00');
INSERT INTO `sys_job_log` VALUES (568, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:56:00');
INSERT INTO `sys_job_log` VALUES (569, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:57:00');
INSERT INTO `sys_job_log` VALUES (570, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 10:58:00');
INSERT INTO `sys_job_log` VALUES (571, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 10:59:00');
INSERT INTO `sys_job_log` VALUES (572, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 11:00:00');
INSERT INTO `sys_job_log` VALUES (573, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 11:01:00');
INSERT INTO `sys_job_log` VALUES (574, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 11:02:00');
INSERT INTO `sys_job_log` VALUES (575, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 11:03:00');
INSERT INTO `sys_job_log` VALUES (576, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 11:04:00');
INSERT INTO `sys_job_log` VALUES (577, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 11:05:00');
INSERT INTO `sys_job_log` VALUES (578, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 11:06:00');
INSERT INTO `sys_job_log` VALUES (579, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 11:07:00');
INSERT INTO `sys_job_log` VALUES (580, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 11:08:00');
INSERT INTO `sys_job_log` VALUES (581, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 11:09:00');
INSERT INTO `sys_job_log` VALUES (582, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 11:10:00');
INSERT INTO `sys_job_log` VALUES (583, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 11:11:00');
INSERT INTO `sys_job_log` VALUES (584, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 11:12:00');
INSERT INTO `sys_job_log` VALUES (585, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 11:13:00');
INSERT INTO `sys_job_log` VALUES (586, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 11:14:00');
INSERT INTO `sys_job_log` VALUES (587, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 11:15:00');
INSERT INTO `sys_job_log` VALUES (588, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 11:16:00');
INSERT INTO `sys_job_log` VALUES (589, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 11:17:00');
INSERT INTO `sys_job_log` VALUES (590, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 11:18:00');
INSERT INTO `sys_job_log` VALUES (591, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 11:19:00');
INSERT INTO `sys_job_log` VALUES (592, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 11:20:00');
INSERT INTO `sys_job_log` VALUES (593, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 11:21:00');
INSERT INTO `sys_job_log` VALUES (594, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 11:22:00');
INSERT INTO `sys_job_log` VALUES (595, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 11:23:00');
INSERT INTO `sys_job_log` VALUES (596, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 11:25:00');
INSERT INTO `sys_job_log` VALUES (597, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 11:26:00');
INSERT INTO `sys_job_log` VALUES (598, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 11:27:00');
INSERT INTO `sys_job_log` VALUES (599, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 11:28:00');
INSERT INTO `sys_job_log` VALUES (600, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 11:29:00');
INSERT INTO `sys_job_log` VALUES (601, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 11:30:00');
INSERT INTO `sys_job_log` VALUES (602, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 11:31:00');
INSERT INTO `sys_job_log` VALUES (603, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 11:32:00');
INSERT INTO `sys_job_log` VALUES (604, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-26 11:33:00');
INSERT INTO `sys_job_log` VALUES (605, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 11:34:00');
INSERT INTO `sys_job_log` VALUES (606, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 11:35:00');
INSERT INTO `sys_job_log` VALUES (607, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 11:36:00');
INSERT INTO `sys_job_log` VALUES (608, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 11:37:00');
INSERT INTO `sys_job_log` VALUES (609, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-26 11:38:00');
INSERT INTO `sys_job_log` VALUES (610, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 11:39:00');
INSERT INTO `sys_job_log` VALUES (611, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 11:40:00');
INSERT INTO `sys_job_log` VALUES (612, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 11:41:00');
INSERT INTO `sys_job_log` VALUES (613, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 11:42:00');
INSERT INTO `sys_job_log` VALUES (614, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：52毫秒', '0', '', '2025-09-26 11:43:00');
INSERT INTO `sys_job_log` VALUES (615, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 11:44:00');
INSERT INTO `sys_job_log` VALUES (616, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 11:45:00');
INSERT INTO `sys_job_log` VALUES (617, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 11:46:00');
INSERT INTO `sys_job_log` VALUES (618, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 11:47:00');
INSERT INTO `sys_job_log` VALUES (619, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 11:48:00');
INSERT INTO `sys_job_log` VALUES (620, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 11:49:00');
INSERT INTO `sys_job_log` VALUES (621, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 11:50:00');
INSERT INTO `sys_job_log` VALUES (622, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 11:51:00');
INSERT INTO `sys_job_log` VALUES (623, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 11:52:00');
INSERT INTO `sys_job_log` VALUES (624, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 11:53:00');
INSERT INTO `sys_job_log` VALUES (625, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 11:54:00');
INSERT INTO `sys_job_log` VALUES (626, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-26 11:55:00');
INSERT INTO `sys_job_log` VALUES (627, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 11:56:00');
INSERT INTO `sys_job_log` VALUES (628, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 11:57:00');
INSERT INTO `sys_job_log` VALUES (629, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 11:58:00');
INSERT INTO `sys_job_log` VALUES (630, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 11:59:00');
INSERT INTO `sys_job_log` VALUES (631, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 12:00:00');
INSERT INTO `sys_job_log` VALUES (632, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 12:01:00');
INSERT INTO `sys_job_log` VALUES (633, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 12:02:00');
INSERT INTO `sys_job_log` VALUES (634, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 12:03:00');
INSERT INTO `sys_job_log` VALUES (635, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 12:04:00');
INSERT INTO `sys_job_log` VALUES (636, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 12:05:00');
INSERT INTO `sys_job_log` VALUES (637, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 12:06:00');
INSERT INTO `sys_job_log` VALUES (638, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 12:07:00');
INSERT INTO `sys_job_log` VALUES (639, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 12:08:00');
INSERT INTO `sys_job_log` VALUES (640, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 12:09:00');
INSERT INTO `sys_job_log` VALUES (641, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 12:10:00');
INSERT INTO `sys_job_log` VALUES (642, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 12:11:00');
INSERT INTO `sys_job_log` VALUES (643, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 12:12:00');
INSERT INTO `sys_job_log` VALUES (644, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 12:13:00');
INSERT INTO `sys_job_log` VALUES (645, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-26 12:14:00');
INSERT INTO `sys_job_log` VALUES (646, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 12:15:00');
INSERT INTO `sys_job_log` VALUES (647, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 12:16:00');
INSERT INTO `sys_job_log` VALUES (648, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 12:17:00');
INSERT INTO `sys_job_log` VALUES (649, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 12:18:00');
INSERT INTO `sys_job_log` VALUES (650, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 12:19:00');
INSERT INTO `sys_job_log` VALUES (651, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 12:20:00');
INSERT INTO `sys_job_log` VALUES (652, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 12:21:00');
INSERT INTO `sys_job_log` VALUES (653, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 12:22:00');
INSERT INTO `sys_job_log` VALUES (654, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 12:23:00');
INSERT INTO `sys_job_log` VALUES (655, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 12:24:00');
INSERT INTO `sys_job_log` VALUES (656, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 12:25:00');
INSERT INTO `sys_job_log` VALUES (657, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 12:26:00');
INSERT INTO `sys_job_log` VALUES (658, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 12:27:00');
INSERT INTO `sys_job_log` VALUES (659, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 12:28:00');
INSERT INTO `sys_job_log` VALUES (660, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 12:29:00');
INSERT INTO `sys_job_log` VALUES (661, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-09-26 12:30:00');
INSERT INTO `sys_job_log` VALUES (662, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-26 12:31:00');
INSERT INTO `sys_job_log` VALUES (663, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 12:32:00');
INSERT INTO `sys_job_log` VALUES (664, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 12:33:00');
INSERT INTO `sys_job_log` VALUES (665, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 12:34:00');
INSERT INTO `sys_job_log` VALUES (666, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 12:35:00');
INSERT INTO `sys_job_log` VALUES (667, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 12:36:00');
INSERT INTO `sys_job_log` VALUES (668, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 12:37:00');
INSERT INTO `sys_job_log` VALUES (669, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 12:38:00');
INSERT INTO `sys_job_log` VALUES (670, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 12:39:00');
INSERT INTO `sys_job_log` VALUES (671, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 12:40:00');
INSERT INTO `sys_job_log` VALUES (672, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 12:41:00');
INSERT INTO `sys_job_log` VALUES (673, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 12:42:00');
INSERT INTO `sys_job_log` VALUES (674, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-26 12:43:00');
INSERT INTO `sys_job_log` VALUES (675, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 12:44:00');
INSERT INTO `sys_job_log` VALUES (676, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-26 12:45:00');
INSERT INTO `sys_job_log` VALUES (677, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-26 12:46:00');
INSERT INTO `sys_job_log` VALUES (678, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 12:47:00');
INSERT INTO `sys_job_log` VALUES (679, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 12:48:00');
INSERT INTO `sys_job_log` VALUES (680, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 12:49:00');
INSERT INTO `sys_job_log` VALUES (681, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 12:50:00');
INSERT INTO `sys_job_log` VALUES (682, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 12:51:00');
INSERT INTO `sys_job_log` VALUES (683, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 12:52:00');
INSERT INTO `sys_job_log` VALUES (684, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-26 12:53:00');
INSERT INTO `sys_job_log` VALUES (685, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 12:54:00');
INSERT INTO `sys_job_log` VALUES (686, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-26 12:55:00');
INSERT INTO `sys_job_log` VALUES (687, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-26 12:56:00');
INSERT INTO `sys_job_log` VALUES (688, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-26 12:57:00');
INSERT INTO `sys_job_log` VALUES (689, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 12:58:00');
INSERT INTO `sys_job_log` VALUES (690, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 12:59:00');
INSERT INTO `sys_job_log` VALUES (691, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：22毫秒', '0', '', '2025-09-26 13:00:00');
INSERT INTO `sys_job_log` VALUES (692, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 13:01:00');
INSERT INTO `sys_job_log` VALUES (693, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 13:02:00');
INSERT INTO `sys_job_log` VALUES (694, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 13:03:00');
INSERT INTO `sys_job_log` VALUES (695, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 13:04:00');
INSERT INTO `sys_job_log` VALUES (696, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 13:05:00');
INSERT INTO `sys_job_log` VALUES (697, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 13:06:00');
INSERT INTO `sys_job_log` VALUES (698, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 13:07:00');
INSERT INTO `sys_job_log` VALUES (699, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 13:08:00');
INSERT INTO `sys_job_log` VALUES (700, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-26 13:10:00');
INSERT INTO `sys_job_log` VALUES (701, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 13:11:00');
INSERT INTO `sys_job_log` VALUES (702, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 13:12:00');
INSERT INTO `sys_job_log` VALUES (703, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 13:13:00');
INSERT INTO `sys_job_log` VALUES (704, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 13:14:00');
INSERT INTO `sys_job_log` VALUES (705, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-26 13:15:00');
INSERT INTO `sys_job_log` VALUES (706, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 13:16:00');
INSERT INTO `sys_job_log` VALUES (707, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 13:17:00');
INSERT INTO `sys_job_log` VALUES (708, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 13:18:00');
INSERT INTO `sys_job_log` VALUES (709, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 13:19:00');
INSERT INTO `sys_job_log` VALUES (710, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 13:20:00');
INSERT INTO `sys_job_log` VALUES (711, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 13:21:00');
INSERT INTO `sys_job_log` VALUES (712, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 13:22:00');
INSERT INTO `sys_job_log` VALUES (713, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 13:23:00');
INSERT INTO `sys_job_log` VALUES (714, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 13:24:00');
INSERT INTO `sys_job_log` VALUES (715, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：31毫秒', '0', '', '2025-09-26 13:25:01');
INSERT INTO `sys_job_log` VALUES (716, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 13:26:00');
INSERT INTO `sys_job_log` VALUES (717, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 13:27:00');
INSERT INTO `sys_job_log` VALUES (718, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 13:28:00');
INSERT INTO `sys_job_log` VALUES (719, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 13:29:00');
INSERT INTO `sys_job_log` VALUES (720, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 13:30:00');
INSERT INTO `sys_job_log` VALUES (721, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 13:31:00');
INSERT INTO `sys_job_log` VALUES (722, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 13:32:00');
INSERT INTO `sys_job_log` VALUES (723, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 13:33:00');
INSERT INTO `sys_job_log` VALUES (724, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 13:34:00');
INSERT INTO `sys_job_log` VALUES (725, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 13:35:00');
INSERT INTO `sys_job_log` VALUES (726, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 13:36:00');
INSERT INTO `sys_job_log` VALUES (727, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 13:37:00');
INSERT INTO `sys_job_log` VALUES (728, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 13:38:00');
INSERT INTO `sys_job_log` VALUES (729, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：40毫秒', '0', '', '2025-09-26 13:53:00');
INSERT INTO `sys_job_log` VALUES (730, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 13:54:00');
INSERT INTO `sys_job_log` VALUES (731, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-26 13:55:00');
INSERT INTO `sys_job_log` VALUES (732, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 13:56:00');
INSERT INTO `sys_job_log` VALUES (733, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 13:57:00');
INSERT INTO `sys_job_log` VALUES (734, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-26 13:58:00');
INSERT INTO `sys_job_log` VALUES (735, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-26 13:59:00');
INSERT INTO `sys_job_log` VALUES (736, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 14:00:00');
INSERT INTO `sys_job_log` VALUES (737, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 14:01:00');
INSERT INTO `sys_job_log` VALUES (738, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-26 14:02:00');
INSERT INTO `sys_job_log` VALUES (739, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 14:03:00');
INSERT INTO `sys_job_log` VALUES (740, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 14:04:00');
INSERT INTO `sys_job_log` VALUES (741, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 14:05:00');
INSERT INTO `sys_job_log` VALUES (742, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-26 14:06:00');
INSERT INTO `sys_job_log` VALUES (743, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 14:07:00');
INSERT INTO `sys_job_log` VALUES (744, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 14:08:00');
INSERT INTO `sys_job_log` VALUES (745, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 14:09:00');
INSERT INTO `sys_job_log` VALUES (746, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 14:10:00');
INSERT INTO `sys_job_log` VALUES (747, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-26 14:11:00');
INSERT INTO `sys_job_log` VALUES (748, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 14:12:00');
INSERT INTO `sys_job_log` VALUES (749, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-26 14:13:00');
INSERT INTO `sys_job_log` VALUES (750, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 14:14:00');
INSERT INTO `sys_job_log` VALUES (751, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 14:15:00');
INSERT INTO `sys_job_log` VALUES (752, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-26 14:17:00');
INSERT INTO `sys_job_log` VALUES (753, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 14:18:00');
INSERT INTO `sys_job_log` VALUES (754, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 14:19:00');
INSERT INTO `sys_job_log` VALUES (755, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 14:20:00');
INSERT INTO `sys_job_log` VALUES (756, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 14:21:00');
INSERT INTO `sys_job_log` VALUES (757, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-26 14:22:00');
INSERT INTO `sys_job_log` VALUES (758, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-26 14:23:00');
INSERT INTO `sys_job_log` VALUES (759, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 14:24:00');
INSERT INTO `sys_job_log` VALUES (760, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 14:25:00');
INSERT INTO `sys_job_log` VALUES (761, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 14:26:00');
INSERT INTO `sys_job_log` VALUES (762, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 14:27:00');
INSERT INTO `sys_job_log` VALUES (763, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 14:28:00');
INSERT INTO `sys_job_log` VALUES (764, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 14:29:00');
INSERT INTO `sys_job_log` VALUES (765, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：41毫秒', '0', '', '2025-09-26 14:30:00');
INSERT INTO `sys_job_log` VALUES (766, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 14:31:00');
INSERT INTO `sys_job_log` VALUES (767, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 14:32:00');
INSERT INTO `sys_job_log` VALUES (768, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 14:33:00');
INSERT INTO `sys_job_log` VALUES (769, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 14:34:00');
INSERT INTO `sys_job_log` VALUES (770, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 14:35:00');
INSERT INTO `sys_job_log` VALUES (771, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 14:36:00');
INSERT INTO `sys_job_log` VALUES (772, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 14:37:00');
INSERT INTO `sys_job_log` VALUES (773, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 14:38:00');
INSERT INTO `sys_job_log` VALUES (774, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 14:39:00');
INSERT INTO `sys_job_log` VALUES (775, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 14:40:00');
INSERT INTO `sys_job_log` VALUES (776, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 14:41:00');
INSERT INTO `sys_job_log` VALUES (777, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 14:42:00');
INSERT INTO `sys_job_log` VALUES (778, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 14:43:00');
INSERT INTO `sys_job_log` VALUES (779, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：40毫秒', '0', '', '2025-09-26 14:55:00');
INSERT INTO `sys_job_log` VALUES (780, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 14:56:00');
INSERT INTO `sys_job_log` VALUES (781, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 14:57:00');
INSERT INTO `sys_job_log` VALUES (782, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 14:58:00');
INSERT INTO `sys_job_log` VALUES (783, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 14:59:00');
INSERT INTO `sys_job_log` VALUES (784, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 15:00:00');
INSERT INTO `sys_job_log` VALUES (785, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 15:01:00');
INSERT INTO `sys_job_log` VALUES (786, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 15:02:00');
INSERT INTO `sys_job_log` VALUES (787, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 15:03:00');
INSERT INTO `sys_job_log` VALUES (788, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 15:04:00');
INSERT INTO `sys_job_log` VALUES (789, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-26 15:05:00');
INSERT INTO `sys_job_log` VALUES (790, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 15:06:00');
INSERT INTO `sys_job_log` VALUES (791, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-26 15:07:00');
INSERT INTO `sys_job_log` VALUES (792, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 15:08:00');
INSERT INTO `sys_job_log` VALUES (793, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-26 15:25:00');
INSERT INTO `sys_job_log` VALUES (794, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-26 15:26:00');
INSERT INTO `sys_job_log` VALUES (795, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-26 15:27:00');
INSERT INTO `sys_job_log` VALUES (796, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 15:28:00');
INSERT INTO `sys_job_log` VALUES (797, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 15:29:00');
INSERT INTO `sys_job_log` VALUES (798, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-26 15:30:00');
INSERT INTO `sys_job_log` VALUES (799, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 15:31:00');
INSERT INTO `sys_job_log` VALUES (800, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 15:32:00');
INSERT INTO `sys_job_log` VALUES (801, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 15:33:00');
INSERT INTO `sys_job_log` VALUES (802, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-26 15:34:00');
INSERT INTO `sys_job_log` VALUES (803, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-26 15:35:00');
INSERT INTO `sys_job_log` VALUES (804, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 15:36:00');
INSERT INTO `sys_job_log` VALUES (805, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 15:37:00');
INSERT INTO `sys_job_log` VALUES (806, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 15:38:00');
INSERT INTO `sys_job_log` VALUES (807, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 15:39:00');
INSERT INTO `sys_job_log` VALUES (808, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 15:40:00');
INSERT INTO `sys_job_log` VALUES (809, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 15:41:00');
INSERT INTO `sys_job_log` VALUES (810, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 15:42:00');
INSERT INTO `sys_job_log` VALUES (811, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 15:43:00');
INSERT INTO `sys_job_log` VALUES (812, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-26 15:44:00');
INSERT INTO `sys_job_log` VALUES (813, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 15:45:00');
INSERT INTO `sys_job_log` VALUES (814, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 15:46:00');
INSERT INTO `sys_job_log` VALUES (815, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 15:47:00');
INSERT INTO `sys_job_log` VALUES (816, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-26 15:48:00');
INSERT INTO `sys_job_log` VALUES (817, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-26 15:49:00');
INSERT INTO `sys_job_log` VALUES (818, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：77毫秒', '0', '', '2025-09-26 15:50:00');
INSERT INTO `sys_job_log` VALUES (819, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 15:51:00');
INSERT INTO `sys_job_log` VALUES (820, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 15:52:00');
INSERT INTO `sys_job_log` VALUES (821, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 15:53:00');
INSERT INTO `sys_job_log` VALUES (822, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 15:54:00');
INSERT INTO `sys_job_log` VALUES (823, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-26 15:55:00');
INSERT INTO `sys_job_log` VALUES (824, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 15:56:00');
INSERT INTO `sys_job_log` VALUES (825, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 15:57:00');
INSERT INTO `sys_job_log` VALUES (826, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 15:58:00');
INSERT INTO `sys_job_log` VALUES (827, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 15:59:00');
INSERT INTO `sys_job_log` VALUES (828, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 16:00:00');
INSERT INTO `sys_job_log` VALUES (829, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 16:01:00');
INSERT INTO `sys_job_log` VALUES (830, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 16:02:00');
INSERT INTO `sys_job_log` VALUES (831, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 16:03:00');
INSERT INTO `sys_job_log` VALUES (832, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 16:04:00');
INSERT INTO `sys_job_log` VALUES (833, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 16:05:00');
INSERT INTO `sys_job_log` VALUES (834, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 16:06:00');
INSERT INTO `sys_job_log` VALUES (835, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 16:07:00');
INSERT INTO `sys_job_log` VALUES (836, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 16:08:00');
INSERT INTO `sys_job_log` VALUES (837, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 16:09:00');
INSERT INTO `sys_job_log` VALUES (838, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 16:10:00');
INSERT INTO `sys_job_log` VALUES (839, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 16:11:00');
INSERT INTO `sys_job_log` VALUES (840, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 16:12:00');
INSERT INTO `sys_job_log` VALUES (841, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 16:13:00');
INSERT INTO `sys_job_log` VALUES (842, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 16:14:00');
INSERT INTO `sys_job_log` VALUES (843, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 16:15:00');
INSERT INTO `sys_job_log` VALUES (844, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 16:16:00');
INSERT INTO `sys_job_log` VALUES (845, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：22毫秒', '0', '', '2025-09-26 16:18:00');
INSERT INTO `sys_job_log` VALUES (846, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 16:19:00');
INSERT INTO `sys_job_log` VALUES (847, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 16:20:00');
INSERT INTO `sys_job_log` VALUES (848, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 16:21:00');
INSERT INTO `sys_job_log` VALUES (849, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 16:22:00');
INSERT INTO `sys_job_log` VALUES (850, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 16:23:00');
INSERT INTO `sys_job_log` VALUES (851, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 16:24:00');
INSERT INTO `sys_job_log` VALUES (852, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-26 16:26:00');
INSERT INTO `sys_job_log` VALUES (853, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 16:27:00');
INSERT INTO `sys_job_log` VALUES (854, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 16:28:00');
INSERT INTO `sys_job_log` VALUES (855, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：27毫秒', '0', '', '2025-09-26 16:29:00');
INSERT INTO `sys_job_log` VALUES (856, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-26 16:30:00');
INSERT INTO `sys_job_log` VALUES (857, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 16:31:00');
INSERT INTO `sys_job_log` VALUES (858, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 16:32:00');
INSERT INTO `sys_job_log` VALUES (859, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 16:33:00');
INSERT INTO `sys_job_log` VALUES (860, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-26 16:34:00');
INSERT INTO `sys_job_log` VALUES (861, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：29毫秒', '0', '', '2025-09-26 16:35:00');
INSERT INTO `sys_job_log` VALUES (862, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 16:36:00');
INSERT INTO `sys_job_log` VALUES (863, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 16:37:00');
INSERT INTO `sys_job_log` VALUES (864, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 16:38:00');
INSERT INTO `sys_job_log` VALUES (865, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 16:39:00');
INSERT INTO `sys_job_log` VALUES (866, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：35毫秒', '0', '', '2025-09-26 16:40:00');
INSERT INTO `sys_job_log` VALUES (867, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-09-26 16:41:00');
INSERT INTO `sys_job_log` VALUES (868, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：36毫秒', '0', '', '2025-09-26 16:42:00');
INSERT INTO `sys_job_log` VALUES (869, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-26 16:43:00');
INSERT INTO `sys_job_log` VALUES (870, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 16:44:00');
INSERT INTO `sys_job_log` VALUES (871, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 16:45:00');
INSERT INTO `sys_job_log` VALUES (872, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 16:46:00');
INSERT INTO `sys_job_log` VALUES (873, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 16:47:00');
INSERT INTO `sys_job_log` VALUES (874, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 16:48:00');
INSERT INTO `sys_job_log` VALUES (875, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：31毫秒', '0', '', '2025-09-26 16:49:00');
INSERT INTO `sys_job_log` VALUES (876, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 16:50:00');
INSERT INTO `sys_job_log` VALUES (877, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 16:51:00');
INSERT INTO `sys_job_log` VALUES (878, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 16:52:00');
INSERT INTO `sys_job_log` VALUES (879, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 16:53:00');
INSERT INTO `sys_job_log` VALUES (880, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 16:54:00');
INSERT INTO `sys_job_log` VALUES (881, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 16:55:00');
INSERT INTO `sys_job_log` VALUES (882, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 16:56:00');
INSERT INTO `sys_job_log` VALUES (883, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 16:57:00');
INSERT INTO `sys_job_log` VALUES (884, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-26 16:58:00');
INSERT INTO `sys_job_log` VALUES (885, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 16:59:00');
INSERT INTO `sys_job_log` VALUES (886, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 17:00:00');
INSERT INTO `sys_job_log` VALUES (887, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：32毫秒', '0', '', '2025-09-26 17:01:00');
INSERT INTO `sys_job_log` VALUES (888, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 17:02:00');
INSERT INTO `sys_job_log` VALUES (889, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 17:03:00');
INSERT INTO `sys_job_log` VALUES (890, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 17:04:00');
INSERT INTO `sys_job_log` VALUES (891, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 17:05:00');
INSERT INTO `sys_job_log` VALUES (892, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 17:06:00');
INSERT INTO `sys_job_log` VALUES (893, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-26 17:07:00');
INSERT INTO `sys_job_log` VALUES (894, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 17:08:00');
INSERT INTO `sys_job_log` VALUES (895, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 17:09:00');
INSERT INTO `sys_job_log` VALUES (896, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 17:10:00');
INSERT INTO `sys_job_log` VALUES (897, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 17:11:00');
INSERT INTO `sys_job_log` VALUES (898, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：43毫秒', '0', '', '2025-09-26 17:15:00');
INSERT INTO `sys_job_log` VALUES (899, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 17:16:00');
INSERT INTO `sys_job_log` VALUES (900, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-26 17:17:00');
INSERT INTO `sys_job_log` VALUES (901, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 17:18:00');
INSERT INTO `sys_job_log` VALUES (902, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 17:19:00');
INSERT INTO `sys_job_log` VALUES (903, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 17:20:00');
INSERT INTO `sys_job_log` VALUES (904, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-26 17:21:00');
INSERT INTO `sys_job_log` VALUES (905, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 17:22:00');
INSERT INTO `sys_job_log` VALUES (906, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 17:23:00');
INSERT INTO `sys_job_log` VALUES (907, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 17:24:00');
INSERT INTO `sys_job_log` VALUES (908, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 17:25:00');
INSERT INTO `sys_job_log` VALUES (909, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 17:26:00');
INSERT INTO `sys_job_log` VALUES (910, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-26 17:27:00');
INSERT INTO `sys_job_log` VALUES (911, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 17:28:00');
INSERT INTO `sys_job_log` VALUES (912, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-26 17:29:00');
INSERT INTO `sys_job_log` VALUES (913, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 17:30:00');
INSERT INTO `sys_job_log` VALUES (914, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 17:31:00');
INSERT INTO `sys_job_log` VALUES (915, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 17:32:00');
INSERT INTO `sys_job_log` VALUES (916, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 17:33:00');
INSERT INTO `sys_job_log` VALUES (917, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 17:34:00');
INSERT INTO `sys_job_log` VALUES (918, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 17:35:00');
INSERT INTO `sys_job_log` VALUES (919, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 17:36:00');
INSERT INTO `sys_job_log` VALUES (920, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 17:37:00');
INSERT INTO `sys_job_log` VALUES (921, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 17:38:00');
INSERT INTO `sys_job_log` VALUES (922, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 17:39:00');
INSERT INTO `sys_job_log` VALUES (923, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 17:40:00');
INSERT INTO `sys_job_log` VALUES (924, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 17:41:00');
INSERT INTO `sys_job_log` VALUES (925, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 17:42:00');
INSERT INTO `sys_job_log` VALUES (926, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 17:43:00');
INSERT INTO `sys_job_log` VALUES (927, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 17:44:00');
INSERT INTO `sys_job_log` VALUES (928, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 17:45:00');
INSERT INTO `sys_job_log` VALUES (929, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 17:46:00');
INSERT INTO `sys_job_log` VALUES (930, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 17:47:00');
INSERT INTO `sys_job_log` VALUES (931, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-09-26 17:48:00');
INSERT INTO `sys_job_log` VALUES (932, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 17:49:00');
INSERT INTO `sys_job_log` VALUES (933, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 17:50:00');
INSERT INTO `sys_job_log` VALUES (934, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 17:51:00');
INSERT INTO `sys_job_log` VALUES (935, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 17:52:00');
INSERT INTO `sys_job_log` VALUES (936, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 17:53:00');
INSERT INTO `sys_job_log` VALUES (937, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-26 17:54:00');
INSERT INTO `sys_job_log` VALUES (938, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 17:55:00');
INSERT INTO `sys_job_log` VALUES (939, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-26 17:56:00');
INSERT INTO `sys_job_log` VALUES (940, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-26 17:57:00');
INSERT INTO `sys_job_log` VALUES (941, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-26 17:58:00');
INSERT INTO `sys_job_log` VALUES (942, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-26 17:59:00');
INSERT INTO `sys_job_log` VALUES (943, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 18:00:00');
INSERT INTO `sys_job_log` VALUES (944, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-26 18:01:00');
INSERT INTO `sys_job_log` VALUES (945, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：43毫秒', '0', '', '2025-09-29 08:59:00');
INSERT INTO `sys_job_log` VALUES (946, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-29 09:00:00');
INSERT INTO `sys_job_log` VALUES (947, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 09:01:00');
INSERT INTO `sys_job_log` VALUES (948, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 09:02:00');
INSERT INTO `sys_job_log` VALUES (949, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-29 09:03:00');
INSERT INTO `sys_job_log` VALUES (950, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：119毫秒', '0', '', '2025-09-29 09:04:00');
INSERT INTO `sys_job_log` VALUES (951, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 09:05:00');
INSERT INTO `sys_job_log` VALUES (952, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-29 09:06:00');
INSERT INTO `sys_job_log` VALUES (953, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-29 09:07:00');
INSERT INTO `sys_job_log` VALUES (954, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-29 09:08:00');
INSERT INTO `sys_job_log` VALUES (955, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 09:09:00');
INSERT INTO `sys_job_log` VALUES (956, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 09:10:00');
INSERT INTO `sys_job_log` VALUES (957, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：36毫秒', '0', '', '2025-09-29 09:11:00');
INSERT INTO `sys_job_log` VALUES (958, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-29 09:12:00');
INSERT INTO `sys_job_log` VALUES (959, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 09:13:00');
INSERT INTO `sys_job_log` VALUES (960, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 09:14:00');
INSERT INTO `sys_job_log` VALUES (961, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-29 09:15:00');
INSERT INTO `sys_job_log` VALUES (962, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 09:16:00');
INSERT INTO `sys_job_log` VALUES (963, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 09:17:00');
INSERT INTO `sys_job_log` VALUES (964, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 09:18:00');
INSERT INTO `sys_job_log` VALUES (965, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 09:19:00');
INSERT INTO `sys_job_log` VALUES (966, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-29 09:20:00');
INSERT INTO `sys_job_log` VALUES (967, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 09:21:00');
INSERT INTO `sys_job_log` VALUES (968, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 09:22:00');
INSERT INTO `sys_job_log` VALUES (969, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：38毫秒', '0', '', '2025-09-29 09:26:00');
INSERT INTO `sys_job_log` VALUES (970, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 09:27:00');
INSERT INTO `sys_job_log` VALUES (971, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 09:28:00');
INSERT INTO `sys_job_log` VALUES (972, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-29 09:29:00');
INSERT INTO `sys_job_log` VALUES (973, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 09:30:00');
INSERT INTO `sys_job_log` VALUES (974, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 09:31:00');
INSERT INTO `sys_job_log` VALUES (975, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 09:32:00');
INSERT INTO `sys_job_log` VALUES (976, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 09:33:00');
INSERT INTO `sys_job_log` VALUES (977, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 09:34:00');
INSERT INTO `sys_job_log` VALUES (978, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-29 09:35:00');
INSERT INTO `sys_job_log` VALUES (979, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-29 09:36:00');
INSERT INTO `sys_job_log` VALUES (980, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 09:37:00');
INSERT INTO `sys_job_log` VALUES (981, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：46毫秒', '0', '', '2025-09-29 10:18:00');
INSERT INTO `sys_job_log` VALUES (982, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 10:19:00');
INSERT INTO `sys_job_log` VALUES (983, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：25毫秒', '0', '', '2025-09-29 10:20:00');
INSERT INTO `sys_job_log` VALUES (984, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 10:21:00');
INSERT INTO `sys_job_log` VALUES (985, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：24毫秒', '0', '', '2025-09-29 10:22:00');
INSERT INTO `sys_job_log` VALUES (986, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 10:23:00');
INSERT INTO `sys_job_log` VALUES (987, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 10:24:00');
INSERT INTO `sys_job_log` VALUES (988, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：34毫秒', '0', '', '2025-09-29 10:25:00');
INSERT INTO `sys_job_log` VALUES (989, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 10:26:00');
INSERT INTO `sys_job_log` VALUES (990, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 10:27:00');
INSERT INTO `sys_job_log` VALUES (991, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 10:28:00');
INSERT INTO `sys_job_log` VALUES (992, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 10:29:00');
INSERT INTO `sys_job_log` VALUES (993, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 10:30:00');
INSERT INTO `sys_job_log` VALUES (994, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 10:31:00');
INSERT INTO `sys_job_log` VALUES (995, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 10:32:00');
INSERT INTO `sys_job_log` VALUES (996, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 10:33:00');
INSERT INTO `sys_job_log` VALUES (997, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：23毫秒', '0', '', '2025-09-29 10:34:00');
INSERT INTO `sys_job_log` VALUES (998, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 10:35:00');
INSERT INTO `sys_job_log` VALUES (999, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：24毫秒', '0', '', '2025-09-29 10:36:00');
INSERT INTO `sys_job_log` VALUES (1000, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 10:37:00');
INSERT INTO `sys_job_log` VALUES (1001, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 10:38:00');
INSERT INTO `sys_job_log` VALUES (1002, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 10:39:00');
INSERT INTO `sys_job_log` VALUES (1003, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 10:40:00');
INSERT INTO `sys_job_log` VALUES (1004, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 10:41:00');
INSERT INTO `sys_job_log` VALUES (1005, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 10:42:00');
INSERT INTO `sys_job_log` VALUES (1006, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 10:43:00');
INSERT INTO `sys_job_log` VALUES (1007, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-29 10:44:00');
INSERT INTO `sys_job_log` VALUES (1008, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：22毫秒', '0', '', '2025-09-29 10:45:00');
INSERT INTO `sys_job_log` VALUES (1009, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-09-29 10:46:00');
INSERT INTO `sys_job_log` VALUES (1010, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-29 10:47:00');
INSERT INTO `sys_job_log` VALUES (1011, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：28毫秒', '0', '', '2025-09-29 10:48:00');
INSERT INTO `sys_job_log` VALUES (1012, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 10:49:00');
INSERT INTO `sys_job_log` VALUES (1013, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 10:50:00');
INSERT INTO `sys_job_log` VALUES (1014, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 10:51:00');
INSERT INTO `sys_job_log` VALUES (1015, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-29 10:52:00');
INSERT INTO `sys_job_log` VALUES (1016, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 10:53:00');
INSERT INTO `sys_job_log` VALUES (1017, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：43毫秒', '0', '', '2025-09-29 10:54:00');
INSERT INTO `sys_job_log` VALUES (1018, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：26毫秒', '0', '', '2025-09-29 10:55:00');
INSERT INTO `sys_job_log` VALUES (1019, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 10:56:00');
INSERT INTO `sys_job_log` VALUES (1020, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 10:57:00');
INSERT INTO `sys_job_log` VALUES (1021, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 10:58:00');
INSERT INTO `sys_job_log` VALUES (1022, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 10:59:00');
INSERT INTO `sys_job_log` VALUES (1023, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 11:00:00');
INSERT INTO `sys_job_log` VALUES (1024, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 11:01:00');
INSERT INTO `sys_job_log` VALUES (1025, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 11:02:00');
INSERT INTO `sys_job_log` VALUES (1026, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 11:03:00');
INSERT INTO `sys_job_log` VALUES (1027, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 11:04:00');
INSERT INTO `sys_job_log` VALUES (1028, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 11:05:00');
INSERT INTO `sys_job_log` VALUES (1029, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 11:06:00');
INSERT INTO `sys_job_log` VALUES (1030, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 11:07:00');
INSERT INTO `sys_job_log` VALUES (1031, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 11:08:00');
INSERT INTO `sys_job_log` VALUES (1032, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 11:09:00');
INSERT INTO `sys_job_log` VALUES (1033, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 11:10:00');
INSERT INTO `sys_job_log` VALUES (1034, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 11:11:00');
INSERT INTO `sys_job_log` VALUES (1035, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 11:12:00');
INSERT INTO `sys_job_log` VALUES (1036, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 11:13:00');
INSERT INTO `sys_job_log` VALUES (1037, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 11:14:00');
INSERT INTO `sys_job_log` VALUES (1038, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 11:15:00');
INSERT INTO `sys_job_log` VALUES (1039, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：23毫秒', '0', '', '2025-09-29 11:16:00');
INSERT INTO `sys_job_log` VALUES (1040, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 11:17:00');
INSERT INTO `sys_job_log` VALUES (1041, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 11:18:00');
INSERT INTO `sys_job_log` VALUES (1042, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-29 11:19:00');
INSERT INTO `sys_job_log` VALUES (1043, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 11:20:00');
INSERT INTO `sys_job_log` VALUES (1044, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-29 11:21:00');
INSERT INTO `sys_job_log` VALUES (1045, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-29 11:22:00');
INSERT INTO `sys_job_log` VALUES (1046, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 11:23:00');
INSERT INTO `sys_job_log` VALUES (1047, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 11:24:00');
INSERT INTO `sys_job_log` VALUES (1048, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-29 11:25:00');
INSERT INTO `sys_job_log` VALUES (1049, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-29 11:26:00');
INSERT INTO `sys_job_log` VALUES (1050, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 11:27:00');
INSERT INTO `sys_job_log` VALUES (1051, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 11:28:00');
INSERT INTO `sys_job_log` VALUES (1052, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 11:29:00');
INSERT INTO `sys_job_log` VALUES (1053, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 11:30:00');
INSERT INTO `sys_job_log` VALUES (1054, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-29 11:31:00');
INSERT INTO `sys_job_log` VALUES (1055, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 11:32:00');
INSERT INTO `sys_job_log` VALUES (1056, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 11:33:00');
INSERT INTO `sys_job_log` VALUES (1057, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 11:34:00');
INSERT INTO `sys_job_log` VALUES (1058, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 11:35:00');
INSERT INTO `sys_job_log` VALUES (1059, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 11:36:00');
INSERT INTO `sys_job_log` VALUES (1060, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-29 11:37:00');
INSERT INTO `sys_job_log` VALUES (1061, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 11:38:00');
INSERT INTO `sys_job_log` VALUES (1062, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：104毫秒', '0', '', '2025-09-29 11:39:00');
INSERT INTO `sys_job_log` VALUES (1063, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 11:40:00');
INSERT INTO `sys_job_log` VALUES (1064, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 11:41:00');
INSERT INTO `sys_job_log` VALUES (1065, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 11:42:00');
INSERT INTO `sys_job_log` VALUES (1066, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 11:43:00');
INSERT INTO `sys_job_log` VALUES (1067, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：24毫秒', '0', '', '2025-09-29 11:44:00');
INSERT INTO `sys_job_log` VALUES (1068, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 11:45:00');
INSERT INTO `sys_job_log` VALUES (1069, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 11:46:00');
INSERT INTO `sys_job_log` VALUES (1070, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-29 11:47:00');
INSERT INTO `sys_job_log` VALUES (1071, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 11:48:00');
INSERT INTO `sys_job_log` VALUES (1072, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 11:49:00');
INSERT INTO `sys_job_log` VALUES (1073, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-29 11:50:00');
INSERT INTO `sys_job_log` VALUES (1074, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-09-29 11:51:00');
INSERT INTO `sys_job_log` VALUES (1075, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 11:52:00');
INSERT INTO `sys_job_log` VALUES (1076, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 11:53:00');
INSERT INTO `sys_job_log` VALUES (1077, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 11:54:00');
INSERT INTO `sys_job_log` VALUES (1078, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 11:55:00');
INSERT INTO `sys_job_log` VALUES (1079, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-29 11:56:00');
INSERT INTO `sys_job_log` VALUES (1080, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 11:57:00');
INSERT INTO `sys_job_log` VALUES (1081, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 11:58:00');
INSERT INTO `sys_job_log` VALUES (1082, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 11:59:00');
INSERT INTO `sys_job_log` VALUES (1083, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 12:00:00');
INSERT INTO `sys_job_log` VALUES (1084, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：32毫秒', '0', '', '2025-09-29 12:01:00');
INSERT INTO `sys_job_log` VALUES (1085, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 12:02:00');
INSERT INTO `sys_job_log` VALUES (1086, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：38毫秒', '0', '', '2025-09-29 12:04:00');
INSERT INTO `sys_job_log` VALUES (1087, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：35毫秒', '0', '', '2025-09-29 12:05:00');
INSERT INTO `sys_job_log` VALUES (1088, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 12:06:00');
INSERT INTO `sys_job_log` VALUES (1089, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 12:07:00');
INSERT INTO `sys_job_log` VALUES (1090, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 12:08:00');
INSERT INTO `sys_job_log` VALUES (1091, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：25毫秒', '0', '', '2025-09-29 12:10:00');
INSERT INTO `sys_job_log` VALUES (1092, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 12:11:00');
INSERT INTO `sys_job_log` VALUES (1093, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 12:12:00');
INSERT INTO `sys_job_log` VALUES (1094, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 12:14:00');
INSERT INTO `sys_job_log` VALUES (1095, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：57毫秒', '0', '', '2025-09-29 12:15:01');
INSERT INTO `sys_job_log` VALUES (1096, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：31毫秒', '0', '', '2025-09-29 12:16:00');
INSERT INTO `sys_job_log` VALUES (1097, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 12:17:00');
INSERT INTO `sys_job_log` VALUES (1098, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 12:18:00');
INSERT INTO `sys_job_log` VALUES (1099, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：65毫秒', '0', '', '2025-09-29 12:19:00');
INSERT INTO `sys_job_log` VALUES (1100, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 12:20:00');
INSERT INTO `sys_job_log` VALUES (1101, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：35毫秒', '0', '', '2025-09-29 12:21:00');
INSERT INTO `sys_job_log` VALUES (1102, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：26毫秒', '0', '', '2025-09-29 12:22:00');
INSERT INTO `sys_job_log` VALUES (1103, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 12:23:00');
INSERT INTO `sys_job_log` VALUES (1104, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：30毫秒', '0', '', '2025-09-29 12:24:00');
INSERT INTO `sys_job_log` VALUES (1105, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 12:25:00');
INSERT INTO `sys_job_log` VALUES (1106, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 12:26:00');
INSERT INTO `sys_job_log` VALUES (1107, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 12:27:00');
INSERT INTO `sys_job_log` VALUES (1108, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 12:28:00');
INSERT INTO `sys_job_log` VALUES (1109, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：22毫秒', '0', '', '2025-09-29 12:29:00');
INSERT INTO `sys_job_log` VALUES (1110, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 12:30:00');
INSERT INTO `sys_job_log` VALUES (1111, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：34毫秒', '0', '', '2025-09-29 12:31:00');
INSERT INTO `sys_job_log` VALUES (1112, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 12:32:00');
INSERT INTO `sys_job_log` VALUES (1113, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 12:33:00');
INSERT INTO `sys_job_log` VALUES (1114, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 12:34:00');
INSERT INTO `sys_job_log` VALUES (1115, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 12:35:00');
INSERT INTO `sys_job_log` VALUES (1116, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 12:36:00');
INSERT INTO `sys_job_log` VALUES (1117, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 12:37:00');
INSERT INTO `sys_job_log` VALUES (1118, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 12:38:00');
INSERT INTO `sys_job_log` VALUES (1119, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 12:39:00');
INSERT INTO `sys_job_log` VALUES (1120, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 12:40:00');
INSERT INTO `sys_job_log` VALUES (1121, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 12:41:00');
INSERT INTO `sys_job_log` VALUES (1122, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 12:42:00');
INSERT INTO `sys_job_log` VALUES (1123, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 12:43:00');
INSERT INTO `sys_job_log` VALUES (1124, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：22毫秒', '0', '', '2025-09-29 12:45:00');
INSERT INTO `sys_job_log` VALUES (1125, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 12:46:00');
INSERT INTO `sys_job_log` VALUES (1126, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 12:47:00');
INSERT INTO `sys_job_log` VALUES (1127, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 12:48:00');
INSERT INTO `sys_job_log` VALUES (1128, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 12:49:00');
INSERT INTO `sys_job_log` VALUES (1129, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 12:50:00');
INSERT INTO `sys_job_log` VALUES (1130, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 12:51:00');
INSERT INTO `sys_job_log` VALUES (1131, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 12:52:00');
INSERT INTO `sys_job_log` VALUES (1132, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 12:53:00');
INSERT INTO `sys_job_log` VALUES (1133, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 12:54:00');
INSERT INTO `sys_job_log` VALUES (1134, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 12:55:00');
INSERT INTO `sys_job_log` VALUES (1135, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 12:56:00');
INSERT INTO `sys_job_log` VALUES (1136, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 12:57:00');
INSERT INTO `sys_job_log` VALUES (1137, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：24毫秒', '0', '', '2025-09-29 12:58:00');
INSERT INTO `sys_job_log` VALUES (1138, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 12:59:00');
INSERT INTO `sys_job_log` VALUES (1139, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 13:00:00');
INSERT INTO `sys_job_log` VALUES (1140, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 13:01:00');
INSERT INTO `sys_job_log` VALUES (1141, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 13:02:00');
INSERT INTO `sys_job_log` VALUES (1142, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-29 13:03:00');
INSERT INTO `sys_job_log` VALUES (1143, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：23毫秒', '0', '', '2025-09-29 13:04:00');
INSERT INTO `sys_job_log` VALUES (1144, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 13:05:00');
INSERT INTO `sys_job_log` VALUES (1145, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 13:06:00');
INSERT INTO `sys_job_log` VALUES (1146, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 13:07:00');
INSERT INTO `sys_job_log` VALUES (1147, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 13:08:00');
INSERT INTO `sys_job_log` VALUES (1148, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 13:09:00');
INSERT INTO `sys_job_log` VALUES (1149, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 13:10:00');
INSERT INTO `sys_job_log` VALUES (1150, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：25毫秒', '0', '', '2025-09-29 13:11:00');
INSERT INTO `sys_job_log` VALUES (1151, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 13:12:00');
INSERT INTO `sys_job_log` VALUES (1152, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 13:13:00');
INSERT INTO `sys_job_log` VALUES (1153, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-29 13:14:00');
INSERT INTO `sys_job_log` VALUES (1154, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 13:15:00');
INSERT INTO `sys_job_log` VALUES (1155, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：27毫秒', '0', '', '2025-09-29 13:16:00');
INSERT INTO `sys_job_log` VALUES (1156, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 13:17:00');
INSERT INTO `sys_job_log` VALUES (1157, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-29 13:18:00');
INSERT INTO `sys_job_log` VALUES (1158, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 13:19:00');
INSERT INTO `sys_job_log` VALUES (1159, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 13:20:00');
INSERT INTO `sys_job_log` VALUES (1160, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-29 13:21:00');
INSERT INTO `sys_job_log` VALUES (1161, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-29 13:22:00');
INSERT INTO `sys_job_log` VALUES (1162, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-29 13:23:00');
INSERT INTO `sys_job_log` VALUES (1163, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 13:24:00');
INSERT INTO `sys_job_log` VALUES (1164, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-09-29 13:25:00');
INSERT INTO `sys_job_log` VALUES (1165, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：25毫秒', '0', '', '2025-09-29 13:26:00');
INSERT INTO `sys_job_log` VALUES (1166, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：38毫秒', '0', '', '2025-09-29 13:27:00');
INSERT INTO `sys_job_log` VALUES (1167, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 13:28:00');
INSERT INTO `sys_job_log` VALUES (1168, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：29毫秒', '0', '', '2025-09-29 13:29:00');
INSERT INTO `sys_job_log` VALUES (1169, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-29 13:30:00');
INSERT INTO `sys_job_log` VALUES (1170, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 13:31:00');
INSERT INTO `sys_job_log` VALUES (1171, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：23毫秒', '0', '', '2025-09-29 13:32:00');
INSERT INTO `sys_job_log` VALUES (1172, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 13:33:00');
INSERT INTO `sys_job_log` VALUES (1173, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 13:34:00');
INSERT INTO `sys_job_log` VALUES (1174, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 13:35:00');
INSERT INTO `sys_job_log` VALUES (1175, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 13:36:00');
INSERT INTO `sys_job_log` VALUES (1176, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 13:37:00');
INSERT INTO `sys_job_log` VALUES (1177, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 13:38:00');
INSERT INTO `sys_job_log` VALUES (1178, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 13:39:00');
INSERT INTO `sys_job_log` VALUES (1179, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：26毫秒', '0', '', '2025-09-29 13:40:00');
INSERT INTO `sys_job_log` VALUES (1180, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 13:41:00');
INSERT INTO `sys_job_log` VALUES (1181, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 13:42:00');
INSERT INTO `sys_job_log` VALUES (1182, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 13:43:00');
INSERT INTO `sys_job_log` VALUES (1183, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 13:44:00');
INSERT INTO `sys_job_log` VALUES (1184, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 13:45:00');
INSERT INTO `sys_job_log` VALUES (1185, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 13:46:00');
INSERT INTO `sys_job_log` VALUES (1186, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 13:47:01');
INSERT INTO `sys_job_log` VALUES (1187, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-29 13:48:00');
INSERT INTO `sys_job_log` VALUES (1188, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 13:49:00');
INSERT INTO `sys_job_log` VALUES (1189, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-29 13:50:00');
INSERT INTO `sys_job_log` VALUES (1190, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 13:51:00');
INSERT INTO `sys_job_log` VALUES (1191, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：22毫秒', '0', '', '2025-09-29 13:52:00');
INSERT INTO `sys_job_log` VALUES (1192, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 13:53:00');
INSERT INTO `sys_job_log` VALUES (1193, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 13:54:00');
INSERT INTO `sys_job_log` VALUES (1194, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-29 13:55:00');
INSERT INTO `sys_job_log` VALUES (1195, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 13:56:00');
INSERT INTO `sys_job_log` VALUES (1196, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-09-29 13:58:00');
INSERT INTO `sys_job_log` VALUES (1197, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 13:59:00');
INSERT INTO `sys_job_log` VALUES (1198, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 14:00:00');
INSERT INTO `sys_job_log` VALUES (1199, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 14:01:00');
INSERT INTO `sys_job_log` VALUES (1200, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 14:02:00');
INSERT INTO `sys_job_log` VALUES (1201, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 14:03:00');
INSERT INTO `sys_job_log` VALUES (1202, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 14:04:00');
INSERT INTO `sys_job_log` VALUES (1203, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 14:05:00');
INSERT INTO `sys_job_log` VALUES (1204, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 14:06:00');
INSERT INTO `sys_job_log` VALUES (1205, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-29 14:07:00');
INSERT INTO `sys_job_log` VALUES (1206, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 14:08:00');
INSERT INTO `sys_job_log` VALUES (1207, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 14:09:00');
INSERT INTO `sys_job_log` VALUES (1208, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 14:10:00');
INSERT INTO `sys_job_log` VALUES (1209, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-29 14:11:00');
INSERT INTO `sys_job_log` VALUES (1210, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-29 14:12:00');
INSERT INTO `sys_job_log` VALUES (1211, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 14:13:00');
INSERT INTO `sys_job_log` VALUES (1212, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 14:14:00');
INSERT INTO `sys_job_log` VALUES (1213, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 14:15:00');
INSERT INTO `sys_job_log` VALUES (1214, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：83毫秒', '0', '', '2025-09-29 14:16:00');
INSERT INTO `sys_job_log` VALUES (1215, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-29 14:17:00');
INSERT INTO `sys_job_log` VALUES (1216, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 14:18:00');
INSERT INTO `sys_job_log` VALUES (1217, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 14:19:00');
INSERT INTO `sys_job_log` VALUES (1218, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 14:20:00');
INSERT INTO `sys_job_log` VALUES (1219, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 14:21:00');
INSERT INTO `sys_job_log` VALUES (1220, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：55毫秒', '0', '', '2025-09-29 14:22:00');
INSERT INTO `sys_job_log` VALUES (1221, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-29 14:23:00');
INSERT INTO `sys_job_log` VALUES (1222, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 14:24:00');
INSERT INTO `sys_job_log` VALUES (1223, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 14:25:00');
INSERT INTO `sys_job_log` VALUES (1224, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 14:26:00');
INSERT INTO `sys_job_log` VALUES (1225, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 14:27:00');
INSERT INTO `sys_job_log` VALUES (1226, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 14:28:00');
INSERT INTO `sys_job_log` VALUES (1227, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：32毫秒', '0', '', '2025-09-29 14:29:00');
INSERT INTO `sys_job_log` VALUES (1228, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 14:30:00');
INSERT INTO `sys_job_log` VALUES (1229, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：31毫秒', '0', '', '2025-09-29 14:31:00');
INSERT INTO `sys_job_log` VALUES (1230, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-09-29 14:32:00');
INSERT INTO `sys_job_log` VALUES (1231, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 14:33:00');
INSERT INTO `sys_job_log` VALUES (1232, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：24毫秒', '0', '', '2025-09-29 14:34:00');
INSERT INTO `sys_job_log` VALUES (1233, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：22毫秒', '0', '', '2025-09-29 14:35:00');
INSERT INTO `sys_job_log` VALUES (1234, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 14:36:00');
INSERT INTO `sys_job_log` VALUES (1235, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 14:37:00');
INSERT INTO `sys_job_log` VALUES (1236, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 14:38:00');
INSERT INTO `sys_job_log` VALUES (1237, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 14:39:00');
INSERT INTO `sys_job_log` VALUES (1238, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 14:40:00');
INSERT INTO `sys_job_log` VALUES (1239, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-29 14:41:00');
INSERT INTO `sys_job_log` VALUES (1240, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 14:42:00');
INSERT INTO `sys_job_log` VALUES (1241, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-29 14:43:00');
INSERT INTO `sys_job_log` VALUES (1242, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-29 14:44:00');
INSERT INTO `sys_job_log` VALUES (1243, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 14:45:00');
INSERT INTO `sys_job_log` VALUES (1244, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 14:46:00');
INSERT INTO `sys_job_log` VALUES (1245, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-29 14:47:00');
INSERT INTO `sys_job_log` VALUES (1246, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 14:48:00');
INSERT INTO `sys_job_log` VALUES (1247, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 14:49:00');
INSERT INTO `sys_job_log` VALUES (1248, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：30毫秒', '0', '', '2025-09-29 14:50:00');
INSERT INTO `sys_job_log` VALUES (1249, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 14:51:00');
INSERT INTO `sys_job_log` VALUES (1250, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 14:52:00');
INSERT INTO `sys_job_log` VALUES (1251, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 14:53:00');
INSERT INTO `sys_job_log` VALUES (1252, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-29 14:54:00');
INSERT INTO `sys_job_log` VALUES (1253, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 14:55:00');
INSERT INTO `sys_job_log` VALUES (1254, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 14:56:00');
INSERT INTO `sys_job_log` VALUES (1255, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 14:57:00');
INSERT INTO `sys_job_log` VALUES (1256, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-29 14:59:00');
INSERT INTO `sys_job_log` VALUES (1257, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-29 15:00:00');
INSERT INTO `sys_job_log` VALUES (1258, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 15:01:00');
INSERT INTO `sys_job_log` VALUES (1259, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 15:02:00');
INSERT INTO `sys_job_log` VALUES (1260, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 15:03:00');
INSERT INTO `sys_job_log` VALUES (1261, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-29 15:04:00');
INSERT INTO `sys_job_log` VALUES (1262, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-29 15:05:00');
INSERT INTO `sys_job_log` VALUES (1263, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 15:06:00');
INSERT INTO `sys_job_log` VALUES (1264, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 15:07:00');
INSERT INTO `sys_job_log` VALUES (1265, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-29 15:08:00');
INSERT INTO `sys_job_log` VALUES (1266, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 15:09:00');
INSERT INTO `sys_job_log` VALUES (1267, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-29 15:10:00');
INSERT INTO `sys_job_log` VALUES (1268, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-29 15:11:00');
INSERT INTO `sys_job_log` VALUES (1269, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:12:00');
INSERT INTO `sys_job_log` VALUES (1270, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-29 15:13:00');
INSERT INTO `sys_job_log` VALUES (1271, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:14:00');
INSERT INTO `sys_job_log` VALUES (1272, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-29 15:15:00');
INSERT INTO `sys_job_log` VALUES (1273, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:16:00');
INSERT INTO `sys_job_log` VALUES (1274, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:17:00');
INSERT INTO `sys_job_log` VALUES (1275, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:18:00');
INSERT INTO `sys_job_log` VALUES (1276, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:19:00');
INSERT INTO `sys_job_log` VALUES (1277, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:20:00');
INSERT INTO `sys_job_log` VALUES (1278, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:21:00');
INSERT INTO `sys_job_log` VALUES (1279, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:22:00');
INSERT INTO `sys_job_log` VALUES (1280, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:23:00');
INSERT INTO `sys_job_log` VALUES (1281, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:24:00');
INSERT INTO `sys_job_log` VALUES (1282, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:25:00');
INSERT INTO `sys_job_log` VALUES (1283, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 15:26:00');
INSERT INTO `sys_job_log` VALUES (1284, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-29 15:27:00');
INSERT INTO `sys_job_log` VALUES (1285, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:28:00');
INSERT INTO `sys_job_log` VALUES (1286, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-29 15:29:00');
INSERT INTO `sys_job_log` VALUES (1287, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:30:00');
INSERT INTO `sys_job_log` VALUES (1288, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 15:31:00');
INSERT INTO `sys_job_log` VALUES (1289, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:32:00');
INSERT INTO `sys_job_log` VALUES (1290, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-29 15:33:00');
INSERT INTO `sys_job_log` VALUES (1291, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:34:00');
INSERT INTO `sys_job_log` VALUES (1292, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-29 15:35:00');
INSERT INTO `sys_job_log` VALUES (1293, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:36:00');
INSERT INTO `sys_job_log` VALUES (1294, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:37:00');
INSERT INTO `sys_job_log` VALUES (1295, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-29 15:38:00');
INSERT INTO `sys_job_log` VALUES (1296, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 15:39:00');
INSERT INTO `sys_job_log` VALUES (1297, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:40:00');
INSERT INTO `sys_job_log` VALUES (1298, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:41:00');
INSERT INTO `sys_job_log` VALUES (1299, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:42:00');
INSERT INTO `sys_job_log` VALUES (1300, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:43:00');
INSERT INTO `sys_job_log` VALUES (1301, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 15:44:00');
INSERT INTO `sys_job_log` VALUES (1302, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:45:00');
INSERT INTO `sys_job_log` VALUES (1303, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:46:00');
INSERT INTO `sys_job_log` VALUES (1304, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-29 15:47:00');
INSERT INTO `sys_job_log` VALUES (1305, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:48:00');
INSERT INTO `sys_job_log` VALUES (1306, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:49:00');
INSERT INTO `sys_job_log` VALUES (1307, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 15:50:00');
INSERT INTO `sys_job_log` VALUES (1308, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 15:51:00');
INSERT INTO `sys_job_log` VALUES (1309, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:52:00');
INSERT INTO `sys_job_log` VALUES (1310, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:53:00');
INSERT INTO `sys_job_log` VALUES (1311, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:54:00');
INSERT INTO `sys_job_log` VALUES (1312, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 15:55:00');
INSERT INTO `sys_job_log` VALUES (1313, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-29 15:56:00');
INSERT INTO `sys_job_log` VALUES (1314, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:57:00');
INSERT INTO `sys_job_log` VALUES (1315, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:58:00');
INSERT INTO `sys_job_log` VALUES (1316, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 15:59:00');
INSERT INTO `sys_job_log` VALUES (1317, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:00:00');
INSERT INTO `sys_job_log` VALUES (1318, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:01:00');
INSERT INTO `sys_job_log` VALUES (1319, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:02:00');
INSERT INTO `sys_job_log` VALUES (1320, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:03:00');
INSERT INTO `sys_job_log` VALUES (1321, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:04:00');
INSERT INTO `sys_job_log` VALUES (1322, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-29 16:05:00');
INSERT INTO `sys_job_log` VALUES (1323, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:06:00');
INSERT INTO `sys_job_log` VALUES (1324, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:07:00');
INSERT INTO `sys_job_log` VALUES (1325, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-29 16:08:00');
INSERT INTO `sys_job_log` VALUES (1326, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 16:09:00');
INSERT INTO `sys_job_log` VALUES (1327, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:10:00');
INSERT INTO `sys_job_log` VALUES (1328, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:11:00');
INSERT INTO `sys_job_log` VALUES (1329, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:12:00');
INSERT INTO `sys_job_log` VALUES (1330, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:13:00');
INSERT INTO `sys_job_log` VALUES (1331, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:14:00');
INSERT INTO `sys_job_log` VALUES (1332, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 16:15:00');
INSERT INTO `sys_job_log` VALUES (1333, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:16:00');
INSERT INTO `sys_job_log` VALUES (1334, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 16:17:00');
INSERT INTO `sys_job_log` VALUES (1335, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 16:18:00');
INSERT INTO `sys_job_log` VALUES (1336, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:19:00');
INSERT INTO `sys_job_log` VALUES (1337, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:20:00');
INSERT INTO `sys_job_log` VALUES (1338, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 16:21:00');
INSERT INTO `sys_job_log` VALUES (1339, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:22:00');
INSERT INTO `sys_job_log` VALUES (1340, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-29 16:23:00');
INSERT INTO `sys_job_log` VALUES (1341, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:24:00');
INSERT INTO `sys_job_log` VALUES (1342, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:25:00');
INSERT INTO `sys_job_log` VALUES (1343, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:26:00');
INSERT INTO `sys_job_log` VALUES (1344, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:27:00');
INSERT INTO `sys_job_log` VALUES (1345, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:28:00');
INSERT INTO `sys_job_log` VALUES (1346, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:29:00');
INSERT INTO `sys_job_log` VALUES (1347, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:30:00');
INSERT INTO `sys_job_log` VALUES (1348, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 16:31:00');
INSERT INTO `sys_job_log` VALUES (1349, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:32:00');
INSERT INTO `sys_job_log` VALUES (1350, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:33:00');
INSERT INTO `sys_job_log` VALUES (1351, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:34:00');
INSERT INTO `sys_job_log` VALUES (1352, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:35:00');
INSERT INTO `sys_job_log` VALUES (1353, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:36:00');
INSERT INTO `sys_job_log` VALUES (1354, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:37:00');
INSERT INTO `sys_job_log` VALUES (1355, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:38:00');
INSERT INTO `sys_job_log` VALUES (1356, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:39:00');
INSERT INTO `sys_job_log` VALUES (1357, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:40:00');
INSERT INTO `sys_job_log` VALUES (1358, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:41:00');
INSERT INTO `sys_job_log` VALUES (1359, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:42:00');
INSERT INTO `sys_job_log` VALUES (1360, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:43:00');
INSERT INTO `sys_job_log` VALUES (1361, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:44:00');
INSERT INTO `sys_job_log` VALUES (1362, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:45:00');
INSERT INTO `sys_job_log` VALUES (1363, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:46:00');
INSERT INTO `sys_job_log` VALUES (1364, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-29 16:47:00');
INSERT INTO `sys_job_log` VALUES (1365, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:48:00');
INSERT INTO `sys_job_log` VALUES (1366, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:49:00');
INSERT INTO `sys_job_log` VALUES (1367, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:50:00');
INSERT INTO `sys_job_log` VALUES (1368, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:51:00');
INSERT INTO `sys_job_log` VALUES (1369, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 16:52:00');
INSERT INTO `sys_job_log` VALUES (1370, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:53:00');
INSERT INTO `sys_job_log` VALUES (1371, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:54:00');
INSERT INTO `sys_job_log` VALUES (1372, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:55:00');
INSERT INTO `sys_job_log` VALUES (1373, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:56:00');
INSERT INTO `sys_job_log` VALUES (1374, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:57:00');
INSERT INTO `sys_job_log` VALUES (1375, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:58:00');
INSERT INTO `sys_job_log` VALUES (1376, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 16:59:00');
INSERT INTO `sys_job_log` VALUES (1377, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:00:00');
INSERT INTO `sys_job_log` VALUES (1378, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:01:00');
INSERT INTO `sys_job_log` VALUES (1379, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-29 17:02:00');
INSERT INTO `sys_job_log` VALUES (1380, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:03:00');
INSERT INTO `sys_job_log` VALUES (1381, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 17:04:00');
INSERT INTO `sys_job_log` VALUES (1382, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:05:00');
INSERT INTO `sys_job_log` VALUES (1383, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:06:00');
INSERT INTO `sys_job_log` VALUES (1384, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:07:00');
INSERT INTO `sys_job_log` VALUES (1385, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 17:08:00');
INSERT INTO `sys_job_log` VALUES (1386, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-29 17:09:00');
INSERT INTO `sys_job_log` VALUES (1387, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:10:00');
INSERT INTO `sys_job_log` VALUES (1388, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-29 17:12:00');
INSERT INTO `sys_job_log` VALUES (1389, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 17:13:00');
INSERT INTO `sys_job_log` VALUES (1390, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:14:00');
INSERT INTO `sys_job_log` VALUES (1391, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:15:00');
INSERT INTO `sys_job_log` VALUES (1392, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 17:16:00');
INSERT INTO `sys_job_log` VALUES (1393, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 17:17:00');
INSERT INTO `sys_job_log` VALUES (1394, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:18:00');
INSERT INTO `sys_job_log` VALUES (1395, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:19:00');
INSERT INTO `sys_job_log` VALUES (1396, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-29 17:21:00');
INSERT INTO `sys_job_log` VALUES (1397, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 17:22:00');
INSERT INTO `sys_job_log` VALUES (1398, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:23:00');
INSERT INTO `sys_job_log` VALUES (1399, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 17:24:00');
INSERT INTO `sys_job_log` VALUES (1400, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:25:00');
INSERT INTO `sys_job_log` VALUES (1401, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:26:00');
INSERT INTO `sys_job_log` VALUES (1402, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 17:27:00');
INSERT INTO `sys_job_log` VALUES (1403, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 17:28:00');
INSERT INTO `sys_job_log` VALUES (1404, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:29:00');
INSERT INTO `sys_job_log` VALUES (1405, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:30:00');
INSERT INTO `sys_job_log` VALUES (1406, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 17:31:00');
INSERT INTO `sys_job_log` VALUES (1407, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 17:32:00');
INSERT INTO `sys_job_log` VALUES (1408, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:33:00');
INSERT INTO `sys_job_log` VALUES (1409, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:34:00');
INSERT INTO `sys_job_log` VALUES (1410, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:35:00');
INSERT INTO `sys_job_log` VALUES (1411, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-29 17:36:00');
INSERT INTO `sys_job_log` VALUES (1412, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:37:00');
INSERT INTO `sys_job_log` VALUES (1413, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:38:00');
INSERT INTO `sys_job_log` VALUES (1414, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:39:00');
INSERT INTO `sys_job_log` VALUES (1415, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 17:40:00');
INSERT INTO `sys_job_log` VALUES (1416, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 17:41:00');
INSERT INTO `sys_job_log` VALUES (1417, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-29 17:42:00');
INSERT INTO `sys_job_log` VALUES (1418, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-29 17:43:00');
INSERT INTO `sys_job_log` VALUES (1419, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 17:45:00');
INSERT INTO `sys_job_log` VALUES (1420, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:46:00');
INSERT INTO `sys_job_log` VALUES (1421, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:47:00');
INSERT INTO `sys_job_log` VALUES (1422, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:48:00');
INSERT INTO `sys_job_log` VALUES (1423, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:49:00');
INSERT INTO `sys_job_log` VALUES (1424, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:50:00');
INSERT INTO `sys_job_log` VALUES (1425, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:51:00');
INSERT INTO `sys_job_log` VALUES (1426, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:52:00');
INSERT INTO `sys_job_log` VALUES (1427, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:53:00');
INSERT INTO `sys_job_log` VALUES (1428, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:54:00');
INSERT INTO `sys_job_log` VALUES (1429, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-29 17:55:00');
INSERT INTO `sys_job_log` VALUES (1430, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-29 17:56:00');
INSERT INTO `sys_job_log` VALUES (1431, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-29 18:03:00');
INSERT INTO `sys_job_log` VALUES (1432, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-30 09:04:00');
INSERT INTO `sys_job_log` VALUES (1433, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:05:00');
INSERT INTO `sys_job_log` VALUES (1434, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:06:00');
INSERT INTO `sys_job_log` VALUES (1435, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-30 09:07:00');
INSERT INTO `sys_job_log` VALUES (1436, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:08:00');
INSERT INTO `sys_job_log` VALUES (1437, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:09:00');
INSERT INTO `sys_job_log` VALUES (1438, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:10:00');
INSERT INTO `sys_job_log` VALUES (1439, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-30 09:12:00');
INSERT INTO `sys_job_log` VALUES (1440, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:13:00');
INSERT INTO `sys_job_log` VALUES (1441, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:14:00');
INSERT INTO `sys_job_log` VALUES (1442, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-30 09:15:00');
INSERT INTO `sys_job_log` VALUES (1443, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-30 09:16:00');
INSERT INTO `sys_job_log` VALUES (1444, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:17:00');
INSERT INTO `sys_job_log` VALUES (1445, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:18:00');
INSERT INTO `sys_job_log` VALUES (1446, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:19:00');
INSERT INTO `sys_job_log` VALUES (1447, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:20:00');
INSERT INTO `sys_job_log` VALUES (1448, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:21:00');
INSERT INTO `sys_job_log` VALUES (1449, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:22:00');
INSERT INTO `sys_job_log` VALUES (1450, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:23:00');
INSERT INTO `sys_job_log` VALUES (1451, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:24:00');
INSERT INTO `sys_job_log` VALUES (1452, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-30 09:25:00');
INSERT INTO `sys_job_log` VALUES (1453, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:26:00');
INSERT INTO `sys_job_log` VALUES (1454, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 09:27:03');
INSERT INTO `sys_job_log` VALUES (1455, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-09-30 09:29:00');
INSERT INTO `sys_job_log` VALUES (1456, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:30:00');
INSERT INTO `sys_job_log` VALUES (1457, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:31:00');
INSERT INTO `sys_job_log` VALUES (1458, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:32:00');
INSERT INTO `sys_job_log` VALUES (1459, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:33:00');
INSERT INTO `sys_job_log` VALUES (1460, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:34:00');
INSERT INTO `sys_job_log` VALUES (1461, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-30 09:35:00');
INSERT INTO `sys_job_log` VALUES (1462, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:36:00');
INSERT INTO `sys_job_log` VALUES (1463, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:37:00');
INSERT INTO `sys_job_log` VALUES (1464, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:38:00');
INSERT INTO `sys_job_log` VALUES (1465, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:39:00');
INSERT INTO `sys_job_log` VALUES (1466, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:40:00');
INSERT INTO `sys_job_log` VALUES (1467, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:41:00');
INSERT INTO `sys_job_log` VALUES (1468, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:42:00');
INSERT INTO `sys_job_log` VALUES (1469, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:43:00');
INSERT INTO `sys_job_log` VALUES (1470, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:44:00');
INSERT INTO `sys_job_log` VALUES (1471, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:45:00');
INSERT INTO `sys_job_log` VALUES (1472, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:46:00');
INSERT INTO `sys_job_log` VALUES (1473, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:47:00');
INSERT INTO `sys_job_log` VALUES (1474, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:48:00');
INSERT INTO `sys_job_log` VALUES (1475, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:49:00');
INSERT INTO `sys_job_log` VALUES (1476, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:50:00');
INSERT INTO `sys_job_log` VALUES (1477, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:51:00');
INSERT INTO `sys_job_log` VALUES (1478, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:52:00');
INSERT INTO `sys_job_log` VALUES (1479, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:53:00');
INSERT INTO `sys_job_log` VALUES (1480, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:54:00');
INSERT INTO `sys_job_log` VALUES (1481, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:55:00');
INSERT INTO `sys_job_log` VALUES (1482, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:56:00');
INSERT INTO `sys_job_log` VALUES (1483, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 09:57:00');
INSERT INTO `sys_job_log` VALUES (1484, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 09:58:00');
INSERT INTO `sys_job_log` VALUES (1485, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-30 09:59:00');
INSERT INTO `sys_job_log` VALUES (1486, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 10:00:00');
INSERT INTO `sys_job_log` VALUES (1487, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 10:01:00');
INSERT INTO `sys_job_log` VALUES (1488, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 10:02:00');
INSERT INTO `sys_job_log` VALUES (1489, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 10:03:00');
INSERT INTO `sys_job_log` VALUES (1490, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 10:04:00');
INSERT INTO `sys_job_log` VALUES (1491, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：0毫秒', '0', '', '2025-09-30 10:05:00');
INSERT INTO `sys_job_log` VALUES (1492, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 10:06:00');
INSERT INTO `sys_job_log` VALUES (1493, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 10:07:00');
INSERT INTO `sys_job_log` VALUES (1494, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：3毫秒', '0', '', '2025-09-30 10:08:00');
INSERT INTO `sys_job_log` VALUES (1495, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 10:09:00');
INSERT INTO `sys_job_log` VALUES (1496, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 10:10:00');
INSERT INTO `sys_job_log` VALUES (1497, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-30 10:11:00');
INSERT INTO `sys_job_log` VALUES (1498, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 10:12:00');
INSERT INTO `sys_job_log` VALUES (1499, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-09-30 10:13:00');
INSERT INTO `sys_job_log` VALUES (1500, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 10:14:00');
INSERT INTO `sys_job_log` VALUES (1501, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-09-30 10:15:00');
INSERT INTO `sys_job_log` VALUES (1502, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-09-30 10:16:00');
INSERT INTO `sys_job_log` VALUES (1503, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-30 10:17:00');
INSERT INTO `sys_job_log` VALUES (1504, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 10:18:00');
INSERT INTO `sys_job_log` VALUES (1505, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-30 10:19:00');
INSERT INTO `sys_job_log` VALUES (1506, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-30 10:20:00');
INSERT INTO `sys_job_log` VALUES (1507, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-30 10:21:00');
INSERT INTO `sys_job_log` VALUES (1508, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-30 10:22:00');
INSERT INTO `sys_job_log` VALUES (1509, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 10:23:00');
INSERT INTO `sys_job_log` VALUES (1510, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 10:24:00');
INSERT INTO `sys_job_log` VALUES (1511, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-30 10:25:00');
INSERT INTO `sys_job_log` VALUES (1512, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-30 10:26:00');
INSERT INTO `sys_job_log` VALUES (1513, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 10:27:00');
INSERT INTO `sys_job_log` VALUES (1514, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-30 10:28:00');
INSERT INTO `sys_job_log` VALUES (1515, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-30 10:29:00');
INSERT INTO `sys_job_log` VALUES (1516, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-30 10:30:00');
INSERT INTO `sys_job_log` VALUES (1517, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-30 10:31:00');
INSERT INTO `sys_job_log` VALUES (1518, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-30 10:32:00');
INSERT INTO `sys_job_log` VALUES (1519, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 10:33:00');
INSERT INTO `sys_job_log` VALUES (1520, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-30 10:34:00');
INSERT INTO `sys_job_log` VALUES (1521, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-30 10:35:00');
INSERT INTO `sys_job_log` VALUES (1522, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-30 10:36:00');
INSERT INTO `sys_job_log` VALUES (1523, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-30 10:37:00');
INSERT INTO `sys_job_log` VALUES (1524, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 10:38:00');
INSERT INTO `sys_job_log` VALUES (1525, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-30 10:39:00');
INSERT INTO `sys_job_log` VALUES (1526, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-30 10:40:00');
INSERT INTO `sys_job_log` VALUES (1527, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 10:41:00');
INSERT INTO `sys_job_log` VALUES (1528, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-30 10:42:00');
INSERT INTO `sys_job_log` VALUES (1529, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-30 10:43:00');
INSERT INTO `sys_job_log` VALUES (1530, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-30 10:44:00');
INSERT INTO `sys_job_log` VALUES (1531, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-30 10:45:00');
INSERT INTO `sys_job_log` VALUES (1532, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-30 10:46:00');
INSERT INTO `sys_job_log` VALUES (1533, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-30 10:47:00');
INSERT INTO `sys_job_log` VALUES (1534, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-30 10:48:00');
INSERT INTO `sys_job_log` VALUES (1535, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-30 10:49:00');
INSERT INTO `sys_job_log` VALUES (1536, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：23毫秒', '0', '', '2025-09-30 10:51:00');
INSERT INTO `sys_job_log` VALUES (1537, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-30 10:52:00');
INSERT INTO `sys_job_log` VALUES (1538, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：25毫秒', '0', '', '2025-09-30 10:53:00');
INSERT INTO `sys_job_log` VALUES (1539, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-30 10:54:00');
INSERT INTO `sys_job_log` VALUES (1540, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-30 10:55:00');
INSERT INTO `sys_job_log` VALUES (1541, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-30 10:56:00');
INSERT INTO `sys_job_log` VALUES (1542, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-30 10:57:00');
INSERT INTO `sys_job_log` VALUES (1543, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-30 10:58:00');
INSERT INTO `sys_job_log` VALUES (1544, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-30 10:59:00');
INSERT INTO `sys_job_log` VALUES (1545, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-30 11:00:00');
INSERT INTO `sys_job_log` VALUES (1546, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-30 11:01:00');
INSERT INTO `sys_job_log` VALUES (1547, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 11:02:00');
INSERT INTO `sys_job_log` VALUES (1548, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-30 11:03:00');
INSERT INTO `sys_job_log` VALUES (1549, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：29毫秒', '0', '', '2025-09-30 11:04:00');
INSERT INTO `sys_job_log` VALUES (1550, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 11:05:00');
INSERT INTO `sys_job_log` VALUES (1551, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-30 11:06:00');
INSERT INTO `sys_job_log` VALUES (1552, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-30 11:07:00');
INSERT INTO `sys_job_log` VALUES (1553, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 11:08:00');
INSERT INTO `sys_job_log` VALUES (1554, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-09-30 11:09:00');
INSERT INTO `sys_job_log` VALUES (1555, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-30 11:10:00');
INSERT INTO `sys_job_log` VALUES (1556, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 11:11:00');
INSERT INTO `sys_job_log` VALUES (1557, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 11:12:00');
INSERT INTO `sys_job_log` VALUES (1558, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-30 11:13:00');
INSERT INTO `sys_job_log` VALUES (1559, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-30 11:14:00');
INSERT INTO `sys_job_log` VALUES (1560, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-30 11:15:00');
INSERT INTO `sys_job_log` VALUES (1561, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-30 11:16:00');
INSERT INTO `sys_job_log` VALUES (1562, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-30 11:17:00');
INSERT INTO `sys_job_log` VALUES (1563, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-30 11:18:00');
INSERT INTO `sys_job_log` VALUES (1564, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-09-30 11:19:00');
INSERT INTO `sys_job_log` VALUES (1565, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 11:20:00');
INSERT INTO `sys_job_log` VALUES (1566, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-30 11:21:00');
INSERT INTO `sys_job_log` VALUES (1567, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-09-30 11:22:00');
INSERT INTO `sys_job_log` VALUES (1568, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：53毫秒', '0', '', '2025-09-30 11:30:00');
INSERT INTO `sys_job_log` VALUES (1569, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-30 11:31:00');
INSERT INTO `sys_job_log` VALUES (1570, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-30 11:32:00');
INSERT INTO `sys_job_log` VALUES (1571, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：26毫秒', '0', '', '2025-09-30 11:33:00');
INSERT INTO `sys_job_log` VALUES (1572, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 11:34:00');
INSERT INTO `sys_job_log` VALUES (1573, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：34毫秒', '0', '', '2025-09-30 11:35:00');
INSERT INTO `sys_job_log` VALUES (1574, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-30 11:36:00');
INSERT INTO `sys_job_log` VALUES (1575, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-30 11:37:00');
INSERT INTO `sys_job_log` VALUES (1576, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-30 11:38:00');
INSERT INTO `sys_job_log` VALUES (1577, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-30 11:39:00');
INSERT INTO `sys_job_log` VALUES (1578, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-30 11:40:00');
INSERT INTO `sys_job_log` VALUES (1579, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-30 11:41:00');
INSERT INTO `sys_job_log` VALUES (1580, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-09-30 11:42:00');
INSERT INTO `sys_job_log` VALUES (1581, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-30 11:43:00');
INSERT INTO `sys_job_log` VALUES (1582, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-30 11:44:00');
INSERT INTO `sys_job_log` VALUES (1583, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-30 11:45:00');
INSERT INTO `sys_job_log` VALUES (1584, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-30 11:46:00');
INSERT INTO `sys_job_log` VALUES (1585, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 11:47:00');
INSERT INTO `sys_job_log` VALUES (1586, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-30 11:48:00');
INSERT INTO `sys_job_log` VALUES (1587, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-09-30 11:49:00');
INSERT INTO `sys_job_log` VALUES (1588, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-30 11:50:00');
INSERT INTO `sys_job_log` VALUES (1589, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-09-30 11:51:00');
INSERT INTO `sys_job_log` VALUES (1590, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-09-30 11:52:00');
INSERT INTO `sys_job_log` VALUES (1591, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-30 11:53:00');
INSERT INTO `sys_job_log` VALUES (1592, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：33毫秒', '0', '', '2025-09-30 11:54:00');
INSERT INTO `sys_job_log` VALUES (1593, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-30 11:55:00');
INSERT INTO `sys_job_log` VALUES (1594, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-09-30 11:56:00');
INSERT INTO `sys_job_log` VALUES (1595, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-30 11:57:00');
INSERT INTO `sys_job_log` VALUES (1596, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-09-30 11:58:00');
INSERT INTO `sys_job_log` VALUES (1597, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：22毫秒', '0', '', '2025-09-30 12:04:00');
INSERT INTO `sys_job_log` VALUES (1598, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-30 12:05:00');
INSERT INTO `sys_job_log` VALUES (1599, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-30 12:06:00');
INSERT INTO `sys_job_log` VALUES (1600, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-30 12:07:00');
INSERT INTO `sys_job_log` VALUES (1601, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-09-30 12:08:00');
INSERT INTO `sys_job_log` VALUES (1602, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-09-30 12:09:00');
INSERT INTO `sys_job_log` VALUES (1603, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-30 12:10:00');
INSERT INTO `sys_job_log` VALUES (1604, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-09-30 12:11:00');
INSERT INTO `sys_job_log` VALUES (1605, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-09-30 12:12:00');
INSERT INTO `sys_job_log` VALUES (1606, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-30 12:13:00');
INSERT INTO `sys_job_log` VALUES (1607, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-09-30 12:14:00');
INSERT INTO `sys_job_log` VALUES (1608, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：27毫秒', '0', '', '2025-09-30 12:15:00');
INSERT INTO `sys_job_log` VALUES (1609, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-09-30 12:16:00');
INSERT INTO `sys_job_log` VALUES (1610, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-09-30 12:17:00');
INSERT INTO `sys_job_log` VALUES (1611, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-09 10:36:00');
INSERT INTO `sys_job_log` VALUES (1612, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-10-09 10:37:00');
INSERT INTO `sys_job_log` VALUES (1613, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-10-09 10:38:00');
INSERT INTO `sys_job_log` VALUES (1614, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：2毫秒', '0', '', '2025-10-09 10:39:00');
INSERT INTO `sys_job_log` VALUES (1615, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-10-09 10:40:00');
INSERT INTO `sys_job_log` VALUES (1616, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：1毫秒', '0', '', '2025-10-09 10:41:00');
INSERT INTO `sys_job_log` VALUES (1617, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 10:42:00');
INSERT INTO `sys_job_log` VALUES (1618, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 10:43:00');
INSERT INTO `sys_job_log` VALUES (1619, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 10:44:00');
INSERT INTO `sys_job_log` VALUES (1620, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 10:45:00');
INSERT INTO `sys_job_log` VALUES (1621, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 10:46:00');
INSERT INTO `sys_job_log` VALUES (1622, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-10-09 10:47:00');
INSERT INTO `sys_job_log` VALUES (1623, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 10:48:00');
INSERT INTO `sys_job_log` VALUES (1624, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-10-09 10:49:00');
INSERT INTO `sys_job_log` VALUES (1625, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 10:50:00');
INSERT INTO `sys_job_log` VALUES (1626, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-10-09 10:51:00');
INSERT INTO `sys_job_log` VALUES (1627, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 10:52:00');
INSERT INTO `sys_job_log` VALUES (1628, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-10-09 10:53:00');
INSERT INTO `sys_job_log` VALUES (1629, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：24毫秒', '0', '', '2025-10-09 10:54:00');
INSERT INTO `sys_job_log` VALUES (1630, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-10-09 10:55:00');
INSERT INTO `sys_job_log` VALUES (1631, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 10:56:00');
INSERT INTO `sys_job_log` VALUES (1632, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-10-09 10:58:00');
INSERT INTO `sys_job_log` VALUES (1633, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 10:59:00');
INSERT INTO `sys_job_log` VALUES (1634, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：29毫秒', '0', '', '2025-10-09 11:00:00');
INSERT INTO `sys_job_log` VALUES (1635, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-10-09 11:01:00');
INSERT INTO `sys_job_log` VALUES (1636, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-10-09 11:02:00');
INSERT INTO `sys_job_log` VALUES (1637, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-10-09 11:03:00');
INSERT INTO `sys_job_log` VALUES (1638, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 11:04:00');
INSERT INTO `sys_job_log` VALUES (1639, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-09 11:05:00');
INSERT INTO `sys_job_log` VALUES (1640, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-09 11:07:00');
INSERT INTO `sys_job_log` VALUES (1641, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-10-09 11:08:00');
INSERT INTO `sys_job_log` VALUES (1642, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：4毫秒', '0', '', '2025-10-09 11:09:00');
INSERT INTO `sys_job_log` VALUES (1643, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-10-09 11:11:00');
INSERT INTO `sys_job_log` VALUES (1644, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 11:12:00');
INSERT INTO `sys_job_log` VALUES (1645, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-10-09 11:13:00');
INSERT INTO `sys_job_log` VALUES (1646, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-10-09 11:14:00');
INSERT INTO `sys_job_log` VALUES (1647, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 11:15:00');
INSERT INTO `sys_job_log` VALUES (1648, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 11:18:00');
INSERT INTO `sys_job_log` VALUES (1649, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-10-09 11:19:00');
INSERT INTO `sys_job_log` VALUES (1650, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：39毫秒', '0', '', '2025-10-09 11:20:00');
INSERT INTO `sys_job_log` VALUES (1651, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 11:21:00');
INSERT INTO `sys_job_log` VALUES (1652, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 11:22:00');
INSERT INTO `sys_job_log` VALUES (1653, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：24毫秒', '0', '', '2025-10-09 11:23:00');
INSERT INTO `sys_job_log` VALUES (1654, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-10-09 11:24:00');
INSERT INTO `sys_job_log` VALUES (1655, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 11:25:00');
INSERT INTO `sys_job_log` VALUES (1656, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 11:26:00');
INSERT INTO `sys_job_log` VALUES (1657, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-10-09 11:28:00');
INSERT INTO `sys_job_log` VALUES (1658, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-09 11:29:00');
INSERT INTO `sys_job_log` VALUES (1659, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 11:30:00');
INSERT INTO `sys_job_log` VALUES (1660, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 11:31:00');
INSERT INTO `sys_job_log` VALUES (1661, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：26毫秒', '0', '', '2025-10-09 11:32:00');
INSERT INTO `sys_job_log` VALUES (1662, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-10-09 11:33:00');
INSERT INTO `sys_job_log` VALUES (1663, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：29毫秒', '0', '', '2025-10-09 11:34:00');
INSERT INTO `sys_job_log` VALUES (1664, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 11:35:00');
INSERT INTO `sys_job_log` VALUES (1665, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-09 11:36:00');
INSERT INTO `sys_job_log` VALUES (1666, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 11:37:00');
INSERT INTO `sys_job_log` VALUES (1667, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-09 11:38:00');
INSERT INTO `sys_job_log` VALUES (1668, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-10-09 11:40:00');
INSERT INTO `sys_job_log` VALUES (1669, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 11:41:00');
INSERT INTO `sys_job_log` VALUES (1670, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-10-09 11:43:00');
INSERT INTO `sys_job_log` VALUES (1671, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 11:44:00');
INSERT INTO `sys_job_log` VALUES (1672, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-09 11:45:00');
INSERT INTO `sys_job_log` VALUES (1673, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-09 11:46:00');
INSERT INTO `sys_job_log` VALUES (1674, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 11:47:00');
INSERT INTO `sys_job_log` VALUES (1675, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 11:48:00');
INSERT INTO `sys_job_log` VALUES (1676, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-09 11:49:00');
INSERT INTO `sys_job_log` VALUES (1677, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-10-09 11:50:00');
INSERT INTO `sys_job_log` VALUES (1678, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-09 11:51:00');
INSERT INTO `sys_job_log` VALUES (1679, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-09 11:52:00');
INSERT INTO `sys_job_log` VALUES (1680, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 11:53:00');
INSERT INTO `sys_job_log` VALUES (1681, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 11:54:00');
INSERT INTO `sys_job_log` VALUES (1682, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-09 11:55:00');
INSERT INTO `sys_job_log` VALUES (1683, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 11:56:00');
INSERT INTO `sys_job_log` VALUES (1684, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 11:57:00');
INSERT INTO `sys_job_log` VALUES (1685, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 11:58:00');
INSERT INTO `sys_job_log` VALUES (1686, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 11:59:00');
INSERT INTO `sys_job_log` VALUES (1687, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-09 12:00:00');
INSERT INTO `sys_job_log` VALUES (1688, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 12:01:00');
INSERT INTO `sys_job_log` VALUES (1689, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:02:00');
INSERT INTO `sys_job_log` VALUES (1690, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-09 12:03:00');
INSERT INTO `sys_job_log` VALUES (1691, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 12:04:00');
INSERT INTO `sys_job_log` VALUES (1692, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:05:00');
INSERT INTO `sys_job_log` VALUES (1693, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 12:06:00');
INSERT INTO `sys_job_log` VALUES (1694, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 12:07:00');
INSERT INTO `sys_job_log` VALUES (1695, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 12:08:00');
INSERT INTO `sys_job_log` VALUES (1696, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 12:09:00');
INSERT INTO `sys_job_log` VALUES (1697, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 12:10:00');
INSERT INTO `sys_job_log` VALUES (1698, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-09 12:11:00');
INSERT INTO `sys_job_log` VALUES (1699, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 12:12:00');
INSERT INTO `sys_job_log` VALUES (1700, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 12:13:00');
INSERT INTO `sys_job_log` VALUES (1701, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:14:00');
INSERT INTO `sys_job_log` VALUES (1702, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 12:15:00');
INSERT INTO `sys_job_log` VALUES (1703, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 12:16:00');
INSERT INTO `sys_job_log` VALUES (1704, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 12:17:00');
INSERT INTO `sys_job_log` VALUES (1705, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 12:18:00');
INSERT INTO `sys_job_log` VALUES (1706, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:19:00');
INSERT INTO `sys_job_log` VALUES (1707, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 12:20:00');
INSERT INTO `sys_job_log` VALUES (1708, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 12:21:00');
INSERT INTO `sys_job_log` VALUES (1709, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 12:22:00');
INSERT INTO `sys_job_log` VALUES (1710, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:23:00');
INSERT INTO `sys_job_log` VALUES (1711, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 12:24:00');
INSERT INTO `sys_job_log` VALUES (1712, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 12:25:00');
INSERT INTO `sys_job_log` VALUES (1713, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 12:26:00');
INSERT INTO `sys_job_log` VALUES (1714, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 12:27:00');
INSERT INTO `sys_job_log` VALUES (1715, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:28:00');
INSERT INTO `sys_job_log` VALUES (1716, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:29:00');
INSERT INTO `sys_job_log` VALUES (1717, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 12:30:00');
INSERT INTO `sys_job_log` VALUES (1718, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:31:00');
INSERT INTO `sys_job_log` VALUES (1719, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:32:00');
INSERT INTO `sys_job_log` VALUES (1720, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 12:33:00');
INSERT INTO `sys_job_log` VALUES (1721, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:34:00');
INSERT INTO `sys_job_log` VALUES (1722, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：46毫秒', '0', '', '2025-10-09 12:35:00');
INSERT INTO `sys_job_log` VALUES (1723, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:36:00');
INSERT INTO `sys_job_log` VALUES (1724, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:37:00');
INSERT INTO `sys_job_log` VALUES (1725, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:38:00');
INSERT INTO `sys_job_log` VALUES (1726, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 12:39:00');
INSERT INTO `sys_job_log` VALUES (1727, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-10-09 12:40:00');
INSERT INTO `sys_job_log` VALUES (1728, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 12:41:00');
INSERT INTO `sys_job_log` VALUES (1729, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 12:42:00');
INSERT INTO `sys_job_log` VALUES (1730, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 12:43:00');
INSERT INTO `sys_job_log` VALUES (1731, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 12:44:00');
INSERT INTO `sys_job_log` VALUES (1732, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:45:00');
INSERT INTO `sys_job_log` VALUES (1733, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 12:46:00');
INSERT INTO `sys_job_log` VALUES (1734, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 12:47:00');
INSERT INTO `sys_job_log` VALUES (1735, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 12:48:00');
INSERT INTO `sys_job_log` VALUES (1736, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：86毫秒', '0', '', '2025-10-09 12:49:00');
INSERT INTO `sys_job_log` VALUES (1737, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 12:50:00');
INSERT INTO `sys_job_log` VALUES (1738, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 12:51:00');
INSERT INTO `sys_job_log` VALUES (1739, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 12:52:00');
INSERT INTO `sys_job_log` VALUES (1740, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-09 12:53:00');
INSERT INTO `sys_job_log` VALUES (1741, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：40毫秒', '0', '', '2025-10-09 12:54:00');
INSERT INTO `sys_job_log` VALUES (1742, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-10-09 12:55:00');
INSERT INTO `sys_job_log` VALUES (1743, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-09 12:56:00');
INSERT INTO `sys_job_log` VALUES (1744, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-09 12:57:00');
INSERT INTO `sys_job_log` VALUES (1745, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-09 12:58:00');
INSERT INTO `sys_job_log` VALUES (1746, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-09 12:59:00');
INSERT INTO `sys_job_log` VALUES (1747, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：48毫秒', '0', '', '2025-10-09 13:00:00');
INSERT INTO `sys_job_log` VALUES (1748, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 13:01:00');
INSERT INTO `sys_job_log` VALUES (1749, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-09 13:02:00');
INSERT INTO `sys_job_log` VALUES (1750, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-09 13:03:00');
INSERT INTO `sys_job_log` VALUES (1751, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-09 13:04:00');
INSERT INTO `sys_job_log` VALUES (1752, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 13:05:00');
INSERT INTO `sys_job_log` VALUES (1753, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 13:06:00');
INSERT INTO `sys_job_log` VALUES (1754, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 13:07:00');
INSERT INTO `sys_job_log` VALUES (1755, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 13:08:00');
INSERT INTO `sys_job_log` VALUES (1756, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 13:09:00');
INSERT INTO `sys_job_log` VALUES (1757, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 13:11:00');
INSERT INTO `sys_job_log` VALUES (1758, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 13:12:00');
INSERT INTO `sys_job_log` VALUES (1759, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 13:13:00');
INSERT INTO `sys_job_log` VALUES (1760, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 13:14:00');
INSERT INTO `sys_job_log` VALUES (1761, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-09 13:15:00');
INSERT INTO `sys_job_log` VALUES (1762, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 13:16:00');
INSERT INTO `sys_job_log` VALUES (1763, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-09 13:17:00');
INSERT INTO `sys_job_log` VALUES (1764, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-09 13:18:00');
INSERT INTO `sys_job_log` VALUES (1765, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 13:19:00');
INSERT INTO `sys_job_log` VALUES (1766, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-09 13:20:00');
INSERT INTO `sys_job_log` VALUES (1767, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-09 13:21:00');
INSERT INTO `sys_job_log` VALUES (1768, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-09 13:22:00');
INSERT INTO `sys_job_log` VALUES (1769, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：36毫秒', '0', '', '2025-10-09 13:23:00');
INSERT INTO `sys_job_log` VALUES (1770, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 13:24:00');
INSERT INTO `sys_job_log` VALUES (1771, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-09 13:25:00');
INSERT INTO `sys_job_log` VALUES (1772, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-09 13:26:00');
INSERT INTO `sys_job_log` VALUES (1773, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 13:27:00');
INSERT INTO `sys_job_log` VALUES (1774, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-09 13:28:00');
INSERT INTO `sys_job_log` VALUES (1775, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-09 13:29:00');
INSERT INTO `sys_job_log` VALUES (1776, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-09 13:30:00');
INSERT INTO `sys_job_log` VALUES (1777, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-09 13:32:00');
INSERT INTO `sys_job_log` VALUES (1778, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-09 13:34:00');
INSERT INTO `sys_job_log` VALUES (1779, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：45毫秒', '0', '', '2025-10-10 00:24:00');
INSERT INTO `sys_job_log` VALUES (1780, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 00:26:00');
INSERT INTO `sys_job_log` VALUES (1781, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 00:28:00');
INSERT INTO `sys_job_log` VALUES (1782, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 00:30:00');
INSERT INTO `sys_job_log` VALUES (1783, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 00:32:00');
INSERT INTO `sys_job_log` VALUES (1784, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-10 00:34:00');
INSERT INTO `sys_job_log` VALUES (1785, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 00:36:00');
INSERT INTO `sys_job_log` VALUES (1786, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-10 00:38:00');
INSERT INTO `sys_job_log` VALUES (1787, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 00:40:00');
INSERT INTO `sys_job_log` VALUES (1788, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 00:42:00');
INSERT INTO `sys_job_log` VALUES (1789, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 00:44:00');
INSERT INTO `sys_job_log` VALUES (1790, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 00:46:00');
INSERT INTO `sys_job_log` VALUES (1791, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-10 00:48:00');
INSERT INTO `sys_job_log` VALUES (1792, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-10 00:50:00');
INSERT INTO `sys_job_log` VALUES (1793, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-10 00:52:00');
INSERT INTO `sys_job_log` VALUES (1794, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-10 00:54:00');
INSERT INTO `sys_job_log` VALUES (1795, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 00:56:00');
INSERT INTO `sys_job_log` VALUES (1796, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：27毫秒', '0', '', '2025-10-10 00:58:00');
INSERT INTO `sys_job_log` VALUES (1797, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 01:00:00');
INSERT INTO `sys_job_log` VALUES (1798, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 01:02:00');
INSERT INTO `sys_job_log` VALUES (1799, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 01:04:00');
INSERT INTO `sys_job_log` VALUES (1800, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-10 01:06:00');
INSERT INTO `sys_job_log` VALUES (1801, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-10 01:08:00');
INSERT INTO `sys_job_log` VALUES (1802, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：55毫秒', '0', '', '2025-10-10 01:18:00');
INSERT INTO `sys_job_log` VALUES (1803, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 01:20:00');
INSERT INTO `sys_job_log` VALUES (1804, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-10-10 01:22:00');
INSERT INTO `sys_job_log` VALUES (1805, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 01:24:00');
INSERT INTO `sys_job_log` VALUES (1806, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 01:26:00');
INSERT INTO `sys_job_log` VALUES (1807, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-10 01:28:00');
INSERT INTO `sys_job_log` VALUES (1808, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 01:30:00');
INSERT INTO `sys_job_log` VALUES (1809, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-10 01:32:00');
INSERT INTO `sys_job_log` VALUES (1810, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 01:34:00');
INSERT INTO `sys_job_log` VALUES (1811, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：51毫秒', '0', '', '2025-10-10 10:18:00');
INSERT INTO `sys_job_log` VALUES (1812, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 10:20:00');
INSERT INTO `sys_job_log` VALUES (1813, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：27毫秒', '0', '', '2025-10-10 10:22:00');
INSERT INTO `sys_job_log` VALUES (1814, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-10-10 10:24:00');
INSERT INTO `sys_job_log` VALUES (1815, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-10-10 10:26:00');
INSERT INTO `sys_job_log` VALUES (1816, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-10-10 10:28:00');
INSERT INTO `sys_job_log` VALUES (1817, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-10-10 10:30:00');
INSERT INTO `sys_job_log` VALUES (1818, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 10:32:00');
INSERT INTO `sys_job_log` VALUES (1819, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-10 10:34:00');
INSERT INTO `sys_job_log` VALUES (1820, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-10-10 10:36:00');
INSERT INTO `sys_job_log` VALUES (1821, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-10-10 10:38:00');
INSERT INTO `sys_job_log` VALUES (1822, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-10 10:40:00');
INSERT INTO `sys_job_log` VALUES (1823, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-10-10 10:42:00');
INSERT INTO `sys_job_log` VALUES (1824, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-10 10:44:00');
INSERT INTO `sys_job_log` VALUES (1825, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-10 10:46:00');
INSERT INTO `sys_job_log` VALUES (1826, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 10:48:00');
INSERT INTO `sys_job_log` VALUES (1827, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 10:50:00');
INSERT INTO `sys_job_log` VALUES (1828, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：35毫秒', '0', '', '2025-10-10 10:52:00');
INSERT INTO `sys_job_log` VALUES (1829, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：22毫秒', '0', '', '2025-10-10 10:54:00');
INSERT INTO `sys_job_log` VALUES (1830, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-10-10 10:56:00');
INSERT INTO `sys_job_log` VALUES (1831, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 10:58:00');
INSERT INTO `sys_job_log` VALUES (1832, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-10-10 11:00:00');
INSERT INTO `sys_job_log` VALUES (1833, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 11:02:00');
INSERT INTO `sys_job_log` VALUES (1834, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-10-10 11:04:00');
INSERT INTO `sys_job_log` VALUES (1835, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-10-10 11:06:00');
INSERT INTO `sys_job_log` VALUES (1836, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-10 11:08:00');
INSERT INTO `sys_job_log` VALUES (1837, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-10 11:10:00');
INSERT INTO `sys_job_log` VALUES (1838, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-10-10 11:12:00');
INSERT INTO `sys_job_log` VALUES (1839, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 11:14:00');
INSERT INTO `sys_job_log` VALUES (1840, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 11:16:00');
INSERT INTO `sys_job_log` VALUES (1841, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 11:18:00');
INSERT INTO `sys_job_log` VALUES (1842, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 11:20:00');
INSERT INTO `sys_job_log` VALUES (1843, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 11:22:00');
INSERT INTO `sys_job_log` VALUES (1844, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-10 11:24:00');
INSERT INTO `sys_job_log` VALUES (1845, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-10 11:26:00');
INSERT INTO `sys_job_log` VALUES (1846, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 11:28:00');
INSERT INTO `sys_job_log` VALUES (1847, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-10 11:30:00');
INSERT INTO `sys_job_log` VALUES (1848, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-10 11:32:00');
INSERT INTO `sys_job_log` VALUES (1849, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-10 11:34:00');
INSERT INTO `sys_job_log` VALUES (1850, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 11:36:00');
INSERT INTO `sys_job_log` VALUES (1851, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-10-10 11:38:00');
INSERT INTO `sys_job_log` VALUES (1852, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-10 11:40:00');
INSERT INTO `sys_job_log` VALUES (1853, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-10-10 11:42:00');
INSERT INTO `sys_job_log` VALUES (1854, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 11:44:00');
INSERT INTO `sys_job_log` VALUES (1855, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 11:46:00');
INSERT INTO `sys_job_log` VALUES (1856, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 11:48:00');
INSERT INTO `sys_job_log` VALUES (1857, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 11:50:00');
INSERT INTO `sys_job_log` VALUES (1858, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-10-10 11:52:00');
INSERT INTO `sys_job_log` VALUES (1859, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 11:54:00');
INSERT INTO `sys_job_log` VALUES (1860, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 11:56:00');
INSERT INTO `sys_job_log` VALUES (1861, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 11:58:00');
INSERT INTO `sys_job_log` VALUES (1862, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 12:00:00');
INSERT INTO `sys_job_log` VALUES (1863, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 12:02:00');
INSERT INTO `sys_job_log` VALUES (1864, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 12:04:00');
INSERT INTO `sys_job_log` VALUES (1865, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 12:06:00');
INSERT INTO `sys_job_log` VALUES (1866, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 12:08:00');
INSERT INTO `sys_job_log` VALUES (1867, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 12:10:00');
INSERT INTO `sys_job_log` VALUES (1868, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-10 12:12:00');
INSERT INTO `sys_job_log` VALUES (1869, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 12:14:00');
INSERT INTO `sys_job_log` VALUES (1870, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 12:16:00');
INSERT INTO `sys_job_log` VALUES (1871, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 12:18:00');
INSERT INTO `sys_job_log` VALUES (1872, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 12:20:00');
INSERT INTO `sys_job_log` VALUES (1873, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-10-10 12:22:00');
INSERT INTO `sys_job_log` VALUES (1874, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：37毫秒', '0', '', '2025-10-10 12:24:00');
INSERT INTO `sys_job_log` VALUES (1875, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 12:26:00');
INSERT INTO `sys_job_log` VALUES (1876, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-10-10 12:28:00');
INSERT INTO `sys_job_log` VALUES (1877, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 12:30:00');
INSERT INTO `sys_job_log` VALUES (1878, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 12:32:00');
INSERT INTO `sys_job_log` VALUES (1879, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-10-10 12:34:00');
INSERT INTO `sys_job_log` VALUES (1880, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 12:36:00');
INSERT INTO `sys_job_log` VALUES (1881, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 12:38:00');
INSERT INTO `sys_job_log` VALUES (1882, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：5毫秒', '0', '', '2025-10-10 12:40:00');
INSERT INTO `sys_job_log` VALUES (1883, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 12:42:00');
INSERT INTO `sys_job_log` VALUES (1884, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-10 12:44:00');
INSERT INTO `sys_job_log` VALUES (1885, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-10 12:46:00');
INSERT INTO `sys_job_log` VALUES (1886, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：6毫秒', '0', '', '2025-10-10 12:48:00');
INSERT INTO `sys_job_log` VALUES (1887, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 12:50:00');
INSERT INTO `sys_job_log` VALUES (1888, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：75毫秒', '0', '', '2025-10-10 14:48:00');
INSERT INTO `sys_job_log` VALUES (1889, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-10-10 14:50:00');
INSERT INTO `sys_job_log` VALUES (1890, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 14:52:00');
INSERT INTO `sys_job_log` VALUES (1891, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-10-10 14:54:00');
INSERT INTO `sys_job_log` VALUES (1892, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-10-10 14:56:00');
INSERT INTO `sys_job_log` VALUES (1893, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 14:58:00');
INSERT INTO `sys_job_log` VALUES (1894, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-10-10 15:00:00');
INSERT INTO `sys_job_log` VALUES (1895, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-10-10 15:02:00');
INSERT INTO `sys_job_log` VALUES (1896, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 15:04:00');
INSERT INTO `sys_job_log` VALUES (1897, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-10-10 15:06:00');
INSERT INTO `sys_job_log` VALUES (1898, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 15:08:00');
INSERT INTO `sys_job_log` VALUES (1899, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-10 15:10:00');
INSERT INTO `sys_job_log` VALUES (1900, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 15:12:00');
INSERT INTO `sys_job_log` VALUES (1901, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-10-10 15:14:00');
INSERT INTO `sys_job_log` VALUES (1902, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-10 15:16:00');
INSERT INTO `sys_job_log` VALUES (1903, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：23毫秒', '0', '', '2025-10-10 15:18:00');
INSERT INTO `sys_job_log` VALUES (1904, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 15:20:00');
INSERT INTO `sys_job_log` VALUES (1905, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-10-10 15:22:00');
INSERT INTO `sys_job_log` VALUES (1906, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-10 15:24:00');
INSERT INTO `sys_job_log` VALUES (1907, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-10 15:26:00');
INSERT INTO `sys_job_log` VALUES (1908, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-10 15:28:00');
INSERT INTO `sys_job_log` VALUES (1909, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 15:30:00');
INSERT INTO `sys_job_log` VALUES (1910, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 15:32:00');
INSERT INTO `sys_job_log` VALUES (1911, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 15:34:00');
INSERT INTO `sys_job_log` VALUES (1912, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-10 15:36:00');
INSERT INTO `sys_job_log` VALUES (1913, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：27毫秒', '0', '', '2025-10-10 15:38:00');
INSERT INTO `sys_job_log` VALUES (1914, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-10-10 15:40:00');
INSERT INTO `sys_job_log` VALUES (1915, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-10 15:42:00');
INSERT INTO `sys_job_log` VALUES (1916, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 15:44:00');
INSERT INTO `sys_job_log` VALUES (1917, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 15:46:00');
INSERT INTO `sys_job_log` VALUES (1918, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 15:48:00');
INSERT INTO `sys_job_log` VALUES (1919, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 15:50:00');
INSERT INTO `sys_job_log` VALUES (1920, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：28毫秒', '0', '', '2025-10-10 15:52:00');
INSERT INTO `sys_job_log` VALUES (1921, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 15:54:00');
INSERT INTO `sys_job_log` VALUES (1922, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-10 15:56:00');
INSERT INTO `sys_job_log` VALUES (1923, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 15:58:00');
INSERT INTO `sys_job_log` VALUES (1924, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-10 16:00:00');
INSERT INTO `sys_job_log` VALUES (1925, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 16:02:00');
INSERT INTO `sys_job_log` VALUES (1926, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 16:04:00');
INSERT INTO `sys_job_log` VALUES (1927, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：19毫秒', '0', '', '2025-10-10 16:06:00');
INSERT INTO `sys_job_log` VALUES (1928, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：21毫秒', '0', '', '2025-10-10 16:08:00');
INSERT INTO `sys_job_log` VALUES (1929, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 16:10:00');
INSERT INTO `sys_job_log` VALUES (1930, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 16:12:00');
INSERT INTO `sys_job_log` VALUES (1931, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 16:14:00');
INSERT INTO `sys_job_log` VALUES (1932, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-10 16:16:00');
INSERT INTO `sys_job_log` VALUES (1933, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 16:18:00');
INSERT INTO `sys_job_log` VALUES (1934, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 16:20:00');
INSERT INTO `sys_job_log` VALUES (1935, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 16:22:00');
INSERT INTO `sys_job_log` VALUES (1936, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-10 16:24:00');
INSERT INTO `sys_job_log` VALUES (1937, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-10 16:26:00');
INSERT INTO `sys_job_log` VALUES (1938, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-10 16:28:00');
INSERT INTO `sys_job_log` VALUES (1939, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 16:30:00');
INSERT INTO `sys_job_log` VALUES (1940, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 16:32:00');
INSERT INTO `sys_job_log` VALUES (1941, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-10 16:34:00');
INSERT INTO `sys_job_log` VALUES (1942, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 16:36:00');
INSERT INTO `sys_job_log` VALUES (1943, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 16:38:00');
INSERT INTO `sys_job_log` VALUES (1944, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-10-10 16:40:00');
INSERT INTO `sys_job_log` VALUES (1945, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 16:42:00');
INSERT INTO `sys_job_log` VALUES (1946, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 16:44:00');
INSERT INTO `sys_job_log` VALUES (1947, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-10 16:46:00');
INSERT INTO `sys_job_log` VALUES (1948, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 16:48:00');
INSERT INTO `sys_job_log` VALUES (1949, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 16:50:00');
INSERT INTO `sys_job_log` VALUES (1950, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 16:52:00');
INSERT INTO `sys_job_log` VALUES (1951, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 16:54:00');
INSERT INTO `sys_job_log` VALUES (1952, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-10-10 16:56:00');
INSERT INTO `sys_job_log` VALUES (1953, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：8毫秒', '0', '', '2025-10-10 16:58:00');
INSERT INTO `sys_job_log` VALUES (1954, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 17:00:00');
INSERT INTO `sys_job_log` VALUES (1955, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 17:02:00');
INSERT INTO `sys_job_log` VALUES (1956, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：9毫秒', '0', '', '2025-10-10 17:04:00');
INSERT INTO `sys_job_log` VALUES (1957, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：7毫秒', '0', '', '2025-10-10 17:06:00');
INSERT INTO `sys_job_log` VALUES (1958, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 17:08:00');
INSERT INTO `sys_job_log` VALUES (1959, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-10 17:10:00');
INSERT INTO `sys_job_log` VALUES (1960, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 17:12:00');
INSERT INTO `sys_job_log` VALUES (1961, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：33毫秒', '0', '', '2025-10-10 17:18:00');
INSERT INTO `sys_job_log` VALUES (1962, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-10 17:20:00');
INSERT INTO `sys_job_log` VALUES (1963, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-10-10 17:22:00');
INSERT INTO `sys_job_log` VALUES (1964, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-10 17:24:00');
INSERT INTO `sys_job_log` VALUES (1965, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：16毫秒', '0', '', '2025-10-10 17:26:00');
INSERT INTO `sys_job_log` VALUES (1966, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：20毫秒', '0', '', '2025-10-10 17:28:00');
INSERT INTO `sys_job_log` VALUES (1967, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：14毫秒', '0', '', '2025-10-10 17:30:00');
INSERT INTO `sys_job_log` VALUES (1968, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：11毫秒', '0', '', '2025-10-10 17:32:00');
INSERT INTO `sys_job_log` VALUES (1969, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：10毫秒', '0', '', '2025-10-10 17:34:00');
INSERT INTO `sys_job_log` VALUES (1970, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-10-10 17:36:00');
INSERT INTO `sys_job_log` VALUES (1971, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：12毫秒', '0', '', '2025-10-10 17:38:00');
INSERT INTO `sys_job_log` VALUES (1972, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：18毫秒', '0', '', '2025-10-10 17:40:00');
INSERT INTO `sys_job_log` VALUES (1973, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：15毫秒', '0', '', '2025-10-10 17:42:00');
INSERT INTO `sys_job_log` VALUES (1974, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：13毫秒', '0', '', '2025-10-10 17:44:00');
INSERT INTO `sys_job_log` VALUES (1975, '新闻阅读量同步到数据库', 'DEFAULT', 'ryTask.syncNewsViews', '新闻阅读量同步到数据库 总共耗时：17毫秒', '0', '', '2025-10-10 17:46:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 226 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-24 09:31:58');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-24 14:01:41');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-09-24 14:13:52');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '退出成功', '2025-09-24 16:24:37');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-24 16:24:51');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-24 16:26:48');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '验证码错误', '2025-09-24 16:26:52');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-24 16:26:55');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-25 09:02:08');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '验证码错误', '2025-09-25 09:02:13');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-25 09:02:17');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-25 09:02:24');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-25 11:51:20');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-25 11:59:10');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-25 13:01:20');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-25 14:08:03');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '验证码错误', '2025-09-25 16:08:26');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-25 16:08:31');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-25 16:55:44');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-26 09:11:36');
INSERT INTO `sys_logininfor` VALUES (120, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-26 10:24:11');
INSERT INTO `sys_logininfor` VALUES (121, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-26 10:24:32');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '验证码已失效', '2025-09-26 11:24:33');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '验证码错误', '2025-09-26 11:24:40');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-26 11:24:44');
INSERT INTO `sys_logininfor` VALUES (125, 'csry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-26 12:01:44');
INSERT INTO `sys_logininfor` VALUES (126, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-26 12:02:03');
INSERT INTO `sys_logininfor` VALUES (127, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-26 12:02:10');
INSERT INTO `sys_logininfor` VALUES (128, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-26 12:02:32');
INSERT INTO `sys_logininfor` VALUES (129, 'scyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-26 12:16:33');
INSERT INTO `sys_logininfor` VALUES (130, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-09-26 12:16:37');
INSERT INTO `sys_logininfor` VALUES (131, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-26 12:16:40');
INSERT INTO `sys_logininfor` VALUES (132, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-26 12:16:46');
INSERT INTO `sys_logininfor` VALUES (133, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-26 12:20:30');
INSERT INTO `sys_logininfor` VALUES (134, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-09-26 12:25:54');
INSERT INTO `sys_logininfor` VALUES (135, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-09-26 12:25:58');
INSERT INTO `sys_logininfor` VALUES (136, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-26 12:26:02');
INSERT INTO `sys_logininfor` VALUES (137, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-26 12:26:27');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-26 12:59:49');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-26 13:53:41');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-26 14:55:46');
INSERT INTO `sys_logininfor` VALUES (141, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-09-26 17:55:19');
INSERT INTO `sys_logininfor` VALUES (142, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-09-26 17:55:23');
INSERT INTO `sys_logininfor` VALUES (143, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-09-26 17:55:27');
INSERT INTO `sys_logininfor` VALUES (144, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-09-26 17:57:47');
INSERT INTO `sys_logininfor` VALUES (145, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-09-26 17:58:01');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '验证码错误', '2025-09-29 09:00:11');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 09:00:15');
INSERT INTO `sys_logininfor` VALUES (148, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-29 09:01:27');
INSERT INTO `sys_logininfor` VALUES (149, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-09-29 09:02:29');
INSERT INTO `sys_logininfor` VALUES (150, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-29 09:02:33');
INSERT INTO `sys_logininfor` VALUES (151, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-29 09:03:32');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '退出成功', '2025-09-29 09:04:39');
INSERT INTO `sys_logininfor` VALUES (153, 'csyh', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 09:04:49');
INSERT INTO `sys_logininfor` VALUES (154, 'csyh', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '退出成功', '2025-09-29 09:07:01');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 09:11:17');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '退出成功', '2025-09-29 09:12:09');
INSERT INTO `sys_logininfor` VALUES (157, 'csyh', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 09:12:19');
INSERT INTO `sys_logininfor` VALUES (158, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-29 09:15:09');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-29 09:15:14');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-29 09:15:49');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 10:14:04');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '退出成功', '2025-09-29 10:14:27');
INSERT INTO `sys_logininfor` VALUES (163, 'csyh', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 10:15:34');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '验证码已失效', '2025-09-29 10:18:36');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 10:18:39');
INSERT INTO `sys_logininfor` VALUES (166, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-29 10:20:12');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '退出成功', '2025-09-29 10:20:40');
INSERT INTO `sys_logininfor` VALUES (168, 'csyh', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 10:20:47');
INSERT INTO `sys_logininfor` VALUES (169, 'csyh', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '退出成功', '2025-09-29 10:22:19');
INSERT INTO `sys_logininfor` VALUES (170, 'csyh', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 10:22:30');
INSERT INTO `sys_logininfor` VALUES (171, 'csyh', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '退出成功', '2025-09-29 10:25:00');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 10:25:07');
INSERT INTO `sys_logininfor` VALUES (173, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-29 10:27:04');
INSERT INTO `sys_logininfor` VALUES (174, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-29 10:32:30');
INSERT INTO `sys_logininfor` VALUES (175, 'csyh', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-29 10:34:38');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '退出成功', '2025-09-29 12:09:55');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-29 12:12:07');
INSERT INTO `sys_logininfor` VALUES (178, 'wyq', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-29 12:40:31');
INSERT INTO `sys_logininfor` VALUES (179, 'wyq', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-29 12:41:02');
INSERT INTO `sys_logininfor` VALUES (180, 'wyq', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2025-09-29 12:41:43');
INSERT INTO `sys_logininfor` VALUES (181, 'wyq', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-29 12:41:47');
INSERT INTO `sys_logininfor` VALUES (182, 'wyq', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '验证码已失效', '2025-09-29 12:44:23');
INSERT INTO `sys_logininfor` VALUES (183, 'wyq', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '验证码错误', '2025-09-29 12:44:26');
INSERT INTO `sys_logininfor` VALUES (184, 'wyq', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '验证码错误', '2025-09-29 12:44:30');
INSERT INTO `sys_logininfor` VALUES (185, 'wyq', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-29 12:44:33');
INSERT INTO `sys_logininfor` VALUES (186, 'wyq', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2025-09-29 12:59:33');
INSERT INTO `sys_logininfor` VALUES (187, 'wyq', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-29 12:59:37');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-29 13:30:09');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-29 13:45:36');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-29 13:46:30');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-29 13:51:05');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 13:51:12');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 14:23:30');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '退出成功', '2025-09-29 14:26:42');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 14:31:00');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '验证码错误', '2025-09-29 15:11:31');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 15:11:34');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 15:26:51');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '退出成功', '2025-09-29 15:31:10');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-09-29 15:31:30');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2025-09-29 15:31:40');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '验证码已失效', '2025-09-29 15:37:24');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-29 15:37:28');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-30 09:04:02');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-30 10:32:56');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '退出成功', '2025-09-30 11:11:34');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-30 11:13:00');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '1', '验证码错误', '2025-09-30 11:32:06');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-09-30 11:32:10');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '退出成功', '2025-09-30 11:37:38');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-30 11:39:58');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-09-30 12:16:18');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-09 10:56:37');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-10-09 11:00:53');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-09 11:01:01');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-10-09 11:06:12');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-10-09 11:06:16');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-09 11:06:21');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-09 13:03:39');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-10-09 13:25:04');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-10-09 13:25:32');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-09 13:25:36');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-10 00:31:21');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Firefox 14', 'Windows 10', '0', '登录成功', '2025-10-10 15:46:01');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-10 15:59:50');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2025-10-10 16:06:18');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 4, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-09-23 15:32:08', 'admin', '2025-09-29 17:01:49', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 5, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-09-23 15:32:08', 'admin', '2025-09-29 17:01:59', '系统监控目录');
INSERT INTO `sys_menu` VALUES (5, '网站管理', 0, 1, 'website', NULL, '', '', 1, 0, 'M', '0', '0', '', 'guide', 'admin', '2025-09-25 09:43:02', 'admin', '2025-09-29 17:01:31', '网站管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-09-23 15:32:08', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-09-23 15:32:08', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-09-23 15:32:08', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-09-23 15:32:08', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-09-23 15:32:08', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-09-23 15:32:08', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-09-23 15:32:08', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-09-23 15:32:08', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-09-23 15:32:08', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-09-23 15:32:08', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-09-23 15:32:08', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-09-23 15:32:08', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-09-23 15:32:08', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-09-23 15:32:08', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-09-23 15:32:08', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (200, '轮播图管理', 5, 1, 'carousel', 'system/website/carousel/index', '', '', 1, 0, 'C', '0', '0', 'website:carousel:list', 'slider', 'admin', '2025-09-25 09:43:02', '', NULL, '轮播图管理菜单');
INSERT INTO `sys_menu` VALUES (201, '新闻动态管理', 5, 2, 'news', 'system/website/news/index', '', '', 1, 0, 'C', '0', '0', 'website:news:list', 'documentation', 'admin', '2025-09-25 09:43:02', 'admin', '2025-09-25 16:24:53', '新闻管理菜单');
INSERT INTO `sys_menu` VALUES (202, '设施环境管理', 5, 3, 'facilities', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tab', 'admin', '2025-09-25 10:02:32', 'admin', '2025-09-25 16:25:01', '设施环境管理目录');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-09-23 15:32:08', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-09-23 15:32:08', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-09-23 15:32:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '轮播图查询', 200, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'website:carousel:query', '#', 'admin', '2025-09-24 12:30:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '轮播图新增', 200, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'website:carousel:add', '#', 'admin', '2025-09-24 12:30:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '轮播图修改', 200, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'website:carousel:edit', '#', 'admin', '2025-09-24 12:30:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '轮播图删除', 200, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'website:carousel:remove', '#', 'admin', '2025-09-24 12:30:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '轮播图导出', 200, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'website:carousel:export', '#', 'admin', '2025-09-24 12:30:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '新闻查询', 201, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'website:news:query', '#', 'admin', '2025-09-24 12:30:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '新闻新增', 201, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'website:news:add', '#', 'admin', '2025-09-24 12:30:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '新闻修改', 201, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'website:news:edit', '#', 'admin', '2025-09-24 12:30:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '新闻删除', 201, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'website:news:remove', '#', 'admin', '2025-09-24 12:30:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '新闻导出', 201, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'website:news:export', '#', 'admin', '2025-09-24 12:30:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '设施查询', 202, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:facilities:query', '#', 'admin', '2025-09-25 09:40:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '房间设施', 202, 1, 'room-facilities', 'system/website/room-facilities/index', '', '', 1, 0, 'C', '0', '0', 'system:facilities:list', 'fullscreen', 'admin', '2025-09-25 10:02:32', 'admin', '2025-09-25 10:06:39', '房间设施管理菜单');
INSERT INTO `sys_menu` VALUES (2022, '公共设施', 202, 2, 'public-facilities', 'system/website/public-facilities/index', '', '', 1, 0, 'C', '0', '0', 'system:facilities:list', 'fullscreen', 'admin', '2025-09-25 10:02:32', 'admin', '2025-09-25 10:06:46', '公共设施管理菜单');
INSERT INTO `sys_menu` VALUES (2023, '安全设施', 202, 3, 'safety-facilities', 'system/website/safety-facilities/index', '', '', 1, 0, 'C', '0', '0', 'system:facilities:list', 'fullscreen', 'admin', '2025-09-25 10:02:32', 'admin', '2025-09-25 10:06:51', '安全设施管理菜单');
INSERT INTO `sys_menu` VALUES (2024, '医疗设施', 202, 4, 'medical-facilities', 'system/website/medical-facilities/index', '', '', 1, 0, 'C', '0', '0', 'system:facilities:list', 'fullscreen', 'admin', '2025-09-25 10:02:32', 'admin', '2025-09-25 10:06:57', '医疗设施管理菜单');
INSERT INTO `sys_menu` VALUES (2057, '环境特色', 202, 5, 'environment-facilities', 'system/website/environment-features/index', NULL, '', 1, 0, 'C', '0', '0', 'system:facilities:list', 'fullscreen', 'admin', '2025-09-25 16:42:04', 'admin', '2025-09-25 16:56:30', '');
INSERT INTO `sys_menu` VALUES (2058, '服务项目管理', 5, 4, 'services', '', '', '', 1, 0, 'M', '0', '0', '', 'list', 'admin', '2025-09-25 17:11:46', 'admin', '2025-09-25 17:15:53', '服务管理菜单');
INSERT INTO `sys_menu` VALUES (2059, '主要服务项目', 2058, 1, 'main-services', 'system/website/main-services/index', '', '', 1, 0, 'C', '0', '0', 'system:main-services:list', 'fullscreen', 'admin', '2025-09-25 17:11:46', 'admin', '2025-09-25 17:57:02', '主要服务项目管理菜单');
INSERT INTO `sys_menu` VALUES (2060, '医疗护理服务', 2058, 2, 'medical-services', 'system/website/medical-services/index', NULL, '', 1, 0, 'C', '0', '0', 'system:medical-services:list', 'fullscreen', 'admin', '2025-09-25 17:30:01', 'admin', '2025-09-25 17:34:22', '');
INSERT INTO `sys_menu` VALUES (2061, '生活照料服务', 2058, 3, 'care-services', 'system/website/care-services/index', NULL, '', 1, 0, 'C', '0', '0', 'system:care-services:list', 'fullscreen', 'admin', '2025-09-25 17:47:24', 'admin', '2025-09-25 17:47:59', '');
INSERT INTO `sys_menu` VALUES (2063, '文娱活动服务', 2058, 4, 'entertainment-services', 'system/website/entertainment-services/index', NULL, '', 1, 0, 'C', '0', '0', 'system:entertainment-services:list', 'fullscreen', 'admin', '2025-09-26 09:48:23', 'admin', '2025-09-26 09:52:26', '');
INSERT INTO `sys_menu` VALUES (2065, '营养膳食管理', 2058, 5, 'nutrition-services', 'system/website/nutrition-services/index', '', '', 1, 0, 'C', '0', '0', 'website:nutrition:list', 'fullscreen', 'admin', '2025-09-26 10:16:30', 'admin', '2025-09-26 10:22:06', '营养膳食管理菜单');
INSERT INTO `sys_menu` VALUES (2100, '咨询管理', 5, 1, 'consultation', 'system/website/consultation/index', '', '', 1, 0, 'M', '0', '0', 'website:consultation:list', 'message', 'admin', '2023-01-01 00:00:00', 'admin', '2025-09-26 11:27:14', '咨询管理菜单');
INSERT INTO `sys_menu` VALUES (2101, '咨询查询', 2100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'website:consultation:query', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2102, '咨询回复', 2100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'website:consultation:reply', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2103, '咨询删除', 2100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'website:consultation:remove', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2104, '咨询导出', 2100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'website:consultation:export', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2200, '在线预约管理', 5, 2, 'appointment', 'system/website/appointment/index', '', '', 1, 0, 'C', '0', '0', 'website:appointment:list', 'email', 'admin', '2023-01-01 00:00:00', 'admin', '2025-09-26 11:56:53', '预约管理菜单');
INSERT INTO `sys_menu` VALUES (2201, '预约查询', 2200, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'website:appointment:query', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2202, '预约确认', 2200, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'website:appointment:confirm', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2203, '预约取消', 2200, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'website:appointment:cancel', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2204, '预约删除', 2200, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'website:appointment:remove', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2205, '预约导出', 2200, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'website:appointment:export', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2210, '健康报告管理', 2400, 2, 'health-report', 'system/website/health-report/index', '', '', 1, 0, 'C', '0', '0', 'website:health:list', 'clipboard', 'admin', '2023-01-01 00:00:00', 'admin', '2025-09-26 14:17:13', '健康报告管理菜单');
INSERT INTO `sys_menu` VALUES (2211, '健康报告查询', 2210, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'website:health:query', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2212, '健康报告新增', 2210, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'website:health:add', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2213, '健康报告修改', 2210, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'website:health:edit', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2214, '健康报告删除', 2210, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'website:health:remove', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2215, '健康报告导出', 2210, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'website:health:export', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2300, '老人信息管理', 2400, 1, 'elderly-info', 'system/website/elderly-info/index', '', '', 1, 0, 'C', '0', '0', 'website:elderly:list', 'user', 'admin', '2023-01-01 00:00:00', 'admin', '2025-09-26 13:37:45', '老人信息管理菜单');
INSERT INTO `sys_menu` VALUES (2301, '老人信息查询', 2300, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'website:elderly:query', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2302, '老人信息新增', 2300, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'website:elderly:add', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2303, '老人信息修改', 2300, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'website:elderly:edit', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2304, '老人信息删除', 2300, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'website:elderly:remove', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2305, '老人信息导出', 2300, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'website:elderly:export', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2310, '费用查询管理', 2400, 4, 'fee-query', 'system/website/fee-query/index', '', '', 1, 0, 'C', '0', '0', 'website:fee:list', 'money', 'admin', '2023-01-01 00:00:00', 'admin', '2025-09-26 17:19:12', '费用查询管理菜单');
INSERT INTO `sys_menu` VALUES (2311, '费用查询查询', 2310, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'website:fee:query', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2312, '费用查询新增', 2310, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'website:fee:add', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2313, '费用查询修改', 2310, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'website:fee:edit', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2314, '费用查询删除', 2310, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'website:fee:remove', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2315, '费用查询导出', 2310, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'website:fee:export', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2316, '费用查询处理', 2310, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'website:fee:process', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2317, '费用查询发送', 2310, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'website:fee:send', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2320, '费用明细管理', 2400, 3, 'fee-detail', 'system/website/fee-detail/index', '', '', 1, 0, 'C', '0', '0', 'website:feeDetail:list', 'list', 'admin', '2023-01-01 00:00:00', 'admin', '2025-09-26 17:18:51', '费用明细管理菜单');
INSERT INTO `sys_menu` VALUES (2321, '费用明细查询', 2320, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'website:feeDetail:query', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2322, '费用明细新增', 2320, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'website:feeDetail:add', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2323, '费用明细修改', 2320, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'website:feeDetail:edit', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2324, '费用明细删除', 2320, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'website:feeDetail:remove', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2325, '费用明细导出', 2320, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'website:feeDetail:export', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2326, '费用明细批量操作', 2320, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'website:feeDetail:batch', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2330, '意见反馈管理', 2400, 5, 'feedback', 'system/website/feedback/index', '', '', 1, 0, 'C', '0', '0', 'website:feedback:list', 'message', 'admin', '2025-09-26 17:08:41', 'admin', '2025-09-26 17:19:15', '意见反馈管理菜单');
INSERT INTO `sys_menu` VALUES (2331, '意见反馈查询', 2330, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'website:feedback:query', '#', 'admin', '2025-09-26 17:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2332, '意见反馈新增', 2330, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'website:feedback:add', '#', 'admin', '2025-09-26 17:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2333, '意见反馈修改', 2330, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'website:feedback:edit', '#', 'admin', '2025-09-26 17:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2334, '意见反馈删除', 2330, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'website:feedback:remove', '#', 'admin', '2025-09-26 17:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2335, '意见反馈导出', 2330, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'website:feedback:export', '#', 'admin', '2025-09-26 17:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2336, '意见反馈回复', 2330, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'website:feedback:reply', '#', 'admin', '2025-09-26 17:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2337, '意见反馈处理', 2330, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'website:feedback:process', '#', 'admin', '2025-09-26 17:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2400, '业务管理', 0, 2, 'business', NULL, '', '', 1, 0, 'M', '0', '0', '', 'job', 'admin', '2023-01-01 00:00:00', 'admin', '2025-09-29 17:01:37', '业务管理目录');
INSERT INTO `sys_menu` VALUES (3000, '家属管理', 0, 3, 'family', NULL, '', '', 1, 0, 'M', '0', '0', '', 'peoples', 'admin', '2023-01-01 00:00:00', 'admin', '2025-09-29 17:01:42', '家属管理目录');
INSERT INTO `sys_menu` VALUES (3001, '家属用户', 3000, 1, 'family-user', 'system/website/family-user/index', '', '', 1, 0, 'C', '0', '0', 'website:family:list', 'user', 'admin', '2023-01-01 00:00:00', 'admin', '2025-09-29 11:16:17', '家属用户管理');
INSERT INTO `sys_menu` VALUES (3002, '家属用户查询', 3001, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'website:family:query', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3003, '家属用户新增', 3001, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'website:family:add', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3004, '家属用户修改', 3001, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'website:family:edit', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3005, '家属用户删除', 3001, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'website:family:remove', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3006, '家属用户导出', 3001, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'website:family:export', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3007, '关系管理', 3000, 2, 'family-relation', 'system/website/family-relation/index', '', '', 1, 0, 'C', '0', '0', 'website:relation:list', 'tree', 'admin', '2023-01-01 00:00:00', 'admin', '2025-09-29 11:16:23', '家属老人关系管理');
INSERT INTO `sys_menu` VALUES (3008, '关系查询', 3007, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'website:relation:query', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3009, '关系审核', 3007, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'website:relation:audit', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3010, '关系删除', 3007, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'website:relation:remove', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3100, '沟通管理', 3000, 4, 'family-communication', 'system/website/family-communication/index-simple', '', '', 1, 0, 'C', '0', '0', 'website:communication:list', 'message', 'admin', '2023-01-01 00:00:00', 'admin', '2025-09-29 15:38:25', '沟通管理菜单');
INSERT INTO `sys_menu` VALUES (3101, '沟通查询', 3100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'website:communication:query', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3102, '沟通新增', 3100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'website:communication:add', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3103, '沟通修改', 3100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'website:communication:edit', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3104, '沟通删除', 3100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'website:communication:remove', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3105, '沟通导出', 3100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'website:communication:export', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3200, '健康标准管理', 5, 6, 'health-standards', 'system/website/health-standards/index', '', '', 1, 0, 'C', '0', '0', 'website:health-standards:view', 'system', 'admin', '2023-01-01 00:00:00', 'admin', '2025-09-30 09:42:31', '健康标准管理菜单');
INSERT INTO `sys_menu` VALUES (3201, '健康标准查询', 3200, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'website:health-standards:list', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3202, '健康标准修改', 3200, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'website:health-standards:edit', '#', 'admin', '2023-01-01 00:00:00', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0x3C703EE7B3BBE7BB9FE59CA8E5878CE699A8E4BC9AE8BF9BE8A18CE7BBB4E68AA4EFBC8CE8AFB7E88090E5BF83E7AD89E5BE85EFBC813C2F703E, '0', 'admin', '2025-09-23 15:32:09', 'admin', '2025-10-09 13:04:14', '管理员');
INSERT INTO `sys_notice` VALUES (10, '养老院开院管理', '2', 0x3C703EE6B58BE8AF95E69687E7ABA0E58685E5AEB9EFBC81EFBC81EFBC81EFBC81EFBC813C696D67207372633D222F6465762D6170692F70726F66696C652F75706C6F61642F323032352F31302F30392F68616F687561325F3230323531303039313134353535413030312E6A7067223E3C2F703E, '0', 'admin', '2025-10-09 11:45:58', 'admin', '2025-10-09 13:04:57', NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 493 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-09-24 09:35:11', 20);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-09-23 15:32:08\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 09:35:22', 19);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-09-24 09:35:32', 9);
INSERT INTO `sys_oper_log` VALUES (103, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-09-23 15:32:08\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 09:36:36', 63);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 09:36:43', 19);
INSERT INTO `sys_oper_log` VALUES (105, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":1,\"configKey\":\"sys.index.skinName\",\"configName\":\"主框架页-默认皮肤样式名称\",\"configType\":\"Y\",\"configValue\":\"skin-green\",\"createBy\":\"admin\",\"createTime\":\"2025-09-23 15:32:08\",\"params\":{},\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 12:01:24', 55);
INSERT INTO `sys_oper_log` VALUES (106, '轮播图', 2, 'com.ruoyi.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":2,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"经验丰富的护理团队，全天候守护老人健康\",\"imageUrl\":\"/profile/upload/2025/09/24/身份证_20250924123142A001.jpg\",\"linkUrl\":\"/website/services\",\"params\":{},\"remark\":\"首页轮播图2\",\"sortOrder\":2,\"status\":\"0\",\"title\":\"24小时专业护理\",\"updateBy\":\"\",\"updateTime\":\"2025-09-24 12:31:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 12:31:45', 24);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-09-24 12:30:33\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":5,\"menuName\":\"网站管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"website\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 12:33:28', 27);
INSERT INTO `sys_oper_log` VALUES (108, '轮播图', 5, 'com.ruoyi.web.controller.website.WebsiteCarouselController.export()', 'POST', 1, 'admin', '研发部门', '/website/carousel/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-24 12:42:39', 1501);
INSERT INTO `sys_oper_log` VALUES (109, '轮播图', 2, 'com.ruoyi.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":2,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"经验丰富的护理团队，全天候守护老人健康\",\"imageUrl\":\"/profile/upload/2025/09/24/1_20250924141908A001.jpg\",\"linkUrl\":\"/website/services\",\"params\":{},\"remark\":\"首页轮播图2\",\"sortOrder\":2,\"status\":\"0\",\"title\":\"24小时专业护理\",\"updateBy\":\"\",\"updateTime\":\"2025-09-24 14:19:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 14:19:09', 21);
INSERT INTO `sys_oper_log` VALUES (110, '轮播图', 2, 'com.ruoyi.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":2,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"经验丰富的护理团队，全天候守护老人健康666666\",\"imageUrl\":\"/profile/upload/2025/09/24/1_20250924141908A001.jpg\",\"linkUrl\":\"/website/services\",\"params\":{},\"remark\":\"首页轮播图2\",\"sortOrder\":2,\"status\":\"0\",\"title\":\"24小时专业护理666666\",\"updateBy\":\"\",\"updateTime\":\"2025-09-24 14:19:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 14:19:43', 6);
INSERT INTO `sys_oper_log` VALUES (111, '轮播图', 2, 'com.ruoyi.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":2,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"经验丰富的护理团队，全天候守护老人健康\",\"imageUrl\":\"/profile/upload/2025/09/24/1_20250924141908A001.jpg\",\"linkUrl\":\"/website/services\",\"params\":{},\"remark\":\"首页轮播图2\",\"sortOrder\":2,\"status\":\"0\",\"title\":\"24小时专业护理\",\"updateBy\":\"\",\"updateTime\":\"2025-09-24 14:19:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 14:19:59', 5);
INSERT INTO `sys_oper_log` VALUES (112, '轮播图', 2, 'com.ruoyi.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":1,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"为每一位老人提供最贴心的养老服务\",\"imageUrl\":\"https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80\",\"linkUrl\":\"/website/appointment\",\"params\":{},\"remark\":\"首页轮播图1\",\"sortOrder\":1,\"status\":\"1\",\"title\":\"温馨的家，专业的爱\",\"updateBy\":\"\",\"updateTime\":\"2025-09-24 14:31:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 14:31:04', 6);
INSERT INTO `sys_oper_log` VALUES (113, '轮播图', 2, 'com.ruoyi.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":1,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"为每一位老人提供最贴心的养老服务\",\"imageUrl\":\"https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80\",\"linkUrl\":\"/website/appointment\",\"params\":{},\"remark\":\"首页轮播图1\",\"sortOrder\":1,\"status\":\"0\",\"title\":\"温馨的家，专业的爱\",\"updateBy\":\"\",\"updateTime\":\"2025-09-24 14:31:12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 14:31:12', 5);
INSERT INTO `sys_oper_log` VALUES (114, '新闻', 2, 'com.ruoyi.web.controller.website.WebsiteNewsController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/news', '127.0.0.1', '内网IP', '{\"category\":\"nursing-home\",\"content\":\"<p>经过三个月的建设，智慧养老院的新设施正式投入使用。新增的康复训练室配备了最新的康复设备，包括电动起立床、平衡训练器等。</p><p>图书阅览室拥有各类图书5000余册，涵盖文学、历史、养生、科技等多个领域，为老人提供丰富的精神食粮。</p><p>新设施的投入使用，标志着智慧养老院服务能力的进一步提升，为老人提供更加专业、全面的服务。</p>\",\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"imageUrl\":\"/profile/upload/2025/09/24/3_20250924150324A001.jpg\",\"isFeatured\":\"0\",\"newsId\":2,\"params\":{},\"remark\":\"设施新闻\",\"status\":\"0\",\"summary\":\"全新的康复训练室和图书阅览室正式投入使用，为老人提供更好的服务。\",\"title\":\"新设施投入使用，服务能力再提升\",\"updateBy\":\"\",\"updateTime\":\"2025-09-24 15:03:25\",\"views\":980}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 15:03:25', 35);
INSERT INTO `sys_oper_log` VALUES (115, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/09/24/3cbd6c2913e74f79bd27d1fed153f544.jpg\",\"code\":200}', 0, NULL, '2025-09-24 15:18:41', 22);
INSERT INTO `sys_oper_log` VALUES (116, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"2528557122@qq.com\",\"nickName\":\"四火\",\"params\":{},\"phonenumber\":\"18934400737\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 15:19:06', 16);
INSERT INTO `sys_oper_log` VALUES (117, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 15:19:31', 233);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/news/index\",\"createTime\":\"2025-09-24 12:30:33\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":201,\"menuName\":\"新闻管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":5,\"path\":\"news\",\"perms\":\"website:news:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 16:23:49', 37);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"website/news/index\",\"createTime\":\"2025-09-24 12:30:33\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":201,\"menuName\":\"新闻管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":5,\"path\":\"news\",\"perms\":\"website:news:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 16:25:28', 11);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/news/index\",\"createTime\":\"2025-09-24 12:30:33\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":201,\"menuName\":\"新闻管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":5,\"path\":\"news\",\"perms\":\"website:news:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 16:26:18', 9);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/carousel/index\",\"createTime\":\"2025-09-24 12:30:33\",\"icon\":\"slider\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":200,\"menuName\":\"轮播图管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":5,\"path\":\"carousel\",\"perms\":\"website:carousel:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 16:29:04', 9);
INSERT INTO `sys_oper_log` VALUES (122, '新闻', 1, 'com.ruoyi.web.controller.website.WebsiteNewsController.add()', 'POST', 1, 'admin', '研发部门', '/website/news', '127.0.0.1', '内网IP', '{\"category\":\"nursing-home\",\"content\":\"这是一篇用来测试的文章\",\"createTime\":\"2025-09-24 16:46:16\",\"imageUrl\":\"/profile/upload/2025/09/24/1_20250924164600A001.jpg\",\"isFeatured\":\"N\",\"newsId\":4,\"params\":{},\"remark\":\"测试用\",\"status\":\"0\",\"summary\":\"这是一篇测试的文章\",\"title\":\"测试文章\",\"views\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 16:46:16', 18);
INSERT INTO `sys_oper_log` VALUES (123, '新闻', 2, 'com.ruoyi.web.controller.website.WebsiteNewsController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/news', '127.0.0.1', '内网IP', '{\"category\":\"nursing-home\",\"content\":\"这是一篇用来测试的文章\",\"createBy\":\"\",\"createTime\":\"2025-09-24 16:46:17\",\"imageUrl\":\"/profile/upload/2025/09/24/1_20250924164600A001.jpg\",\"isFeatured\":\"Y\",\"newsId\":4,\"params\":{},\"remark\":\"测试用\",\"status\":\"0\",\"summary\":\"这是一篇测试的文章\",\"title\":\"测试文章\",\"updateBy\":\"\",\"updateTime\":\"2025-09-24 16:48:08\",\"views\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 16:48:08', 7);
INSERT INTO `sys_oper_log` VALUES (124, '新闻', 2, 'com.ruoyi.web.controller.website.WebsiteNewsController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/news', '127.0.0.1', '内网IP', '{\"category\":\"health\",\"content\":\"<p>春季是万物复苏的季节，但也是疾病高发的季节。对于老年人来说，春季养生尤为重要。</p><p><strong>1. 注意保暖</strong><br>春季气温变化大，老人要注意适时增减衣物，避免着凉。</p><p><strong>2. 合理饮食</strong><br>春季应多吃新鲜蔬菜水果，少吃油腻食物，保持饮食清淡。</p><p><strong>3. 适量运动</strong><br>选择适合的运动方式，如散步、太极拳等，增强体质。</p><p><strong>4. 保持心情愉快</strong><br>春季容易情绪波动，要保持心情愉快，多参加社交活动。</p>\",\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"imageUrl\":\"https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80\",\"isFeatured\":\"Y\",\"newsId\":3,\"params\":{},\"remark\":\"健康资讯\",\"status\":\"0\",\"summary\":\"春季是疾病高发季节，了解一些养生小贴士，帮助老人健康度过春季。\",\"title\":\"春季养生小贴士：如何预防春季常见疾病\",\"updateBy\":\"\",\"updateTime\":\"2025-09-24 16:55:25\",\"views\":1560}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 16:55:25', 5);
INSERT INTO `sys_oper_log` VALUES (125, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2025-09-24 17:20:53\",\"cronExpression\":\"0 */1 * * * ?\",\"invokeTarget\":\"ryTask.syncNewsViews\",\"jobGroup\":\"DEFAULT\",\"jobId\":4,\"jobName\":\"新闻阅读量同步\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2025-09-24 17:26:00\",\"params\":{},\"remark\":\"每5分钟同步一次新闻阅读量数据从Redis到MySQL\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 17:25:37', 43);
INSERT INTO `sys_oper_log` VALUES (126, '定时任务', 3, 'com.ruoyi.quartz.controller.SysJobController.remove()', 'DELETE', 1, 'admin', '研发部门', '/monitor/job/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 17:31:28', 43);
INSERT INTO `sys_oper_log` VALUES (127, '定时任务', 3, 'com.ruoyi.quartz.controller.SysJobController.remove()', 'DELETE', 1, 'admin', '研发部门', '/monitor/job/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 17:31:29', 15);
INSERT INTO `sys_oper_log` VALUES (128, '定时任务', 3, 'com.ruoyi.quartz.controller.SysJobController.remove()', 'DELETE', 1, 'admin', '研发部门', '/monitor/job/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 17:31:31', 25);
INSERT INTO `sys_oper_log` VALUES (129, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2025-09-24 17:20:53\",\"cronExpression\":\"0 */1 * * * ?\",\"invokeTarget\":\"ryTask.syncNewsViews\",\"jobGroup\":\"DEFAULT\",\"jobId\":4,\"jobName\":\"新闻阅读量同步到数据库\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2025-09-24 17:32:00\",\"params\":{},\"remark\":\"每5分钟同步一次新闻阅读量数据从Redis到MySQL\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-24 17:31:56', 20);
INSERT INTO `sys_oper_log` VALUES (130, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"25㎡\",\"beds\":\"1张\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"温馨舒适的单人间，配备独立卫生间，适合生活自理的老人居住。\",\"facilityId\":1,\"facilityImages\":[{\"createTime\":\"2025-09-25 09:46:35\",\"facilityId\":1,\"imageId\":7,\"imageUrl\":\"https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 09:46:35\",\"facilityId\":1,\"imageId\":8,\"imageUrl\":\"https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 09:46:35\",\"facilityId\":1,\"imageId\":9,\"imageUrl\":\"https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"标准单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/2_20250925094634A001.jpg\",\"params\":{},\"price\":\"4500元/月\",\"remark\":\"\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 09:46:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 09:46:35', 59);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-09-25 10:02:32\",\"icon\":\"tab\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":202,\"menuName\":\"设施环境\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":5,\"path\":\"facilities\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:06:14', 32);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/room-facilities/index\",\"createTime\":\"2025-09-25 10:02:32\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"房间设施\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":202,\"path\":\"room-facilities\",\"perms\":\"system:facilities:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:06:39', 10);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/public-facilities/index\",\"createTime\":\"2025-09-25 10:02:32\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"公共设施\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":202,\"path\":\"public-facilities\",\"perms\":\"system:facilities:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:06:46', 11);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/safety-facilities/index\",\"createTime\":\"2025-09-25 10:02:32\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"安全设施\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":202,\"path\":\"safety-facilities\",\"perms\":\"system:facilities:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:06:51', 13);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/medical-facilities/index\",\"createTime\":\"2025-09-25 10:02:32\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"医疗设施\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":202,\"path\":\"medical-facilities\",\"perms\":\"system:facilities:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:06:57', 12);
INSERT INTO `sys_oper_log` VALUES (136, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"25㎡\",\"beds\":\"1张\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"温馨舒适的单人间，配备独立卫生间，适合生活自理的老人居住。\",\"facilityId\":1,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:08:23\",\"facilityId\":1,\"imageId\":10,\"imageUrl\":\"https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:08:23\",\"facilityId\":1,\"imageId\":11,\"imageUrl\":\"https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:08:23\",\"facilityId\":1,\"imageId\":12,\"imageUrl\":\"https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"标准单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/2_20250925094634A001.jpg\",\"params\":{},\"price\":\"4500元/月\",\"remark\":\"\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:08:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:08:23', 19);
INSERT INTO `sys_oper_log` VALUES (137, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"25㎡\",\"beds\":\"1张\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"温馨舒适的单人间，配备独立卫生间，适合生活自理的老人居住。\",\"facilityId\":1,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:13:39\",\"facilityId\":1,\"imageId\":13,\"imageUrl\":\"https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:13:39\",\"facilityId\":1,\"imageId\":14,\"imageUrl\":\"https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:13:39\",\"facilityId\":1,\"imageId\":15,\"imageUrl\":\"https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"标准单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",,\\\"测试特色\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/2_20250925094634A001.jpg\",\"params\":{},\"price\":\"4500元/月\",\"remark\":\"\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:13:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:13:39', 24);
INSERT INTO `sys_oper_log` VALUES (138, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"25㎡\",\"beds\":\"1张\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"温馨舒适的单人间，配备独立卫生间，适合生活自理的老人居住。\",\"facilityId\":1,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:14:09\",\"facilityId\":1,\"imageId\":16,\"imageUrl\":\"https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:14:09\",\"facilityId\":1,\"imageId\":17,\"imageUrl\":\"https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:14:09\",\"facilityId\":1,\"imageId\":18,\"imageUrl\":\"https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"标准单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"测试特色\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/2_20250925094634A001.jpg\",\"params\":{},\"price\":\"4500元/月\",\"remark\":\"\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:14:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:14:09', 19);
INSERT INTO `sys_oper_log` VALUES (139, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"25㎡\",\"beds\":\"1张\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"温馨舒适的单人间，配备独立卫生间，适合生活自理的老人居住。\",\"facilityId\":1,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:14:40\",\"facilityId\":1,\"imageId\":19,\"imageUrl\":\"https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:14:40\",\"facilityId\":1,\"imageId\":20,\"imageUrl\":\"https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:14:40\",\"facilityId\":1,\"imageId\":21,\"imageUrl\":\"https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"标准单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"测试特色\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/2_20250925094634A001.jpg\",\"params\":{},\"price\":\"4500元/月\",\"remark\":\"\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:14:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:14:40', 22);
INSERT INTO `sys_oper_log` VALUES (140, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"28㎡\",\"beds\":\"1张\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"专为需要护理的老人设计，配备专业护理设备，提供24小时护理服务。\",\"facilityId\":4,\"facilityImages\":[],\"facilityName\":\"护理房间\",\"facilityType\":\"room\",\"features\":\"[\\\"专业护理床\\\",\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"护理设备\\\"]\",\"floor\":1,\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/4_20250925102049A001.jpg\",\"params\":{},\"price\":\"5500元/月\",\"remark\":\"\",\"roomType\":\"single\",\"sortOrder\":4,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:20:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:20:56', 27);
INSERT INTO `sys_oper_log` VALUES (141, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"25㎡\",\"beds\":\"1张\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"温馨舒适的单人间，配备独立卫生间，适合生活自理的老人居住。\",\"facilityId\":1,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:21:18\",\"facilityId\":1,\"imageId\":22,\"imageUrl\":\"https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:21:18\",\"facilityId\":1,\"imageId\":23,\"imageUrl\":\"https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:21:18\",\"facilityId\":1,\"imageId\":24,\"imageUrl\":\"https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"标准单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"测试特色\\\"]\",\"floor\":2,\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/2_20250925094634A001.jpg\",\"orientation\":\"south\",\"params\":{},\"price\":\"4500元/月\",\"remark\":\"\",\"roomType\":\"single\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:21:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:21:18', 30);
INSERT INTO `sys_oper_log` VALUES (142, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"28㎡\",\"beds\":\"1张\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"专为需要护理的老人设计，配备专业护理设备，提供24小时护理服务。\",\"facilityId\":4,\"facilityImages\":[],\"facilityName\":\"护理房间\",\"facilityType\":\"room\",\"features\":\"[\\\"专业护理床\\\",\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"护理设备\\\"]\",\"floor\":1,\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/4_20250925102049A001.jpg\",\"orientation\":\"south\",\"params\":{},\"price\":\"5500元/月\",\"remark\":\"\",\"roomType\":\"single\",\"sortOrder\":4,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:24:19\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:24:19', 10);
INSERT INTO `sys_oper_log` VALUES (143, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"25㎡\",\"beds\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"温馨舒适的单人间，配备独立卫生间，适合生活自理的老人居住。\",\"facilityId\":1,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:27:39\",\"facilityId\":1,\"imageId\":25,\"imageUrl\":\"https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:27:39\",\"facilityId\":1,\"imageId\":26,\"imageUrl\":\"https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:27:39\",\"facilityId\":1,\"imageId\":27,\"imageUrl\":\"https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"标准单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"测试特色\\\"]\",\"floor\":2,\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/2_20250925094634A001.jpg\",\"orientation\":\"south\",\"params\":{},\"price\":\"5000元/月\",\"remark\":\"单人间\",\"roomType\":\"single\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:27:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:27:39', 53);
INSERT INTO `sys_oper_log` VALUES (144, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"25㎡\",\"beds\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"温馨舒适的单人间，配备独立卫生间，适合生活自理的老人居住。\",\"facilityId\":1,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:30:13\",\"facilityId\":1,\"imageId\":28,\"imageUrl\":\"https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:30:13\",\"facilityId\":1,\"imageId\":29,\"imageUrl\":\"https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:30:13\",\"facilityId\":1,\"imageId\":30,\"imageUrl\":\"https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"标准单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"测试特色\\\"]\",\"floor\":2,\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/2_20250925094634A001.jpg\",\"orientation\":\"south\",\"params\":{},\"price\":\"5000元/月\",\"remark\":\"单人间\",\"roomType\":\"single\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:30:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:30:13', 30);
INSERT INTO `sys_oper_log` VALUES (145, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"25㎡\",\"beds\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"温馨舒适的单人间，配备独立卫生间，适合生活自理的老人居住。\",\"facilityId\":1,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:30:26\",\"facilityId\":1,\"imageId\":31,\"imageUrl\":\"https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:30:26\",\"facilityId\":1,\"imageId\":32,\"imageUrl\":\"https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:30:26\",\"facilityId\":1,\"imageId\":33,\"imageUrl\":\"https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"标准单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"测试特色\\\"]\",\"floor\":2,\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/2_20250925094634A001.jpg,/profile/upload/2025/09/25/1_20250925103024A002.jpg\",\"orientation\":\"south\",\"params\":{},\"price\":\"5000元/月\",\"remark\":\"单人间\",\"roomType\":\"single\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:30:26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:30:26', 24);
INSERT INTO `sys_oper_log` VALUES (146, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"25㎡\",\"beds\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"温馨舒适的单人间，配备独立卫生间，适合生活自理的老人居住。\",\"facilityId\":1,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:30:46\",\"facilityId\":1,\"imageId\":34,\"imageUrl\":\"https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:30:46\",\"facilityId\":1,\"imageId\":35,\"imageUrl\":\"https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:30:46\",\"facilityId\":1,\"imageId\":36,\"imageUrl\":\"https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"标准单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"测试特色\\\"]\",\"floor\":2,\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/1_20250925103024A002.jpg\",\"orientation\":\"south\",\"params\":{},\"price\":\"5000元/月\",\"remark\":\"单人间\",\"roomType\":\"single\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:30:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:30:46', 25);
INSERT INTO `sys_oper_log` VALUES (147, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"25㎡\",\"beds\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"温馨舒适的单人间，配备独立卫生间，适合生活自理的老人居住。\",\"facilityId\":1,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:37:07\",\"facilityId\":1,\"imageId\":37,\"imageUrl\":\"https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:37:07\",\"facilityId\":1,\"imageId\":38,\"imageUrl\":\"https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:37:07\",\"facilityId\":1,\"imageId\":39,\"imageUrl\":\"https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"标准单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"测试特色\\\"]\",\"floor\":2,\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/1_20250925103024A002.jpg,/profile/upload/2025/09/25/1-1_20250925103659A003.jpg,/profile/upload/2025/09/25/1-2_20250925103706A004.jpg\",\"orientation\":\"south\",\"params\":{},\"price\":\"5000元/月\",\"remark\":\"单人间\",\"roomType\":\"single\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:37:07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:37:07', 28);
INSERT INTO `sys_oper_log` VALUES (148, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"60\",\"beds\":\"1张\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"宽敞豪华的单人间，配备独立客厅和卫生间，为老人提供更舒适的居住环境。\",\"facilityId\":2,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:38:29\",\"facilityId\":2,\"imageId\":40,\"imageUrl\":\"https://images.unsplash.com/photo-1559757148-5c350d0d3c56?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:38:29\",\"facilityId\":2,\"imageId\":41,\"imageUrl\":\"https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:38:29\",\"facilityId\":2,\"imageId\":42,\"imageUrl\":\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"豪华单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立客厅\\\",\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"阳台\\\"，\\\"一对一管家服务\\\"]\",\"floor\":1,\"iconClass\":\"\",\"imageUrl\":\"https://images.unsplash.com/photo-1559757148-5c350d0d3c56?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"orientation\":\"south\",\"params\":{},\"price\":\"8000元/月\",\"remark\":\"\",\"roomType\":\"single\",\"sortOrder\":2,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:38:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:38:29', 32);
INSERT INTO `sys_oper_log` VALUES (149, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"60\",\"beds\":\"1张\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"宽敞豪华的单人间，配备独立客厅和卫生间，为老人提供更舒适的居住环境。\",\"facilityId\":2,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:38:54\",\"facilityId\":2,\"imageId\":43,\"imageUrl\":\"https://images.unsplash.com/photo-1559757148-5c350d0d3c56?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:38:54\",\"facilityId\":2,\"imageId\":44,\"imageUrl\":\"https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:38:54\",\"facilityId\":2,\"imageId\":45,\"imageUrl\":\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"豪华单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立客厅\\\",\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"阳台\\\",\\\"一对一管家服务\\\"]\",\"floor\":1,\"iconClass\":\"\",\"imageUrl\":\"https://images.unsplash.com/photo-1559757148-5c350d0d3c56?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"orientation\":\"south\",\"params\":{},\"price\":\"8000元/月\",\"remark\":\"\",\"roomType\":\"single\",\"sortOrder\":2,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:38:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:38:54', 26);
INSERT INTO `sys_oper_log` VALUES (150, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"60\",\"beds\":\"1张\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"宽敞豪华的单人间，配备独立客厅和卫生间，为老人提供更舒适的居住环境。\",\"facilityId\":2,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:40:36\",\"facilityId\":2,\"imageId\":46,\"imageUrl\":\"https://images.unsplash.com/photo-1559757148-5c350d0d3c56?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:40:36\",\"facilityId\":2,\"imageId\":47,\"imageUrl\":\"https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:40:36\",\"facilityId\":2,\"imageId\":48,\"imageUrl\":\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"豪华单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立客厅\\\",\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"阳台\\\",\\\"一对一管家服务\\\"]\",\"floor\":1,\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/haohua1_20250925104030A005.jpg,/profile/upload/2025/09/25/haohua2_20250925104033A006.jpg\",\"orientation\":\"south\",\"params\":{},\"price\":\"8000元/月\",\"remark\":\"\",\"roomType\":\"single\",\"sortOrder\":2,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:40:36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:40:36', 21);
INSERT INTO `sys_oper_log` VALUES (151, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"65㎡\",\"beds\":\"1张\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"宽敞豪华的单人间，配备独立客厅和卫生间，为老人提供更舒适的居住环境。\",\"facilityId\":2,\"facilityImages\":[{\"createTime\":\"2025-09-25 10:45:46\",\"facilityId\":2,\"imageId\":49,\"imageUrl\":\"https://images.unsplash.com/photo-1559757148-5c350d0d3c56?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":1},{\"createTime\":\"2025-09-25 10:45:46\",\"facilityId\":2,\"imageId\":50,\"imageUrl\":\"https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":2},{\"createTime\":\"2025-09-25 10:45:46\",\"facilityId\":2,\"imageId\":51,\"imageUrl\":\"https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80\",\"params\":{},\"sortOrder\":3}],\"facilityName\":\"豪华单人间\",\"facilityType\":\"room\",\"features\":\"[\\\"独立客厅\\\",\\\"独立卫生间\\\",\\\"24小时热水\\\",\\\"空调暖气\\\",\\\"有线电视\\\",\\\"紧急呼叫系统\\\",\\\"无障碍设计\\\",\\\"阳台\\\",\\\"一对一管家服务\\\"]\",\"floor\":1,\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/haohua1_20250925104030A005.jpg,/profile/upload/2025/09/25/haohua2_20250925104033A006.jpg\",\"orientation\":\"south\",\"params\":{},\"price\":\"9000元/月\",\"remark\":\"\",\"roomType\":\"single\",\"sortOrder\":2,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 10:45:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 10:45:46', 27);
INSERT INTO `sys_oper_log` VALUES (152, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"\",\"beds\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"宽敞明亮的餐厅，提供营养美味的膳食\",\"facilityId\":5,\"facilityImages\":[],\"facilityName\":\"餐厅\",\"facilityType\":\"public\",\"features\":\"[\\\"营养配餐\\\",\\\"个性化膳食\\\",\\\"用餐协助\\\",\\\"食品安全\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"https://images.unsplash.com/photo-1559757148-5c350d0d3c56?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80,/profile/upload/2025/09/25/canting_20250925120009A001.jpg\",\"params\":{},\"price\":\"\",\"remark\":\"\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 12:00:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 12:00:46', 21);
INSERT INTO `sys_oper_log` VALUES (153, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"\",\"beds\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"宽敞明亮的餐厅，提供营养美味的膳食\",\"facilityId\":5,\"facilityImages\":[],\"facilityName\":\"餐厅\",\"facilityType\":\"public\",\"features\":\"[\\\"营养配餐\\\",\\\"个性化膳食\\\",\\\"用餐协助\\\",\\\"食品安全\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"https://images.unsplash.com/photo-1559757148-5c350d0d3c56?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80,/profile/upload/2025/09/25/canting_20250925120009A001.jpg\",\"params\":{},\"price\":\"\",\"remark\":\"\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 12:05:05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 12:05:05', 11);
INSERT INTO `sys_oper_log` VALUES (154, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"\",\"beds\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"宽敞明亮的餐厅，提供营养美味的膳食\",\"facilityId\":5,\"facilityImages\":[],\"facilityName\":\"餐厅\",\"facilityType\":\"public\",\"features\":\"[\\\"营养配餐\\\",\\\"个性化膳食\\\",\\\"用餐协助\\\",\\\"食品安全\\\",\\\"测试特色\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/canting_20250925120009A001.jpg\",\"params\":{},\"price\":\"\",\"remark\":\"\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 12:08:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 12:08:20', 9);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"website/facility-overview/index\",\"createTime\":\"2025-09-25 12:23:21\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"环境概览管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":5,\"path\":\"facility-overview\",\"perms\":\"website:facility-overview:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 12:24:02', 24);
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2037', '127.0.0.1', '内网IP', '2037', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 12:30:43', 28);
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2044', '127.0.0.1', '内网IP', '2044', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 12:30:45', 15);
INSERT INTO `sys_oper_log` VALUES (158, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"\",\"beds\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"多功能活动室，举办各种文娱活动\",\"facilityId\":6,\"facilityImages\":[],\"facilityName\":\"活动室\",\"facilityType\":\"public\",\"features\":\"[\\\"文娱活动\\\",\\\"社交互动\\\",\\\"兴趣培养\\\",\\\"身心锻炼\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/liaotianshi_20250925130142A001.jpg\",\"params\":{},\"price\":\"\",\"remark\":\"\",\"sortOrder\":2,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 13:01:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 13:01:44', 12);
INSERT INTO `sys_oper_log` VALUES (159, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"\",\"beds\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"专业康复训练设备，促进身体功能恢复\",\"facilityId\":7,\"facilityImages\":[],\"facilityName\":\"康复训练室\",\"facilityType\":\"public\",\"features\":\"[\\\"康复训练\\\",\\\"功能锻炼\\\",\\\"物理治疗\\\",\\\"运动指导\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/anmo_20250925130153A002.jpg\",\"params\":{},\"price\":\"\",\"remark\":\"\",\"sortOrder\":3,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 13:01:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 13:01:54', 8);
INSERT INTO `sys_oper_log` VALUES (160, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"\",\"beds\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"安静的阅读环境，丰富精神生活\",\"facilityId\":8,\"facilityImages\":[],\"facilityName\":\"图书阅览室\",\"facilityType\":\"public\",\"features\":\"[\\\"图书借阅\\\",\\\"安静阅读\\\",\\\"知识学习\\\",\\\"文化交流\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/yuedushi_20250925130203A003.jpg\",\"params\":{},\"price\":\"\",\"remark\":\"\",\"sortOrder\":4,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 13:02:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 13:02:04', 8);
INSERT INTO `sys_oper_log` VALUES (161, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"\",\"beds\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"完善的消防设施，保障消防安全\",\"facilityId\":13,\"facilityImages\":[],\"facilityName\":\"消防设施\",\"facilityType\":\"safety\",\"features\":\"[\\\"烟雾报警\\\",\\\"自动喷淋\\\",\\\"消防通道\\\",\\\"应急照明\\\"]\",\"iconClass\":\"el-icon-timer\",\"imageUrl\":\"\",\"params\":{},\"price\":\"\",\"remark\":\"\",\"sortOrder\":3,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 14:08:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 14:08:37', 25);
INSERT INTO `sys_oper_log` VALUES (162, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"\",\"beds\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"完善的消防设施，保障消防安全\",\"facilityId\":13,\"facilityImages\":[],\"facilityName\":\"消防设施\",\"facilityType\":\"safety\",\"features\":\"[\\\"烟雾报警\\\",\\\"自动喷淋\\\",\\\"消防通道\\\",\\\"应急照明\\\"]\",\"iconClass\":\"el-icon-bell\",\"imageUrl\":\"\",\"params\":{},\"price\":\"\",\"remark\":\"\",\"sortOrder\":3,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 14:14:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 14:14:03', 9);
INSERT INTO `sys_oper_log` VALUES (163, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"\",\"beds\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"全楼无障碍设计，方便老人出行\",\"facilityId\":14,\"facilityImages\":[],\"facilityName\":\"无障碍设计\",\"facilityType\":\"safety\",\"features\":\"[\\\"无障碍通道\\\",\\\"电梯设施\\\",\\\"扶手设计\\\",\\\"轮椅通行\\\"]\",\"iconClass\":\"el-icon-check\",\"imageUrl\":\"\",\"params\":{},\"price\":\"\",\"remark\":\"\",\"sortOrder\":4,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 14:15:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 14:15:33', 9);
INSERT INTO `sys_oper_log` VALUES (164, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"\",\"beds\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"全楼无障碍设计，方便老人出行\",\"facilityId\":14,\"facilityImages\":[],\"facilityName\":\"无障碍设计\",\"facilityType\":\"safety\",\"features\":\"[\\\"无障碍通道\\\",\\\"电梯设施\\\",\\\"扶手设计\\\",\\\"轮椅通行\\\",\\\"测试数据\\\"]\",\"iconClass\":\"el-icon-check\",\"imageUrl\":\"\",\"params\":{},\"price\":\"\",\"remark\":\"\",\"sortOrder\":4,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 14:16:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 14:16:06', 8);
INSERT INTO `sys_oper_log` VALUES (165, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"\",\"beds\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"专业医疗室，配备基本医疗设备\",\"facilityId\":17,\"facilityImages\":[],\"facilityName\":\"医疗室\",\"facilityType\":\"medical\",\"features\":\"[\\\"基本医疗设备\\\",\\\"药品管理\\\",\\\"健康检查\\\",\\\"医疗咨询\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/yiliaoshi_20250925141749A001.jpg\",\"params\":{},\"price\":\"\",\"remark\":\"\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 14:18:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 14:18:01', 8);
INSERT INTO `sys_oper_log` VALUES (166, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"\",\"beds\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"专业药房，管理老人用药\",\"facilityId\":19,\"facilityImages\":[],\"facilityName\":\"药房\",\"facilityType\":\"medical\",\"features\":\"[\\\"药品管理\\\",\\\"用药指导\\\",\\\"药物储存\\\",\\\"用药安全\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/yaofang_20250925160916A001.jpeg\",\"params\":{},\"price\":\"\",\"remark\":\"\",\"sortOrder\":3,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 16:09:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:09:18', 28);
INSERT INTO `sys_oper_log` VALUES (167, '设施管理', 2, 'com.ruoyi.web.controller.website.WebsiteFacilitiesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/facilities', '127.0.0.1', '内网IP', '{\"area\":\"\",\"beds\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:37:24\",\"description\":\"专业康复训练设备，促进身体功能恢复\",\"facilityId\":18,\"facilityImages\":[],\"facilityName\":\"康复训练室\",\"facilityType\":\"medical\",\"features\":\"[\\\"康复设备\\\",\\\"功能训练\\\",\\\"物理治疗\\\",\\\"运动指导\\\"]\",\"iconClass\":\"\",\"imageUrl\":\"/profile/upload/2025/09/25/anmo_20250925160930A002.jpg\",\"params\":{},\"price\":\"\",\"remark\":\"\",\"sortOrder\":2,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-25 16:09:31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:09:31', 13);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/news/index\",\"createTime\":\"2025-09-25 09:43:02\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":201,\"menuName\":\"新闻动态管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":5,\"path\":\"news\",\"perms\":\"website:news:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:24:53', 23);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-09-25 10:02:32\",\"icon\":\"tab\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":202,\"menuName\":\"设施环境管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":5,\"path\":\"facilities\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:25:01', 8);
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2053', '127.0.0.1', '内网IP', '2053', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-09-25 16:38:47', 12);
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2055', '127.0.0.1', '内网IP', '2055', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:38:51', 21);
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2054', '127.0.0.1', '内网IP', '2054', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:38:53', 14);
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2056', '127.0.0.1', '内网IP', '2056', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:39:24', 15);
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2053', '127.0.0.1', '内网IP', '2053', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:39:27', 11);
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设施环境\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":202,\"path\":\"Facilities \",\"routeName\":\"Facilities \",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:42:04', 20);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2025-09-25 16:42:04\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2057,\"menuName\":\"环境特色\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":202,\"path\":\"Facilities \",\"perms\":\"\",\"routeName\":\"Facilities \",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:45:35', 8);
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2025-09-25 16:42:04\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2057,\"menuName\":\"环境特色\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":202,\"path\":\"safety-facilities\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:46:31', 9);
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2025-09-25 16:42:04\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2057,\"menuName\":\"环境特色\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":202,\"path\":\"safety-facilities\",\"perms\":\"system:facilities:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:46:38', 12);
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/medical-facilities/index\",\"createTime\":\"2025-09-25 16:42:04\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2057,\"menuName\":\"环境特色\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":202,\"path\":\"safety-facilities\",\"perms\":\"system:facilities:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:47:01', 9);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/facilities/index\",\"createTime\":\"2025-09-25 16:42:04\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2057,\"menuName\":\"环境特色\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":202,\"path\":\"safety-facilities\",\"perms\":\"system:facilities:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:49:30', 9);
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system\\\\website\\\\environment-features\",\"createTime\":\"2025-09-25 16:42:04\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2057,\"menuName\":\"环境特色\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":202,\"path\":\"safety-facilities\",\"perms\":\"system:facilities:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:51:41', 13);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/environment-features\",\"createTime\":\"2025-09-25 16:42:04\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2057,\"menuName\":\"环境特色\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":202,\"path\":\"safety-facilities\",\"perms\":\"system:facilities:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:52:22', 9);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/environment-features/index\",\"createTime\":\"2025-09-25 16:42:04\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2057,\"menuName\":\"环境特色\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":202,\"path\":\"safety-facilities\",\"perms\":\"system:facilities:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:55:06', 9);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/environment-features/index\",\"createTime\":\"2025-09-25 16:42:04\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2057,\"menuName\":\"环境特色\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":202,\"path\":\"environment-facilities\",\"perms\":\"system:facilities:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:56:30', 8);
INSERT INTO `sys_oper_log` VALUES (185, '环境特色', 3, 'com.ruoyi.web.controller.website.WebsiteEnvironmentFeaturesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/environment-features/7', '127.0.0.1', '内网IP', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:56:52', 11);
INSERT INTO `sys_oper_log` VALUES (186, '环境特色', 3, 'com.ruoyi.web.controller.website.WebsiteEnvironmentFeaturesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/environment-features/14', '127.0.0.1', '内网IP', '[14]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:56:55', 6);
INSERT INTO `sys_oper_log` VALUES (187, '环境特色', 3, 'com.ruoyi.web.controller.website.WebsiteEnvironmentFeaturesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/environment-features/13', '127.0.0.1', '内网IP', '[13]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:57:29', 5);
INSERT INTO `sys_oper_log` VALUES (188, '环境特色', 3, 'com.ruoyi.web.controller.website.WebsiteEnvironmentFeaturesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/environment-features/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:57:33', 6);
INSERT INTO `sys_oper_log` VALUES (189, '环境特色', 3, 'com.ruoyi.web.controller.website.WebsiteEnvironmentFeaturesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/environment-features/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:57:35', 7);
INSERT INTO `sys_oper_log` VALUES (190, '环境特色', 3, 'com.ruoyi.web.controller.website.WebsiteEnvironmentFeaturesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/environment-features/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:57:37', 4);
INSERT INTO `sys_oper_log` VALUES (191, '环境特色', 3, 'com.ruoyi.web.controller.website.WebsiteEnvironmentFeaturesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/environment-features/10', '127.0.0.1', '内网IP', '[10]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:57:39', 5);
INSERT INTO `sys_oper_log` VALUES (192, '环境特色', 3, 'com.ruoyi.web.controller.website.WebsiteEnvironmentFeaturesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/environment-features/4', '127.0.0.1', '内网IP', '[4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:57:41', 7);
INSERT INTO `sys_oper_log` VALUES (193, '环境特色', 3, 'com.ruoyi.web.controller.website.WebsiteEnvironmentFeaturesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/environment-features/17', '127.0.0.1', '内网IP', '[17]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:57:43', 5);
INSERT INTO `sys_oper_log` VALUES (194, '环境特色', 3, 'com.ruoyi.web.controller.website.WebsiteEnvironmentFeaturesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/environment-features/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:57:45', 7);
INSERT INTO `sys_oper_log` VALUES (195, '环境特色', 3, 'com.ruoyi.web.controller.website.WebsiteEnvironmentFeaturesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/environment-features/18', '127.0.0.1', '内网IP', '[18]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:57:47', 4);
INSERT INTO `sys_oper_log` VALUES (196, '环境特色', 3, 'com.ruoyi.web.controller.website.WebsiteEnvironmentFeaturesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/environment-features/12', '127.0.0.1', '内网IP', '[12]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:57:48', 4);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2025-09-25 17:11:46\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2058,\"menuName\":\"服务项目管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":5,\"path\":\"services\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:15:54', 26);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"website/main-services/index\",\"createTime\":\"2025-09-25 17:11:46\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2059,\"menuName\":\"主要服务项目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2058,\"path\":\"main-services\",\"perms\":\"system:main-services:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:16:06', 11);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/main-services/index\",\"createTime\":\"2025-09-25 17:11:46\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2059,\"menuName\":\"主要服务项目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2058,\"path\":\"main-services\",\"perms\":\"system:main-services:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:16:43', 14);
INSERT INTO `sys_oper_log` VALUES (200, '主要服务项目', 2, 'com.ruoyi.web.controller.website.WebsiteMainServicesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/main-services', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-25 17:11:46\",\"params\":{},\"remark\":\"\",\"serviceDescription\":\"24小时专业护理，包括日常起居、饮食照料、个人卫生等全方位生活服务。测试\",\"serviceFeatures\":\"[\\\"日常起居照料\\\",\\\"个人卫生护理\\\",\\\"衣物清洗\\\",\\\"房间整理\\\",\\\"安全监护\\\",\\\"测试\\\"]\",\"serviceIcon\":\"el-icon-user-solid\",\"serviceId\":1,\"servicePrice\":\"3000-5000元/月测试\",\"serviceTitle\":\"生活照料测试\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:18:44', 11);
INSERT INTO `sys_oper_log` VALUES (201, '主要服务项目', 2, 'com.ruoyi.web.controller.website.WebsiteMainServicesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/main-services', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-25 17:11:46\",\"params\":{},\"remark\":\"\",\"serviceDescription\":\"24小时专业护理，包括日常起居、饮食照料、个人卫生等全方位生活服务。测试\",\"serviceFeatures\":\"[\\\"日常起居照料\\\",\\\"个人卫生护理\\\",\\\"衣物清洗\\\",\\\"房间整理\\\",\\\"安全监护\\\"]\",\"serviceIcon\":\"el-icon-user-solid\",\"serviceId\":1,\"servicePrice\":\"3000-5000元/月\",\"serviceTitle\":\"生活照料\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:18:59', 7);
INSERT INTO `sys_oper_log` VALUES (202, '主要服务项目', 1, 'com.ruoyi.web.controller.website.WebsiteMainServicesController.add()', 'POST', 1, 'admin', '研发部门', '/website/main-services', '127.0.0.1', '内网IP', '{\"params\":{},\"serviceDescription\":\"这是一个测试的服务\",\"serviceFeatures\":\"[\\\"这是一个测试服务\\\",\\\"这是一个测试服务\\\",\\\"这是一个测试服务\\\",\\\"这是一个测试服务\\\",\\\"这是一个测试服务\\\"]\",\"serviceIcon\":\"el-icon-location\",\"serviceId\":7,\"servicePrice\":\"99999元/起\",\"serviceTitle\":\"这是一个测试标题\",\"sortOrder\":7,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:19:46', 9);
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"医疗护理服务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2058,\"path\":\"s\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:30:01', 27);
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/medical-facilities/index\",\"createTime\":\"2025-09-25 17:30:01\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"医疗护理服务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2058,\"path\":\"medical-facilities\",\"perms\":\"system:medical-facilities:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:30:55', 15);
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/medical-facilities/index\",\"createTime\":\"2025-09-25 17:30:01\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"医疗护理服务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2058,\"path\":\"medical-facilities\",\"perms\":\"system:medical-facilities:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:31:04', 11);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/medical-services/index\",\"createTime\":\"2025-09-25 17:30:01\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"医疗护理服务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2058,\"path\":\"medical-services\",\"perms\":\"system:medical-services:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:34:22', 10);
INSERT INTO `sys_oper_log` VALUES (207, '医疗护理服务', 2, 'com.ruoyi.web.controller.website.WebsiteMedicalServicesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/medical-services', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-25 17:24:07\",\"params\":{},\"remark\":\"\",\"serviceDescription\":\"定期进行全面的健康检查，包括血压、血糖、心电图等常规检查。\",\"serviceIcon\":\"el-icon-user-solid\",\"serviceId\":1,\"serviceStaff\":\"专业护士\",\"serviceTime\":\"每日监测\",\"serviceTitle\":\"健康检查\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:35:49', 10);
INSERT INTO `sys_oper_log` VALUES (208, '医疗护理服务', 2, 'com.ruoyi.web.controller.website.WebsiteMedicalServicesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/medical-services', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-25 17:24:07\",\"params\":{},\"remark\":\"\",\"serviceDescription\":\"专业医护人员负责药物分发、服用监督和药物效果监测。\",\"serviceIcon\":\"el-icon-water-cup\",\"serviceId\":2,\"serviceStaff\":\"执业药师\",\"serviceTime\":\"按时服药\",\"serviceTitle\":\"药物管理\",\"sortOrder\":2,\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:36:43', 6);
INSERT INTO `sys_oper_log` VALUES (209, '医疗护理服务', 2, 'com.ruoyi.web.controller.website.WebsiteMedicalServicesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/medical-services', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-25 17:24:07\",\"params\":{},\"remark\":\"\",\"serviceDescription\":\"针对不同身体状况制定个性化康复训练计划，促进身体功能恢复。\",\"serviceIcon\":\"el-icon-refresh\",\"serviceId\":3,\"serviceStaff\":\"康复治疗师\",\"serviceTime\":\"18:00-19:00\",\"serviceTitle\":\"康复训练\",\"sortOrder\":3,\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:37:15', 7);
INSERT INTO `sys_oper_log` VALUES (210, '医疗护理服务', 2, 'com.ruoyi.web.controller.website.WebsiteMedicalServicesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/medical-services', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-25 17:24:07\",\"params\":{},\"remark\":\"\",\"serviceDescription\":\"专业医护人员负责药物分发、服用监督和药物效果监测。\",\"serviceIcon\":\"el-icon-water-cup\",\"serviceId\":2,\"serviceStaff\":\"执业药师\",\"serviceTime\":\"按需、按时、按量服药\",\"serviceTitle\":\"药物管理\",\"sortOrder\":2,\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:37:38', 6);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"生活照料服务\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2058,\"path\":\"是\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:47:24', 33);
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/care-services/index\",\"createTime\":\"2025-09-25 17:47:24\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2061,\"menuName\":\"生活照料服务\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2058,\"path\":\"care-services\",\"perms\":\"system:care-services:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:48:00', 15);
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/main-services/index\",\"createTime\":\"2025-09-25 17:11:46\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2059,\"menuName\":\"主要服务项目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2058,\"path\":\"main-services\",\"perms\":\"system:main-services:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 17:57:02', 9);
INSERT INTO `sys_oper_log` VALUES (214, '生活照料服务', 2, 'com.ruoyi.web.controller.website.WebsiteCareServicesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/care-services', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-25 17:40:31\",\"params\":{},\"remark\":\"\",\"serviceDescription\":\"提供营养午餐，安排午休时间。测试\",\"serviceFeatures\":\"[\\\"营养午餐\\\",\\\"午休安排\\\",\\\"环境调节\\\",\\\"安全监护\\\"]\",\"serviceId\":5,\"serviceTime\":\"12:00-14:00\",\"serviceTitle\":\"午餐休息测试\",\"sortOrder\":5,\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 09:37:45', 20);
INSERT INTO `sys_oper_log` VALUES (215, '生活照料服务', 1, 'com.ruoyi.web.controller.website.WebsiteCareServicesController.add()', 'POST', 1, 'admin', '研发部门', '/website/care-services', '127.0.0.1', '内网IP', '{\"params\":{},\"serviceDescription\":\"测试服务\",\"serviceFeatures\":\"[\\\"测试服务\\\",\\\"测试服务\\\",\\\"测试服务\\\"]\",\"serviceId\":10,\"serviceTime\":\"0:00-12:00\",\"serviceTitle\":\"测试服务\",\"sortOrder\":10,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 09:38:14', 10);
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"文娱活动服务\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2058,\"path\":\"x\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 09:48:23', 26);
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/entertainment-services/index\",\"createTime\":\"2025-09-26 09:48:23\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2063,\"menuName\":\"文娱活动服务\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2058,\"path\":\"entertainment-services\",\"perms\":\"system:entertainment-services:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 09:49:05', 12);
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2062', '127.0.0.1', '内网IP', '2062', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 09:52:02', 19);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/entertainment-services/index\",\"createTime\":\"2025-09-26 09:48:23\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2063,\"menuName\":\"文娱活动服务\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2058,\"path\":\"entertainment-services\",\"perms\":\"system:entertainment-services:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 09:52:26', 10);
INSERT INTO `sys_oper_log` VALUES (220, '文娱活动服务', 2, 'com.ruoyi.web.controller.website.WebsiteEntertainmentServicesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/entertainment-services', '127.0.0.1', '内网IP', '{\"activityDescription\":\"学习传统书法，修身养性\",\"activityId\":1,\"activityImage\":\"\",\"activityLocation\":\"文化活动室\",\"activityName\":\"书法练习\",\"activityTime\":\"每周二、四 9:00-10:30\",\"categoryIcon\":\"el-icon-edit\",\"categoryId\":1,\"categoryName\":\"文化艺术\",\"createBy\":\"admin\",\"createTime\":\"2025-09-26 09:46:55\",\"params\":{},\"remark\":\"\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-26 09:53:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 09:53:02', 19);
INSERT INTO `sys_oper_log` VALUES (221, '文娱活动服务', 2, 'com.ruoyi.web.controller.website.WebsiteEntertainmentServicesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/entertainment-services', '127.0.0.1', '内网IP', '{\"activityDescription\":\"学习传统书法，修身养性\",\"activityId\":1,\"activityImage\":\"\",\"activityLocation\":\"文化活动室\",\"activityName\":\"书法练习\",\"activityTime\":\"每周二、四 9:00-10:30\",\"categoryIcon\":\"el-icon-edit\",\"categoryId\":1,\"categoryName\":\"文化艺术测试\",\"createBy\":\"admin\",\"createTime\":\"2025-09-26 09:46:55\",\"params\":{},\"remark\":\"\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-26 09:56:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 09:56:24', 8);
INSERT INTO `sys_oper_log` VALUES (222, '文娱活动服务', 2, 'com.ruoyi.web.controller.website.WebsiteEntertainmentServicesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/entertainment-services', '127.0.0.1', '内网IP', '{\"activityDescription\":\"学习传统书法，修身养性\",\"activityId\":1,\"activityImage\":\"\",\"activityLocation\":\"文化活动室\",\"activityName\":\"书法练习\",\"activityTime\":\"每周二、四 9:00-10:30\",\"categoryIcon\":\"el-icon-goods\",\"categoryId\":5,\"categoryName\":\"手工制作\",\"createBy\":\"admin\",\"createTime\":\"2025-09-26 10:06:04\",\"params\":{},\"remark\":\"\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-26 10:10:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:10:00', 7);
INSERT INTO `sys_oper_log` VALUES (223, '文娱活动服务', 2, 'com.ruoyi.web.controller.website.WebsiteEntertainmentServicesController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/entertainment-services', '127.0.0.1', '内网IP', '{\"activityDescription\":\"测试\",\"activityId\":10,\"activityImage\":\"\",\"activityLocation\":\"测试\",\"activityName\":\"测试\",\"activityTime\":\"每日 19:00-20:00\",\"categoryIcon\":\"el-icon-music\",\"categoryId\":4,\"categoryName\":\"音乐舞蹈\",\"createBy\":\"admin\",\"createTime\":\"2025-09-26 10:06:04\",\"params\":{},\"remark\":\"\",\"sortOrder\":1,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-26 10:10:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:10:44', 5);
INSERT INTO `sys_oper_log` VALUES (224, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/nutrition-services/index\",\"createTime\":\"2025-09-26 10:16:30\",\"icon\":\"fullscreen\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2065,\"menuName\":\"营养膳食管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2058,\"path\":\"nutrition-services\",\"perms\":\"website:nutrition:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:22:07', 22);
INSERT INTO `sys_oper_log` VALUES (225, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":100,\"email\":\"26546@qq.com\",\"nickName\":\"测试人员\",\"params\":{},\"phonenumber\":\"18934400737\",\"postIds\":[4],\"remark\":\"测试\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"csyh\"}', '{\"msg\":\"新增用户\'csyh\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2025-09-26 10:23:27', 12);
INSERT INTO `sys_oper_log` VALUES (226, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"26546@qq.com\",\"nickName\":\"测试人员\",\"params\":{},\"phonenumber\":\"18934400730\",\"postIds\":[4],\"remark\":\"测试\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"csyh\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:23:36', 124);
INSERT INTO `sys_oper_log` VALUES (227, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"智慧养老院\",\"email\":\"yly@qq.com\",\"leader\":\"王院长\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:27:21', 22);
INSERT INTO `sys_oper_log` VALUES (228, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"贵州总公司\",\"email\":\"ry@qq.com\",\"leader\":\"李院长\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"智慧养老院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:27:44', 27);
INSERT INTO `sys_oper_log` VALUES (229, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2025-09-26 10:27:55', 4);
INSERT INTO `sys_oper_log` VALUES (230, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/108', '127.0.0.1', '内网IP', '108', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:27:58', 15);
INSERT INTO `sys_oper_log` VALUES (231, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '109', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:28:01', 23);
INSERT INTO `sys_oper_log` VALUES (232, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:28:03', 14);
INSERT INTO `sys_oper_log` VALUES (233, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '105', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2025-09-26 10:28:16', 8);
INSERT INTO `sys_oper_log` VALUES (234, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-23 15:32:08\",\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postId\":1,\"postName\":\"院长\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:28:32', 21);
INSERT INTO `sys_oper_log` VALUES (235, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-23 15:32:08\",\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postId\":2,\"postName\":\"副院长\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:28:42', 10);
INSERT INTO `sys_oper_log` VALUES (236, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-23 15:32:08\",\"flag\":false,\"params\":{},\"postCode\":\"hr\",\"postId\":3,\"postName\":\"医生\",\"postSort\":3,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:28:50', 10);
INSERT INTO `sys_oper_log` VALUES (237, '营养膳食特色', 1, 'com.ruoyi.web.controller.website.WebsiteNutritionFeaturesController.add()', 'POST', 1, 'admin', '研发部门', '/website/nutrition-features', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-09-26 10:29:47\",\"featureDescription\":\"测试\",\"featureIcon\":\"el-icon-star-on\",\"featureId\":5,\"featureTitle\":\"测试\",\"params\":{},\"sortOrder\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:29:47', 12);
INSERT INTO `sys_oper_log` VALUES (238, '今日菜单', 1, 'com.ruoyi.web.controller.website.WebsiteNutritionMenuController.add()', 'POST', 1, 'admin', '研发部门', '/website/nutrition-menu', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-09-26 10:31:00\",\"mealName\":\"测试\",\"mealTime\":\"8:00-9:00\",\"menuDishes\":\"[{\\\"name\\\":\\\"测试\\\",\\\"nutrition\\\":\\\"蛋白质，果糖\\\"},{\\\"name\\\":\\\"测试2\\\",\\\"nutrition\\\":\\\"维生素，牛肉\\\"}]\",\"menuId\":4,\"params\":{},\"sortOrder\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 10:31:00', 8);
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/consultation/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2100,\"menuName\":\"咨询管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":5,\"path\":\"consultation\",\"perms\":\"website:consultation:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 11:25:39', 24);
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/consultation/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2100,\"menuName\":\"咨询管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":5,\"path\":\"consultation\",\"perms\":\"website:consultation:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 11:27:14', 10);
INSERT INTO `sys_oper_log` VALUES (241, '回复咨询', 2, 'com.ruoyi.web.controller.website.WebsiteConsultationController.reply()', 'POST', 1, 'admin', '研发部门', '/website/consultation/reply', '127.0.0.1', '内网IP', '{\"consultationId\":1,\"message\":\"请问这个是需要什么条件吗？\",\"params\":{},\"replyContent\":\"具体情况而定哦\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 11:30:25', 19);
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"website/appointment/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"calendar\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2200,\"menuName\":\"预约管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":5,\"path\":\"appointment\",\"perms\":\"website:appointment:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 11:47:20', 33);
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"website/appointment/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2200,\"menuName\":\"预约管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":5,\"path\":\"appointment\",\"perms\":\"website:appointment:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 11:47:49', 9);
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/appointment/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2200,\"menuName\":\"预约管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":5,\"path\":\"appointment\",\"perms\":\"website:appointment:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 11:49:09', 10);
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/appointment/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2200,\"menuName\":\"预约管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":5,\"path\":\"appointment\",\"perms\":\"website:appointment:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 11:53:54', 11);
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/appointment/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2200,\"menuName\":\"在线预约管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":5,\"path\":\"appointment\",\"perms\":\"website:appointment:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 11:56:53', 10);
INSERT INTO `sys_oper_log` VALUES (247, '取消预约', 2, 'com.ruoyi.web.controller.website.WebsiteAppointmentController.cancel()', 'POST', 1, 'admin', '研发部门', '/website/appointment/cancel', '127.0.0.1', '内网IP', '{\"appointmentId\":2,\"appointmentTime\":\"2025-09-26 11:58:23\",\"cancelReason\":\"不允许\",\"name\":\"测试人员\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 11:59:08', 10);
INSERT INTO `sys_oper_log` VALUES (248, '确认预约', 2, 'com.ruoyi.web.controller.website.WebsiteAppointmentController.confirm()', 'POST', 1, 'admin', '研发部门', '/website/appointment/confirm', '127.0.0.1', '内网IP', '{\"appointmentId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 11:59:24', 8);
INSERT INTO `sys_oper_log` VALUES (249, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-09-23 15:32:08\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[5,200,2000,2001,2002,2003,2004,2100,2101,2102,2103,2104,201,2010,2011,2012,2013,2014,2200,2201,2202,2203,2204,2205,202,2020,2021,2022,2023,2024,2057,2058,2059,2060,2061,2063,2065],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 12:15:19', 48);
INSERT INTO `sys_oper_log` VALUES (250, '轮播图', 2, 'com.ruoyi.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'csyh', '智慧养老院', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":1,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"为每一位老人提供最贴心的养老服务\",\"imageUrl\":\"/profile/upload/2025/09/26/liaotianshi_20250926121713A001.jpg\",\"linkUrl\":\"/website/appointment\",\"params\":{},\"remark\":\"首页轮播图1\",\"sortOrder\":1,\"status\":\"0\",\"title\":\"温馨的家，专业的爱\",\"updateBy\":\"\",\"updateTime\":\"2025-09-26 12:17:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 12:17:14', 16);
INSERT INTO `sys_oper_log` VALUES (251, '轮播图', 2, 'com.ruoyi.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'csyh', '智慧养老院', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":3,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"各种文娱活动，让晚年生活更加精彩\",\"imageUrl\":\"/profile/upload/2025/09/26/canting_20250926121723A002.jpg\",\"linkUrl\":\"/website/activities\",\"params\":{},\"remark\":\"首页轮播图3\",\"sortOrder\":3,\"status\":\"0\",\"title\":\"丰富多彩的老年生活\",\"updateBy\":\"\",\"updateTime\":\"2025-09-26 12:17:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 12:17:25', 5);
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2400,\"menuName\":\"业务管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"business\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 13:37:36', 21);
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/elderly-info/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2300,\"menuName\":\"老人信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2400,\"path\":\"elderly-info\",\"perms\":\"website:elderly:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 13:37:45', 12);
INSERT INTO `sys_oper_log` VALUES (254, '老人信息', 1, 'com.ruoyi.web.controller.website.WebsiteElderlyInfoController.add()', 'POST', 1, 'admin', '研发部门', '/website/elderly', '127.0.0.1', '内网IP', '{\"admissionDate\":\"2025-09-26\",\"allergies\":\"对水果过敏\",\"bedNumber\":\"3\",\"birthDate\":\"1981-03-05\",\"careLevel\":\"自理\",\"createTime\":\"2025-09-26 13:55:29\",\"elderlyName\":\"测试老人\",\"emergencyContact\":\"王测试\",\"emergencyPhone\":\"18963344657\",\"gender\":\"0\",\"healthStatus\":\"良好\",\"idCard\":\"522121200102160214\",\"medicalHistory\":\"高血压\",\"medications\":\"测试\",\"params\":{},\"phone\":\"189655445874\",\"photoUrl\":\"/profile/upload/2025/09/26/1_20250926135500A001.jpg\",\"roomNumber\":\"A123\",\"specialNotes\":\"测试\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\r\n### The error may exist in file [H:\\java项目\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\WebsiteElderlyInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.WebsiteElderlyInfoMapper.insertWebsiteElderlyInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into website_elderly_info          ( elderly_name,             gender,             birth_date,             id_card,             phone,             room_number,             bed_number,             admission_date,             health_status,             care_level,             emergency_contact,             emergency_phone,             medical_history,             allergies,             medications,             special_notes,             photo_url,             status,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\n; Data truncation: Data too long for column \'phone\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1', '2025-09-26 13:55:29', 91);
INSERT INTO `sys_oper_log` VALUES (255, '老人信息', 1, 'com.ruoyi.web.controller.website.WebsiteElderlyInfoController.add()', 'POST', 1, 'admin', '研发部门', '/website/elderly', '127.0.0.1', '内网IP', '{\"admissionDate\":\"2025-09-26\",\"allergies\":\"对水果过敏\",\"bedNumber\":\"3\",\"birthDate\":\"1981-03-05\",\"careLevel\":\"自理\",\"createTime\":\"2025-09-26 13:55:59\",\"elderlyId\":4,\"elderlyName\":\"测试老人\",\"emergencyContact\":\"王测试\",\"emergencyPhone\":\"18934400737\",\"gender\":\"0\",\"healthStatus\":\"良好\",\"idCard\":\"522121200102160214\",\"medicalHistory\":\"高血压\",\"medications\":\"测试\",\"params\":{},\"phone\":\"18934400737\",\"photoUrl\":\"/profile/upload/2025/09/26/1_20250926135500A001.jpg\",\"roomNumber\":\"A123\",\"specialNotes\":\"测试\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 13:55:59', 15);
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/health-report/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"document\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2210,\"menuName\":\"健康报告管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2400,\"path\":\"health-report\",\"perms\":\"website:health:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 14:16:36', 31);
INSERT INTO `sys_oper_log` VALUES (257, '健康报告', 5, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.export()', 'POST', 1, 'admin', '研发部门', '/website/healthReport/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-26 14:16:55', 1514);
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/health-report/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2210,\"menuName\":\"健康报告管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2400,\"path\":\"health-report\",\"perms\":\"website:health:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 14:17:13', 19);
INSERT INTO `sys_oper_log` VALUES (259, '健康报告', 1, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.add()', 'POST', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"attachments\":\"测试\",\"bloodOxygen\":98,\"bloodPressure\":\"130/80\",\"bloodSugar\":5.2,\"createTime\":\"2025-09-26 14:41:31\",\"diagnosis\":\"风大吹感冒了\",\"doctorName\":\"测试\",\"elderlyId\":4,\"elderlyName\":\"测试老人\",\"heartRate\":70,\"height\":171,\"medications\":\"每日按时吃\",\"nextCheckDate\":\"2025-09-27\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"测试\",\"remark\":\"测试\",\"reportDate\":\"2025-09-26\",\"reportId\":4,\"reportType\":\"护理\",\"status\":\"0\",\"symptoms\":\"头痛\",\"temperature\":37,\"treatment\":\"保守治疗，吃药\",\"vitalSigns\":\"测试\",\"weight\":660}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 14:41:31', 35);
INSERT INTO `sys_oper_log` VALUES (260, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/fee-query/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2310,\"menuName\":\"费用查询管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2400,\"path\":\"fee-query\",\"perms\":\"website:fee:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:24:47', 52);
INSERT INTO `sys_oper_log` VALUES (261, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":4,\"elderlyName\":\"测试老人\",\"endDate\":\"2025-09-26\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":6,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 15:29:27\",\"queryType\":\"monthly\",\"startDate\":\"2025-09-26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:29:27', 28);
INSERT INTO `sys_oper_log` VALUES (262, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/6', '127.0.0.1', '内网IP', '6', '{\"msg\":\"成功生成 3 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 15:30:07', 29);
INSERT INTO `sys_oper_log` VALUES (263, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/3', '127.0.0.1', '内网IP', '3', '{\"msg\":\"成功生成 47 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 15:30:47', 73);
INSERT INTO `sys_oper_log` VALUES (264, '费用查询', 3, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeQuery/6', '127.0.0.1', '内网IP', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:37:35', 32);
INSERT INTO `sys_oper_log` VALUES (265, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":4,\"elderlyName\":\"测试老人\",\"endDate\":\"2025-09-26\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":7,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 15:38:36\",\"queryType\":\"yearly\",\"startDate\":\"2025-09-20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:38:36', 22);
INSERT INTO `sys_oper_log` VALUES (266, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/7', '127.0.0.1', '内网IP', '7', '{\"msg\":\"成功生成 21 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 15:38:41', 50);
INSERT INTO `sys_oper_log` VALUES (267, '老人信息', 1, 'com.ruoyi.web.controller.website.WebsiteElderlyInfoController.add()', 'POST', 1, 'admin', '研发部门', '/website/elderlyInfo', '127.0.0.1', '内网IP', '{\"admissionDate\":\"2025-09-26\",\"allergies\":\"测试\",\"bedNumber\":\"2\",\"birthDate\":\"2025-09-18\",\"careLevel\":\"自理\",\"createTime\":\"2025-09-26 15:40:39\",\"elderlyId\":5,\"elderlyName\":\"测试二号老人\",\"emergencyContact\":\"王某\",\"emergencyPhone\":\"19985606231\",\"gender\":\"0\",\"healthStatus\":\"良好\",\"idCard\":\"522121200102160215\",\"medicalHistory\":\"测试\",\"medications\":\"测试\",\"params\":{},\"phone\":\"18963322323\",\"photoUrl\":\"/profile/upload/2025/09/26/yuedushi_20250926154018A001.jpg\",\"roomNumber\":\"A12\",\"specialNotes\":\"测试\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:40:39', 17);
INSERT INTO `sys_oper_log` VALUES (268, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":5,\"elderlyName\":\"测试二号老人\",\"endDate\":\"2025-09-26\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":8,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 15:41:20\",\"queryType\":\"yearly\",\"startDate\":\"2025-09-26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:41:20', 7);
INSERT INTO `sys_oper_log` VALUES (269, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/8', '127.0.0.1', '内网IP', '8', '{\"msg\":\"成功生成 4 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 15:41:23', 24);
INSERT INTO `sys_oper_log` VALUES (270, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.send()', 'PUT', 1, 'admin', '研发部门', '/website/feeQuery/send/8', '127.0.0.1', '内网IP', '8', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:42:39', 16);
INSERT INTO `sys_oper_log` VALUES (271, '费用查询', 3, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeQuery/8', '127.0.0.1', '内网IP', '[8]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:45:10', 12);
INSERT INTO `sys_oper_log` VALUES (272, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":5,\"elderlyName\":\"测试二号老人\",\"endDate\":\"2025-09-27\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":9,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 15:45:27\",\"queryType\":\"yearly\",\"remark\":\"测试\",\"startDate\":\"2025-09-19\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:45:27', 5);
INSERT INTO `sys_oper_log` VALUES (273, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/9', '127.0.0.1', '内网IP', '9', '{\"msg\":\"成功生成 28 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 15:45:31', 36);
INSERT INTO `sys_oper_log` VALUES (274, '费用查询', 3, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeQuery/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:46:01', 12);
INSERT INTO `sys_oper_log` VALUES (275, '费用查询', 3, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeQuery/7', '127.0.0.1', '内网IP', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:50:30', 29);
INSERT INTO `sys_oper_log` VALUES (276, '费用查询', 3, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeQuery/4,2,5,3,1', '127.0.0.1', '内网IP', '[4,2,5,3,1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:50:41', 38);
INSERT INTO `sys_oper_log` VALUES (277, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"elderlyId\":5,\"feeAmount\":500,\"feeDate\":\"2025-09-01\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费用\",\"feeType\":\"room\",\"isPaid\":\"0\",\"params\":{},\"remark\":\"测试\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'query_id\' doesn\'t have a default value\r\n### The error may exist in file [H:\\java项目\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\WebsiteFeeDetailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.WebsiteFeeDetailMapper.insertWebsiteFeeDetail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into website_fee_detail          ( elderly_id,             fee_type,             fee_name,             fee_amount,             fee_date,             fee_month,             is_paid,                                       remark )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'query_id\' doesn\'t have a default value\n; Field \'query_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'query_id\' doesn\'t have a default value', '2025-09-26 15:51:52', 100);
INSERT INTO `sys_oper_log` VALUES (278, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":26,\"elderlyId\":5,\"feeAmount\":500,\"feeDate\":\"2025-09-01\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"0\",\"params\":{},\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:58:16', 28);
INSERT INTO `sys_oper_log` VALUES (279, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":5,\"elderlyName\":\"测试二号老人\",\"endDate\":\"2025-09-26\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":6,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 15:58:28\",\"queryType\":\"yearly\",\"remark\":\"测试\",\"startDate\":\"2025-09-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:58:28', 17);
INSERT INTO `sys_oper_log` VALUES (280, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/6', '127.0.0.1', '内网IP', '6', '{\"msg\":\"成功生成 1 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 15:58:32', 30);
INSERT INTO `sys_oper_log` VALUES (281, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":27,\"elderlyId\":5,\"feeAmount\":500,\"feeDate\":\"2025-09-01\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试\",\"feeType\":\"room\",\"isPaid\":\"0\",\"params\":{},\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:59:18', 10);
INSERT INTO `sys_oper_log` VALUES (282, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":5,\"elderlyName\":\"测试二号老人\",\"endDate\":\"2025-09-26\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":7,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 15:59:32\",\"queryType\":\"yearly\",\"remark\":\"测试\",\"startDate\":\"2025-09-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 15:59:32', 7);
INSERT INTO `sys_oper_log` VALUES (283, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/7', '127.0.0.1', '内网IP', '7', '{\"msg\":\"成功生成 2 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 15:59:37', 19);
INSERT INTO `sys_oper_log` VALUES (284, '老人信息', 1, 'com.ruoyi.web.controller.website.WebsiteElderlyInfoController.add()', 'POST', 1, 'admin', '研发部门', '/website/elderlyInfo', '127.0.0.1', '内网IP', '{\"admissionDate\":\"2025-09-26\",\"allergies\":\"测试\",\"bedNumber\":\"1\",\"birthDate\":\"2025-09-26\",\"careLevel\":\"自理\",\"createTime\":\"2025-09-26 16:05:45\",\"elderlyName\":\"测试老人一号\",\"emergencyContact\":\"王某\",\"emergencyPhone\":\"18963322365\",\"gender\":\"0\",\"healthStatus\":\"良好\",\"idCard\":\"522121200102160216\",\"medicalHistory\":\"测试\",\"medications\":\"测试\",\"params\":{},\"phone\":\"189633322156\",\"photoUrl\":\"/profile/upload/2025/09/26/canting_20250926160539A001.jpg\",\"roomNumber\":\"A1\",\"specialNotes\":\"测试\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\r\n### The error may exist in file [H:\\java项目\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\WebsiteElderlyInfoMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.WebsiteElderlyInfoMapper.insertWebsiteElderlyInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into website_elderly_info          ( elderly_name,             gender,             birth_date,             id_card,             phone,             room_number,             bed_number,             admission_date,             health_status,             care_level,             emergency_contact,             emergency_phone,             medical_history,             allergies,             medications,             special_notes,             photo_url,             status,                          create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\n; Data truncation: Data too long for column \'phone\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1', '2025-09-26 16:05:45', 77);
INSERT INTO `sys_oper_log` VALUES (285, '老人信息', 1, 'com.ruoyi.web.controller.website.WebsiteElderlyInfoController.add()', 'POST', 1, 'admin', '研发部门', '/website/elderlyInfo', '127.0.0.1', '内网IP', '{\"admissionDate\":\"2025-09-26\",\"allergies\":\"测试\",\"bedNumber\":\"1\",\"birthDate\":\"2025-09-26\",\"careLevel\":\"自理\",\"createTime\":\"2025-09-26 16:06:02\",\"elderlyId\":6,\"elderlyName\":\"测试老人一号\",\"emergencyContact\":\"王某\",\"emergencyPhone\":\"18963322365\",\"gender\":\"0\",\"healthStatus\":\"良好\",\"idCard\":\"522121200102160216\",\"medicalHistory\":\"测试\",\"medications\":\"测试\",\"params\":{},\"phone\":\"18936655987\",\"photoUrl\":\"/profile/upload/2025/09/26/canting_20250926160539A001.jpg\",\"roomNumber\":\"A1\",\"specialNotes\":\"测试\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:06:02', 6);
INSERT INTO `sys_oper_log` VALUES (286, '老人信息', 1, 'com.ruoyi.web.controller.website.WebsiteElderlyInfoController.add()', 'POST', 1, 'admin', '研发部门', '/website/elderlyInfo', '127.0.0.1', '内网IP', '{\"admissionDate\":\"2025-09-26\",\"allergies\":\"测试\",\"bedNumber\":\"3\",\"birthDate\":\"2025-09-09\",\"careLevel\":\"自理\",\"createTime\":\"2025-09-26 16:07:24\",\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"emergencyContact\":\"王大炮\",\"emergencyPhone\":\"18936655474\",\"gender\":\"1\",\"healthStatus\":\"良好\",\"idCard\":\"522121200102130365\",\"medicalHistory\":\"测试\",\"medications\":\"测试\",\"params\":{},\"phone\":\"17385646523\",\"photoUrl\":\"/profile/upload/2025/09/26/yuedushi_20250926160719A002.jpg\",\"roomNumber\":\"B2\",\"specialNotes\":\"测试\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:07:24', 6);
INSERT INTO `sys_oper_log` VALUES (287, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":28,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-01\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 10);
INSERT INTO `sys_oper_log` VALUES (288, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":30,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-02\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 11);
INSERT INTO `sys_oper_log` VALUES (289, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":29,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-03\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 11);
INSERT INTO `sys_oper_log` VALUES (290, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":31,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-04\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 9);
INSERT INTO `sys_oper_log` VALUES (291, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":32,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-05\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 10);
INSERT INTO `sys_oper_log` VALUES (292, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":33,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-06\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 9);
INSERT INTO `sys_oper_log` VALUES (293, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":34,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-07\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 15);
INSERT INTO `sys_oper_log` VALUES (294, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":35,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-08\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 15);
INSERT INTO `sys_oper_log` VALUES (295, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":36,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-09\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 16);
INSERT INTO `sys_oper_log` VALUES (296, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":37,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-12\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 9);
INSERT INTO `sys_oper_log` VALUES (297, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":38,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-10\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 11);
INSERT INTO `sys_oper_log` VALUES (298, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":39,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-11\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 11);
INSERT INTO `sys_oper_log` VALUES (299, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":40,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-13\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 10);
INSERT INTO `sys_oper_log` VALUES (300, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":42,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-14\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 11);
INSERT INTO `sys_oper_log` VALUES (301, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":41,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-15\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 11);
INSERT INTO `sys_oper_log` VALUES (302, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":45,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-16\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 24);
INSERT INTO `sys_oper_log` VALUES (303, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":43,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-18\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 22);
INSERT INTO `sys_oper_log` VALUES (304, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":44,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-17\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 23);
INSERT INTO `sys_oper_log` VALUES (305, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":46,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-19\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 26);
INSERT INTO `sys_oper_log` VALUES (306, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":47,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-20\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 7);
INSERT INTO `sys_oper_log` VALUES (307, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":48,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-21\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 8);
INSERT INTO `sys_oper_log` VALUES (308, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":49,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-22\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 7);
INSERT INTO `sys_oper_log` VALUES (309, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":50,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-23\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 7);
INSERT INTO `sys_oper_log` VALUES (310, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":51,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-24\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 8);
INSERT INTO `sys_oper_log` VALUES (311, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":52,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-25\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 6);
INSERT INTO `sys_oper_log` VALUES (312, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":53,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-26\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"wechat\",\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:03', 6);
INSERT INTO `sys_oper_log` VALUES (313, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":6,\"elderlyName\":\"测试老人一号\",\"endDate\":\"2025-09-26\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":8,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 16:08:15\",\"queryType\":\"yearly\",\"remark\":\"测试\",\"startDate\":\"2025-09-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:08:15', 5);
INSERT INTO `sys_oper_log` VALUES (314, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/8', '127.0.0.1', '内网IP', '8', '{\"msg\":\"生成费用明细失败\",\"code\":500}', 0, NULL, '2025-09-26 16:08:18', 14);
INSERT INTO `sys_oper_log` VALUES (315, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/8', '127.0.0.1', '内网IP', '8', '{\"msg\":\"生成费用明细失败\",\"code\":500}', 0, NULL, '2025-09-26 16:08:51', 13);
INSERT INTO `sys_oper_log` VALUES (316, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"endDate\":\"2025-09-26\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":9,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 16:09:06\",\"queryType\":\"yearly\",\"remark\":\"测试\",\"startDate\":\"2025-09-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:09:06', 5);
INSERT INTO `sys_oper_log` VALUES (317, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/9', '127.0.0.1', '内网IP', '9', '{\"msg\":\"成功生成 1 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 16:09:12', 21);
INSERT INTO `sys_oper_log` VALUES (318, '费用查询', 3, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeQuery/8', '127.0.0.1', '内网IP', '[8]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:12:57', 13);
INSERT INTO `sys_oper_log` VALUES (319, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/fee-detail/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2320,\"menuName\":\"费用明细管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2400,\"path\":\"fee-detail\",\"perms\":\"website:feeDetail:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:18:33', 42);
INSERT INTO `sys_oper_log` VALUES (320, '费用明细', 3, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeDetail/53,52,51,50,49,48,47,46,43,44', '127.0.0.1', '内网IP', '[53,52,51,50,49,48,47,46,43,44]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:21:08', 13);
INSERT INTO `sys_oper_log` VALUES (321, '费用明细', 3, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeDetail/45,41,42,40,37,39,38,36,35,34', '127.0.0.1', '内网IP', '[45,41,42,40,37,39,38,36,35,34]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:21:15', 10);
INSERT INTO `sys_oper_log` VALUES (322, '费用明细', 3, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeDetail/33,32,31,29,30,28', '127.0.0.1', '内网IP', '[33,32,31,29,30,28]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:21:18', 8);
INSERT INTO `sys_oper_log` VALUES (323, '费用查询', 3, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeQuery/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:21:22', 12);
INSERT INTO `sys_oper_log` VALUES (324, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":54,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-01\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:21:48', 22);
INSERT INTO `sys_oper_log` VALUES (325, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"endDate\":\"2025-09-26\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":10,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 16:22:26\",\"queryType\":\"yearly\",\"remark\":\"测试\",\"startDate\":\"2025-09-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:22:26', 14);
INSERT INTO `sys_oper_log` VALUES (326, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/10', '127.0.0.1', '内网IP', '10', '{\"msg\":\"成功生成 1 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 16:22:28', 32);
INSERT INTO `sys_oper_log` VALUES (327, '费用查询', 3, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeQuery/10', '127.0.0.1', '内网IP', '[10]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:24:36', 16);
INSERT INTO `sys_oper_log` VALUES (328, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"endDate\":\"2025-09-26\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":11,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 16:25:28\",\"queryType\":\"yearly\",\"remark\":\"测试\",\"startDate\":\"2025-09-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:25:28', 138);
INSERT INTO `sys_oper_log` VALUES (329, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/11', '127.0.0.1', '内网IP', '11', '{\"msg\":\"成功生成 1 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 16:25:30', 35);
INSERT INTO `sys_oper_log` VALUES (330, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-09-23 15:32:08\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2400,2300,2301,2302,2303,2304,2305,2210,2211,2212,2213,2214,2215,2310,2311,2312,2313,2314,2315,2316,2317,2320,2321,2322,2323,2324,2325,2326],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:28:12', 40);
INSERT INTO `sys_oper_log` VALUES (331, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":55,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-01\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"0\",\"params\":{},\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:30:44', 28);
INSERT INTO `sys_oper_log` VALUES (332, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":56,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-03\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"0\",\"params\":{},\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:30:44', 28);
INSERT INTO `sys_oper_log` VALUES (333, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":57,\"elderlyId\":7,\"feeAmount\":500,\"feeDate\":\"2025-09-02\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"0\",\"params\":{},\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:30:44', 28);
INSERT INTO `sys_oper_log` VALUES (334, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"endDate\":\"2025-09-26\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":12,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 16:30:57\",\"queryType\":\"yearly\",\"remark\":\"测试\",\"startDate\":\"2025-09-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:30:57', 18);
INSERT INTO `sys_oper_log` VALUES (335, '费用查询', 3, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeQuery/11', '127.0.0.1', '内网IP', '[11]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:31:00', 13);
INSERT INTO `sys_oper_log` VALUES (336, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/12', '127.0.0.1', '内网IP', '12', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'elderly_id\' in where clause is ambiguous\r\n### The error may exist in file [H:\\java项目\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\WebsiteFeeDetailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.WebsiteFeeDetailMapper.selectWebsiteFeeDetailList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select f.detail_id, f.query_id, f.elderly_id, f.fee_type, f.fee_name, f.fee_amount, f.fee_date, f.fee_month, f.is_paid, f.paid_date, f.payment_method, f.remark, f.create_by, f.create_time, f.update_by, f.update_time,                e.elderly_name         from website_fee_detail f         left join website_elderly_info e on f.elderly_id = e.elderly_id                WHERE  elderly_id = ?          order by fee_date desc\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'elderly_id\' in where clause is ambiguous\n; Column \'elderly_id\' in where clause is ambiguous; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'elderly_id\' in where clause is ambiguous', '2025-09-26 16:31:01', 96);
INSERT INTO `sys_oper_log` VALUES (337, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/12', '127.0.0.1', '内网IP', '12', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'elderly_id\' in where clause is ambiguous\r\n### The error may exist in file [H:\\java项目\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\WebsiteFeeDetailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.WebsiteFeeDetailMapper.selectWebsiteFeeDetailList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select f.detail_id, f.query_id, f.elderly_id, f.fee_type, f.fee_name, f.fee_amount, f.fee_date, f.fee_month, f.is_paid, f.paid_date, f.payment_method, f.remark, f.create_by, f.create_time, f.update_by, f.update_time,                e.elderly_name         from website_fee_detail f         left join website_elderly_info e on f.elderly_id = e.elderly_id                WHERE  elderly_id = ?          order by fee_date desc\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'elderly_id\' in where clause is ambiguous\n; Column \'elderly_id\' in where clause is ambiguous; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'elderly_id\' in where clause is ambiguous', '2025-09-26 16:31:41', 10);
INSERT INTO `sys_oper_log` VALUES (338, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/12', '127.0.0.1', '内网IP', '12', '{\"msg\":\"成功生成 4 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 16:35:14', 51);
INSERT INTO `sys_oper_log` VALUES (339, '费用明细', 3, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeDetail/56,57,54,55', '127.0.0.1', '内网IP', '[56,57,54,55]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:42:52', 22);
INSERT INTO `sys_oper_log` VALUES (340, '费用查询', 3, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeQuery/12', '127.0.0.1', '内网IP', '[12]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:42:54', 12);
INSERT INTO `sys_oper_log` VALUES (341, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":58,\"elderlyId\":7,\"endDate\":\"2025-09-04\",\"feeAmount\":500,\"feeDate\":\"2025-09-01\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试床位费\",\"feeType\":\"room\",\"isPaid\":\"0\",\"params\":{},\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:43:11', 21);
INSERT INTO `sys_oper_log` VALUES (342, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.addFeeDetail()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/detail', '127.0.0.1', '内网IP', '{\"detailId\":59,\"elderlyId\":7,\"endDate\":\"2025-09-03\",\"feeAmount\":1200,\"feeDate\":\"2025-09-01\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试餐饮费\",\"feeType\":\"meal\",\"isPaid\":\"0\",\"params\":{},\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:43:39', 9);
INSERT INTO `sys_oper_log` VALUES (343, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"endDate\":\"2025-09-26\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":13,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 16:43:57\",\"queryType\":\"yearly\",\"remark\":\"测试\",\"startDate\":\"2025-09-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:43:57', 18);
INSERT INTO `sys_oper_log` VALUES (344, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/13', '127.0.0.1', '内网IP', '13', '{\"msg\":\"成功生成 2 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 16:44:00', 33);
INSERT INTO `sys_oper_log` VALUES (345, '费用明细', 2, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"detailId\":58,\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"cash\",\"updateBy\":\"admin\",\"updateTime\":\"2025-09-26 16:44:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:44:24', 7);
INSERT INTO `sys_oper_log` VALUES (346, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"endDate\":\"2025-09-26\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":14,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 16:45:30\",\"queryType\":\"yearly\",\"startDate\":\"2025-09-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:45:30', 5);
INSERT INTO `sys_oper_log` VALUES (347, '费用查询', 3, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeQuery/13', '127.0.0.1', '内网IP', '[13]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:47:03', 22);
INSERT INTO `sys_oper_log` VALUES (348, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/14', '127.0.0.1', '内网IP', '14', '{\"msg\":\"成功生成 2 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 16:47:07', 29);
INSERT INTO `sys_oper_log` VALUES (349, '费用查询', 1, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery', '127.0.0.1', '内网IP', '{\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"endDate\":\"2025-09-26\",\"params\":{},\"queryBy\":\"admin\",\"queryId\":15,\"queryStatus\":\"0\",\"queryTime\":\"2025-09-26 16:49:37\",\"queryType\":\"yearly\",\"remark\":\"测试\",\"startDate\":\"2025-09-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:49:37', 27);
INSERT INTO `sys_oper_log` VALUES (350, '费用明细', 2, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"detailId\":59,\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"cash\",\"updateBy\":\"admin\",\"updateTime\":\"2025-09-26 16:50:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:50:03', 17);
INSERT INTO `sys_oper_log` VALUES (351, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/14', '127.0.0.1', '内网IP', '14', '{\"msg\":\"成功生成 2 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 16:50:10', 32);
INSERT INTO `sys_oper_log` VALUES (352, '费用明细', 2, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"detailId\":58,\"isPaid\":\"0\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2025-09-26 16:53:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 16:53:39', 8);
INSERT INTO `sys_oper_log` VALUES (353, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/14', '127.0.0.1', '内网IP', '14', '{\"msg\":\"成功生成 2 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 16:53:44', 29);
INSERT INTO `sys_oper_log` VALUES (354, '费用明细', 2, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-09-26 16:43:39\",\"detailId\":59,\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"endDate\":\"2025-09-03\",\"feeAmount\":1200,\"feeDate\":\"2025-09-01\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试餐饮费\",\"feeType\":\"meal\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"params\":{},\"paymentMethod\":\"bank\",\"remark\":\"测试\",\"updateBy\":\"admin\",\"updateTime\":\"2025-09-26 17:02:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 17:02:08', 7);
INSERT INTO `sys_oper_log` VALUES (355, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/14', '127.0.0.1', '内网IP', '14', '{\"msg\":\"成功生成 2 条费用明细\",\"code\":200}', 0, NULL, '2025-09-26 17:02:12', 28);
INSERT INTO `sys_oper_log` VALUES (356, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/feedback/index\",\"createTime\":\"2025-09-26 17:08:41\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2330,\"menuName\":\"意见反馈管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2400,\"path\":\"feedback\",\"perms\":\"website:feedback:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 17:18:45', 38);
INSERT INTO `sys_oper_log` VALUES (357, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/fee-detail/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2320,\"menuName\":\"费用明细管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2400,\"path\":\"fee-detail\",\"perms\":\"website:feeDetail:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 17:18:51', 9);
INSERT INTO `sys_oper_log` VALUES (358, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/feedback/index\",\"createTime\":\"2025-09-26 17:08:41\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2330,\"menuName\":\"意见反馈管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2400,\"path\":\"feedback\",\"perms\":\"website:feedback:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 17:18:56', 11);
INSERT INTO `sys_oper_log` VALUES (359, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/fee-query/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2310,\"menuName\":\"费用查询管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2400,\"path\":\"fee-query\",\"perms\":\"website:fee:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 17:19:12', 10);
INSERT INTO `sys_oper_log` VALUES (360, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/feedback/index\",\"createTime\":\"2025-09-26 17:08:41\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2330,\"menuName\":\"意见反馈管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2400,\"path\":\"feedback\",\"perms\":\"website:feedback:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 17:19:15', 11);
INSERT INTO `sys_oper_log` VALUES (361, '意见反馈', 2, 'com.ruoyi.web.controller.website.WebsiteFeedbackController.process()', 'PUT', 1, 'admin', '研发部门', '/website/feedback/process', '127.0.0.1', '内网IP', '{\"feedbackId\":1,\"feedbackStatus\":\"1\",\"params\":{},\"processBy\":\"admin\",\"processTime\":\"2025-09-26 17:21:58\",\"updateTime\":\"2025-09-26 17:21:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 17:21:58', 37);
INSERT INTO `sys_oper_log` VALUES (362, '意见反馈', 2, 'com.ruoyi.web.controller.website.WebsiteFeedbackController.process()', 'PUT', 1, 'admin', '研发部门', '/website/feedback/process', '127.0.0.1', '内网IP', '{\"feedbackId\":4,\"feedbackStatus\":\"1\",\"params\":{},\"processBy\":\"admin\",\"processTime\":\"2025-09-26 17:22:03\",\"updateTime\":\"2025-09-26 17:22:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 17:22:03', 6);
INSERT INTO `sys_oper_log` VALUES (363, '意见反馈', 3, 'com.ruoyi.web.controller.website.WebsiteFeedbackController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feedback/4', '127.0.0.1', '内网IP', '[4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-26 17:23:56', 9);
INSERT INTO `sys_oper_log` VALUES (364, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/family-user/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3001,\"menuName\":\"家属用户\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":3000,\"path\":\"family-user\",\"perms\":\"website:family:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 11:09:03', 34);
INSERT INTO `sys_oper_log` VALUES (365, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/family-user/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3001,\"menuName\":\"家属用户\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3000,\"path\":\"family-user\",\"perms\":\"website:family:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 11:11:00', 8);
INSERT INTO `sys_oper_log` VALUES (366, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/family-user/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3001,\"menuName\":\"家属用户\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3000,\"path\":\"family-user\",\"perms\":\"website:family:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 11:16:17', 9);
INSERT INTO `sys_oper_log` VALUES (367, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/family-relation/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3007,\"menuName\":\"关系管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":3000,\"path\":\"family-relation\",\"perms\":\"website:relation:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 11:16:23', 9);
INSERT INTO `sys_oper_log` VALUES (368, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 11:43:01', 32);
INSERT INTO `sys_oper_log` VALUES (369, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/10', '127.0.0.1', '内网IP', '[10]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 11:43:22', 8);
INSERT INTO `sys_oper_log` VALUES (370, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/11', '127.0.0.1', '内网IP', '[11]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-09-29 11:55:51', 3);
INSERT INTO `sys_oper_log` VALUES (371, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/12', '127.0.0.1', '内网IP', '[12]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 12:06:29', 28);
INSERT INTO `sys_oper_log` VALUES (372, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/13', '127.0.0.1', '内网IP', '[13]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 12:09:21', 24);
INSERT INTO `sys_oper_log` VALUES (373, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/14', '127.0.0.1', '内网IP', '[14]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 12:09:49', 8);
INSERT INTO `sys_oper_log` VALUES (374, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/15', '127.0.0.1', '内网IP', '[15]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 12:12:50', 8);
INSERT INTO `sys_oper_log` VALUES (375, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/16', '127.0.0.1', '内网IP', '[16]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 12:16:25', 14);
INSERT INTO `sys_oper_log` VALUES (376, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/17', '127.0.0.1', '内网IP', '[17]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 12:17:12', 10);
INSERT INTO `sys_oper_log` VALUES (377, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/18', '127.0.0.1', '内网IP', '[18]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 12:19:03', 24);
INSERT INTO `sys_oper_log` VALUES (378, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/19', '127.0.0.1', '内网IP', '[19]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 12:20:20', 8);
INSERT INTO `sys_oper_log` VALUES (379, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/20', '127.0.0.1', '内网IP', '[20]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 12:23:37', 13);
INSERT INTO `sys_oper_log` VALUES (380, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/21', '127.0.0.1', '内网IP', '[21]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 12:25:13', 14);
INSERT INTO `sys_oper_log` VALUES (381, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/23', '127.0.0.1', '内网IP', '[23]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 12:31:24', 18);
INSERT INTO `sys_oper_log` VALUES (382, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/22', '127.0.0.1', '内网IP', '[22]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 12:31:25', 5);
INSERT INTO `sys_oper_log` VALUES (383, '家属用户', 3, 'com.ruoyi.web.controller.website.WebsiteFamilyUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/family/24', '127.0.0.1', '内网IP', '[24]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 12:32:36', 6);
INSERT INTO `sys_oper_log` VALUES (384, '审核家属老人关系', 2, 'com.ruoyi.web.controller.website.WebsiteFamilyElderlyRelationController.auditRelation()', 'POST', 1, 'admin', '研发部门', '/website/relation/audit', '127.0.0.1', '内网IP', '{\"relationId\":\"9\",\"bindStatus\":\"1\"}', '{\"msg\":\"审核通过成功\",\"code\":200}', 0, NULL, '2025-09-29 12:40:39', 9);
INSERT INTO `sys_oper_log` VALUES (385, '老人信息', 2, 'com.ruoyi.web.controller.website.WebsiteElderlyInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/elderlyInfo', '127.0.0.1', '内网IP', '{\"admissionDate\":\"2025-09-29\",\"allergies\":\"无\",\"bedNumber\":\"1\",\"birthDate\":\"1950-01-01\",\"careLevel\":\"自理\",\"createBy\":\"admin\",\"createTime\":\"2025-09-29 11:45:15\",\"elderlyId\":8,\"elderlyName\":\"张大爷\",\"emergencyContact\":\"张小明\",\"emergencyPhone\":\"13900139000\",\"gender\":\"0\",\"healthStatus\":\"良好\",\"idCard\":\"110101195001011234\",\"medicalHistory\":\"无重大疾病\",\"medications\":\"无\",\"params\":{},\"phone\":\"13800138000\",\"photoUrl\":\"https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200\",\"remark\":\"测试老人数据\",\"roomNumber\":\"A103\",\"specialNotes\":\"身体健康，生活自理\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-29 13:16:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 13:16:37', 26);
INSERT INTO `sys_oper_log` VALUES (386, '老人信息', 2, 'com.ruoyi.web.controller.website.WebsiteElderlyInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/elderlyInfo', '127.0.0.1', '内网IP', '{\"admissionDate\":\"2025-09-29\",\"allergies\":\"无\",\"bedNumber\":\"1\",\"birthDate\":\"1950-01-01\",\"careLevel\":\"半自理\",\"createBy\":\"admin\",\"createTime\":\"2025-09-29 11:45:15\",\"elderlyId\":8,\"elderlyName\":\"张大爷\",\"emergencyContact\":\"张小明\",\"emergencyPhone\":\"13900139000\",\"gender\":\"0\",\"healthStatus\":\"良好\",\"idCard\":\"110101195001011234\",\"medicalHistory\":\"无重大疾病\",\"medications\":\"无\",\"params\":{},\"phone\":\"13800138000\",\"photoUrl\":\"https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200\",\"remark\":\"测试老人数据\",\"roomNumber\":\"A103\",\"specialNotes\":\"身体健康，生活自理\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-29 13:45:47\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 13:45:47', 22);
INSERT INTO `sys_oper_log` VALUES (387, '健康报告', 3, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/healthReport/7', '127.0.0.1', '内网IP', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 14:31:14', 27);
INSERT INTO `sys_oper_log` VALUES (388, '健康报告', 3, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/healthReport/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 14:31:22', 14);
INSERT INTO `sys_oper_log` VALUES (389, '健康报告', 3, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/healthReport/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 14:31:23', 8);
INSERT INTO `sys_oper_log` VALUES (390, '健康报告', 3, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/healthReport/8', '127.0.0.1', '内网IP', '[8]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 14:31:25', 8);
INSERT INTO `sys_oper_log` VALUES (391, '健康报告', 1, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.add()', 'POST', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"130/80\",\"bloodSugar\":6.3,\"createTime\":\"2025-09-29 14:35:25\",\"diagnosis\":\"测试\",\"doctorName\":\"测试\",\"elderlyId\":8,\"elderlyName\":\"张大爷\",\"heartRate\":72,\"height\":170,\"medications\":\"测试\",\"nextCheckDate\":\"2025-09-30\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"测试\",\"reportDate\":\"2025-09-29\",\"reportId\":10,\"reportType\":\"护理\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":37,\"treatment\":\"测试\",\"vitalSigns\":\"测试\",\"weight\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 14:35:25', 23);
INSERT INTO `sys_oper_log` VALUES (392, '健康报告', 3, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/healthReport/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 14:38:48', 6);
INSERT INTO `sys_oper_log` VALUES (393, '健康报告', 1, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.add()', 'POST', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"130/80\",\"bloodSugar\":6.3,\"createTime\":\"2025-09-29 14:39:41\",\"diagnosis\":\"测试\",\"doctorName\":\"测试\",\"elderlyId\":8,\"elderlyName\":\"张大爷\",\"heartRate\":72,\"height\":170,\"medications\":\"测试\",\"nextCheckDate\":\"2025-09-11\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"测试\",\"reportDate\":\"2025-09-25\",\"reportId\":11,\"reportType\":\"医疗\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":36,\"treatment\":\"测试\",\"vitalSigns\":\"测试\",\"weight\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 14:39:41', 8);
INSERT INTO `sys_oper_log` VALUES (394, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/family-communication/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3100,\"menuName\":\"沟通管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":3000,\"path\":\"family-communication\",\"perms\":\"website:communication:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 15:25:31', 46);
INSERT INTO `sys_oper_log` VALUES (395, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/family-communication/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3100,\"menuName\":\"沟通管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":3000,\"path\":\"family-communication\",\"perms\":\"website:communication:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 15:30:27', 9);
INSERT INTO `sys_oper_log` VALUES (396, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/family-communication/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3100,\"menuName\":\"沟通管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":3000,\"path\":\"family-communication\",\"perms\":\"website:communication:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 15:37:44', 10);
INSERT INTO `sys_oper_log` VALUES (397, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/family-communication/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3100,\"menuName\":\"沟通管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":3000,\"path\":\"family-communication\",\"perms\":\"website:communication:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 15:38:25', 7);
INSERT INTO `sys_oper_log` VALUES (398, '网站沟通消息', 3, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/communication/1,2,3,4,5,6,7,8,9,10', '127.0.0.1', '内网IP', '[1,2,3,4,5,6,7,8,9,10]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 15:47:29', 15);
INSERT INTO `sys_oper_log` VALUES (399, '网站沟通消息', 3, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/communication/11,12,13,14,15', '127.0.0.1', '内网IP', '[11,12,13,14,15]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 15:47:33', 6);
INSERT INTO `sys_oper_log` VALUES (400, '网站沟通消息', 1, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.add()', 'POST', 1, 'admin', '研发部门', '/website/communication', '127.0.0.1', '内网IP', '{\"content\":\"今天状态还可以\",\"createTime\":\"2025-09-29 15:47:54\",\"elderlyId\":8,\"familyId\":25,\"isRead\":\"0\",\"messageId\":17,\"messageType\":\"text\",\"params\":{},\"sendTime\":\"2025-09-29 15:47:54\",\"senderName\":\"admin\",\"senderType\":\"staff\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 15:47:54', 22);
INSERT INTO `sys_oper_log` VALUES (401, '网站沟通消息', 2, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/communication', '127.0.0.1', '内网IP', '{\"content\":\"老人今天状态怎么样？\",\"createTime\":\"2025-09-29 15:47:39\",\"elderlyId\":8,\"familyId\":25,\"isRead\":\"1\",\"messageId\":16,\"messageType\":\"text\",\"params\":{},\"sendTime\":\"2025-09-29 15:47:39\",\"senderName\":\"王燚\",\"senderType\":\"family\",\"status\":\"0\",\"updateTime\":\"2025-09-29 15:55:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 15:55:46', 9);
INSERT INTO `sys_oper_log` VALUES (402, '网站沟通消息', 1, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.add()', 'POST', 1, 'admin', '研发部门', '/website/communication', '127.0.0.1', '内网IP', '{\"content\":\"有的，\",\"createTime\":\"2025-09-29 16:06:32\",\"elderlyId\":8,\"familyId\":25,\"isRead\":\"0\",\"messageId\":19,\"messageType\":\"text\",\"params\":{},\"sendTime\":\"2025-09-29 16:06:32\",\"senderName\":\"admin\",\"senderType\":\"staff\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 16:06:33', 7);
INSERT INTO `sys_oper_log` VALUES (403, '网站沟通消息', 1, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.add()', 'POST', 1, 'admin', '研发部门', '/website/communication', '127.0.0.1', '内网IP', '{\"content\":\"你听我仔细给你说\",\"createTime\":\"2025-09-29 16:32:17\",\"elderlyId\":8,\"familyId\":25,\"isRead\":\"0\",\"messageId\":21,\"messageType\":\"text\",\"params\":{},\"sendTime\":\"2025-09-29 16:32:17\",\"senderName\":\"admin\",\"senderType\":\"staff\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 16:32:17', 32);
INSERT INTO `sys_oper_log` VALUES (404, '网站沟通消息', 5, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.export()', 'POST', 1, 'admin', '研发部门', '/website/communication/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-29 16:33:01', 1214);
INSERT INTO `sys_oper_log` VALUES (405, '网站沟通消息', 1, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.add()', 'POST', 1, 'admin', '研发部门', '/website/communication', '127.0.0.1', '内网IP', '{\"content\":\"还可以\",\"createTime\":\"2025-09-29 16:35:44\",\"elderlyId\":7,\"familyId\":26,\"isRead\":\"0\",\"messageId\":23,\"messageType\":\"text\",\"params\":{},\"sendTime\":\"2025-09-29 16:35:44\",\"senderName\":\"admin\",\"senderType\":\"staff\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 16:35:44', 6);
INSERT INTO `sys_oper_log` VALUES (406, '网站沟通消息', 3, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/communication/21', '127.0.0.1', '内网IP', '[21]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 16:42:38', 10);
INSERT INTO `sys_oper_log` VALUES (407, '网站沟通消息', 3, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/communication/19', '127.0.0.1', '内网IP', '[19]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 16:42:38', 16);
INSERT INTO `sys_oper_log` VALUES (408, '网站沟通消息', 3, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/communication/17', '127.0.0.1', '内网IP', '[17]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 16:42:38', 22);
INSERT INTO `sys_oper_log` VALUES (409, '网站沟通消息', 3, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/communication/18', '127.0.0.1', '内网IP', '[18]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 16:42:38', 27);
INSERT INTO `sys_oper_log` VALUES (410, '网站沟通消息', 3, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/communication/16', '127.0.0.1', '内网IP', '[16]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 16:42:38', 31);
INSERT INTO `sys_oper_log` VALUES (411, '网站沟通消息', 3, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/communication/20', '127.0.0.1', '内网IP', '[20]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 16:42:38', 41);
INSERT INTO `sys_oper_log` VALUES (412, '网站沟通消息', 1, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.add()', 'POST', 1, 'admin', '研发部门', '/website/communication', '127.0.0.1', '内网IP', '{\"content\":\"还可以，晚饭多吃了一点点\",\"createTime\":\"2025-09-29 16:44:25\",\"elderlyId\":8,\"familyId\":25,\"isRead\":\"0\",\"messageId\":25,\"messageType\":\"text\",\"params\":{},\"sendTime\":\"2025-09-29 16:44:25\",\"senderName\":\"admin\",\"senderType\":\"staff\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 16:44:25', 5);
INSERT INTO `sys_oper_log` VALUES (413, '审核家属老人关系', 2, 'com.ruoyi.web.controller.website.WebsiteFamilyElderlyRelationController.auditRelation()', 'POST', 1, 'admin', '研发部门', '/website/relation/audit', '127.0.0.1', '内网IP', '{\"relationId\":\"10\",\"bindStatus\":\"1\"}', '{\"msg\":\"审核通过成功\",\"code\":200}', 0, NULL, '2025-09-29 16:47:41', 24);
INSERT INTO `sys_oper_log` VALUES (414, '审核家属老人关系', 2, 'com.ruoyi.web.controller.website.WebsiteFamilyElderlyRelationController.auditRelation()', 'POST', 1, 'admin', '研发部门', '/website/relation/audit', '127.0.0.1', '内网IP', '{\"relationId\":\"11\",\"bindStatus\":\"1\"}', '{\"msg\":\"审核通过成功\",\"code\":200}', 0, NULL, '2025-09-29 16:48:04', 10);
INSERT INTO `sys_oper_log` VALUES (415, '健康报告', 1, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.add()', 'POST', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"130/80\",\"bloodSugar\":63,\"createTime\":\"2025-09-29 16:57:12\",\"diagnosis\":\"测试\",\"doctorName\":\"测试\",\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"heartRate\":71,\"height\":170,\"medications\":\"测试\",\"nextCheckDate\":\"2025-09-09\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"测试\",\"reportDate\":\"2025-09-30\",\"reportId\":12,\"reportType\":\"体检\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":31,\"treatment\":\"测试\",\"vitalSigns\":\"测试\",\"weight\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 16:57:12', 18);
INSERT INTO `sys_oper_log` VALUES (416, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/117', '127.0.0.1', '内网IP', '117', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:01:07', 23);
INSERT INTO `sys_oper_log` VALUES (417, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-09-25 09:43:02\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":5,\"menuName\":\"网站管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"website\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:01:31', 19);
INSERT INTO `sys_oper_log` VALUES (418, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2400,\"menuName\":\"业务管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"business\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:01:38', 19);
INSERT INTO `sys_oper_log` VALUES (419, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3000,\"menuName\":\"家属管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"family\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:01:42', 13);
INSERT INTO `sys_oper_log` VALUES (420, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-09-23 15:32:08\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:01:49', 16);
INSERT INTO `sys_oper_log` VALUES (421, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-09-23 15:32:08\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:01:56', 14);
INSERT INTO `sys_oper_log` VALUES (422, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-09-23 15:32:08\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:01:59', 14);
INSERT INTO `sys_oper_log` VALUES (423, '费用查询', 2, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.generate()', 'POST', 1, 'admin', '研发部门', '/website/feeQuery/generate/15', '127.0.0.1', '内网IP', '15', '{\"msg\":\"成功生成 2 条费用明细\",\"code\":200}', 0, NULL, '2025-09-29 17:10:12', 78);
INSERT INTO `sys_oper_log` VALUES (424, '费用查询', 3, 'com.ruoyi.web.controller.website.WebsiteFeeQueryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeQuery/15', '127.0.0.1', '内网IP', '[15]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:10:28', 22);
INSERT INTO `sys_oper_log` VALUES (425, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-29 17:16:11\",\"detailId\":60,\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"feeAmount\":88,\"feeDate\":\"2025-09-17\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试\",\"feeType\":\"meal\",\"isPaid\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:16:11', 42);
INSERT INTO `sys_oper_log` VALUES (426, '费用明细', 3, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/feeDetail/59', '127.0.0.1', '内网IP', '[59]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:17:00', 21);
INSERT INTO `sys_oper_log` VALUES (427, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-29 17:17:14\",\"detailId\":61,\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"feeAmount\":88,\"feeDate\":\"2025-09-10\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试\",\"feeType\":\"meal\",\"isPaid\":\"0\",\"params\":{},\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:17:14', 28);
INSERT INTO `sys_oper_log` VALUES (428, '费用明细', 2, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"detailId\":60,\"isPaid\":\"1\",\"paidDate\":\"2025-09-29\",\"params\":{},\"paymentMethod\":\"cash\",\"updateBy\":\"admin\",\"updateTime\":\"2025-09-29 17:18:22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:18:22', 12);
INSERT INTO `sys_oper_log` VALUES (429, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-29 17:25:46\",\"detailId\":62,\"elderlyId\":6,\"elderlyName\":\"测试老人一号\",\"feeAmount\":1288,\"feeDate\":\"2025-09-03\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试\",\"feeType\":\"room\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-29\",\"params\":{},\"paymentMethod\":\"alipay\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:25:46', 30);
INSERT INTO `sys_oper_log` VALUES (430, '健康报告', 1, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.add()', 'POST', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"130/80\",\"bloodSugar\":6.2,\"createTime\":\"2025-09-29 17:50:21\",\"diagnosis\":\"测试 \",\"doctorName\":\"测试\",\"elderlyId\":6,\"elderlyName\":\"测试老人一号\",\"heartRate\":72,\"height\":170,\"medications\":\"测试\",\"nextCheckDate\":\"2025-09-18\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"测试\",\"reportDate\":\"2025-09-02\",\"reportId\":13,\"reportType\":\"医疗\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":37,\"treatment\":\"测试\",\"vitalSigns\":\"测试\",\"weight\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 17:50:21', 33);
INSERT INTO `sys_oper_log` VALUES (431, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-29 18:03:18\",\"detailId\":63,\"elderlyId\":6,\"elderlyName\":\"测试老人一号\",\"feeAmount\":888,\"feeDate\":\"2025-09-29\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试\",\"feeType\":\"medical\",\"isPaid\":\"0\",\"params\":{},\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-29 18:03:19', 32);
INSERT INTO `sys_oper_log` VALUES (432, '健康报告', 1, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.add()', 'POST', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"130/80\",\"bloodSugar\":6.2,\"createTime\":\"2025-09-30 09:13:17\",\"diagnosis\":\"测试\",\"doctorName\":\"测试\",\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"heartRate\":72,\"height\":170,\"medications\":\"测试\",\"nextCheckDate\":\"2025-09-01\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"是\",\"reportDate\":\"2025-09-23\",\"reportId\":14,\"reportType\":\"体检\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":36.5,\"treatment\":\"测试\",\"vitalSigns\":\"测试\",\"weight\":70.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:13:17', 56);
INSERT INTO `sys_oper_log` VALUES (433, '健康报告', 3, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/healthReport/12', '127.0.0.1', '内网IP', '[12]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:14:47', 15);
INSERT INTO `sys_oper_log` VALUES (434, '费用明细', 2, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"detailId\":63,\"isPaid\":\"0\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2025-09-30 09:15:05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:15:05', 18);
INSERT INTO `sys_oper_log` VALUES (435, '费用明细', 2, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"detailId\":60,\"isPaid\":\"0\",\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2025-09-30 09:15:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:15:21', 11);
INSERT INTO `sys_oper_log` VALUES (436, '费用明细', 1, 'com.ruoyi.web.controller.website.WebsiteFeeDetailController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-30 09:17:07\",\"detailId\":64,\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"feeAmount\":900,\"feeDate\":\"2025-09-18\",\"feeMonth\":\"2025-09\",\"feeName\":\"测试\",\"feeType\":\"meal\",\"isPaid\":\"0\",\"params\":{},\"remark\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:17:07', 21);
INSERT INTO `sys_oper_log` VALUES (437, '健康报告', 1, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.add()', 'POST', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"130/80\",\"bloodSugar\":6.3,\"createTime\":\"2025-09-30 09:17:56\",\"diagnosis\":\"测试\",\"doctorName\":\"测试\",\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"heartRate\":72,\"height\":170,\"medications\":\"删除\",\"nextCheckDate\":\"2025-09-30\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"测试\",\"reportDate\":\"2025-09-03\",\"reportId\":15,\"reportType\":\"体检\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":36.5,\"treatment\":\"测试\",\"vitalSigns\":\"测试\",\"weight\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:17:56', 35);
INSERT INTO `sys_oper_log` VALUES (438, '网站沟通消息', 1, 'com.ruoyi.web.controller.website.WebsiteCommunicationController.add()', 'POST', 1, 'admin', '研发部门', '/website/communication', '127.0.0.1', '内网IP', '{\"content\":\"可以额\",\"createTime\":\"2025-09-30 09:19:40\",\"elderlyId\":7,\"familyId\":26,\"isRead\":\"0\",\"messageId\":27,\"messageType\":\"text\",\"params\":{},\"sendTime\":\"2025-09-30 09:19:40\",\"senderName\":\"admin\",\"senderType\":\"staff\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:19:40', 20);
INSERT INTO `sys_oper_log` VALUES (439, '健康报告', 1, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.add()', 'POST', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"130/80\",\"bloodSugar\":6.2,\"createTime\":\"2025-09-30 09:40:35\",\"diagnosis\":\"测试\",\"doctorName\":\"测试\",\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"heartRate\":130,\"height\":170,\"medications\":\"测试\",\"nextCheckDate\":\"2025-10-01\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"测试\",\"reportDate\":\"2025-09-30\",\"reportId\":16,\"reportType\":\"医疗\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":40,\"treatment\":\"测试\",\"vitalSigns\":\"测试\",\"weight\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:40:35', 94);
INSERT INTO `sys_oper_log` VALUES (440, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/website/health-standards/index\",\"createTime\":\"2023-01-01 00:00:00\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3200,\"menuName\":\"健康标准管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":5,\"path\":\"health-standards\",\"perms\":\"website:health-standards:view\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:42:31', 22);
INSERT INTO `sys_oper_log` VALUES (441, '健康报告', 2, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"130/80\",\"bloodSugar\":6.2,\"createBy\":\"\",\"createTime\":\"2025-09-30 09:40:36\",\"diagnosis\":\"测试\",\"doctorName\":\"测试\",\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"heartRate\":130,\"height\":170,\"medications\":\"测试\",\"nextCheckDate\":\"2025-10-01\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"测试\",\"reportDate\":\"2025-09-30\",\"reportId\":16,\"reportType\":\"医疗\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":37,\"treatment\":\"测试\",\"updateBy\":\"\",\"updateTime\":\"2025-09-30 09:44:06\",\"vitalSigns\":\"测试\",\"weight\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:44:06', 16);
INSERT INTO `sys_oper_log` VALUES (442, '健康报告', 2, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"130/80\",\"bloodSugar\":6.2,\"createBy\":\"\",\"createTime\":\"2025-09-30 09:40:36\",\"diagnosis\":\"测试\",\"doctorName\":\"测试\",\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"heartRate\":100,\"height\":170,\"medications\":\"测试\",\"nextCheckDate\":\"2025-10-01\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"测试\",\"reportDate\":\"2025-09-30\",\"reportId\":16,\"reportType\":\"医疗\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":37,\"treatment\":\"测试\",\"updateBy\":\"\",\"updateTime\":\"2025-09-30 09:50:04\",\"vitalSigns\":\"测试\",\"weight\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:50:04', 18);
INSERT INTO `sys_oper_log` VALUES (443, '健康报告', 2, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"130/80\",\"bloodSugar\":6.2,\"createBy\":\"\",\"createTime\":\"2025-09-30 09:40:36\",\"diagnosis\":\"测试\",\"doctorName\":\"测试\",\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"heartRate\":100,\"height\":170,\"medications\":\"测试\",\"nextCheckDate\":\"2025-10-01\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"测试\",\"reportDate\":\"2025-09-30\",\"reportId\":16,\"reportType\":\"医疗\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":37,\"treatment\":\"测试\",\"updateBy\":\"\",\"updateTime\":\"2025-09-30 09:56:02\",\"vitalSigns\":\"测试\",\"weight\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:56:02', 19);
INSERT INTO `sys_oper_log` VALUES (444, '健康报告', 3, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/healthReport/16', '127.0.0.1', '内网IP', '[16]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:57:27', 16);
INSERT INTO `sys_oper_log` VALUES (445, '健康报告', 1, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.add()', 'POST', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"150/90\",\"bloodSugar\":6.3,\"createTime\":\"2025-09-30 09:58:36\",\"diagnosis\":\"是\",\"doctorName\":\"删除\",\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"heartRate\":140,\"height\":170,\"medications\":\"测试\",\"nextCheckDate\":\"2025-10-01\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"测试\",\"reportDate\":\"2025-09-30\",\"reportId\":17,\"reportType\":\"医疗\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":37,\"treatment\":\"测试\",\"vitalSigns\":\"删除\",\"weight\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 09:58:36', 24);
INSERT INTO `sys_oper_log` VALUES (446, '健康报告', 3, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/healthReport/17', '127.0.0.1', '内网IP', '[17]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 10:00:18', 8);
INSERT INTO `sys_oper_log` VALUES (447, '健康报告', 1, 'com.ruoyi.web.controller.website.WebsiteHealthReportController.add()', 'POST', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"140/80\",\"bloodSugar\":6.3,\"createTime\":\"2025-09-30 10:01:01\",\"diagnosis\":\"测试\",\"doctorName\":\"测试\",\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"heartRate\":110,\"height\":170,\"medications\":\"测试\",\"nextCheckDate\":\"2025-10-01\",\"nurseName\":\"测试\",\"nursingNotes\":\"是\",\"params\":{},\"recommendations\":\"测试\",\"reportDate\":\"2025-09-30\",\"reportId\":18,\"reportType\":\"体检\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":37.5,\"treatment\":\"测试\",\"vitalSigns\":\"测试\",\"weight\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 10:01:01', 19);
INSERT INTO `sys_oper_log` VALUES (448, '轮播图', 2, 'com.ruoyi.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":1,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"为每一位老人提供最贴心的养老服务\",\"imageUrl\":\"/profile/upload/2025/09/26/liaotianshi_20250926121713A001.jpg\",\"linkUrl\":\"\\\\website\\\\facilities-display\",\"params\":{},\"remark\":\"首页轮播图1\",\"sortOrder\":1,\"status\":\"0\",\"title\":\"温馨的家，专业的爱\",\"updateBy\":\"\",\"updateTime\":\"2025-09-30 10:56:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 10:56:30', 24);
INSERT INTO `sys_oper_log` VALUES (449, '轮播图', 2, 'com.ruoyi.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":1,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"为每一位老人提供最贴心的养老服务\",\"imageUrl\":\"/profile/upload/2025/09/26/liaotianshi_20250926121713A001.jpg\",\"linkUrl\":\"/website/facilities-display\",\"params\":{},\"remark\":\"首页轮播图1\",\"sortOrder\":1,\"status\":\"0\",\"title\":\"温馨的家，专业的爱\",\"updateBy\":\"\",\"updateTime\":\"2025-09-30 10:56:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 10:56:48', 7);
INSERT INTO `sys_oper_log` VALUES (450, '轮播图', 2, 'com.ruoyi.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":3,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"各种文娱活动，让晚年生活更加精彩\",\"imageUrl\":\"/profile/upload/2025/09/26/canting_20250926121723A002.jpg\",\"linkUrl\":\"/website/services\",\"params\":{},\"remark\":\"首页轮播图3\",\"sortOrder\":3,\"status\":\"0\",\"title\":\"丰富多彩的老年生活\",\"updateBy\":\"\",\"updateTime\":\"2025-09-30 10:57:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 10:57:08', 8);
INSERT INTO `sys_oper_log` VALUES (451, '老人信息', 2, 'com.ruoyi.web.controller.website.WebsiteElderlyInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/elderlyInfo', '127.0.0.1', '内网IP', '{\"admissionDate\":\"2025-09-26\",\"allergies\":\"测试\",\"bedNumber\":\"3\",\"birthDate\":\"2025-09-09\",\"careLevel\":\"自理\",\"createBy\":\"\",\"createTime\":\"2025-09-26 16:07:24\",\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"emergencyContact\":\"王大炮\",\"emergencyPhone\":\"18936655474\",\"gender\":\"1\",\"healthStatus\":\"良好\",\"idCard\":\"522121200102130365\",\"medicalHistory\":\"测试\",\"medications\":\"测试\",\"params\":{},\"phone\":\"17385646523\",\"photoUrl\":\"/profile/upload/2025/09/30/yiliaoshi_20250930105948A001.jpg\",\"roomNumber\":\"B2\",\"specialNotes\":\"测试\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-30 10:59:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 10:59:51', 15);
INSERT INTO `sys_oper_log` VALUES (452, '老人信息', 2, 'com.ruoyi.web.controller.website.WebsiteElderlyInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/elderlyInfo', '127.0.0.1', '内网IP', '{\"admissionDate\":\"2025-09-29\",\"allergies\":\"无\",\"bedNumber\":\"1\",\"birthDate\":\"1950-01-01\",\"careLevel\":\"半自理\",\"createBy\":\"admin\",\"createTime\":\"2025-09-29 11:45:15\",\"elderlyId\":8,\"elderlyName\":\"张大爷\",\"emergencyContact\":\"张小明\",\"emergencyPhone\":\"13900139000\",\"gender\":\"0\",\"healthStatus\":\"良好\",\"idCard\":\"110101195001011234\",\"medicalHistory\":\"无重大疾病\",\"medications\":\"无\",\"params\":{},\"phone\":\"13800138000\",\"photoUrl\":\"/profile/upload/2025/09/30/1-1_20250930110128A002.jpg\",\"remark\":\"测试老人数据\",\"roomNumber\":\"A103\",\"specialNotes\":\"身体健康，生活自理\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-09-30 11:01:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 11:01:29', 7);
INSERT INTO `sys_oper_log` VALUES (453, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/3', '127.0.0.1', '内网IP', '3', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-09-30 12:15:31', 10);
INSERT INTO `sys_oper_log` VALUES (454, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/115', '127.0.0.1', '内网IP', '115', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 12:15:34', 18);
INSERT INTO `sys_oper_log` VALUES (455, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/116', '127.0.0.1', '内网IP', '116', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-09-30 12:15:36', 3);
INSERT INTO `sys_oper_log` VALUES (456, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1055', '127.0.0.1', '内网IP', '1055', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 12:15:40', 17);
INSERT INTO `sys_oper_log` VALUES (457, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1056', '127.0.0.1', '内网IP', '1056', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 12:15:42', 11);
INSERT INTO `sys_oper_log` VALUES (458, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/116', '127.0.0.1', '内网IP', '116', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-09-30 12:15:44', 3);
INSERT INTO `sys_oper_log` VALUES (459, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1057', '127.0.0.1', '内网IP', '1057', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 12:15:46', 10);
INSERT INTO `sys_oper_log` VALUES (460, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1059', '127.0.0.1', '内网IP', '1059', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 12:15:50', 13);
INSERT INTO `sys_oper_log` VALUES (461, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1058', '127.0.0.1', '内网IP', '1058', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 12:15:51', 9);
INSERT INTO `sys_oper_log` VALUES (462, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1060', '127.0.0.1', '内网IP', '1060', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 12:15:53', 13);
INSERT INTO `sys_oper_log` VALUES (463, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/116', '127.0.0.1', '内网IP', '116', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 12:15:54', 9);
INSERT INTO `sys_oper_log` VALUES (464, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/3', '127.0.0.1', '内网IP', '3', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-30 12:16:09', 10);
INSERT INTO `sys_oper_log` VALUES (465, '轮播图', 2, 'com.smartnursinghome.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":1,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"为每一位老人提供最贴心的养老服务\",\"imageUrl\":\"/profile/upload/2025/09/26/liaotianshi_20250926121713A001.jpg\",\"linkUrl\":\"/website/facilities-display\",\"params\":{},\"remark\":\"首页轮播图1\",\"sortOrder\":1,\"status\":\"0\",\"title\":\"温馨的家，专业的爱6\",\"updateBy\":\"\",\"updateTime\":\"2025-10-09 11:06:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 11:06:54', 14);
INSERT INTO `sys_oper_log` VALUES (466, '健康报告', 3, 'com.smartnursinghome.web.controller.website.WebsiteHealthReportController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/healthReport/18', '127.0.0.1', '内网IP', '[18]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 11:36:41', 12);
INSERT INTO `sys_oper_log` VALUES (467, '健康报告', 3, 'com.smartnursinghome.web.controller.website.WebsiteHealthReportController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/healthReport/14', '127.0.0.1', '内网IP', '[14]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 11:36:45', 5);
INSERT INTO `sys_oper_log` VALUES (468, '健康报告', 3, 'com.smartnursinghome.web.controller.website.WebsiteHealthReportController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/healthReport/15', '127.0.0.1', '内网IP', '[15]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 11:36:47', 4);
INSERT INTO `sys_oper_log` VALUES (469, '健康报告', 1, 'com.smartnursinghome.web.controller.website.WebsiteHealthReportController.add()', 'POST', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"130/80\",\"bloodSugar\":6.2,\"createTime\":\"2025-10-09 11:37:27\",\"diagnosis\":\"测试\",\"doctorName\":\"测试\",\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"heartRate\":72,\"height\":170,\"medications\":\"测试\",\"nextCheckDate\":\"2025-10-08\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"测试\",\"reportDate\":\"2025-10-09\",\"reportId\":19,\"reportType\":\"体检\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":37,\"treatment\":\"测试\",\"weight\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 11:37:27', 22);
INSERT INTO `sys_oper_log` VALUES (470, '通知公告', 3, 'com.smartnursinghome.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/notice/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 11:40:22', 14);
INSERT INTO `sys_oper_log` VALUES (471, '费用明细', 1, 'com.smartnursinghome.web.controller.website.WebsiteFeeDetailController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-10-09 11:43:52\",\"detailId\":65,\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"feeAmount\":9999,\"feeDate\":\"2025-10-09\",\"feeMonth\":\"2025-10\",\"feeName\":\"护理费用\",\"feeType\":\"nursing\",\"isPaid\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 11:43:52', 30);
INSERT INTO `sys_oper_log` VALUES (472, '通知公告', 1, 'com.smartnursinghome.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', '研发部门', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>测试文章内容！！！！！<img src=\\\"/dev-api/profile/upload/2025/10/09/haohua2_20251009114555A001.jpg\\\"></p>\",\"noticeTitle\":\"养老院开院管理\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 11:45:58', 8);
INSERT INTO `sys_oper_log` VALUES (473, '通知公告', 2, 'com.smartnursinghome.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-23 15:32:09\",\"noticeContent\":\"<p>系统在凌晨会进行维护，请耐心等待！</p>\",\"noticeId\":2,\"noticeTitle\":\"维护通知：2018-07-01 若依系统凌晨维护\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 13:04:14', 15);
INSERT INTO `sys_oper_log` VALUES (474, '通知公告', 2, 'com.smartnursinghome.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-10-09 11:45:58\",\"noticeContent\":\"<p>测试文章内容！！！！！<img src=\\\"/dev-api/profile/upload/2025/10/09/haohua2_20251009114555A001.jpg\\\"></p>\",\"noticeId\":10,\"noticeTitle\":\"养老院开院管理\",\"noticeType\":\"2\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 13:04:57', 6);
INSERT INTO `sys_oper_log` VALUES (475, '网站咨询信息', 5, 'com.smartnursinghome.web.controller.website.WebsiteConsultationController.export()', 'POST', 1, 'admin', '研发部门', '/website/consultation/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-10-09 13:06:13', 1160);
INSERT INTO `sys_oper_log` VALUES (476, '定时任务', 2, 'com.smartnursinghome.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":4,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 13:09:35', 29);
INSERT INTO `sys_oper_log` VALUES (477, '定时任务', 2, 'com.smartnursinghome.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":4,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 13:10:54', 13);
INSERT INTO `sys_oper_log` VALUES (478, '老人信息', 1, 'com.smartnursinghome.web.controller.website.WebsiteElderlyInfoController.add()', 'POST', 1, 'admin', '研发部门', '/website/elderlyInfo', '127.0.0.1', '内网IP', '{\"admissionDate\":\"2025-10-01\",\"bedNumber\":\"1\",\"birthDate\":\"2006-10-06\",\"careLevel\":\"自理\",\"createTime\":\"2025-10-09 13:20:07\",\"elderlyId\":9,\"elderlyName\":\"测试\",\"emergencyContact\":\"18936564125\",\"emergencyPhone\":\"19623546313\",\"gender\":\"0\",\"healthStatus\":\"良好\",\"idCard\":\"522121200102160214\",\"params\":{},\"phone\":\"18932323232\",\"photoUrl\":\"/profile/upload/2025/10/09/yaofang_20251009132006A001.jpeg\",\"roomNumber\":\"B20\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 13:20:07', 18);
INSERT INTO `sys_oper_log` VALUES (479, '审核家属老人关系', 2, 'com.smartnursinghome.web.controller.website.WebsiteFamilyElderlyRelationController.auditRelation()', 'POST', 1, 'admin', '研发部门', '/website/relation/audit', '127.0.0.1', '内网IP', '{\"relationId\":\"12\",\"bindStatus\":\"2\"}', '{\"msg\":\"审核拒绝成功\",\"code\":200}', 0, NULL, '2025-10-09 13:24:11', 18);
INSERT INTO `sys_oper_log` VALUES (480, '轮播图', 2, 'com.smartnursinghome.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":1,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"为每一位老人提供最贴心的养老服务\",\"imageUrl\":\"/profile/upload/2025/09/26/liaotianshi_20250926121713A001.jpg\",\"linkUrl\":\"/website/facilities-display\",\"params\":{},\"remark\":\"首页轮播图1\",\"sortOrder\":1,\"status\":\"0\",\"title\":\"温馨的家，专业的爱\",\"updateBy\":\"\",\"updateTime\":\"2025-10-09 13:24:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 13:24:56', 10);
INSERT INTO `sys_oper_log` VALUES (481, '定时任务', 2, 'com.smartnursinghome.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2025-09-24 17:20:53\",\"cronExpression\":\"0 */2 * * * ?\",\"invokeTarget\":\"ryTask.syncNewsViews\",\"jobGroup\":\"DEFAULT\",\"jobId\":4,\"jobName\":\"新闻阅读量同步到数据库\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2025-10-09 13:32:00\",\"params\":{},\"remark\":\"每5分钟同步一次新闻阅读量数据从Redis到MySQL\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-09 13:30:53', 22);
INSERT INTO `sys_oper_log` VALUES (482, '轮播图', 2, 'com.smartnursinghome.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":1,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"为每一位老人提供最贴心的养老服务\",\"imageUrl\":\"/profile/upload/2025/09/26/liaotianshi_20250926121713A001.jpg\",\"linkUrl\":\"/website/facilities-display\",\"params\":{},\"remark\":\"首页轮播图1\",\"sortOrder\":1,\"status\":\"0\",\"title\":\"温馨的家，专业的爱    测试文字\",\"updateBy\":\"\",\"updateTime\":\"2025-10-10 00:48:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-10 00:48:07', 23);
INSERT INTO `sys_oper_log` VALUES (483, '轮播图', 2, 'com.smartnursinghome.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":1,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"为每一位老人提供最贴心的养老服务\",\"imageUrl\":\"/profile/upload/2025/09/26/liaotianshi_20250926121713A001.jpg\",\"linkUrl\":\"/website/facilities-display\",\"params\":{},\"remark\":\"首页轮播图1\",\"sortOrder\":1,\"status\":\"0\",\"title\":\"温馨的家，专业的爱\",\"updateBy\":\"\",\"updateTime\":\"2025-10-10 00:49:42\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-10 00:49:43', 4);
INSERT INTO `sys_oper_log` VALUES (484, '轮播图', 2, 'com.smartnursinghome.web.controller.website.WebsiteCarouselController.edit()', 'PUT', 1, 'admin', '研发部门', '/website/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":1,\"createBy\":\"admin\",\"createTime\":\"2025-09-24 12:30:33\",\"description\":\"为每一位老人提供最贴心的养老服务\",\"imageUrl\":\"/profile/upload/2025/09/26/liaotianshi_20250926121713A001.jpg\",\"linkUrl\":\"/website/facilities-display\",\"params\":{},\"remark\":\"首页轮播图1\",\"sortOrder\":1,\"status\":\"0\",\"title\":\"温馨的家，专业的爱   测试文字\",\"updateBy\":\"\",\"updateTime\":\"2025-10-10 00:52:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-10 00:52:46', 4);
INSERT INTO `sys_oper_log` VALUES (485, '主要服务项目', 3, 'com.smartnursinghome.web.controller.website.WebsiteMainServicesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/main-services/7', '127.0.0.1', '内网IP', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-10 00:53:20', 7);
INSERT INTO `sys_oper_log` VALUES (486, '主要服务项目', 1, 'com.smartnursinghome.web.controller.website.WebsiteMainServicesController.add()', 'POST', 1, 'admin', '研发部门', '/website/main-services', '127.0.0.1', '内网IP', '{\"params\":{},\"remark\":\"测试\",\"serviceDescription\":\"这是一个测试服务项目\",\"serviceFeatures\":\"[\\\"测试特色\\\"]\",\"serviceIcon\":\"el-icon-star-on\",\"serviceId\":8,\"servicePrice\":\"999\",\"serviceTitle\":\"测试服务项目\",\"sortOrder\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-10 00:53:47', 15);
INSERT INTO `sys_oper_log` VALUES (487, '生活照料服务', 3, 'com.smartnursinghome.web.controller.website.WebsiteCareServicesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/website/care-services/10', '127.0.0.1', '内网IP', '[10]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-10 00:54:40', 3);
INSERT INTO `sys_oper_log` VALUES (488, '生活照料服务', 1, 'com.smartnursinghome.web.controller.website.WebsiteCareServicesController.add()', 'POST', 1, 'admin', '研发部门', '/website/care-services', '127.0.0.1', '内网IP', '{\"params\":{},\"serviceDescription\":\"测试服务\",\"serviceFeatures\":\"[\\\"测试特色\\\"]\",\"serviceId\":11,\"serviceTime\":\"8:00-9:00\",\"serviceTitle\":\"这是一个测试服务\",\"sortOrder\":10,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-10 00:55:07', 9);
INSERT INTO `sys_oper_log` VALUES (489, '老人信息', 1, 'com.smartnursinghome.web.controller.website.WebsiteElderlyInfoController.add()', 'POST', 1, 'admin', '研发部门', '/website/elderlyInfo', '127.0.0.1', '内网IP', '{\"admissionDate\":\"2025-10-10\",\"bedNumber\":\"2\",\"birthDate\":\"1984-10-01\",\"careLevel\":\"自理\",\"createTime\":\"2025-10-10 01:02:14\",\"elderlyId\":10,\"elderlyName\":\"王二测试老人\",\"emergencyContact\":\"王三\",\"emergencyPhone\":\"18934465454\",\"gender\":\"0\",\"healthStatus\":\"良好\",\"idCard\":\"522121198410010216\",\"params\":{},\"phone\":\"18934454745\",\"photoUrl\":\"/profile/upload/2025/10/10/1-1_20251010010211A001.jpg\",\"roomNumber\":\"A101\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-10 01:02:14', 21);
INSERT INTO `sys_oper_log` VALUES (490, '审核家属老人关系', 2, 'com.smartnursinghome.web.controller.website.WebsiteFamilyElderlyRelationController.auditRelation()', 'POST', 1, 'admin', '研发部门', '/website/relation/audit', '127.0.0.1', '内网IP', '{\"relationId\":\"13\",\"bindStatus\":\"1\"}', '{\"msg\":\"审核通过成功\",\"code\":200}', 0, NULL, '2025-10-10 01:03:05', 6);
INSERT INTO `sys_oper_log` VALUES (491, '健康报告', 1, 'com.smartnursinghome.web.controller.website.WebsiteHealthReportController.add()', 'POST', 1, 'admin', '研发部门', '/website/healthReport', '127.0.0.1', '内网IP', '{\"bloodOxygen\":98,\"bloodPressure\":\"130/80\",\"bloodSugar\":6.2,\"createTime\":\"2025-10-10 01:04:19\",\"diagnosis\":\"测试\",\"doctorName\":\"测试\",\"elderlyId\":10,\"elderlyName\":\"王二测试老人\",\"heartRate\":72,\"height\":170,\"medications\":\"测试\",\"nextCheckDate\":\"2025-10-03\",\"nurseName\":\"测试\",\"nursingNotes\":\"测试\",\"params\":{},\"recommendations\":\"测试\",\"reportDate\":\"2025-10-10\",\"reportId\":20,\"reportType\":\"体检\",\"status\":\"0\",\"symptoms\":\"测试\",\"temperature\":37,\"treatment\":\"测试\",\"weight\":70}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-10 01:04:19', 34);
INSERT INTO `sys_oper_log` VALUES (492, '费用明细', 1, 'com.smartnursinghome.web.controller.website.WebsiteFeeDetailController.add()', 'POST', 1, 'admin', '研发部门', '/website/feeDetail', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-10-10 01:04:55\",\"detailId\":66,\"elderlyId\":10,\"elderlyName\":\"王二测试老人\",\"feeAmount\":8000,\"feeDate\":\"2025-10-10\",\"feeMonth\":\"2025-10\",\"feeName\":\"测试\",\"feeType\":\"meal\",\"isPaid\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-10 01:04:55', 11);
INSERT INTO `sys_oper_log` VALUES (493, '网站沟通消息', 1, 'com.smartnursinghome.web.controller.website.WebsiteCommunicationController.add()', 'POST', 1, 'admin', '研发部门', '/website/communication', '127.0.0.1', '内网IP', '{\"content\":\"还可以！\",\"createTime\":\"2025-10-10 01:06:04\",\"elderlyId\":10,\"familyId\":29,\"isRead\":\"0\",\"messageId\":31,\"messageType\":\"text\",\"params\":{},\"sendTime\":\"2025-10-10 01:06:04\",\"senderName\":\"admin\",\"senderType\":\"staff\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-10 01:06:04', 12);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '院长', 1, '0', 'admin', '2025-09-23 15:32:08', 'admin', '2025-09-26 10:28:32', '');
INSERT INTO `sys_post` VALUES (2, 'se', '副院长', 2, '0', 'admin', '2025-09-23 15:32:08', 'admin', '2025-09-26 10:28:42', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '医生', 3, '0', 'admin', '2025-09-23 15:32:08', 'admin', '2025-09-26 10:28:50', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-09-23 15:32:08', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-09-23 15:32:08', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-09-23 15:32:08', 'admin', '2025-09-26 16:28:12', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 200);
INSERT INTO `sys_role_menu` VALUES (1, 201);
INSERT INTO `sys_role_menu` VALUES (1, 202);
INSERT INTO `sys_role_menu` VALUES (1, 2000);
INSERT INTO `sys_role_menu` VALUES (1, 2001);
INSERT INTO `sys_role_menu` VALUES (1, 2002);
INSERT INTO `sys_role_menu` VALUES (1, 2003);
INSERT INTO `sys_role_menu` VALUES (1, 2004);
INSERT INTO `sys_role_menu` VALUES (1, 2010);
INSERT INTO `sys_role_menu` VALUES (1, 2011);
INSERT INTO `sys_role_menu` VALUES (1, 2012);
INSERT INTO `sys_role_menu` VALUES (1, 2013);
INSERT INTO `sys_role_menu` VALUES (1, 2014);
INSERT INTO `sys_role_menu` VALUES (1, 2020);
INSERT INTO `sys_role_menu` VALUES (1, 2021);
INSERT INTO `sys_role_menu` VALUES (1, 2022);
INSERT INTO `sys_role_menu` VALUES (1, 2023);
INSERT INTO `sys_role_menu` VALUES (1, 2024);
INSERT INTO `sys_role_menu` VALUES (1, 3100);
INSERT INTO `sys_role_menu` VALUES (1, 3101);
INSERT INTO `sys_role_menu` VALUES (1, 3102);
INSERT INTO `sys_role_menu` VALUES (1, 3103);
INSERT INTO `sys_role_menu` VALUES (1, 3104);
INSERT INTO `sys_role_menu` VALUES (1, 3105);
INSERT INTO `sys_role_menu` VALUES (1, 3200);
INSERT INTO `sys_role_menu` VALUES (1, 3201);
INSERT INTO `sys_role_menu` VALUES (1, 3202);
INSERT INTO `sys_role_menu` VALUES (2, 2210);
INSERT INTO `sys_role_menu` VALUES (2, 2211);
INSERT INTO `sys_role_menu` VALUES (2, 2212);
INSERT INTO `sys_role_menu` VALUES (2, 2213);
INSERT INTO `sys_role_menu` VALUES (2, 2214);
INSERT INTO `sys_role_menu` VALUES (2, 2215);
INSERT INTO `sys_role_menu` VALUES (2, 2300);
INSERT INTO `sys_role_menu` VALUES (2, 2301);
INSERT INTO `sys_role_menu` VALUES (2, 2302);
INSERT INTO `sys_role_menu` VALUES (2, 2303);
INSERT INTO `sys_role_menu` VALUES (2, 2304);
INSERT INTO `sys_role_menu` VALUES (2, 2305);
INSERT INTO `sys_role_menu` VALUES (2, 2310);
INSERT INTO `sys_role_menu` VALUES (2, 2311);
INSERT INTO `sys_role_menu` VALUES (2, 2312);
INSERT INTO `sys_role_menu` VALUES (2, 2313);
INSERT INTO `sys_role_menu` VALUES (2, 2314);
INSERT INTO `sys_role_menu` VALUES (2, 2315);
INSERT INTO `sys_role_menu` VALUES (2, 2316);
INSERT INTO `sys_role_menu` VALUES (2, 2317);
INSERT INTO `sys_role_menu` VALUES (2, 2320);
INSERT INTO `sys_role_menu` VALUES (2, 2321);
INSERT INTO `sys_role_menu` VALUES (2, 2322);
INSERT INTO `sys_role_menu` VALUES (2, 2323);
INSERT INTO `sys_role_menu` VALUES (2, 2324);
INSERT INTO `sys_role_menu` VALUES (2, 2325);
INSERT INTO `sys_role_menu` VALUES (2, 2326);
INSERT INTO `sys_role_menu` VALUES (2, 2400);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '四火', '00', '2528557122@qq.com', '18934400737', '0', '/profile/avatar/2025/09/24/3cbd6c2913e74f79bd27d1fed153f544.jpg', '$2a$10$kNOqQ5P2o/Kn.zsaG6QL9eehaoCE.7b19fYc1cklTrQ0Po18as5vq', '0', '0', '127.0.0.1', '2025-10-10 16:06:18', '2025-09-24 15:19:31', 'admin', '2025-09-23 15:32:08', '', '2025-09-24 15:19:31', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-09-23 15:32:08', '2025-09-23 15:32:08', 'admin', '2025-09-23 15:32:08', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 100, 'csyh', '测试人员', '00', '26546@qq.com', '18934400730', '0', '', '$2a$10$FCAX91u8gkWdROHPP4WjSOhRmfObjDpuzljGpFh6Oe9yG1pZVx85e', '0', '0', '127.0.0.1', '2025-09-29 10:34:38', NULL, 'admin', '2025-09-26 10:23:36', '', NULL, '测试');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);

-- ----------------------------
-- Table structure for website_activity
-- ----------------------------
DROP TABLE IF EXISTS `website_activity`;
CREATE TABLE `website_activity`  (
  `activity_id` bigint NOT NULL AUTO_INCREMENT COMMENT '动态ID',
  `family_id` bigint NOT NULL COMMENT '家属ID',
  `elderly_id` bigint NOT NULL COMMENT '老人ID',
  `elderly_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老人姓名',
  `activity_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '动态类型：health-健康报告，fee-费用相关，communication-沟通消息，care-护理记录，photo-生活照片',
  `activity_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '动态标题',
  `activity_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '动态内容',
  `activity_time` datetime NOT NULL COMMENT '动态时间',
  `related_id` bigint NULL DEFAULT NULL COMMENT '相关ID（如健康报告ID、费用ID等）',
  `related_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关类型（如health_report、fee_detail等）',
  `is_read` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否已读：0-未读，1-已读',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态：0-正常，1-删除',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`activity_id`) USING BTREE,
  INDEX `idx_family_id`(`family_id`) USING BTREE,
  INDEX `idx_elderly_id`(`elderly_id`) USING BTREE,
  INDEX `idx_activity_type`(`activity_type`) USING BTREE,
  INDEX `idx_activity_time`(`activity_time`) USING BTREE,
  INDEX `idx_is_read`(`is_read`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '动态记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_activity
-- ----------------------------
INSERT INTO `website_activity` VALUES (6, 26, 7, '测试老人二号', 'fee', '测试老人二号的餐饮费用已支付', '测试老人二号的餐饮费用已支付', '2025-09-30 09:16:19', 60, 'fee_detail', '0', '0', 'system', '2025-09-30 09:16:19', '', '2025-09-30 09:16:18', NULL);
INSERT INTO `website_activity` VALUES (7, 26, 7, '测试老人二号', 'health', '测试老人二号的健康报告已生成', '测试老人二号的健康报告已生成', '2025-09-30 09:17:57', 15, 'health_report', '0', '0', 'system', '2025-09-30 09:17:57', '', '2025-09-30 09:17:56', NULL);
INSERT INTO `website_activity` VALUES (8, 26, 7, '测试老人二号', 'communication', '您向护理人员发送了关于测试老人二号的咨询', '您向护理人员发送了关于测试老人二号的咨询', '2025-09-30 09:19:22', 26, 'communication', '0', '0', 'system', '2025-09-30 09:19:22', '', '2025-09-30 09:19:21', NULL);
INSERT INTO `website_activity` VALUES (9, 26, 7, '老人', 'communication', '护理人员向您发送了关于老人的重要通知', '护理人员向您发送了关于老人的重要通知', '2025-09-30 09:19:40', 27, 'communication', '0', '0', 'system', '2025-09-30 09:19:40', '', '2025-09-30 09:19:40', NULL);
INSERT INTO `website_activity` VALUES (10, 26, 7, '测试老人二号', 'communication', '您向护理人员发送了关于测试老人二号的咨询', '您向护理人员发送了关于测试老人二号的咨询', '2025-09-30 09:20:06', 28, 'communication', '0', '0', 'system', '2025-09-30 09:20:06', '', '2025-09-30 09:20:05', NULL);
INSERT INTO `website_activity` VALUES (11, 26, 7, '测试老人二号', 'health', '测试老人二号的健康报告已生成', '测试老人二号的健康报告已生成', '2025-09-30 09:40:36', 16, 'health_report', '0', '0', 'system', '2025-09-30 09:40:36', '', '2025-09-30 09:40:35', NULL);
INSERT INTO `website_activity` VALUES (12, 26, 7, '测试老人二号', 'health', '测试老人二号的健康报告已更新', '测试老人二号的健康报告已更新', '2025-09-30 09:44:06', 16, 'health_report', '0', '0', 'system', '2025-09-30 09:44:06', '', '2025-09-30 09:44:06', NULL);
INSERT INTO `website_activity` VALUES (13, 26, 7, '测试老人二号', 'health', '测试老人二号的健康报告已更新', '测试老人二号的健康报告已更新', '2025-09-30 09:50:05', 16, 'health_report', '0', '0', 'system', '2025-09-30 09:50:05', '', '2025-09-30 09:50:04', NULL);
INSERT INTO `website_activity` VALUES (14, 26, 7, '测试老人二号', 'health', '测试老人二号的健康报告已更新', '测试老人二号的健康报告已更新', '2025-09-30 09:56:03', 16, 'health_report', '0', '0', 'system', '2025-09-30 09:56:03', '', '2025-09-30 09:56:02', NULL);
INSERT INTO `website_activity` VALUES (15, 26, 7, '测试老人二号', 'health', '测试老人二号的健康报告已生成', '测试老人二号的健康报告已生成', '2025-09-30 09:58:37', 17, 'health_report', '0', '0', 'system', '2025-09-30 09:58:37', '', '2025-09-30 09:58:36', NULL);
INSERT INTO `website_activity` VALUES (16, 26, 7, '测试老人二号', 'health', '测试老人二号的健康报告已生成', '测试老人二号的健康报告已生成', '2025-09-30 10:01:02', 18, 'health_report', '0', '0', 'system', '2025-09-30 10:01:02', '', '2025-09-30 10:01:01', NULL);
INSERT INTO `website_activity` VALUES (17, 27, 6, '测试老人一号', 'fee', '测试老人一号的医疗费用已支付', '测试老人一号的医疗费用已支付', '2025-09-30 10:14:53', 63, 'fee_detail', '0', '0', 'system', '2025-09-30 10:14:53', '', '2025-09-30 10:14:53', NULL);
INSERT INTO `website_activity` VALUES (18, 26, 7, '测试老人二号', 'communication', '您向护理人员发送了关于测试老人二号的咨询', '您向护理人员发送了关于测试老人二号的咨询', '2025-10-09 11:36:17', 29, 'communication', '0', '0', 'system', '2025-10-09 11:36:17', '', '2025-10-09 11:36:17', NULL);
INSERT INTO `website_activity` VALUES (19, 26, 7, '测试老人二号', 'health', '测试老人二号的健康报告已生成', '测试老人二号的健康报告已生成', '2025-10-09 11:37:28', 19, 'health_report', '0', '0', 'system', '2025-10-09 11:37:28', '', '2025-10-09 11:37:27', NULL);
INSERT INTO `website_activity` VALUES (20, 26, 7, '测试老人二号', 'fee', '测试老人二号的餐饮费用已支付', '测试老人二号的餐饮费用已支付', '2025-10-09 11:39:42', 64, 'fee_detail', '0', '0', 'system', '2025-10-09 11:39:42', '', '2025-10-09 11:39:42', NULL);
INSERT INTO `website_activity` VALUES (21, 29, 10, '王二测试老人', 'health', '王二测试老人的健康报告已生成', '王二测试老人的健康报告已生成', '2025-10-10 01:04:19', 20, 'health_report', '0', '0', 'system', '2025-10-10 01:04:19', '', '2025-10-10 01:04:19', NULL);
INSERT INTO `website_activity` VALUES (22, 29, 10, '王二测试老人', 'fee', '王二测试老人的餐饮费用已支付', '王二测试老人的餐饮费用已支付', '2025-10-10 01:05:19', 66, 'fee_detail', '0', '0', 'system', '2025-10-10 01:05:19', '', '2025-10-10 01:05:18', NULL);
INSERT INTO `website_activity` VALUES (23, 29, 10, '王二测试老人', 'communication', '您向护理人员发送了关于王二测试老人的咨询', '您向护理人员发送了关于王二测试老人的咨询', '2025-10-10 01:05:37', 30, 'communication', '0', '0', 'system', '2025-10-10 01:05:37', '', '2025-10-10 01:05:36', NULL);
INSERT INTO `website_activity` VALUES (24, 29, 10, '老人', 'communication', '护理人员向您发送了关于老人的重要通知', '护理人员向您发送了关于老人的重要通知', '2025-10-10 01:06:05', 31, 'communication', '0', '0', 'system', '2025-10-10 01:06:05', '', '2025-10-10 01:06:04', NULL);

-- ----------------------------
-- Table structure for website_appointment
-- ----------------------------
DROP TABLE IF EXISTS `website_appointment`;
CREATE TABLE `website_appointment`  (
  `appointment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '预约ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  `age` int NOT NULL COMMENT '年龄',
  `appointment_time` datetime NOT NULL COMMENT '预约时间',
  `visitor_count` int NOT NULL DEFAULT 1 COMMENT '参观人数',
  `relationship` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '与老人关系',
  `health_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '健康状况',
  `special_needs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '特殊需求',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '预约状态（0待确认 1已确认 2已取消 3已完成）',
  `confirm_time` datetime NULL DEFAULT NULL COMMENT '确认时间',
  `confirm_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '确认人',
  `cancel_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '取消原因',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`appointment_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_appointment_time`(`appointment_time`) USING BTREE,
  INDEX `idx_phone`(`phone`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '网站预约信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_appointment
-- ----------------------------
INSERT INTO `website_appointment` VALUES (1, '王燚', '男', '18698899542', 60, '2025-09-26 11:57:39', 1, '本人', '健康', '测试', '测试', '1', '2025-09-26 11:59:25', 'admin', NULL, '2025-09-26 11:57:41', '2025-09-26 11:59:24');
INSERT INTO `website_appointment` VALUES (2, '测试人员', '男', '18963322365', 60, '2025-09-26 11:58:23', 1, '子女', '亚健康', '测试', '测试', '2', NULL, NULL, '不允许', '2025-09-26 11:58:44', '2025-09-26 11:59:08');
INSERT INTO `website_appointment` VALUES (3, '测试', '男', '18963322365', 60, '2025-10-11 00:00:00', 1, '配偶', '健康', '测试', '测试', '0', NULL, NULL, NULL, '2025-10-09 11:44:37', '2025-10-09 11:44:37');
INSERT INTO `website_appointment` VALUES (4, '测试', '男', '18934545474', 60, '2025-10-10 00:00:00', 1, '子女', '健康', '测试', '', '0', NULL, NULL, NULL, '2025-10-10 00:59:35', '2025-10-10 00:59:35');

-- ----------------------------
-- Table structure for website_care_services
-- ----------------------------
DROP TABLE IF EXISTS `website_care_services`;
CREATE TABLE `website_care_services`  (
  `service_id` bigint NOT NULL AUTO_INCREMENT COMMENT '服务ID',
  `service_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务标题',
  `service_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务时间',
  `service_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '服务描述',
  `service_features` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '服务特色（JSON格式）',
  `sort_order` bigint NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '生活照料服务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_care_services
-- ----------------------------
INSERT INTO `website_care_services` VALUES (1, '晨间护理', '06:00-08:00', '协助起床、洗漱、更衣，进行晨间健康检查。', '[\"协助起床\", \"个人卫生\", \"健康检查\", \"晨间运动\"]', 1, '0', 'admin', '2025-09-25 17:40:31', '', NULL, '');
INSERT INTO `website_care_services` VALUES (2, '营养早餐', '08:00-09:00', '提供营养丰富的早餐，根据个人需求调整膳食。', '[\"营养配餐\", \"个性化膳食\", \"用餐协助\", \"营养咨询\"]', 2, '0', 'admin', '2025-09-25 17:40:31', '', NULL, '');
INSERT INTO `website_care_services` VALUES (3, '活动时间', '09:00-11:00', '组织各种文娱活动，丰富老人的精神生活。', '[\"文娱活动\", \"社交互动\", \"兴趣培养\", \"身心锻炼\"]', 3, '0', 'admin', '2025-09-25 17:40:31', '', NULL, '');
INSERT INTO `website_care_services` VALUES (4, '健康监测', '11:00-12:00', '进行健康指标监测，记录身体状况变化。', '[\"健康监测\", \"数据记录\", \"异常预警\", \"健康咨询\"]', 4, '0', 'admin', '2025-09-25 17:40:31', '', NULL, '');
INSERT INTO `website_care_services` VALUES (5, '午餐休息测试', '12:00-14:00', '提供营养午餐，安排午休时间。测试', '[\"营养午餐\",\"午休安排\",\"环境调节\",\"安全监护\"]', 5, '0', 'admin', '2025-09-25 17:40:31', '', NULL, '');
INSERT INTO `website_care_services` VALUES (6, '康复训练', '14:00-17:00', '进行康复训练和身体功能锻炼。', '[\"康复训练\", \"功能锻炼\", \"物理治疗\", \"运动指导\"]', 6, '0', 'admin', '2025-09-25 17:40:31', '', NULL, '');
INSERT INTO `website_care_services` VALUES (7, '晚餐时间', '17:00-19:00', '提供营养晚餐，与老人交流沟通。', '[\"营养晚餐\", \"情感交流\", \"心理关怀\", \"家庭沟通\"]', 7, '0', 'admin', '2025-09-25 17:40:31', '', NULL, '');
INSERT INTO `website_care_services` VALUES (8, '晚间活动', '19:00-21:00', '组织晚间娱乐活动，丰富夜生活。', '[\"娱乐活动\", \"社交互动\", \"兴趣培养\", \"身心放松\"]', 8, '0', 'admin', '2025-09-25 17:40:31', '', NULL, '');
INSERT INTO `website_care_services` VALUES (9, '夜间护理', '21:00-06:00', '夜间安全监护，协助如厕，确保安全。', '[\"安全监护\", \"协助如厕\", \"紧急救助\", \"环境维护\"]', 9, '0', 'admin', '2025-09-25 17:40:31', '', NULL, '');
INSERT INTO `website_care_services` VALUES (11, '这是一个测试服务', '8:00-9:00', '测试服务', '[\"测试特色\"]', 10, '0', '', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for website_carousel
-- ----------------------------
DROP TABLE IF EXISTS `website_carousel`;
CREATE TABLE `website_carousel`  (
  `carousel_id` bigint NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '描述',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片地址',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '链接地址',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '轮播图表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_carousel
-- ----------------------------
INSERT INTO `website_carousel` VALUES (1, '温馨的家，专业的爱   测试文字', '为每一位老人提供最贴心的养老服务', '/profile/upload/2025/09/26/liaotianshi_20250926121713A001.jpg', '/website/facilities-display', 1, '0', 'admin', '2025-09-24 12:30:33', '', '2025-10-10 00:52:46', '首页轮播图1');
INSERT INTO `website_carousel` VALUES (2, '24小时专业护理', '经验丰富的护理团队，全天候守护老人健康', '/profile/upload/2025/09/24/1_20250924141908A001.jpg', '/website/services', 2, '0', 'admin', '2025-09-24 12:30:33', '', '2025-09-24 14:19:59', '首页轮播图2');
INSERT INTO `website_carousel` VALUES (3, '丰富多彩的老年生活', '各种文娱活动，让晚年生活更加精彩', '/profile/upload/2025/09/26/canting_20250926121723A002.jpg', '/website/services', 3, '0', 'admin', '2025-09-24 12:30:33', '', '2025-09-30 10:57:08', '首页轮播图3');

-- ----------------------------
-- Table structure for website_communication
-- ----------------------------
DROP TABLE IF EXISTS `website_communication`;
CREATE TABLE `website_communication`  (
  `message_id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `family_id` bigint NOT NULL COMMENT '家属ID',
  `elderly_id` bigint NOT NULL COMMENT '老人ID',
  `family_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '家属姓名',
  `elderly_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老人姓名',
  `sender_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发送者类型（family家属 staff护理人员）',
  `sender_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发送者姓名',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息内容',
  `send_time` datetime NOT NULL COMMENT '发送时间',
  `is_read` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否已读（0未读 1已读）',
  `message_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'text' COMMENT '消息类型（text文本 image图片 file文件）',
  `attachment_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件路径',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `idx_family_id`(`family_id`) USING BTREE,
  INDEX `idx_elderly_id`(`elderly_id`) USING BTREE,
  INDEX `idx_send_time`(`send_time`) USING BTREE,
  INDEX `idx_sender_type`(`sender_type`) USING BTREE,
  INDEX `idx_is_read`(`is_read`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '网站沟通消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_communication
-- ----------------------------
INSERT INTO `website_communication` VALUES (22, 26, 7, '测试老人的儿子', '测试老人二号', 'family', '测试老人的儿子', '老人今天状态如何？', '2025-09-29 16:35:32', '0', 'text', NULL, '0', NULL, '2025-09-29 16:35:32', NULL, '2025-09-29 16:35:32', NULL);
INSERT INTO `website_communication` VALUES (23, 26, 7, NULL, NULL, 'staff', 'admin', '还可以', '2025-09-29 16:35:44', '0', 'text', NULL, '0', NULL, '2025-09-29 16:35:44', NULL, '2025-09-29 16:35:44', NULL);
INSERT INTO `website_communication` VALUES (24, 25, 8, '王燚', '张大爷', 'family', '王燚', '老人今天状态如何？', '2025-09-29 16:44:01', '0', 'text', NULL, '0', NULL, '2025-09-29 16:44:01', NULL, '2025-09-29 16:44:01', NULL);
INSERT INTO `website_communication` VALUES (25, 25, 8, NULL, NULL, 'staff', 'admin', '还可以，晚饭多吃了一点点', '2025-09-29 16:44:26', '0', 'text', NULL, '0', NULL, '2025-09-29 16:44:26', NULL, '2025-09-29 16:44:25', NULL);
INSERT INTO `website_communication` VALUES (26, 26, 7, '测试老人的儿子', '测试老人二号', 'family', '测试老人的儿子', '老人今天状态如何？', '2025-09-30 09:19:22', '0', 'text', NULL, '0', NULL, '2025-09-30 09:19:22', NULL, '2025-09-30 09:19:21', NULL);
INSERT INTO `website_communication` VALUES (27, 26, 7, NULL, NULL, 'staff', 'admin', '可以额', '2025-09-30 09:19:40', '0', 'text', NULL, '0', NULL, '2025-09-30 09:19:40', NULL, '2025-09-30 09:19:40', NULL);
INSERT INTO `website_communication` VALUES (28, 26, 7, '测试老人的儿子', '测试老人二号', 'family', '测试老人的儿子', '那就行', '2025-09-30 09:20:06', '0', 'text', NULL, '0', NULL, '2025-09-30 09:20:06', NULL, '2025-09-30 09:20:05', NULL);
INSERT INTO `website_communication` VALUES (29, 26, 7, '测试老人的儿子', '测试老人二号', 'family', '测试老人的儿子', '还有什么问题吗？？？', '2025-10-09 11:36:17', '0', 'text', NULL, '0', NULL, '2025-10-09 11:36:17', NULL, '2025-10-09 11:36:17', NULL);
INSERT INTO `website_communication` VALUES (30, 29, 10, '王二', '王二测试老人', 'family', '王二', '老人今天状态如何？', '2025-10-10 01:05:37', '0', 'text', NULL, '0', NULL, '2025-10-10 01:05:37', NULL, '2025-10-10 01:05:36', NULL);
INSERT INTO `website_communication` VALUES (31, 29, 10, NULL, NULL, 'staff', 'admin', '还可以！', '2025-10-10 01:06:05', '0', 'text', NULL, '0', NULL, '2025-10-10 01:06:05', NULL, '2025-10-10 01:06:04', NULL);

-- ----------------------------
-- Table structure for website_consultation
-- ----------------------------
DROP TABLE IF EXISTS `website_consultation`;
CREATE TABLE `website_consultation`  (
  `consultation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '咨询ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  `relationship` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '与老人关系',
  `consultation_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '咨询类型',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '咨询内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '处理状态（0待处理 1已处理 2已回复）',
  `reply_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '回复内容',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '回复时间',
  `reply_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回复人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`consultation_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '网站咨询信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_consultation
-- ----------------------------
INSERT INTO `website_consultation` VALUES (1, '王燚', '18665599545', '子女', '入住咨询', '请问这个是需要什么条件吗？', '2', '具体情况而定哦', '2025-09-26 11:30:26', 'admin', '2025-09-26 11:29:57', '2025-09-26 11:30:25', NULL);

-- ----------------------------
-- Table structure for website_elderly_info
-- ----------------------------
DROP TABLE IF EXISTS `website_elderly_info`;
CREATE TABLE `website_elderly_info`  (
  `elderly_id` bigint NOT NULL AUTO_INCREMENT COMMENT '老人ID',
  `elderly_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '老人姓名',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别（0男 1女）',
  `birth_date` date NOT NULL COMMENT '出生日期',
  `id_card` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '身份证号',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `room_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房间号',
  `bed_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '床位号',
  `admission_date` date NOT NULL COMMENT '入住日期',
  `health_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '良好' COMMENT '健康状况',
  `care_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '自理' COMMENT '护理等级',
  `emergency_contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `emergency_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '紧急联系电话',
  `medical_history` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '病史记录',
  `allergies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '过敏史',
  `medications` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '用药情况',
  `special_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '特殊注意事项',
  `photo_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老人照片',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`elderly_id`) USING BTREE,
  UNIQUE INDEX `uk_id_card`(`id_card`) USING BTREE,
  INDEX `idx_room_number`(`room_number`) USING BTREE,
  INDEX `idx_admission_date`(`admission_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '老人信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_elderly_info
-- ----------------------------
INSERT INTO `website_elderly_info` VALUES (6, '测试老人一号', '0', '2025-09-26', '522121200102160216', '18936655987', 'A1', '1', '2025-09-26', '良好', '自理', '王某', '18963322365', '测试', '测试', '测试', '测试', '/profile/upload/2025/09/26/canting_20250926160539A001.jpg', '0', '', '2025-09-26 16:06:03', '', NULL, NULL);
INSERT INTO `website_elderly_info` VALUES (7, '测试老人二号', '1', '2025-09-09', '522121200102130365', '17385646523', 'B2', '3', '2025-09-26', '良好', '自理', '王大炮', '18936655474', '测试', '测试', '测试', '测试', '/profile/upload/2025/09/30/yiliaoshi_20250930105948A001.jpg', '0', '', '2025-09-26 16:07:24', '', '2025-09-30 10:59:52', NULL);
INSERT INTO `website_elderly_info` VALUES (8, '张大爷', '0', '1950-01-01', '110101195001011234', '13800138000', 'A103', '1', '2025-09-29', '良好', '半自理', '张小明', '13900139000', '无重大疾病', '无', '无', '身体健康，生活自理', '/profile/upload/2025/09/30/1-1_20250930110128A002.jpg', '0', 'admin', '2025-09-29 11:45:15', '', '2025-09-30 11:01:30', '测试老人数据');
INSERT INTO `website_elderly_info` VALUES (9, '测试', '0', '2006-10-06', '522121200102160214', '18932323232', 'B20', '1', '2025-10-01', '良好', '自理', '18936564125', '19623546313', NULL, NULL, NULL, NULL, '/profile/upload/2025/10/09/yaofang_20251009132006A001.jpeg', '0', '', '2025-10-09 13:20:08', '', NULL, NULL);
INSERT INTO `website_elderly_info` VALUES (10, '王二测试老人', '0', '1984-10-01', '522121198410010216', '18934454745', 'A101', '2', '2025-10-10', '良好', '自理', '王三', '18934465454', NULL, NULL, NULL, NULL, '/profile/upload/2025/10/10/1-1_20251010010211A001.jpg', '0', '', '2025-10-10 01:02:14', '', NULL, NULL);

-- ----------------------------
-- Table structure for website_entertainment_services
-- ----------------------------
DROP TABLE IF EXISTS `website_entertainment_services`;
CREATE TABLE `website_entertainment_services`  (
  `activity_id` bigint NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `category_id` bigint NOT NULL COMMENT '分类ID',
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `category_icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类图标',
  `activity_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
  `activity_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '活动描述',
  `activity_time` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '活动时间',
  `activity_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '活动地点',
  `activity_image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '活动图片',
  `sort_order` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`activity_id`) USING BTREE,
  INDEX `idx_category_id`(`category_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文娱活动服务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_entertainment_services
-- ----------------------------
INSERT INTO `website_entertainment_services` VALUES (1, 5, '手工制作', 'el-icon-goods', '书法练习', '学习传统书法，修身养性', '每周二、四 9:00-10:30', '文化活动室', '', 1, '0', 'admin', '2025-09-26 10:06:04', '', '2025-09-26 10:10:01', '');
INSERT INTO `website_entertainment_services` VALUES (2, 1, '文化艺术', 'el-icon-edit', '绘画创作', '水彩画、国画等绘画创作', '每周三、五 9:00-11:00', '艺术工作室', '', 2, '0', 'admin', '2025-09-26 10:06:04', '', NULL, '');
INSERT INTO `website_entertainment_services` VALUES (3, 1, '文化艺术', 'el-icon-edit', '音乐欣赏', '古典音乐、民族音乐欣赏', '每周一、三 14:00-15:30', '音乐厅', '', 3, '0', 'admin', '2025-09-26 10:06:04', '', NULL, '');
INSERT INTO `website_entertainment_services` VALUES (4, 2, '体育运动', 'el-icon-basketball', '太极拳', '学习太极拳，强身健体', '每日 7:00-8:00', '花园广场', '', 1, '0', 'admin', '2025-09-26 10:06:04', '', NULL, '');
INSERT INTO `website_entertainment_services` VALUES (5, 2, '体育运动', 'el-icon-basketball', '健身操', '适合老年人的健身操', '每周二、四 10:00-11:00', '健身房', '', 2, '0', 'admin', '2025-09-26 10:06:04', '', NULL, '');
INSERT INTO `website_entertainment_services` VALUES (6, 2, '体育运动', 'el-icon-basketball', '散步活动', '花园散步，呼吸新鲜空气', '每日 16:00-17:00', '花园步道', '', 3, '0', 'admin', '2025-09-26 10:06:04', '', NULL, '');
INSERT INTO `website_entertainment_services` VALUES (7, 3, '娱乐游戏', 'el-icon-trophy', '棋牌游戏', '象棋、围棋、麻将等', '每日 14:00-17:00', '棋牌室', '', 1, '0', 'admin', '2025-09-26 10:06:04', '', NULL, '');
INSERT INTO `website_entertainment_services` VALUES (8, 3, '娱乐游戏', 'el-icon-trophy', '桌游活动', '各种适合老年人的桌游', '每周一、三 15:00-16:30', '活动室', '', 2, '0', 'admin', '2025-09-26 10:06:04', '', NULL, '');
INSERT INTO `website_entertainment_services` VALUES (9, 3, '娱乐游戏', 'el-icon-trophy', 'KTV唱歌', '卡拉OK唱歌活动', '每周五 19:00-21:00', 'KTV室', '', 3, '0', 'admin', '2025-09-26 10:06:04', '', NULL, '');
INSERT INTO `website_entertainment_services` VALUES (10, 4, '音乐舞蹈', 'el-icon-music', '测试', '测试', '每日 19:00-20:00', '测试', '', 1, '0', 'admin', '2025-09-26 10:06:04', '', '2025-09-26 10:10:44', '');
INSERT INTO `website_entertainment_services` VALUES (11, 5, '手工制作', 'el-icon-goods', '剪纸艺术', '学习传统剪纸艺术', '每周二 14:00-16:00', '手工室', '', 1, '0', 'admin', '2025-09-26 10:06:04', '', NULL, '');
INSERT INTO `website_entertainment_services` VALUES (12, 6, '阅读学习', 'el-icon-reading', '读书会', '经典文学阅读分享', '每周四 10:00-11:30', '图书室', '', 1, '0', 'admin', '2025-09-26 10:06:04', '', NULL, '');

-- ----------------------------
-- Table structure for website_environment_features
-- ----------------------------
DROP TABLE IF EXISTS `website_environment_features`;
CREATE TABLE `website_environment_features`  (
  `feature_id` bigint NOT NULL AUTO_INCREMENT COMMENT '特色ID',
  `feature_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '特色名称',
  `feature_icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '特色图标',
  `feature_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '特色描述',
  `sort_order` bigint NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`feature_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '环境特色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_environment_features
-- ----------------------------
INSERT INTO `website_environment_features` VALUES (1, '绿色环保', 'el-icon-sunny', '采用环保材料，绿色装修，为老人提供健康的生活环境。', 1, '0', 'admin', '2025-09-25 16:21:14', '', NULL, '');
INSERT INTO `website_environment_features` VALUES (6, '绿化景观', 'el-icon-grape', '丰富的绿化景观，为老人提供优美的生活环境。', 6, '0', 'admin', '2025-09-25 16:21:14', '', NULL, '');
INSERT INTO `website_environment_features` VALUES (8, '采光通风', 'el-icon-wind-power', '良好的采光和通风设计，确保室内空气清新，光线充足。', 2, '0', 'admin', '2025-09-25 16:36:40', '', NULL, '');
INSERT INTO `website_environment_features` VALUES (11, '清洁卫生', 'el-icon-brush', '专业的清洁服务，保持环境整洁卫生。', 5, '0', 'admin', '2025-09-25 16:36:40', '', NULL, '');
INSERT INTO `website_environment_features` VALUES (15, '隔音降噪', 'el-icon-microphone', '专业的隔音设计，为老人提供安静的居住环境。', 3, '0', 'admin', '2025-09-25 16:38:03', '', NULL, '');
INSERT INTO `website_environment_features` VALUES (16, '温度控制', 'el-icon-turn-off', '中央空调系统，确保室内温度适宜，四季如春。', 4, '0', 'admin', '2025-09-25 16:38:03', '', NULL, '');

-- ----------------------------
-- Table structure for website_facilities
-- ----------------------------
DROP TABLE IF EXISTS `website_facilities`;
CREATE TABLE `website_facilities`  (
  `facility_id` bigint NOT NULL AUTO_INCREMENT COMMENT '设施ID',
  `facility_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设施名称',
  `facility_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设施类型(room/public/safety/medical)',
  `room_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房间类型(single=单人间,double=双人间,triple=三人间,quad=四人间,luxury=豪华间)',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '设施描述',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主图片地址',
  `icon_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '图标类名(安全设施用)',
  `features` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '特色功能(JSON格式)',
  `area` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '面积(房间设施用)',
  `beds` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '床位数量(房间设施用)',
  `price` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '价格(房间设施用)',
  `orientation` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '朝向(south=南向,north=北向,east=东向,west=西向,southeast=东南,southwest=西南)',
  `floor` int NULL DEFAULT NULL COMMENT '楼层',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态(0正常 1停用)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`facility_id`) USING BTREE,
  INDEX `idx_room_type`(`room_type`) USING BTREE,
  INDEX `idx_orientation`(`orientation`) USING BTREE,
  INDEX `idx_floor`(`floor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '设施管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_facilities
-- ----------------------------
INSERT INTO `website_facilities` VALUES (1, '标准单人间', 'room', 'single', '温馨舒适的单人间，配备独立卫生间，适合生活自理的老人居住。', '/profile/upload/2025/09/25/1_20250925103024A002.jpg,/profile/upload/2025/09/25/1-1_20250925103659A003.jpg,/profile/upload/2025/09/25/1-2_20250925103706A004.jpg', '', '[\"独立卫生间\",\"24小时热水\",\"空调暖气\",\"有线电视\",\"紧急呼叫系统\",\"无障碍设计\",\"测试特色\"]', '25㎡', '1', '5000元/月', 'south', 2, 1, '0', 'admin', '2025-09-25 09:37:24', '', '2025-09-25 10:37:08', '单人间');
INSERT INTO `website_facilities` VALUES (2, '豪华单人间', 'room', 'single', '宽敞豪华的单人间，配备独立客厅和卫生间，为老人提供更舒适的居住环境。', '/profile/upload/2025/09/25/haohua1_20250925104030A005.jpg,/profile/upload/2025/09/25/haohua2_20250925104033A006.jpg', '', '[\"独立客厅\",\"独立卫生间\",\"24小时热水\",\"空调暖气\",\"有线电视\",\"紧急呼叫系统\",\"无障碍设计\",\"阳台\",\"一对一管家服务\"]', '65㎡', '1张', '9000元/月', 'south', 1, 2, '0', 'admin', '2025-09-25 09:37:24', '', '2025-09-25 10:45:47', '');
INSERT INTO `website_facilities` VALUES (3, '标准双人间', 'room', NULL, '温馨的双人间，适合夫妻或朋友一起居住，共享生活空间。', 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80', '', '[\"独立卫生间\",\"24小时热水\",\"空调暖气\",\"有线电视\",\"紧急呼叫系统\",\"无障碍设计\",\"储物柜\"]', '30㎡', '2张', '3500元/月/人', NULL, NULL, 3, '0', 'admin', '2025-09-25 09:37:24', '', NULL, '');
INSERT INTO `website_facilities` VALUES (4, '护理房间', 'room', 'single', '专为需要护理的老人设计，配备专业护理设备，提供24小时护理服务。', '/profile/upload/2025/09/25/4_20250925102049A001.jpg', '', '[\"专业护理床\",\"独立卫生间\",\"24小时热水\",\"空调暖气\",\"有线电视\",\"紧急呼叫系统\",\"无障碍设计\",\"护理设备\"]', '28㎡', '1张', '5500元/月', 'south', 1, 4, '0', 'admin', '2025-09-25 09:37:24', '', '2025-09-25 10:24:19', '');
INSERT INTO `website_facilities` VALUES (5, '餐厅', 'public', NULL, '宽敞明亮的餐厅，提供营养美味的膳食', '/profile/upload/2025/09/25/canting_20250925120009A001.jpg', '', '[\"营养配餐\",\"个性化膳食\",\"用餐协助\",\"食品安全\",\"测试特色\"]', '', '', '', NULL, NULL, 1, '0', 'admin', '2025-09-25 09:37:24', '', '2025-09-25 12:08:20', '');
INSERT INTO `website_facilities` VALUES (6, '活动室', 'public', NULL, '多功能活动室，举办各种文娱活动', '/profile/upload/2025/09/25/liaotianshi_20250925130142A001.jpg', '', '[\"文娱活动\",\"社交互动\",\"兴趣培养\",\"身心锻炼\"]', '', '', '', NULL, NULL, 2, '0', 'admin', '2025-09-25 09:37:24', '', '2025-09-25 13:01:44', '');
INSERT INTO `website_facilities` VALUES (7, '康复训练室', 'public', NULL, '专业康复训练设备，促进身体功能恢复', '/profile/upload/2025/09/25/anmo_20250925130153A002.jpg', '', '[\"康复训练\",\"功能锻炼\",\"物理治疗\",\"运动指导\"]', '', '', '', NULL, NULL, 3, '0', 'admin', '2025-09-25 09:37:24', '', '2025-09-25 13:01:55', '');
INSERT INTO `website_facilities` VALUES (8, '图书阅览室', 'public', NULL, '安静的阅读环境，丰富精神生活', '/profile/upload/2025/09/25/yuedushi_20250925130203A003.jpg', '', '[\"图书借阅\",\"安静阅读\",\"知识学习\",\"文化交流\"]', '', '', '', NULL, NULL, 4, '0', 'admin', '2025-09-25 09:37:24', '', '2025-09-25 13:02:05', '');
INSERT INTO `website_facilities` VALUES (9, '花园庭院', 'public', NULL, '美丽的花园，老人可以散步、晒太阳', 'https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80', '', '[\"花园散步\",\"阳光浴\",\"园艺活动\",\"自然疗养\"]', '', '', '', NULL, NULL, 5, '0', 'admin', '2025-09-25 09:37:24', '', NULL, '');
INSERT INTO `website_facilities` VALUES (10, 'KTV室', 'public', NULL, '专业的KTV设备，丰富娱乐生活', 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80', '', '[\"KTV唱歌\",\"音乐欣赏\",\"娱乐活动\",\"社交互动\"]', '', '', '', NULL, NULL, 6, '0', 'admin', '2025-09-25 09:37:24', '', NULL, '');
INSERT INTO `website_facilities` VALUES (11, '监控系统', 'safety', NULL, '24小时全方位监控，确保老人安全', '', 'el-icon-video-camera', '[\"24小时监控\",\"高清摄像头\",\"录像存储\",\"异常报警\"]', '', '', '', NULL, NULL, 1, '0', 'admin', '2025-09-25 09:37:24', '', NULL, '');
INSERT INTO `website_facilities` VALUES (12, '紧急呼叫系统', 'safety', NULL, '每个房间配备紧急呼叫按钮，快速响应', '', 'el-icon-warning', '[\"紧急呼叫\",\"快速响应\",\"定位准确\",\"24小时待命\"]', '', '', '', NULL, NULL, 2, '0', 'admin', '2025-09-25 09:37:24', '', NULL, '');
INSERT INTO `website_facilities` VALUES (13, '消防设施', 'safety', NULL, '完善的消防设施，保障消防安全', '', 'el-icon-bell', '[\"烟雾报警\",\"自动喷淋\",\"消防通道\",\"应急照明\"]', '', '', '', NULL, NULL, 3, '0', 'admin', '2025-09-25 09:37:24', '', '2025-09-25 14:14:04', '');
INSERT INTO `website_facilities` VALUES (14, '无障碍设计', 'safety', NULL, '全楼无障碍设计，方便老人出行', '', 'el-icon-check', '[\"无障碍通道\",\"电梯设施\",\"扶手设计\",\"轮椅通行\",\"测试数据\"]', '', '', '', NULL, NULL, 4, '0', 'admin', '2025-09-25 09:37:24', '', '2025-09-25 14:16:06', '');
INSERT INTO `website_facilities` VALUES (15, '门禁系统', 'safety', NULL, '智能门禁系统，确保出入安全', '', 'el-icon-lock', '[\"智能门禁\",\"身份识别\",\"出入记录\",\"安全防护\"]', '', '', '', NULL, NULL, 5, '0', 'admin', '2025-09-25 09:37:24', '', NULL, '');
INSERT INTO `website_facilities` VALUES (16, '医疗急救', 'safety', NULL, '专业医疗急救设备，快速医疗救助', '', 'el-icon-first-aid-kit', '[\"急救设备\",\"医疗药品\",\"专业医护\",\"快速响应\"]', '', '', '', NULL, NULL, 6, '0', 'admin', '2025-09-25 09:37:24', '', NULL, '');
INSERT INTO `website_facilities` VALUES (17, '医疗室', 'medical', NULL, '专业医疗室，配备基本医疗设备', '/profile/upload/2025/09/25/yiliaoshi_20250925141749A001.jpg', '', '[\"基本医疗设备\",\"药品管理\",\"健康检查\",\"医疗咨询\"]', '', '', '', NULL, NULL, 1, '0', 'admin', '2025-09-25 09:37:24', '', '2025-09-25 14:18:01', '');
INSERT INTO `website_facilities` VALUES (18, '康复训练室', 'medical', NULL, '专业康复训练设备，促进身体功能恢复', '/profile/upload/2025/09/25/anmo_20250925160930A002.jpg', '', '[\"康复设备\",\"功能训练\",\"物理治疗\",\"运动指导\"]', '', '', '', NULL, NULL, 2, '0', 'admin', '2025-09-25 09:37:24', '', '2025-09-25 16:09:31', '');
INSERT INTO `website_facilities` VALUES (19, '药房', 'medical', NULL, '专业药房，管理老人用药', '/profile/upload/2025/09/25/yaofang_20250925160916A001.jpeg', '', '[\"药品管理\",\"用药指导\",\"药物储存\",\"用药安全\"]', '', '', '', NULL, NULL, 3, '0', 'admin', '2025-09-25 09:37:24', '', '2025-09-25 16:09:19', '');

-- ----------------------------
-- Table structure for website_facility_images
-- ----------------------------
DROP TABLE IF EXISTS `website_facility_images`;
CREATE TABLE `website_facility_images`  (
  `image_id` bigint NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `facility_id` bigint NOT NULL COMMENT '设施ID',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片地址',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`image_id`) USING BTREE,
  INDEX `idx_facility_id`(`facility_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '设施图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_facility_images
-- ----------------------------
INSERT INTO `website_facility_images` VALUES (37, 1, 'https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80', 1, '2025-09-25 10:37:08');
INSERT INTO `website_facility_images` VALUES (38, 1, 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80', 2, '2025-09-25 10:37:08');
INSERT INTO `website_facility_images` VALUES (39, 1, 'https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80', 3, '2025-09-25 10:37:08');
INSERT INTO `website_facility_images` VALUES (49, 2, 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80', 1, '2025-09-25 10:45:47');
INSERT INTO `website_facility_images` VALUES (50, 2, 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80', 2, '2025-09-25 10:45:47');
INSERT INTO `website_facility_images` VALUES (51, 2, 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80', 3, '2025-09-25 10:45:47');

-- ----------------------------
-- Table structure for website_facility_overview
-- ----------------------------
DROP TABLE IF EXISTS `website_facility_overview`;
CREATE TABLE `website_facility_overview`  (
  `overview_id` bigint NOT NULL AUTO_INCREMENT COMMENT '概览ID',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '描述',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '图片地址',
  `stats_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '统计数据(JSON格式)',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态(0正常 1停用)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`overview_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '环境概览配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_facility_overview
-- ----------------------------
INSERT INTO `website_facility_overview` VALUES (1, '温馨如家的居住环境', '我们为每一位老人提供温馨舒适的居住环境，从房间设计到公共设施，每一个细节都体现着我们的用心。无障碍设计、安全设施完善，让老人住得安心、住得舒心。', 'https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', '{\"beds\":\"200张\",\"area\":\"5000㎡\",\"accessibility\":\"100%\"}', '0', 'admin', '2025-09-25 09:37:24', '', NULL, '环境概览配置');
INSERT INTO `website_facility_overview` VALUES (2, '温馨如家的居住环境', '我们为每一位老人提供温馨舒适的居住环境，从房间设计到公共设施，每一个细节都体现着我们的用心。无障碍设计、安全设施完善，让老人住得安心、住得舒心。', '/profile/upload/2025/01/27/facility-overview-bg.jpg', '{\"beds\":\"200张\",\"area\":\"5000㎡\",\"accessibility\":\"100%\"}', '0', 'admin', '2025-09-25 12:23:21', '', NULL, '环境概览配置');
INSERT INTO `website_facility_overview` VALUES (3, '温馨如家的居住环境', '我们为每一位老人提供温馨舒适的居住环境，从房间设计到公共设施，每一个细节都体现着我们的用心。无障碍设计、安全设施完善，让老人住得安心、住得舒心。', '/profile/upload/2025/01/27/facility-overview-bg.jpg', '{\"beds\":\"200张\",\"area\":\"5000㎡\",\"accessibility\":\"100%\"}', '0', 'admin', '2025-09-25 12:26:07', '', NULL, '环境概览配置');
INSERT INTO `website_facility_overview` VALUES (4, '温馨如家的居住环境', '我们为每一位老人提供温馨舒适的居住环境，从房间设计到公共设施，每一个细节都体现着我们的用心。无障碍设计、安全设施完善，让老人住得安心、住得舒心。', '/profile/upload/2025/01/27/facility-overview-bg.jpg', '{\"beds\":\"200张\",\"area\":\"5000㎡\",\"accessibility\":\"100%\"}', '0', 'admin', '2025-09-25 12:28:14', '', NULL, '环境概览配置');

-- ----------------------------
-- Table structure for website_family_elderly_relation
-- ----------------------------
DROP TABLE IF EXISTS `website_family_elderly_relation`;
CREATE TABLE `website_family_elderly_relation`  (
  `relation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '关系ID',
  `family_id` bigint NOT NULL COMMENT '家属ID',
  `elderly_id` bigint NOT NULL COMMENT '老人ID',
  `relationship` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关系类型（子女、配偶、其他）',
  `is_primary` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否主要联系人（0否 1是）',
  `bind_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '绑定状态（0待审核 1已绑定 2已拒绝）',
  `bind_time` datetime NULL DEFAULT NULL COMMENT '绑定时间',
  `verify_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '验证码（用于绑定验证）',
  `verify_expire_time` datetime NULL DEFAULT NULL COMMENT '验证码过期时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`relation_id`) USING BTREE,
  UNIQUE INDEX `uk_family_elderly`(`family_id`, `elderly_id`) USING BTREE,
  INDEX `idx_family_id`(`family_id`) USING BTREE,
  INDEX `idx_elderly_id`(`elderly_id`) USING BTREE,
  INDEX `idx_bind_status`(`bind_status`) USING BTREE,
  CONSTRAINT `fk_family_elderly_elderly` FOREIGN KEY (`elderly_id`) REFERENCES `website_elderly_info` (`elderly_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_family_elderly_family` FOREIGN KEY (`family_id`) REFERENCES `website_family_user` (`family_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '家属老人关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_family_elderly_relation
-- ----------------------------
INSERT INTO `website_family_elderly_relation` VALUES (9, 25, 8, 'children', '0', '1', '2025-09-29 12:40:40', NULL, NULL, 'system', '2025-09-29 12:39:59', 'admin', '2025-09-29 12:40:40', '家属注册时自动创建');
INSERT INTO `website_family_elderly_relation` VALUES (10, 26, 7, 'children', '0', '1', '2025-09-29 16:47:42', NULL, NULL, 'system', '2025-09-29 16:34:59', 'admin', '2025-09-29 16:47:42', '家属注册时自动创建');
INSERT INTO `website_family_elderly_relation` VALUES (11, 27, 6, 'children', '0', '1', '2025-09-29 16:48:04', NULL, NULL, 'system', '2025-09-29 16:46:45', 'admin', '2025-09-29 16:48:04', '家属注册时自动创建');
INSERT INTO `website_family_elderly_relation` VALUES (12, 28, 9, 'spouse', '0', '2', NULL, NULL, NULL, 'system', '2025-10-09 13:23:39', 'admin', '2025-10-09 13:24:12', '家属注册时自动创建');
INSERT INTO `website_family_elderly_relation` VALUES (13, 29, 10, 'children', '0', '1', NULL, NULL, NULL, 'system', '2025-10-10 01:02:50', 'admin', '2025-10-10 01:03:05', '家属注册时自动创建');

-- ----------------------------
-- Table structure for website_family_user
-- ----------------------------
DROP TABLE IF EXISTS `website_family_user`;
CREATE TABLE `website_family_user`  (
  `family_id` bigint NOT NULL AUTO_INCREMENT COMMENT '家属ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `family_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '家属姓名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `id_card` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `relationship` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '与老人关系（子女、配偶、其他）',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`family_id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE,
  UNIQUE INDEX `uk_phone`(`phone`) USING BTREE,
  INDEX `idx_family_name`(`family_name`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '家属用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_family_user
-- ----------------------------
INSERT INTO `website_family_user` VALUES (7, 'zhangxiaoming', '$2a$10$7JB720yubVSOfvVWbQJ5UeJ5UeJ5UeJ5UeJ5UeJ5UeJ5UeJ5UeJ5Ue', '张小明', '13800138001', 'zhangxm@example.com', NULL, NULL, 'children', NULL, '0', NULL, NULL, 'admin', '2025-09-29 11:08:18', '', '2025-09-29 11:08:18', '张大爷的儿子');
INSERT INTO `website_family_user` VALUES (8, 'lixiaohong', '$2a$10$7JB720yubVSOfvVWbQJ5UeJ5UeJ5UeJ5UeJ5UeJ5UeJ5UeJ5UeJ5Ue', '李小红', '13800138002', 'lixh@example.com', NULL, NULL, 'children', NULL, '0', NULL, NULL, 'admin', '2025-09-29 11:08:18', '', '2025-09-29 11:08:18', '李奶奶的女儿');
INSERT INTO `website_family_user` VALUES (25, 'wyq', '$2a$10$agELIDsmyMT.HpII9iQEY.c4ZLrwaokW9hrA70ReDkf0Y84E0ykV6', '王燚', '18936655645', NULL, NULL, NULL, 'children', NULL, '0', NULL, NULL, 'system', '2025-09-29 12:39:58', '', '2025-09-29 12:39:58', NULL);
INSERT INTO `website_family_user` VALUES (26, 'cslrdrz', '$2a$10$gQZbd7U67lXy5/piiop.AOykJPrbalpl61w1dMOk9VTcIuzcmbPgS', '测试老人的儿子', '18934466545', NULL, NULL, NULL, 'children', NULL, '0', NULL, NULL, 'system', '2025-09-29 16:34:58', '', '2025-09-29 16:34:58', NULL);
INSERT INTO `website_family_user` VALUES (27, 'cslryhdez', '$2a$10$L8ceVXPi8IO5gBasjJDA8uXvRc1GURZWFPz.blrgrvvUILpAjgmP.', '测试老人一号的儿子', '18945577854', NULL, NULL, NULL, 'children', NULL, '0', NULL, NULL, 'system', '2025-09-29 16:46:44', '', '2025-09-29 16:46:44', NULL);
INSERT INTO `website_family_user` VALUES (28, 'wxe', '$2a$10$RS.77UfGoLSXS5fUHs6N6OpK602kWOg9U/BiONOnU.koOQxPEIjBW', '王小二', '18888888888', NULL, NULL, NULL, 'spouse', NULL, '0', NULL, NULL, 'system', '2025-10-09 13:23:39', '', '2025-10-09 13:23:39', NULL);
INSERT INTO `website_family_user` VALUES (29, 'we', '$2a$10$BRU01.OBOO8.XGiiThQJqeNjc/jy7sm.RUKWBfXBJ.UdWQ0bqg76i', '王二', '18913213132', NULL, NULL, NULL, 'children', NULL, '0', NULL, NULL, 'system', '2025-10-10 01:02:50', '', '2025-10-10 01:02:50', NULL);

-- ----------------------------
-- Table structure for website_fee_detail
-- ----------------------------
DROP TABLE IF EXISTS `website_fee_detail`;
CREATE TABLE `website_fee_detail`  (
  `detail_id` bigint NOT NULL AUTO_INCREMENT COMMENT '明细ID',
  `query_id` bigint NULL DEFAULT NULL COMMENT '查询ID',
  `elderly_id` bigint NOT NULL COMMENT '老人ID',
  `fee_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '费用类型：room-床位费，meal-餐饮费，medical-医疗费，nursing-护理费，other-其他费用',
  `fee_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '费用名称',
  `fee_amount` decimal(10, 2) NOT NULL COMMENT '费用金额',
  `fee_date` date NOT NULL COMMENT '费用日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束日期（用于单条记录显示日期区间）',
  `fee_month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '费用月份(YYYY-MM)',
  `is_paid` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否已付：0-未付，1-已付',
  `paid_date` date NULL DEFAULT NULL COMMENT '支付日期',
  `payment_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付方式：cash-现金，bank-银行转账，wechat-微信，alipay-支付宝',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `idx_query_id`(`query_id`) USING BTREE,
  INDEX `idx_elderly_id`(`elderly_id`) USING BTREE,
  INDEX `idx_fee_date`(`fee_date`) USING BTREE,
  INDEX `idx_fee_month`(`fee_month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '费用明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_fee_detail
-- ----------------------------
INSERT INTO `website_fee_detail` VALUES (58, NULL, 7, 'room', '测试床位费', 500.00, '2025-09-01', '2025-09-04', '2025-09', '1', '2025-09-29', 'bank_transfer', '测试', '', '2025-09-26 16:43:11', 'admin', '2025-09-29 17:20:34');
INSERT INTO `website_fee_detail` VALUES (60, NULL, 7, 'meal', '测试', 88.00, '2025-09-17', NULL, '2025-09', '1', '2025-09-30', 'alipay', NULL, 'admin', '2025-09-29 17:16:12', 'admin', '2025-09-30 09:16:18');
INSERT INTO `website_fee_detail` VALUES (61, NULL, 7, 'meal', '测试', 88.00, '2025-09-10', NULL, '2025-09', '1', '2025-09-30', 'wechat', '测试', 'admin', '2025-09-29 17:17:14', '', '2025-09-30 09:12:12');
INSERT INTO `website_fee_detail` VALUES (62, NULL, 6, 'room', '测试', 1288.00, '2025-09-03', NULL, '2025-09', '1', '2025-09-29', 'alipay', NULL, 'admin', '2025-09-29 17:25:46', '', NULL);
INSERT INTO `website_fee_detail` VALUES (63, NULL, 6, 'medical', '测试', 888.00, '2025-09-29', NULL, '2025-09', '1', '2025-09-30', 'bank_transfer', '测试', 'admin', '2025-09-29 18:03:19', 'admin', '2025-09-30 10:14:53');
INSERT INTO `website_fee_detail` VALUES (64, NULL, 7, 'meal', '测试', 900.00, '2025-09-18', NULL, '2025-09', '1', '2025-10-09', 'bank_transfer', '测试', 'admin', '2025-09-30 09:17:07', '', '2025-10-09 11:39:42');
INSERT INTO `website_fee_detail` VALUES (65, NULL, 7, 'nursing', '护理费用', 9999.00, '2025-10-09', NULL, '2025-10', '0', NULL, NULL, NULL, 'admin', '2025-10-09 11:43:52', '', NULL);
INSERT INTO `website_fee_detail` VALUES (66, NULL, 10, 'meal', '测试', 8000.00, '2025-10-10', NULL, '2025-10', '1', '2025-10-10', 'bank_transfer', NULL, 'admin', '2025-10-10 01:04:56', '', '2025-10-10 01:05:18');

-- ----------------------------
-- Table structure for website_fee_query
-- ----------------------------
DROP TABLE IF EXISTS `website_fee_query`;
CREATE TABLE `website_fee_query`  (
  `query_id` bigint NOT NULL AUTO_INCREMENT COMMENT '查询ID',
  `elderly_id` bigint NOT NULL COMMENT '老人ID',
  `elderly_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '老人姓名',
  `query_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '查询类型：monthly-月度费用，quarterly-季度费用，yearly-年度费用，custom-自定义期间',
  `start_date` date NOT NULL COMMENT '查询开始日期',
  `end_date` date NOT NULL COMMENT '查询结束日期',
  `query_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '查询状态：0-待处理，1-已处理，2-已发送',
  `query_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '查询结果JSON',
  `total_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '总费用',
  `paid_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '已付费用',
  `unpaid_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '未付费用',
  `query_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '查询人',
  `query_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '查询时间',
  `process_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '处理人',
  `process_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`query_id`) USING BTREE,
  INDEX `idx_elderly_id`(`elderly_id`) USING BTREE,
  INDEX `idx_query_time`(`query_time`) USING BTREE,
  INDEX `idx_query_status`(`query_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '费用查询表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_fee_query
-- ----------------------------
INSERT INTO `website_fee_query` VALUES (14, 7, '测试老人二号', 'yearly', '2025-09-01', '2025-09-26', '1', '[{\"createBy\":\"\",\"createTime\":\"2025-09-26 08:43:11\",\"updateBy\":\"admin\",\"updateTime\":\"2025-09-26 08:53:40\",\"remark\":\"测试\",\"detailId\":58,\"queryId\":null,\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"feeType\":\"room\",\"feeName\":\"测试床位费\",\"feeAmount\":500.00,\"feeDate\":\"2025-09-01\",\"endDate\":\"2025-09-04\",\"feeMonth\":\"2025-09\",\"isPaid\":\"0\",\"paidDate\":\"2025-09-26\",\"paymentMethod\":\"cash\"},{\"createBy\":\"\",\"createTime\":\"2025-09-26 08:43:39\",\"updateBy\":\"admin\",\"updateTime\":\"2025-09-26 09:02:09\",\"remark\":\"测试\",\"detailId\":59,\"queryId\":null,\"elderlyId\":7,\"elderlyName\":\"测试老人二号\",\"feeType\":\"meal\",\"feeName\":\"测试餐饮费\",\"feeAmount\":1200.00,\"feeDate\":\"2025-09-01\",\"endDate\":\"2025-09-03\",\"feeMonth\":\"2025-09\",\"isPaid\":\"1\",\"paidDate\":\"2025-09-26\",\"paymentMethod\":\"bank\"}]', 1700.00, 1200.00, 500.00, 'admin', '2025-09-26 16:45:30', 'admin', '2025-09-26 17:02:13', NULL, NULL, '', '2025-09-26 16:45:30', '', '2025-09-26 16:47:07');

-- ----------------------------
-- Table structure for website_feedback
-- ----------------------------
DROP TABLE IF EXISTS `website_feedback`;
CREATE TABLE `website_feedback`  (
  `feedback_id` bigint NOT NULL AUTO_INCREMENT COMMENT '反馈ID',
  `feedback_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '反馈类型：service-服务建议，facility-设施问题，staff-人员态度，other-其他',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '反馈标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '反馈内容',
  `contact_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `contact_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系邮箱',
  `elderly_id` bigint NULL DEFAULT NULL COMMENT '关联老人ID（如果是家属反馈）',
  `elderly_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老人姓名',
  `feedback_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '处理状态：0-待处理，1-处理中，2-已处理，3-已关闭',
  `priority` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '优先级：1-低，2-中，3-高，4-紧急',
  `reply_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '回复内容',
  `reply_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回复人',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '回复时间',
  `process_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '处理人',
  `process_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`feedback_id`) USING BTREE,
  INDEX `idx_feedback_type`(`feedback_type`) USING BTREE,
  INDEX `idx_feedback_status`(`feedback_status`) USING BTREE,
  INDEX `idx_elderly_id`(`elderly_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '意见反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_feedback
-- ----------------------------
INSERT INTO `website_feedback` VALUES (1, 'service', '餐饮服务建议', '希望早餐能增加一些清淡的粥类，老人比较喜欢', '张三', '13800138001', 'zhangsan@example.com', 1, '张大爷', '0', '2', NULL, NULL, NULL, NULL, NULL, 'admin', '2025-09-26 17:41:47', '', '2025-09-26 17:41:47', '家属反馈');
INSERT INTO `website_feedback` VALUES (2, 'facility', '房间空调故障', '房间空调制冷效果不好，需要维修', '李四', '13800138002', 'lisi@example.com', 2, '李奶奶', '1', '3', NULL, NULL, NULL, NULL, NULL, 'admin', '2025-09-26 17:41:47', '', '2025-09-26 17:41:47', '设施问题');
INSERT INTO `website_feedback` VALUES (3, 'staff', '护理人员态度问题', '某位护理人员态度比较冷淡，希望能改善', '王五', '13800138003', 'wangwu@example.com', 3, '王爷爷', '2', '2', NULL, NULL, NULL, NULL, NULL, 'admin', '2025-09-26 17:41:47', '', '2025-09-26 17:41:47', '已处理');
INSERT INTO `website_feedback` VALUES (4, 'other', '建议增加娱乐活动', '建议多组织一些适合老人的娱乐活动', '赵六', '13800138004', 'zhaoliu@example.com', NULL, NULL, '0', '1', NULL, NULL, NULL, NULL, NULL, 'admin', '2025-09-26 17:41:47', '', '2025-09-26 17:41:47', '匿名反馈');

-- ----------------------------
-- Table structure for website_health_report
-- ----------------------------
DROP TABLE IF EXISTS `website_health_report`;
CREATE TABLE `website_health_report`  (
  `report_id` bigint NOT NULL AUTO_INCREMENT COMMENT '报告ID',
  `elderly_id` bigint NOT NULL COMMENT '老人ID',
  `elderly_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '老人姓名',
  `report_date` date NOT NULL COMMENT '报告日期',
  `report_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '报告类型（体检、医疗、护理）',
  `doctor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `nurse_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '护士姓名',
  `vital_signs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '生命体征（血压、心率、体温等）',
  `blood_pressure` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '血压',
  `heart_rate` int NULL DEFAULT NULL COMMENT '心率',
  `temperature` decimal(3, 1) NULL DEFAULT NULL COMMENT '体温',
  `weight` decimal(5, 2) NULL DEFAULT NULL COMMENT '体重',
  `height` decimal(5, 2) NULL DEFAULT NULL COMMENT '身高',
  `blood_sugar` decimal(4, 1) NULL DEFAULT NULL COMMENT '血糖',
  `blood_oxygen` int NULL DEFAULT NULL COMMENT '血氧饱和度',
  `symptoms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '症状描述',
  `diagnosis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '诊断结果',
  `treatment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '治疗方案',
  `medications` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '用药情况',
  `nursing_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '护理记录',
  `recommendations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '建议',
  `next_check_date` date NULL DEFAULT NULL COMMENT '下次检查日期',
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '附件（检查报告图片等）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`report_id`) USING BTREE,
  INDEX `idx_elderly_id`(`elderly_id`) USING BTREE,
  INDEX `idx_report_date`(`report_date`) USING BTREE,
  INDEX `idx_report_type`(`report_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '健康报告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_health_report
-- ----------------------------
INSERT INTO `website_health_report` VALUES (3, 2, '李奶奶', '2023-12-01', '护理', '张医生', '李护士', '血压：140/85，心率：75，体温：36.8', '140/85', 75, 36.8, 65.00, 160.00, 7.2, 96, '关节疼痛', '关节炎症状加重', '物理治疗+药物治疗', '止痛药：布洛芬200mg，每日两次', '协助行走，热敷关节', '加强关节保护，避免受凉', '2023-12-20', 'https://example.com/report3.jpg', '0', 'admin', '2023-12-01 16:00:00', '', NULL, '护理记录报告');
INSERT INTO `website_health_report` VALUES (4, 4, '测试老人', '2025-09-26', '护理', '测试', '测试', '测试', '130/80', 70, 37.0, 660.00, 171.00, 5.2, 98, '头痛', '风大吹感冒了', '保守治疗，吃药', '每日按时吃', '测试', '测试', '2025-09-27', '测试', '0', '', '2025-09-26 14:41:31', '', NULL, '测试');
INSERT INTO `website_health_report` VALUES (5, 8, '张大爷', '2024-01-15', '体检', '李医生', '王护士', NULL, '120/80', 75, 36.5, 70.00, 170.00, 5.5, 98, '无特殊症状', '身体健康，各项指标正常', '继续保持良好的生活习惯', '无特殊用药', '老人精神状态良好，配合检查', '建议定期体检，注意饮食均衡', '2024-04-15', NULL, '0', 'admin', '2025-09-29 14:22:43', '', NULL, '定期体检报告');
INSERT INTO `website_health_report` VALUES (6, 8, '张大爷', '2024-01-10', '医疗', '张医生', '李护士', NULL, '130/85', 80, 37.2, 69.50, 170.00, 6.2, 96, '轻微咳嗽，食欲不振', '上呼吸道感染', '多休息，多喝水，按时服药', '阿莫西林胶囊，每日3次，每次1粒', '按时服药，多喝水，注意保暖', '避免受凉，加强营养', '2024-01-17', NULL, '0', 'admin', '2025-09-29 14:22:43', '', NULL, '感冒治疗记录');
INSERT INTO `website_health_report` VALUES (10, 8, '张大爷', '2025-09-29', '护理', '测试', '测试', '测试', '130/80', 72, 37.0, 70.00, 170.00, 6.3, 98, '测试', '测试', '测试', '测试', '测试', '测试', '2025-09-30', NULL, '0', '', '2025-09-29 14:35:25', '', NULL, NULL);
INSERT INTO `website_health_report` VALUES (11, 8, '张大爷', '2025-09-25', '医疗', '测试', '测试', '测试', '130/80', 72, 36.0, 70.00, 170.00, 6.3, 98, '测试', '测试', '测试', '测试', '测试', '测试', '2025-09-11', NULL, '0', '', '2025-09-29 14:39:41', '', NULL, NULL);
INSERT INTO `website_health_report` VALUES (13, 6, '测试老人一号', '2025-09-02', '医疗', '测试', '测试', '测试', '130/80', 72, 37.0, 70.00, 170.00, 6.2, 98, '测试', '测试 ', '测试', '测试', '测试', '测试', '2025-09-18', NULL, '0', '', '2025-09-29 17:50:21', '', NULL, NULL);
INSERT INTO `website_health_report` VALUES (19, 7, '测试老人二号', '2025-10-09', '体检', '测试', '测试', NULL, '130/80', 72, 37.0, 70.00, 170.00, 6.2, 98, '测试', '测试', '测试', '测试', '测试', '测试', '2025-10-08', NULL, '0', '', '2025-10-09 11:37:28', '', NULL, NULL);
INSERT INTO `website_health_report` VALUES (20, 10, '王二测试老人', '2025-10-10', '体检', '测试', '测试', NULL, '130/80', 72, 37.0, 70.00, 170.00, 6.2, 98, '测试', '测试', '测试', '测试', '测试', '测试', '2025-10-03', NULL, '0', '', '2025-10-10 01:04:19', '', NULL, NULL);

-- ----------------------------
-- Table structure for website_main_services
-- ----------------------------
DROP TABLE IF EXISTS `website_main_services`;
CREATE TABLE `website_main_services`  (
  `service_id` bigint NOT NULL AUTO_INCREMENT COMMENT '服务ID',
  `service_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务标题',
  `service_icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务图标',
  `service_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '服务描述',
  `service_features` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '服务特色（JSON格式）',
  `service_price` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务价格',
  `sort_order` bigint NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '主要服务项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_main_services
-- ----------------------------
INSERT INTO `website_main_services` VALUES (1, '生活照料', 'el-icon-user-solid', '24小时专业护理，包括日常起居、饮食照料、个人卫生等全方位生活服务。测试', '[\"日常起居照料\",\"个人卫生护理\",\"衣物清洗\",\"房间整理\",\"安全监护\"]', '3000-5000元/月', 1, '0', 'admin', '2025-09-25 17:11:46', '', NULL, '');
INSERT INTO `website_main_services` VALUES (2, '医疗护理', 'el-icon-first-aid-kit', '专业医护团队，定期健康检查，药物管理，紧急医疗救助等医疗服务。', '[\"定期健康检查\", \"药物管理\", \"紧急医疗救助\", \"康复训练\", \"健康档案管理\"]', '2000-4000元/月', 2, '0', 'admin', '2025-09-25 17:11:46', '', NULL, '');
INSERT INTO `website_main_services` VALUES (3, '营养膳食', 'el-icon-food', '专业营养师配餐，根据老人健康状况和口味偏好，提供营养均衡的膳食。', '[\"专业营养配餐\", \"个性化膳食\", \"特殊饮食需求\", \"营养咨询\", \"食品安全保障\"]', '1500-2500元/月', 3, '0', 'admin', '2025-09-25 17:11:46', '', NULL, '');
INSERT INTO `website_main_services` VALUES (4, '文娱活动', 'el-icon-sunny', '丰富多彩的文化娱乐活动，包括书法、绘画、音乐、舞蹈等，丰富老年生活。', '[\"书法绘画\", \"音乐舞蹈\", \"棋牌游戏\", \"健身运动\", \"节日庆祝\"]', '500-1000元/月', 4, '0', 'admin', '2025-09-25 17:11:46', '', NULL, '');
INSERT INTO `website_main_services` VALUES (5, '心理关怀', 'el-icon-chat-line-round', '专业心理咨询师提供心理疏导，帮助老人保持积极乐观的心态。', '[\"心理咨询\", \"情绪疏导\", \"社交活动\", \"家庭沟通\", \"心理评估\"]', '800-1500元/月', 5, '0', 'admin', '2025-09-25 17:11:46', '', NULL, '');
INSERT INTO `website_main_services` VALUES (6, '家属沟通', 'el-icon-phone', '定期向家属汇报老人情况，建立家属微信群，随时沟通老人生活状态。', '[\"定期汇报\", \"微信群沟通\", \"视频通话\", \"家属活动\", \"意见反馈\"]', '免费服务', 6, '0', 'admin', '2025-09-25 17:11:46', '', NULL, '');
INSERT INTO `website_main_services` VALUES (8, '测试服务项目', 'el-icon-star-on', '这是一个测试服务项目', '[\"测试特色\"]', '999', 0, '0', '', NULL, '', NULL, '测试');

-- ----------------------------
-- Table structure for website_medical_services
-- ----------------------------
DROP TABLE IF EXISTS `website_medical_services`;
CREATE TABLE `website_medical_services`  (
  `service_id` bigint NOT NULL AUTO_INCREMENT COMMENT '服务ID',
  `service_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务标题',
  `service_icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务图标',
  `service_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '服务描述',
  `service_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务时间',
  `service_staff` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务人员',
  `sort_order` bigint NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '医疗护理服务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_medical_services
-- ----------------------------
INSERT INTO `website_medical_services` VALUES (1, '健康检查', 'el-icon-user-solid', '定期进行全面的健康检查，包括血压、血糖、心电图等常规检查。', '每日监测', '专业护士', 1, '0', 'admin', '2025-09-25 17:24:07', '', NULL, '');
INSERT INTO `website_medical_services` VALUES (2, '药物管理', 'el-icon-water-cup', '专业医护人员负责药物分发、服用监督和药物效果监测。', '按需、按时、按量服药', '执业药师', 2, '0', 'admin', '2025-09-25 17:24:07', '', NULL, '');
INSERT INTO `website_medical_services` VALUES (3, '康复训练', 'el-icon-refresh', '针对不同身体状况制定个性化康复训练计划，促进身体功能恢复。', '18:00-19:00', '康复治疗师', 3, '0', 'admin', '2025-09-25 17:24:07', '', NULL, '');
INSERT INTO `website_medical_services` VALUES (4, '紧急救助', 'el-icon-warning', '24小时紧急医疗救助服务，与附近医院建立绿色通道。', '24小时待命', '急救医生', 4, '0', 'admin', '2025-09-25 17:24:07', '', NULL, '');

-- ----------------------------
-- Table structure for website_news
-- ----------------------------
DROP TABLE IF EXISTS `website_news`;
CREATE TABLE `website_news`  (
  `news_id` bigint NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `summary` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '摘要',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '分类',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '图片地址',
  `is_featured` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否头条（0否 1是）',
  `views` int NULL DEFAULT 0 COMMENT '阅读量',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`news_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '新闻表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_news
-- ----------------------------
INSERT INTO `website_news` VALUES (1, '智慧养老院举办春季健康讲座', '邀请知名医生为老人讲解春季养生知识，提高健康意识，受到老人和家属的一致好评。', '<p>3月15日，智慧养老院成功举办了春季健康讲座，邀请了北京协和医院心内科主任医师张教授为入住老人和家属讲解春季养生知识。</p><p>讲座中，张教授详细介绍了春季常见疾病的预防方法，包括心血管疾病、呼吸道疾病等，并现场演示了适合老年人的运动方式。</p><p>老人们积极参与互动，提出了许多关于健康养生的问题，张教授都一一耐心解答。讲座结束后，许多老人表示受益匪浅，希望养老院能够多举办这样的健康讲座。</p><p>此次讲座不仅提高了老人的健康意识，也增进了家属对养老院服务的了解，进一步提升了养老院的专业形象。</p>', 'nursing-home', 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', 'N', 1, '0', 'admin', '2025-09-24 12:30:33', '', NULL, '头条新闻');
INSERT INTO `website_news` VALUES (2, '新设施投入使用，服务能力再提升', '全新的康复训练室和图书阅览室正式投入使用，为老人提供更好的服务。', '<p>经过三个月的建设，智慧养老院的新设施正式投入使用。新增的康复训练室配备了最新的康复设备，包括电动起立床、平衡训练器等。</p><p>图书阅览室拥有各类图书5000余册，涵盖文学、历史、养生、科技等多个领域，为老人提供丰富的精神食粮。</p><p>新设施的投入使用，标志着智慧养老院服务能力的进一步提升，为老人提供更加专业、全面的服务。</p>', 'nursing-home', '/profile/upload/2025/09/24/3_20250924150324A001.jpg', 'N', 2, '0', 'admin', '2025-09-24 12:30:33', '', '2025-09-24 15:03:26', '设施新闻');
INSERT INTO `website_news` VALUES (3, '春季养生小贴士：如何预防春季常见疾病', '春季是疾病高发季节，了解一些养生小贴士，帮助老人健康度过春季。', '<p>春季是万物复苏的季节，但也是疾病高发的季节。对于老年人来说，春季养生尤为重要。</p><p><strong>1. 注意保暖</strong><br>春季气温变化大，老人要注意适时增减衣物，避免着凉。</p><p><strong>2. 合理饮食</strong><br>春季应多吃新鲜蔬菜水果，少吃油腻食物，保持饮食清淡。</p><p><strong>3. 适量运动</strong><br>选择适合的运动方式，如散步、太极拳等，增强体质。</p><p><strong>4. 保持心情愉快</strong><br>春季容易情绪波动，要保持心情愉快，多参加社交活动。</p>', 'health', 'https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', 'Y', 3, '0', 'admin', '2025-09-24 12:30:33', '', '2025-09-24 16:55:26', '健康资讯');
INSERT INTO `website_news` VALUES (4, '测试文章', '这是一篇测试的文章', '这是一篇用来测试的文章', 'nursing-home', '/profile/upload/2025/09/24/1_20250924164600A001.jpg', 'Y', 8, '0', '', '2025-09-24 16:46:17', '', '2025-09-24 16:48:08', '测试用');

-- ----------------------------
-- Table structure for website_nutrition_features
-- ----------------------------
DROP TABLE IF EXISTS `website_nutrition_features`;
CREATE TABLE `website_nutrition_features`  (
  `feature_id` bigint NOT NULL AUTO_INCREMENT COMMENT '特色ID',
  `feature_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '特色标题',
  `feature_icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '特色图标',
  `feature_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '特色描述',
  `sort_order` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`feature_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '营养膳食特色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_nutrition_features
-- ----------------------------
INSERT INTO `website_nutrition_features` VALUES (1, '专业营养师', 'el-icon-user', '拥有专业资质的营养师团队，为每位老人制定个性化营养方案。', 1, '0', 'admin', '2025-09-26 10:16:30', '', NULL, '');
INSERT INTO `website_nutrition_features` VALUES (2, '食材安全', 'el-icon-check', '严格把控食材来源，确保食品安全，所有食材均通过质量检测。', 2, '0', 'admin', '2025-09-26 10:16:30', '', NULL, '');
INSERT INTO `website_nutrition_features` VALUES (3, '个性化配餐', 'el-icon-food', '根据老人健康状况、口味偏好和营养需求，提供个性化配餐服务。', 3, '0', 'admin', '2025-09-26 10:16:30', '', NULL, '');
INSERT INTO `website_nutrition_features` VALUES (4, '营养监测', 'el-icon-data-analysis', '定期进行营养状况评估，及时调整膳食方案，确保营养均衡。', 4, '0', 'admin', '2025-09-26 10:16:30', '', NULL, '');
INSERT INTO `website_nutrition_features` VALUES (5, '测试', 'el-icon-star-on', '测试', 5, '0', '', '2025-09-26 10:29:48', '', NULL, NULL);

-- ----------------------------
-- Table structure for website_nutrition_menu
-- ----------------------------
DROP TABLE IF EXISTS `website_nutrition_menu`;
CREATE TABLE `website_nutrition_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `meal_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用餐时间',
  `meal_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '餐次名称',
  `menu_dishes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '菜品信息（JSON格式）',
  `sort_order` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '今日菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of website_nutrition_menu
-- ----------------------------
INSERT INTO `website_nutrition_menu` VALUES (1, '7:00-8:00', '早餐', '[{\"name\":\"小米粥\",\"nutrition\":\"碳水化合物\"},{\"name\":\"蒸蛋羹\",\"nutrition\":\"蛋白质\"},{\"name\":\"小菜\",\"nutrition\":\"维生素\"}]', 1, '0', 'admin', '2025-09-26 10:16:30', '', NULL, '');
INSERT INTO `website_nutrition_menu` VALUES (2, '12:00-13:00', '午餐', '[{\"name\":\"红烧鱼\",\"nutrition\":\"优质蛋白\"},{\"name\":\"青菜豆腐\",\"nutrition\":\"植物蛋白\"},{\"name\":\"米饭\",\"nutrition\":\"碳水化合物\"}]', 2, '0', 'admin', '2025-09-26 10:16:30', '', NULL, '');
INSERT INTO `website_nutrition_menu` VALUES (3, '18:00-19:00', '晚餐', '[{\"name\":\"瘦肉粥\",\"nutrition\":\"易消化蛋白\"},{\"name\":\"蒸蛋\",\"nutrition\":\"蛋白质\"},{\"name\":\"时令蔬菜\",\"nutrition\":\"维生素\"}]', 3, '0', 'admin', '2025-09-26 10:16:30', '', NULL, '');
INSERT INTO `website_nutrition_menu` VALUES (4, '8:00-9:00', '测试', '[{\"name\":\"测试\",\"nutrition\":\"蛋白质，果糖\"},{\"name\":\"测试2\",\"nutrition\":\"维生素，牛肉\"}]', 4, '0', '', '2025-09-26 10:31:01', '', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
