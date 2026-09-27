/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - newsrate
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`newsrate` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `newsrate`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can add permission',2,'add_permission'),
(5,'Can change permission',2,'change_permission'),
(6,'Can delete permission',2,'delete_permission'),
(7,'Can add group',3,'add_group'),
(8,'Can change group',3,'change_group'),
(9,'Can delete group',3,'delete_group'),
(10,'Can add user',4,'add_user'),
(11,'Can change user',4,'change_user'),
(12,'Can delete user',4,'delete_user'),
(13,'Can add content type',5,'add_contenttype'),
(14,'Can change content type',5,'change_contenttype'),
(15,'Can delete content type',5,'delete_contenttype'),
(16,'Can add session',6,'add_session'),
(17,'Can change session',6,'change_session'),
(18,'Can delete session',6,'delete_session'),
(19,'Can add buy',7,'add_buy'),
(20,'Can change buy',7,'change_buy'),
(21,'Can delete buy',7,'delete_buy'),
(22,'Can add comment',8,'add_comment'),
(23,'Can change comment',8,'change_comment'),
(24,'Can delete comment',8,'delete_comment'),
(25,'Can add commission',9,'add_commission'),
(26,'Can change commission',9,'change_commission'),
(27,'Can delete commission',9,'delete_commission'),
(28,'Can add complaint',10,'add_complaint'),
(29,'Can change complaint',10,'change_complaint'),
(30,'Can delete complaint',10,'delete_complaint'),
(31,'Can add history',11,'add_history'),
(32,'Can change history',11,'change_history'),
(33,'Can delete history',11,'delete_history'),
(34,'Can add login',12,'add_login'),
(35,'Can change login',12,'change_login'),
(36,'Can delete login',12,'delete_login'),
(37,'Can add newschanel',13,'add_newschanel'),
(38,'Can change newschanel',13,'change_newschanel'),
(39,'Can delete newschanel',13,'delete_newschanel'),
(40,'Can add payment',14,'add_payment'),
(41,'Can change payment',14,'change_payment'),
(42,'Can delete payment',14,'delete_payment'),
(43,'Can add rating',15,'add_rating'),
(44,'Can change rating',15,'change_rating'),
(45,'Can delete rating',15,'delete_rating'),
(46,'Can add user',16,'add_user'),
(47,'Can change user',16,'change_user'),
(48,'Can delete user',16,'delete_user'),
(49,'Can add video',17,'add_video'),
(50,'Can change video',17,'change_video'),
(51,'Can delete video',17,'delete_video');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(2,'auth','permission'),
(3,'auth','group'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(7,'newsrateapp','buy'),
(8,'newsrateapp','comment'),
(9,'newsrateapp','commission'),
(10,'newsrateapp','complaint'),
(11,'newsrateapp','history'),
(12,'newsrateapp','login'),
(13,'newsrateapp','newschanel'),
(14,'newsrateapp','payment'),
(15,'newsrateapp','rating'),
(16,'newsrateapp','user'),
(17,'newsrateapp','video');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-03-10 05:27:06.820786'),
(2,'auth','0001_initial','2024-03-10 05:27:07.123189'),
(3,'admin','0001_initial','2024-03-10 05:27:07.197300'),
(4,'admin','0002_logentry_remove_auto_add','2024-03-10 05:27:07.215372'),
(5,'contenttypes','0002_remove_content_type_name','2024-03-10 05:27:07.247959'),
(6,'auth','0002_alter_permission_name_max_length','2024-03-10 05:27:07.268504'),
(7,'auth','0003_alter_user_email_max_length','2024-03-10 05:27:07.286951'),
(8,'auth','0004_alter_user_username_opts','2024-03-10 05:27:07.300389'),
(9,'auth','0005_alter_user_last_login_null','2024-03-10 05:27:07.319668'),
(10,'auth','0006_require_contenttypes_0002','2024-03-10 05:27:07.324492'),
(11,'auth','0007_alter_validators_add_error_messages','2024-03-10 05:27:07.331644'),
(12,'auth','0008_alter_user_username_max_length','2024-03-10 05:27:07.372387'),
(13,'auth','0009_alter_user_last_name_max_length','2024-03-10 05:27:07.397379'),
(14,'newsrateapp','0001_initial','2024-03-10 05:27:07.812990'),
(15,'sessions','0001_initial','2024-03-10 05:27:07.859043');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('haktkhj5b15sijvcg3mci18zbz5vj6dd','YTY3Mjg0YzkxMGRiYTMxZmRkYjA0ZmIzNDJjMTAyNmU4N2JkNzZlZDp7ImxvZ2luX2lkIjo4LCJuY2hfaWQiOjIsInVzZXJfaWQiOjN9','2024-03-24 07:30:09.167565');

/*Table structure for table `newsrateapp_buy` */

DROP TABLE IF EXISTS `newsrateapp_buy`;

CREATE TABLE `newsrateapp_buy` (
  `buy_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(225) NOT NULL,
  `status` varchar(225) NOT NULL,
  `nchs_id` int(11) NOT NULL,
  `videos_id` int(11) NOT NULL,
  PRIMARY KEY (`buy_id`),
  KEY `newsrateapp_buy_nchs_id_22a59718` (`nchs_id`),
  KEY `newsrateapp_buy_videos_id_80431434` (`videos_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `newsrateapp_buy` */

insert  into `newsrateapp_buy`(`buy_id`,`date`,`status`,`nchs_id`,`videos_id`) values 
(1,'2024-03-10 11:31:56.584000','paid',1,1);

/*Table structure for table `newsrateapp_comment` */

DROP TABLE IF EXISTS `newsrateapp_comment`;

CREATE TABLE `newsrateapp_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `cbuys_id` int(11) NOT NULL,
  `cusers_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `newsrateapp_comment_cbuys_id_6ccd0b95` (`cbuys_id`),
  KEY `newsrateapp_comment_cusers_id_24ceac1b` (`cusers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `newsrateapp_comment` */

/*Table structure for table `newsrateapp_commission` */

DROP TABLE IF EXISTS `newsrateapp_commission`;

CREATE TABLE `newsrateapp_commission` (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(225) NOT NULL,
  `combuys_id` int(11) NOT NULL,
  PRIMARY KEY (`comm_id`),
  KEY `newsrateapp_commission_combuys_id_5c3c89bd` (`combuys_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `newsrateapp_commission` */

/*Table structure for table `newsrateapp_complaint` */

DROP TABLE IF EXISTS `newsrateapp_complaint`;

CREATE TABLE `newsrateapp_complaint` (
  `comp_id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint` varchar(225) NOT NULL,
  `reply` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `comusers_id` int(11) NOT NULL,
  PRIMARY KEY (`comp_id`),
  KEY `newsrateapp_complaint_comusers_id_53a09ecd` (`comusers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `newsrateapp_complaint` */

insert  into `newsrateapp_complaint`(`comp_id`,`complaint`,`reply`,`date`,`comusers_id`) values 
(1,'wwwww','pending','2024-03-10 11:26:22.999305',2),
(2,'fgh','pending','2024-03-10 11:26:41.583067',2),
(3,'ertyu','pending','2024-03-10 11:29:54.952745',5);

/*Table structure for table `newsrateapp_history` */

DROP TABLE IF EXISTS `newsrateapp_history`;

CREATE TABLE `newsrateapp_history` (
  `his_id` int(11) NOT NULL AUTO_INCREMENT,
  `count` varchar(225) NOT NULL,
  `hbuys_id` int(11) NOT NULL,
  `husers_id` int(11) NOT NULL,
  PRIMARY KEY (`his_id`),
  KEY `newsrateapp_history_hbuys_id_c3458ffb` (`hbuys_id`),
  KEY `newsrateapp_history_husers_id_6fe809a8` (`husers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `newsrateapp_history` */

/*Table structure for table `newsrateapp_login` */

DROP TABLE IF EXISTS `newsrateapp_login`;

CREATE TABLE `newsrateapp_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `usertype` varchar(225) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `newsrateapp_login` */

insert  into `newsrateapp_login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(2,'aassiaaa','aasia','newschannel'),
(6,'uwshhw','1234','newschannel'),
(5,'malavika','Malavii@123','Blocked'),
(7,'ash','ash123','Blocked'),
(8,'Manuuu','Manuu@123','user');

/*Table structure for table `newsrateapp_newschanel` */

DROP TABLE IF EXISTS `newsrateapp_newschanel`;

CREATE TABLE `newsrateapp_newschanel` (
  `nch_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `place` varchar(225) NOT NULL,
  `phone` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `clogins_id` int(11) NOT NULL,
  PRIMARY KEY (`nch_id`),
  KEY `newsrateapp_newschanel_clogins_id_7003844b` (`clogins_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `newsrateapp_newschanel` */

insert  into `newsrateapp_newschanel`(`nch_id`,`name`,`place`,`phone`,`email`,`clogins_id`) values 
(1,'asinet','kochi','6998759985','thayineri@gmail.com',2),
(2,'media','dheradhu','1227827','swsn@gmil.com',6);

/*Table structure for table `newsrateapp_payment` */

DROP TABLE IF EXISTS `newsrateapp_payment`;

CREATE TABLE `newsrateapp_payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `buys_id` int(11) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `newsrateapp_payment_buys_id_a8615098` (`buys_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `newsrateapp_payment` */

/*Table structure for table `newsrateapp_rating` */

DROP TABLE IF EXISTS `newsrateapp_rating`;

CREATE TABLE `newsrateapp_rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `rated` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `rbuys_id` int(11) NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `newsrateapp_rating_rbuys_id_495edb1b` (`rbuys_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `newsrateapp_rating` */

/*Table structure for table `newsrateapp_user` */

DROP TABLE IF EXISTS `newsrateapp_user`;

CREATE TABLE `newsrateapp_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(225) NOT NULL,
  `lname` varchar(225) NOT NULL,
  `place` varchar(225) NOT NULL,
  `phone` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `ulogins_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `newsrateapp_user_ulogins_id_e974e041` (`ulogins_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `newsrateapp_user` */

insert  into `newsrateapp_user`(`user_id`,`fname`,`lname`,`place`,`phone`,`email`,`ulogins_id`) values 
(1,'malavika','m','kochi','9867548692','jhhjkj@gm.com',5),
(2,'ashkar','mn','nn','1234567890','ash@gmail.com',7),
(3,'manu','l','thayineri','9874561230','mani45@gmail',8);

/*Table structure for table `newsrateapp_video` */

DROP TABLE IF EXISTS `newsrateapp_video`;

CREATE TABLE `newsrateapp_video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(225) NOT NULL,
  `video` varchar(225) NOT NULL,
  `amount` varchar(225) NOT NULL,
  `details` varchar(225) NOT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`video_id`),
  KEY `newsrateapp_video_users_id_f9f1a2fb` (`users_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `newsrateapp_video` */

insert  into `newsrateapp_video`(`video_id`,`title`,`video`,`amount`,`details`,`users_id`) values 
(1,'fight','WhatsApp Video 2023-01-28 at 9.53.43 PM.mp4','500','wer',1),
(2,'gossip','WhatsApp Video 2023-01-28 at 9.53.43 PM - Copy.mp4','500','ertyui',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
