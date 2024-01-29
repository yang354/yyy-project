/*
 Navicat Premium Data Transfer

 Source Server         : yangyangyang
 Source Server Type    : MySQL
 Source Server Version : 80020 (8.0.20)
 Source Host           : localhost:3306
 Source Schema         : yyy-cloud

 Target Server Type    : MySQL
 Target Server Version : 80020 (8.0.20)
 File Encoding         : 65001

 Date: 15/01/2024 15:38:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 't_goods', '商品表', NULL, NULL, 'TGoods', 'crud', 'com.yyy.system', 'system', 'goods', '商品', 'yyy', '0', '/', NULL, 'admin', '2024-01-02 17:32:23', '', NULL, NULL);
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 't_order', '订单', 't_goods', 'id', 'TOrder', 'sub', 'com.yyy.system', 'system', 'order', '订单', 'yyy', '0', '/', '{\"parentMenuId\":\"1\"}', 'admin', '2024-01-02 17:38:52', '', '2024-01-02 17:51:15', NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (2, '1', 'id', '商品ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-02 17:32:23', '', '2024-01-02 17:35:53');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (3, '1', 'goods_name', '商品名称', 'varchar(16)', 'String', 'goodsName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-01-02 17:32:23', '', '2024-01-02 17:35:53');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (4, '1', 'goods_title', '商品标题', 'varchar(64)', 'String', 'goodsTitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-01-02 17:32:23', '', '2024-01-02 17:35:53');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (5, '1', 'goods_img', '商品图片', 'varchar(64)', 'String', 'goodsImg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-01-02 17:32:23', '', '2024-01-02 17:35:53');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (6, '1', 'goods_detail', '商品详情', 'longtext', 'String', 'goodsDetail', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2024-01-02 17:32:23', '', '2024-01-02 17:35:53');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (7, '1', 'goods_price', '商品价格', 'decimal(10,2)', 'BigDecimal', 'goodsPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-01-02 17:32:23', '', '2024-01-02 17:35:53');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (8, '1', 'goods_stock', '商品库存，-1表示没有限制', 'int', 'Long', 'goodsStock', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-01-02 17:32:23', '', '2024-01-02 17:35:53');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (9, '2', 'id', '订单ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-02 17:38:52', '', '2024-01-02 17:51:15');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (10, '2', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-01-02 17:38:52', '', '2024-01-02 17:51:15');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (11, '2', 'goods_id', '商品ID', 'bigint', 'Long', 'goodsId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-01-02 17:38:52', '', '2024-01-02 17:51:15');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (12, '2', 'delivery_addr_id', '收获地址ID', 'bigint', 'Long', 'deliveryAddrId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-01-02 17:38:52', '', '2024-01-02 17:51:15');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (13, '2', 'goods_name', '商品名字', 'varchar(16)', 'String', 'goodsName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-01-02 17:38:52', '', '2024-01-02 17:51:15');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (14, '2', 'goods_count', '商品数量', 'int', 'Long', 'goodsCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-01-02 17:38:52', '', '2024-01-02 17:51:15');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (15, '2', 'goods_price', '商品价格', 'decimal(10,2)', 'BigDecimal', 'goodsPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-01-02 17:38:52', '', '2024-01-02 17:51:15');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (16, '2', 'order_channel', '1 pc,2 android, 3 ios', 'tinyint', 'Long', 'orderChannel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-01-02 17:38:52', '', '2024-01-02 17:51:15');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (17, '2', 'status', '订单状态，0新建未支付，1已支付，2已发货，3已收货，4已退货，5已完成', 'tinyint', 'Long', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2024-01-02 17:38:52', '', '2024-01-02 17:51:15');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (18, '2', 'create_date', '订单创建时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2024-01-02 17:38:52', '', '2024-01-02 17:51:15');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (19, '2', 'pay_date', '支付时间', 'datetime', 'Date', 'payDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2024-01-02 17:38:52', '', '2024-01-02 17:51:15');
COMMIT;

-- ----------------------------
-- Table structure for sys_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_user`;
CREATE TABLE `sys_auth_user` (
  `auth_id` bigint NOT NULL AUTO_INCREMENT COMMENT '授权ID',
  `uuid` varchar(500) NOT NULL COMMENT '第三方平台用户唯一ID',
  `user_id` bigint NOT NULL COMMENT '系统用户ID',
  `user_name` varchar(30) NOT NULL COMMENT '登录账号',
  `nick_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(500) DEFAULT '' COMMENT '头像地址',
  `email` varchar(255) DEFAULT '' COMMENT '用户邮箱',
  `source` varchar(255) DEFAULT '' COMMENT '用户来源',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='第三方授权表';

-- ----------------------------
-- Records of sys_auth_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-05-30 17:05:08', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-05-30 17:05:08', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-05-30 17:05:08', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-05-30 17:05:08', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-30 17:05:08', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-30 17:05:08', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-30 17:05:08', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-30 17:05:08', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-30 17:05:08', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-30 17:05:08', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-30 17:05:08', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-30 17:05:08', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-30 17:05:08', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-30 17:05:08', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (207, 0, '', '菜市场部', 0, NULL, NULL, NULL, '0', '0', '', '2023-06-05 11:49:26', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '性别男');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '性别女');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '通知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '公告');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '停用状态');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '登录状态列表');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-05-30 17:05:08', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (100, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-30 20:22:48');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (101, 'admin', '127.0.0.1', '0', '登录成功', '2023-06-01 14:09:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (102, 'admin', '127.0.0.1', '0', '登录成功', '2023-06-01 20:07:06');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (103, 'admin', '127.0.0.1', '0', '登录成功', '2023-06-02 15:06:50');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (104, 'admin', '127.0.0.1', '0', '登录成功', '2023-06-02 17:05:48');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (105, 'admin', '127.0.0.1', '0', '登录成功', '2023-06-02 17:10:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (106, 'admin', '127.0.0.1', '0', '登录成功', '2023-06-05 17:49:35');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (107, 'admin', '127.0.0.1', '0', '登录成功', '2023-06-05 18:22:31');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (108, 'admin', '127.0.0.1', '0', '登录成功', '2023-06-06 10:59:14');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (109, 'admin', '127.0.0.1', '0', '登录成功', '2023-06-09 23:01:18');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (110, 'admin', '127.0.0.1', '0', '登录成功', '2023-06-10 11:41:22');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (111, 'admin', '127.0.0.1', '0', '登录成功', '2023-06-11 22:06:32');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (112, 'admin', '127.0.0.1', '0', '登录成功', '2024-01-02 16:25:07');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (113, 'admin', '127.0.0.1', '0', '退出成功', '2024-01-02 16:26:59');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (114, 'admin', '127.0.0.1', '0', '登录成功', '2024-01-02 16:27:04');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (115, 'admin', '127.0.0.1', '0', '退出成功', '2024-01-02 16:27:34');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (116, 'admin', '127.0.0.1', '0', '登录成功', '2024-01-02 16:28:05');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (117, 'admin', '192.168.1.113', '0', '登录成功', '2024-01-02 16:29:43');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (118, 'admin', '192.168.1.113', '0', '退出成功', '2024-01-02 16:43:59');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (119, 'admin', '192.168.1.113', '0', '登录成功', '2024-01-02 16:44:07');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (120, 'admin', '127.0.0.1', '0', '退出成功', '2024-01-02 17:17:59');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (121, 'admin', '127.0.0.1', '0', '登录成功', '2024-01-02 17:18:09');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (122, 'admin', '127.0.0.1', '0', '退出成功', '2024-01-02 17:19:17');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (123, 'admin', '127.0.0.1', '0', '登录成功', '2024-01-02 17:19:23');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (124, 'admin', '127.0.0.1', '0', '退出成功', '2024-01-02 19:12:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (125, 'admin', '127.0.0.1', '0', '登录成功', '2024-01-02 19:13:03');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (126, 'admin', '127.0.0.1', '0', '登录成功', '2024-01-02 19:52:33');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (127, 'admin', '127.0.0.1', '0', '登录成功', '2024-01-03 09:09:33');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (128, 'admin', '127.0.0.1', '0', '登录成功', '2024-01-05 14:09:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (129, 'admin', '127.0.0.1', '0', '登录成功', '2024-01-05 14:10:03');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (130, 'admin', '127.0.0.1', '0', '登录成功', '2024-01-11 09:23:34');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (131, 'admin', '127.0.0.1', '0', '退出成功', '2024-01-11 09:32:39');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `status`, `msg`, `access_time`) VALUES (132, 'admin', '127.0.0.1', '0', '登录成功', '2024-01-11 09:33:24');
COMMIT;

-- ----------------------------
-- Table structure for sys_media_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_media_info`;
CREATE TABLE `sys_media_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_id` varchar(64) DEFAULT NULL COMMENT '名称',
  `file_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `size` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `type` int DEFAULT NULL COMMENT '0-图片;1-视频;2-PDF;3-PPT;4-word文档;5-excel',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统媒体信息表';

-- ----------------------------
-- Records of sys_media_info
-- ----------------------------
BEGIN;
INSERT INTO `sys_media_info` (`id`, `file_id`, `file_name`, `url`, `size`, `type`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, '013aee7d-da6b-452d-a075-7c9bc8b2a0c9', NULL, 'https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2023/06/24/7809cc9c442a402a873acc5897a07f00164953-desktop_new_imac_2021_announcement-5120x2880.jpeg', NULL, NULL, '0', '', NULL, '', NULL, NULL);
INSERT INTO `sys_media_info` (`id`, `file_id`, `file_name`, `url`, `size`, `type`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (110, '809ca7e7-9216-4f14-b751-d2b8031dbf6b', '/2023/06/24/007vX3dfgy1g8iwrmgfoej30rc0rc43s_20230624204751A001.jpg', 'http://127.0.0.1:9300/2023/06/24/007vX3dfgy1g8iwrmgfoej30rc0rc43s_20230624204751A001.jpg', NULL, NULL, '0', '', NULL, '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-05-30 17:05:08', '', '2023-06-23 16:55:47', '系统管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-05-30 17:05:08', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-06-21 22:59:05', '', '2023-06-21 23:15:29', '系统工具目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-05-30 17:05:08', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-05-30 17:05:08', '', '2023-06-23 16:55:47', '用户管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-05-30 17:05:08', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-05-30 17:05:08', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-05-30 17:05:08', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-05-30 17:05:08', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-05-30 17:05:08', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-05-30 17:05:08', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-05-30 17:05:08', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-05-30 17:05:08', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-05-30 17:05:08', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-05-30 17:05:08', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2023-05-30 17:05:08', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2023-05-30 17:05:08', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-05-30 17:05:08', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-05-30 17:05:08', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-05-30 17:05:08', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-05-30 17:05:08', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2023-05-30 17:05:08', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2023-05-30 17:05:08', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-05-30 17:05:08', '', '2023-06-22 14:42:10', '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2000, '商品', 1, 1, 'goods', 'system/goods/index', NULL, 1, 0, 'C', '0', '0', 'system:goods:list', '#', 'admin', '2024-01-02 18:59:25', '', NULL, '商品菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2001, '商品查询', 2000, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:goods:query', '#', 'admin', '2024-01-02 18:59:25', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2002, '商品新增', 2000, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:goods:add', '#', 'admin', '2024-01-02 18:59:25', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2003, '商品修改', 2000, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:goods:edit', '#', 'admin', '2024-01-02 18:59:25', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2004, '商品删除', 2000, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:goods:remove', '#', 'admin', '2024-01-02 18:59:25', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2005, '商品导出', 2000, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:goods:export', '#', 'admin', '2024-01-02 18:59:25', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-05-30 17:05:08', '', NULL, '管理员');
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-05-30 17:05:08', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (100, '角色管理', 1, 'com.yyy.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"remark\":\"222\",\"roleId\":100,\"roleKey\":\"yyy\",\"roleName\":\"111\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-01 21:52:18');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (101, '代码生成', 6, 'com.yyy.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"t_goods\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 17:32:24');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (102, '代码生成', 2, 'com.yyy.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/t_goods', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 17:35:53');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (103, '代码生成', 6, 'com.yyy.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"t_order\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 17:38:52');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (104, '商品', 5, 'com.yyy.system.controller.TGoodsController.export()', 'POST', 1, 'admin', NULL, '/goods/export', '127.0.0.1', '', '{\"params\":{}}', NULL, 0, NULL, '2024-01-03 09:37:24');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES (105, '商品', 2, 'com.yyy.system.controller.TGoodsController.edit()', 'PUT', 1, 'admin', NULL, '/goods', '127.0.0.1', '', '{\"goodsDetail\":\"苹果1411\",\"goodsName\":\"苹果14\",\"goodsPrice\":100,\"goodsStock\":100,\"goodsTitle\":\"苹果14\",\"id\":11,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 09:39:18');
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-05-30 17:05:08', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-05-30 17:05:08', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-05-30 17:05:08', '', NULL, '普通角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '111', 'yyy', 0, '1', 1, 1, '0', '0', 'admin', '2023-06-01 21:52:18', '', NULL, '222');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 100);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 101);
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 109);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 110);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 111);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 112);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 113);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 114);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 115);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 116);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 500);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 501);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1019);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1020);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1021);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1022);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1023);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1024);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1025);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1030);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1031);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1032);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1033);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1034);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1035);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1038);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1039);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1040);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1041);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1042);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1043);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1044);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1045);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1046);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1047);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1048);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1049);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1050);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1051);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1052);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1053);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1054);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1058);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1059);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1060);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 4);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-05-30 17:05:08', 'admin', '2023-05-30 17:05:08', '', NULL, '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-05-30 17:05:08', 'admin', '2023-05-30 17:05:08', '', NULL, '测试员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (1, 1);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `goods_name` varchar(16) DEFAULT NULL COMMENT '商品名称',
  `goods_title` varchar(64) DEFAULT NULL COMMENT '商品标题',
  `goods_img` varchar(64) DEFAULT NULL COMMENT '商品图片',
  `goods_detail` longtext COMMENT '商品详情',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品价格',
  `goods_stock` int DEFAULT '0' COMMENT '商品库存，-1表示没有限制',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of t_goods
-- ----------------------------
BEGIN;
INSERT INTO `t_goods` (`id`, `goods_name`, `goods_title`, `goods_img`, `goods_detail`, `goods_price`, `goods_stock`) VALUES (11, '苹果14', '苹果14', NULL, '苹果1411', 100.00, 100);
COMMIT;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `goods_id` bigint DEFAULT NULL COMMENT '商品ID',
  `delivery_addr_id` bigint DEFAULT NULL COMMENT '收获地址ID',
  `goods_name` varchar(16) DEFAULT NULL COMMENT '商品名字',
  `goods_count` int DEFAULT '0' COMMENT '商品数量',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品价格',
  `order_channel` tinyint DEFAULT '0' COMMENT '1 pc,2 android, 3 ios',
  `status` tinyint DEFAULT '0' COMMENT '订单状态，0新建未支付，1已支付，2已发货，3已收货，4已退货，5已完成',
  `create_date` datetime DEFAULT NULL COMMENT '订单创建时间',
  `pay_date` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=800 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
BEGIN;
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (400, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:25:57', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (401, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:25:57', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (402, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:25:57', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (403, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:25:57', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (404, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:25:57', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (405, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:25:57', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (406, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:25:57', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (407, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:25:57', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (408, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:25:57', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (409, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:25:57', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (410, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:30', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (411, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:30', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (412, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:30', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (413, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:30', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (414, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:30', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (415, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:30', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (416, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:30', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (417, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (418, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (419, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (420, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (421, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (422, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (423, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (424, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (425, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (426, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (427, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (428, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (429, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (430, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (431, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (432, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (433, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (434, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (435, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (436, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (437, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (438, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (439, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (440, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (441, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (442, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (443, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (444, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (445, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (446, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (447, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (448, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (449, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (450, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (451, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (452, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (453, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (454, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (455, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (456, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (457, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (458, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (459, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (460, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (461, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (462, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (463, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (464, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (465, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (466, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:31', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (467, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (468, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (469, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (470, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (471, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (472, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (473, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (474, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (475, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (476, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (477, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (478, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (479, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (480, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (481, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (482, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (483, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (484, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (485, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (486, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (487, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (488, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (489, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (490, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (491, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (492, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (493, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (494, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (495, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (496, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (497, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (498, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (499, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:28:32', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (500, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (501, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (502, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (503, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (504, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (505, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (506, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (507, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (508, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (509, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (510, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (511, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (512, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (513, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (514, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (515, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (516, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (517, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (518, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (519, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (520, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (521, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (522, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (523, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (524, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (525, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (526, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (527, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (528, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (529, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (530, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (531, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:19', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (532, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (533, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (534, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (535, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (536, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (537, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (538, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (539, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (540, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (541, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (542, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (543, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (544, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (545, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (546, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (547, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (548, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (549, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (550, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (551, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (552, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (553, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (554, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (555, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (556, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (557, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (558, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (559, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (560, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (561, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (562, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (563, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (564, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (565, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (566, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (567, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (568, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (569, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (570, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (571, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (572, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (573, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (574, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (575, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (576, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (577, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (578, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (579, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (580, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (581, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (582, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (583, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (584, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (585, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (586, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (587, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (588, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (589, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (590, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (591, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (592, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (593, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (594, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:20', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (595, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:21', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (596, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:21', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (597, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:21', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (598, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:21', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (599, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:32:21', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (600, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (601, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (602, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (603, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (604, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (605, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (606, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (607, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (608, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (609, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (610, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (611, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (612, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (613, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (614, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (615, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:49', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (616, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (617, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (618, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (619, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (620, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (621, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (622, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (623, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (624, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (625, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (626, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (627, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (628, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (629, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (630, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (631, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (632, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (633, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (634, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (635, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (636, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (637, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (638, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (639, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (640, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (641, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (642, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (643, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (644, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (645, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (646, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (647, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (648, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (649, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (650, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (651, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (652, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (653, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (654, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (655, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (656, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (657, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (658, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (659, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (660, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (661, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (662, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (663, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (664, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (665, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (666, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (667, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (668, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (669, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:50', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (670, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (671, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (672, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (673, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (674, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (675, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (676, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (677, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (678, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (679, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (680, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (681, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (682, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (683, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (684, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (685, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (686, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (687, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (688, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (689, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (690, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (691, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (692, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (693, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (694, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (695, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (696, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (697, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (698, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (699, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:35:51', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (700, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:44', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (701, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:44', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (702, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:44', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (703, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:44', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (704, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:44', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (705, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:44', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (706, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:44', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (707, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:44', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (708, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:44', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (709, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:44', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (710, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:44', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (711, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:44', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (712, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (713, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (714, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (715, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (716, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (717, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (718, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (719, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (720, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (721, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (722, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (723, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (724, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (725, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (726, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (727, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (728, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (729, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (730, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (731, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (732, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (733, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (734, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (735, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (736, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (737, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (738, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (739, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (740, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (741, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (742, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (743, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (744, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (745, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (746, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (747, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (748, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (749, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:45', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (750, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (751, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (752, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (753, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (754, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (755, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (756, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (757, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (758, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (759, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (760, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (761, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (762, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (763, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (764, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (765, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (766, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (767, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (768, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (769, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (770, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (771, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (772, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (773, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (774, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (775, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (776, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (777, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (778, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (779, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (780, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (781, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (782, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (783, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (784, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (785, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (786, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (787, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (788, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (789, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (790, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (791, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (792, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (793, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (794, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (795, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (796, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (797, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (798, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
INSERT INTO `t_order` (`id`, `user_id`, `goods_id`, `delivery_addr_id`, `goods_name`, `goods_count`, `goods_price`, `order_channel`, `status`, `create_date`, `pay_date`) VALUES (799, 1, 11, 0, '苹果14', 1, 9999.00, 1, 0, '2023-07-13 15:38:46', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_seckill_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_seckill_goods`;
CREATE TABLE `t_seckill_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '秒杀商品ID',
  `goods_id` bigint NOT NULL COMMENT '商品ID',
  `seckill_price` decimal(10,2) NOT NULL COMMENT '秒杀家',
  `stock_count` int NOT NULL COMMENT '库存数量',
  `start_date` datetime NOT NULL COMMENT '秒杀开始时间',
  `end_date` datetime NOT NULL COMMENT '秒杀结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_seckill_goods
-- ----------------------------
BEGIN;
INSERT INTO `t_seckill_goods` (`id`, `goods_id`, `seckill_price`, `stock_count`, `start_date`, `end_date`) VALUES (3, 11, 9999.00, 0, '2023-07-13 11:22:57', '2023-07-13 11:23:08');
COMMIT;

-- ----------------------------
-- Table structure for t_seckill_order
-- ----------------------------
DROP TABLE IF EXISTS `t_seckill_order`;
CREATE TABLE `t_seckill_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '秒杀订单ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `goods_id` bigint NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=700 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_seckill_order
-- ----------------------------
BEGIN;
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (300, 1, 400, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (301, 1, 401, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (302, 1, 402, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (303, 1, 403, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (304, 1, 404, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (305, 1, 405, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (306, 1, 406, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (307, 1, 407, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (308, 1, 408, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (309, 1, 409, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (310, 1, 410, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (311, 1, 411, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (312, 1, 412, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (313, 1, 413, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (314, 1, 414, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (315, 1, 415, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (316, 1, 416, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (317, 1, 417, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (318, 1, 418, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (319, 1, 419, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (320, 1, 420, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (321, 1, 421, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (322, 1, 422, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (323, 1, 423, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (324, 1, 424, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (325, 1, 425, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (326, 1, 426, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (327, 1, 427, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (328, 1, 428, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (329, 1, 429, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (330, 1, 430, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (331, 1, 431, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (332, 1, 432, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (333, 1, 433, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (334, 1, 434, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (335, 1, 435, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (336, 1, 436, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (337, 1, 437, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (338, 1, 438, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (339, 1, 439, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (340, 1, 440, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (341, 1, 441, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (342, 1, 442, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (343, 1, 443, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (344, 1, 444, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (345, 1, 445, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (346, 1, 446, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (347, 1, 447, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (348, 1, 448, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (349, 1, 449, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (350, 1, 450, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (351, 1, 451, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (352, 1, 452, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (353, 1, 453, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (354, 1, 454, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (355, 1, 455, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (356, 1, 456, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (357, 1, 457, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (358, 1, 458, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (359, 1, 459, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (360, 1, 460, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (361, 1, 461, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (362, 1, 462, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (363, 1, 463, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (364, 1, 464, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (365, 1, 465, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (366, 1, 466, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (367, 1, 467, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (368, 1, 468, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (369, 1, 469, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (370, 1, 470, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (371, 1, 471, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (372, 1, 472, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (373, 1, 473, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (374, 1, 474, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (375, 1, 475, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (376, 1, 476, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (377, 1, 477, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (378, 1, 478, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (379, 1, 479, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (380, 1, 480, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (381, 1, 481, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (382, 1, 482, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (383, 1, 483, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (384, 1, 484, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (385, 1, 485, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (386, 1, 486, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (387, 1, 487, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (388, 1, 488, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (389, 1, 489, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (390, 1, 490, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (391, 1, 491, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (392, 1, 492, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (393, 1, 493, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (394, 1, 494, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (395, 1, 495, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (396, 1, 496, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (397, 1, 497, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (398, 1, 498, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (399, 1, 499, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (400, 1, 500, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (401, 1, 501, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (402, 1, 502, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (403, 1, 503, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (404, 1, 504, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (405, 1, 505, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (406, 1, 506, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (407, 1, 507, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (408, 1, 508, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (409, 1, 509, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (410, 1, 510, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (411, 1, 511, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (412, 1, 512, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (413, 1, 513, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (414, 1, 514, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (415, 1, 515, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (416, 1, 516, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (417, 1, 517, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (418, 1, 518, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (419, 1, 519, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (420, 1, 520, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (421, 1, 521, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (422, 1, 522, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (423, 1, 523, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (424, 1, 524, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (425, 1, 525, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (426, 1, 526, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (427, 1, 527, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (428, 1, 528, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (429, 1, 529, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (430, 1, 530, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (431, 1, 531, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (432, 1, 532, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (433, 1, 533, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (434, 1, 534, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (435, 1, 535, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (436, 1, 536, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (437, 1, 537, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (438, 1, 538, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (439, 1, 539, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (440, 1, 540, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (441, 1, 541, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (442, 1, 542, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (443, 1, 543, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (444, 1, 544, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (445, 1, 545, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (446, 1, 546, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (447, 1, 547, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (448, 1, 548, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (449, 1, 549, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (450, 1, 550, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (451, 1, 551, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (452, 1, 552, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (453, 1, 553, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (454, 1, 554, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (455, 1, 555, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (456, 1, 556, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (457, 1, 557, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (458, 1, 558, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (459, 1, 559, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (460, 1, 560, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (461, 1, 561, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (462, 1, 562, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (463, 1, 563, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (464, 1, 564, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (465, 1, 565, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (466, 1, 566, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (467, 1, 567, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (468, 1, 568, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (469, 1, 569, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (470, 1, 570, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (471, 1, 571, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (472, 1, 572, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (473, 1, 573, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (474, 1, 574, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (475, 1, 575, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (476, 1, 576, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (477, 1, 577, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (478, 1, 578, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (479, 1, 579, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (480, 1, 580, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (481, 1, 581, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (482, 1, 582, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (483, 1, 583, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (484, 1, 584, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (485, 1, 585, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (486, 1, 586, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (487, 1, 587, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (488, 1, 588, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (489, 1, 589, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (490, 1, 590, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (491, 1, 591, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (492, 1, 592, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (493, 1, 593, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (494, 1, 594, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (495, 1, 595, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (496, 1, 596, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (497, 1, 597, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (498, 1, 598, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (499, 1, 599, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (500, 1, 600, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (501, 1, 601, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (502, 1, 602, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (503, 1, 603, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (504, 1, 604, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (505, 1, 605, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (506, 1, 606, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (507, 1, 607, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (508, 1, 608, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (509, 1, 609, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (510, 1, 610, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (511, 1, 611, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (512, 1, 612, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (513, 1, 613, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (514, 1, 614, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (515, 1, 615, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (516, 1, 616, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (517, 1, 617, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (518, 1, 618, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (519, 1, 619, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (520, 1, 620, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (521, 1, 621, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (522, 1, 622, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (523, 1, 623, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (524, 1, 624, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (525, 1, 625, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (526, 1, 626, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (527, 1, 627, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (528, 1, 628, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (529, 1, 629, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (530, 1, 630, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (531, 1, 631, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (532, 1, 632, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (533, 1, 633, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (534, 1, 634, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (535, 1, 635, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (536, 1, 636, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (537, 1, 637, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (538, 1, 638, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (539, 1, 639, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (540, 1, 640, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (541, 1, 641, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (542, 1, 642, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (543, 1, 643, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (544, 1, 644, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (545, 1, 645, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (546, 1, 646, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (547, 1, 647, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (548, 1, 648, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (549, 1, 649, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (550, 1, 650, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (551, 1, 651, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (552, 1, 652, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (553, 1, 653, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (554, 1, 654, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (555, 1, 655, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (556, 1, 656, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (557, 1, 657, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (558, 1, 658, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (559, 1, 659, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (560, 1, 660, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (561, 1, 661, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (562, 1, 662, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (563, 1, 663, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (564, 1, 664, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (565, 1, 665, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (566, 1, 666, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (567, 1, 667, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (568, 1, 668, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (569, 1, 669, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (570, 1, 670, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (571, 1, 671, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (572, 1, 672, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (573, 1, 673, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (574, 1, 674, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (575, 1, 675, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (576, 1, 676, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (577, 1, 677, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (578, 1, 678, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (579, 1, 679, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (580, 1, 680, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (581, 1, 681, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (582, 1, 682, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (583, 1, 683, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (584, 1, 684, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (585, 1, 685, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (586, 1, 686, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (587, 1, 687, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (588, 1, 688, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (589, 1, 689, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (590, 1, 690, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (591, 1, 691, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (592, 1, 692, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (593, 1, 693, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (594, 1, 694, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (595, 1, 695, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (596, 1, 696, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (597, 1, 697, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (598, 1, 698, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (599, 1, 699, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (600, 1, 700, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (601, 1, 701, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (602, 1, 702, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (603, 1, 703, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (604, 1, 704, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (605, 1, 705, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (606, 1, 706, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (607, 1, 707, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (608, 1, 708, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (609, 1, 709, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (610, 1, 710, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (611, 1, 711, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (612, 1, 712, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (613, 1, 713, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (614, 1, 714, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (615, 1, 715, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (616, 1, 716, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (617, 1, 717, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (618, 1, 718, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (619, 1, 719, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (620, 1, 720, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (621, 1, 721, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (622, 1, 722, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (623, 1, 723, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (624, 1, 724, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (625, 1, 725, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (626, 1, 726, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (627, 1, 727, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (628, 1, 728, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (629, 1, 729, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (630, 1, 730, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (631, 1, 731, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (632, 1, 732, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (633, 1, 733, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (634, 1, 734, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (635, 1, 735, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (636, 1, 736, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (637, 1, 737, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (638, 1, 738, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (639, 1, 739, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (640, 1, 740, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (641, 1, 741, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (642, 1, 742, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (643, 1, 743, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (644, 1, 744, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (645, 1, 745, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (646, 1, 746, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (647, 1, 747, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (648, 1, 748, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (649, 1, 749, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (650, 1, 750, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (651, 1, 751, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (652, 1, 752, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (653, 1, 753, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (654, 1, 754, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (655, 1, 755, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (656, 1, 756, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (657, 1, 757, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (658, 1, 758, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (659, 1, 759, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (660, 1, 760, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (661, 1, 761, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (662, 1, 762, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (663, 1, 763, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (664, 1, 764, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (665, 1, 765, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (666, 1, 766, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (667, 1, 767, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (668, 1, 768, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (669, 1, 769, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (670, 1, 770, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (671, 1, 771, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (672, 1, 772, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (673, 1, 773, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (674, 1, 774, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (675, 1, 775, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (676, 1, 776, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (677, 1, 777, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (678, 1, 778, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (679, 1, 779, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (680, 1, 780, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (681, 1, 781, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (682, 1, 782, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (683, 1, 783, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (684, 1, 784, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (685, 1, 785, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (686, 1, 786, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (687, 1, 787, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (688, 1, 788, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (689, 1, 789, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (690, 1, 790, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (691, 1, 791, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (692, 1, 792, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (693, 1, 793, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (694, 1, 794, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (695, 1, 795, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (696, 1, 796, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (697, 1, 797, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (698, 1, 798, 11);
INSERT INTO `t_seckill_order` (`id`, `user_id`, `order_id`, `goods_id`) VALUES (699, 1, 799, 11);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
