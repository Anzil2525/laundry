-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 21, 2025 at 06:57 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `assign`
--

INSERT INTO `assign` (`asnid`, `oid`, `stid`, `date`, `time`, `code`) VALUES
(1, '3', '1', '2025-06-21', '23:28:31', '7511'),
(2, '4', '2', '2025-06-21', '23:29:42', '2133'),
(3, '4', '1', '2025-06-21', '23:30:05', '3440'),
(4, '4', '1', '2025-06-22', '00:13:45', '7936'),
(5, '4', '2', '2025-06-22', '00:14:11', '9384');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`oid`, `srid`, `uid`, `date`, `time`, `status`) VALUES
(1, '0', '0', '1/3/2005', '12:00', 'booking'),
(2, '4', '5', '2025-06-19', '12:52:42', 'booked'),
(3, '4', '5', '2025-06-19', '12:55:32', 'assigned'),
(4, '5', '5', '2025-06-19', '12:57:58', 'assigned'),
(5, '3', '5', '2025-06-19', '12:58:54', 'booked'),
(6, '3', '5', '2025-06-19', '12:59:34', 'booked'),
(7, '3', '5', '2025-06-19', '12:59:49', 'booked'),
(8, '3', '2', '2025-06-19', '18:24:46', 'booked'),
(9, '6', '5', '2025-06-19', '18:54:39', 'booked'),
(10, '7', '5', '2025-06-20', '18:42:02', 'booked'),
(11, '8', '3', '2025-06-20', '19:01:31', 'booked');

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
('19737jvecwgoyrmlewxk9hovvihfpadt', 'N2ZmOTA1OGQzOWI0ZWY5NzcwYmE1NWQ5ODJjZTVhMTBmNDhmNWU4NTp7InR5cGUiOiJ1c2VyIiwiaWQiOjR9', '2022-11-21 07:34:17'),
('28kotfuwgebuulldiu609ifo7rlfncmx', 'YWIyODYxYzExOWZkNDA2ODZiYWU2ODQ0ZWEyOTNlZmMxNjJkZWJiZTp7InR5cGUiOiJhZG1pbiIsImlkIjoxfQ==', '2022-11-20 20:05:59'),
('29if2eyu78fzjy6370bapwiuh98q7w7n', 'ZGI3ZjVkZmJiODBmZGFmYjJiZDhkYmE3NmNmNmE2ZjdiY2VkODU1ODp7InR5cGUiOiJ1c2VyIiwiaWQiOjF9', '2022-04-23 16:34:16'),
('2ga2x0lgeul3f3jmq7y3o8j42hf3k6zz', 'ZGI3ZjVkZmJiODBmZGFmYjJiZDhkYmE3NmNmNmE2ZjdiY2VkODU1ODp7InR5cGUiOiJ1c2VyIiwiaWQiOjF9', '2022-04-24 15:08:28'),
('2wc0erzevanl8fzd3wp8qjxg8c0rfhef', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1sUIYk:8wX26xqmMNaYefO7WJK5l1GLb_24JY0HlEMi90EXWao', '2024-08-01 04:16:02'),
('31d6us090m4g6rdxnfgk4de3m6e6i8oi', 'eyJ1aWQiOjMsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uSbp7:GLCB2YNGehp9bin0ktMxemOVZaeFTvnIfNYennPt32Y', '2025-07-04 13:30:29'),
('31vyi74mt1uldqag9h5ybg1wl6wemp27', 'NzM0MGNlNDEyMGMzODU0MzQzYjcxMWNlMTMzNmIwOTJkMWJjYmIxNDp7InR5cGUiOiJ1c2VyIiwiZW1haWwiOiJyZWV0aHVzaGFqaUBnbWFpbC5jb20iLCJpZCI6MX0=', '2022-04-23 05:42:43'),
('3bk6g8i7n5frreixa8u7viux3ai4c6he', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1qw1Dn:9LHJT54SBRVScgKuw4rt-yqkqfwQ0VxqaPE3myWr5YU', '2023-11-09 14:20:27'),
('50xeiq65meam6e6y64q7acq2r91e5c28', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1ptsbt:6PJ0DECYWHLN0BzKFTM9hc8OYqaswDR4ePwqRAZE8Dg', '2023-05-16 16:12:13'),
('52tj0snwhevvxelj6upjvfqp2ds2o4i8', 'eyJ1aWQiOjQsInV0eXBlIjoibGFiIn0:1sbLyC:moSqHjkaqM-VKV9SP4Y5KNEf60d2kys7WQ-hRAxQ-eQ', '2024-08-20 15:19:28'),
('5kfszkc3x9yyuz658lc2x0yw9oqlwzwz', 'eyJ1aWQiOjIsInV0eXBlIjoibGFiIn0:1sfvif:V1nSa_VNtOx0vt_8ix03hwKO7rayC-9uId1AWiMj2Po', '2024-09-02 06:18:21'),
('5qdnwcthheu9lz8pwh2orxnk7knrf6aw', 'eyJ1aWQiOjExLCJ1dHlwZSI6InVzZXIifQ:1siozx:GS6Lcedf9d4TY9Z284ZC-g_PMszElQW3sLFGc6VWIRI', '2024-09-10 05:44:09'),
('63emwbn31nqkxu5rass6le9tar832up5', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1py7yC:6WUgfjx42iAORWpghkwhRjWxF3E7GRaDNyeyuI_nfFo', '2023-05-28 09:24:48'),
('6ufrpxfatkjwgfgwp1r4d47ta8qylgpd', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1puPOW:Dz_wywXugm_7XlGcefJkpY1977GnKBDvJm4LM4nGUfM', '2023-05-18 03:12:36'),
('6wwc60rrd8tug2alz8smi3lze3s4qxdp', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1sE18l:pXpvVu6T5Ct03nW1ypqc2awEto_-aKALYCj58X2n598', '2024-06-17 06:25:55'),
('783hk250hu3ab54hhosk84us2ljmhtw5', 'YWIyODYxYzExOWZkNDA2ODZiYWU2ODQ0ZWEyOTNlZmMxNjJkZWJiZTp7InR5cGUiOiJhZG1pbiIsImlkIjoxfQ==', '2022-10-23 16:33:39'),
('9li1wwapeum9pwihstrojwikygao5arz', 'eyJ1aWQiOjIsInV0eXBlIjoidXNlciJ9:1reyjB:bQ9SiuHxoDmsMNXlxiNSVNyk9rAR3BmH2jhxkdGCArA', '2024-03-12 14:46:41'),
('9stcvahc0q61ala5q20558sshqby1m8i', 'Mjg2ZjFiZjJmZWJlMzhlNmZjOThlZWIzMmI3NDE3YjQyOGI2ZjU2YTp7InR5cGUiOiJidWlsZGVyIiwiZW1haWwiOjF9', '2022-03-30 14:45:03'),
('ag34wrgfpkwjeo0rhfat38r80o47mmgq', 'eyJ1aWQiOjEsInV0eXBlIjoic3RhZmYiLCJzdGF0dXMiOiIifQ:1uGbGc:tN1Pd57jXO40mkeNr-X5Ieh9xI3TkZDrVD5mRdnNeII', '2025-06-01 10:29:14'),
('c629696y9dmdnkck7dca8w3dhg3t7prv', 'N2ZmOTA1OGQzOWI0ZWY5NzcwYmE1NWQ5ODJjZTVhMTBmNDhmNWU4NTp7InR5cGUiOiJ1c2VyIiwiaWQiOjR9', '2022-11-14 12:53:43'),
('cybg5peltkxiq5atnsq6wvjx2qnbrvmo', 'eyJ1aWQiOjQsInV0eXBlIjoibGFiIn0:1sgciq:m3uKxEEoGUap72C73l2Bb5XUQYC42k8z80J3pn2iHI0', '2024-09-04 04:13:24'),
('des3cmerfxkh6glk2rgpvpwac7sco1df', 'eyJ1aWQiOjgsInV0eXBlIjoibGFiIn0:1suvQs:YFJW12kK7y8xCaNWT8FqtNo7LQT9ySiHRADOe93OmuE', '2024-10-13 15:01:58'),
('e8yi3rr1jjcystikjwyouamq6mgs1q0a', 'eyJ1aWQiOjQsInV0eXBlIjoibGFiIn0:1sfuLQ:Ps9-T_31O9JPWexvsH213RQGefOJMSVfJsPIKh0TzZU', '2024-09-02 04:50:16'),
('fbea568dob692rnnryno33i4e8osys00', 'eyJ1aWQiOjIsInV0eXBlIjoidXNlciJ9:1sOWdM:1QAs5zuqGV3IvFqa4l4ODjACpj0NTRMaik50ICKeaIw', '2024-07-16 06:04:56'),
('g2wsxfua4elkjkzrwlc3iub2l9zqd88j', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uENGI:daZ449jD82JEYiZjLuAkD_Z8p-d1KfP1iTCJmCf5YfI', '2025-05-26 07:07:42'),
('g8frbbo2wwwuif3x2maqmhlp9yytnnh9', 'eyJ1aWQiOjIzLCJ1dHlwZSI6InVzZXIifQ:1svAod:oaAu4uVYSuSQPy-zdROY0DcKHzZpyfXcKhchzF2RBOY', '2024-10-14 07:27:31'),
('gl3xr7ma0ra751br44v52yyvg01qoz4p', 'eyJ1aWQiOjUsInV0eXBlIjoibGFiIn0:1smcLB:fwObzXrdXGcehp-csywXBH7VaDmTxkM5pnm9bhcYWlA', '2024-09-20 17:01:45'),
('grjlrszn1gu722anwzvs4yegrwez22sh', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4ifQ:1sWUfF:rPyqbEIRMnYG0W6hOt-Y0Q5ROKLjyTeoa07n6CcqAMQ', '2024-08-07 05:35:49'),
('j1s7gtn3warudpz5oyt3oz7bf9o29n35', 'eyJ1aWQiOjcsInV0eXBlIjoic2hvcCIsInN0YXR1cyI6ImFwcHJvdmVkIn0:1uT1tF:ykS8Rl6uxDZflNWL7tfvHrnMy-h9LCNOOewVENOIv0M', '2025-07-05 17:20:29'),
('j7aaiq8f1qvh4kxz4rdhz9ruhl6cehx3', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1rXbNs:1fEA5po6uuFqQg-N8xR8YwBdJlE3yia-cYg8yKt5_vw', '2024-02-21 06:26:12'),
('j8e2z72eh4g5b09z8pkr7m3kkomk0ox2', 'Nzk1MTdhMjk1MTVjMDc3YjI1MzQ3YzEyMTQ3ZTI1YzkwZjEzM2U5Zjp7InVpZCI6MSwidXR5cGUiOiJsYWIifQ==', '2023-10-28 07:21:24'),
('k3os9iv9xzmkmv4wphm7grwbpe53i3t5', 'eyJ1aWQiOjgsInV0eXBlIjoidXNlciJ9:1sWDCZ:BoNInSAjssD3TUnbwkXZ2lwdvPZX9n1ZMkArMmtxnNw', '2024-08-06 10:57:03'),
('kixcuakh7cx0rqv8a68axg5sly58jl25', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1ovXDS:o4rAr0tY62A4tKKJwl8HL4Y4besW9kdeUVP5WIdbYQs', '2022-12-01 05:13:34'),
('l8s1wcnr1437rxmiofr7lcrwd6r5thst', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4ifQ:1sGb4a:H4YgRFb1sDvy1mGlOTWM6H-FWh-QjXnSJWghCE9hzsE', '2024-06-24 09:12:16'),
('lze4vz9g95f5vmvzk09krw14258kejct', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1r6QAf:9vgOf1mHkpZpdYzUPorMEM2_wMjfLdmNkgmwESKzFKY', '2023-12-08 07:00:13'),
('mp66meb3qvin2sgga49iv0cksk180hwf', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1seoZT:ShTrBOkpfzH5WKDJMKIxUjLF3gF4qjyxYSmEicyYtLc', '2024-08-30 04:28:15'),
('nv3cdwbamkqfb0txeibpwt6r6qwx2ow4', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1r6PaC:dka5cGwFia5Xqgm4xhnph2pXzXaHAJG6Fo1bf5lyTlc', '2023-12-08 06:22:32'),
('opvkhjxigismy636xb4cz7y7586u7dwk', 'eyJ1aWQiOjIwLCJ1dHlwZSI6InVzZXIifQ:1sntdi:zEGA5VZeVeqS-jjfKZMZxt5RLnSGDyvBt8fX4sGOQE4', '2024-09-24 05:42:10'),
('qd2x8mx0wtz9tri7urswig73ia5prjyz', 'eyJ1aWQiOjksInV0eXBlIjoidXNlciJ9:1sWaL8:zi9FAnIvec5mhyEftJDT6GCrOhxT_0MchnJmsr5qCuE', '2024-08-07 11:39:26'),
('qlwtn8a6cfsdb2ibatji4cg1qgtd70qj', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4iLCJzdGF0dXMiOiIifQ:1uGrws:ucOozq0WSjDohELLtfyVZCrzj9a9hXLjW9TqcMwJrGs', '2025-06-02 04:17:58'),
('qupq6i83w1qgqgwcl7kmx1stvnkrql78', 'N2ZmOTA1OGQzOWI0ZWY5NzcwYmE1NWQ5ODJjZTVhMTBmNDhmNWU4NTp7InR5cGUiOiJ1c2VyIiwiaWQiOjR9', '2022-11-21 06:51:04'),
('r5ovfppd1j9ug1u76c0vle8ejhnbcy68', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1sUKgM:Q5kJEW38WMVS4aUBdep7_wMo7TrvY3gIKxRadejdWKA', '2024-08-01 06:32:02'),
('rk113xdeway6zrqyij6d47tfbnmpg5s0', 'N2ZmOTA1OGQzOWI0ZWY5NzcwYmE1NWQ5ODJjZTVhMTBmNDhmNWU4NTp7InR5cGUiOiJ1c2VyIiwiaWQiOjR9', '2022-11-21 04:29:45'),
('ruda6ve46lm7trr9m2qty3vwygmms8sl', 'YWIyODYxYzExOWZkNDA2ODZiYWU2ODQ0ZWEyOTNlZmMxNjJkZWJiZTp7InR5cGUiOiJhZG1pbiIsImlkIjoxfQ==', '2022-11-21 07:47:30'),
('tg6u7diek9otbjr0kbi4ha6a12ic1rms', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1sKC7r:SVcOG6cxdUH0vnUkm7iXGxwVzYwJ4Q_hWI4yA9slV7I', '2024-07-04 07:22:31'),
('ti8z59wjpzcguh6a7up2k0lra2ro8alc', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1rra8K:yYko-CAGY32vnx_hF4UpmQLsWkw69Qj-CfvKrePktwY', '2024-04-16 09:08:44'),
('tjitunyndra4xg33ip539pxpyd45saak', 'Nzk1MTdhMjk1MTVjMDc3YjI1MzQ3YzEyMTQ3ZTI1YzkwZjEzM2U5Zjp7InVpZCI6MSwidXR5cGUiOiJsYWIifQ==', '2023-10-30 03:57:32'),
('uug92q6n1wbi1f98swva1ddmzw0n2he4', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1r5kwk:5vQX2aVYsiQPgw0vn7yBQCix91l8rgAv9_6EYY5KDwA', '2023-12-06 10:59:06'),
('vbp155s6eh2fqotq2eaa5ugw4sd8chjm', 'eyJ1aWQiOjUsInV0eXBlIjoidXNlciIsInN0YXR1cyI6IiJ9:1uOWgo:emjHPinXUgXi4hkCvOXLaxDkszDMd8SJ1x7vwAFuZ-8', '2025-06-23 07:13:02'),
('vomhjmwslbf8opjpf7m217f0okmakux9', 'eyJ1aWQiOjEsInV0eXBlIjoibGFiIn0:1r6REG:I8F_BZ9aIwDacjhQ_-gP85fxg3fYY61vlbrk5es8Gy4', '2023-12-08 08:08:00'),
('vqllqcw86680ar2z55fps19sgr8ytmyq', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1sbAmS:NfkTOi35dZqOewwozUyAbo4R-scnYoGT1LFNz7AeP9U', '2024-08-20 03:22:36'),
('wfmszz9pidle9htjx7u6dywphlan8h0t', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4ifQ:1puQGy:cszh9adoFPOnEjnboayMEephhxzRjFYl4r8cAhD7BJ4', '2023-05-18 04:08:52'),
('xjisk0uhsqnljhdpdcf8mp7iozx244jv', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4iLCJzdGF0dXMiOiIifQ:1uMTN6:Rybd1D9zUtdCyccrY2S3GL4iv1jA50IrbD2w__i22bU', '2025-06-17 15:16:12'),
('yribf6himncjnhybdxw05ea8hunxqyga', 'eyJ1aWQiOjIsInV0eXBlIjoibGFiIn0:1sRP5G:iXXtIlZdThgJbya2N8tUP80b3zrTMLebdc1_vMn98h8', '2024-07-24 04:37:38'),
('zncj4alnj7ulrpdn1l8667ahnjuugsyo', 'YWIyODYxYzExOWZkNDA2ODZiYWU2ODQ0ZWEyOTNlZmMxNjJkZWJiZTp7InR5cGUiOiJhZG1pbiIsImlkIjoxfQ==', '2022-11-10 09:22:47');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fid`, `feedback`, `date`, `time`, `uid`, `utype`) VALUES
(1, 'hi this is feedback from shop7', '2025-06-08', '19:59:02', '7', 'shop'),
(2, 'this is a feedback from user 5', '2025-06-08', '20:24:31', '5', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `lid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uname` varchar(35) NOT NULL,
  `upass` varchar(15) NOT NULL,
  `utype` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`lid`, `uid`, `uname`, `upass`, `utype`, `status`) VALUES
(1, 0, 'admin', 'admin', 'admin', ''),
(8, 2, 'a1@123', '123', 'user', ''),
(9, 3, 'a2@123', '123', 'user', ''),
(12, 5, 'user@5', '123', 'user', ''),
(13, 7, 'shop@7', '123', 'shop', 'approved'),
(14, 8, 'shop@8', '123', 'shop', 'approved'),
(15, 1, 'staff@1', '123', 'staff', ''),
(16, 2, 'staff@2', '123', 'staff', ''),
(17, 3, 'staff@4', '123', 'staff', ''),
(18, 4, 'staff@5', '123', 'staff', ''),
(19, 5, 'staff@5', '123', 'staff', ''),
(23, 12, 'shop@10', '123', 'shop', 'approved');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`srid`, `sname`, `amt`, `descr`, `shid`) VALUES
(3, 'washing', '300', 'this is washing', '8'),
(4, 'cleaning', '200', 'this is de', '7'),
(5, 'iorning', '120', 'our iorning is grate ', '7'),
(6, 'dry cleaning +iorning', '250', 'this is a compination', '12');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `shid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `address` varchar(150) NOT NULL,
  `place` varchar(50) NOT NULL,
  `district` varchar(35) NOT NULL,
  `phn` varchar(13) NOT NULL,
  `email` varchar(40) NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`shid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`shid`, `name`, `address`, `place`, `district`, `phn`, `email`, `status`) VALUES
(7, 'shop7', 'qw', 'asd', 'idukki', '0987654322', 'shop@7', 'approved'),
(8, 'shop8', 'asdf', 'asd', 'thrissur', '0987654322', 'shop@8', 'approved'),
(12, 'shop 10', 'this is the address of the shop 10', 'kollam', 'kollam', '7091827364', 'shop@10', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `stid` int(7) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`stid`, `shid`, `name`, `address`, `street`, `city`, `district`, `phn`, `pin`, `dob`, `email`) VALUES
(1, 7, 'staff 1', 'asd', 'street of staff 3', 'city of staff 3', 'alappuzha', '5646464646', '345678', '2025-03-01', 'staff@1'),
(2, 7, 'staff 3', 'asd', 'street of staff 3', 'city of staff 3', 'alappuzha', '5646464646', '345678', '2025-04-29', 'staff@2'),
(5, 8, 'staff 5', 'asd', 'kjhkljhkljh', ',kjlkljh', 'kottayam', '9876543333', '987654', '2025-05-08', 'staff@5');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `address` varchar(150) NOT NULL,
  `district` varchar(25) NOT NULL,
  `phn` varchar(13) NOT NULL,
  `email` varchar(40) NOT NULL,
  `place` varchar(50) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `address`, `district`, `phn`, `email`, `place`) VALUES
(1, 'asdfg', 'ertyu', 'alappuzha', '1234545698', 'aa@123', 'sdfghj'),
(2, 'asdfg', 'asd', 'thrissur', '1234545698', 'a1@123', 'sdfghj'),
(3, 'asdfg', 'asd', 'kozhikode', '1234545698', 'a2@123', 'sdfghj'),
(4, 'asdfg', 'xcv', 'thiruvananthapuram', '1234545698', 'a3@123', 'sdfghj'),
(5, 'user 5', 'asdf', 'kottayam', '1234545698', 'user@5', 'sdfghj');

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
