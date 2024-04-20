-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 20. 16:50
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `a2r.webshop`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `auth_permission`
--

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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$CwkY0fASul797Ojx3LVDTM$phx+E4bO607iMygMF8dqorR+8pWLhTQXWRag+m9y7so=', '2024-04-20 14:22:25.032205', 1, 'admin', '', '', '', 1, 1, '2024-04-17 08:05:49.893774'),
(9, 'pbkdf2_sha256$720000$DNBh73uGB7U8V4tkTr9RHG$MUnHyVp6mjVPFwidDGm+FOoZJ7ROeqwMs8oyqELiUIk=', '2024-04-18 07:42:32.250698', 0, 'Snewkovits', 'Ádám', 'Szabó', 'adamhunxd@gmail.com', 0, 1, '2024-04-18 07:41:48.589253');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ;

--
-- A tábla adatainak kiíratása `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-04-17 08:11:16.509067', '4', 'Order object (4)', 3, '', 9, 1),
(2, '2024-04-17 08:11:21.634940', '3', 'Order object (3)', 3, '', 9, 1),
(3, '2024-04-17 08:11:21.636621', '2', 'Order object (2)', 3, '', 9, 1),
(4, '2024-04-17 08:11:21.639179', '1', 'Order object (1)', 3, '', 9, 1),
(5, '2024-04-17 08:23:26.121987', '7', ' | ', 3, '', 9, 1),
(6, '2024-04-17 08:23:26.124215', '6', ' | ', 3, '', 9, 1),
(7, '2024-04-17 09:53:42.653172', '2', 'admin | 4220 Hajdúböszörmény Kalvineum Utca\r\n17', 1, '[{\"added\": {}}]', 12, 1),
(8, '2024-04-18 07:12:09.433480', '2', 'Snewkovits', 3, '', 4, 1),
(9, '2024-04-18 07:29:01.953450', '4', 'Snewkovits', 3, '', 4, 1),
(10, '2024-04-18 07:34:37.231233', '5', 'Snewkovits', 3, '', 4, 1),
(11, '2024-04-18 07:35:55.156858', '6', 'Snewkovits', 3, '', 4, 1),
(12, '2024-04-18 07:39:18.256341', '7', 'Snewkovits', 3, '', 4, 1),
(13, '2024-04-18 07:41:34.162020', '8', 'Snewkovits', 3, '', 4, 1),
(14, '2024-04-20 12:45:33.473533', '10', 'ASROCK ALAPLAP S1151 H310CM-DVS INTEL H310C, MATX', 1, '[{\"added\": {}}]', 10, 1),
(15, '2024-04-20 12:47:57.909907', '11', 'GIGABYTE ALAPLAP S1200 H410M H V2 INTEL H470, MATX', 1, '[{\"added\": {}}]', 10, 1),
(16, '2024-04-20 12:53:58.018965', '11', 'GIGABYTE ALAPLAP S1200 H410M H V2 INTEL H470, MATX', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(17, '2024-04-20 12:54:30.609667', '10', 'ASROCK ALAPLAP S1151 H310CM-DVS INTEL H310C, MATX', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(18, '2024-04-20 12:54:47.720341', '11', 'GIGABYTE ALAPLAP S1200 H410M H V2 INTEL H470, MATX', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(19, '2024-04-20 12:59:12.670564', '12', 'ASUS ALAPLAP AM4 TUF GAMING A520M-PLUS II AMD A520, MATX', 1, '[{\"added\": {}}]', 10, 1),
(20, '2024-04-20 13:02:26.823064', '13', 'INTEL CPU S1200 CELERON', 1, '[{\"added\": {}}]', 10, 1),
(21, '2024-04-20 13:04:10.079371', '14', 'INTEL CPU S1200 CORE I5-10400', 1, '[{\"added\": {}}]', 10, 1),
(22, '2024-04-20 13:07:20.327529', '15', 'INTEL CPU S1700 CORE I7-14700K', 1, '[{\"added\": {}}]', 10, 1),
(23, '2024-04-20 13:09:04.960132', '12', 'ASUS ALAPLAP TUF GAMING, MATX', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 10, 1),
(24, '2024-04-20 13:09:41.830309', '10', 'ASROCK ALAPLAP S1151, MATX', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 10, 1),
(25, '2024-04-20 13:10:01.910006', '11', 'GIGABYTE ALAPLAP S1200 H410M, MATX', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 10, 1),
(26, '2024-04-20 13:15:42.509871', '16', 'ASUS NVIDIA RTX 3050', 1, '[{\"added\": {}}]', 10, 1),
(27, '2024-04-20 13:21:42.278666', '17', 'GIGABYTE NVIDIA RTX 3060', 1, '[{\"added\": {}}]', 10, 1),
(28, '2024-04-20 13:26:40.917861', '18', 'ASROCK AMD RX 7600 PHANTOM GAMING', 1, '[{\"added\": {}}]', 10, 1),
(29, '2024-04-20 13:27:22.302340', '4', 'Memória', 1, '[{\"added\": {}}]', 7, 1),
(30, '2024-04-20 13:31:10.173728', '6', 'ASUS GeForce RTX 4070 DUAL', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(31, '2024-04-20 13:37:04.619859', '19', 'KINGMAX CL19', 1, '[{\"added\": {}}]', 10, 1),
(32, '2024-04-20 13:38:31.000945', '20', 'KINGSTON CLIENT PREMIER', 1, '[{\"added\": {}}]', 10, 1),
(33, '2024-04-20 13:41:29.939697', '21', 'KINGSTON CL11 1RX8', 1, '[{\"added\": {}}]', 10, 1),
(34, '2024-04-20 13:42:55.763665', '22', 'KINGMAX CL19', 1, '[{\"added\": {}}]', 10, 1),
(35, '2024-04-20 13:47:31.236034', '23', 'KINGSTON CLIENT PREMIER SINGLE RANK', 1, '[{\"added\": {}}]', 10, 1),
(36, '2024-04-20 13:48:52.892016', '24', 'KINGSTON FURY BEAST', 1, '[{\"added\": {}}]', 10, 1),
(37, '2024-04-20 13:53:47.587274', '6', 'ASUS GeForce RTX 4070 DUAL', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(38, '2024-04-20 13:54:46.070727', '18', 'ASROCK AMD RX 7600 PHANTOM GAMING', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(39, '2024-04-20 13:55:20.859371', '18', 'ASROCK AMD RX 7600 PHANTOM GAMING', 2, '[]', 10, 1),
(40, '2024-04-20 13:59:12.269227', '5', 'Tárolók', 1, '[{\"added\": {}}]', 7, 1),
(41, '2024-04-20 14:01:17.905752', '25', 'SEAGATE 2.5\" HDD SATA-III', 1, '[{\"added\": {}}]', 10, 1),
(42, '2024-04-20 14:02:55.145497', '26', 'WESTERN DIGITAL 3.5\" HDD SATA-III', 1, '[{\"added\": {}}]', 10, 1),
(43, '2024-04-20 14:05:55.536465', '27', 'SEAGATE 3.5\" HDD SATA-III IRONWOLF', 1, '[{\"added\": {}}]', 10, 1),
(44, '2024-04-20 14:09:00.225960', '28', 'KINGMAX 2.5\" SSD SATA3', 1, '[{\"added\": {}}]', 10, 1),
(45, '2024-04-20 14:11:35.441258', '29', 'HIKSEMI NEO C100', 1, '[{\"added\": {}}]', 10, 1),
(46, '2024-04-20 14:14:25.864018', '30', 'SAMSUNG SSD 870 EVO', 1, '[{\"added\": {}}]', 10, 1),
(47, '2024-04-20 14:34:01.572232', '29', 'roborob@test.com | XFX Radeon Speedster SWFT 319 RX 6800 | AMD Ryzen 5 5600X | MSI MPG B550 GAMING PLUS Alaplap | ', 3, '', 9, 1),
(48, '2024-04-20 14:34:01.575518', '28', 'roborob@test.com | XFX Radeon Speedster SWFT 319 RX 6800 | AMD Ryzen 5 5600X | MSI MPG B550 GAMING PLUS Alaplap | ', 3, '', 9, 1),
(49, '2024-04-20 14:34:01.577642', '27', 'roborob@test.com | XFX Radeon Speedster SWFT 319 RX 6800 | AMD Ryzen 5 5600X | MSI MPG B550 GAMING PLUS Alaplap | ', 3, '', 9, 1),
(50, '2024-04-20 14:34:01.579808', '26', 'roborob@test.com | XFX Radeon Speedster SWFT 319 RX 6800 | AMD Ryzen 5 5600X | MSI MPG B550 GAMING PLUS Alaplap | ', 3, '', 9, 1),
(51, '2024-04-20 14:34:01.583755', '25', 'roborob@test.com | XFX Radeon Speedster SWFT 319 RX 6800 | AMD Ryzen 5 5600X | MSI MPG B550 GAMING PLUS Alaplap | ', 3, '', 9, 1),
(52, '2024-04-20 14:34:01.585507', '24', 'roborob@test.com | XFX Radeon Speedster SWFT 319 RX 6800 | AMD Ryzen 5 5600X | MSI MPG B550 GAMING PLUS Alaplap | ', 3, '', 9, 1),
(53, '2024-04-20 14:34:01.585507', '23', 'roborob@test.com | XFX Radeon Speedster SWFT 319 RX 6800 | AMD Ryzen 5 5600X | MSI MPG B550 GAMING PLUS Alaplap | ', 3, '', 9, 1),
(54, '2024-04-20 14:34:01.585507', '22', 'roborob@test.com | XFX Radeon Speedster SWFT 319 RX 6800 | AMD Ryzen 5 5600X | MSI MPG B550 GAMING PLUS Alaplap | ', 3, '', 9, 1),
(55, '2024-04-20 14:34:01.585507', '21', 'roborob@test.com | XFX Radeon Speedster SWFT 319 RX 6800 | AMD Ryzen 5 5600X | MSI MPG B550 GAMING PLUS Alaplap | ', 3, '', 9, 1),
(56, '2024-04-20 14:34:01.585507', '20', ' | XFX Radeon Speedster SWFT 319 RX 6800 | ', 3, '', 9, 1),
(57, '2024-04-20 14:34:01.585507', '19', 'roborob@test.com | XFX Radeon Speedster SWFT 319 RX 6800 | XFX Radeon Speedster SWFT 319 RX 6800 | XFX Radeon Speedster SWFT 319 RX 6800 | ', 3, '', 9, 1),
(58, '2024-04-20 14:34:01.585507', '18', ' | ', 3, '', 9, 1),
(59, '2024-04-20 14:34:23.918590', '10', 'roborob', 3, '', 4, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `django_content_type`
--

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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `django_migrations`
--

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
(22, 'webshop', '0004_alter_order_active', '2024-04-18 09:09:49.964069'),
(23, 'webshop', '0005_order_address', '2024-04-19 15:54:29.433904');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0db2mm4w8nt7wc4q9f3ov35f91ot73o2', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxste:97a7-ROfnRcVfaLa1myb54y4fFSsDwmQz8MLfn7afKM', '2024-05-03 18:23:38.100844'),
('0tg7tgi4ev9u1vd0lo7yw755f55fuw5c', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxsgL:zv8SOmUaUXc8JbsAxmMgxa9fCVHIXJ_61_aZ2QBxy9M', '2024-05-03 18:09:53.487840'),
('0wrjaiujn5fr4w3lhf3o70eahljb8jij', '.eJxVjEEOwiAQRe_C2pCBTinj0r1nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIsFIjT7xh8fKS6E777emsytrouc5C7Ig_a5bVxel4O9--g-F6-tdaIgKNFA6hMxImAgGM2OBiyOg_TSMxx0B6UIuREJnsabc6kIOAk3h-53DaY:1rxqkG:8GvYhb8NABqgWW5W3tyH74WLYUraif8Bpdnnac9oFvE', '2024-05-03 16:05:48.981376'),
('2x3jlz8i8wkpt73vc16o3sadc2g6fquw', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxskI:UJ3uS1DcPhlFAwjdbm6KmXRUoC7YVYyvlwf2TI9Xw0I', '2024-05-03 18:13:58.383954'),
('4y1poaavaeq0v7h03whauugpiguqy11w', '.eJxVjEEOwiAQRe_C2pCBTinj0r1nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIsFIjT7xh8fKS6E777emsytrouc5C7Ig_a5bVxel4O9--g-F6-tdaIgKNFA6hMxImAgGM2OBiyOg_TSMxx0B6UIuREJnsabc6kIOAk3h-53DaY:1rxqMG:LM8tGErQ37Jkha5YJC_zFZrmGPlhgWnw7jpJ20MLgp0', '2024-05-03 15:41:00.084772'),
('54jliyzt5jdgz8k4ecs66qywi70k4614', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1ry8r0:vL6CHGn55pWKsRO0htv7dFePZdYidx09YvXWiHeGutc', '2024-05-04 11:25:58.861557'),
('6gmch9slsgwx21gzeiy48dhi45296n2r', '.eJxVjEEOwiAQRe_C2pCBTinj0r1nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIsFIjT7xh8fKS6E777emsytrouc5C7Ig_a5bVxel4O9--g-F6-tdaIgKNFA6hMxImAgGM2OBiyOg_TSMxx0B6UIuREJnsabc6kIOAk3h-53DaY:1ryBas:6dKMuBfPSGb4cT6b5FjbtwbHZlb06F2afVOOedtU6oo', '2024-05-04 14:21:30.491871'),
('6k7h2ippazk80rhe4nrjf2g3y4fz6k9e', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxNj8:99Wdx5B3h9qf2kfa_pKbRy0V9Hv61QXIOqycRZF0Klk', '2024-05-02 09:06:42.835584'),
('9s3rqsuosz7a3khko4hdlwplu0apbn9s', '.eJxVjEEOwiAQRe_C2pCBTinj0r1nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIsFIjT7xh8fKS6E777emsytrouc5C7Ig_a5bVxel4O9--g-F6-tdaIgKNFA6hMxImAgGM2OBiyOg_TSMxx0B6UIuREJnsabc6kIOAk3h-53DaY:1ry8pk:XTRQ64iOxEu5U6ihCGKyuZ6rIl2JJZoNXc_K2VbCaYE', '2024-05-04 11:24:40.562522'),
('byvtihefxhbezey2ofmg184c669c2jak', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1ry9y2:ff0S9RIChBMe2rIWMouc982x3l9pbY3YTjI2B7Br0rk', '2024-05-04 12:37:18.148536'),
('c381psey2h97tlzaw326a6quz97qhnaa', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxsfj:Um2nWelOqOEl4dEO6d9mczMPTuR8ev-_p4E8w6Ibaow', '2024-05-03 18:09:15.511793'),
('hpkvjwpj59q6qyh2okzpxt3h2jsod9uq', '.eJxVjEEOwiAQRe_C2pCBTinj0r1nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIsFIjT7xh8fKS6E777emsytrouc5C7Ig_a5bVxel4O9--g-F6-tdaIgKNFA6hMxImAgGM2OBiyOg_TSMxx0B6UIuREJnsabc6kIOAk3h-53DaY:1rxsGo:bhjQpO0Vi-cpALTsvDoX3uw5K49qQKPKD6m8IGVzv8A', '2024-05-03 17:43:30.590100'),
('id4rmgs3iu47hk43pd4fvx19zgi1opcm', '.eJxVjEEOwiAQRe_C2pCBTinj0r1nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIsFIjT7xh8fKS6E777emsytrouc5C7Ig_a5bVxel4O9--g-F6-tdaIgKNFA6hMxImAgGM2OBiyOg_TSMxx0B6UIuREJnsabc6kIOAk3h-53DaY:1ry9x8:6w0efyOgDv9qRzJtxwHrbAFWkhGm4SX7_ZAOQWPhhjk', '2024-05-04 12:36:22.982191'),
('idbfjm860g8dc7b7clnixl7xapn864w6', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxsaR:fx6KJ45CysLmqROcZSHjMz3by8T-DnmYmlOqccRQoJw', '2024-05-03 18:03:47.407811'),
('j6ya1uygct21jfu2o6plbqswb6pinzal', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxsih:JzMlTeWaHhOAsaNZWQ3CMRWD5OL0oJlsPHdenTYNGSE', '2024-05-03 18:12:19.679167'),
('jdlacv2ol5rv6zw0abctum3jbb8xisem', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rx0gz:Q-hPK5FA3pZLk6ZzUmYvsm5CgWsxXUgfDqeevkDYeK4', '2024-05-01 08:30:57.124954'),
('kqssbwa8e8z9tq96kvys1529dg5ltez6', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxsqs:Y8MfQG0hIE9D9MCZLQwNnEl3lo0jZJ5aPVoDr6bncMI', '2024-05-03 18:20:46.483493'),
('lbiej5e3r5tnphxzuckqmoenyk992ira', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxt1P:4FCwwSXoPjR_IygvfxILBlWnLQAiw85tabn8jUkkykY', '2024-05-03 18:31:39.446922'),
('lbivvytvhaowzu7iljjajbc0bkvwhrzu', '.eJxVjEEOwiAQRe_C2pCBTinj0r1nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIsFIjT7xh8fKS6E777emsytrouc5C7Ig_a5bVxel4O9--g-F6-tdaIgKNFA6hMxImAgGM2OBiyOg_TSMxx0B6UIuREJnsabc6kIOAk3h-53DaY:1rxssv:JXkluYy6GUrMt4VzkbuiB5oEU7CuW8JQODLyWrdQMiY', '2024-05-03 18:22:53.916005'),
('nos353yzfvdurkt20wdntuaiew2ndk3b', '.eJxVjEEOwiAQRe_C2pCBTinj0r1nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIsFIjT7xh8fKS6E777emsytrouc5C7Ig_a5bVxel4O9--g-F6-tdaIgKNFA6hMxImAgGM2OBiyOg_TSMxx0B6UIuREJnsabc6kIOAk3h-53DaY:1rxsLE:mnn3yW8l_8mk0Gxuu91Ls_MoqJARDH4KHtE9cpD7G8I', '2024-05-03 17:48:04.884159'),
('o3qh8fmit6ueqb895ivhxsuwb1q298sr', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxM1w:wn_h5FERivZ15_qJhfAxrLWb-B8bxjHb1r-l-kH5Pcc', '2024-05-02 07:18:00.056858'),
('tupt3mb3gibbxxz44tiifqs58osgpzmj', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxsXV:uxhyGLRG1UAmi-3XGulNMaoeFzC2bUEIB5ynTXcz6Cc', '2024-05-03 18:00:45.234629'),
('uhz3hg4idvk3ufnpyi7qkplyiozzqq4j', '.eJxVjEEOwiAQRe_C2pCBTinj0r1nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIsFIjT7xh8fKS6E777emsytrouc5C7Ig_a5bVxel4O9--g-F6-tdaIgKNFA6hMxImAgGM2OBiyOg_TSMxx0B6UIuREJnsabc6kIOAk3h-53DaY:1rxqf8:2JCE2luMRObifPAYI2uTEV0iY9mn2IPlDxCLbOeTOZc', '2024-05-03 16:00:30.310533'),
('uqxvb8u4pir5129gygdvbecs27p2wwgy', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1ry9OL:hT2gPT0We_4SLdPPpCTEx7FfyLFyDMyDYHRNBwCmbPw', '2024-05-04 12:00:25.527099'),
('v66llrbxapzgaasft7i5vxrqox7nbzwu', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxsZi:0LHkiquDeFaxlYAzfTIbAUfAvWLom1SeuVZx7B-B288', '2024-05-03 18:03:02.104041'),
('wl6bi2slmxst3fzk99wnmtz2d2rfdpud', '.eJxVjEEOwiAQRe_C2pCBTinj0r1nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIsFIjT7xh8fKS6E777emsytrouc5C7Ig_a5bVxel4O9--g-F6-tdaIgKNFA6hMxImAgGM2OBiyOg_TSMxx0B6UIuREJnsabc6kIOAk3h-53DaY:1ry9NJ:ZwWFEVXH9CVoGR_FOESc3MVX3hix3U_St8kZC8QymW8', '2024-05-04 11:59:21.980274'),
('wwb2ijoj1mhbc6r49a20gnpwoor24leo', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1ryBbl:PJloL4P7Il3DWdG9q8yEZV_8xUyONf4P8oU9MShQTcc', '2024-05-04 14:22:25.032205'),
('y19qug93doxnpf68obr2xxlnoe2tfgxo', '.eJxVjEEOwiAQRe_C2pCBTinj0r1nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIsFIjT7xh8fKS6E777emsytrouc5C7Ig_a5bVxel4O9--g-F6-tdaIgKNFA6hMxImAgGM2OBiyOg_TSMxx0B6UIuREJnsabc6kIOAk3h-53DaY:1rxsy6:4HQkq5eQnzA8uV9Oj0-mw4AOML1WUIInuGGRDJ_2-4Q', '2024-05-03 18:28:14.496798'),
('zfhk355ap4bd4vg654nyp7ybtcrnqb65', '.eJxVjEEOwiAQRe_C2pCBTinj0r1nIMCAVA0kpV0Z765NutDtf-_9l3B-W4vbelrczOIsFIjT7xh8fKS6E777emsytrouc5C7Ig_a5bVxel4O9--g-F6-tdaIgKNFA6hMxImAgGM2OBiyOg_TSMxx0B6UIuREJnsabc6kIOAk3h-53DaY:1rxsF2:b9_6299E6UGgUmh8A_69at6rFiQSjcppmFdEsplaLdk', '2024-05-03 17:41:40.420026'),
('zlbhrxwcriv3qf8xy8058oe7ypplbwfl', '.eJxVjEEOwiAQRe_C2hCmVKAu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KFCn342QH1J2EO9YblVzLesyk94VfdCmxxrleT3cv4OMLX9rB4KOhB2S9MFQ4uiJiCGgPYMlQeNtj8kNZH3H0AUPZGIMabAJhNX7AxnmOQw:1rxskr:dMzMdnK9R1npdxnDumRB5lq99FpiPfZK-bSFRsKHH9Y', '2024-05-03 18:14:33.319092');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `webshop_cart`
--

CREATE TABLE `webshop_cart` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `webshop_category`
--

CREATE TABLE `webshop_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `webshop_category`
--

