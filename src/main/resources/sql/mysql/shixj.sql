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

 Date: 09/01/2013 12:43:32 PM
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
  `info_original_price` decimal(50,0) DEFAULT NULL COMMENT '产品原价',
  `info_details` text COMMENT '信息详细内容',
  `info_create_date` varchar(100) NOT NULL COMMENT '信息创建时间',
  `info_show_index` int(10) DEFAULT '1' COMMENT '是否首页显示 0：不显示 1：显示',
  `info_groupbuying_endtime` varchar(100) DEFAULT NULL COMMENT '团购结束时间',
  `info_intro` varchar(1000) DEFAULT NULL COMMENT '简介',
  `info_current_price` varchar(50) DEFAULT NULL COMMENT '产品现在价格',
  `info_clicks` bigint(50) DEFAULT NULL COMMENT '信息点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='食享食分：id/nav_id/info_title/info_external_links/info_original_price/info_details/info_create_date/info_show_index/info_intro/图片表\n团购实惠：id/nav_id/info_title/info_external_links/info_original_price/info_details/info_create_date/info_show_index/info_intro/info_groupbuying_endtime/info_current_price/info_clicks/图片表\n有礼有节：id/nav_id/info_title/info_external_links/info_original_price/info_details/info_create_date/info_show_index/info_intro/图片表\n食享课堂：id/nav_id/info_title/info_details/info_create_date/info_show_index/info_intro/图片表\n品牌故事：id/nav_id/info_title/info_details/info_create_date/info_show_index/info_intro/图片表\n合作伙伴：id/nav_id/info_details/info_create_date\n关于我们：id/nav_id/info_details/info_create_date\n\n\nnav_id：信息对应栏目id\ninfo_title:信息标题\ninfo_external_links：信息外部链接\ninfo_original_price：原来价格\ninfo_current_price：现在价格\ninfo_details：信息详细内容\ninfo_create_date：信息创建时间\ninfo_show_index：信息是否首页显示\ninfo_intro：信息简介\ninfo_groupbuying_endtime：信息团购的结束时间\ninfo_clicks：信息点击次数';

