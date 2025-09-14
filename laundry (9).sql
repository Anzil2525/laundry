-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 14, 2025 at 08:05 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `assign`
--

CREATE TABLE IF NOT EXISTS `assign` (
  `asnid` int(11) NOT NULL AUTO_INCREMENT,
  `oid` varchar(15) NOT NULL,
  `stid` varchar(15) NOT NULL,
  `date` varchar(10) NOT NULL,
  `time` varchar(8) NOT NULL,
  `code` varchar(4) NOT NULL,
  PRIMARY KEY (`asnid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `assign`
--

INSERT INTO `assign` (`asnid`, `oid`, `stid`, `date`, `time`, `code`) VALUES
(1, '2', '1', '2025-06-27', '20:27:21', '4076'),
(2, '3', '1', '2025-06-27', '20:45:32', '3605'),
(3, '4', '1', '2025-06-27', '20:47:13', '5715'),
(4, '5', '1', '2025-06-27', '21:10:12', '8845'),
(5, '12', '2', '2025-06-28', '19:04:26', '6536'),
(6, '8', '1', '2025-06-29', '17:26:23', '4836'),
(7, '8', '2', '2025-06-29', '17:29:34', '9141'),
(8, '8', '1', '2025-06-29', '17:29:48', '1526'),
(9, '17', '1', '2025-07-01', '20:59:52', '8014'),
(10, '19', '1', '2025-07-02', '20:16:11', '5854'),
(11, '21', '1', '2025-07-02', '20:18:28', '6334'),
(12, '10', '1', '2025-07-02', '20:24:13', '9432'),
(13, '22', '1', '2025-07-02', '21:08:38', '5182'),
(14, '23', '1', '2025-08-21', '20:59:55', '7456'),
(15, '23', '2', '2025-08-21', '21:03:13', '5984'),
(16, '24', '1', '2025-08-22', '02:21:21', '6371'),
(17, '24', '2', '2025-08-22', '02:21:29', '2174'),
(18, '24', '1', '2025-08-25', '14:15:51', '6976'),
(19, '26', '1', '2025-08-25', '14:53:37', '4537'),
(20, '27', '5', '2025-09-11', '13:45:07', '3316'),
(21, '27', '6', '2025-09-11', '13:45:53', '7692'),
(22, '26', '2', '2025-09-11', '14:28:49', '1318'),
(23, '28', '7', '2025-09-14', '21:27:57', '9803');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_user_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `srid` varchar(10) NOT NULL,
  `uid` varchar(15) NOT NULL,
  `date` varchar(10) NOT NULL,
  `time` varchar(8) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`oid`, `srid`, `uid`, `date`, `time`, `status`) VALUES
(1, '4', '5', '2025-06-27', '20:26:13', 'rejected'),
(2, '5', '5', '2025-06-27', '20:27:06', 'completed'),
(3, '4', '5', '2025-06-27', '20:45:18', 'completed'),
(4, '4', '5', '2025-06-27', '20:46:37', 'cancelled'),
(5, '5', '5', '2025-06-27', '21:00:28', 'completed'),
(8, '4', '5', '2025-06-28', '10:23:15', 'completed'),
(9, '5', '5', '2025-06-28', '10:29:25', 'cancelled'),
(10, '4', '5', '2025-06-28', '10:56:24', 'completed'),
(11, '4', '5', '2025-06-28', '10:57:04', 'rejected'),
(12, '4', '5', '2025-06-28', '19:03:29', 'completed'),
(13, '6', '12', '2025-06-29', '22:54:47', 'booked'),
(14, '3', '5', '2025-06-30', '01:15:07', 'cancelled'),
(15, '4', '5', '2025-06-30', '13:22:58', 'rejected'),
(16, '4', '5', '2025-06-30', '13:23:27', 'cancelled'),
(17, '5', '5', '2025-07-01', '20:55:00', 'completed'),
(18, '3', '5', '2025-07-01', '21:13:24', 'rejected'),
(19, '5', '5', '2025-07-02', '20:15:50', 'cancelled'),
(20, '5', '5', '2025-07-02', '20:17:03', 'rejected'),
(21, '5', '5', '2025-07-02', '20:18:03', 'completed'),
(22, '4', '5', '2025-07-02', '20:49:49', 'completed'),
(23, '5', '5', '2025-07-15', '10:19:12', 'assigned'),
(24, '4', '5', '2025-08-15', '20:53:18', 'assigned'),
(25, '14', '5', '2025-08-25', '14:48:40', 'rejected'),
(26, '14', '5', '2025-08-25', '14:53:03', 'progress'),
(27, '3', '8', '2025-09-11', '13:43:22', 'assigned'),
(28, '7', '5', '2025-09-14', '21:27:34', 'completed'),
(29, '4', '8', '2025-09-15', '00:17:04', 'rejected'),
(30, '5', '8', '2025-09-15', '00:22:49', 'booked'),
(31, '5', '8', '2025-09-15', '00:26:19', 'rejected'),
(32, '13', '8', '2025-09-15', '00:39:00', 'rejected'),
(33, '13', '8', '2025-09-15', '01:12:07', 'rejected'),
(34, '13', '8', '2025-09-15', '01:14:19', 'rejected'),
(35, '13', '8', '2025-09-15', '01:30:51', 'rejected');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(15) NOT NULL,
  `srid` varchar(15) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cid`, `uid`, `srid`) VALUES
(17, '12', '6'),
(21, '5', '4'),
(23, '5', '14');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `django_admin_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-02-28 06:39:32'),
(2, 'auth', '0001_initial', '2022-02-28 06:39:32'),
(3, 'admin', '0001_initial', '2022-02-28 06:39:32'),
(4, 'contenttypes', '0002_remove_content_type_name', '2022-02-28 06:39:32'),
(5, 'auth', '0002_alter_permission_name_max_length', '2022-02-28 06:39:32'),
(6, 'auth', '0003_alter_user_email_max_length', '2022-02-28 06:39:32'),
(7, 'auth', '0004_alter_user_username_opts', '2022-02-28 06:39:32'),
(8, 'auth', '0005_alter_user_last_login_null', '2022-02-28 06:39:32'),
(9, 'auth', '0006_require_contenttypes_0002', '2022-02-28 06:39:32'),
(10, 'sessions', '0001_initial', '2022-02-28 06:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0wrur7b1enrozft06rfxp09iznsiqdto', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uqTu3:Nz3bVrUiinotiROAVedAXUJTgWJxnOSNJqKUkyoBbas', '2025-09-08 09:54:15'),
('0z8zf9cwcfgike3wyqkv1i04kvm469fe', 'eyJ1aWQiOjUsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uUJJd:VsA9qtM4SfEzA8YD6og6UTYpPvKs2L_9gDlivxg6brw', '2025-07-09 06:09:01'),
('19737jvecwgoyrmlewxk9hovvihfpadt', 'N2ZmOTA1OGQzOWI0ZWY5NzcwYmE1NWQ5ODJjZTVhMTBmNDhmNWU4NTp7InR5cGUiOiJ1c2VyIiwiaWQiOjR9', '2022-11-21 07:34:17'),
('1cdyumc2ik720wdm73v09wvd2a5sb17z', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4iLCJzdGF0dXMiOiIifQ:1unpF3:qvXlUwNg0pBgs3bzCSk-sUQoyhKbDR6syScrYYf_8BQ', '2025-09-01 02:04:57'),
('22rujpv7d3gr8wfv816rpt41c9qjedo9', 'eyJ1aWQiOjUsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1unIEw:R28M-yzxhHhROJvP3wnj1KqhQ6441Dz9sBctk3jnZZM', '2025-08-30 14:50:38'),
('28kotfuwgebuulldiu609ifo7rlfncmx', 'YWIyODYxYzExOWZkNDA2ODZiYWU2ODQ0ZWEyOTNlZmMxNjJkZWJiZTp7InR5cGUiOiJhZG1pbiIsImlkIjoxfQ==', '2022-11-20 20:05:59'),
('29if2eyu78fzjy6370bapwiuh98q7w7n', 'ZGI3ZjVkZmJiODBmZGFmYjJiZDhkYmE3NmNmNmE2ZjdiY2VkODU1ODp7InR5cGUiOiJ1c2VyIiwiaWQiOjF9', '2022-04-23 16:34:16'),
('2a514r8mk8kczn86rl3hfms9us92uym1', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4iLCJzdGF0dXMiOiIifQ:1ubXhP:TEFIRTJHue4LC1wj1zIxRIOSv86_NdmpRN6EmpcGWog', '2025-07-29 04:55:27'),
('2f8k8y5mghbdegb62vdfklzzsd0knyb5', 'eyJ1aWQiOjUsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uWDCe:FZhF_m3VuF1MD3IQyL6fLkFxBpbSLAQLfpd-o8XUT3Y', '2025-07-14 12:01:40'),
('2ga2x0lgeul3f3jmq7y3o8j42hf3k6zz', 'ZGI3ZjVkZmJiODBmZGFmYjJiZDhkYmE3NmNmNmE2ZjdiY2VkODU1ODp7InR5cGUiOiJ1c2VyIiwiaWQiOjF9', '2022-04-24 15:08:28'),
('2wc0erzevanl8fzd3wp8qjxg8c0rfhef', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1sUIYk:8wX26xqmMNaYefO7WJK5l1GLb_24JY0HlEMi90EXWao', '2024-08-01 04:16:02'),
('31d6us090m4g6rdxnfgk4de3m6e6i8oi', 'eyJ1aWQiOjMsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uSbp7:GLCB2YNGehp9bin0ktMxemOVZaeFTvnIfNYennPt32Y', '2025-07-04 13:30:29'),
('31vyi74mt1uldqag9h5ybg1wl6wemp27', 'NzM0MGNlNDEyMGMzODU0MzQzYjcxMWNlMTMzNmIwOTJkMWJjYmIxNDp7InR5cGUiOiJ1c2VyIiwiZW1haWwiOiJyZWV0aHVzaGFqaUBnbWFpbC5jb20iLCJpZCI6MX0=', '2022-04-23 05:42:43'),
('37c92qirmvmucrxkmho02vjn7prjcijd', 'eyJ1aWQiOjUsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uTPwi:cBIfrUmv2WKCubuV-T6UWrp94KCOKUY884fyymBayuo', '2025-07-06 19:01:40'),
('3bk6g8i7n5frreixa8u7viux3ai4c6he', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1qw1Dn:9LHJT54SBRVScgKuw4rt-yqkqfwQ0VxqaPE3myWr5YU', '2023-11-09 14:20:27'),
('3hk46av1ydwb91e5wncqfgceml7zk34t', 'eyJ1aWQiOjUsInV0eXBlIjoic3RhZmYiLCJzdGF0dXMiOiIifQ:1uTxMG:47NLjbkJdhk04tk3ULd6Y-cHJSlxVd-HhVqYpt01HO8', '2025-07-08 06:42:16'),
('3pht75cjfgmobm9ypjvvr7p7rvbm5wem', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4iLCJzdGF0dXMiOiIifQ:1uWFoQ:ydhUtgTNl81CcZjeTQssDNS67CfrivxVKX7P9ckcBUk', '2025-07-14 14:48:50'),
('4lprdnrhrzj3a73118o8pdhqwsapx64k', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4iLCJzdGF0dXMiOiIifQ:1uaFya:qOCnJy88g7QC-sGgNK1sCImB9Kl6FdHmkNMA5E-cOyw', '2025-07-25 15:47:52'),
('50xeiq65meam6e6y64q7acq2r91e5c28', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1ptsbt:6PJ0DECYWHLN0BzKFTM9hc8OYqaswDR4ePwqRAZE8Dg', '2023-05-16 16:12:13'),
('52tj0snwhevvxelj6upjvfqp2ds2o4i8', 'eyJ1aWQiOjQsInV0eXBlIjoibGFiIn0:1sbLyC:moSqHjkaqM-VKV9SP4Y5KNEf60d2kys7WQ-hRAxQ-eQ', '2024-08-20 15:19:28'),
('5kfszkc3x9yyuz658lc2x0yw9oqlwzwz', 'eyJ1aWQiOjIsInV0eXBlIjoibGFiIn0:1sfvif:V1nSa_VNtOx0vt_8ix03hwKO7rayC-9uId1AWiMj2Po', '2024-09-02 06:18:21'),
('5qdnwcthheu9lz8pwh2orxnk7knrf6aw', 'eyJ1aWQiOjExLCJ1dHlwZSI6InVzZXIifQ:1siozx:GS6Lcedf9d4TY9Z284ZC-g_PMszElQW3sLFGc6VWIRI', '2024-09-10 05:44:09'),
('63emwbn31nqkxu5rass6le9tar832up5', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1py7yC:6WUgfjx42iAORWpghkwhRjWxF3E7GRaDNyeyuI_nfFo', '2023-05-28 09:24:48'),
('6anmmxobmg4adcvk2w0cnihhiwt6wmp0', 'eyJ1aWQiOjgsInV0eXBlIjoidXNlciIsInN0YXR1cyI6ImFjdGl2ZSJ9:1uxrkO:s0pB1Ska0KWWkPTiQ3f93VUddkQ0uZjaMZLvh2ML4os', '2025-09-28 18:46:48'),
('6gpj9rgj0i5gc11lrphj79aaqdjwey5s', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uTdAZ:9_9xjXcT6p-LNMDi38kKK2plsxaHPpZnQh1x73zshy0', '2025-07-07 09:08:51'),
('6ufrpxfatkjwgfgwp1r4d47ta8qylgpd', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1puPOW:Dz_wywXugm_7XlGcefJkpY1977GnKBDvJm4LM4nGUfM', '2023-05-18 03:12:36'),
('6wwc60rrd8tug2alz8smi3lze3s4qxdp', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1sE18l:pXpvVu6T5Ct03nW1ypqc2awEto_-aKALYCj58X2n598', '2024-06-17 06:25:55'),
('783hk250hu3ab54hhosk84us2ljmhtw5', 'YWIyODYxYzExOWZkNDA2ODZiYWU2ODQ0ZWEyOTNlZmMxNjJkZWJiZTp7InR5cGUiOiJhZG1pbiIsImlkIjoxfQ==', '2022-10-23 16:33:39'),
('98584wtdwat4c2df326q6st6tpd9kfxd', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uVALY:9JLE3OAWkfxUU7Oy8R4G-TiMWzQXI7Tk58Sg-OX37dI', '2025-07-11 14:46:32'),
('9li1wwapeum9pwihstrojwikygao5arz', 'eyJ1aWQiOjIsInV0eXBlIjoidXNlciJ9:1reyjB:bQ9SiuHxoDmsMNXlxiNSVNyk9rAR3BmH2jhxkdGCArA', '2024-03-12 14:46:41'),
('9stcvahc0q61ala5q20558sshqby1m8i', 'Mjg2ZjFiZjJmZWJlMzhlNmZjOThlZWIzMmI3NDE3YjQyOGI2ZjU2YTp7InR5cGUiOiJidWlsZGVyIiwiZW1haWwiOjF9', '2022-03-30 14:45:03'),
('ag34wrgfpkwjeo0rhfat38r80o47mmgq', 'eyJ1aWQiOjEsInV0eXBlIjoic3RhZmYiLCJzdGF0dXMiOiIifQ:1uGbGc:tN1Pd57jXO40mkeNr-X5Ieh9xI3TkZDrVD5mRdnNeII', '2025-06-01 10:29:14'),
('aj6qgierbh17odjldn46tx3h8v98qm66', 'eyJ1aWQiOjUsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uTbyQ:dr1XlvFpeuiOFsDM6nn0Pqif57D17MjQrDto-3SkxRg', '2025-07-07 07:52:14'),
('apra6xqmei51txhvk8oxj2whxvq9g9ht', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uxrfd:sHVU1Uz9K2fMutf8W5HGbSsOHwsOWLkQ8nvw1g1JdRI', '2025-09-28 18:41:53'),
('b3067dzfqhqz0zhfr9h6gh8570okvf3b', 'eyJ1aWQiOjUsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uWyiK:uCEIbIk-exBhfHwAhMkrYBwp8fk_xGH1UtjnmQG-5zU', '2025-07-16 14:45:32'),
('bojisvxv28kkjma2l26bblzc5wxef4hk', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uq1zL:UdhNR7TvxCG-eGxJVVNyr5SS8eiDLGspKnX2SHuRVRM', '2025-09-07 04:05:51'),
('bonwvktn46jxxtnaewjivqtvcgtr7kc2', 'eyJ1aWQiOjUsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uVVl4:E6AjKi-CkGYwSaAgl3utXKkAfPP0d5Ix3VIziuSgwNE', '2025-07-12 13:38:18'),
('c629696y9dmdnkck7dca8w3dhg3t7prv', 'N2ZmOTA1OGQzOWI0ZWY5NzcwYmE1NWQ5ODJjZTVhMTBmNDhmNWU4NTp7InR5cGUiOiJ1c2VyIiwiaWQiOjR9', '2022-11-14 12:53:43'),
('ct4kneqqq5qx826b1voo9seze2ad4pzj', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4iLCJzdGF0dXMiOiIifQ:1uqe2j:4qMpxctlXnaUtJORatYvCz-AkUZPMH1iHV3v4oYv4co', '2025-09-08 20:43:53'),
('cybg5peltkxiq5atnsq6wvjx2qnbrvmo', 'eyJ1aWQiOjQsInV0eXBlIjoibGFiIn0:1sgciq:m3uKxEEoGUap72C73l2Bb5XUQYC42k8z80J3pn2iHI0', '2024-09-04 04:13:24'),
('ddk3asmpck0d1dq59k6cy9c677bkbv1y', 'eyJ1aWQiOjEsInV0eXBlIjoic3RhZmYiLCJzdGF0dXMiOiIifQ:1uiUgi:jJcPoijXXLTSBYEXlxrewOMV9bOBFe5oy0oz9WbmIeE', '2025-08-17 09:07:28'),
('des3cmerfxkh6glk2rgpvpwac7sco1df', 'eyJ1aWQiOjgsInV0eXBlIjoibGFiIn0:1suvQs:YFJW12kK7y8xCaNWT8FqtNo7LQT9ySiHRADOe93OmuE', '2024-10-13 15:01:58'),
('dfsybn3drv96ndvvreo7lrwfd5h4i4et', 'eyJ1aWQiOjIsInV0eXBlIjoic3RhZmYiLCJzdGF0dXMiOiIifQ:1uwdBE:KbuoB-ZWnGV-NG1QWyJPfUFoPPMxayHOOdp2crQCHZw', '2025-09-25 09:01:24'),
('diuyiaih5k1an3cn9na888879w5uxijn', 'eyJ1aWQiOjEyLCJ1dHlwZSI6InNob3AiLCJzdGF0dXMiOiJhcHByb3ZlZCJ9:1uxozL:51Zyw_WHYjR7HaSu5HpA5eYzG4ozbpKB3nby1SUrkEU', '2025-09-28 15:50:03'),
('duh6o6tco0vnuss6yw1w26cvp9t1xuqb', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1upCAd:EVmakneKMVm9H-kJqTN9gsHverV7vdYYekYy5LdivSA', '2025-09-04 20:46:03'),
('e8yi3rr1jjcystikjwyouamq6mgs1q0a', 'eyJ1aWQiOjQsInV0eXBlIjoibGFiIn0:1sfuLQ:Ps9-T_31O9JPWexvsH213RQGefOJMSVfJsPIKh0TzZU', '2024-09-02 04:50:16'),
('f25mujlalu8ng6qd8s1a4bktsygtj9kr', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uqMVJ:N-l9uuwIGethva8RWO11_iGQyiiPspqnPPdr-M2sFeI', '2025-09-08 02:00:13'),
('fbea568dob692rnnryno33i4e8osys00', 'eyJ1aWQiOjIsInV0eXBlIjoidXNlciJ9:1sOWdM:1QAs5zuqGV3IvFqa4l4ODjACpj0NTRMaik50ICKeaIw', '2024-07-16 06:04:56'),
('g2wsxfua4elkjkzrwlc3iub2l9zqd88j', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uENGI:daZ449jD82JEYiZjLuAkD_Z8p-d1KfP1iTCJmCf5YfI', '2025-05-26 07:07:42'),
('g8frbbo2wwwuif3x2maqmhlp9yytnnh9', 'eyJ1aWQiOjIzLCJ1dHlwZSI6InVzZXIifQ:1svAod:oaAu4uVYSuSQPy-zdROY0DcKHzZpyfXcKhchzF2RBOY', '2024-10-14 07:27:31'),
('gey6afjzb2uz6c4p6dnegh4ltgr20uxx', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uqCFk:P5XHDoY7Hyya4rqDHVNgavUpwrty3G1f92hWMl3lmXo', '2025-09-07 15:03:28'),
('gl3xr7ma0ra751br44v52yyvg01qoz4p', 'eyJ1aWQiOjUsInV0eXBlIjoibGFiIn0:1smcLB:fwObzXrdXGcehp-csywXBH7VaDmTxkM5pnm9bhcYWlA', '2024-09-20 17:01:45'),
('gqd8ln2cr43v4mlxn66i4h4vv2r3971d', 'eyJ1aWQiOjEsInV0eXBlIjoic3RhZmYiLCJzdGF0dXMiOiIifQ:1uqMLe:WnFGBZdh5tHS4NG_7fAibSdHgrefl6di4uaEAHe7RkE', '2025-09-08 01:50:14'),
('grjlrszn1gu722anwzvs4yegrwez22sh', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4ifQ:1sWUfF:rPyqbEIRMnYG0W6hOt-Y0Q5ROKLjyTeoa07n6CcqAMQ', '2024-08-07 05:35:49'),
('h4c8oqdou6mfvs5azfwy3nmjo8bn9xz7', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4iLCJzdGF0dXMiOiIifQ:1uwOp3:eg_mhFBjTI789kMl25pkUxubJbk-FU5z-j-1LiS3dNA', '2025-09-24 17:41:33'),
('j1s7gtn3warudpz5oyt3oz7bf9o29n35', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uTfxA:k-jVq_MAXKfVKPoWumeM3D-hanZuoRQd2x_dLCIaKas', '2025-07-07 12:07:12'),
('j2hwpcvzhihev21v9dodch9vzkl8zart', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4iLCJzdGF0dXMiOiIifQ:1umwzN:5FGpoWvyUGi0HkhaUCuF6CY2M9ZTH3PMENfHFY_FxvI', '2025-08-29 16:09:09'),
('j434shw3eussvfdeq8h5tn99gwt619v8', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1upqdm:yJ0Nk39KwLuVOp9_tKJLKR0BXnkfbvk6QJcwJKMIv7M', '2025-09-06 15:58:50'),
('j7aaiq8f1qvh4kxz4rdhz9ruhl6cehx3', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1rXbNs:1fEA5po6uuFqQg-N8xR8YwBdJlE3yia-cYg8yKt5_vw', '2024-02-21 06:26:12'),
('j8e2z72eh4g5b09z8pkr7m3kkomk0ox2', 'Nzk1MTdhMjk1MTVjMDc3YjI1MzQ3YzEyMTQ3ZTI1YzkwZjEzM2U5Zjp7InVpZCI6MSwidXR5cGUiOiJsYWIifQ==', '2023-10-28 07:21:24'),
('j8nwl56dcgxymi1vyn3r4i9l22eeedwu', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1upTE6:PMBqSpTBWrAcO9oPHuaRzKkcYSv11gToym_G4UJeyEQ', '2025-09-05 14:58:46'),
('k3os9iv9xzmkmv4wphm7grwbpe53i3t5', 'eyJ1aWQiOjgsInV0eXBlIjoidXNlciJ9:1sWDCZ:BoNInSAjssD3TUnbwkXZ2lwdvPZX9n1ZMkArMmtxnNw', '2024-08-06 10:57:03'),
('ki2gy5h10jb4titwgt93pdc2gvgtdash', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uVDNV:0r6AiMmegaQPEF7jmY5gqxn_Nv9sGXcV7b6lF9IKWnE', '2025-07-11 18:00:45'),
('kixcuakh7cx0rqv8a68axg5sly58jl25', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1ovXDS:o4rAr0tY62A4tKKJwl8HL4Y4besW9kdeUVP5WIdbYQs', '2022-12-01 05:13:34'),
('l8s1wcnr1437rxmiofr7lcrwd6r5thst', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4ifQ:1sGb4a:H4YgRFb1sDvy1mGlOTWM6H-FWh-QjXnSJWghCE9hzsE', '2024-06-24 09:12:16'),
('lze4vz9g95f5vmvzk09krw14258kejct', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1r6QAf:9vgOf1mHkpZpdYzUPorMEM2_wMjfLdmNkgmwESKzFKY', '2023-12-08 07:00:13'),
('m37izbnhny13xdy4v4s4psj5he69p742', 'eyJ1aWQiOjEyLCJ1dHlwZSI6InNob3AiLCJzdGF0dXMiOiJhcHByb3ZlZCJ9:1uV2cZ:EhVtCLxiqxmiR279PQm2F2g_mMR7KGUu9MMtpaH_H_U', '2025-07-11 06:31:35'),
('mp66meb3qvin2sgga49iv0cksk180hwf', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1seoZT:ShTrBOkpfzH5WKDJMKIxUjLF3gF4qjyxYSmEicyYtLc', '2024-08-30 04:28:15'),
('ms23xa6fu3vxt3i8dlg72nt3fp88cgn5', 'eyJ1aWQiOjUsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uxJPi:bNKzpzB87aby-AYnp0pUElPl_pkg9XUlD0mpXvoFcFw', '2025-09-27 06:07:10'),
('nv2mism6fp9qvbik9mq7xybry627e3m2', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uUSXk:lsD0wr_H6JztA_mxj3xnv8ZsVeh7oN1miKuV1zkb8I8', '2025-07-09 16:00:12'),
('nv3cdwbamkqfb0txeibpwt6r6qwx2ow4', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1r6PaC:dka5cGwFia5Xqgm4xhnph2pXzXaHAJG6Fo1bf5lyTlc', '2023-12-08 06:22:32'),
('opvkhjxigismy636xb4cz7y7586u7dwk', 'eyJ1aWQiOjIwLCJ1dHlwZSI6InVzZXIifQ:1sntdi:zEGA5VZeVeqS-jjfKZMZxt5RLnSGDyvBt8fX4sGOQE4', '2024-09-24 05:42:10'),
('pyhpk1pmylxqz1zuhnibo2jegxu8r1sz', 'eyJ1aWQiOjEyLCJ1dHlwZSI6InNob3AiLCJzdGF0dXMiOiJhcHByb3ZlZCJ9:1uV73M:u4mnlXfUtGc32DBhHVijKldFZwa5BqiO1FM7Hmfp3VU', '2025-07-11 11:15:32'),
('qd2x8mx0wtz9tri7urswig73ia5prjyz', 'eyJ1aWQiOjksInV0eXBlIjoidXNlciJ9:1sWaL8:zi9FAnIvec5mhyEftJDT6GCrOhxT_0MchnJmsr5qCuE', '2024-08-07 11:39:26'),
('qlwtn8a6cfsdb2ibatji4cg1qgtd70qj', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4iLCJzdGF0dXMiOiIifQ:1uGrws:ucOozq0WSjDohELLtfyVZCrzj9a9hXLjW9TqcMwJrGs', '2025-06-02 04:17:58'),
('qupq6i83w1qgqgwcl7kmx1stvnkrql78', 'N2ZmOTA1OGQzOWI0ZWY5NzcwYmE1NWQ5ODJjZTVhMTBmNDhmNWU4NTp7InR5cGUiOiJ1c2VyIiwiaWQiOjR9', '2022-11-21 06:51:04'),
('r5ovfppd1j9ug1u76c0vle8ejhnbcy68', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1sUKgM:Q5kJEW38WMVS4aUBdep7_wMo7TrvY3gIKxRadejdWKA', '2024-08-01 06:32:02'),
('rk113xdeway6zrqyij6d47tfbnmpg5s0', 'N2ZmOTA1OGQzOWI0ZWY5NzcwYmE1NWQ5ODJjZTVhMTBmNDhmNWU4NTp7InR5cGUiOiJ1c2VyIiwiaWQiOjR9', '2022-11-21 04:29:45'),
('ro518lzh5l7zjz9aof523egfgu3xif3z', 'eyJ1aWQiOjEsInV0eXBlIjoic3RhZmYiLCJzdGF0dXMiOiIifQ:1uWylw:0o0KJbjdjnWRR_9IzxeQnga-MaXzQ7Imu2PMSapCTCg', '2025-07-16 14:49:16'),
('ruda6ve46lm7trr9m2qty3vwygmms8sl', 'YWIyODYxYzExOWZkNDA2ODZiYWU2ODQ0ZWEyOTNlZmMxNjJkZWJiZTp7InR5cGUiOiJhZG1pbiIsImlkIjoxfQ==', '2022-11-21 07:47:30'),
('t9bllz992z02k8yxry9wyuswuvsrjp4p', 'eyJ1aWQiOjcsInV0eXBlIjoic3RhZmYiLCJzdGF0dXMiOiIifQ:1uUovX:ChG_7R_3lvYYvuI5-2OaplIrkwSP0IbQDwB6keYPeAg', '2025-07-10 15:54:15'),
('tg6u7diek9otbjr0kbi4ha6a12ic1rms', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1sKC7r:SVcOG6cxdUH0vnUkm7iXGxwVzYwJ4Q_hWI4yA9slV7I', '2024-07-04 07:22:31'),
('ti8z59wjpzcguh6a7up2k0lra2ro8alc', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1rra8K:yYko-CAGY32vnx_hF4UpmQLsWkw69Qj-CfvKrePktwY', '2024-04-16 09:08:44'),
('tjitunyndra4xg33ip539pxpyd45saak', 'Nzk1MTdhMjk1MTVjMDc3YjI1MzQ3YzEyMTQ3ZTI1YzkwZjEzM2U5Zjp7InVpZCI6MSwidXR5cGUiOiJsYWIifQ==', '2023-10-30 03:57:32'),
('tmg9w03cktgzg5d4eon73vde8z082t34', 'eyJ1aWQiOjEsInV0eXBlIjoic3RhZmYiLCJzdGF0dXMiOiIifQ:1uURDI:ValrCtaYwdjP8mqDZKF3KZZBmLik61scfi2ySxQcWMQ', '2025-07-09 14:35:00'),
('tsb6j558e9s0eqevexvt659glitvvsug', 'eyJ1aWQiOjgsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uTwZV:1DCksn3iwOzDlvIkcwaghBL4WLWk4A0kQ5mcZCPK0ig', '2025-07-08 05:51:53'),
('u9cd1qu0hexy7gdf7ccv5svz6ocd4rcy', 'eyJ1aWQiOjEwLCJ1dHlwZSI6InVzZXIiLCJzdGF0dXMiOiIifQ:1uwb6B:iXWF3fg6fKDWyuoIupfqmYV6iCZWkB1aCM-8osQnEqw', '2025-09-25 06:48:03'),
('ucnkue7931glzf72k5gxvfuyhjpn1e35', 'eyJ1aWQiOjUsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uWHPA:r997cr08SAubsOBskeUvqQI-eHJuhBtOcGzi4oZj3G4', '2025-07-14 16:30:52'),
('uug92q6n1wbi1f98swva1ddmzw0n2he4', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1r5kwk:5vQX2aVYsiQPgw0vn7yBQCix91l8rgAv9_6EYY5KDwA', '2023-12-06 10:59:06'),
('v4w20nx4rla7cbyby6tg4br5gpmttxk5', 'eyJ1aWQiOjUsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uqMFo:oZO_u7_vBPGKzyChvDHSwbLRPYKagP4FSLQyv1opITo', '2025-09-08 01:44:12'),
('vbp155s6eh2fqotq2eaa5ugw4sd8chjm', 'eyJ1aWQiOjUsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uOWgo:emjHPinXUgXi4hkCvOXLaxDkszDMd8SJ1x7vwAFuZ-8', '2025-06-23 07:13:02'),
('vomhjmwslbf8opjpf7m217f0okmakux9', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1r6REG:I8F_BZ9aIwDacjhQ_-gP85fxg3fYY61vlbrk5es8Gy4', '2023-12-08 08:08:00'),
('vqllqcw86680ar2z55fps19sgr8ytmyq', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1sbAmS:NfkTOi35dZqOewwozUyAbo4R-scnYoGT1LFNz7AeP9U', '2024-08-20 03:22:36'),
('wfmszz9pidle9htjx7u6dywphlan8h0t', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4ifQ:1puQGy:cszh9adoFPOnEjnboayMEephhxzRjFYl4r8cAhD7BJ4', '2023-05-18 04:08:52'),
('xaqvbhh0qt4fwsmgrpo2vgd42bmi4aig', 'eyJ1aWQiOjgsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uxIqg:V4QRvCFvbCuOVU0bZGxQFzjPCgn_qSI2do_VB4npw5k', '2025-09-27 05:30:58'),
('xjisk0uhsqnljhdpdcf8mp7iozx244jv', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4iLCJzdGF0dXMiOiIifQ:1uMTN6:Rybd1D9zUtdCyccrY2S3GL4iv1jA50IrbD2w__i22bU', '2025-06-17 15:16:12'),
('ydxjxmmd5jq3xezkslgmzdj3ts1shya7', 'eyJ1aWQiOjEsInV0eXBlIjoic3RhZmYiLCJzdGF0dXMiOiIifQ:1uW3dC:zRbveI1mm4FuLX8LesLxX7Ie-NSzaJ4ymy161jWMykA', '2025-07-14 01:48:26'),
('yribf6himncjnhybdxw05ea8hunxqyga', 'eyJ1aWQiOjIsInV0eXBlIjoibGFiIn0:1sRP5G:iXXtIlZdThgJbya2N8tUP80b3zrTMLebdc1_vMn98h8', '2024-07-24 04:37:38'),
('yxoih4yhc800306qpmhsfufiwd13p7ol', 'eyJ1aWQiOjcsInV0eXBlIjoic3RhZmYiLCJzdGF0dXMiOiIifQ:1uxozu:HpbvBpx8kg2IUOtOnjp7CFxHAel2ZwZFYEfpo7oijnk', '2025-09-28 15:50:38'),
('zncj4alnj7ulrpdn1l8667ahnjuugsyo', 'YWIyODYxYzExOWZkNDA2ODZiYWU2ODQ0ZWEyOTNlZmMxNjJkZWJiZTp7InR5cGUiOiJhZG1pbiIsImlkIjoxfQ==', '2022-11-10 09:22:47'),
('zve8povwocm8qignlfm4ln3geuppv1nv', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uTPdO:vgeE_GsKfwoTnKdxqVLinko9f36ZIBbCqjgC2CoBA_M', '2025-07-06 18:41:42');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(200) NOT NULL,
  `date` varchar(10) NOT NULL,
  `time` varchar(8) NOT NULL,
  `uid` varchar(10) NOT NULL,
  `utype` varchar(10) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fid`, `feedback`, `date`, `time`, `uid`, `utype`) VALUES
