-- --------------------------------------------------------
-- Hoszt:                        127.0.0.1
-- Szerver verzió:               8.0.30 - MySQL Community Server - GPL
-- Szerver OS:                   Win64
-- HeidiSQL Verzió:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Adatbázis struktúra mentése a a2r.webshop.
CREATE DATABASE IF NOT EXISTS `a2r.webshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `a2r.webshop`;

-- Struktúra mentése tábla a2r.webshop. auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.auth_group: ~0 rows (hozzávetőleg)
DELETE FROM `auth_group`;

-- Struktúra mentése tábla a2r.webshop. auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.auth_group_permissions: ~0 rows (hozzávetőleg)
DELETE FROM `auth_group_permissions`;

-- Struktúra mentése tábla a2r.webshop. auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.auth_permission: ~44 rows (hozzávetőleg)
DELETE FROM `auth_permission`;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add category', 7, 'add_category'),
	(26, 'Can change category', 7, 'change_category'),
	(27, 'Can delete category', 7, 'delete_category'),
	(28, 'Can view category', 7, 'view_category'),
	(29, 'Can add warehouse', 8, 'add_warehouse'),
	(30, 'Can change warehouse', 8, 'change_warehouse'),
	(31, 'Can delete warehouse', 8, 'delete_warehouse'),
	(32, 'Can view warehouse', 8, 'view_warehouse'),
	(33, 'Can add order', 9, 'add_order'),
	(34, 'Can change order', 9, 'change_order'),
	(35, 'Can delete order', 9, 'delete_order'),
	(36, 'Can view order', 9, 'view_order'),
	(37, 'Can add product', 10, 'add_product'),
	(38, 'Can change product', 10, 'change_product'),
	(39, 'Can delete product', 10, 'delete_product'),
	(40, 'Can view product', 10, 'view_product'),
	(41, 'Can add cart', 11, 'add_cart'),
	(42, 'Can change cart', 11, 'change_cart'),
	(43, 'Can delete cart', 11, 'delete_cart'),
	(44, 'Can view cart', 11, 'view_cart'),
	(45, 'Can add user address', 12, 'add_useraddress'),
	(46, 'Can change user address', 12, 'change_useraddress'),
	(47, 'Can delete user address', 12, 'delete_useraddress'),
	(48, 'Can view user address', 12, 'view_useraddress');

-- Struktúra mentése tábla a2r.webshop. auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.auth_user: ~2 rows (hozzávetőleg)
DELETE FROM `auth_user`;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$720000$CwkY0fASul797Ojx3LVDTM$phx+E4bO607iMygMF8dqorR+8pWLhTQXWRag+m9y7so=', '2024-04-18 09:06:42.833730', 1, 'admin', '', '', '', 1, 1, '2024-04-17 08:05:49.893774'),
	(9, 'pbkdf2_sha256$720000$DNBh73uGB7U8V4tkTr9RHG$MUnHyVp6mjVPFwidDGm+FOoZJ7ROeqwMs8oyqELiUIk=', '2024-04-18 07:42:32.250698', 0, 'Snewkovits', 'Ádám', 'Szabó', 'adamhunxd@gmail.com', 0, 1, '2024-04-18 07:41:48.589253');

-- Struktúra mentése tábla a2r.webshop. auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.auth_user_groups: ~0 rows (hozzávetőleg)
DELETE FROM `auth_user_groups`;

-- Struktúra mentése tábla a2r.webshop. auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.auth_user_user_permissions: ~0 rows (hozzávetőleg)
DELETE FROM `auth_user_user_permissions`;

-- Struktúra mentése tábla a2r.webshop. django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_hungarian_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_hungarian_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.django_admin_log: ~12 rows (hozzávetőleg)
DELETE FROM `django_admin_log`;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2024-04-17 08:11:16.509067', '4', 'Order object (4)', 3, '', 9, 1),
	(2, '2024-04-17 08:11:21.634940', '3', 'Order object (3)', 3, '', 9, 1),
	(3, '2024-04-17 08:11:21.636621', '2', 'Order object (2)', 3, '', 9, 1),
	(4, '2024-04-17 08:11:21.639179', '1', 'Order object (1)', 3, '', 9, 1),
	(5, '2024-04-17 08:23:26.121987', '7', ' | ', 3, '', 9, 1),
	(6, '2024-04-17 08:23:26.124215', '6', ' | ', 3, '', 9, 1),
	(7, '2024-04-17 09:53:42.653172', '2', 'admin | 4220 Hajdúböszörmény Kalvineum Utca\r\n17', 1, '[{"added": {}}]', 12, 1),
	(8, '2024-04-18 07:12:09.433480', '2', 'Snewkovits', 3, '', 4, 1),
	(9, '2024-04-18 07:29:01.953450', '4', 'Snewkovits', 3, '', 4, 1),
	(10, '2024-04-18 07:34:37.231233', '5', 'Snewkovits', 3, '', 4, 1),
	(11, '2024-04-18 07:35:55.156858', '6', 'Snewkovits', 3, '', 4, 1),
	(12, '2024-04-18 07:39:18.256341', '7', 'Snewkovits', 3, '', 4, 1),
	(13, '2024-04-18 07:41:34.162020', '8', 'Snewkovits', 3, '', 4, 1);

-- Struktúra mentése tábla a2r.webshop. django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.django_content_type: ~11 rows (hozzávetőleg)
DELETE FROM `django_content_type`;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session'),
	(11, 'webshop', 'cart'),
	(7, 'webshop', 'category'),
	(9, 'webshop', 'order'),
	(10, 'webshop', 'product'),
	(12, 'webshop', 'useraddress'),
	(8, 'webshop', 'warehouse');

-- Struktúra mentése tábla a2r.webshop. django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.django_migrations: ~19 rows (hozzávetőleg)
DELETE FROM `django_migrations`;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2024-04-17 08:02:41.835877'),
	(2, 'auth', '0001_initial', '2024-04-17 08:02:42.246697'),
	(3, 'admin', '0001_initial', '2024-04-17 08:02:42.346418'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-17 08:02:42.354690'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-17 08:02:42.369793'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-17 08:02:42.485443'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-17 08:02:42.551791'),
	(8, 'auth', '0003_alter_user_email_max_length', '2024-04-17 08:02:42.571124'),
	(9, 'auth', '0004_alter_user_username_opts', '2024-04-17 08:02:42.578140'),
	(10, 'auth', '0005_alter_user_last_login_null', '2024-04-17 08:02:42.622398'),
	(11, 'auth', '0006_require_contenttypes_0002', '2024-04-17 08:02:42.624307'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-17 08:02:42.629328'),
	(13, 'auth', '0008_alter_user_username_max_length', '2024-04-17 08:02:42.672808'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-17 08:02:42.713055'),
	(15, 'auth', '0010_alter_group_name_max_length', '2024-04-17 08:02:42.731076'),
	(16, 'auth', '0011_update_proxy_permissions', '2024-04-17 08:02:42.738115'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-17 08:02:42.791241'),
	(18, 'sessions', '0001_initial', '2024-04-17 08:02:42.817886'),
	(19, 'webshop', '0001_initial', '2024-04-17 08:02:43.100173'),
	(20, 'webshop', '0002_alter_order_products_useraddress', '2024-04-17 09:51:29.017723'),
	(21, 'webshop', '0003_order_active', '2024-04-18 09:08:48.065187'),
	(22, 'webshop', '0004_alter_order_active', '2024-04-18 09:09:49.964069');

-- Struktúra mentése tábla a2r.webshop. django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_hungarian_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.django_session: ~3 rows (hozzávetőleg)
DELETE FROM `django_session`;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('6k7h2ippazk80rhe4nrjf2g3y4fz6k9e', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxNj8:99Wdx5B3h9qf2kfa_pKbRy0V9Hv61QXIOqycRZF0Klk', '2024-05-02 09:06:42.835584'),
	('jdlacv2ol5rv6zw0abctum3jbb8xisem', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rx0gz:Q-hPK5FA3pZLk6ZzUmYvsm5CgWsxXUgfDqeevkDYeK4', '2024-05-01 08:30:57.124954'),
	('o3qh8fmit6ueqb895ivhxsuwb1q298sr', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxM1w:wn_h5FERivZ15_qJhfAxrLWb-B8bxjHb1r-l-kH5Pcc', '2024-05-02 07:18:00.056858');

-- Struktúra mentése tábla a2r.webshop. webshop_cart
CREATE TABLE IF NOT EXISTS `webshop_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webshop_cart_user_id_4f272746_fk_auth_user_id` (`user_id`),
  KEY `webshop_cart_product_id_73d4b0fc_fk_webshop_product_id` (`product_id`),
  CONSTRAINT `webshop_cart_product_id_73d4b0fc_fk_webshop_product_id` FOREIGN KEY (`product_id`) REFERENCES `webshop_product` (`id`),
  CONSTRAINT `webshop_cart_user_id_4f272746_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.webshop_cart: ~0 rows (hozzávetőleg)
