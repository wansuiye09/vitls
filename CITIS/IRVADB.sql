/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.23 : Database - irvadb
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`IRVADB` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `IRVADB`;

/*Table structure for table `attribute_annotations` */

DROP TABLE IF EXISTS `attribute_annotations`;

CREATE TABLE `attribute_annotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关系编号',
  `pathid` int(11) DEFAULT NULL COMMENT '所属路径（外键）',
  `attributeid` int(11) DEFAULT NULL COMMENT '所属状态（外键）',
  `frame` int(11) DEFAULT NULL COMMENT '所属帧',
  `value` tinyint(1) DEFAULT '0' COMMENT '是否有价值',
  PRIMARY KEY (`id`),
  KEY `pathid` (`pathid`),
  KEY `attributeid` (`attributeid`),
  CONSTRAINT `attribute_annotations_ibfk_1` FOREIGN KEY (`pathid`) REFERENCES `paths` (`id`),
  CONSTRAINT `attribute_annotations_ibfk_2` FOREIGN KEY (`attributeid`) REFERENCES `attributes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `attributes` */

DROP TABLE IF EXISTS `attributes`;

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '状态参数编号',
  `text` varchar(250) CHARACTER SET latin1 DEFAULT NULL COMMENT '状态名称',
  `labelid` int(11) DEFAULT NULL COMMENT '所属类型（外键）',
  PRIMARY KEY (`id`),
  KEY `labelid` (`labelid`),
  CONSTRAINT `attributes_ibfk_1` FOREIGN KEY (`labelid`) REFERENCES `labels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `boxes` */

DROP TABLE IF EXISTS `boxes`;

CREATE TABLE `boxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '框编号',
  `pathid` int(11) DEFAULT NULL COMMENT '所属路径（外键）',
  `xtl` int(11) DEFAULT NULL COMMENT '左上角x坐标',
  `ytl` int(11) DEFAULT NULL COMMENT '左上角y坐标',
  `xbr` int(11) DEFAULT NULL COMMENT '右下角x坐标',
  `ybr` int(11) DEFAULT NULL COMMENT '右下角y坐标',
  `frame` int(11) DEFAULT NULL COMMENT '属于帧数',
  `occluded` tinyint(1) DEFAULT '0' COMMENT '是否在被遮挡',
  `outside` tinyint(1) DEFAULT '0' COMMENT '是否在视野内',
  `isrevised` tinyint(1) DEFAULT '0' COMMENT '是否是审核员修正的标注',
  PRIMARY KEY (`id`),
  KEY `pathid` (`pathid`),
  CONSTRAINT `boxes_ibfk_1` FOREIGN KEY (`pathid`) REFERENCES `paths` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Table structure for table `boxes2attributes` */

DROP TABLE IF EXISTS `boxes2attributes`;

CREATE TABLE `boxes2attributes` (
  `box_id` int(11) DEFAULT NULL COMMENT '所属框（外键）',
  `attribute_id` int(11) DEFAULT NULL COMMENT '所属状态（外键）',
  KEY `box_id` (`box_id`),
  KEY `attribute_id` (`attribute_id`),
  CONSTRAINT `boxes2attributes_ibfk_1` FOREIGN KEY (`box_id`) REFERENCES `boxes` (`id`),
  CONSTRAINT `boxes2attributes_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `CITIS_bonus_schedule_constant` */

DROP TABLE IF EXISTS `CITIS_bonus_schedule_constant`;

CREATE TABLE `CITIS_bonus_schedule_constant` (
  `id` int(11) NOT NULL COMMENT '编号，与schedule一一对应',
  `amount` float NOT NULL DEFAULT '0' COMMENT '总薪酬',
  PRIMARY KEY (`id`),
  CONSTRAINT `CITIS_bonus_schedule_constant_ibfk_1` FOREIGN KEY (`id`) REFERENCES `CITIS_bonus_schedules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `CITIS_bonus_schedules` */

DROP TABLE IF EXISTS `CITIS_bonus_schedules`;

CREATE TABLE `CITIS_bonus_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '计划编号',
  `groupid` int(11) DEFAULT NULL COMMENT '所属任务组（外键）',
  `type` varchar(250) CHARACTER SET latin1 DEFAULT NULL COMMENT '类别',
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`),
  CONSTRAINT `CITIS_bonus_schedules_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `CITIS_hit_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `CITIS_event_log` */