(1, 'hi this is feedback from shop7', '2025-06-08', '19:59:02', '7', 'shop'),
(2, 'this is a feedback from user 5', '2025-06-08', '20:24:31', '5', 'user'),
(3, 'this is shop 10\r\n', '2025-07-03', '20:46:31', '12', 'shop'),
(4, 'this is a feedback from the staff 1.\r\ni have a request, my salary is not good enough for running through a day. please said the shop owner to increase my salary', '2025-08-15', '20:37:20', '1', 'staff'),
(5, 'this is another request about the salry', '2025-08-16', '19:50:46', '1', 'staff'),
(6, 'i have a complent about the shop 7. \r\nthey are not giveing us the refund.', '2025-09-10', '23:11:08', '8', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(35) NOT NULL,
  `upass` varchar(15) NOT NULL,
  `utype` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`lid`, `uid`, `uname`, `upass`, `utype`, `status`) VALUES
(1, 0, 'admin@gmail.com', 'admin', 'admin', ''),
(12, 5, 'user@5', '123', 'user', 'active'),
(13, 7, 'shop@7', '123', 'shop', 'approved'),
(14, 8, 'shop@8', '123', 'shop', 'approved'),
(16, 2, 'staff@2', '123', 'staff', ''),
(17, 3, 'staff@4', '123', 'staff', ''),
(19, 5, 'staff@5', '123', 'staff', ''),
(23, 12, 'shop@10', '123', 'shop', 'approved'),
(27, 6, 'aa@gmail.com', 'aaa', 'user', 'active'),
(29, 7, 'user@11', '123', 'user', 'active'),
(30, 14, 'shop@12', '123', 'shop', 'approved'),
(31, 15, 'shop@22', '123', 'shop', 'rejected'),
(32, 9, 'staffone@gmail.com', '123', 'staff', ''),
(33, 8, 'anzilshibu5@gmail.com', 'anzil123', 'user', 'active'),
(34, 9, 'noora@gmail.com', 'A1_noora', 'user', 'active'),
(35, 16, 'shop@gmail.com', 'S100_password', 'shop', 'approved'),
(36, 9, 'staffone@gmail.com', 'Staff_one123', 'staff', ''),
(37, 10, 'a7907j@gmail.com', 'Pass@123', 'user', 'active'),
(38, 17, 'shop11@gmail.com', 'Sshop1111', 'shop', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `reason`
--

CREATE TABLE IF NOT EXISTS `reason` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `oid` varchar(11) NOT NULL,
  `reason` varchar(150) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `reason`
--

INSERT INTO `reason` (`rid`, `oid`, `reason`) VALUES
(1, '33', 'we do not have time'),
(2, '34', 'reject'),
(3, '35', 'new reject');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `srid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(50) NOT NULL,
  `amt` varchar(7) NOT NULL,
  `descr` varchar(200) NOT NULL,
  `shid` varchar(7) NOT NULL,
  PRIMARY KEY (`srid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`srid`, `sname`, `amt`, `descr`, `shid`) VALUES