DELETE FROM `webshop_cart`;

-- Struktúra mentése tábla a2r.webshop. webshop_category
CREATE TABLE IF NOT EXISTS `webshop_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.webshop_category: ~3 rows (hozzávetőleg)
DELETE FROM `webshop_category`;
INSERT INTO `webshop_category` (`id`, `name`) VALUES
	(1, 'GPU'),
	(2, 'CPU'),
	(3, 'Alaplap');

-- Struktúra mentése tábla a2r.webshop. webshop_order
CREATE TABLE IF NOT EXISTS `webshop_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `products` longtext COLLATE utf8mb4_hungarian_ci NOT NULL,
  `user_id` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webshop_order_user_id_c36e4f33_fk_auth_user_id` (`user_id`),
  CONSTRAINT `webshop_order_user_id_c36e4f33_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.webshop_order: ~9 rows (hozzávetőleg)
DELETE FROM `webshop_order`;
INSERT INTO `webshop_order` (`id`, `products`, `user_id`, `active`) VALUES
	(5, 'XFX Radeon Speedster SWFT 319 RX 6800 | ASUS Dual GeForce RTX 4060 OC | ASUS GeForce RTX 4070 DUAL | ', 1, 0),
	(8, 'XFX Radeon Speedster SWFT 319 RX 6800 | ASUS Dual GeForce RTX 4060 OC | ASUS GeForce RTX 4070 DUAL | ', 1, 0),
	(9, 'XFX Radeon Speedster SWFT 319 RX 6800 | ASUS Dual GeForce RTX 4060 OC | ASUS Dual GeForce RTX 4060 OC | ASUS Dual GeForce RTX 4060 OC | XFX Radeon Speedster SWFT 319 RX 6800 | ASUS GeForce RTX 4070 DUAL | ', 1, 0),
	(10, 'XFX Radeon Speedster SWFT 319 RX 6800 | XFX Radeon Speedster SWFT 319 RX 6800 | ASUS Dual GeForce RTX 4060 OC | ASUS Dual GeForce RTX 4060 OC | ASUS GeForce RTX 4070 DUAL | ASUS GeForce RTX 4070 DUAL | ', 1, 0),
	(11, 'XFX Radeon Speedster SWFT 319 RX 6800 | ASUS Dual GeForce RTX 4060 OC | ASUS GeForce RTX 4070 DUAL | ASUS Dual GeForce RTX 4060 OC | XFX Radeon Speedster SWFT 319 RX 6800 | ', 1, 0),
	(12, 'XFX Radeon Speedster SWFT 319 RX 6800 | ASUS Dual GeForce RTX 4060 OC | ASUS GeForce RTX 4070 DUAL | ', 1, 0),
	(13, 'XFX Radeon Speedster SWFT 319 RX 6800 | ASUS Dual GeForce RTX 4060 OC | ASUS GeForce RTX 4070 DUAL | ', 1, 0),
	(14, 'XFX Radeon Speedster SWFT 319 RX 6800 | ASUS Dual GeForce RTX 4060 OC | ', 1, 0),
	(15, 'XFX Radeon Speedster SWFT 319 RX 6800 | ASUS Dual GeForce RTX 4060 OC | ASUS Dual GeForce RTX 4060 OC | ASUS Dual GeForce RTX 4060 OC | ASUS GeForce RTX 4070 DUAL | ', 9, 0),
	(16, 'XFX Radeon Speedster SWFT 319 RX 6800 | XFX Radeon Speedster SWFT 319 RX 6800 | XFX Radeon Speedster SWFT 319 RX 6800 | ASUS GeForce RTX 4070 DUAL | ASUS GeForce RTX 4070 DUAL | ASUS GeForce RTX 4070 DUAL | ASUS Dual GeForce RTX 4060 OC | ASUS Dual GeForce RTX 4060 OC | ', 1, 0);