-- ----------------------------
--  Records of `tbl_info`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_info` VALUES ('3', '7', '侠客行', 'http://www.baidu.com', '123', '<p>侠客行</p>', '2013-08-21', '1', null, 'aaa', null, null), ('4', '13', '灵山竞速', 'http://www.baidu.com', '23424', '<p>灵山竞速</p>', '2013-08-21', '1', '2013-01-16 05:45:07', 'aa', null, null), ('5', '2', '团购实惠', '团购实惠', '23424', '<p>团购实惠</p>', '2013-08-21', '1', null, null, null, null), ('6', '11', '十月测试', '十月测试', '2344', '<p>十月测试</p>', '2013-08-21', '1', null, null, null, null), ('24', '2', '团购测试', 'http://www.baidu.com', '234', '<p><span style=\"color: rgb(34, 34, 34); font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; font-size: 22px; line-height: 35px; \">avaScirpt是一种动态类型语言，也就是说，变量的类型没有限制，可以赋予各种类型的</span></p><p style=\"box-sizing: border-box; ; ; ; font-size: 22px; direction: ltr; font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; line-height: 35px; color: rgb(34, 34, 34); white-space: normal;\">上面代码直接使用变量x，系统就报错，告诉你变量x没有声明。</p><p style=\"box-sizing: border-box; ; ; ; font-size: 22px; direction: ltr; font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; line-height: 35px; color: rgb(34, 34, 34); white-space: normal;\">可以在同一条var命令中声明多个变量。</p><pre style=\"box-sizing: border-box; margin-top: 1em; margin-bottom: 1.5em; padding: 0px; font-size: 14px; direction: ltr; font-family: Consolas, &#39;Courier New&#39;, Courier, FreeMono, monospace; background-color: rgb(17, 17, 17);\">var&nbsp;a,b;</pre><p style=\"box-sizing: border-box; ; ; ; font-size: 22px; direction: ltr; font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; line-height: 35px; color: rgb(34, 34, 34); white-space: normal;\">JavaScirpt是一种动态类型语言，也就是说，变量的类型没有限制，可以赋予各种类型的值。</p><pre style=\"box-sizing: border-box; margin-top: 1em; margin-bottom: 1.5em; padding: 0px; font-size: 14px; direction: ltr; font-family: Consolas, &#39;Courier New&#39;, Courier, FreeMono, monospace; background-color: rgb(17, 17, 17);\">var&nbsp;a&nbsp;=&nbsp;1;\r\n\r\na&nbsp;=&nbsp;&quot;hello&quot;;</pre><p style=\"box-sizing: border-box; ; ; ; font-size: 22px; direction: ltr; font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; line-height: 35px; color: rgb(34, 34, 34); white-space: normal;\">上面代码中，变量a起先被赋值为一个数值，后来又被重新赋值为一个字符串。第二次赋值的</p><p><span style=\"color: rgb(34, 34, 34); font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; font-size: 22px; line-height: 35px; \"><span style=\"color: rgb(34, 34, 34); font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; font-size: 22px; line-height: 35px; \"><span style=\"color: rgb(34, 34, 34); font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; font-size: 22px; line-height: 35px; \"><span style=\"color: rgb(34, 34, 34); font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; font-size: 22px; line-height: 35px; \"><span style=\"color: rgb(34, 34, 34); font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; font-size: 22px; line-height: 35px; \"></span></span></span></span></span><br/></p>', '2013-08-30', '1', '2013-01-17 10:50:07', 'avaScirpt是一种动态类型语言，也就是说，变量的类型没有限制，可以赋予各种类型的值。avaScirpt是一种动态类型语言，也就是说，变量的类型没有限制，可以赋予各种类型的值。avaScirpt是一种动态类型语言，也就是说，变量的类型没有限制，可以赋予各种类型的值。', null, null), ('27', '8', null, null, null, '<p class=\"lead\" style=\"; font-size: 20px; color: rgb(85, 85, 85); font-family: Helvetica, arial, freesans, clean, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>GitHub is the best place to share code</strong>&nbsp;with friends, co-workers, classmates, and complete strangers. Over three million people use GitHub to build amazing things together.</p><p><img class=\"about-img\" src=\"https://github.com/images/modules/about_page/hubbernauts.jpg\" style=\"border: 0px; max-width: 100%; margin-bottom: 15px; color: rgb(51, 51, 51); font-family: Helvetica, arial, freesans, clean, sans-serif; font-size: 13px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: Helvetica, arial, freesans, clean, sans-serif; font-size: 13px; line-height: 18px;  background-color: rgb(255, 255, 255);\"></span></p><p style=\"color: rgb(51, 51, 51); font-family: Helvetica, arial, freesans, clean, sans-serif; font-size: 13px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">With the&nbsp;<a href=\"https://github.com/features/projects\" style=\"color: rgb(65, 131, 196); text-decoration: none;\">collaborative features of GitHub.com</a>, our&nbsp;<a href=\"http://mac.github.com/\" style=\"color: rgb(65, 131, 196); text-decoration: none;\">desktop</a>&nbsp;and&nbsp;<a href=\"http://mobile.github.com/\" style=\"color: rgb(65, 131, 196); text-decoration: none;\">mobile apps</a>, and&nbsp;<a href=\"https://enterprise.github.com/\" style=\"color: rgb(65, 131, 196); text-decoration: none;\">GitHub Enterprise</a>, it has never been easier for individuals and teams to write better code, faster.</p><p style=\"color: rgb(51, 51, 51); font-family: Helvetica, arial, freesans, clean, sans-serif; font-size: 13px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">Originally founded by&nbsp;<a href=\"https://github.com/mojombo\" style=\"color: rgb(65, 131, 196); text-decoration: none;\">Tom Preston-Werner</a>,&nbsp;<a href=\"https://github.com/defunkt\" style=\"color: rgb(65, 131, 196); text-decoration: none;\">Chris Wanstrath</a>, and&nbsp;<a href=\"https://github.com/pjhyett\" style=\"color: rgb(65, 131, 196); text-decoration: none;\">PJ Hyett</a>&nbsp;to simplify sharing code, GitHub has grown into the largest code host in the world.</p><p><br/></p>', '2013-08-31', null, null, null, null, null), ('28', '9', 'aa', null, null, '<p>aa</p>', '2013-08-31', '0', null, null, null, null), ('29', '10', 'a', 'http://www.baidu.com', '123', '<p>a</p>', '2013-08-31', '0', null, null, null, null), ('33', '14', 'aa', null, null, '<p>aa</p>', '2013-08-31', null, null, null, null, null), ('34', '9', '团购实惠', null, null, '<p>团购实惠</p>', '2013-08-31', '1', null, '团购实惠', null, null), ('35', '6', null, null, null, '<p style=\"box-sizing: border-box; ; ; ; font-size: 22px; direction: ltr; font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; line-height: 35px; color: rgb(34, 34, 34); white-space: normal;\">上面代码中，变量a起先被赋值为一个数值，后来又被重新赋值为一个字符串。第二次赋值的时候，因为变量a已经存在，所以不需要使用var命令。如果用了，就等于重新声明一个变量a，会覆盖掉前面的同名变量。</p><p><span id=\"toc3\" style=\"box-sizing: border-box; color: rgb(34, 34, 34); font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 14px; \"></span></p><h3 style=\"box-sizing: border-box; margin: 0.5em 0px; padding: 0.4em 0px 0px; font-size: 27px; direction: ltr; font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; color: rgb(34, 34, 34); text-rendering: optimizelegibility; line-height: 1.1; border-bottom-width: 1px; border-bottom-style: dashed; border-bottom-color: rgb(153, 153, 153); white-space: normal;\">变量提升</h3><p style=\"box-sizing: border-box; ; ; ; font-size: 22px; direction: ltr; font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; line-height: 35px; color: rgb(34, 34, 34); white-space: normal;\">JavaScript引擎的工作方式是，先解析代码，获取所有被声明的变量，然后再一行一行地运行。这造成的结果，就是所有的变量的声明语句，都会被提升到代码的头部，这就叫做变量提升。</p><pre style=\"box-sizing: border-box; margin-top: 1em; margin-bottom: 1.5em; padding: 0px; font-size: 14px; direction: ltr; font-family: Consolas, &#39;Courier New&#39;, Courier, FreeMono, monospace; background-color: rgb(17, 17, 17);\">console.log(a);\r\nvar&nbsp;a&nbsp;=&nbsp;1;</pre><p style=\"box-sizing: border-box; ; ; ; font-size: 22px; direction: ltr; font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; line-height: 35px; color: rgb(34, 34, 34); white-space: normal;\">上面的代码在声明变量a之前就使用它，是一种错误的做法，但是实际上不会报错。因为存在变量提升，真正运行的是下面的代码：</p><pre style=\"box-sizing: border-box; margin-top: 1em; margin-bottom: 1.5em; padding: 0px; font-size: 14px; direction: ltr; font-family: Consolas, &#39;Courier New&#39;, Courier, FreeMono, monospace; background-color: rgb(17, 17, 17);\">var&nbsp;a;\r\nconsole.log(a);\r\na&nbsp;=&nbsp;1;</pre><p style=\"box-sizing: border-box; ; ; ; font-size: 22px; direction: ltr; font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; line-height: 35px; color: rgb(34, 34, 34); white-space: normal;\">最后的结果是显示undefined，表示变量a已声明，但还未赋值。</p><p><span id=\"toc4\" style=\"box-sizing: border-box; color: rgb(34, 34, 34); font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 14px; \"></span></p><h3 style=\"box-sizing: border-box; margin: 0.5em 0px; padding: 0.4em 0px 0px; font-size: 27px; direction: ltr; font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; color: rgb(34, 34, 34); text-rendering: optimizelegibility; line-height: 1.1; border-bottom-width: 1px; border-bottom-style: dashed; border-bottom-color: rgb(153, 153, 153); white-space: normal;\">标识符</h3><p style=\"box-sizing: border-box; ; ; ; font-size: 22px; direction: ltr; font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; line-height: 35px; color: rgb(34, 34, 34); white-space: normal;\">标识符（identifier）是用来识别具体对象的一个名称。最常见的标识符就是变量名，以及后面要提到的函数名。JavaScript语言的标识符对大小写敏感。</p><p style=\"box-sizing: border-box; ; ; ; font-size: 22px; direction: ltr; font-family: &#39;Helvetica Neue&#39;, Helvetica, Helvetica, Arial, sans-serif; line-height: 35px; color: rgb(34, 34, 34); white-space: normal;\">标识符有一套命名规则，不符合规则的就是非法标识符。JavaScript引擎遇到非法标识符，就会报错。</p><p><br/></p>', '2013-08-31', null, null, null, null, null), ('36', '2', 'qwer', 'http://www.baidu.com', '123', '<p>&nbsp;傲视飞</p>', '2013-09-01', '0', '2013-01-08 09:45:07', 'w\'er', '213.0', '12');
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
INSERT INTO `tbl_nav` VALUES ('1', '食享食分', '1', '0', '1', '', '', '0'), ('2', '团购食惠', '2', '0', '1', '', '', '1'), ('3', '有礼有节', '3', '0', '1', '', '', '2'), ('4', '食享课堂', '4', '0', '1', '', '', '3'), ('6', '合作伙伴', '6', '0', '1', '', '', '5'), ('7', '虾客行', '1', '1', '1', '', '', '6'), ('8', '关于我们', '7', '0', '1', '', '', '7'), ('9', '红酒的故事', '4', '4', '1', '', '', '8'), ('10', '八月', '3', '3', '1', '', '', '9'), ('11', '十月', '3', '3', '1', '', '', '10'), ('12', '九月', '3', '3', '1', '', '', '11'), ('13', '灵山净素', '1', '1', '1', '', '', '12'), ('14', '品牌故事', '5', '0', '1', null, null, '4');
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