(3, 'washing', '300', 'this is washing', '8'),
(4, 'cleaning', '201', 'this is description', '7'),
(5, 'iorning', '120', 'our iorning is grate ', '7'),
(7, 'iorning ', '199', 'our iorning is the best in the whole world', '12'),
(13, 'stitching', '201', 'this is a good service .so im writing this for that ,i can chek wether it is a good thing that i  can check wether i can test . ohh this is amazing', '7'),
(14, 'polishing', '500', 'for fresh look', '7');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `shid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `address` varchar(150) NOT NULL,
  `place` varchar(50) NOT NULL,
  `district` varchar(35) NOT NULL,
  `phn` varchar(13) NOT NULL,
  `email` varchar(40) NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`shid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`shid`, `name`, `address`, `place`, `district`, `phn`, `email`, `status`) VALUES
(7, 'shop7', 'address 7', 'asd', 'thiruvananthapuram', '0987654322', 'shop@7', 'approved'),
(8, 'shop8', 'asdf', 'asd', 'thrissur', '0987654322', 'shop@8', 'approved'),
(12, 'shop 10', 'this is a address of the shop 10. im making this too lengthy so that i can test this address.  and it looks like i need to again add somthing.', 'kollam', 'thiruvananthapuram', '7091827364', 'shop@10', 'approved'),
(14, 'shop@12', 'this is the address of the shop 12', 'this is the place of the shop 12', 'kollam', '1234567899', 'shop@12', 'approved'),
(15, 'shop@22', 'this is address of shop 22', 'this is place of staff 22', 'kottayam', '1234567899', 'shop@22', 'rejected'),
(16, 'shop 100', 'address of the shop 100,\r\nkottarakara,\r\nkollam,\r\nkerala,\r\nindia\r\n', 'this is place of staff', 'kollam', '9889787671', 'shop@gmail.com', 'approved'),
(17, 'shop11', 'aaaaa', 'idukki', 'idukki', '9845762390', 'shop11@gmail.com', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `stid` int(11) NOT NULL AUTO_INCREMENT,
  `shid` int(11) NOT NULL,
  `name` varchar(35) NOT NULL,
  `address` varchar(150) NOT NULL,
  `street` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `district` varchar(25) NOT NULL,
  `phn` varchar(13) NOT NULL,
  `pin` varchar(6) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  PRIMARY KEY (`stid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`stid`, `shid`, `name`, `address`, `street`, `city`, `district`, `phn`, `pin`, `dob`, `email`) VALUES
(2, 7, 'staff 2', 'this is address of staff 2', 'street of staff 2', 'city of staff 2', 'pathanamthitta', '5646464640', '345677', '2025-04-10', 'staff@2'),
(5, 8, 'staff 5', 'asd', 'kjhkljhkljh', ',kjlkljh', 'kottayam', '9876543333', '987654', '2025-05-08', 'staff@5'),
(9, 16, 'staff one', 'address of staff,\r\nkerala,\r\nindia', 'stree of staff one', 'city of staff one', 'thiruvananthapuram', '5646464641', '345671', '2025-09-11', 'staffone@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE IF NOT EXISTS `tracker` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `oid` varchar(15) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` varchar(10) NOT NULL,
  `time` varchar(8) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `tracker`
--

INSERT INTO `tracker` (`tid`, `oid`, `status`, `date`, `time`) VALUES
(1, '1', 'booked', '2025-06-27', '20:26:13'),
(2, '2', 'booked', '2025-06-27', '20:27:06'),
(3, '3', 'booked', '2025-06-27', '20:45:18'),
(4, '3', 'Materials Collected', '2025-06-27', '20:46:02'),
(5, '4', 'booked', '2025-06-27', '20:46:37'),
(6, '5', 'booked', '2025-06-27', '21:00:28'),
(7, '6', 'booked', '2025-06-27', '22:08:08'),
(8, '7', 'booked', '2025-06-28', '10:22:03'),
(9, '8', 'booked', '2025-06-28', '10:23:15'),
(10, '9', 'booked', '2025-06-28', '10:29:25'),
(11, '10', 'booked', '2025-06-28', '10:56:24'),
(12, '11', 'booked', '2025-06-28', '10:57:04'),
(13, '12', 'booked', '2025-06-28', '19:03:29'),
(14, '12', 'Materials Reached Shop', '2025-06-28', '19:05:51'),
(15, '12', 'Materials have been picked up', '2025-06-28', '19:07:24'),
(16, '12', 'the cloth is washing and drying', '2025-06-28', '19:07:47'),
(17, '13', 'booked', '2025-06-29', '22:54:47'),
(18, '14', 'booked', '2025-06-30', '01:15:07'),
(19, '8', 'Materials Collected', '2025-06-30', '01:53:27'),
(20, '8', 'Choose status update', '2025-06-30', '02:10:53'),
(21, '8', 'Choose status update', '2025-06-30', '02:11:21'),
(22, '8', 'Choose status update', '2025-06-30', '07:22:33'),
(23, '15', 'booked', '2025-06-30', '13:22:58'),
(24, '16', 'booked', '2025-06-30', '13:23:27'),
(25, '17', 'booked', '2025-07-01', '20:55:00'),
(26, '18', 'booked', '2025-07-01', '21:13:24'),
(27, '19', 'booked', '2025-07-02', '20:15:50'),
(28, '20', 'booked', '2025-07-02', '20:17:03'),
(29, '21', 'booked', '2025-07-02', '20:18:03'),
(30, '22', 'booked', '2025-07-02', '20:49:49'),
(31, '23', 'booked', '2025-07-15', '10:19:12'),
(32, '24', 'booked', '2025-08-15', '20:53:18'),
(33, '25', 'booked', '2025-08-25', '14:48:40'),
(34, '26', 'booked', '2025-08-25', '14:53:03'),
(35, '26', 'Materials Reached Shop', '2025-08-25', '15:02:28'),
(36, '26', 'Materials Collected', '2025-08-25', '15:18:47'),
(37, '26', 'Materials are ready for pickup', '2025-08-25', '15:18:58'),
(38, '26', 'payment is done', '2025-08-25', '15:19:17'),
(39, '27', 'booked', '2025-09-11', '13:43:22'),
(40, '28', 'booked', '2025-09-14', '21:27:34'),
(41, '28', 'Materials Collected', '2025-09-14', '21:29:40'),
(42, '28', 'all completed', '2025-09-14', '21:32:31'),
(43, '29', 'booked', '2025-09-15', '00:17:04'),
(44, '30', 'booked', '2025-09-15', '00:22:49'),
(45, '31', 'booked', '2025-09-15', '00:26:19'),
(46, '32', 'booked', '2025-09-15', '00:39:00'),
(47, '33', 'booked', '2025-09-15', '01:12:07'),
(48, '34', 'booked', '2025-09-15', '01:14:19'),
(49, '35', 'booked', '2025-09-15', '01:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `tsid` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(10) NOT NULL,
  `time` varchar(8) NOT NULL,
  `oid` varchar(15) NOT NULL,
  `amount` varchar(7) NOT NULL,
  `shid` varchar(10) NOT NULL,
  PRIMARY KEY (`tsid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`tsid`, `date`, `time`, `oid`, `amount`, `shid`) VALUES
(1, '2025-08-21', '23:52:46', '24', '201', '7'),
(2, '2025-08-21', '23:59:40', '22', '201', '7'),
(3, '2025-08-22', '00:07:28', '20', '120', '7'),
(4, '2025-08-22', '01:58:54', '22', '201', '7'),
(5, '2025-08-22', '02:13:41', '10', '201', '7'),
(6, '2025-08-22', '19:52:45', '5', '120', '7'),
(7, '2025-08-22', '20:00:02', '9', '120', '7'),
(8, '2025-08-22', '20:09:51', '23', '120', '7'),
(9, '2025-08-23', '19:59:52', '21', '120', '7'),
(10, '2025-08-23', '20:00:50', '19', '120', '7'),
(11, '2025-08-23', '20:17:18', '17', '120', '7'),
(12, '2025-08-25', '14:55:19', '26', '500', '7');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `address` varchar(150) NOT NULL,
  `district` varchar(25) NOT NULL,
  `phn` varchar(13) NOT NULL,
  `email` varchar(40) NOT NULL,
  `place` varchar(50) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `address`, `district`, `phn`, `email`, `place`) VALUES
(3, 'asdfg', 'asd', 'kozhikode', '1234545698', 'a2@123', 'sdfghj'),
(5, 'user 5', 'this is my address', 'kollam', '1234545698', 'user@5', 'sdfghj'),
(6, 'Achu', 'fghjk', 'kollam', '4444444444', 'aa@gmail.com', 'sss'),
(7, 'user@11', 'this is address of the user 11', 'palakkad', '9999999999', 'user@11', 'this is the place of the user@11'),
(8, 'Anzil S', 'anzil manzil,\r\nchelikuzhy po,\r\npattazhy,\r\nkollam,\r\nkerala\r\nindia', 'kollam', '9188663441', 'anzilshibu5@gmail.com', 'pattazhy'),
(9, 'noora ', 'noora', 'kollam', '9876543211', 'noora@gmail.com', 'pattazhy'),
(10, 'Amaljith A', 'address one', 'kollam', '7907070278', 'a7907j@gmail.com', 'pattazhy');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin_log_ibfk_2` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);
