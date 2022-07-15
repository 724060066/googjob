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

 Date: 04/17/2018 08:38:11 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件表主键',
  `interviewId` int(11) NOT NULL COMMENT '面试信息表id',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '附件保存路径',
  `uploadTime` datetime NOT NULL COMMENT '附件上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  View structure for `studentinfo`
-- ----------------------------
DROP VIEW IF EXISTS `studentinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `studentinfo` AS select `u`.`id` AS `uId`,`u`.`userCode` AS `userCode`,`u`.`password` AS `password`,`u`.`userName` AS `userName`,`u`.`phone` AS `phone`,`u`.`role` AS `role`,`u`.`flag` AS `uflag`,`s`.`qq` AS `qq`,`s`.`enterTime` AS `enterTime`,`s`.`address` AS `address`,`s`.`homePhone` AS `homePhone`,`s`.`status` AS `status`,`s`.`flag` AS `sflag`,`s`.`id` AS `sid`,`s`.`userId` AS `userId`,`s`.`classesId` AS `classesId`,`s`.`code` AS `code`,`s`.`credentialsNo` AS `credentialsNo`,`s`.`age` AS `age`,`s`.`native` AS `native`,`s`.`dept` AS `dept` from (`user` `u` join `students` `s`) where ((`u`.`id` = `s`.`userId`) and (`u`.`role` = 4));

-- ----------------------------
--  View structure for `teacherinfo`
-- ----------------------------
DROP VIEW IF EXISTS `teacherinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `teacherinfo` AS select `u`.`id` AS `uid`,`u`.`userCode` AS `userCode`,`u`.`password` AS `password`,`u`.`userName` AS `userName`,`u`.`phone` AS `phone`,`u`.`role` AS `role`,`u`.`flag` AS `uflag`,`t`.`id` AS `tid`,`t`.`position` AS `position`,`t`.`flag` AS `tflag` from (`user` `u` join `teacher` `t`) where ((`u`.`id` = `t`.`userId`) and (`u`.`role` = 3));

SET FOREIGN_KEY_CHECKS = 1;
