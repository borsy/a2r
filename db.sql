-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 08. 17:04
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_group`
--

CREATE TABLE `auth_group` (
  `id` varchar(0) DEFAULT NULL,
  `name` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` varchar(0) DEFAULT NULL,
  `group_id` varchar(0) DEFAULT NULL,
  `permission_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` tinyint(4) DEFAULT NULL,
  `content_type_id` tinyint(4) DEFAULT NULL,
  `codename` varchar(18) DEFAULT NULL,
  `name` varchar(23) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `content_type_id`, `codename`, `name`) VALUES
(1, 1, 'add_logentry', 'Can add log entry'),
(2, 1, 'change_logentry', 'Can change log entry'),
(3, 1, 'delete_logentry', 'Can delete log entry'),
(4, 1, 'view_logentry', 'Can view log entry'),
(5, 2, 'add_permission', 'Can add permission'),
(6, 2, 'change_permission', 'Can change permission'),
(7, 2, 'delete_permission', 'Can delete permission'),
(8, 2, 'view_permission', 'Can view permission'),
(9, 3, 'add_group', 'Can add group'),
(10, 3, 'change_group', 'Can change group'),
(11, 3, 'delete_group', 'Can delete group'),
(12, 3, 'view_group', 'Can view group'),
(13, 4, 'add_user', 'Can add user'),
(14, 4, 'change_user', 'Can change user'),
(15, 4, 'delete_user', 'Can delete user'),
(16, 4, 'view_user', 'Can view user'),
(17, 5, 'add_contenttype', 'Can add content type'),
(18, 5, 'change_contenttype', 'Can change content type'),
(19, 5, 'delete_contenttype', 'Can delete content type'),
(20, 5, 'view_contenttype', 'Can view content type'),
(21, 6, 'add_session', 'Can add session'),
(22, 6, 'change_session', 'Can change session'),
(23, 6, 'delete_session', 'Can delete session'),
(24, 6, 'view_session', 'Can view session'),
(25, 7, 'add_category', 'Can add category'),
(26, 7, 'change_category', 'Can change category'),
(27, 7, 'delete_category', 'Can delete category'),
(28, 7, 'view_category', 'Can view category'),
(29, 8, 'add_warehouse', 'Can add warehouse'),
(30, 8, 'change_warehouse', 'Can change warehouse'),
(31, 8, 'delete_warehouse', 'Can delete warehouse'),
(32, 8, 'view_warehouse', 'Can view warehouse'),
(33, 9, 'add_product', 'Can add product'),
(34, 9, 'change_product', 'Can change product'),
(35, 9, 'delete_product', 'Can delete product'),
(36, 9, 'view_product', 'Can view product'),
(37, 10, 'add_cart', 'Can add cart'),
(38, 10, 'change_cart', 'Can change cart'),
(39, 10, 'delete_cart', 'Can delete cart'),
(40, 10, 'view_cart', 'Can view cart');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_user`
--

CREATE TABLE `auth_user` (
  `id` tinyint(4) DEFAULT NULL,
  `password` varchar(88) DEFAULT NULL,
  `last_login` varchar(10) DEFAULT NULL,
  `is_superuser` tinyint(4) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `last_name` varchar(0) DEFAULT NULL,
  `email` varchar(0) DEFAULT NULL,
  `is_staff` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `date_joined` varchar(10) DEFAULT NULL,
  `first_name` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `first_name`) VALUES
(1, 'pbkdf2_sha256$720000$lXFZj496kSndqwx5O5FW7l$HK71KdTM+105yav6X3ydsaDJyDiOtYStvfFhpz6hfIQ=', '2024-03-30', 1, 'Snewkovits', '', '', 1, 1, '2024-03-27', ''),
(2, 'pbkdf2_sha256$720000$WJjOO1Px1NCIRHimQSJC7p$NExjL8YvfB2xAnoyM/GcF8IpwsfDRDlmLq4+hs05Cyw=', '2024-03-27', 0, 'Betti', '', '', 0, 1, '', ''),
(3, 'pbkdf2_sha256$720000$jBO0sVUMZUA991WO43WLVp$wppZ7tj6tRlfEQk810E77ulJ8Xn2FebQ3VNMBcHR9Dw=', '2024-04-08', 1, 'admin', '', '', 1, 1, '2024-04-08', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` varchar(0) DEFAULT NULL,
  `user_id` varchar(0) DEFAULT NULL,
  `group_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` varchar(0) DEFAULT NULL,
  `user_id` varchar(0) DEFAULT NULL,
  `permission_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` tinyint(4) DEFAULT NULL,
  `object_id` tinyint(4) DEFAULT NULL,
  `object_repr` varchar(42) DEFAULT NULL,
  `action_flag` tinyint(4) DEFAULT NULL,
  `change_message` varchar(42) DEFAULT NULL,
  `content_type_id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `action_time` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`, `action_time`) VALUES
