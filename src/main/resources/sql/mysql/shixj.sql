/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50531
 Source Host           : localhost
 Source Database       : shixj

 Target Server Type    : MySQL
 Target Server Version : 50531
 File Encoding         : utf-8

 Date: 08/18/2013 19:42:46 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tbl_nav`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nav`;
CREATE TABLE `tbl_nav` (
  `id` bigint(20) NOT NULL,
  `nav_name` varchar(20) DEFAULT NULL,
  `nav_type` varchar(255) DEFAULT NULL,
  `parent_nav` tinyint(4) DEFAULT NULL COMMENT '0代表没有父目录',
  `is_show` tinyint(4) DEFAULT NULL COMMENT '1是0非',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbl_post`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_post`;
CREATE TABLE `tbl_post` (
  `id` bigint(20) NOT NULL,
  `nav_id` bigint(20) DEFAULT NULL,
  `post_content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbl_product`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE `tbl_product` (
  `id` bigint(20) NOT NULL,
  `nav_id` bigint(20) NOT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `tmall_link` varchar(500) DEFAULT NULL,
  `product_price` decimal(10,0) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbl_product_image`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_product_image`;
CREATE TABLE `tbl_product_image` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
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
