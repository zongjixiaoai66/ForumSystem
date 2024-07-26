/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t204`;
CREATE DATABASE IF NOT EXISTS `t204` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t204`;

DROP TABLE IF EXISTS `banzhu`;
CREATE TABLE IF NOT EXISTS `banzhu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `banzhu_name` varchar(200) DEFAULT NULL COMMENT '版主姓名 Search111 ',
  `banzhu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int DEFAULT NULL COMMENT '性别 Search111 ',
  `banzhu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `banzhu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `banzhu_delete` int DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='版主';

DELETE FROM `banzhu`;
INSERT INTO `banzhu` (`id`, `username`, `password`, `banzhu_name`, `banzhu_photo`, `sex_types`, `banzhu_phone`, `banzhu_email`, `banzhu_delete`, `create_time`) VALUES
	(1, '版主1', '123456', '版主姓名1', 'http://localhost:8080/luentanxitong/upload/1648201262532.jpg', 2, '17703786901', '1@qq.com', 1, '2022-03-25 09:12:27'),
	(2, '版主2', '123456', '版主姓名2', 'http://localhost:8080/luentanxitong/upload/1648201254580.jpg', 1, '17703786902', '2@qq.com', 1, '2022-03-25 09:12:27'),
	(3, '版主3', '123456', '版主姓名3', 'http://localhost:8080/luentanxitong/upload/1648201247162.jpg', 2, '17703786903', '3@qq.com', 1, '2022-03-25 09:12:27'),
	(4, '版主4', '123456', '版主姓名4', 'http://localhost:8080/luentanxitong/upload/banzhu4.jpg', 1, '17703786904', '4@qq.com', 2, '2022-03-25 09:12:27'),
	(5, '版主5', '123456', '版主姓名5', 'http://localhost:8080/luentanxitong/upload/banzhu5.jpg', 1, '17703786905', '5@qq.com', 2, '2022-03-25 09:12:27');

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, '轮播图1', 'http://localhost:8080/luentanxitong/upload/config1.jpg'),
	(2, '轮播图2', 'http://localhost:8080/luentanxitong/upload/config2.jpg'),
	(3, '轮播图3', 'http://localhost:8080/luentanxitong/upload/config3.jpg');

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='字典';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'forum_types', '帖子类型', 1, '帖子类型1', NULL, NULL, '2022-03-25 09:01:26'),
	(2, 'forum_types', '帖子类型', 2, '帖子类型2', NULL, NULL, '2022-03-25 09:01:26'),
	(3, 'forum_types', '帖子类型', 3, '帖子类型3', NULL, NULL, '2022-03-25 09:01:26'),
	(4, 'forum_state_types', '帖子状态', 1, '发帖', NULL, NULL, '2022-03-25 09:01:26'),
	(5, 'forum_state_types', '帖子状态', 2, '回帖', NULL, NULL, '2022-03-25 09:01:26'),
	(6, 'news_types', '新闻类型', 1, '新闻类型1', NULL, NULL, '2022-03-25 09:01:26'),
	(7, 'news_types', '新闻类型', 2, '新闻类型2', NULL, NULL, '2022-03-25 09:01:26'),
	(8, 'sex_types', '性别类型', 1, '男', NULL, NULL, '2022-03-25 09:01:26'),
	(9, 'sex_types', '性别类型', 2, '女', NULL, NULL, '2022-03-25 09:01:26');

DROP TABLE IF EXISTS `forum`;
CREATE TABLE IF NOT EXISTS `forum` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `banzhu_id` int DEFAULT NULL COMMENT '版主',
  `users_id` int DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int DEFAULT NULL COMMENT '父id',
  `forum_types` int DEFAULT NULL COMMENT '帖子类型',
  `forum_state_types` int DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='论坛';

DELETE FROM `forum`;
INSERT INTO `forum` (`id`, `forum_name`, `yonghu_id`, `banzhu_id`, `users_id`, `forum_content`, `super_ids`, `forum_types`, `forum_state_types`, `insert_time`, `update_time`, `create_time`) VALUES
	(1, '帖子标题1', 3, NULL, NULL, '发布内容1', NULL, 3, 1, '2022-03-25 09:12:27', '2022-03-25 09:12:27', '2022-03-25 09:12:27'),
	(2, '帖子标题2', 2, NULL, NULL, '发布内容2', NULL, 1, 1, '2022-03-25 09:12:27', '2022-03-25 09:12:27', '2022-03-25 09:12:27'),
	(3, '帖子标题3', 1, NULL, NULL, '发布内容3', NULL, 1, 1, '2022-03-25 09:12:27', '2022-03-25 09:12:27', '2022-03-25 09:12:27'),
	(4, '帖子标题4', 1, NULL, NULL, '发布内容4', NULL, 3, 1, '2022-03-25 09:12:27', '2022-03-25 09:12:27', '2022-03-25 09:12:27'),
	(5, '帖子标题5', 1, NULL, NULL, '发布内容5', NULL, 1, 1, '2022-03-25 09:12:27', '2022-03-25 09:12:27', '2022-03-25 09:12:27'),
	(6, NULL, 1, NULL, NULL, '321', 5, NULL, 2, '2022-03-25 09:39:02', NULL, '2022-03-25 09:39:02'),
	(8, NULL, NULL, 1, NULL, '123', 5, NULL, 2, '2022-03-25 09:47:43', NULL, '2022-03-25 09:47:43');