(1, 1, '4225 Szent Anna utca 12 | Debreceni Raktár', 1, '[{\"added\": {}}]', 8, 1, '2024-03-27'),
(2, 1, 'GPU', 1, '[{\"added\": {}}]', 7, 1, '2024-03-27'),
(3, 2, 'CPU', 1, '[{\"added\": {}}]', 7, 1, '2024-03-27'),
(4, 3, 'Alaplap', 1, '[{\"added\": {}}]', 7, 1, '2024-03-27'),
(5, 1, 'AMD Ryzen 7 7800X3D', 1, '[{\"added\": {}}]', 9, 1, '2024-03-27'),
(6, 2, 'AMD Ryzen 5 5600X', 1, '[{\"added\": {}}]', 9, 1, '2024-03-27'),
(7, 3, 'Intel i5-12400F', 1, '[{\"added\": {}}]', 9, 1, '2024-03-27'),
(8, 4, 'XFX Radeon Speedster SWFT 319 RX 6800', 1, '[{\"added\": {}}]', 9, 1, '2024-03-27'),
(9, 5, 'ASUS Dual GeForce RTX 4060 OC', 1, '[{\"added\": {}}]', 9, 1, '2024-03-27'),
(10, 5, 'ASUS Dual GeForce RTX 4060 OC', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 9, 1, '2024-03-27'),
(11, 6, 'ASUS GeForce RTX 4070 DUAL', 1, '[{\"added\": {}}]', 9, 1, '2024-03-27'),
(12, 7, 'MSI MAG B650 Tomahawk WIFI', 1, '[{\"added\": {}}]', 9, 1, '2024-03-27'),
(13, 8, 'MSI MPG B550 GAMING PLUS Alaplap', 1, '[{\"added\": {}}]', 9, 1, '2024-03-27'),
(14, 9, 'ASUS TUF GAMING B450M-PLUS II', 1, '[{\"added\": {}}]', 9, 1, '2024-03-27'),
(15, 9, 'ASUS TUF GAMING B450M-PLUS II', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 9, 1, '2024-03-27'),
(16, 4, 'Teszt', 1, '[{\"added\": {}}]', 7, 1, '2024-03-27'),
(17, 10, 'Ez egy teszt', 1, '[{\"added\": {}}]', 9, 1, '2024-03-27'),
(18, 4, 'Teszt', 3, '', 7, 1, '2024-03-27'),
(19, 2, 'Betti', 1, '[{\"added\": {}}]', 4, 1, '2024-03-27'),
(20, 2, 'Betti', 2, '[]', 4, 1, '2024-03-27');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` tinyint(4) DEFAULT NULL,
  `app_label` varchar(12) DEFAULT NULL,
  `model` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(10, 'webshop', 'cart'),
(7, 'webshop', 'category'),
(9, 'webshop', 'product'),
(8, 'webshop', 'warehouse');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` tinyint(4) DEFAULT NULL,
  `app` varchar(12) DEFAULT NULL,
  `name` varchar(44) DEFAULT NULL,
  `applied` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-27'),
