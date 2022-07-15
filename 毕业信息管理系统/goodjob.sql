/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 127.0.0.1
 Source Database       : goodjob

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 07/15/2022 14:46:40 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `classes`
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级表主键',
  `className` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '班级名称',
  `classRoom` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '教室',
  `createTime` date DEFAULT NULL COMMENT '班级成立时间',
  `graduateTime` date DEFAULT NULL COMMENT '毕业时间',
  `lecturerId` int(11) DEFAULT NULL COMMENT '教师表id',
  `teacherId` int(11) DEFAULT NULL COMMENT '教师表id',
  `status` char(1) COLLATE utf8_bin NOT NULL COMMENT '0:未毕业、1:已毕业',
  `flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '0:未删除、1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `classes`
-- ----------------------------
BEGIN;
INSERT INTO `classes` VALUES ('1', '1703B', null, '2018-10-10', '2018-10-10', '1', '2', '0', '0'), ('3', '1609B', null, '2018-10-10', '2018-10-10', '2', '5', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司表主键',
  `companyName` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '公司名称',
  `property` char(1) COLLATE utf8_bin NOT NULL COMMENT '公司性质：1.国企、2.合资、3.私企、4.培训机构',
  `scale` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '公司规模：1.10人以下、2.10-30人、3.30-50人、4.50-100人、5.100人以上',
  `address` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司地址',
  `flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '0:未删除、1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `company`
-- ----------------------------
BEGIN;
INSERT INTO `company` VALUES ('1', '公司1', '2', '1', null, '1'), ('2', '公司2', '1', '1', '啊啊啊啊啊啊', '0'), ('3', '公司2', '1', '0', '啊烦烦烦', '0'), ('4', 'aa', '3', '1', '啊发发', '0'), ('5', '111', '1', '1', '11', '0');
COMMIT;

-- ----------------------------
--  Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件表主键',
  `interviewId` int(11) NOT NULL COMMENT '面试信息表id',
  `path` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '附件保存路径',
  `uploadTime` datetime NOT NULL COMMENT '附件上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `file`
-- ----------------------------
BEGIN;
INSERT INTO `file` VALUES ('1', '2', '../statics/uploadfiles71b711d3-5e64-413f-8078-32bcc7cb1e501523837923497_Personal.jpg', '2018-04-16 08:18:43'), ('2', '2', '../statics/uploadfilese27c31e1-d69c-42e6-92a3-5df76e556ff01523837923511_Personal.jpg', '2018-04-16 08:18:43'), ('3', '3', '../statics/uploadfiles1a18ba13-2a4f-4721-bf69-30ec948759391523837986715_Personal.jpg', '2018-04-16 08:19:46'), ('4', '3', '../statics/uploadfilesc56c8940-23b4-4526-8b39-39af990f8f311523837986720_Personal.jpg', '2018-04-16 08:19:46'), ('5', '4', '../statics/uploadfilesd02e6485-5b7a-48dc-bc0e-255e07719fcb1523838353329_Personal.jpg', '2018-04-16 08:25:53'), ('6', '4', '../statics/uploadfiles2ec49a0b-b738-42b4-8bbd-d128f5daa4bf1523838353335_Personal.jpg', '2018-04-16 08:25:53');
COMMIT;

-- ----------------------------
--  Table structure for `interview`
-- ----------------------------
DROP TABLE IF EXISTS `interview`;
CREATE TABLE `interview` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '面试信息表主键',
  `userId` int(11) DEFAULT NULL COMMENT '用户表id',
  `classesId` int(11) DEFAULT NULL COMMENT '班级表ID',
  `companyId` int(11) DEFAULT NULL COMMENT '公司表ID',
  `interviewTime` date DEFAULT NULL COMMENT '面试时间',
  `status` char(1) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '面试情况：1.已预约、2.已面试、3.未参加、4、已录用',
  `evaluate` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '对公司的评价',
  `evaluateTime` datetime DEFAULT NULL COMMENT '评价时间',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `remarkStatus` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '问题是否解决：0、未解决；1、已解决',
  `flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '0:未删除、1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `interview`
-- ----------------------------
BEGIN;
INSERT INTO `interview` VALUES ('1', '1', '1', '1', '2018-04-11', '1', 'aaaa', null, null, '0', '1'), ('2', '1', '1', '2', '2018-04-17', '', null, null, null, '0', '0'), ('3', '1', '1', '2', '2018-04-17', '', null, null, null, '0', '0'), ('4', '2', '1', '3', '2018-04-18', '', null, null, null, '0', '0'), ('5', '2', '1', '3', '2022-07-05', '1', null, null, null, '0', '0'), ('6', '1', '3', '5', '2022-07-05', '1', null, null, null, '0', '0'), ('7', '2', '1', '5', '2022-07-06', '2', '1111', '2022-07-15 08:57:45', '1', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `jyxx`
-- ----------------------------
DROP TABLE IF EXISTS `jyxx`;
CREATE TABLE `jyxx` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '就业信息表主键',
  `companyId` int(11) NOT NULL COMMENT '公司表ID',
  `jysj` date NOT NULL COMMENT '就业时间',
  `gzgw` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '工作岗位',
  `yx` decimal(6,2) NOT NULL COMMENT '月薪',
  `yjtc` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业绩提成',
  `sb` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '社保',
  `bt` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '补贴',
  `qtfl` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '其他福利',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '0:未删除、1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `students`
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '毕业生表主键',
  `userId` int(11) NOT NULL COMMENT '用户表id',
  `classesId` int(11) DEFAULT NULL COMMENT '班级表ID',
  `code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '学号',
  `credentialsNo` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `age` int(2) DEFAULT NULL COMMENT '年龄',
  `native` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '籍贯',
  `dept` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '所属市场部',
  `qq` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'QQ/微信号',
  `enterTime` date DEFAULT NULL COMMENT '入学时间',
  `graduateTime` date DEFAULT NULL COMMENT '毕业时间',
  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭住址',
  `homePhone` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭联系方式',
  `status` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '0:未就业、1:已就业',
  `flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '毕业时间',
  PRIMARY KEY (`id`),
  KEY `fk_students` (`userId`),
  CONSTRAINT `fk_students` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `students`
-- ----------------------------
BEGIN;
INSERT INTO `students` VALUES ('1', '1', '3', '001', null, null, null, null, null, null, null, null, null, null, '0', '0'), ('3', '2', '1', '002', null, null, null, null, null, null, null, null, null, null, '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师表主键',
  `userId` int(11) NOT NULL COMMENT '用户表id',
  `position` char(1) COLLATE utf8_bin NOT NULL COMMENT '职位：1、讲师；2、班主任；3、就业专员',
  `flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '0:未删除、1:已删除',
  PRIMARY KEY (`id`),
  KEY `fk_teacher` (`userId`),
  CONSTRAINT `fk_teacher` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `teacher`
-- ----------------------------
BEGIN;
INSERT INTO `teacher` VALUES ('1', '3', '1', '0'), ('2', '4', '2', '0'), ('3', '1', '1', '0'), ('4', '2', '2', '0'), ('5', '6', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表主键',
  `userCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `userName` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户姓名',
  `phone` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  `role` char(1) COLLATE utf8_bin NOT NULL COMMENT '1:管理员、2:就业专员、3:教师、4:毕业生',
  `flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '0:未删除、1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'lisi', '111', '李四', null, '4', '0'), ('2', 'zhangsan', '111', '张三', null, '4', '0'), ('3', 'js1', '111', '讲师1', null, '3', '0'), ('4', 'js2', '111', '班主任1', null, '3', '0'), ('6', 'js3', '111', '讲师2', null, '3', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