DROP TABLE IF EXISTS `CITIS_event_log`;

CREATE TABLE `CITIS_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '打标日志编号',
  `hitid` int(11) DEFAULT NULL COMMENT '所属标注任务（外键）',
  `domain` text CHARACTER SET latin1 COMMENT '领域',
  `message` text CHARACTER SET latin1 COMMENT '消息',
  `timestamp` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `ix_CITIS_event_log_hitid` (`hitid`),
  CONSTRAINT `CITIS_event_log_ibfk_1` FOREIGN KEY (`hitid`) REFERENCES `CITIS_hits` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `CITIS_hit_groups` */

DROP TABLE IF EXISTS `CITIS_hit_groups`;

CREATE TABLE `CITIS_hit_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务组编号',
  `title` varchar(250) CHARACTER SET latin1 NOT NULL COMMENT '任务组标题',
  `description` varchar(250) CHARACTER SET latin1 NOT NULL COMMENT '描述',
  `duration` int(11) NOT NULL COMMENT '持续时间',
  `lifetime` int(11) NOT NULL COMMENT '生命周期',
  `cost` float NOT NULL DEFAULT '0' COMMENT '代价',
  `keywords` varchar(250) CHARACTER SET latin1 NOT NULL COMMENT '关键字',
  `height` int(11) NOT NULL DEFAULT '650' COMMENT '高度',
  `donation` int(11) DEFAULT '0' COMMENT '捐助',
  `offline` tinyint(1) DEFAULT '0' COMMENT '是否离线',
  `minapprovedamount` int(11) DEFAULT NULL COMMENT '最少批准数量',
  `minapprovedpercent` int(11) DEFAULT NULL COMMENT '最少批准比例',
  `countrycode` varchar(10) CHARACTER SET latin1 DEFAULT NULL COMMENT '国家代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `CITIS_hits` */

DROP TABLE IF EXISTS `CITIS_hits`;

CREATE TABLE `CITIS_hits` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '打标编号',
  `hitslug` varchar(30) CHARACTER SET latin1 DEFAULT NULL COMMENT '打标标识',
  `groupid` int(11) DEFAULT NULL COMMENT '所属任务组（外键）',
  `description` text COMMENT '任务描述',
  `depth` float DEFAULT NULL COMMENT '任务难度',
  `workerid` int(11) DEFAULT NULL COMMENT '3:标注者编号',
  `checkerid` int(11) DEFAULT NULL COMMENT '2:校验者编号',
  `ready` tinyint(1) DEFAULT '1' COMMENT '是否就绪',
  `published` tinyint(1) DEFAULT '0' COMMENT '是否已发布',
  `completed` tinyint(1) DEFAULT '0' COMMENT '是否已完成',
  `compensated` tinyint(1) DEFAULT '0' COMMENT '是否已支付酬金',
  `checked` tinyint(1) DEFAULT '0' COMMENT '2:是否已被审核',
  `accepted` tinyint(1) DEFAULT '0' COMMENT '是否被接收',
  `validated` tinyint(1) DEFAULT '0' COMMENT '是否有效',
  `reason` text COMMENT '原因',
  `isdisputed` tinyint(1) DEFAULT '0' COMMENT '是否标注着有争议',
  `disputedcontent` text COMMENT '提议内容',
  `commenterid` int(11) DEFAULT NULL COMMENT '4:评论者编号',
  `comments` text COMMENT '4:评价',
  `timeaccepted` datetime DEFAULT NULL COMMENT '约定时间',
  `timecompleted` datetime DEFAULT NULL COMMENT '完成时间',
  `timeonserver` datetime DEFAULT NULL COMMENT '在服务器上的时间',
  `ipaddress` varchar(15) CHARACTER SET latin1 DEFAULT NULL COMMENT 'ip地址',
  `page` varchar(250) CHARACTER SET latin1 NOT NULL COMMENT '网页',
  `completeness` float DEFAULT NULL COMMENT '完整度',
  `quality` float DEFAULT NULL COMMENT '标注质量',
  `donatedamount` float NOT NULL DEFAULT '0' COMMENT '捐助金额',
  `bonusamount` float NOT NULL DEFAULT '0' COMMENT '薪酬总计',
  `useful` tinyint(1) DEFAULT '1' COMMENT '是否有用',
  `annodocument` varchar(250) DEFAULT NULL COMMENT '标记xml文档保存路径',
  `type` varchar(250) CHARACTER SET latin1 DEFAULT NULL COMMENT '类型eg：jpbs',
  PRIMARY KEY (`id`),
  KEY `checkerid` (`checkerid`),
  KEY `commenterid` (`commenterid`),
  KEY `ix_CITIS_hits_published` (`published`),
  KEY `ix_CITIS_hits_compensated` (`compensated`),
  KEY `ix_CITIS_hits_ready` (`ready`),
  KEY `ix_CITIS_hits_groupid` (`groupid`),
  KEY `ix_CITIS_hits_completed` (`completed`),
  KEY `ix_CITIS_hits_accepted` (`accepted`),
  KEY `ix_CITIS_hits_workerid` (`workerid`),
  KEY `ix_CITIS_hits_validated` (`validated`),
  CONSTRAINT `CITIS_hits_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `CITIS_hit_groups` (`id`),
  CONSTRAINT `CITIS_hits_ibfk_2` FOREIGN KEY (`workerid`) REFERENCES `CITIS_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CITIS_hits_ibfk_3` FOREIGN KEY (`checkerid`) REFERENCES `CITIS_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CITIS_hits_ibfk_4` FOREIGN KEY (`commenterid`) REFERENCES `CITIS_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `CITIS_users` */