(2, 'auth', '0001_initial', '2024-03-27'),
(3, 'admin', '0001_initial', '2024-03-27'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-03-27'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-27'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-03-27'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-03-27'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-03-27'),
(9, 'auth', '0004_alter_user_username_opts', '2024-03-27'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-03-27'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-03-27'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-03-27'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-03-27'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-03-27'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-03-27'),
(16, 'auth', '0011_update_proxy_permissions', '2024-03-27'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-03-27'),
(18, 'sessions', '0001_initial', '2024-03-27'),
(19, 'webshop', '0001_initial', '2024-03-27'),
(20, 'webshop', '0002_rename_product_id_cart_product_and_more', '2024-03-27');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(32) DEFAULT NULL,
  `session_data` varchar(228) DEFAULT NULL,
  `expire_date` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ub7p3v72naly8dlsycqiaw6e0l8t1gvl', '.eJxVjL0OwiAYAN-F2ZAitICju89Avj-kamhS2sn47oakg653l3urBPtW0t5kTTOrizLq9MsQ6Cm1C35AvS-alrqtM-qe6MM2fVtYXtej_RsUaKVvg2TOINGRcZa89W6KLmZGRgsjZceBgh8ILHjyo0ODlvOZJ_Qog1WfLwojOPY:1rpS6o:KmewLgfdzZx0DRG4lobi6faLDiCYza7aAAEvU6e5zt8', '2024-04-10'),
('9ge1kwglvan9o3cbw9kcuqqpknl5fbjy', '.eJxVjL0OwiAYAN-F2ZAitICju89Avj-kamhS2sn47oakg653l3urBPtW0t5kTTOrizLq9MsQ6Cm1C35AvS-alrqtM-qe6MM2fVtYXtej_RsUaKVvg2TOINGRcZa89W6KLmZGRgsjZceBgh8ILHjyo0ODlvOZJ_Qog1WfLwojOPY:1rpS8k:Em1Xr4N-hAqgH6SVVmnfbZ30os_dAMv1qudk2VAk9Q8', '2024-04-10'),
('yd4pbd960v4w3ca9cn05gj31drvi35z9', '.eJxVjL0OwiAYAN-F2ZAitICju89Avj-kamhS2sn47oakg653l3urBPtW0t5kTTOrizLq9MsQ6Cm1C35AvS-alrqtM-qe6MM2fVtYXtej_RsUaKVvg2TOINGRcZa89W6KLmZGRgsjZceBgh8ILHjyo0ODlvOZJ_Qog1WfLwojOPY:1rqZ4t:QRqaGTHzUIy9-4c_VGfWW2tXuh0h3pocWBPFfj2pUSE', '2024-04-13'),
('qtxbhu3w3lbcr7gxn78krmlkjolbzpmn', '.eJxVjEEOgjAQRe_StWkGhmmrS_ecoZl2poIaSCisjHdXEha6_e-9_zKRt3WIW9UljmIuBs3pd0ucHzrtQO483Wab52ldxmR3xR602n4WfV4P9-9g4Dp8a_BtB0ElNMUjkagTDc4L-sQMgRtCaPHcJQycs6dSGKCQQ5cEGiXz_gDSkDeb:1rtq8J:X9ZV5wg2LBI7mbivrwK4jkpoVwfC5fgdHOLjZ6DkoLA', '2024-04-22');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sqlite_sequence`
--

CREATE TABLE `sqlite_sequence` (
  `name` varchar(19) DEFAULT NULL,
  `seq` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `sqlite_sequence`
--

INSERT INTO `sqlite_sequence` (`name`, `seq`) VALUES
('django_migrations', 20),
('django_admin_log', 20),
('django_content_type', 10),
('auth_permission', 40),
('auth_group', 0),
('auth_user', 3),
('webshop_warehouse', 1),
('webshop_category', 4),
('webshop_product', 10),
('webshop_cart', 203);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `webshop_cart`
--

CREATE TABLE `webshop_cart` (
  `id` smallint(6) DEFAULT NULL,
  `product_id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `webshop_cart`
--

INSERT INTO `webshop_cart` (`id`, `product_id`, `user_id`) VALUES
(189, 4, 1),
(190, 5, 1),
(191, 6, 1),
(192, 5, 1),
(193, 4, 1),
(194, 5, 1),
(195, 6, 1),
(196, 5, 1),
(197, 4, 1),
(198, 4, 3),
(199, 5, 3),
(200, 6, 3),
(201, 7, 3),
(202, 8, 3),
(203, 9, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `webshop_category`
--

CREATE TABLE `webshop_category` (
  `id` tinyint(4) DEFAULT NULL,
  `name` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `webshop_category`
--

INSERT INTO `webshop_category` (`id`, `name`) VALUES
(1, 'GPU'),
(2, 'CPU'),
(3, 'Alaplap');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `webshop_product`
--

CREATE TABLE `webshop_product` (
  `id` tinyint(4) DEFAULT NULL,
  `name` varchar(37) DEFAULT NULL,
  `description` varchar(238) DEFAULT NULL,
  `freeze_cost` mediumint(9) DEFAULT NULL,
  `price` mediumint(9) DEFAULT NULL,
  `quantity` tinyint(4) DEFAULT NULL,
  `category_id_id` tinyint(4) DEFAULT NULL,
  `warehouse_id_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `webshop_product`
--

INSERT INTO `webshop_product` (`id`, `name`, `description`, `freeze_cost`, `price`, `quantity`, `category_id_id`, `warehouse_id_id`) VALUES
(1, 'AMD Ryzen 7 7800X3D', 'Magok száma: 8\r\nSzálak száma: 16\r\nÓrajel: 4200 MHz', 100000, 142370, 3, 2, 1),
(2, 'AMD Ryzen 5 5600X', 'Magok száma: 8\r\nSzálak száma: 16\r\nÓrajel: 4200 MHz', 30000, 56000, 5, 2, 1),
(3, 'Intel i5-12400F', 'Magok száma: 6\r\nSzálak száma: 12\r\nÓrajel: 2500 MHz', 30000, 53000, 3, 2, 1),
(4, 'XFX Radeon Speedster SWFT 319 RX 6800', 'Csatolófelület	PCI-Express\r\nVideo chipset	AMD Radeon\r\nVideo chipset termékcsalád	RX 6800\r\nHűtés típusa	Aktív hűtés\r\nVentilátorok száma	3 darab\r\nGrafikus chip sebessége	2105 MHz\r\nGrafikus memória sebessége	16000 MHz', 150000, 201000, 3, 1, 1),
(5, 'ASUS Dual GeForce RTX 4060 OC', 'Csatolófelület	PCI-Express\r\nVideo chipset	Nvidia GeForce\r\nVideo chipset termékcsalád	RTX 4060\r\nGrafikus chip sebessége	2535 MHz\r\nGrafikus memória sebessége	17000 MHz\r\nMemória mérete	8 GB\r\nMemória típusa	GDDR6\r\nMemória sávszélesség	128 bit', 100000, 138000, 1, 1, 1),
(6, 'ASUS GeForce RTX 4070 DUAL', 'Memória mérete	12 GB\r\nMemória típusa	GDDR6X\r\nMemória sávszélesség	192 bit', 200000, 254000, 2, 1, 1),
(7, 'MSI MAG B650 Tomahawk WIFI', 'CPU Foglalat	Socket AM5\r\nChipset	AMD B650\r\nProcesszor gyártó	AMD\r\nMemória típusa	DDR5', 50000, 85000, 3, 3, 1),
(8, 'MSI MPG B550 GAMING PLUS Alaplap', 'CPU Foglalat	Socket AM4\r\nChipset	AMD B550\r\nProcesszor gyártó	AMD\r\nMemória típusa	DDR4', 30000, 50000, 2, 3, 1),
(9, 'ASUS TUF GAMING B450M-PLUS II', 'CPU Foglalat	Socket AM4\r\nChipset	AMD B450\r\nProcesszor gyártó	AMD\r\nMemória típusa	DDR4', 15000, 33000, 2, 3, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `webshop_warehouse`
--

CREATE TABLE `webshop_warehouse` (
  `id` tinyint(4) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `postal` smallint(6) DEFAULT NULL,
  `city` varchar(8) DEFAULT NULL,
  `address` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `webshop_warehouse`
--

INSERT INTO `webshop_warehouse` (`id`, `name`, `postal`, `city`, `address`) VALUES
(1, 'Debreceni Raktár', 4225, 'Debrecen', 'Szent Anna utca 12');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
