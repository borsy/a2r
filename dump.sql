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

-- Tábla adatainak mentése a2r.webshop.auth_permission: ~48 rows (hozzávetőleg)
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
	(33, 'Can add product', 9, 'add_product'),
	(34, 'Can change product', 9, 'change_product'),
	(35, 'Can delete product', 9, 'delete_product'),
	(36, 'Can view product', 9, 'view_product'),
	(37, 'Can add cart', 10, 'add_cart'),
	(38, 'Can change cart', 10, 'change_cart'),
	(39, 'Can delete cart', 10, 'delete_cart'),
	(40, 'Can view cart', 10, 'view_cart'),
	(41, 'Can add user address', 11, 'add_useraddress'),
	(42, 'Can change user address', 11, 'change_useraddress'),
	(43, 'Can delete user address', 11, 'delete_useraddress'),
	(44, 'Can view user address', 11, 'view_useraddress'),
	(45, 'Can add order', 12, 'add_order'),
	(46, 'Can change order', 12, 'change_order'),
	(47, 'Can delete order', 12, 'delete_order'),
	(48, 'Can view order', 12, 'view_order');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.auth_user: ~1 rows (hozzávetőleg)
DELETE FROM `auth_user`;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$720000$OHP4OCed0fTh3J1tG1Ilt9$C9h4Hnelx5fpEiZ/skB1GpAgfbnFedmppX1DddRkYV8=', '2024-04-20 09:32:26.454967', 1, 'admin', '', '', '', 1, 1, '2024-04-20 09:28:00.100453'),
	(2, 'pbkdf2_sha256$720000$HH6NXhk9U8rl6behHQrEnG$CCtgenbIHeq+NOW11w0T/otruiF7jMZ84jsPYerd8DQ=', '2024-04-20 09:30:36.144922', 0, 'roborob', 'rob', 'robo', 'roborob@test.com', 0, 1, '2024-04-20 09:30:26.251725'),
	(3, 'pbkdf2_sha256$720000$hpkos0d4Bl2uvVpm3YGgw0$BJzF0ehpAqtUmea37M2UwzbqAGCu97pFSHY4uA05kic=', '2024-04-20 09:32:06.518881', 0, 'Snewkovits', 'Ádám', 'Szabó', 'adamhunxd@gmail.com', 0, 1, '2024-04-20 09:31:58.887095');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.django_admin_log: ~0 rows (hozzávetőleg)
DELETE FROM `django_admin_log`;

-- Struktúra mentése tábla a2r.webshop. django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.django_content_type: ~12 rows (hozzávetőleg)
DELETE FROM `django_content_type`;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session'),
	(10, 'webshop', 'cart'),
	(7, 'webshop', 'category'),
	(12, 'webshop', 'order'),
	(9, 'webshop', 'product'),
	(11, 'webshop', 'useraddress'),
	(8, 'webshop', 'warehouse');

-- Struktúra mentése tábla a2r.webshop. django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.django_migrations: ~19 rows (hozzávetőleg)
DELETE FROM `django_migrations`;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2024-04-20 09:25:28.284195'),
	(2, 'auth', '0001_initial', '2024-04-20 09:25:28.676071'),
	(3, 'admin', '0001_initial', '2024-04-20 09:25:28.779071'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-20 09:25:28.784630'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-20 09:25:28.790263'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-20 09:25:28.848022'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-20 09:25:28.893954'),
	(8, 'auth', '0003_alter_user_email_max_length', '2024-04-20 09:25:28.915113'),
	(9, 'auth', '0004_alter_user_username_opts', '2024-04-20 09:25:28.922689'),
	(10, 'auth', '0005_alter_user_last_login_null', '2024-04-20 09:25:28.970332'),
	(11, 'auth', '0006_require_contenttypes_0002', '2024-04-20 09:25:28.973425'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-20 09:25:28.980424'),
	(13, 'auth', '0008_alter_user_username_max_length', '2024-04-20 09:25:29.095621'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-20 09:25:29.169669'),
	(15, 'auth', '0010_alter_group_name_max_length', '2024-04-20 09:25:29.188971'),
	(16, 'auth', '0011_update_proxy_permissions', '2024-04-20 09:25:29.199092'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-20 09:25:29.255957'),
	(18, 'sessions', '0001_initial', '2024-04-20 09:25:29.281027'),
	(19, 'webshop', '0001_initial', '2024-04-20 09:25:29.681017');

-- Struktúra mentése tábla a2r.webshop. django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_hungarian_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.django_session: ~1 rows (hozzávetőleg)
DELETE FROM `django_session`;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('rujyjh9emykmq86osysqrrj0lvo7ogq1', '.eJxVjEEOwiAQRe_C2hCg0DIu3XsGwsCMVA0kpV0Z765NutDtf-_9lwhxW0vYOi1hzuIsjDj9bhjTg-oO8j3WW5Op1XWZUe6KPGiX15bpeTncv4MSe_nWCBM7YuUYnDGotKGsgHWGSJD96Jzi5O0Aozc2xYHBs598soxoNSnx_gDm5Df0:1ry73M:yncWaBVPkUzdS_igz7MT_DaWyYePThap-z3BvIOMMVE', '2024-05-04 09:30:36.151376');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.webshop_cart: ~3 rows (hozzávetőleg)
DELETE FROM `webshop_cart`;
INSERT INTO `webshop_cart` (`id`, `user_id`, `product_id`) VALUES
	(1, 1, 4),
	(2, 1, 5),
	(3, 1, 6);

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
  `active` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  `address_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webshop_order_user_id_c36e4f33_fk_auth_user_id` (`user_id`),
  KEY `webshop_order_address_id_3f4565a3_fk_webshop_useraddress_id` (`address_id`),
  CONSTRAINT `webshop_order_address_id_3f4565a3_fk_webshop_useraddress_id` FOREIGN KEY (`address_id`) REFERENCES `webshop_useraddress` (`id`),
  CONSTRAINT `webshop_order_user_id_c36e4f33_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.webshop_order: ~0 rows (hozzávetőleg)
DELETE FROM `webshop_order`;
INSERT INTO `webshop_order` (`id`, `products`, `active`, `user_id`, `address_id`) VALUES
	(1, 'XFX Radeon Speedster SWFT 319 RX 6800 | AMD Ryzen 5 5600X | MSI MPG B550 GAMING PLUS Alaplap | ', 1, 2, 1),
	(2, 'ASUS Dual GeForce RTX 4060 OC | ASUS GeForce RTX 4070 DUAL | XFX Radeon Speedster SWFT 319 RX 6800 | ', 1, 3, 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Tábla adatainak mentése a2r.webshop.webshop_useraddress: ~0 rows (hozzávetőleg)
DELETE FROM `webshop_useraddress`;
INSERT INTO `webshop_useraddress` (`id`, `postal`, `city`, `address`, `user_id`) VALUES
	(1, 4032, 'Debrecen', 'Jerikó utca 17.', 2),
	(2, 4220, 'Hajdúböszörmény', 'Kalvineum Utca', 3);

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
