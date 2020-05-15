/*
SQLyog Professional v12.5.1 (64 bit)
MySQL - 10.1.40-MariaDB : Database - testsupport
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`testsupport` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `testsupport`;

/*Table structure for table `sb_conversations` */

DROP TABLE IF EXISTS `sb_conversations`;

CREATE TABLE `sb_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_time` datetime NOT NULL,
  `status_code` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sb_conversations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sb_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `sb_conversations` */

/*Table structure for table `sb_messages` */

DROP TABLE IF EXISTS `sb_messages`;

CREATE TABLE `sb_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_bin NOT NULL,
  `creation_time` datetime NOT NULL,
  `status_code` tinyint(4) DEFAULT '0',
  `attachments` text COLLATE utf8mb4_bin,
  `payload` text COLLATE utf8mb4_bin,
  `conversation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `conversation_id` (`conversation_id`),
  CONSTRAINT `sb_messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sb_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sb_messages_ibfk_2` FOREIGN KEY (`conversation_id`) REFERENCES `sb_conversations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `sb_messages` */

/*Table structure for table `sb_settings` */

DROP TABLE IF EXISTS `sb_settings`;

CREATE TABLE `sb_settings` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `sb_settings` */

/*Table structure for table `sb_users` */

DROP TABLE IF EXISTS `sb_users`;

CREATE TABLE `sb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `creation_time` datetime NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `typing` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `sb_users` */

insert  into `sb_users`(`id`,`first_name`,`last_name`,`password`,`email`,`profile_image`,`user_type`,`creation_time`,`token`,`last_activity`,`typing`) values 
(1,'Vitalii','Burak','$2y$10$Rl1laTrPReiMySLdqz8t8eLU2JB4hz7z/fy2FKK0uB.q.MX/esBBW','vbuppkey@gmail.com','http://localhost/supportboard/media/user.svg','admin','2020-05-15 22:05:19','6ba24d105b5565ec1ca3292b2dc3dbce56c26b8d','2020-05-15 22:13:13',-1),
(2,'Bot','','',NULL,'http://localhost/supportboard/media/user.svg','bot','2020-05-15 22:05:58','59463552aac6c46b7786f50a582a010049f8a6f2','2020-05-15 22:05:58',-1);

/*Table structure for table `sb_users_data` */

DROP TABLE IF EXISTS `sb_users_data`;

CREATE TABLE `sb_users_data` (
  `user_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `sb_users_data_index` (`user_id`,`slug`),
  CONSTRAINT `sb_users_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sb_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `sb_users_data` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