-- Struktúra mentése tábla a2r.webshop. webshop_product
CREATE TABLE IF NOT EXISTS `webshop_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_hungarian_ci NOT NULL,
  `freeze_cost` decimal(20,2) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `quantity` int NOT NULL,
  `category_id_id` bigint NOT NULL,
  `warehouse_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webshop_product_category_id_id_05e64a17_fk_webshop_category_id` (`category_id_id`),
  KEY `webshop_product_warehouse_id_id_b4f135f7_fk_webshop_warehouse_id` (`warehouse_id_id`),
  CONSTRAINT `webshop_product_category_id_id_05e64a17_fk_webshop_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `webshop_category` (`id`),
  CONSTRAINT `webshop_product_warehouse_id_id_b4f135f7_fk_webshop_warehouse_id` FOREIGN KEY (`warehouse_id_id`) REFERENCES `webshop_warehouse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.webshop_product: ~9 rows (hozzávetőleg)
DELETE FROM `webshop_product`;
INSERT INTO `webshop_product` (`id`, `name`, `description`, `freeze_cost`, `price`, `quantity`, `category_id_id`, `warehouse_id_id`) VALUES
	(1, 'AMD Ryzen 7 7800X3D', 'Magok száma: 8\r\nSzálak száma: 16\r\nÓrajel: 4200 MHz', 100000.00, 142370.00, 3, 2, 1),
	(2, 'AMD Ryzen 5 5600X', 'Magok száma: 8\r\nSzálak száma: 16\r\nÓrajel: 4200 MHz', 30000.00, 56000.00, 5, 2, 1),
	(3, 'Intel i5-12400F', 'Magok száma: 6\r\nSzálak száma: 12\r\nÓrajel: 2500 MHz', 30000.00, 53000.00, 3, 2, 1),
	(4, 'XFX Radeon Speedster SWFT 319 RX 6800', 'Csatolófelület	PCI-Express\r\nVideo chipset	AMD Radeon\r\nVideo chipset termékcsalád	RX 6800\r\nHűtés típusa	Aktív hűtés\r\nVentilátorok száma	3 darab\r\nGrafikus chip sebessége	2105 MHz\r\nGrafikus memória sebessége	16000 MHz', 150000.00, 201000.00, 3, 1, 1),
	(5, 'ASUS Dual GeForce RTX 4060 OC', 'Csatolófelület	PCI-Express\r\nVideo chipset	Nvidia GeForce\r\nVideo chipset termékcsalád	RTX 4060\r\nGrafikus chip sebessége	2535 MHz\r\nGrafikus memória sebessége	17000 MHz\r\nMemória mérete	8 GB\r\nMemória típusa	GDDR6\r\nMemória sávszélesség	128 bit', 100000.00, 138000.00, 1, 1, 1),
	(6, 'ASUS GeForce RTX 4070 DUAL', 'Memória mérete	12 GB\r\nMemória típusa	GDDR6X\r\nMemória sávszélesség	192 bit', 200000.00, 254000.00, 2, 1, 1),
	(7, 'MSI MAG B650 Tomahawk WIFI', 'CPU Foglalat	Socket AM5\r\nChipset	AMD B650\r\nProcesszor gyártó	AMD\r\nMemória típusa	DDR5', 50000.00, 85000.00, 3, 3, 1),
	(8, 'MSI MPG B550 GAMING PLUS Alaplap', 'CPU Foglalat	Socket AM4\r\nChipset	AMD B550\r\nProcesszor gyártó	AMD\r\nMemória típusa	DDR4', 30000.00, 50000.00, 2, 3, 1),
	(9, 'ASUS TUF GAMING B450M-PLUS II', 'CPU Foglalat	Socket AM4\r\nChipset	AMD B450\r\nProcesszor gyártó	AMD\r\nMemória típusa	DDR4', 15000.00, 33000.00, 2, 3, 1);

-- Struktúra mentése tábla a2r.webshop. webshop_useraddress
CREATE TABLE IF NOT EXISTS `webshop_useraddress` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `postal` int NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_hungarian_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webshop_useraddress_user_id_6bc9e14a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `webshop_useraddress_user_id_6bc9e14a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.webshop_useraddress: ~1 rows (hozzávetőleg)
DELETE FROM `webshop_useraddress`;
INSERT INTO `webshop_useraddress` (`id`, `postal`, `city`, `address`, `user_id`) VALUES
	(2, 4220, 'Hajdúböszörmény', 'Kalvineum Utca\r\n17', 1),
	(3, 4220, 'Hajdúböszörmény', 'Kalvineum Utca', 9);

-- Struktúra mentése tábla a2r.webshop. webshop_warehouse
CREATE TABLE IF NOT EXISTS `webshop_warehouse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `postal` int NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.webshop_warehouse: ~0 rows (hozzávetőleg)
DELETE FROM `webshop_warehouse`;
INSERT INTO `webshop_warehouse` (`id`, `name`, `postal`, `city`, `address`) VALUES
	(1, 'Debreceni Raktár', 4225, 'Debrecen', 'Szent Anna utca 12');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
