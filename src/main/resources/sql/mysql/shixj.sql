/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50610
 Source Host           : localhost
 Source Database       : shixj

 Target Server Type    : MySQL
 Target Server Version : 50610
 File Encoding         : utf-8

 Date: 08/31/2013 19:29:39 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tbl_info`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_info`;
CREATE TABLE `tbl_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nav_id` bigint(20) NOT NULL COMMENT '所属栏目id',
  `info_title` varchar(200) DEFAULT NULL COMMENT '标题',
  `info_external_links` varchar(500) DEFAULT NULL COMMENT '外部链接',
  `info_price` decimal(50,0) DEFAULT NULL COMMENT '产品价格',
  `info_details` text COMMENT '信息详细内容',
  `info_create_date` varchar(100) NOT NULL COMMENT '信息创建时间',
  `info_show_index` int(10) DEFAULT '1' COMMENT '是否首页显示 0：不显示 1：显示',
  `info_groupbuying_endtime` varchar(100) DEFAULT NULL COMMENT '团购结束时间',
  `info_intro` varchar(1000) DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='食享食分：id/nav_id/info_title/info_external_links/info_price/info_details/info_create_date/info_show_index/info_intro/图片表\n团购实惠：id/nav_id/info_title/info_external_links/info_price/info_details/info_create_date/info_show_index/info_intro/info_groupbuying_endtime/图片表\n有礼有节：id/nav_id/info_title/info_external_links/info_price/info_details/info_create_date/info_show_index/info_intro/图片表\n食享课堂：id/nav_id/info_title/info_details/info_create_date/info_show_index/info_intro/图片表\n品牌故事：id/nav_id/info_title/info_details/info_create_date/info_show_index/info_intro/图片表\n合作伙伴：id/nav_id/info_details/info_create_date\n关于我们：id/nav_id/info_details/info_create_date\n\n\nnav_id：信息对应栏目id\ninfo_title:信息标题\ninfo_external_links：信息外部链接\ninfo_price：信息价格\ninfo_details：信息详细内容\ninfo_create_date：信息创建时间\ninfo_show_index：信息是否首页显示\ninfo_intro：信息简介\ninfo_groupbuying_endtime：信息团购的结束时间';

-- ----------------------------
--  Records of `tbl_info`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_info` VALUES ('3', '7', '侠客行', 'http://www.baidu.com', '123', '<p>侠客行</p>', '2013-08-21', '1', null, 'aaa'), ('4', '13', '灵山竞速', 'http://www.baidu.com', '23424', '<p>灵山竞速</p>', '2013-08-21', '1', '2013-01-16 05:45:07', 'aa'), ('5', '2', '团购实惠', '团购实惠', '23424', '<p>团购实惠</p>', '2013-08-21', '1', null, null), ('6', '11', '十月测试', '十月测试', '2344', '<p>十月测试</p>', '2013-08-21', '1', null, null), ('24', '2', '团购测试', 'http://www.baidu.com', '234', '<p>aaa</p>', '2013-08-30', '1', '2013-01-17 10:50:07', null), ('27', '8', null, null, null, '<p>关于我们</p>', '2013-08-31', null, null, null), ('28', '9', 'aa', null, null, '<p>aa</p>', '2013-08-31', '0', null, null), ('29', '10', 'a', 'http://www.baidu.com', '123', '<p>a</p>', '2013-08-31', '0', null, null), ('33', '14', 'aa', null, null, '<p>aa</p>', '2013-08-31', null, null, null), ('34', '9', '团购实惠', null, null, '<p>团购实惠</p>', '2013-08-31', '1', null, '团购实惠');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_info_image`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_info_image`;
CREATE TABLE `tbl_info_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `info_id` bigint(20) NOT NULL,
  `image_path` varchar(200) DEFAULT NULL,
  `origin_image_name` varchar(100) DEFAULT NULL,
  `pc_image_name` varchar(100) DEFAULT NULL,
  `mobile_image_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='此表暂时没有';

-- ----------------------------
--  Records of `tbl_info_image`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_info_image` VALUES ('1', '0', '/upload/files2013/08/22/', '1308222351103758.jpg', '1308222351103758.jpg', '1308222351103758.jpg'), ('49', '24', '/upload/files2013/08/30/', 'or_1308302228389054.jpeg', 'pc_1308302228389054.jpeg', 'm_1308302228389054.jpeg'), ('50', '33', '/upload/files2013/08/31/', 'or_1308311543155924.jpeg', 'pc_1308311543155924.jpeg', 'm_1308311543155924.jpeg'), ('51', '3', '/upload/files2013/08/31/', 'or_1308311744012546.jpeg', 'pc_1308311744012546.jpeg', 'm_1308311744012546.jpeg'), ('52', '3', '/upload/files2013/08/31/', 'or_1308311744442571.jpeg', 'pc_1308311744442571.jpeg', 'm_1308311744442571.jpeg');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_nav`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nav`;
CREATE TABLE `tbl_nav` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(20) NOT NULL COMMENT '栏目名称',
  `nav_type` varchar(255) NOT NULL COMMENT '栏目类型 =1食享食分；=2团购实惠；=3有礼有节；=4食享课堂；=5品牌故事；=6合作伙伴；=7关于我们；',
  `parent_nav` bigint(4) NOT NULL COMMENT '栏目的父栏目节点id  0代表没有父目录',
  `show_nav` tinyint(4) NOT NULL COMMENT '是否显示栏目 1是0非',
  `nav_image_path` varchar(100) DEFAULT NULL COMMENT '栏目图片路径',
  `nav_image_name` varchar(100) DEFAULT NULL COMMENT '栏目图片名称',
  `nav_order` bigint(20) NOT NULL DEFAULT '0' COMMENT '栏目次序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_nav`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_nav` VALUES ('1', '食享食分', '0', '0', '1', '', '', '0'), ('2', '团购食惠', '1', '0', '1', '', '', '1'), ('3', '有礼有节', '2', '0', '1', '', '', '2'), ('4', '食享课堂', '3', '0', '1', '', '', '3'), ('6', '合作伙伴', '5', '0', '1', '', '', '5'), ('7', '虾客行', '0', '1', '1', '', '', '6'), ('8', '关于我们', '6', '0', '1', '', '', '7'), ('9', '红酒的故事', '3', '4', '1', '', '', '8'), ('10', '八月', '2', '3', '1', '', '', '9'), ('11', '十月', '2', '3', '1', '', '', '10'), ('12', '九月', '2', '3', '1', '', '', '11'), ('13', '灵山净素', '0', '1', '1', '', '', '12'), ('14', '品牌故事', '4', '0', '1', null, null, '4');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_nav_type`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nav_type`;
CREATE TABLE `tbl_nav_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='本表暂时没有用到';

-- ----------------------------
--  Table structure for `tbl_task`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_task`;
CREATE TABLE `tbl_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFE755666708EFA2` (`user_id`),
  CONSTRAINT `tbl_task_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `tbl_task`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_task` VALUES ('1', 'Hello', 'taks description', null), ('2', 'Hello', 'taks description', null);
COMMIT;

-- ----------------------------
--  Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `salt` varchar(64) COLLATE utf8_bin NOT NULL,
  `roles` varchar(255) COLLATE utf8_bin NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `tbl_user`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_user` VALUES ('1', 'admin', 'admin', '49b3e77fbb1e579fc9f18d3d83b864eebba6b746', '5820c6d1ab128d2c', 'admin', '2013-07-05 10:04:08'), ('2', '123', '123', '4508e8932fd7944160f51ccbe4b029ba05fe47f3', '12486d0385ad9952', 'admin', '2013-08-13 09:45:23');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
