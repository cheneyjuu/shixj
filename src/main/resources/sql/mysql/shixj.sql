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

 Date: 08/30/2013 10:33:44 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tbl_nav`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nav`;
CREATE TABLE `tbl_nav` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(20) NOT NULL COMMENT '栏目名称',
  `nav_type` varchar(255) NOT NULL COMMENT '栏目类型 =0产品；=1文章',
  `parent_nav` bigint(4) NOT NULL COMMENT '栏目的父栏目节点id  0代表没有父目录',
  `show_nav` tinyint(4) NOT NULL COMMENT '是否显示栏目 1是0非',
  `nav_image_path` varchar(100) DEFAULT NULL COMMENT '栏目图片路径',
  `nav_image_name` varchar(100) DEFAULT NULL COMMENT '栏目图片名称',
  `nav_order` bigint(20) NOT NULL DEFAULT '0' COMMENT '栏目次序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_nav`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_nav` VALUES ('1', '食享食分', '0', '0', '1', '', '', '0'), ('2', '团购食惠', '0', '0', '1', '', '', '1'), ('3', '有礼有节', '0', '0', '1', '', '', '2'), ('4', '食享课堂', '1', '0', '1', '', '', '3'), ('6', '合作伙伴', '1', '0', '1', '', '', '5'), ('7', '虾客行', '0', '1', '1', '', '', '6'), ('8', '关于我们', '1', '0', '1', '', '', '7'), ('9', '红酒的故事', '1', '4', '1', '', '', '8'), ('10', '八月', '0', '3', '1', '', '', '9'), ('11', '十月', '0', '3', '1', '', '', '10'), ('12', '九月', '0', '3', '1', '', '', '11'), ('13', '灵山净素', '0', '1', '1', '', '', '12');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_post`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_post`;
CREATE TABLE `tbl_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nav_id` bigint(20) NOT NULL,
  `post_content` text,
  `post_title` varchar(200) NOT NULL,
  `post_create_date` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_post`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_post` VALUES ('2', '7', ' 栏目1文章标题', ' 栏目1文章标题', '2013-08-20');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_product`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE `tbl_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nav_id` bigint(20) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `tmall_link` varchar(500) NOT NULL,
  `product_price` decimal(50,0) NOT NULL,
  `details` text NOT NULL,
  `product_create_date` varchar(100) NOT NULL,
  `show_index` int(10) DEFAULT '1' COMMENT '是否首页显示 0：不显示 1：显示',
  `end_time` varchar(100) DEFAULT NULL COMMENT '团购结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_product`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_product` VALUES ('3', '7', '侠客行', '侠客行', '123', '<p>侠客行</p>', '2013-08-21', '1', null), ('4', '13', '灵山竞速', '灵山竞速', '23424', '<p>灵山竞速</p>', '2013-08-21', '1', null), ('5', '2', '团购实惠', '团购实惠', '23424', '<p>团购实惠</p>', '2013-08-21', '1', null), ('6', '11', '十月测试', '十月测试', '2344', '<p>十月测试</p>', '2013-08-21', '1', null), ('20', '7', 'ccc', 'http://www.baidu.com', '234', '<p>wer</p>', '2013-08-30', '0', null), ('21', '7', 'ccc', 'http://www.baidu.com', '2344', '<p>ww</p>', '2013-08-30', '0', '2013-01-10 05:25:07'), ('22', '7', 'ccc', 'http://www.baidu.com', '2344', '<p>ww</p>', '2013-08-30', '0', '2013-01-10 05:25:07'), ('23', '7', 'vvv', 'http://www.baidu.com', '33', '<p>vvv</p>', '2013-08-30', '0', '2013-01-04 06:30:07');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_product_image`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_product_image`;
CREATE TABLE `tbl_product_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `image_path` varchar(200) DEFAULT NULL,
  `origin_image_name` varchar(100) DEFAULT NULL,
  `pc_image_name` varchar(100) DEFAULT NULL,
  `mobile_image_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_product_image`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_product_image` VALUES ('1', '0', '/upload/files2013/08/22/', '1308222351103758.jpg', '1308222351103758.jpg', '1308222351103758.jpg');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_story`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_story`;
CREATE TABLE `tbl_story` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `story_content` text,
  `story_title` varchar(200) NOT NULL,
  `story_intro` varchar(200) DEFAULT NULL,
  `story_create_date` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_story`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_story` VALUES ('7', '<p>啊啊</p>', '啊啊啊', '啊啊', '2013-08-29');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_story_image`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_story_image`;
CREATE TABLE `tbl_story_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `story_id` bigint(20) NOT NULL,
  `image_path` varchar(200) DEFAULT NULL,
  `origin_image_name` varchar(100) DEFAULT NULL,
  `pc_image_name` varchar(100) DEFAULT NULL,
  `mobile_image_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_story_image`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_story_image` VALUES ('5', '6', '/upload/files2013/08/27/', 'or_1308272325481121.jpeg', 'pc_1308272325481121.jpeg', 'm_1308272325481121.jpeg');
COMMIT;

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