INSERT INTO `webshop_category` (`id`, `name`) VALUES
(1, 'GPU'),
(2, 'CPU'),
(3, 'Alaplap'),
(4, 'Memória'),
(5, 'Tárolók');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `webshop_order`
--

CREATE TABLE `webshop_order` (
  `id` bigint(20) NOT NULL,
  `products` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `address_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `webshop_product`
--

CREATE TABLE `webshop_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `freeze_cost` decimal(20,2) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id_id` bigint(20) NOT NULL,
  `warehouse_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `webshop_product`
--

INSERT INTO `webshop_product` (`id`, `name`, `description`, `freeze_cost`, `price`, `quantity`, `category_id_id`, `warehouse_id_id`) VALUES
(1, 'AMD Ryzen 7 7800X3D', 'Magok száma: 8\r\nSzálak száma: 16\r\nÓrajel: 4200 MHz', 100000.00, 142370.00, 3, 2, 1),
(2, 'AMD Ryzen 5 5600X', 'Magok száma: 8\r\nSzálak száma: 16\r\nÓrajel: 4200 MHz', 30000.00, 56000.00, 5, 2, 1),
(3, 'Intel i5-12400F', 'Magok száma: 6\r\nSzálak száma: 12\r\nÓrajel: 2500 MHz', 30000.00, 53000.00, 3, 2, 1),
(4, 'XFX Radeon Speedster SWFT 319 RX 6800', 'Csatolófelület	PCI-Express\r\nVideo chipset	AMD Radeon\r\nVideo chipset termékcsalád	RX 6800\r\nHűtés típusa	Aktív hűtés\r\nVentilátorok száma	3 darab\r\nGrafikus chip sebessége	2105 MHz\r\nGrafikus memória sebessége	16000 MHz', 150000.00, 201000.00, 3, 1, 1),
(5, 'ASUS Dual GeForce RTX 4060 OC', 'Csatolófelület	PCI-Express\r\nVideo chipset	Nvidia GeForce\r\nVideo chipset termékcsalád	RTX 4060\r\nGrafikus chip sebessége	2535 MHz\r\nGrafikus memória sebessége	17000 MHz\r\nMemória mérete	8 GB\r\nMemória típusa	GDDR6\r\nMemória sávszélesség	128 bit', 100000.00, 138000.00, 1, 1, 1),
(6, 'ASUS GeForce RTX 4070 DUAL', 'Csatolófelület PCI-Express\r\nVideo chipset Nvidia GeForce\r\nVideo chipset termékcsalád RTX 4070\r\nMemória mérete 12 GB\r\nMemória típusa GDDR6\r\nMemória sávszélesség 192 bit', 200000.00, 254000.00, 2, 1, 1),
(7, 'MSI MAG B650 Tomahawk WIFI', 'CPU Foglalat	Socket AM5\r\nChipset	AMD B650\r\nProcesszor gyártó	AMD\r\nMemória típusa	DDR5', 50000.00, 85000.00, 3, 3, 1),
(8, 'MSI MPG B550 GAMING PLUS Alaplap', 'CPU Foglalat	Socket AM4\r\nChipset	AMD B550\r\nProcesszor gyártó	AMD\r\nMemória típusa	DDR4', 30000.00, 50000.00, 2, 3, 1),
(9, 'ASUS TUF GAMING B450M-PLUS II', 'CPU Foglalat	Socket AM4\r\nChipset	AMD B450\r\nProcesszor gyártó	AMD\r\nMemória típusa	DDR4', 15000.00, 33000.00, 2, 3, 1),
(10, 'ASROCK ALAPLAP S1151, MATX', 'Supports 9th and 8th Gen Intel® Core™ Processors (Socket 1151)\r\nSupports DDR4 2666\r\n1 PCIe 3.0 x16, 1 PCIe 2.0 x1\r\nGraphics Output Options: DVI-D, D-Sub\r\n7.1 CH HD Audio (Realtek ALC887/897 Audio Codec)\r\n4 SATA3\r\n4 USB 3.1 Gen1 (2 Front, 2 Rear)', 15000.00, 18000.00, 1, 3, 1),
(11, 'GIGABYTE ALAPLAP S1200 H410M, MATX', 'CPU Foglalat	Socket AM4\r\nChipset	Intel H410 Express Chipset\r\nProcesszor gyártó	Intel\r\nMemória típusa	DDR4', 21000.00, 25000.00, 1, 3, 1),
(12, 'ASUS ALAPLAP TUF GAMING, MATX', 'CPU Foglalat	Socket AM4\r\nChipset	A520\r\nProcesszor gyártó	AMD\r\nMemória típusa	DDR4', 33000.00, 39000.00, 1, 3, 1),
(13, 'INTEL CPU S1200 CELERON', 'Magok száma: 2\r\nSzálak száma: 4\r\nÓrajel: 3500 MHz', 20000.00, 22000.00, 1, 2, 1),
(14, 'INTEL CPU S1200 CORE I5-10400', 'Magok száma: 6\r\nSzálak száma: 6\r\nÓrajel: 2900 MHz', 59000.00, 65000.00, 1, 2, 1),
(15, 'INTEL CPU S1700 CORE I7-14700K', 'Magok száma: 20\r\nSzálak száma: 28\r\nÓrajel: 5500 MHz', 202000.00, 220000.00, 1, 2, 1),
(16, 'ASUS NVIDIA RTX 3050', 'Csatolófelület	PCI-Express\r\nVideo chipset	Nvidia GeForce\r\nVideo chipset termékcsalád	RTX 3050\r\nGrafikus chip sebessége	1535 MHz\r\nGrafikus memória sebessége	14000 MHz\r\nMemória mérete	6 GB\r\nMemória típusa	GDDR6\r\nMemória sávszélesség	96 bit', 81000.00, 90000.00, 1, 1, 1),
(17, 'GIGABYTE NVIDIA RTX 3060', 'Csatolófelület	PCI-Express\r\nVideo chipset	Nvidia GeForce\r\nVideo chipset termékcsalád	RTX 4060\r\nGrafikus chip sebessége	3582 MHz\r\nGrafikus memória sebessége	15000 MHz\r\nMemória mérete	8 GB\r\nMemória típusa	GDDR6\r\nMemória sávszélesség	128 bit', 118000.00, 129000.00, 1, 1, 1),
(18, 'ASROCK AMD RX 7600 PHANTOM GAMING', 'Csatolófelület PCI-Express\r\nVideo chipset AMD Radeon\r\nVideo chipset termékcsalád RX 7600\r\nMemória típusa GDDR6\r\nMemória kapacitás 8 GB\r\nGrafikus chip sebessége 2305 MHz\r\nGrafikus memória sebessége 18000 MHz', 124000.00, 137000.00, 1, 1, 1),
(19, 'KINGMAX CL19', 'Tárolókapacitás 4 GB\r\nMemória órajel 2666\r\nMemória típus DDR4\r\nMemória Tokozás DIMM', 4400.00, 5200.00, 4, 4, 1),
(20, 'KINGSTON CLIENT PREMIER', 'Tárolókapacitás 4 GB\r\nMemória órajel 2666\r\nMemória típus DDR4\r\nMemória Tokozás DIMM', 6900.00, 7700.00, 2, 4, 1),
(21, 'KINGSTON CL11 1RX8', 'Tárolókapacitás 4 GB\r\nMemória órajel 1600\r\nMemória típus DDR3\r\nMemória Tokozás DIMM', 5800.00, 6500.00, 3, 4, 1),
(22, 'KINGMAX CL19', 'Tárolókapacitás 8GB\r\nMemória órajel 2666\r\nMemória típus DDR4\r\nMemória Tokozás DIMM', 8100.00, 9200.00, 8, 4, 1),
(23, 'KINGSTON CLIENT PREMIER SINGLE RANK', 'Tárolókapacitás 16 GB\r\nMemória órajel 3200\r\nMemória típus DDR4\r\nMemória Tokozás DIMM', 15400.00, 17000.00, 6, 4, 1),
(24, 'KINGSTON FURY BEAST', 'Tárolókapacitás 16 GB\r\nMemória órajel 3200\r\nMemória típus DDR4\r\nMemória Tokozás DIMM', 17300.00, 18800.00, 3, 4, 1),
(25, 'SEAGATE 2.5\" HDD SATA-III', 'Csatoló SATA III\r\nFordulatszám 5400\r\nMéret 2.5\"\r\nKapacitás 1TB\r\nPuffer 128 MB', 17720.00, 18670.00, 11, 5, 1),
(26, 'WESTERN DIGITAL 3.5\" HDD SATA-III', 'Csatoló SATA III\r\nFordulatszám 7200\r\nMéret 3.5\"\r\nKapacitás 1TB\r\nPuffer 64 MB', 23600.00, 25100.00, 6, 5, 1),
(27, 'SEAGATE 3.5\" HDD SATA-III IRONWOLF', 'Csatoló SATA III\r\nFordulatszám 5900\r\nMéret 3.5\"\r\nKapacitás 2TB\r\nPuffer 256 MB', 37790.00, 39200.00, 4, 5, 1),
(28, 'KINGMAX 2.5\" SSD SATA3', 'Csatoló SATA III\r\nMéret 2.5\"\r\nKapacitás 120 GB\r\nSzekvenciális Írás 350\r\nSzekvenciális Olvasás 500', 6640.00, 6990.00, 9, 5, 1),
(29, 'HIKSEMI NEO C100', 'Csatoló SATA III\r\nMéret 2.5\"\r\nKapacitás 480 GB\r\nSzekvenciális Írás 470\r\nSzekvenciális Olvasás 550', 1111.11, 12300.00, 3, 5, 1),
(30, 'SAMSUNG SSD 870 EVO', 'Csatoló SATA III\r\nMéret 2.5\"\r\nKapacitás 2 TB\r\nSzekvenciális Írás 530\r\nSzekvenciális Olvasás 560', 77000.00, 82490.00, 2, 5, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `webshop_useraddress`
--

CREATE TABLE `webshop_useraddress` (
  `id` bigint(20) NOT NULL,
  `postal` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `webshop_useraddress`
--

INSERT INTO `webshop_useraddress` (`id`, `postal`, `city`, `address`, `user_id`) VALUES
(2, 4220, 'Hajdúböszörmény', 'Kalvineum Utca\r\n17', 1),
(3, 4220, 'Hajdúböszörmény', 'Kalvineum Utca', 9);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `webshop_warehouse`
--

CREATE TABLE `webshop_warehouse` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `postal` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `webshop_warehouse`
--

INSERT INTO `webshop_warehouse` (`id`, `name`, `postal`, `city`, `address`) VALUES
(1, 'Debreceni Raktár', 4225, 'Debrecen', 'Szent Anna utca 12');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- A tábla indexei `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- A tábla indexei `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- A tábla indexei `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- A tábla indexei `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- A tábla indexei `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- A tábla indexei `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- A tábla indexei `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- A tábla indexei `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- A tábla indexei `webshop_cart`
--
ALTER TABLE `webshop_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `webshop_cart_user_id_4f272746_fk_auth_user_id` (`user_id`),
  ADD KEY `webshop_cart_product_id_73d4b0fc_fk_webshop_product_id` (`product_id`);

--
-- A tábla indexei `webshop_category`
--
ALTER TABLE `webshop_category`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `webshop_order`
--
ALTER TABLE `webshop_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `webshop_order_user_id_c36e4f33_fk_auth_user_id` (`user_id`),
  ADD KEY `webshop_order_address_id_3f4565a3_fk_webshop_useraddress_id` (`address_id`);

--
-- A tábla indexei `webshop_product`
--
ALTER TABLE `webshop_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `webshop_product_category_id_id_05e64a17_fk_webshop_category_id` (`category_id_id`),
  ADD KEY `webshop_product_warehouse_id_id_b4f135f7_fk_webshop_warehouse_id` (`warehouse_id_id`);

--
-- A tábla indexei `webshop_useraddress`
--
ALTER TABLE `webshop_useraddress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `webshop_useraddress_user_id_6bc9e14a_fk_auth_user_id` (`user_id`);

--
-- A tábla indexei `webshop_warehouse`
--
ALTER TABLE `webshop_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT a táblához `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT a táblához `webshop_cart`
--
ALTER TABLE `webshop_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=488;

--
-- AUTO_INCREMENT a táblához `webshop_category`
--
ALTER TABLE `webshop_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `webshop_order`
--
ALTER TABLE `webshop_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT a táblához `webshop_product`
--
ALTER TABLE `webshop_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT a táblához `webshop_useraddress`
--
ALTER TABLE `webshop_useraddress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `webshop_warehouse`
--
ALTER TABLE `webshop_warehouse`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Megkötések a táblához `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Megkötések a táblához `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Megkötések a táblához `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Megkötések a táblához `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Megkötések a táblához `webshop_cart`
--
ALTER TABLE `webshop_cart`
  ADD CONSTRAINT `webshop_cart_product_id_73d4b0fc_fk_webshop_product_id` FOREIGN KEY (`product_id`) REFERENCES `webshop_product` (`id`),
  ADD CONSTRAINT `webshop_cart_user_id_4f272746_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Megkötések a táblához `webshop_order`
--
ALTER TABLE `webshop_order`
  ADD CONSTRAINT `webshop_order_address_id_3f4565a3_fk_webshop_useraddress_id` FOREIGN KEY (`address_id`) REFERENCES `webshop_useraddress` (`id`),
  ADD CONSTRAINT `webshop_order_user_id_c36e4f33_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Megkötések a táblához `webshop_product`
--
ALTER TABLE `webshop_product`
  ADD CONSTRAINT `webshop_product_category_id_id_05e64a17_fk_webshop_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `webshop_category` (`id`),
  ADD CONSTRAINT `webshop_product_warehouse_id_id_b4f135f7_fk_webshop_warehouse_id` FOREIGN KEY (`warehouse_id_id`) REFERENCES `webshop_warehouse` (`id`);

--
-- Megkötések a táblához `webshop_useraddress`
--
ALTER TABLE `webshop_useraddress`
  ADD CONSTRAINT `webshop_useraddress_user_id_6bc9e14a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