DROP TABLE IF EXISTS `liuyan`;
CREATE TABLE IF NOT EXISTS `liuyan` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `liuyan_name` varchar(200) DEFAULT NULL COMMENT '留言标题  Search111 ',
  `liuyan_text` text COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='留言版';

DELETE FROM `liuyan`;
INSERT INTO `liuyan` (`id`, `yonghu_id`, `liuyan_name`, `liuyan_text`, `insert_time`, `reply_text`, `update_time`, `create_time`) VALUES
	(1, 2, '留言标题1', '留言内容1', '2022-03-25 09:12:27', '回复信息1', '2022-03-25 09:12:27', '2022-03-25 09:12:27'),
	(2, 3, '留言标题2', '留言内容2', '2022-03-25 09:12:27', '回复信息2', '2022-03-25 09:12:27', '2022-03-25 09:12:27'),
	(3, 2, '留言标题3', '留言内容3', '2022-03-25 09:12:27', '回复信息3', '2022-03-25 09:12:27', '2022-03-25 09:12:27'),
	(4, 2, '留言标题4', '留言内容4', '2022-03-25 09:12:27', '回复信息4', '2022-03-25 09:12:27', '2022-03-25 09:12:27'),
	(5, 3, '留言标题5', '留言内容5', '2022-03-25 09:12:27', '回复信息5', '2022-03-25 09:12:27', '2022-03-25 09:12:27'),
	(7, 1, '666', '66', '2024-06-03 05:17:53', NULL, NULL, '2024-06-03 05:17:53');

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `news_name` varchar(200) DEFAULT NULL COMMENT '新闻名称 Search111  ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '新闻图片 ',
  `news_types` int NOT NULL COMMENT '新闻类型 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '新闻发布时间 ',
  `news_content` text COMMENT '新闻详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='新闻信息';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `news_name`, `news_photo`, `news_types`, `insert_time`, `news_content`, `create_time`) VALUES
	(1, '新闻名称1', 'http://localhost:8080/luentanxitong/upload/news1.jpg', 2, '2022-03-25 09:12:27', '新闻详情1', '2022-03-25 09:12:27'),
	(2, '新闻名称2', 'http://localhost:8080/luentanxitong/upload/news2.jpg', 1, '2022-03-25 09:12:27', '新闻详情2', '2022-03-25 09:12:27'),
	(3, '新闻名称3', 'http://localhost:8080/luentanxitong/upload/news3.jpg', 1, '2022-03-25 09:12:27', '新闻详情3', '2022-03-25 09:12:27'),
	(4, '新闻名称4', 'http://localhost:8080/luentanxitong/upload/news4.jpg', 1, '2022-03-25 09:12:27', '新闻详情4', '2022-03-25 09:12:27'),
	(5, '新闻名称5', 'http://localhost:8080/luentanxitong/upload/news5.jpg', 1, '2022-03-25 09:12:27', '新闻详情5', '2022-03-25 09:12:27');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 1, 'a1', 'yonghu', '用户', 'l9q6jyg6fjq5c7mjc26ctu3ftd1j1g0g', '2022-03-25 09:38:08', '2024-06-03 06:17:39'),
	(2, 1, 'admin', 'users', '管理员', 'kuyba2mjbr3iwy9v6371692pmb0g0pz4', '2022-03-25 09:40:21', '2024-06-03 06:16:08'),
	(3, 1, 'a1', 'banzhu', '版主', 'cv3xe4fqh5ok1xy91zkgcijpnwrjv142', '2022-03-25 09:47:09', '2024-06-03 06:17:13');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2022-04-30 16:00:00');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `yonghu_delete` int DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `yonghu_photo`, `sex_types`, `yonghu_phone`, `yonghu_email`, `yonghu_delete`, `create_time`) VALUES
	(1, '用户1', '123456', '用户姓名1', 'http://localhost:8080/luentanxitong/upload/yonghu1.jpg', 2, '17703786901', '1@qq.com', 1, '2022-03-25 09:12:27'),
	(2, '用户2', '123456', '用户姓名2', 'http://localhost:8080/luentanxitong/upload/yonghu2.jpg', 1, '17703786902', '2@qq.com', 1, '2022-03-25 09:12:27'),
	(3, '用户3', '123456', '用户姓名3', 'http://localhost:8080/luentanxitong/upload/yonghu3.jpg', 1, '17703786903', '3@qq.com', 1, '2022-03-25 09:12:27');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
