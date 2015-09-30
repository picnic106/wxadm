/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.0.67-community-log 
*********************************************************************
*/
CREATE TABLE `wx_ac` (
  `AC_ID` bigint(20) unsigned NOT NULL auto_increment COMMENT '活动标示',
  `AC_NAME` varchar(20) default NULL COMMENT '活动标题',
  `AC_START_TIME` datetime default NULL COMMENT '活动开始时间',
  `AC_END_TIME` datetime default NULL COMMENT '活动结束时间',
  `AC_IMG_URL` varchar(200) default NULL COMMENT '活动图片地址',
  `AC_TINY_IMG_URL` varchar(200) default NULL COMMENT '活动缩略图地址',
  `AC_INTRO` text COMMENT '活动介绍',
  `AC_STATS` int(11) default NULL COMMENT '活动状态；1为上线；2为下线；放到属性表',
  `AC_TYPE` int(11) default NULL COMMENT '活动类型；类型从属性表里取；目前分为报名类型和投票类型。',
  `AC_CREATE_TIME` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`AC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='微信活动表'

CREATE TABLE `wx_ac_prize` (
  `GL_ID` bigint(20) unsigned NOT NULL auto_increment COMMENT '关联ID',
  `AC_ID` bigint(20) unsigned default NULL COMMENT '活动id',
  `PZ_ID` bigint(20) unsigned default NULL COMMENT '奖品id',
  PRIMARY KEY  (`GL_ID`),
  KEY `FK_WX_AC_PR_REFERENCE_WX_AC` (`AC_ID`),
  KEY `FK_WX_AC_PR_REFERENCE_WX_PRIZE` (`PZ_ID`),
  CONSTRAINT `FK_WX_AC_PR_REFERENCE_WX_AC` FOREIGN KEY (`AC_ID`) REFERENCES `wx_ac` (`AC_ID`),
  CONSTRAINT `FK_WX_AC_PR_REFERENCE_WX_PRIZE` FOREIGN KEY (`PZ_ID`) REFERENCES `wx_prize` (`PZ_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='活动和奖品关联表'


CREATE TABLE `wx_prize` (
  `PZ_ID` bigint(20) unsigned NOT NULL auto_increment COMMENT '奖品标示',
  `PZ_NAME` varchar(20) default NULL COMMENT '奖品标题',
  `PZ_IMG_URL` varchar(200) default NULL COMMENT '奖品图片',
  `PZ_TINY_IMG_URL` varchar(200) default NULL COMMENT '奖品缩略图',
  `PZ_GRADE` int(11) default NULL COMMENT '奖品等级：1、2、3、参与奖；放到属性表',
  `PZ_STATS` int(11) default NULL COMMENT '奖品状态：分为开启和关闭；放到属性表',
  `PZ_CREATE_TIME` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`PZ_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='微信活动奖品表'


CREATE TABLE `wx_user` (
  `id` bigint(20) unsigned NOT NULL auto_increment COMMENT '用户id',
  `username` varchar(50) default NULL COMMENT '用户名',
  `password` char(64) default NULL COMMENT '密码',
  `state` varchar(32) default NULL COMMENT '状态',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户表'

CREATE TABLE `abc_activity_userinfo` (
  `id` int(11) NOT NULL auto_increment,
  `openId` varchar(100) NOT NULL default '',
  `babyname` varchar(50) NOT NULL default '',
  `babybirthday` date NOT NULL default '2015-08-12',
  `babyPicUrl` varchar(255) NOT NULL default '',
  `mobileNumber` char(11) NOT NULL default '',
  `receiveAddress` varchar(200) NOT NULL default '',
  `createTime` datetime NOT NULL default '2015-08-12 00:00:00',
  `activityId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='投票用户信息表'


CREATE TABLE `abc_activity_voteinfo` (
  `id` int(11) NOT NULL auto_increment,
  `openId` varchar(100) NOT NULL default '',
  `voterid` varchar(100) NOT NULL default '',
  `voteTime` datetime NOT NULL default '2015-08-12 00:00:00',
  `activityId` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='投票人数表'