DROP TABLE IF EXISTS `CITIS_users`;

CREATE TABLE `CITIS_users` (
  `id` int(14) NOT NULL AUTO_INCREMENT COMMENT '工作者编号',
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `type` enum('管理员','审计员','标注员','评议员') NOT NULL COMMENT '用户类型',
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` enum('女','男') DEFAULT NULL,
  `numaccount` int(40) DEFAULT NULL COMMENT '银行卡号',
  `phonenum` int(40) DEFAULT NULL,
  `workexper` text COMMENT '工作经验',
  `educationback` text COMMENT '教育背景',
  `userlevel` int(11) DEFAULT NULL COMMENT '用户等级1，2，3···',
  `numuploaded` int(14) DEFAULT NULL COMMENT '2：上传视频数量',
  `numsubmitted` int(11) NOT NULL DEFAULT '0' COMMENT '3：已完成数量',
  `numacceptances` int(11) NOT NULL DEFAULT '0' COMMENT '3：被接收数量',
  `numrejections` int(11) NOT NULL DEFAULT '0' COMMENT '3：被拒绝数量',
  `blocked` tinyint(1) DEFAULT '0' COMMENT '是否被锁定',
  `bonusamount` float NOT NULL DEFAULT '0' COMMENT '薪酬总计',
  `verified` tinyint(1) DEFAULT '0' COMMENT '是否被认证',
  `donatedamount` float NOT NULL DEFAULT '0' COMMENT '捐助数额',
  PRIMARY KEY (`id`),
  KEY `typeid` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


insert  into `CITIS_users`(`id`,`username`,`password`,`type`,`address`,`email`,`age`,`gender`,`numaccount`,`phonenum`,`workexper`,`educationback`,`userlevel`,`numuploaded`,`numsubmitted`,`numacceptances`,`numrejections`,`blocked`,`bonusamount`,`verified`) values (1,'annoter1','annoter1','标注员','软件所','annoter1@163.com',20,'男',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1),(2,'annoter2','annoter1','标注员','软件所','annoter2@163.com',30,'女',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1),(3,'auditor','auditor','审计员','软件所','auditor@163.com',20,'男',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,1),(4,'commentor1','commentor1','评议员','软件所','commentor1@163.com',30,'女',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,1);
/*Table structure for table `completion_bonuses` */

DROP TABLE IF EXISTS `completion_bonuses`;

CREATE TABLE `completion_bonuses` (
  `id` int(11) NOT NULL COMMENT '计划编号（与schedule一一对应）',
  `amount` float NOT NULL DEFAULT '0' COMMENT '计划总薪酬',
  PRIMARY KEY (`id`),
  CONSTRAINT `completion_bonuses_ibfk_1` FOREIGN KEY (`id`) REFERENCES `CITIS_bonus_schedules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL COMMENT '任务编号（和hit一一对应）',
  `segmentid` int(11) DEFAULT NULL COMMENT '视频段编号（外键）',
  `istraining` tinyint(1) DEFAULT '0' COMMENT '是否用于训练',
  PRIMARY KEY (`id`),
  KEY `segmentid` (`segmentid`),
  CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`id`) REFERENCES `CITIS_hits` (`id`),
  CONSTRAINT `jobs_ibfk_2` FOREIGN KEY (`segmentid`) REFERENCES `segments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `labels` */

DROP TABLE IF EXISTS `labels`;

CREATE TABLE `labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签（类型）编号',
  `text` varchar(250) CHARACTER SET latin1 DEFAULT NULL COMMENT '类型名称',
  `videoid` int(11) DEFAULT NULL COMMENT '所属视频（外键）',
  PRIMARY KEY (`id`),
  KEY `videoid` (`videoid`),
  CONSTRAINT `labels_ibfk_1` FOREIGN KEY (`videoid`) REFERENCES `videos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Table structure for table `paths` */

DROP TABLE IF EXISTS `paths`;

CREATE TABLE `paths` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路径编号',
  `jobid` int(11) DEFAULT NULL COMMENT '所属任务（外键）',
  `labelid` int(11) DEFAULT NULL COMMENT '所属类型（eg:人、车）',
  PRIMARY KEY (`id`),
  KEY `jobid` (`jobid`),
  KEY `labelid` (`labelid`),
  CONSTRAINT `paths_ibfk_1` FOREIGN KEY (`jobid`) REFERENCES `jobs` (`id`),
  CONSTRAINT `paths_ibfk_2` FOREIGN KEY (`labelid`) REFERENCES `labels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `per_object_bonuses` */

