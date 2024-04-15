-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 08. 17:42
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
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add cart', 10, 'add_cart'),
(38, 'Can change cart', 10, 'change_cart'),
(39, 'Can delete cart', 10, 'delete_cart'),
(40, 'Can view cart', 10, 'view_cart');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$ly8WmvEh8wRGw0CULL9fSA$Q0hzHeXKsz2jAreJuecpt24C7uN1naiZSHiMSGjt10E=', '2024-04-08 15:41:01.415325', 1, 'admin', '', '', '', 1, 1, '2024-04-08 15:34:57.442467');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-04-08 15:41:24.926669', '198', 'admin | XFX Radeon Speedster SWFT 319 RX 6800', 1, '[{\"added\": {}}]', 10, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
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
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-08 15:34:08.503853'),
(2, 'auth', '0001_initial', '2024-04-08 15:34:08.847593'),
(3, 'admin', '0001_initial', '2024-04-08 15:34:08.925749'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-08 15:34:08.941408'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-08 15:34:08.941408'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-08 15:34:08.988261'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-08 15:34:09.019587'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-04-08 15:34:09.035139'),
(9, 'auth', '0004_alter_user_username_opts', '2024-04-08 15:34:09.050775'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-04-08 15:34:09.082025'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-04-08 15:34:09.082025'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-08 15:34:09.097641'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-04-08 15:34:09.097641'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-08 15:34:09.113267'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-04-08 15:34:09.128905'),
(16, 'auth', '0011_update_proxy_permissions', '2024-04-08 15:34:09.144535'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-08 15:34:09.144535'),
(18, 'sessions', '0001_initial', '2024-04-08 15:34:09.175765'),
(19, 'webshop', '0001_initial', '2024-04-08 15:34:09.394520'),
(20, 'webshop', '0002_rename_product_id_cart_product_and_more', '2024-04-08 15:34:09.644523');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('b2pcgehi23oldd2iemzydlhs4d0udkhu', '.eJxVjEEOwiAQRe_C2pBhsEBduu8ZyMBMpWpoUtqV8e7apAvd_vfef6lI21ri1mSJE6uLMur0uyXKD6k74DvV26zzXNdlSnpX9EGbHmaW5_Vw_w4KtfKtA44ZONuEDpyVzpIHQSDwGRmtYxrlLD73BAGdEEuPhkwXSDyAiHp_AOk9OEM:1rtr7F:D9qr7O0vpbHVH_9UpzeXjRZi2N6G5lh28M4X4ltATBk', '2024-04-22 15:41:01.417325');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `webshop_cart`
--

CREATE TABLE `webshop_cart` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `webshop_cart`
--

INSERT INTO `webshop_cart` (`id`, `user_id`, `product_id`) VALUES
(198, 1, 4),
(199, 1, 5),
(200, 1, 6),
(201, 1, 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `webshop_category`
--

CREATE TABLE `webshop_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
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
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `freeze_cost` decimal(20,2) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id_id` bigint(20) NOT NULL,
  `warehouse_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `webshop_product`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD KEY `webshop_cart_product_id_73d4b0fc_fk_webshop_product_id` (`product_id`),
  ADD KEY `webshop_cart_user_id_4f272746_fk_auth_user_id` (`user_id`);

--
-- A tábla indexei `webshop_category`
--
ALTER TABLE `webshop_category`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `webshop_product`
--
ALTER TABLE `webshop_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `webshop_product_category_id_id_05e64a17_fk_webshop_category_id` (`category_id_id`),
  ADD KEY `webshop_product_warehouse_id_id_b4f135f7_fk_webshop_warehouse_id` (`warehouse_id_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT a táblához `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `webshop_cart`
--
ALTER TABLE `webshop_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT a táblához `webshop_category`
--
ALTER TABLE `webshop_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `webshop_product`
--
ALTER TABLE `webshop_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- Megkötések a táblához `webshop_product`
--
ALTER TABLE `webshop_product`
  ADD CONSTRAINT `webshop_product_category_id_id_05e64a17_fk_webshop_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `webshop_category` (`id`),
  ADD CONSTRAINT `webshop_product_warehouse_id_id_b4f135f7_fk_webshop_warehouse_id` FOREIGN KEY (`warehouse_id_id`) REFERENCES `webshop_warehouse` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;