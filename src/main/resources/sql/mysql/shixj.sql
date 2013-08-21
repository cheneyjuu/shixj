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

 Date: 08/21/2013 11:09:27 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tbl_nav`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nav`;
CREATE TABLE `tbl_nav` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(20) NOT NULL,
  `nav_type` varchar(255) NOT NULL COMMENT '栏目类型=0产品；=1文章',
  `parent_nav` tinyint(4) NOT NULL COMMENT '0代表没有父目录',
  `show_nav` tinyint(4) NOT NULL COMMENT '1是0非',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_nav`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_nav` VALUES ('1', '食享食分', '0', '0', '1'), ('2', '团购食惠', '0', '0', '1'), ('3', '有礼有节', '0', '0', '1'), ('4', '食享课堂', '1', '0', '1'), ('5', '品牌故事', '1', '0', '1'), ('6', '合作伙伴', '1', '0', '1'), ('7', '虾客行', '0', '1', '1'), ('8', '关于我们', '1', '0', '1'), ('9', '红酒的故事', '1', '4', '1'), ('10', '八月', '0', '3', '1'), ('11', '十月', '0', '3', '1'), ('12', '九月', '0', '3', '1'), ('13', '灵山净素', '0', '1', '1');
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
INSERT INTO `tbl_post` VALUES ('2', '7', ' 栏目1文章标题', ' 栏目1文章标题', '2013-08-20'), ('3', '7', '<p>cv2内容ccv2标题---&gt;aa</p>', 'ccv2标题ccv2标题--->aa', '2013-08-20'), ('4', '7', 'cv2标题cv2标题', 'cv2标题cv2标题', '2013-08-20'), ('5', '2', 'cv2标题cv2标题cv2标题', 'cv2标题cv2标题cv2标题cv2标题', '2013-08-20'), ('6', '7', '<p>栏目1文章啊啊啊发</p>', '栏目1文章啊啊啊发', '2013-08-20');
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
  `product_price` decimal(10,0) NOT NULL,
  `details` text NOT NULL,
  `product_create_date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