DROP TABLE IF EXISTS `per_object_bonuses`;

CREATE TABLE `per_object_bonuses` (
  `id` int(11) NOT NULL COMMENT '编号与schedule一一对应',
  `amount` float NOT NULL DEFAULT '0' COMMENT '每个对象报酬',
  PRIMARY KEY (`id`),
  CONSTRAINT `per_object_bonuses_ibfk_1` FOREIGN KEY (`id`) REFERENCES `CITIS_bonus_schedules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `segments` */

DROP TABLE IF EXISTS `segments`;

CREATE TABLE `segments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频段编号',
  `videoid` int(11) DEFAULT NULL COMMENT '所属视频（外键）',
  `start` int(11) DEFAULT NULL COMMENT '开始帧',
  `stop` int(11) DEFAULT NULL COMMENT '结束帧',
  PRIMARY KEY (`id`),
  KEY `videoid` (`videoid`),
  CONSTRAINT `segments_ibfk_1` FOREIGN KEY (`videoid`) REFERENCES `videos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `videos` */

DROP TABLE IF EXISTS `videos`;

CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频编号',
  `slug` varchar(250) CHARACTER SET latin1 DEFAULT NULL COMMENT '视频标识名',
  `uploaderid` int(11) DEFAULT NULL COMMENT '上传者编号',
  `width` int(11) DEFAULT NULL COMMENT '宽度',
  `height` int(11) DEFAULT NULL COMMENT '高度',
  `totalframes` int(11) DEFAULT NULL COMMENT '总帧数',
  `location` varchar(250) CHARACTER SET latin1 DEFAULT NULL COMMENT '位置',
  `skip` int(11) NOT NULL,
  `perobjectbonus` float DEFAULT '0' COMMENT '每个对象薪酬',
  `completionbonus` float DEFAULT '0' COMMENT '总视频薪酬',
  `trainwithid` int(11) DEFAULT NULL COMMENT '训练视频的编号',
  `isfortraining` tinyint(1) DEFAULT '0' COMMENT '是否用于训练',
  `trainvalidator` text COMMENT '不规范说明',
  `scene` varchar(50) DEFAULT NULL COMMENT '场景',
  `resolutionx` int(20) DEFAULT NULL COMMENT '水平分辨率',
  `resolutiony` int(20) DEFAULT NULL COMMENT '垂直分表率',
  `videoannodocument` varchar(250) DEFAULT NULL COMMENT 'xml文档存储路径',
  `type` enum('仿真','实拍') DEFAULT NULL COMMENT '类型',
  `blowradius` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trainwithid` (`trainwithid`),
  KEY `ix_videos_slug` (`slug`),
  KEY `uploaderid` (`uploaderid`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`trainwithid`) REFERENCES `videos` (`id`),
  CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`uploaderid`) REFERENCES `CITIS_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
