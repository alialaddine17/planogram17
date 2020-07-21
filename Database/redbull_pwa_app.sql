-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 21, 2020 at 04:30 AM
-- Server version: 5.6.47
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `redbull_pwa_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `anouncement`
--

CREATE TABLE `anouncement` (
  `id` int(11) NOT NULL,
  `anouncementTitle_en` varchar(255) DEFAULT NULL,
  `anouncementTitle_ur` varchar(255) DEFAULT NULL,
  `anouncementImg` varchar(255) DEFAULT NULL,
  `description_en` longtext,
  `description_ur` longtext,
  `pdf` varchar(255) DEFAULT NULL,
  `anouncement_pdf_url` varchar(255) DEFAULT NULL,
  `downloadBtnTxt` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `anouncement`
--

INSERT INTO `anouncement` (`id`, `anouncementTitle_en`, `anouncementTitle_ur`, `anouncementImg`, `description_en`, `description_ur`, `pdf`, `anouncement_pdf_url`, `downloadBtnTxt`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'The SugarFree Shopper', 'The SugarFree Shopper', '1591703077.jpg', '<p>Take a quick look at the average Red Bull SugarFree consumer</p>', '<p>Take a quick look at the average Red Bull SugarFree consumer</p>', '1591703077.pdf', 'null', 'Explore', 1, '2020-03-06 05:06:35', '2020-06-09 18:44:37', NULL),
(2, 'The Shelf Essentials', 'The Shelf Essentials', '1591703010.jpg', '<p>Learn how to increase category visibility and stay #1 via shelving!</p>', '<p>Learn how to increase category visibility and stay #1 via shelving!</p>', '1591703010.pdf', 'http://www.africau.edu/images/default/sample.pdf', 'Explore', 1, '2020-03-06 07:00:02', '2020-06-09 18:43:30', NULL),
(3, 'test123', 'test123', '1587377203.png', 'test123', 'test123', '', '', NULL, 1, '2020-04-20 10:06:43', '2020-04-20 10:07:00', '2020-04-20 10:07:00'),
(4, 'The Cashier Opportunity', 'The Cashier Opportunity', '1591702067.jpg', '<p>How can you get the customer&rsquo;s attention right before they make their purchase?</p>', '<p>How can you get the customer&rsquo;s attention right before they make their purchase?</p>', '1591702083.pdf', 'https://www.redbullcarparkdrift.com/about', 'Explore', 1, '2020-04-28 09:52:32', '2020-06-09 18:28:03', NULL),
(5, 'Demo English', 'Demo Urdu', '1588166189.jpg', '<p>Demo English</p>', '<p>Desc Urdu</p>', NULL, '', 'Donwload', 1, '2020-04-29 13:16:29', '2020-04-29 14:10:54', '2020-04-29 14:10:54'),
(6, 'All About Ambient Placement', 'All About Ambient Placement', '1591701979.jpg', '<p>Find out how to influence shopping behavior and interrupt shoppers!</p>', '<p>Find out how to influence shopping behavior and interrupt shoppers!</p>', '1591701979.pdf', '', 'Explore', 1, '2020-06-09 18:26:19', '2020-06-09 18:26:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parentid` int(11) DEFAULT '0' COMMENT '0-Root',
  `title_en` varchar(500) NOT NULL,
  `subTitle_en` varchar(255) DEFAULT NULL,
  `title_ur` varchar(500) NOT NULL,
  `subTitle_ur` varchar(255) DEFAULT NULL,
  `catImg` varchar(255) DEFAULT NULL,
  `catSortOrder` varchar(10) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0=Inactive,1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parentid`, `title_en`, `subTitle_en`, `title_ur`, `subTitle_ur`, `catImg`, `catSortOrder`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'IMPULSE', NULL, 'تسلسل', NULL, '1585919042.png', '1', 1, '2020-02-26 12:58:58', '2020-04-28 10:02:22', NULL),
(2, 1, 'IMPULSE A', '1 SHELF - MAIN PLACEMENT', 'تسلسل A', '1 شیلف - ہاتھ کی جگہ', NULL, NULL, 1, '2020-02-26 13:05:33', '2020-04-28 10:28:06', NULL),
(3, 0, 'C&G', NULL, 'سی اینڈ جی', NULL, '1585927257.png', '2', 1, '2020-02-27 04:59:54', '2020-04-28 10:37:41', NULL),
(4, 0, 'RETAIL', NULL, 'پرچون', NULL, '1585927282.png', '3', 1, '2020-02-27 05:00:13', '2020-04-28 10:37:28', NULL),
(5, 0, 'COOLERS', NULL, 'کا کولرز', NULL, '1585927270.png', '4', 1, '2020-02-27 05:00:34', '2020-04-28 10:36:46', NULL),
(6, 1, 'IMPULSE B', '1 SHELF - MAIN PLACEMENT', 'تسلسل B', '1 شیلف - ہاتھ کی جگہ', NULL, NULL, 1, '2020-02-27 05:01:36', '2020-04-28 10:28:49', NULL),
(7, 1, 'IMPULSE C', '1 SHELF - MAIN PLACEMENT', 'تسلسل C', '1 شیلف - ہاتھ کی جگہ', NULL, NULL, 1, '2020-02-27 05:03:31', '2020-04-28 10:29:18', NULL),
(8, 3, 'C&G', NULL, 'سی اینڈ جی', NULL, NULL, NULL, 1, '2020-02-27 05:04:14', '2020-04-28 10:32:02', NULL),
(9, 3, 'C&G #2', 'CHANNEL PLACEMENT PRIORITIES', 'سی اینڈ جی #2', NULL, NULL, NULL, 1, '2020-02-27 05:04:50', '2020-05-07 13:09:46', NULL),
(10, 4, 'RETAIL 9 FACINGS', NULL, '9 چہرے کو دوبارہ فروخت کریں', NULL, NULL, NULL, 1, '2020-02-27 05:05:35', '2020-04-02 15:17:36', '2020-04-02 15:17:36'),
(11, 4, 'RETAIL 12 FACING', NULL, 'پرچون 12 چہرے', NULL, NULL, NULL, 1, '2020-02-27 05:05:58', '2020-04-02 15:17:41', '2020-04-02 15:17:41'),
(12, 4, 'RETAIL 15 FACING', NULL, 'پرچون 15 چہرے', NULL, NULL, NULL, 1, '2020-02-27 05:06:31', '2020-04-02 15:17:57', '2020-04-02 15:17:57'),
(13, 4, 'RETAIL 18 FACINGS', NULL, 'پرچون 18 چہرے', NULL, NULL, NULL, 1, '2020-02-27 05:07:21', '2020-04-02 15:18:05', '2020-04-02 15:18:05'),
(14, 5, 'BABY COOLER', NULL, 'بچوں کا کولر', NULL, NULL, NULL, 1, '2020-02-27 05:09:14', '2020-04-28 10:43:14', NULL),
(15, 4, 'RETAIL 9 Facings', NULL, 'پرچون 9 اطراف', NULL, NULL, NULL, 1, '2020-04-02 15:18:54', '2020-04-28 10:42:46', NULL),
(16, 5, 'SMALL OPEN FRONT COOLER', NULL, 'سامنے سے کھلا چھوٹا کولر', NULL, NULL, NULL, 1, '2020-04-02 15:31:27', '2020-04-28 10:48:07', NULL),
(17, 5, 'COUNTER TOP COOLER', NULL, 'کاؤنٹر کے اوپر کا کولر', NULL, NULL, NULL, 1, '2020-04-02 15:32:07', '2020-04-28 10:47:53', NULL),
(18, 5, 'OPEN FRONT COOLER', NULL, 'سامنے سے کھلا کولر', NULL, NULL, NULL, 1, '2020-04-02 15:34:33', '2020-04-28 10:47:43', NULL),
(19, 5, 'FAST LANE GLASS DOOR COOLER', NULL, 'تیز لین گلاس شیشہ کے دروازے کا کولر', NULL, NULL, NULL, 1, '2020-04-02 15:35:00', '2020-04-28 10:47:27', NULL),
(20, 5, 'MEGA DOOR COOLER', NULL, 'بڑے دروازے والا کولر', NULL, NULL, NULL, 1, '2020-04-02 15:35:22', '2020-04-28 10:47:14', NULL),
(21, 5, 'SLIM MEGA COOLER', NULL, 'SLIM MEGA COOLER', NULL, NULL, NULL, 1, '2020-04-02 15:35:45', '2020-04-02 15:50:08', '2020-04-02 15:50:08'),
(22, 5, 'SLIM MEGA DOOR COOLER', NULL, 'پتلا بڑے دروازے کا کولر', NULL, NULL, NULL, 1, '2020-04-02 15:36:04', '2020-04-28 10:46:59', NULL),
(23, 5, 'CAN COOLER', NULL, 'کین کولر', NULL, NULL, NULL, 1, '2020-04-02 15:36:34', '2020-04-28 10:45:16', NULL),
(24, 4, 'RETAIL 12 Facings', NULL, 'پرچون 12 طرف', NULL, NULL, '12', 1, '2020-04-17 07:40:23', '2020-04-28 10:41:02', NULL),
(25, 4, 'RETAIL 15 Facings', NULL, 'پرچون 15 طرف', NULL, NULL, '15', 1, '2020-04-17 07:44:05', '2020-04-28 10:40:33', NULL),
(26, 4, 'RETAIL 18 Facings', NULL, 'پرچون 18 طرف', NULL, NULL, '-', 1, '2020-04-17 07:45:10', '2020-04-28 10:40:21', NULL),
(28, 1, 'demo', NULL, 'demo 22', NULL, NULL, '', 1, '2020-04-28 08:28:19', '2020-04-28 08:28:23', '2020-04-28 08:28:23');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `label` varchar(250) NOT NULL,
  `menu_link` varchar(250) DEFAULT NULL,
  `role_ids` varchar(250) DEFAULT NULL,
  `module` int(11) DEFAULT NULL,
  `sequence` tinyint(4) DEFAULT NULL COMMENT 'Manage sequence of menu in admin',
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `label`, `menu_link`, `role_ids`, `module`, `sequence`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dashboard', 'dashboard', '1', 12, 1, 1, '2017-12-14 18:30:00', '2017-12-14 18:30:00', NULL),
(2, 'Roles/Permissions', 'roles', '1', 3, 10, 1, '2017-12-14 18:30:00', '2017-12-14 18:30:00', '2020-02-20 18:30:00'),
(3, 'Content Pages', 'cms.list', '1', 1, 9, 1, '2017-12-14 18:30:00', '2017-12-14 18:30:00', '2017-12-14 18:30:00'),
(4, 'Email Templates', 'emailtemplates.list', '1', 2, 8, 1, '2017-12-14 18:30:00', '2017-12-14 18:30:00', '2017-12-14 18:30:00'),
(5, 'Settings', 'setting', '1', 5, 17, 1, '2017-12-14 18:30:00', '2017-12-14 18:30:00', '2020-02-20 18:30:00'),
(15, 'CMS', 'cms', '1', 1, 15, 1, '2018-10-26 00:00:00', NULL, '2020-01-13 18:30:00'),
(17, 'Categories', 'categories', '1', 10, 2, 1, '2017-12-14 18:30:00', '2017-12-14 18:30:00', NULL),
(18, 'Sub Categories', 'sub-categories', '1', 11, 3, 1, NULL, NULL, NULL),
(19, 'Products', 'products', '1', 13, 5, 1, '2020-02-24 07:05:50', '2020-02-24 07:05:50', NULL),
(20, 'VIP', 'vip', '1', 14, 7, 1, '2020-02-23 18:30:00', NULL, NULL),
(21, 'Anouncement', 'anouncement', '1', 15, 6, 1, '2020-02-24 07:05:50', '2020-02-24 07:05:50', NULL),
(22, 'Vip Setting', 'vip-setting', '1', 16, 4, 1, '2020-02-24 07:05:50', '2020-02-24 07:05:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `label` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `label`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'CMS', 'page', 1, '2017-12-13 18:30:00', '2017-12-13 18:30:00', '2020-01-06 18:30:00'),
(2, 'EMAIL TEMPLATE', 'email', 1, '2017-12-13 18:30:00', '2017-12-13 18:30:00', '2020-01-02 18:30:00'),
(3, 'ROLE / PERMISSIONS', 'role', 1, '2017-12-14 18:30:00', '2017-12-14 18:30:00', NULL),
(4, 'PERMISSION', 'permission', 1, '2017-12-14 18:30:00', '2017-12-14 18:30:00', '2019-12-24 18:30:00'),
(5, 'SETTINGS', 'settings', 1, '2017-12-14 18:30:00', '2017-12-14 18:30:00', NULL),
(10, 'CATEGORIES', 'categories', 1, '2017-12-13 18:30:00', '2017-12-13 18:30:00', NULL),
(11, 'SUB CATEGORIES', 'sub-categories', 1, '2017-12-13 18:30:00', '2017-12-13 18:30:00', NULL),
(12, 'Dashboard', 'dashboard', 1, '2017-12-13 18:30:00', '2017-12-13 18:30:00', NULL),
(13, 'PRODUCTS', 'products', 1, '2020-02-24 07:04:55', '2020-02-24 07:04:55', NULL),
(14, 'VIP', 'vip', 1, '2020-02-23 18:30:00', NULL, NULL),
(15, 'Anouncement', 'anouncement', 1, '2020-02-24 07:04:55', '2020-02-24 07:04:55', NULL),
(16, 'VIP SETTING', 'vip-setting', 1, '2020-02-24 07:04:55', '2020-02-24 07:04:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0013cece147bc5c4f5c670def17acd8cc012afb7a7251389a3bcd331bb37a0642363e88ede5c7ef2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-30 00:05:55', '2019-11-30 00:05:55', '2020-11-30 05:35:55'),
('001d578dfe23a2f1b416f766a38176047760ec379a2cbaa2219b89536179819b60e5b37f7720a309', 1, 11, 'ONCOassist', '[]', 0, '2020-04-21 08:24:21', '2020-04-21 08:24:21', '2021-04-21 08:24:21'),
('004cd9f4a921cebc2579ad6fca8099d6563fa142a7ba67a18fb90b53e12e6fbf29a8262303455ca8', 1, 11, 'ONCOassist', '[]', 0, '2019-11-15 02:13:45', '2019-11-15 02:13:45', '2020-11-15 07:43:45'),
('0058fd7312952e8edeb20005d6d74fbda99862a99c0bddbae93ca33082114f2fc91d8eb3723865fa', 1, 11, 'ONCOassist', '[]', 0, '2018-09-12 17:49:01', '2018-09-12 17:49:01', '2019-09-12 10:49:01'),
('00745c24f2186216aae44df4b93fda135138da03a343314fb9e82110ef3167c776a6ef82a286aa82', 1, 11, 'ONCOassist', '[]', 0, '2019-04-08 09:35:30', '2019-04-08 09:35:30', '2020-04-08 09:35:30'),
('00790cf074ff805ae82ec0990c7567e6d2704d5dee1e24fec7db184d9869a010096941afb1576999', 1, 11, 'ONCOassist', '[]', 0, '2020-01-03 04:45:10', '2020-01-03 04:45:10', '2021-01-03 10:15:10'),
('0092f93c03b678a4202e6b12689a7763fa689e030639b5e8c38b4c2353e1ab78811c1f6bc355e438', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 06:17:42', '2018-06-18 06:17:42', '2019-06-18 11:47:42'),
('00f9eabdaab2e37e66b5283ca7e5546f04748a857437827c63e7db6413b32dbefc1b21a4dd13ece6', 1, 11, 'ONCOassist', '[]', 0, '2019-11-19 08:18:21', '2019-11-19 08:18:21', '2020-11-19 13:48:21'),
('0110fd0d3379416359edefaf70feac7ee25462179536ecfde746febf2918ceae41bb95a761ab6540', 1, 11, 'ONCOassist', '[]', 0, '2020-03-25 07:42:55', '2020-03-25 07:42:55', '2021-03-25 07:42:55'),
('0128da1df767ea4d7968840976b834ce0bd8d94ad64614a8a69edf536822ed81acc3124040ba4bd2', 1, 11, 'ONCOassist', '[]', 0, '2019-04-18 05:57:21', '2019-04-18 05:57:21', '2020-04-18 05:57:21'),
('01434dd571f584d5bd2a8ec58321116076c593f8b56b26ee6fde25547f9b36b106e5cb1a7372643f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 04:02:06', '2019-11-04 04:02:06', '2020-11-04 09:32:06'),
('01688e51edaaeaf7d032cdef827d51530d85d859aab70dc05c967e0106ecf717c795e8c3a0633983', 1, 11, 'AIBotDemo', '[]', 0, '2020-02-20 05:30:26', '2020-02-20 05:30:26', '2021-02-20 11:00:26'),
('016900841b5fb347b6f147702e42cad233512f35a54d29fe8bd21caa787b184d14b80108a0f0be4e', 1, 11, 'ONCOassist', '[]', 0, '2019-05-03 11:50:34', '2019-05-03 11:50:34', '2020-05-03 11:50:34'),
('019fd2336d090d8c93e60ddc04e5c0ad7eb2c56f24f459d00d1a4a5953207cd46cae7598a8582990', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-05 23:44:08', '2020-01-05 23:44:08', '2021-01-06 05:14:08'),
('01b8a15024ab634f73e15b934583a8008c44c796edc824efe607154424e5826d14c1105de903bee3', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 06:52:30', '2019-11-04 06:52:30', '2020-11-04 12:22:30'),
('01ecacb1e677f53cba262f3ddc5ec29f2e0af201645bfec2585014d5599f411c049b8ebee56ad79c', 1, 11, 'ONCOassist', '[]', 0, '2019-01-17 06:01:21', '2019-01-17 06:01:21', '2020-01-17 06:01:21'),
('021ac69c7f563ce2a921f1c017ac24c9010dc6376a8794201058d773245ab76c6fbae5974df7e105', 1, 11, 'ONCOassist', '[]', 0, '2019-10-30 23:08:25', '2019-10-30 23:08:25', '2020-10-31 04:38:25'),
('0238b73e5d223533fcaa9ba360d4659a57e7ac0398642f4337805ed224f98802a9339b9f977e44f0', 1, 11, 'ONCOassist', '[]', 0, '2019-01-11 14:04:08', '2019-01-11 14:04:08', '2020-01-11 14:04:08'),
('02661e54fe88408260f6d602d4f70bc2e5b6c31b876ea87093b18d14d890716396499d639a3ed86d', 1, 11, 'ONCOassist', '[]', 0, '2018-11-23 08:18:06', '2018-11-23 08:18:06', '2019-11-23 08:18:06'),
('027934a80e1a3cefc4c751451136973ad2585019d2509db81a7eb520569c00a4a22e25993dbbd840', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-09 03:18:55', '2020-01-09 03:18:55', '2021-01-09 08:48:55'),
('02933f55899588ae705b8dc9cf4f3063343adf946d7f6a1f4dffe3370c6c547e8b5c2b0565117b4c', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 05:29:52', '2019-11-05 05:29:52', '2020-11-05 10:59:52'),
('02a8ebaf04466c56fcc8a06d1fe76f1bfebec69682a4228d3b687e35a9d6f26add7ebde0c4c79904', 1, 11, 'ONCOassist', '[]', 0, '2018-12-29 08:19:43', '2018-12-29 08:19:43', '2019-12-29 08:19:43'),
('02a9b9bf1a203aeae08c4247a7a0531f0cbbf6b8abb2cd086743b9a4b4c6c72f60d745e1cb3da9d4', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 22:59:40', '2019-11-04 22:59:40', '2020-11-05 04:29:40'),
('02d42a21a62cfa41f6d73f809113869305ac5dbf5becf57c9d0d97008c62d25e247d7ae5e86f4a34', 1, 11, 'ONCOassist', '[]', 0, '2019-01-17 05:32:33', '2019-01-17 05:32:33', '2020-01-17 05:32:33'),
('03170b26243006afa891426e2e5bab7f27325eb891d6bfbc7cb7517b22b9eb669361ab5239baef39', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 05:28:07', '2019-11-22 05:28:07', '2020-11-22 10:58:07'),
('0325c1787e695ac312493a6af3db8fcaedfa705e46912a78390c0b52a344ef87d338bf39cecf1b75', 1, 11, 'ONCOassist', '[]', 0, '2020-04-27 05:20:12', '2020-04-27 05:20:12', '2021-04-27 05:20:12'),
('0329dfff9de7a410629395fa37721b696cebde43388e1a7996f23dc86bfe8aa97804fa7f172f3c06', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 07:49:25', '2020-01-15 07:49:25', '2021-01-15 13:19:25'),
('03b21d19d66bfa792f03ae6623b92727ee140984340dbde6dde6e10b9e3636a4bf08f7e0daa699b5', 1, 11, 'ONCOassist', '[]', 0, '2019-04-09 12:14:58', '2019-04-09 12:14:58', '2020-04-09 12:14:58'),
('03fc01990c30e23965ec68b79f61676a8a2f1425a8c6fb6445f22cfc97952e17c3ff87bf0da73569', 1, 11, 'ONCOassist', '[]', 0, '2018-12-01 05:45:24', '2018-12-01 05:45:24', '2019-12-01 05:45:24'),
('0415c1e967561e4270eb78c779b53d4c3252abc0fce47b545395db99474ea8c1d31df624e095a3d2', 1, 11, 'ONCOassist', '[]', 0, '2019-01-01 07:38:18', '2019-01-01 07:38:18', '2020-01-01 07:38:18'),
('04aad5e8e71e5e5eedccf616d975cc2db3d1aebb4b97ca6e8e2cf688217804be1e58d00179323918', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 05:52:14', '2020-01-16 05:52:14', '2021-01-16 11:22:14'),
('05052987fb50b860a02293e25d321a73f4f421236433e3170579491b7e6649232f81fd7585d9da9f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 04:51:53', '2019-11-04 04:51:53', '2020-11-04 10:21:53'),
('053b0f48af34af23ba30189f79f9ae4f1e402af0beb535c8aaf5f443ae6a27f66d9bab26b1e4424d', 1, 11, 'ONCOassist', '[]', 0, '2019-03-01 09:30:18', '2019-03-01 09:30:18', '2020-03-01 09:30:18'),
('056ea7bd0c279d5aeedff2d048f76b95a27ee6c83fc695c4ab1faefceaa7af590f82b4de4ed69555', 1, 11, 'ONCOassist', '[]', 0, '2019-01-01 12:40:21', '2019-01-01 12:40:21', '2020-01-01 12:40:21'),
('0599c5bb98625b25c10fd6275e0b597ddc2369f66d8ab2c5ead20155442f8532189c7ff5a0bdb6c6', 1, 11, 'ONCOassist', '[]', 0, '2019-06-18 08:10:04', '2019-06-18 08:10:04', '2020-06-18 13:40:04'),
('05a1036b2d7455d3732cdfef2a3b5770ee6e82bca2db4387a98d4c24db37dc0346da0751e0fc3b3f', 1, 11, 'ONCOassist', '[]', 0, '2019-03-29 11:17:37', '2019-03-29 11:17:37', '2020-03-29 11:17:37'),
('05a93e2aa598322be5ea8c022e228a80444e8b21dc38a499cab98f56fa67f7424e91320de7e6845c', 1, 11, 'ONCOassist', '[]', 0, '2018-08-21 09:13:58', '2018-08-21 09:13:58', '2019-08-21 09:13:58'),
('05c20abaab98d275a320c06cf1571a664ae77c2d8f1638b60c147b0f7c1e5c05fb4939f2594542a9', 1, 11, 'ONCOassist', '[]', 0, '2019-11-29 06:53:51', '2019-11-29 06:53:51', '2020-11-29 12:23:51'),
('060227d896547017088e4c130ca27da3a837d5bf549087cb277ec2239063296af93b091c8e68a359', 1, 11, 'ONCOassist', '[]', 0, '2019-04-04 14:00:49', '2019-04-04 14:00:49', '2020-04-04 14:00:49'),
('062372be7f7e10e16245aef5f3935d7c9adca0fb061a6f4b184bfcb419e617b8deb7419f14089d33', 1, 11, 'ONCOassist', '[]', 0, '2019-05-15 23:01:49', '2019-05-15 23:01:49', '2020-05-16 04:31:49'),
('0676f81b1ed21ce9d7fd904060824c8acd08e2f0deb3493b27141e247132b6f32ceab5a81c8dab78', 1, 11, 'ONCOassist', '[]', 0, '2019-07-03 01:14:06', '2019-07-03 01:14:06', '2020-07-03 06:44:06'),
('067f19099a6cae0bc5cb3a65885038de8035a2d4faee73ab4e82d874ca8ba80f44cfe5e931b5b999', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-17 01:03:33', '2020-01-17 01:03:33', '2021-01-17 06:33:33'),
('068bd082313ff8098d2e2574204d5092752930698c399af89f40d327b142f5956cd3da0cfdad5eb7', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 09:45:29', '2019-02-13 09:45:29', '2020-02-13 09:45:29'),
('069e9cf9e32fe372873c139ad3f79a6b37111608bb3381340406569ea2b88cc02a0e4cc4222fc2c3', 1, 11, 'ONCOassist', '[]', 0, '2019-03-08 09:15:15', '2019-03-08 09:15:15', '2020-03-08 09:15:15'),
('06b6e26bff992f04c61fd6d6ab34b0118dc94d9f118e6a2ed554a23fd7bd9206fa880f1e1d5bd67c', 1, 11, 'ONCOassist', '[]', 0, '2019-06-14 06:03:58', '2019-06-14 06:03:58', '2020-06-14 11:33:58'),
('070d8bb0df1efff38832d775f34dc4e2525b78a186b99858231c098f8144c6447ebbcf08023af09b', 1, 11, 'ONCOassist', '[]', 0, '2019-04-15 08:08:06', '2019-04-15 08:08:06', '2020-04-15 08:08:06'),
('0748f3edb8bc1b221dd412e940a357d02b5997ed6a10207fc33caf89cb015abbe9a16a903b0cee0e', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:48:49', '2018-06-18 00:48:49', '2019-06-18 06:18:49'),
('0749743c9174da121529e71113ff1391b7110a31c329721f8a666551b8304305581cd32193974308', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:51:39', '2020-01-15 03:51:39', '2021-01-15 09:21:39'),
('07824f4aa11346ff112751256f751ec1602bb2e1114e21b0909487e305fe19dd57ff729eafb75e87', 1, 11, 'ONCOassist', '[]', 0, '2019-04-03 08:09:19', '2019-04-03 08:09:19', '2020-04-03 08:09:19'),
('07e3dd0bb0d382f52e5a0753da99898d7bca61ea4967d0c2a9c5c065a14c1929f6fdac0306294c73', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 05:22:51', '2020-01-16 05:22:51', '2021-01-16 10:52:51'),
('07e79616356835fb9e8a1dd45c3178697f74cf9d4fcebd77a8a98f27340e1ec19b6bbf02755510e2', 1, 11, 'ONCOassist', '[]', 0, '2018-12-29 06:55:41', '2018-12-29 06:55:41', '2019-12-29 06:55:41'),
('07f2a07a02baf3d77dd0de7f04539146e45b129760c23082fa29543287e66bc2df9b8112cab8b668', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 02:49:10', '2020-01-15 02:49:10', '2021-01-15 08:19:10'),
('07f3caacaf36718411d3d726320343f21a0f1350004ee51fa409fa4ada89a803bf742e18b4b6651d', 1, 11, 'ONCOassist', '[]', 0, '2020-05-07 07:01:12', '2020-05-07 07:01:12', '2021-05-07 07:01:12'),
('086ade1c51f0798a62eb97715ce6b1f65213aeba93f25e3efb853231804c12a2ec65651f4bc6551e', 1, 11, 'ONCOassist', '[]', 0, '2018-09-11 18:03:47', '2018-09-11 18:03:47', '2019-09-11 11:03:47'),
('0878a27d19e5af167d8d2be06af6be922cf6c2e5c587d75d4082b4f9de4da8548575adb2c4e74c7d', 1, 11, 'ONCOassist', '[]', 0, '2018-12-03 10:46:55', '2018-12-03 10:46:55', '2019-12-03 10:46:55'),
('08ceedc0dcccb2fd8f79753fa59706a9e2a3e7238ade387501c0c8a151bcf5c438b79188045fd136', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 12:58:17', '2018-10-30 12:58:17', '2019-10-30 12:58:17'),
('08dcfbb3b0ce3308bfbd2135a0fe47eef53db4763d995b0972f0cfac0f3489c89d7a2b5503e860a2', 1, 11, 'ONCOassist', '[]', 0, '2018-06-19 04:18:29', '2018-06-19 04:18:29', '2019-06-19 09:48:29'),
('0957308eb48ed438f761488fb5d4f8748949c7eac907de82773caa7b51833552cc56cc7342b899f8', 1, 11, 'ONCOassist', '[]', 0, '2019-10-23 00:25:54', '2019-10-23 00:25:54', '2020-10-23 05:55:54'),
('095ee0de530dc7924a20f9828ca454b8e1b4ed7047f358973aad04c60fc382ef2f8966bff2b1b02d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 03:00:14', '2019-11-07 03:00:14', '2020-11-07 08:30:14'),
('0990bef1a316c1459ff6ca9a9bea730d37ace72ad24c77503173b7ea2524d07a89c9e00c0046962a', 1, 11, 'ONCOassist', '[]', 0, '2018-07-30 09:32:18', '2018-07-30 09:32:18', '2019-07-30 09:32:18'),
('0992aae91b9b51bda730c29de2f7f4beaa8cad91d011334986786e7808e8391f61128d9e26808b2e', 1, 11, 'ONCOassist', '[]', 0, '2019-06-03 23:48:14', '2019-06-03 23:48:14', '2020-06-04 05:18:14'),
('09ebf275a1f90bb08437a56fed12ecca2f3baf0be6a89646717432ecd2383da5a631a58c57fd5098', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 11:00:18', '2019-05-09 11:00:18', '2020-05-09 11:00:18'),
('09f999e0ace0d584386866b24bed74bd7517fa09f34852a3d0dd5684b879638b4da14ce5cdb059d8', 1, 11, 'ONCOassist', '[]', 0, '2018-06-27 14:17:53', '2018-06-27 14:17:53', '2019-06-27 07:17:53'),
('0a07598c3832f9906f4e89d29fa3f4980ede66055cb8edaaa0ce4a239201e574dcfa3bc9af60ce55', 1, 11, 'ONCOassist', '[]', 0, '2019-01-14 15:00:12', '2019-01-14 15:00:12', '2020-01-14 15:00:12'),
('0a33a27fc30c5529b181d22217161cbf208e8622da5d37bd2ee96a13d3d98387b3b1bbcca2bdb14a', 1, 11, 'ONCOassist', '[]', 0, '2018-08-07 11:36:04', '2018-08-07 11:36:04', '2019-08-07 11:36:04'),
('0a5537f36fbc9445d04a63e3062cd481cf7477ca6049ca47b024ba01c2954cf0bf297698323f365f', 1, 11, 'ONCOassist', '[]', 0, '2019-03-06 09:15:11', '2019-03-06 09:15:11', '2020-03-06 09:15:11'),
('0aa914af4c809fa7e79d167998b63ebd4d65055be1209c8034595960ce8d632086102602234200ac', 1, 11, 'ONCOassist', '[]', 0, '2018-11-05 07:07:04', '2018-11-05 07:07:04', '2019-11-05 07:07:04'),
('0aac215e2211a4deb3517ac5b04db8b25a71ac07b4a5dbf8ac5b077b2fba9fb119fac7c429ddff62', 1, 11, 'ONCOassist', '[]', 0, '2020-02-26 13:29:24', '2020-02-26 13:29:24', '2021-02-26 13:29:24'),
('0aac638d99071cc133632fa669e89f014c339983165d944e5f5f41c96c2602f0d40b4e79d48bf0bb', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 05:59:01', '2020-01-16 05:59:01', '2021-01-16 11:29:01'),
('0afc1e45e1a041446f9966eaa4f0012c503e32ac1ccb2fc63f02b3d70b0a7281ecfd9566a02b2e2d', 1, 11, 'ONCOassist', '[]', 0, '2020-02-28 08:53:26', '2020-02-28 08:53:26', '2021-02-28 08:53:26'),
('0b0b0449ef160b0e3a732b85d4f12e1b25eff7c373efcda53ea5a986093e150ca84ce8a4a6c542bf', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:08:00', '2020-01-15 03:08:00', '2021-01-15 08:38:00'),
('0b222e87e18c441bf3827a0ddbb9e148fe499a36b85e971594bc7fc0d9c022b945ee904595f6e712', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 14:39:36', '2019-05-09 14:39:36', '2020-05-09 14:39:36'),
('0b2cc34bdd9d5d59c01f07aa7073976399046a96601427384e0a247e0a28c8ebf59ded673660dfc0', 1, 11, 'ONCOassist', '[]', 0, '2019-03-21 18:34:05', '2019-03-21 18:34:05', '2020-03-21 18:34:05'),
('0b62167b0693d37be55473f5056bffbda518d01437ac1cd73f29dc89a135ec4844b7f15ff4534e58', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 12:07:40', '2019-02-12 12:07:40', '2020-02-12 12:07:40'),
('0b64beb09ed79887834c6861b68f6109dd7c4b6bbc3ef035383fab698a17f95351fcd49ea2c6c5dc', 1, 11, 'ONCOassist', '[]', 0, '2018-11-01 11:20:10', '2018-11-01 11:20:10', '2019-11-01 11:20:10'),
('0b6f57d8bba976acc2030b6d29c2cf7d53354b702e2dfc577ae4a5c16175bcdb09475dd9fd057727', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:29:14', '2020-01-17 00:29:14', '2021-01-17 05:59:14'),
('0b6fde899c2e27f21a9e63a50558fd5d976cf6b3bbbfcf1a3a883112874827e26c01abb8c4e0bd6e', 1, 11, 'ONCOassist', '[]', 0, '2020-04-29 12:44:10', '2020-04-29 12:44:10', '2021-04-29 12:44:10'),
('0b73d2e68654f49bbb70c41fe041eb8e1ad1eda3ee4a65be08b47a44dd2eb597fc0ed82ca93ff249', 1, 11, 'ONCOassist', '[]', 0, '2018-07-13 06:00:29', '2018-07-13 06:00:29', '2019-07-13 06:00:29'),
('0b8fe55fc5a76ce2f71406b026783e6fdd84cb15f51ce96eb2b0a0ba6658f6ce09949eddd29ae47f', 1, 11, 'ONCOassist', '[]', 0, '2019-04-01 16:30:12', '2019-04-01 16:30:12', '2020-04-01 16:30:12'),
('0bb7fb2a8344bfde09849b1b692f2d15b7125861397ad13518da294fad28abb4d00923065c6331cf', 1, 11, 'ONCOassist', '[]', 0, '2018-11-05 11:08:58', '2018-11-05 11:08:58', '2019-11-05 11:08:58'),
('0bcfd05abc2a5bcf0cb03cf33cf2b1756b4e9bd19e1564aaef4c90903819a04442aeb6be006a9625', 1, 11, 'ONCOassist', '[]', 0, '2020-03-19 14:32:30', '2020-03-19 14:32:30', '2021-03-19 14:32:30'),
('0bd6f4d7058452474fe042ed13fc0aa9aa516c6cdb6efb39fa98e9ad789fd963cde41f29cac2c10d', 1, 11, 'ONCOassist', '[]', 0, '2018-11-28 11:53:21', '2018-11-28 11:53:21', '2019-11-28 11:53:21'),
('0bfe90cefd181330c74c6626e0828032d51089dc58b96fa7c5012efdd9879e30305ec2d9e936ab97', 1, 9, 'ONCOassist', '[]', 0, '2018-06-17 23:17:52', '2018-06-17 23:17:52', '2019-06-18 04:47:52'),
('0c063bb94ccff7e77ee95cca4a7b136a424a9a1cd290ee29f8b2342df28cfe3755d5df912bc83167', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 05:10:08', '2019-02-13 05:10:08', '2020-02-13 05:10:08'),
('0c0e88d8a586ba42704d12d887a5a6b4d31fd404364b27b45b92672e52591ee5e105e9ef8b9cfa91', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-03 08:45:19', '2020-01-03 08:45:19', '2021-01-03 14:15:19'),
('0c431d319720766dd990a9ba5dd2260677a5fd71e4630cf445b4e075e3ae7a8c7b485ecb5097ddcc', 1, 11, 'ONCOassist', '[]', 0, '2020-03-04 08:54:33', '2020-03-04 08:54:33', '2021-03-04 08:54:33'),
('0c91f1f971934e6f1c05b163ec15d6bc45b3d6ec2087c8ff0c222d6b938960e46018c99934fca513', 1, 11, 'ONCOassist', '[]', 0, '2018-12-29 08:09:02', '2018-12-29 08:09:02', '2019-12-29 08:09:02'),
('0cb294d2a860281520a99c17c400e647b19806237da4e71fe7c82cabe44ca3d62f43b12251dcc829', 1, 11, 'ONCOassist', '[]', 0, '2019-04-24 06:40:29', '2019-04-24 06:40:29', '2020-04-24 06:40:29'),
('0cf70787d2214a2f4a044f34473e61b632b42e955f3ecc842420162cf2a42f4dd16eafcf3f7416a9', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:50:36', '2020-01-15 03:50:36', '2021-01-15 09:20:36'),
('0d0839c189745a3a24d81061c2038d6284abb2e0c48ec2bf3a06c571e7cb9afe72093ef018612b27', 1, 11, 'ONCOassist', '[]', 0, '2020-02-21 04:40:32', '2020-02-21 04:40:32', '2021-02-21 10:10:32'),
('0d2aeb8d1ab3c0e51fcf196ba0e8e76c86815f895d36c2f41141ce6869c47b40f6d017e16d600cc3', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 10:27:18', '2019-05-09 10:27:18', '2020-05-09 10:27:18'),
('0d2b81ab943b78570c8969288673023fbace51d6ac3d55aeda965f82fa65bad2be01c5453b73b254', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 02:51:23', '2019-11-04 02:51:23', '2020-11-04 08:21:23'),
('0d92d3a4e4fcf6602d9729990437ea842903a5fde7860c74023a794ef119944e410784cc81b97c7c', 1, 11, 'ONCOassist', '[]', 0, '2019-02-18 10:13:05', '2019-02-18 10:13:05', '2020-02-18 10:13:05'),
('0dbd6882a6a3ec7d14f6c20a853c3340211e665092ab134405851253f93769e7c072abafbbece127', 1, 11, 'ONCOassist', '[]', 0, '2019-06-28 04:46:26', '2019-06-28 04:46:26', '2020-06-28 10:16:26'),
('0dc2b87c7827c5b3ae4a2981bae4a9a11b197f7b477bdc1611133448dc5d907d8eb284e7cbbec238', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 12:33:50', '2020-04-20 12:33:50', '2021-04-20 12:33:50'),
('0e1a1d24475df9b69577ceb0ae521d9ee4b199465518dbd521800ddccba287abb022d454a1f4e5cb', 1, 11, 'ONCOassist', '[]', 0, '2019-01-29 10:24:06', '2019-01-29 10:24:06', '2020-01-29 10:24:06'),
('0e44bea0a89472344759350087da901e00e16b3fd53c7c54d6e420f6c1c9d8dadf98092ca508895e', 1, 11, 'ONCOassist', '[]', 0, '2019-10-30 23:23:54', '2019-10-30 23:23:54', '2020-10-31 04:53:54'),
('0e5493d99a0deda86cbf86926e9f03cebf430f1dc46e111bd8ba125d9f762da379553bec77c1007d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-25 07:31:36', '2019-11-25 07:31:36', '2020-11-25 13:01:36'),
('0e5baad4daab24c259b9b51b9324d577ed7e4f7064a116693f887c931e29c3e78731e492cb3744ac', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-06 07:28:36', '2020-01-06 07:28:36', '2021-01-06 12:58:36'),
('0e6c9efa8caeb88e1bbd5eb06f9c98573a876ffa3898b4e0b8086995f642f786dcd3a0baf749e4d0', 1, 11, 'ONCOassist', '[]', 0, '2019-11-15 02:22:43', '2019-11-15 02:22:43', '2020-11-15 07:52:43'),
('0e7508a71926d2404edb46bac02a50419b41878851a1411fb8b6b14f73740077cc1682d21cd7bd3b', 1, 11, 'ONCOassist', '[]', 0, '2019-05-16 00:27:08', '2019-05-16 00:27:08', '2020-05-16 05:57:08'),
('0e8b03bf50d948493ff8776f98746f828128c90bfc58884299218f509226743affc083714f791e39', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-10 07:26:42', '2020-01-10 07:26:42', '2021-01-10 12:56:42'),
('0ebbf562924e5db5c70a46eab6f2d2e690f5f99fa114d4c1ad89fb2a2b091340bc832be1aade2957', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 08:58:14', '2019-05-09 08:58:14', '2020-05-09 08:58:14'),
('0edd7e6403cf9e71820f72a1cd874662737aba1544f1a5df4f31af50d57def604e052e8a8483488b', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 07:48:42', '2020-04-20 07:48:42', '2021-04-20 07:48:42'),
('0eed46aa0183f60924b1fd8ce1ccbd4a0b30e26cdfebdc9257f5fd0122877f55fce81cc81ad5bb81', 1, 11, 'ONCOassist', '[]', 0, '2019-03-21 09:10:59', '2019-03-21 09:10:59', '2020-03-21 09:10:59'),
('0f19a5b4267eb9ec6cdf5ecb8eae84dd7c95d4437c52245b7be357d5a19205148b05fd20784090bc', 1, 11, 'ONCOassist', '[]', 0, '2019-07-26 02:25:52', '2019-07-26 02:25:52', '2020-07-26 07:55:52'),
('0f24c05e9144ea35e8e9cc950656100923d27092b9a46d2159da44308d8b31b5d0e71e9a7e1cdb86', 1, 11, 'ONCOassist', '[]', 0, '2019-07-16 05:41:45', '2019-07-16 05:41:45', '2020-07-16 11:11:45'),
('0f46b737d5d94cbd5db18ba1bf58b58df0ae6ec9e3365cd4c02f1ccc38bc4962c1cb6ab8670a9128', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-13 07:32:48', '2020-01-13 07:32:48', '2021-01-13 13:02:48'),
('0f6077aeb086cc647945d9db0950a84642478117e6d9d9ce7cb43388093414010aaf17e7fbf009d2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-13 23:08:05', '2019-11-13 23:08:05', '2020-11-14 04:38:05'),
('0f7ef3b27d7a074c582e9441bc0e8c20d856ee9b952a8bc3b8910bbe102f643651931f3f3fbcab35', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 15:22:07', '2019-05-09 15:22:07', '2020-05-09 15:22:07'),
('0f93dc782a2466401d62f33e37d53faef6457a3c7a5a8e392cc54627dc75a2f6848b7e6cffbda67e', 1, 11, 'ONCOassist', '[]', 0, '2018-09-06 11:38:19', '2018-09-06 11:38:19', '2019-09-06 04:38:19'),
('0fae4284773e44b9a1d1d00d3e0fc98bf297db3021cdd909285c0109006ac70d65f34fbe08f039cc', 1, 11, 'ONCOassist', '[]', 0, '2019-10-29 23:39:56', '2019-10-29 23:39:56', '2020-10-30 05:09:56'),
('0fbccdaa8bc9efd4ddb0df19b9682b9a44f15935490ebb45d9262039c9ddb7ffa4d71136704a5f4c', 1, 11, 'ONCOassist', '[]', 0, '2019-02-04 14:45:30', '2019-02-04 14:45:30', '2020-02-04 14:45:30'),
('0fc0f68060e0f095f43aba2c2dddc304c111168fa30ed44cfa474d65731a489114d5e95f7739a576', 1, 11, 'ONCOassist', '[]', 0, '2018-11-28 13:07:59', '2018-11-28 13:07:59', '2019-11-28 13:07:59'),
('0fd2d32d8cf01e46db890361a63034c346516c5aead604a8fcad08b550e6eb92d12929616a9f89a5', 1, 11, 'ONCOassist', '[]', 0, '2019-02-01 05:17:22', '2019-02-01 05:17:22', '2020-02-01 05:17:22'),
('0ffa26af31fec5a1bf352b51d1023c116460b17ce51ec45fb5a01a8a180187f241b8e09127534add', 1, 11, 'ONCOassist', '[]', 0, '2020-03-05 13:57:06', '2020-03-05 13:57:06', '2021-03-05 13:57:06'),
('1004fce19ace89a117d1687be53b9c119857b97023254bdbd113ac70f68c299255c7e3c27462b94a', 1, 5, 'ONCOassist', '[]', 0, '2018-05-28 23:55:37', '2018-05-28 23:55:37', '2019-05-29 05:25:37'),
('1016707759f6da895deae18650d9fbe866736016c32cdbbe30a68bb339688f8c06ae88d76725da31', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 06:12:35', '2019-11-21 06:12:35', '2020-11-21 11:42:35'),
('104bcc31fa33a94cd5f8b539f326827d5c9b750ed142f63adea137bb7a7f988f6662c0a60209608e', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 11:04:58', '2018-12-04 11:04:58', '2019-12-04 11:04:58'),
('105d9f473a2336c50b8afaf2e40ca99c8b0469443cd1d258ba6a38422454d6a0b9898c3ad679bb3d', 1, 11, 'ONCOassist', '[]', 0, '2018-12-19 07:19:53', '2018-12-19 07:19:53', '2019-12-19 07:19:53'),
('10c72d2b4e40b38bbc8865fdc6be2e310c7e228e2fbbc6886e043e83be9389490ee4966b96e56289', 1, 11, 'ONCOassist', '[]', 0, '2019-01-31 06:48:20', '2019-01-31 06:48:20', '2020-01-31 06:48:20'),
('11220eb11747c574426dfaed8b181403956eb4626846bcc8789cbc8c634e913fe496f03fecbc68b1', 1, 11, 'ONCOassist', '[]', 0, '2020-03-18 06:12:17', '2020-03-18 06:12:17', '2021-03-18 06:12:17'),
('113594e1a896f58ae6e11090cdb3b530c90f6bd45f890e48d155d8b97cb7fe7afc55f181c917b172', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 10:52:10', '2018-10-29 10:52:10', '2019-10-29 10:52:10'),
('115c2a01d240dd1bf53b65308cdbc6cbf45e798ea9eb2187e7cb5057d27fa4104a38bd1c749be6ff', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 07:13:36', '2019-11-21 07:13:36', '2020-11-21 12:43:36'),
('116c6ea424d0e452ec14c720eb20c0d871f1248a1e0cfd995017d4cfb0983711a2e1836f577b6689', 1, 11, 'ONCOassist', '[]', 0, '2019-05-28 00:17:08', '2019-05-28 00:17:08', '2020-05-28 05:47:08'),
('11729c31067b7d170e7c6791befa2a31d462d7157d8dd8907c1de0a619aca7ba77c0f31c9fa531a1', 1, 11, 'ONCOassist', '[]', 0, '2020-05-04 08:44:52', '2020-05-04 08:44:52', '2021-05-04 08:44:52'),
('11b876be0547600c0b1733642919d3799a2d0bbff3b11c3dc32d8e65901ea60f7618a668db5b0347', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 13:09:13', '2018-10-30 13:09:13', '2019-10-30 13:09:13'),
('11d180cc969521cb1f364851ca60a1b0e6a056b86175df6063ea699796d9a6637d98a0cc28b0092b', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-09 03:35:58', '2020-01-09 03:35:58', '2021-01-09 09:05:58'),
('11d9e365711bba8626f262a2ea0dea8cc245af70b3ac15539da60d545ab3ec84c0e7863ace7744d6', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 08:32:34', '2019-11-08 08:32:34', '2020-11-08 14:02:34'),
('1273d2224a214fa2cf75bd0102554c47a1895adb45e89eb1e75ec1a3af38b90ed258dbd9196925b0', 1, 11, 'ONCOassist', '[]', 0, '2019-06-13 03:16:18', '2019-06-13 03:16:18', '2020-06-13 08:46:18'),
('12f28fe52096357a586f05442b43dd0ecbeb831222ef564c3a82f4d4dd14b754e65ccf6deb6ce547', 1, 11, 'ONCOassist', '[]', 0, '2019-07-25 02:08:40', '2019-07-25 02:08:40', '2020-07-25 07:38:40'),
('1321876fa997702032d3b80aa6a28334a130e529a98443639cb5d4200904be52198d60a04f20172f', 1, 11, 'ONCOassist', '[]', 0, '2018-11-23 08:29:47', '2018-11-23 08:29:47', '2019-11-23 08:29:47'),
('13425bed25c769de19aa9e3bcc929142689e83317d5cf3cd5d1e3b228202511036e6ed0dda3a1aef', 1, 11, 'ONCOassist', '[]', 0, '2020-03-19 12:21:28', '2020-03-19 12:21:28', '2021-03-19 12:21:28'),
('137eace83170149df8376bf1d05b5f0ae9a9d406f3a7b2d6cc5c64d416da084a9f20e0ccc3af26eb', 1, 11, 'ONCOassist', '[]', 0, '2018-12-05 08:16:16', '2018-12-05 08:16:16', '2019-12-05 08:16:16'),
('13966691fd02f0ccf1d6aa79cf01c8a4bf52ee3ec0ee23f057441bc7279e136445dfbc2de287e9da', 1, 11, 'ONCOassist', '[]', 0, '2019-04-04 09:34:13', '2019-04-04 09:34:13', '2020-04-04 09:34:13'),
('13c470b876ae6ee0335738984967aa8139e09cb137ca4b97d9bb00b9f2cd71bdb3108d2a1c4a3f81', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 07:00:18', '2019-02-13 07:00:18', '2020-02-13 07:00:18'),
('13df25cdabed2c6a039b60c24a8ff3f2c5dfa4add6ab231121d439e1e50f813fea1fd59a5a7ce74a', 1, 11, 'ONCOassist', '[]', 0, '2018-07-03 18:48:51', '2018-07-03 18:48:51', '2019-07-03 11:48:51'),
('13f56ba5f8b5b3e81969fa2c7c2f32acbc6966f763044726a9af3a1079836a8399871f468b50ef7b', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 03:22:19', '2020-01-09 03:22:19', '2021-01-09 08:52:19'),
('13f7f17fccfd6ca5d811c423cd619beca67879df4671b2280992d3487d0685b21925d07f8bddd8b6', 1, 11, 'ONCOassist', '[]', 0, '2019-05-13 08:07:44', '2019-05-13 08:07:44', '2020-05-13 08:07:44'),
('14180cc7564f92910d94d49ed6dce4a6aae3fd743303832cea14444d0c2c56851bd64db8e648d033', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 02:57:05', '2019-11-05 02:57:05', '2020-11-05 08:27:05'),
('141ec562daa427e1583b3e59079453f578accf83ad51b401944f73f59ceec7f707867fa60c61abc4', 1, 11, 'ONCOassist', '[]', 0, '2020-03-30 15:08:34', '2020-03-30 15:08:34', '2021-03-30 15:08:34'),
('14347b7fcab5add907c8bd116365b846640ca83cdf33507af3d1fcc1556768014041398ff00f936c', 1, 11, 'ONCOassist', '[]', 0, '2019-04-03 18:24:51', '2019-04-03 18:24:51', '2020-04-03 18:24:51'),
('14572652e85a4a4469c8a715898ddcbbedb74630cd77a5d74f2b4c1347782128f6cd859eaf1d78b4', 1, 11, 'ONCOassist', '[]', 0, '2019-05-15 06:49:22', '2019-05-15 06:49:22', '2020-05-15 12:19:22'),
('1484531219b0501afb7361d01a0b4df3545dc5045ff9effb1399f7f2c05a08288559ef9703af8eb9', 1, 11, 'ONCOassist', '[]', 0, '2019-04-30 11:38:17', '2019-04-30 11:38:17', '2020-04-30 11:38:17'),
('14b8b13b0b1ca1e66136028a3f07d5383d9609e685766a57f72b7b05c4f5e5f9446eb253120210df', 1, 11, 'ONCOassist', '[]', 0, '2018-11-23 09:10:04', '2018-11-23 09:10:04', '2019-11-23 09:10:04'),
('14b94f2b7aaed53b815d1164f497673cc9997aab2592ab95e6c4da5bd9bf03ec988104e180ce21c0', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 03:47:01', '2019-11-08 03:47:01', '2020-11-08 09:17:01'),
('14c05a1d48c6fe941043821c8f90bc750f21a62ab0865392db385815aa173cbe868608b845fb257b', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 07:47:06', '2019-11-08 07:47:06', '2020-11-08 13:17:06'),
('14ff0311bb58ef45d7a461145edd13339b6f7037ea87c7bc9c7a34dfc38238a7fd1940fdcf8e9ca9', 1, 11, 'ONCOassist', '[]', 0, '2018-10-26 13:30:08', '2018-10-26 13:30:08', '2019-10-26 13:30:08'),
('15130fe76ad76552fda96babb5702ae78834b298a7566a9a9e099f859c160dfcd30de44f61b1457b', 1, 11, 'ONCOassist', '[]', 0, '2018-07-09 10:24:14', '2018-07-09 10:24:14', '2019-07-09 10:24:14'),
('15186d63265666f8260cf000e69b4f6f4045bb189a185cf5781b95175120d5cae6d5fcc0964c63b3', 1, 11, 'ONCOassist', '[]', 0, '2018-06-19 23:22:36', '2018-06-19 23:22:36', '2019-06-20 04:52:36'),
('1538e3eeba939eab1b6cb94ed9e6e2b640d0eb667e0d35ecaeebf26fe07c1e2b78fab4a64f233a04', 1, 11, 'ONCOassist', '[]', 0, '2019-01-16 11:29:23', '2019-01-16 11:29:23', '2020-01-16 11:29:23'),
('1552e6e70de8e2b6723ea654389d0db8991700afe1d1d0229248ee87f261290cdb954ad52373174b', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-12 23:19:28', '2020-01-12 23:19:28', '2021-01-13 04:49:28'),
('15551045445c64a617b1ae51308ec2a3552582d4a93cfc323a97bafb78b4a13fa17d671804640bbf', 1, 11, 'ONCOassist', '[]', 0, '2019-01-18 12:25:13', '2019-01-18 12:25:13', '2020-01-18 12:25:13'),
('155ca8f8707a75d3f7d3b3cf7aadfe523ebc732ae7d84c9b08501ead240d4d2b04ffdd9f0ce098a9', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 01:29:48', '2020-01-09 01:29:48', '2021-01-09 06:59:48'),
('15626a5c8dd6fb265a9a09f636d4d52143e4ea3ec435defee4313f7df0fa7b230ce14283d570c2c2', 1, 11, 'ONCOassist', '[]', 0, '2019-02-08 08:26:13', '2019-02-08 08:26:13', '2020-02-08 08:26:13'),
('156e1d7eecd9b48e6605ba53a090a5f65e17de75587f4083a90ab473fb46090e7b6d0c5d7497f2a7', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-03 08:43:12', '2020-01-03 08:43:12', '2021-01-03 14:13:12'),
('15a0ab19b396b862190b5e0598ffb15e6e4287ddd9cc107883ca88d14c304b409097ad5cc6e620d7', 4, 11, 'ONCOassist', '[]', 0, '2020-01-03 08:40:31', '2020-01-03 08:40:31', '2021-01-03 14:10:31'),
('15b1461874344d538bc5eaad727b3dafd0d270ee48a4e788ad19770a8820c18f4a572b0eddcc4632', 1, 11, 'ONCOassist', '[]', 0, '2019-11-26 07:30:50', '2019-11-26 07:30:50', '2020-11-26 13:00:50'),
('15da3c35024c40fe74d9c435b69617061065c0a05a0db79912fcd3171a748dee79980be795d0adcc', 1, 11, 'ONCOassist', '[]', 0, '2018-11-14 04:51:27', '2018-11-14 04:51:27', '2019-11-14 04:51:27'),
('15fa493b923c68682294cf85565199d52d6e2440e9e0469d5170d735c9a060e9ff8532eaec78b094', 1, 11, 'ONCOassist', '[]', 0, '2020-05-12 06:12:13', '2020-05-12 06:12:13', '2021-05-12 06:12:13'),
('1662480918ccc7599a42afaa4a68bbba2afbefc19735ecf3ef0854b6df1217b1149e6ae604749d3e', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-03 08:43:19', '2020-01-03 08:43:19', '2021-01-03 14:13:19'),
('1697870f92486f5732f2556b83ae98bed47ab5dfb11cfd01e7ce4d229f4e1bc1b324081c7d9bc0d2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-11 03:45:35', '2019-11-11 03:45:35', '2020-11-11 09:15:35'),
('16ba35eb6c8e699b82d60c6f3102bd475cb44a72bdcd2fe6024b40cea7a7b9ce9839b4a0ec6e50d5', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 03:21:30', '2020-01-16 03:21:30', '2021-01-16 08:51:30'),
('16dc6b424d5dd3e728d186b31ac8e70bbd18bf8fb21db73d5490dfe0ee01bc7bd8f8652d4bc812c6', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 10:02:22', '2019-02-13 10:02:22', '2020-02-13 10:02:22'),
('170c8ee60b5f9aaff40bc9291cea3ddf73df6425472d306f59a0189784ea1a07a3bc292458e78c95', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-10 07:09:46', '2020-01-10 07:09:46', '2021-01-10 12:39:46'),
('171b8be60080f611b0c5cf80991884284b7cc7916238427ba422af6a37ee736636df3652caee7467', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:12:57', '2019-11-22 00:12:57', '2020-11-22 05:42:57'),
('1752c385b63d0e60c75cd2c3f834d23f8f99e54a8517f88f111d7f19e27f53a3308b6c258cf19d5c', 1, 11, 'ONCOassist', '[]', 0, '2019-02-15 10:14:59', '2019-02-15 10:14:59', '2020-02-15 10:14:59'),
('176c15c2bfd49c0f7de8fc7208a8b45dfd3b9c32dcf5589d21ad0256fb83ddcc134e4277522f62bd', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 02:10:30', '2019-11-08 02:10:30', '2020-11-08 07:40:30'),
('179d022fc6ab03d0ffd1d04e1a0e1179ed2f23b5045db81a73a5c1592ff056eb9f8da9d26e612984', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 01:44:34', '2019-11-08 01:44:34', '2020-11-08 07:14:34'),
('17e591615ccea0ef79830c3ac5a7f6c4341e7b39b7f7e7b9bd271ed786302064031f964b8aef0815', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:10:16', '2020-01-15 03:10:16', '2021-01-15 08:40:16'),
('181023ce3ae7bbdba70a6755753b641b7a7c9fe11420c59db2f90a74a5612037bf1423b3b5352d1a', 1, 11, 'ONCOassist', '[]', 0, '2019-02-18 11:26:06', '2019-02-18 11:26:06', '2020-02-18 11:26:06'),
('1811ce89761266a05bd131d875376e9c14df403fcff7ff1016856000ec49f06f341a1eb52b053f64', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:01:58', '2020-01-15 03:01:58', '2021-01-15 08:31:58'),
('181542edba6216c3e1479736448810de00bbb7e2f7dbafa6b54ddb55c694ea2ce15c51fc2512ca40', 1, 11, 'ONCOassist', '[]', 0, '2019-11-15 05:38:41', '2019-11-15 05:38:41', '2020-11-15 11:08:41'),
('1815d9be82ec10932efd1990218119e9068c48d5f9e159a03e0ed0ecde627cae3e29405bb775d7a7', 1, 11, 'ONCOassist', '[]', 0, '2018-11-20 05:59:26', '2018-11-20 05:59:26', '2019-11-20 05:59:26'),
('1828f631b5ba0a165ecdd09f589b2eb7ff2f3602896515d432ee2bcd59a3b15fc6551e8d6fa0b284', 1, 11, 'ONCOassist', '[]', 0, '2019-04-25 06:11:34', '2019-04-25 06:11:34', '2020-04-25 06:11:34'),
('183e8bfc6061b55ac5a33726b3ee585b6b47c7a3010ca4ff8fbe5f2175b43a9c685784520facef9e', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 01:51:34', '2019-11-06 01:51:34', '2020-11-06 07:21:34'),
('18485fb91e96020a787398457061a0e6f46ba5b382ec4d34ee78b70bf9e4a988d371b8fcb08b8514', 1, 11, 'ONCOassist', '[]', 0, '2019-02-20 11:27:49', '2019-02-20 11:27:49', '2020-02-20 11:27:49'),
('185f9febdc9ecddfd7109a0660eb7fbbe997c62d816af44864b8825654ca9aabbefee69c0a49acc3', 1, 11, 'ONCOassist', '[]', 0, '2019-07-16 02:29:18', '2019-07-16 02:29:18', '2020-07-16 07:59:18'),
('1864956bd3b40fadddfa5ba4ac44dadd20fc1b29b5d871608a1ec1cc65381fe981fecc72779a2485', 1, 11, 'ONCOassist', '[]', 0, '2019-11-01 01:35:42', '2019-11-01 01:35:42', '2020-11-01 07:05:42'),
('186543f5ded59ea7e3a01595e20a66e54fea6f85c9a3bde3d15932703d208f18103836bee08953e9', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 02:11:00', '2019-11-06 02:11:00', '2020-11-06 07:41:00'),
('189a7c183b548ccdca2a07fe6af8dbe06347bef521f44f1b46f7a49f5fece5a704cc2ae355ff89b2', 1, 11, 'ONCOassist', '[]', 0, '2020-05-18 04:28:03', '2020-05-18 04:28:03', '2021-05-18 04:28:03'),
('18eb9f5a5da6e8bacbc29b0615c80454548cc794cdca4ce32108c76563cac70717a79360f658113f', 1, 11, 'ONCOassist', '[]', 0, '2020-03-26 12:38:20', '2020-03-26 12:38:20', '2021-03-26 12:38:20'),
('190a2af377acd8dfa091918eb597e310aff360aa3949868b0cc703a12cd49178e5fda1753d4b448e', 1, 11, 'ONCOassist', '[]', 0, '2018-12-19 09:59:41', '2018-12-19 09:59:41', '2019-12-19 09:59:41'),
('1913538cdbd994dad60182c7bf9a13f777c7cb790feb33b11af27ae4b202d8575b4ca4d7042f24ff', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 13:32:16', '2018-10-30 13:32:16', '2019-10-30 13:32:16'),
('192c59c8f2d51ce87fdfad162860aeb8299298537c4a22344a085b4c25449253d5b8f0809456b1aa', 1, 11, 'ONCOassist', '[]', 0, '2019-04-28 04:36:05', '2019-04-28 04:36:05', '2020-04-28 04:36:05'),
('192f6921197f09c3109da3102c644b12d60862f14f3d62238ea0fd6beb1d59d72a7ad6e7586bcbe1', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 08:33:01', '2019-11-08 08:33:01', '2020-11-08 14:03:01'),
('195ebca49a48c9cbe6b204f3e8afe95955527646a4e8c69b682c74ee5fefd6a0925f829ec66534cc', 1, 11, 'ONCOassist', '[]', 0, '2019-06-28 01:21:48', '2019-06-28 01:21:48', '2020-06-28 06:51:48'),
('196387eba6e6c5a73ab82870266442e25e29d1607ab25e6c1aab507b17b52479f7f5b3b460f804e0', 1, 11, 'ONCOassist', '[]', 0, '2020-03-25 07:42:01', '2020-03-25 07:42:01', '2021-03-25 07:42:01'),
('1963a447462bb8e0818fc977b5af83b42273c7f015e8a5b3b3e7dae601a61d1603e39247a7f833c9', 1, 11, 'ONCOassist', '[]', 0, '2019-04-10 11:49:20', '2019-04-10 11:49:20', '2020-04-10 11:49:20'),
('197b3693ca1c2da3fd58bec1c95cd77d79eb4c0ae83e8e7dddd17f06966dddd934a6b907c0f04805', 1, 11, 'ONCOassist', '[]', 0, '2019-03-29 17:41:16', '2019-03-29 17:41:16', '2020-03-29 17:41:16'),
('197c4a4020d5f7b0027944cff7723f9896166f9b5e44924e0820e178afb0c7941586e699bc5fb13b', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 22:49:10', '2019-11-06 22:49:10', '2020-11-07 04:19:10'),
('19ae354a2037347cd209518973220fc785225e391e4f0a49356db4c8e14d7c0bae42056321d1f3df', 1, 11, 'ONCOassist', '[]', 0, '2019-01-09 09:27:51', '2019-01-09 09:27:51', '2020-01-09 09:27:51'),
('19afe748815912991a5f835a2575bc720f8f8eff9b0b1daea6dbb918ea8b58f5bce7aca972aa1f43', 1, 11, 'ONCOassist', '[]', 0, '2018-07-09 08:23:42', '2018-07-09 08:23:42', '2019-07-09 08:23:42'),
('1a0c8db97a4209e2633fcc4f49bd1affb30dd0e6ebff62f47ff790dce3e95e7241ba5147eac00560', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 05:14:50', '2019-11-04 05:14:50', '2020-11-04 10:44:50'),
('1a11da26bb1088b5eb50e9b6d13372c5eff2a17272ad6582436798a2068340f91aa31513a3739e4c', 1, 11, 'ONCOassist', '[]', 0, '2019-01-30 14:05:39', '2019-01-30 14:05:39', '2020-01-30 14:05:39'),
('1a4788881934903a60bc0574445234e1d1d314ad55f71d0258e016f0685303a75700f2f9f854be3a', 1, 11, 'ONCOassist', '[]', 0, '2018-07-09 09:59:26', '2018-07-09 09:59:26', '2019-07-09 09:59:26'),
('1a4e3d335391ed1dea6fc6f79cd566714ef10061734cacd8cc070c102a0b1594f9a1d88e46850cfb', 1, 11, 'ONCOassist', '[]', 0, '2020-04-17 11:37:06', '2020-04-17 11:37:06', '2021-04-17 11:37:06'),
('1a55286d12defe562e49331540ab59da91d79652756e7e2f6c02b448a54aab09391b609814645d3d', 1, 11, 'ONCOassist', '[]', 0, '2018-07-04 12:47:11', '2018-07-04 12:47:11', '2019-07-04 12:47:11'),
('1a5c35007e845291f25a4277a544383a4570ceeb7ad29cf6b45e152f5a8bffde8d991067c0e8bb60', 1, 11, 'ONCOassist', '[]', 0, '2019-02-07 14:51:14', '2019-02-07 14:51:14', '2020-02-07 14:51:14'),
('1a632d3f8203807a932d43d8d5f213ee26c3a1b65bf625426e21bcbe66d68867b3996b7c4c2fc2e7', 1, 11, 'ONCOassist', '[]', 0, '2019-11-25 05:12:16', '2019-11-25 05:12:16', '2020-11-25 10:42:16'),
('1a8eb4eb7dc5466b20967ac5214e8c36475175e5b40fcfcd2f98809812e25611f461016032c77764', 1, 11, 'ONCOassist', '[]', 0, '2019-02-28 10:54:45', '2019-02-28 10:54:45', '2020-02-28 10:54:45'),
('1aa3ab8eff43f092a016cf35f3d0f1b92be24652478361f8b0a7f059281888fd19a006c177fbd71a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 00:53:28', '2019-11-05 00:53:28', '2020-11-05 06:23:28'),
('1ad96746d20c7e89171415c5b0b81be5f75e840f91040d9c07e98863ba2c2974ef9f979f0162354f', 1, 11, 'ONCOassist', '[]', 0, '2019-03-08 09:50:17', '2019-03-08 09:50:17', '2020-03-08 09:50:17'),
('1af334d1b2c017a386f1fdc5140bc6c9afc568cf143515d388097b4f9f28422462dc0467a4537a06', 1, 11, 'ONCOassist', '[]', 0, '2018-12-11 12:57:44', '2018-12-11 12:57:44', '2019-12-11 12:57:44'),
('1b8ceb19e8a5b10d5656adfffea2ac3afae0d5f575e6c0217e33739107fad7946126f93fd7a57ca0', 1, 11, 'ONCOassist', '[]', 0, '2019-04-09 15:07:49', '2019-04-09 15:07:49', '2020-04-09 15:07:49'),
('1b930a9b7b04891253dec19d8f39ab050e0cd5d5cb7f021207bdeae9433a04e634d2f71815a3f0f9', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 00:49:41', '2019-11-04 00:49:41', '2020-11-04 06:19:41'),
('1b9d073595ae35a04d6cad4656b0001a25d300f2e2316bf4c5ef411d5a6780371c26804f196a57ec', 1, 11, 'ONCOassist', '[]', 0, '2018-12-19 15:10:30', '2018-12-19 15:10:30', '2019-12-19 15:10:30'),
('1bb938ec0db47042881824e42d0c28f3c07b7fe467c3c877ce97e28af4b4ea20e8071e8906442c7e', 1, 11, 'ONCOassist', '[]', 0, '2019-05-28 03:54:05', '2019-05-28 03:54:05', '2020-05-28 09:24:05'),
('1bb942f7cee137f2359aae0aef1033bd873338f23c5c39cd16d275893559ef2c5476e8977b3474eb', 1, 11, 'ONCOassist', '[]', 0, '2018-06-27 19:42:12', '2018-06-27 19:42:12', '2019-06-27 12:42:12'),
('1bd917d85e0aa202a0b6460faeb8231de58d39096fabc19c6c68368664dafd37c4ff9a97b596bf6b', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 05:21:11', '2018-12-04 05:21:11', '2019-12-04 05:21:11'),
('1bdb423b8973ae78274552bfb1f6c553cf75858c4a226d63e8e0a5fd64d4f4d85270ca2d7f77a6e8', 1, 11, 'ONCOassist', '[]', 0, '2020-03-25 07:42:20', '2020-03-25 07:42:20', '2021-03-25 07:42:20'),
('1bde3a88131bc2a81fbaa408549bd3c62c8f26e83cfbb88c0677ce3b97f8bcdf1e28ac551a911fdd', 1, 11, 'ONCOassist', '[]', 0, '2019-12-05 05:33:00', '2019-12-05 05:33:00', '2020-12-05 11:03:00'),
('1c369892ecb2fbe3eb5d61f3a884c3b55ab16071cc70474add116402f4cadfd4b2b907eab076e8b4', 1, 11, 'ONCOassist', '[]', 0, '2019-10-24 05:44:02', '2019-10-24 05:44:02', '2020-10-24 11:14:02'),
('1c72314f302b370764de704ea6c7903ac68c34fff3678b70710bb179666a6a16408882352ccb030f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-20 01:31:35', '2019-11-20 01:31:35', '2020-11-20 07:01:35'),
('1c86777b877110e7d396fb7e4aece9619e515dc849fe6a958aceffe789c23e1e657766e95e490e7b', 1, 11, 'ONCOassist', '[]', 0, '2019-04-26 08:11:00', '2019-04-26 08:11:00', '2020-04-26 08:11:00'),
('1c8c9094c42fe99bb64b65b12c8d1e148936913b7c0e4a81a5adc9711ab8fd92b3833322e9d44110', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 05:31:59', '2019-11-07 05:31:59', '2020-11-07 11:01:59'),
('1cfcc266c5c9d752449eb40799013c088e2caf5c19f846428eeb913ad3908fe7fb1cf67a884d1eac', 1, 11, 'ONCOassist', '[]', 0, '2018-07-11 05:04:24', '2018-07-11 05:04:24', '2019-07-11 05:04:24'),
('1d7856216130fcd4c013a60651391e4aa33396c845ca6984c670c93154543f9c5fb4d2b75bd8b84b', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 06:09:47', '2019-11-21 06:09:47', '2020-11-21 11:39:47'),
('1d7ac968e10315af9c39b01615e0ed23b7f43dfba986849330d950bc6013ddcf3ceb1665c23c874f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:44:39', '2019-11-22 00:44:39', '2020-11-22 06:14:39'),
('1d93ff862fecd7b2119e5dfcf3dcaf8f14eeb71e8fd8eeb661921a07344d5e43711fec16e09e3b0c', 1, 11, 'ONCOassist', '[]', 0, '2020-01-03 04:47:20', '2020-01-03 04:47:20', '2021-01-03 10:17:20'),
('1dba737e645ef7232e5da7161b117dfacad525732f6153721a7caa77a715927c149b7e672e8b7498', 1, 11, 'ONCOassist', '[]', 0, '2019-02-27 10:24:49', '2019-02-27 10:24:49', '2020-02-27 10:24:49'),
('1dbcb6c0ca0f682e4d5420a93573e74bf83336c540a0883351c78b43463876cfb01897be88d9971a', 1, 11, 'ONCOassist', '[]', 0, '2019-04-18 08:09:47', '2019-04-18 08:09:47', '2020-04-18 08:09:47'),
('1ddffc2704f0aeff249ad22a6cc1fafeba3962d85454e7b041b1bd59ec8d17ecc30ba8f799ef627c', 1, 11, 'ONCOassist', '[]', 0, '2019-11-27 23:01:58', '2019-11-27 23:01:58', '2020-11-28 04:31:58'),
('1de78fa876cab489ca7c915607954fa6e64232fb2bf326bf61cee2d69f1afd387d498ec6d6fe0111', 1, 11, 'ONCOassist', '[]', 0, '2018-12-06 09:41:05', '2018-12-06 09:41:05', '2019-12-06 09:41:05'),
('1e0cf88d5a067207f70a6faed8b9b8ec620bb38a374aa1ce052ae030ed7e13c1f0985831f16da51a', 1, 11, 'ONCOassist', '[]', 0, '2018-09-14 16:25:31', '2018-09-14 16:25:31', '2019-09-14 09:25:31'),
('1e474b90dbf1e06672f9fb23e644f3d662e0254a5d04095a0533e02e744aa4e4bce9f36b39703c26', 1, 11, 'ONCOassist', '[]', 0, '2019-02-22 15:24:28', '2019-02-22 15:24:28', '2020-02-22 15:24:28'),
('1e9dcfa6e6c5acfa93681a485c2a4c9df5f7033b40ae8f9200116b791dad0ae8c6fc4b796a377529', 1, 11, 'ONCOassist', '[]', 0, '2018-12-07 09:22:39', '2018-12-07 09:22:39', '2019-12-07 09:22:39'),
('1eb6ea5302d03f925f7e5e233adf79c8fb47029e47804571ded50e05bcc3effca227260c12cc48f1', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 04:16:06', '2019-11-06 04:16:06', '2020-11-06 09:46:06'),
('1f0c3482332ad185fa90008d0ad06d6abaefecaf30a2c2ede00e3939e33eb7eb47db3a573925f7ee', 1, 11, 'ONCOassist', '[]', 0, '2018-06-27 13:29:44', '2018-06-27 13:29:44', '2019-06-27 06:29:44'),
('1f60b202e7f3f27855bc0434485c9ab9f9dd39884ec30255c8596ed60faf820d5a03d050135a0c0b', 1, 11, 'ONCOassist', '[]', 0, '2019-01-22 09:36:54', '2019-01-22 09:36:54', '2020-01-22 09:36:54'),
('1f7a9b95783a5dd1487077c58eead86475a17f02d3c3e50b30fd7a398e2bd83920fa115cb338228f', 1, 11, 'ONCOassist', '[]', 0, '2019-10-24 08:29:59', '2019-10-24 08:29:59', '2020-10-24 13:59:59'),
('1f7be3965dc20cc10c85b880e0e909e44effe836bc1c8f3c2ffbd68f671f58784ead1f833f86ef89', 1, 11, 'ONCOassist', '[]', 0, '2019-04-02 08:19:24', '2019-04-02 08:19:24', '2020-04-02 08:19:24'),
('1f7d734bf10260af3daeb3c03bfefd62d687b59a2ce830fc7edf0ee69e1a51c7c30a1e9aa648b60d', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-10 06:50:32', '2020-01-10 06:50:32', '2021-01-10 12:20:32'),
('1f97f4f408fae49e94165afd20bb24d2b4ca91d334ee6f4c04b92c2f806547d632db70d91c042317', 1, 11, 'ONCOassist', '[]', 0, '2019-04-11 09:53:39', '2019-04-11 09:53:39', '2020-04-11 09:53:39'),
('1feac18ee5ed6a5c8f526887a77c3cdc92e8ac5806ffa077073a59125be61bcf42b54f6f0a4b120e', 1, 11, 'ONCOassist', '[]', 0, '2019-05-15 07:56:04', '2019-05-15 07:56:04', '2020-05-15 13:26:04'),
('1ff15bda36e0c6558941d2459ab30506d26573d9fbb48b6678eb82e4fe12d7ea5986b54ce207d7e6', 1, 11, 'ONCOassist', '[]', 0, '2019-05-07 08:15:11', '2019-05-07 08:15:11', '2020-05-07 08:15:11'),
('20005336a667e71adb48d4bcedd77434063254c057f93be029a70db9a9442ccda1a003b201ca863f', 1, 11, 'ONCOassist', '[]', 0, '2019-09-04 04:48:56', '2019-09-04 04:48:56', '2020-09-04 10:18:56'),
('2033846a4b44c503d580b4fcf3f6f58cdbfa2a8a15f1c42930ad634de3515efbfca0f4cc1ab03a0a', 1, 11, 'ONCOassist', '[]', 0, '2019-01-31 14:48:47', '2019-01-31 14:48:47', '2020-01-31 14:48:47'),
('2041a52fdd452854b00b4b2359ad96e160e74da22ca2f0e99474658a8233c59c98a45d923aa7e55d', 1, 11, 'ONCOassist', '[]', 0, '2019-03-21 18:16:08', '2019-03-21 18:16:08', '2020-03-21 18:16:08'),
('2043393b0a46a3058a9703b9694f2f8440876836dafeb281076756fc1b9f997fdb92fd294aad7b4d', 1, 11, 'ONCOassist', '[]', 0, '2020-03-26 13:26:04', '2020-03-26 13:26:04', '2021-03-26 13:26:04'),
('209d4e931722495cb7b1e4493091a3eacbf5787de01cce03af3207f4dd552d2c9aba24979138772a', 1, 11, 'ONCOassist', '[]', 0, '2019-07-03 00:48:32', '2019-07-03 00:48:32', '2020-07-03 06:18:32'),
('209ea866d91c94123c0b9514cc39f5fd8eb6d9f67ef9b642f0bda62e9afd225cab6ce727c44aee77', 1, 11, 'ONCOassist', '[]', 0, '2019-06-02 23:16:52', '2019-06-02 23:16:52', '2020-06-03 04:46:52'),
('20a7802b5b870fa24ff3763d3f0b83fc7d4c3ff387f1ac46c107b71fcb7a822d2ecfc1b30e1061b0', 1, 5, 'ONCOassist', '[]', 0, '2018-05-29 03:40:20', '2018-05-29 03:40:20', '2019-05-29 09:10:20'),
('20b5625dae6846412d400d7c549d745659e3f3db2b4d6c63e03ac8c11b817f1280f77fc4ce44dd69', 1, 11, 'ONCOassist', '[]', 0, '2018-11-13 07:39:56', '2018-11-13 07:39:56', '2019-11-13 07:39:56'),
('20bc3c0bbb0ac3aa2b3e5500b9cb7a05a5bee28ed4cb324c6fa04226725c52b92843cc293d771287', 1, 11, 'ONCOassist', '[]', 0, '2019-01-11 06:16:14', '2019-01-11 06:16:14', '2020-01-11 06:16:14'),
('2103732aa5d5d5c7343718822cd526c101f7c2bc25d9b803b669c522e7b2e53399d7a61c962b1a30', 1, 11, 'ONCOassist', '[]', 0, '2019-04-16 18:55:42', '2019-04-16 18:55:42', '2020-04-16 18:55:42'),
('21103017b1db743ebf5a9afb1984609ce316d020e43ed128f69660dd5244b53b9c6fa8d9e77c4df8', 1, 11, 'ONCOassist', '[]', 0, '2018-11-12 09:42:05', '2018-11-12 09:42:05', '2019-11-12 09:42:05'),
('211901d7271d5d064792506cf41751a53a8e1c7ca7c9690d4b05e068d66a1321f59a90ae2d70c1ef', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:12:12', '2020-01-16 02:12:12', '2021-01-16 07:42:12'),
('21543ebaa4fe8fb0aa784dfa1a492e4b9e4820fc20de4ef034230749b68fc2709e1e4f2c84b06539', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 05:50:09', '2020-01-16 05:50:09', '2021-01-16 11:20:09'),
('215b1649b49512dc8619e1923f258ebae180ebed85fae398fbbfd4e1eef55df4a5119e3b86bfce47', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:37:40', '2020-01-16 02:37:40', '2021-01-16 08:07:40'),
('216ae678b5345fc4de52aa6a8864f5b445c3ef15a1dc66804592344aba2bd3fa5206389eed6626fb', 1, 11, 'ONCOassist', '[]', 0, '2019-06-28 04:12:31', '2019-06-28 04:12:31', '2020-06-28 09:42:31'),
('21947e300afce8d6c5f9f09f89d2a12bf73a114399a20c31dbb1f15fa3f5ab728997cdc674b6e11e', 1, 11, 'ONCOassist', '[]', 0, '2020-02-24 05:26:44', '2020-02-24 05:26:44', '2021-02-24 10:56:44'),
('21a426519f83bb7fd1de1cfa3a51619f4c22d6958f2383dae3e229b60242e471db74f50357e0fd6e', 1, 11, 'ONCOassist', '[]', 0, '2018-07-11 05:01:49', '2018-07-11 05:01:49', '2019-07-11 05:01:49'),
('21b0c9eba37837481a704bed616d4ffd0c864452f1fdb7f4cac240a7fcfaa4cc4994ffadf9720e30', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 06:59:10', '2019-11-04 06:59:10', '2020-11-04 12:29:10'),
('21f33aaf3362fc06399aa7502ef0ded57e715ff20ae88d73fdd8fba65c6c301dd58bcceec8b27b32', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 04:10:45', '2019-11-07 04:10:45', '2020-11-07 09:40:45'),
('2237e7083fbd3246fb459f048822c76bd1094d1808a8fc68e2623dd13b9b6bf9990088c791c2a657', 1, 11, 'ONCOassist', '[]', 0, '2019-07-22 23:40:11', '2019-07-22 23:40:11', '2020-07-23 05:10:11'),
('223dd6e5800fd0f6ca804d89682bd38fa72827f43978a15672e3d5d248046830fec4400461ea5418', 1, 11, 'ONCOassist', '[]', 0, '2019-03-01 15:04:44', '2019-03-01 15:04:44', '2020-03-01 15:04:44'),
('22493d7c119aef0d226099b24c13073be81da224486df944756c98f84e95464468bc4d64492b6cd2', 1, 11, 'ONCOassist', '[]', 0, '2019-02-11 11:28:30', '2019-02-11 11:28:30', '2020-02-11 11:28:30'),
('22a140f3feca691b723d4b85f692a699a8f2c7bdf6c7b152e057bb45f4e3499a8a0506c3f6110987', 1, 11, 'ONCOassist', '[]', 0, '2018-08-20 09:03:59', '2018-08-20 09:03:59', '2019-08-20 09:03:59'),
('231e05055a994d6eac5fdc5f25a17e229e6beee11b9a3068cd6456db4e6a576f859cbaecabe20322', 1, 11, 'ONCOassist', '[]', 0, '2019-07-26 00:04:15', '2019-07-26 00:04:15', '2020-07-26 05:34:15'),
('2325850b82eaab96dd1d302b57067964da8109a01d3f7fdc76393f9a64195844c200fc393c3ebac7', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 13:30:50', '2018-10-29 13:30:50', '2019-10-29 13:30:50'),
('232611210fe2f99b632748426cbca61d55f475fad6d9e2b99551a7d0ef5e00c26cf14a5dc5129132', 1, 11, 'ONCOassist', '[]', 0, '2018-09-12 17:43:16', '2018-09-12 17:43:16', '2019-09-12 10:43:16'),
('23547ee9035a7129bbb452ee929a0bb65e3a4ee5fc1445ea1a3dfd40d80b3d26792df7731c9d7071', 1, 11, 'ONCOassist', '[]', 0, '2020-03-11 05:13:52', '2020-03-11 05:13:52', '2021-03-11 05:13:52'),
('235668406af5419274b17db969b2c333cf1aab21e6187c1b05323a3e698be5b7fe2a83b3280dba86', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 03:34:30', '2019-11-21 03:34:30', '2020-11-21 09:04:30'),
('23a4d6639f5cba4578979d5e3fe9e9d6c8cf213fa2ae7fd1612d01eed6a6854a9a3e0de19f1d9343', 1, 11, 'ONCOassist', '[]', 0, '2018-09-06 16:25:14', '2018-09-06 16:25:14', '2019-09-06 09:25:14'),
('23a53bee572310d4ca226fa3519286f6ebeb7faa8d02e32d6a9f9a81d42b3aa21f86fdd3b297cf11', 1, 11, 'ONCOassist', '[]', 0, '2020-07-13 19:40:18', '2020-07-13 19:40:18', '2021-07-13 12:40:18'),
('23e91e7e72a258169676cb8524ee2e5f9979803a9b1077c98270ccaafcfd622b271c1dca0f882b33', 1, 11, 'ONCOassist', '[]', 0, '2019-11-20 02:19:58', '2019-11-20 02:19:58', '2020-11-20 07:49:58'),
('23f62221b0514bef0110e6e97bced38f30bd27b99bd08e703ae7483664ae6e57688bf526a025d6ac', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 07:54:12', '2019-11-21 07:54:12', '2020-11-21 13:24:12'),
('2400ec9d10bc5f7c64583924dac03635e391b287fd43de027c309072379dd121400d78b5c561758c', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 15:58:11', '2018-12-18 15:58:11', '2019-12-18 15:58:11'),
('240c3af942040aa08a40aefe7a368adac44e4095ba6f0086efbcf294f7649e2f2a32180720841ad0', 1, 11, 'ONCOassist', '[]', 0, '2020-03-06 08:13:06', '2020-03-06 08:13:06', '2021-03-06 08:13:06'),
('2438afdb595986f8e847ad25eaed7d3dc55a4ce59c314515110de322bfacddf56302caecc87d2c97', 1, 11, 'ONCOassist', '[]', 0, '2019-10-24 08:55:52', '2019-10-24 08:55:52', '2020-10-24 14:25:52'),
('24451b180a476e56946b47590ddcb65d4ad609660a4e0aa4a1457f755e2c390583f7d1255fa7db89', 1, 5, 'ONCOassist', '[]', 0, '2018-05-30 05:22:04', '2018-05-30 05:22:04', '2019-05-30 10:52:04');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('245c89db896ecbedea7bfc16701813bfe421b84beef401c1fe49965efa425c3ec1e1a5d571a9060d', 1, 11, 'ONCOassist', '[]', 0, '2019-02-14 20:29:48', '2019-02-14 20:29:48', '2020-02-14 20:29:48'),
('24716b2349a2aac70c10410217665237b20b3545bb6e4f4624894cc9b66040e2e4d51865e508e31a', 1, 11, 'ONCOassist', '[]', 0, '2019-07-22 00:39:33', '2019-07-22 00:39:33', '2020-07-22 06:09:33'),
('24adecc845cf838be3f8d575d48e933a04cc867a83e8a3dc725440d5c174c7cf40873d9f2c959a45', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 04:27:01', '2019-11-21 04:27:01', '2020-11-21 09:57:01'),
('24f8e82f0c08cb0e8c6343456dcb1729d2220efc93db5f89ff0ff71b5ab6b11d453c5aa0221708ed', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 07:50:40', '2019-11-06 07:50:40', '2020-11-06 13:20:40'),
('2519e332cfe336aa8332be94ff3640cf4493f168fd6327c39b8e92f9be5817efed00802d4286e18f', 1, 11, 'ONCOassist', '[]', 0, '2019-01-18 12:42:57', '2019-01-18 12:42:57', '2020-01-18 12:42:57'),
('2539d708213b664645a56ed5888453db31b82ed5fe394e6f2e4682d60800032754693822cc97bc7b', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 03:27:39', '2020-01-16 03:27:39', '2021-01-16 08:57:39'),
('253d938281d90395a7674788927f7ec42d83d14a99a7d12455f2a1b51d2821838687ff7a50abfd35', 1, 11, 'ONCOassist', '[]', 0, '2020-04-03 05:13:28', '2020-04-03 05:13:28', '2021-04-03 05:13:28'),
('254e20a36364cf6e4634727eb745dd576bcf564b452b048c936995f334ebf7c6efb398beb3cb9658', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:31:22', '2019-11-22 00:31:22', '2020-11-22 06:01:22'),
('2559f8b920d3d61df7463ed0c8bf52abb7409f9b2648a9f605349e93a7d8b80618eb095f7b732ed4', 1, 11, 'ONCOassist', '[]', 0, '2020-03-25 11:29:21', '2020-03-25 11:29:21', '2021-03-25 11:29:21'),
('256c1b6617545157c881e5f6ede044717ec84d1ec35b19d98a2488669a9262eef65b95293a2e078f', 1, 11, 'ONCOassist', '[]', 0, '2020-05-06 14:33:43', '2020-05-06 14:33:43', '2021-05-06 14:33:43'),
('25afb64720c11336beca7669887608d1a617f62c83fab0c77ba5dd9c79a96b4b57d4e8f0607a6645', 1, 11, 'ONCOassist', '[]', 0, '2019-07-03 00:47:22', '2019-07-03 00:47:22', '2020-07-03 06:17:22'),
('25c30402661b9df0bf94f19f434b8867c95ec2f259139a8f840483bf27835564f3d9c164641d4862', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 05:32:09', '2018-10-30 05:32:09', '2019-10-30 05:32:09'),
('25cb48aed31f7c81669969af25f607d21ecbed339bf2ebdd275aa0d6d0a2366b70732796e9417b9a', 1, 11, 'ONCOassist', '[]', 0, '2019-01-18 10:37:08', '2019-01-18 10:37:08', '2020-01-18 10:37:08'),
('25e0887d8d2c7ac939d178d2e975a5c8365bdf397e0a0421e277997655aa49989518b0f29fdc802d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 04:54:41', '2019-11-06 04:54:41', '2020-11-06 10:24:41'),
('262bbd2981f2634e8196aeebe4c430edefeec79d33190477c46f4c812604a263d3ea868196a15d5c', 1, 11, 'ONCOassist', '[]', 0, '2019-02-11 11:59:14', '2019-02-11 11:59:14', '2020-02-11 11:59:14'),
('2631fcb7a168d085a7baa3fd5d94971f92996cdf467d833f9f431b15ef5c74fa27008a632efa9190', 1, 11, 'ONCOassist', '[]', 0, '2020-01-03 07:31:07', '2020-01-03 07:31:07', '2021-01-03 13:01:07'),
('264a027ad57581829539f556c149bb83db7a9f5f3d84593c6c9839463f18869b5e3da6d5223995d6', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:18:59', '2020-01-16 06:18:59', '2021-01-16 11:48:59'),
('266227283587eacc2dfa112ab02fac54e3ce05fb811ea830728d7a04335a59f3bf88b0cb9b0de30a', 1, 11, 'ONCOassist', '[]', 0, '2019-04-16 15:01:26', '2019-04-16 15:01:26', '2020-04-16 15:01:26'),
('267ad352cbce02cd325264d65827f3046a3b37517d5057f0c9f2b294e4be9697f8556df2f6b52375', 1, 11, 'ONCOassist', '[]', 0, '2019-07-31 00:06:53', '2019-07-31 00:06:53', '2020-07-31 05:36:53'),
('2702d07fa120bcfff6794927ae29d23663e4d6bbce67f8657142fa96a25a67b6afe83e472c3bb20a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 02:47:41', '2019-11-06 02:47:41', '2020-11-06 08:17:41'),
('27425515d2108ab4a1a6747de8b8d2e5dc6dc23e5c7d649e912bb589bc9cb27e9afb7dc2bd3f2596', 1, 11, 'ONCOassist', '[]', 0, '2019-02-07 10:16:41', '2019-02-07 10:16:41', '2020-02-07 10:16:41'),
('278ceef94604bc4d58e0fbec7b8ddf518f2072efd5fe7cbb98a5e1617395fad175118b1fd392d795', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 06:29:04', '2020-01-17 06:29:04', '2021-01-17 11:59:04'),
('27ea5d5d9c4e6c8052a5b0047af2b603909859e86fbfdc54d0c3b5a2d374d92d2abbdb57563ede48', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-10 06:49:11', '2020-01-10 06:49:11', '2021-01-10 12:19:11'),
('282d58ec2889138446687dbce94f6f5e325cffb19733c369c46ad524e7e737265fadf5a4d6a8f540', 1, 11, 'ONCOassist', '[]', 0, '2020-03-03 05:26:19', '2020-03-03 05:26:19', '2021-03-03 05:26:19'),
('283809994d57a4a8ada30f54438a020a7fd119a8f072961f766e7c91271a4fbd0e68c7553d4e93f2', 1, 11, 'ONCOassist', '[]', 0, '2019-05-29 00:24:49', '2019-05-29 00:24:49', '2020-05-29 05:54:49'),
('28876ee1c83fbb066ca75537e6f73586e389b69e3f77b6e6ea2e9a8d272db5de22234fa97d66b6b5', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-06 01:38:41', '2020-01-06 01:38:41', '2021-01-06 07:08:41'),
('28e54a11466c59d0c42c9b112ba39d165ed10e3fc1c162e72324fc81ea09a0574ac1f11644388892', 1, 11, 'ONCOassist', '[]', 0, '2019-03-08 17:43:03', '2019-03-08 17:43:03', '2020-03-08 17:43:03'),
('2917b18563f7ede29c90fa4b53f2436970c50caf25e5eab61ced27d2e3b589b41513eeb89539bab7', 1, 11, 'ONCOassist', '[]', 0, '2018-11-05 06:59:42', '2018-11-05 06:59:42', '2019-11-05 06:59:42'),
('2991d5888db7002f3be3091bb51ca7ed0157b3ae9d53d924f874bba7ad7d3c7ab31f26a893ae46a2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 07:51:18', '2019-11-04 07:51:18', '2020-11-04 13:21:18'),
('299ddb919e281f2f3d982b0b42d451e7ae838a8dc9baa7978c53d88fbe8bb12304e959d0f2677e5b', 1, 11, 'ONCOassist', '[]', 0, '2019-01-18 09:49:51', '2019-01-18 09:49:51', '2020-01-18 09:49:51'),
('29a4b80fde3a33490c9e09cc104877fe86ee34e05ea102e476e8db4cad6725c79cd858eba52704d5', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 03:57:46', '2019-11-08 03:57:46', '2020-11-08 09:27:46'),
('29bda1b5d1645abb82b43dbc3d416929fa68b44882fb987e5ca8a23df34972e5ff0114f2dd76df65', 1, 11, 'ONCOassist', '[]', 0, '2020-03-02 10:19:39', '2020-03-02 10:19:39', '2021-03-02 10:19:39'),
('29c2748d9be0cf8c4d1c5ddeb524930378c23aadecb9a8e5cd7bb39a7cda9fa83c1f70ca5d15eda1', 1, 11, 'ONCOassist', '[]', 0, '2019-03-05 09:06:26', '2019-03-05 09:06:26', '2020-03-05 09:06:26'),
('29f56c4406e12fd26fc2167cceef2b089af7b3edc11a180d9cd75654320f6d155b07a979ffeabde9', 1, 11, 'ONCOassist', '[]', 0, '2020-03-18 11:27:14', '2020-03-18 11:27:14', '2021-03-18 11:27:14'),
('2a0106194ebdda8b0d75f4235020e41d05b06ff038be4b632c3d6580ece25c3fe85bc70692b9f87d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-24 23:05:26', '2019-11-24 23:05:26', '2020-11-25 04:35:26'),
('2a22fc8f8f80779c9488c17eebebb35814c79eb92642a0198b317b4ae5456e6193b7bd3bac56770d', 1, 11, 'ONCOassist', '[]', 0, '2020-04-29 13:53:01', '2020-04-29 13:53:01', '2021-04-29 13:53:01'),
('2a337947c34f6569c5adafef16ce62fa4e62295b472a0e4048b043dcf9ddf6135cc1929ec27af510', 1, 11, 'ONCOassist', '[]', 0, '2020-03-13 10:00:09', '2020-03-13 10:00:09', '2021-03-13 10:00:09'),
('2a3e1adae3938589b2bdf3b1b83535699610c3c74379551f40de4fcc99512533c29e0e230ed3a707', 1, 11, 'ONCOassist', '[]', 0, '2019-04-11 13:16:11', '2019-04-11 13:16:11', '2020-04-11 13:16:11'),
('2a4449e4ea5e593401089b2b9c5be56b3e9857a246850de3f2aedd18edf83eb6e46bbbfa79e8353f', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:51:52', '2020-01-15 03:51:52', '2021-01-15 09:21:52'),
('2a5a982f83afa95e0e2baca587be1dfd6da3674b948a98397f7373419815f4ff092ffb904dd65c6f', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-07 03:36:38', '2020-01-07 03:36:38', '2021-01-07 09:06:38'),
('2a69b4d8e6a2e99b8010d58da30eb6891e9eabd00ddb52844b961db971fd868cac0581ea4ba87177', 1, 11, 'ONCOassist', '[]', 0, '2018-11-12 13:34:01', '2018-11-12 13:34:01', '2019-11-12 13:34:01'),
('2ab09bd5e1c1451a106bfa936b04dc2414ee571e01576ae1ccbb01f02276a3f9f1a26ede4c796372', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:43:05', '2018-06-18 00:43:05', '2019-06-18 06:13:05'),
('2ab27e823eaaf7690e34621fd5404ae82d71ae32d29a79b22c1734d30a30dbffae19e91b8ef82b31', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-21 23:49:58', '2020-01-21 23:49:58', '2021-01-22 05:19:58'),
('2ad6dd9c6dff68fbda127583ebe2890b4f5ccb4f887312f3c79d7578d6f006e910e19c65876e36dc', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-08 06:09:02', '2020-01-08 06:09:02', '2021-01-08 11:39:02'),
('2ae42f5537f430a6f00ec8d008a8ec6787cb9136e7e9da125b662a2ed1b2285e6d2941a9be460f7e', 1, 11, 'ONCOassist', '[]', 0, '2018-06-18 23:22:51', '2018-06-18 23:22:51', '2019-06-19 04:52:51'),
('2ae6058cf9c186298a26269f050e64f022d389f661bcd53bed37643bebac47ff1fcd6e7e7a187364', 1, 11, 'ONCOassist', '[]', 0, '2019-04-19 09:06:13', '2019-04-19 09:06:13', '2020-04-19 09:06:13'),
('2ae79b07e782d31e5aa4e16cfeb906072ace3f0728837effc4d9ed6467b9629fca34ff097390e3e4', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 01:46:12', '2020-01-09 01:46:12', '2021-01-09 07:16:12'),
('2aeda0ad003e36e5e2bdd019ae250757fa284b0b2a893c838d50f0dd57e9be7b19b15e78ec48a772', 1, 11, 'ONCOassist', '[]', 0, '2019-11-18 02:57:11', '2019-11-18 02:57:11', '2020-11-18 08:27:11'),
('2b3820d34bb17291f38050239fc2b7450a30c4c6deae8e940194c1c56627e91abf643bec6db8503f', 1, 11, 'ONCOassist', '[]', 0, '2020-03-12 04:31:22', '2020-03-12 04:31:22', '2021-03-12 04:31:22'),
('2b56606c42328cd1b1f3f8d8d26db01d3ffa64e3b0d12dc7881d2a3d843724c3051bc03e55907486', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 05:53:18', '2020-01-16 05:53:18', '2021-01-16 11:23:18'),
('2b6afcba9cc9dee96a76da765157697a4dcddc0521cc18757bdb2c52ebd3cd8e0a81683bb6b77895', 1, 11, 'ONCOassist', '[]', 0, '2018-10-31 09:29:30', '2018-10-31 09:29:30', '2019-10-31 09:29:30'),
('2b768e1c8ac768766d99ff409fcb2d7ae979ea6b1a92797cfd31e1343ad27b48645ca4499eaeb8c6', 1, 11, 'ONCOassist', '[]', 0, '2018-07-17 09:04:04', '2018-07-17 09:04:04', '2019-07-17 09:04:04'),
('2b9b09a5eaedebadba9ea3251d96d1b304bff6cd11ad50cc0f4a4e77405798bd92b6cec090b2e01a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 06:25:16', '2019-11-22 06:25:16', '2020-11-22 11:55:16'),
('2c07734a4a851a9feee2a4e135c0b31ce5b9bbc035982ccb67f9ab48813cc1dc369e73d0bd46b6ea', 1, 11, 'ONCOassist', '[]', 0, '2019-10-29 23:03:01', '2019-10-29 23:03:01', '2020-10-30 04:33:01'),
('2c2e4d6fad8187162160eca49ca3d8eb0e926a033b95df3bfc6736e7668972609f2f34483eae9cd9', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 06:59:38', '2018-12-04 06:59:38', '2019-12-04 06:59:38'),
('2c4085776edb200b4ab5b799a12cb3a28f700a4ecee908690268260994e4a9b70068967bbf19bd7e', 1, 11, 'ONCOassist', '[]', 0, '2018-06-18 23:11:36', '2018-06-18 23:11:36', '2019-06-19 04:41:36'),
('2c6fc553ac5044fb0b87d78688e0272f075c6141209c12e8f8ad4603eb0b854572334ab56d001537', 1, 11, 'ONCOassist', '[]', 0, '2018-09-04 11:16:13', '2018-09-04 11:16:13', '2019-09-04 11:16:13'),
('2cbf5bce5ebcf0516d6bd74c362d29db3d49ce735e1f3c1a3134f73c80dadced5da812d7ececa62e', 1, 11, 'ONCOassist', '[]', 0, '2019-03-08 15:01:35', '2019-03-08 15:01:35', '2020-03-08 15:01:35'),
('2d39881cccd9e7bad4efd27c1fbd401eb3caa73354a89a3861300f57e89fc20ddce70a88b79e83c8', 1, 11, 'ONCOassist', '[]', 0, '2019-02-18 14:12:36', '2019-02-18 14:12:36', '2020-02-18 14:12:36'),
('2dbd49737f741c252d2bd99dad148ab99015d81c210f293bfea0adeb9b6cae363ed1e4c91e16e851', 1, 11, 'ONCOassist', '[]', 0, '2018-11-06 10:38:02', '2018-11-06 10:38:02', '2019-11-06 10:38:02'),
('2e046cf40197d8d79f4170482259d681fc27ec2c8bdc9f57c72d98bf4f6ea9130d7d5f97f3d3ccee', 1, 11, 'ONCOassist', '[]', 0, '2019-05-28 03:47:10', '2019-05-28 03:47:10', '2020-05-28 09:17:10'),
('2e53020467d76147c57a3bee32f27a1d7a3ed87f2246127ef319d75eebf343d42a8d87d2b83fb225', 1, 11, 'ONCOassist', '[]', 0, '2019-02-18 11:47:53', '2019-02-18 11:47:53', '2020-02-18 11:47:53'),
('2e5874535fc433934111500f8798aa470a049c0acc1a74f85a40d563b785b40be456260aaad704a8', 1, 11, 'ONCOassist', '[]', 0, '2019-03-29 16:13:14', '2019-03-29 16:13:14', '2020-03-29 16:13:14'),
('2e673983b10d3782f9829fc2deaa133bedc9f5e629712726371aaa847b88f4edd7ca724e0657f937', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 08:37:36', '2019-11-08 08:37:36', '2020-11-08 14:07:36'),
('2e7498876eaf771fdc7f2b40de3ce5d95159d09800551a0022f9a9715652d6073febc953b0fc2968', 1, 11, 'ONCOassist', '[]', 0, '2018-11-26 08:59:32', '2018-11-26 08:59:32', '2019-11-26 08:59:32'),
('2e86eacf3139c659a461a5eadf2166f354ded064d3a8a8c34c92bf57aa4a4b417da494622da17f57', 1, 11, 'ONCOassist', '[]', 0, '2019-07-16 07:32:30', '2019-07-16 07:32:30', '2020-07-16 13:02:30'),
('2edfec4078d6b9d788d4f44c51e4e47e303fc9ed522ed3312be3f7bd6da3dfebba1c051b53cf1579', 1, 11, 'ONCOassist', '[]', 0, '2019-03-25 18:25:53', '2019-03-25 18:25:53', '2020-03-25 18:25:53'),
('2f6d385452e5a6a7b7660886f132cb302a3f8c11a33ccd4ef16c156bec74000b5303f02ff50d8eb5', 1, 11, 'ONCOassist', '[]', 0, '2020-03-25 07:30:17', '2020-03-25 07:30:17', '2021-03-25 07:30:17'),
('2f82da10d312366562630b1dc31d1af793c84647789708f86fec95be12824739070eb794207139e2', 1, 11, 'ONCOassist', '[]', 0, '2018-10-01 21:04:57', '2018-10-01 21:04:57', '2019-10-01 14:04:57'),
('2f83ba2450d76f7c373b9f6f7008408b28756dd6a7a843e5a0b34f5d7c90c2f85221d7a0167d9441', 1, 11, 'ONCOassist', '[]', 0, '2018-11-23 09:47:47', '2018-11-23 09:47:47', '2019-11-23 09:47:47'),
('2f915cd139108291e9a8ebd491113dd93637f744b68c33a5b6b6988ec90ee40f52080f0659cefed8', 1, 11, 'ONCOassist', '[]', 0, '2018-12-10 14:19:21', '2018-12-10 14:19:21', '2019-12-10 14:19:21'),
('2fb3ffa82fad0c44f8d011696d3b50bc41bff7353ba1a83f02365217fec9c2a1047d019804fa84f1', 1, 5, 'ONCOassist', '[]', 0, '2018-06-15 01:35:44', '2018-06-15 01:35:44', '2019-06-15 07:05:44'),
('2fbe698891db83ff9e3a70ea4d2f2e19d67594c85727f31b2f7af49d9674381030adfde60971ac58', 1, 11, 'ONCOassist', '[]', 0, '2019-11-01 03:57:14', '2019-11-01 03:57:14', '2020-11-01 09:27:14'),
('30004d632b811a1289af8dd1bb61e0e9b61e6cf4c48edd1b2e8b68127a8c7bd7e498068a5888f2df', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 05:25:21', '2020-01-15 05:25:21', '2021-01-15 10:55:21'),
('3006e42b396af367d4b48e5d2d40f00528e618778ca43a5e3f06e1185edb69dabfa2631616f09abb', 1, 11, 'ONCOassist', '[]', 0, '2018-06-27 14:07:02', '2018-06-27 14:07:02', '2019-06-27 07:07:02'),
('305ca8adfe79aa079594095562242620f3f387ae9119a77133d60193427153b03eab993e65e93613', 1, 11, 'ONCOassist', '[]', 0, '2019-07-16 04:31:55', '2019-07-16 04:31:55', '2020-07-16 10:01:55'),
('306191e367855c88b006c7a643fe48110efa0918647add29e7077cdbab89a9badfe03375cb68c112', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:22:45', '2020-01-16 02:22:45', '2021-01-16 07:52:45'),
('306bb587700a97bfa0231265222506d6a5dabbe19702896041afcfc6351ff418e2e4ee72d77a299f', 1, 11, 'ONCOassist', '[]', 0, '2019-01-16 09:59:38', '2019-01-16 09:59:38', '2020-01-16 09:59:38'),
('306f047bc46cadf6495ed489dfcab6c1d43638aeada001a876521ba55ba7453592edb2757d109597', 1, 11, 'ONCOassist', '[]', 0, '2019-07-16 07:34:39', '2019-07-16 07:34:39', '2020-07-16 13:04:39'),
('30bfd2034c8a4574ead2b2fb9d6825c48de394241069c532a987c5c278a60389b2ee3585df17d9ac', 1, 11, 'ONCOassist', '[]', 0, '2019-11-11 05:13:41', '2019-11-11 05:13:41', '2020-11-11 10:43:41'),
('30c09daf8ddd4fcd5f863d46f3ad1550fa2ada3fb5bad72fc7269d0e68b848c308899faeca031e52', 1, 5, 'ONCOassist', '[]', 0, '2018-05-28 02:14:44', '2018-05-28 02:14:44', '2019-05-28 07:44:44'),
('30c103080034516530b182b0861913b0d791009f347ec2087b555bb5c6ad4f220d95651c3780757d', 1, 11, 'ONCOassist', '[]', 0, '2018-10-16 10:37:22', '2018-10-16 10:37:22', '2019-10-16 10:37:22'),
('30c73b5169c53699a15f15d4fe73152f221598a3870a5021a1ba885531cc657199e4f5c33701579f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-18 02:33:14', '2019-11-18 02:33:14', '2020-11-18 08:03:14'),
('30d459a5f0ba788bd2a03718e617b8077deb2c70321263e2037300d2d7f9239d164f80d2e7df5e2f', 1, 11, 'ONCOassist', '[]', 0, '2019-10-30 01:58:22', '2019-10-30 01:58:22', '2020-10-30 07:28:22'),
('30da3afdddc8e5386487ecdb35ea3106bc1f66f5e13daf82b4f4985d72e83484e04c875220eebdde', 1, 11, 'ONCOassist', '[]', 0, '2018-12-07 09:35:05', '2018-12-07 09:35:05', '2019-12-07 09:35:05'),
('310e16e764595ffaf6d4b1fa9b2bb28aa51ba006a9bccb488e722dd11a9c143928c116bcacb239ad', 1, 11, 'ONCOassist', '[]', 0, '2019-06-03 05:25:55', '2019-06-03 05:25:55', '2020-06-03 10:55:55'),
('3110f6f9d3c072f72ee8d70752c0ed36b3063181f6c369b440776d3d0478797f5044be2555f89884', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 05:19:37', '2019-11-04 05:19:37', '2020-11-04 10:49:37'),
('311f1464618a4e085cc16293a8442130d9479a9647227757dff48e94f072ee6bc0bb1fc06d4b38e0', 1, 11, 'ONCOassist', '[]', 0, '2019-02-11 09:10:13', '2019-02-11 09:10:13', '2020-02-11 09:10:13'),
('3133c625d235553cc56a22a8121789eccbb85e3cc541f30fc180b0a324cd480b86b9a657b55bac95', 1, 11, 'ONCOassist', '[]', 0, '2020-06-19 13:27:58', '2020-06-19 13:27:58', '2021-06-19 06:27:58'),
('3153dd3cb1be9c4dd32e513a95263660117ddda35a83771046bc39ed1a85f541666b5811825ac2e3', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 06:01:44', '2019-11-08 06:01:44', '2020-11-08 11:31:44'),
('31b32324eddce436569b603ac3b61a0e0c66117d3b54c751f55cb3b5599345c9456189a6904a038e', 1, 11, 'ONCOassist', '[]', 0, '2019-11-11 03:45:43', '2019-11-11 03:45:43', '2020-11-11 09:15:43'),
('31be8d720b2a064e0079fd0f9438c8bfc46fc15fa686101516156aaf941d6505a2c1ed548fcad07a', 1, 11, 'ONCOassist', '[]', 0, '2019-06-28 01:16:27', '2019-06-28 01:16:27', '2020-06-28 06:46:27'),
('3209c169cff0bbb20a06f7628b4d57bc3a70948084db0b6a0765c34bb06ef87026ad94d42ef21bea', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 14:51:44', '2019-05-09 14:51:44', '2020-05-09 14:51:44'),
('324be1b4a183981f31f597505f3b3ca7e3cf6118cbb215731f4a5ccf24163812359ede929c22d569', 1, 11, 'ONCOassist', '[]', 0, '2019-11-25 03:30:55', '2019-11-25 03:30:55', '2020-11-25 09:00:55'),
('326931b81f1d56b83ba6f7314217448236129acc35abf831d8dd3f7c75fe7dd8bd92e03703f693bb', 1, 11, 'ONCOassist', '[]', 0, '2018-12-10 09:37:09', '2018-12-10 09:37:09', '2019-12-10 09:37:09'),
('32e18951934f3a93797ff0f3953599496898e908d2bae474ee9a84fa753a4986b5308b100b13dcbd', 1, 11, 'ONCOassist', '[]', 0, '2018-11-05 06:21:46', '2018-11-05 06:21:46', '2019-11-05 06:21:46'),
('32f7b4046f65ada0bbbbbc6059edcb14b81a3c15c696d758bae2963176583df53410aea2bf067fa8', 1, 11, 'ONCOassist', '[]', 0, '2018-07-27 08:33:22', '2018-07-27 08:33:22', '2019-07-27 08:33:22'),
('331703b99cb3b663f42512b1d6c6d7f4b81331446cb448c5c8fff17cf66fd307c760a8fa8b15aecf', 1, 11, 'ONCOassist', '[]', 0, '2020-04-29 11:58:57', '2020-04-29 11:58:57', '2021-04-29 11:58:57'),
('33243a96f41774a39b5324134e4cd0088a17b31dfdeedb8849199bf23e194889ec261fd2f3e47f02', 1, 11, 'ONCOassist', '[]', 0, '2019-02-21 05:24:46', '2019-02-21 05:24:46', '2020-02-21 05:24:46'),
('336f0e9e0f756c400ddf13b5c09f96a237f59a5eeb63ca6d5c0db7f7765c4d02b51ef7de7296abac', 1, 11, 'ONCOassist', '[]', 0, '2018-11-12 07:15:20', '2018-11-12 07:15:20', '2019-11-12 07:15:20'),
('339aa577dfa2ba9bf3ad81d3d89aeef667afcc61ab6a56243f2f5b549da6f75945e11566a86dd109', 1, 11, 'ONCOassist', '[]', 0, '2019-04-08 09:16:22', '2019-04-08 09:16:22', '2020-04-08 09:16:22'),
('339e8ad4cb0132d1da6c884486b6b3354bdcd6cb72ee44d666ec266c335526be00938a3eefd6b334', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 05:22:30', '2020-01-16 05:22:30', '2021-01-16 10:52:30'),
('33aa31d044eae34b63249ee28a11b8b5b555031e5549a2bd1054f15388f71453d83a894c4e5b6404', 1, 11, 'ONCOassist', '[]', 0, '2019-11-29 23:58:45', '2019-11-29 23:58:45', '2020-11-30 05:28:45'),
('33e6caee002bc7150194b87e6d3f56a6723d23bf4b27bb38051e8c76050873ca0c662cd51a87a7d2', 1, 5, 'ONCOassist', '[]', 0, '2018-05-28 07:33:57', '2018-05-28 07:33:57', '2019-05-28 13:03:57'),
('33e81c5048983bd1799bc325058651f72ba7bc03d5d1340fd4951a668af7e55ddfd626f1b3c2e4d6', 1, 11, 'ONCOassist', '[]', 0, '2019-01-28 10:04:41', '2019-01-28 10:04:41', '2020-01-28 10:04:41'),
('33ff665ad6e4420659d88e97c00380503da0bfc6c14893f936e7af96f65d10c33be890f7dcf0391c', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 19:53:30', '2019-05-09 19:53:30', '2020-05-09 19:53:30'),
('3404e282c7a2da5385b9a45321439af4b2274bad5eff259998529046839b037bf5e956d3b0e3f799', 1, 11, 'ONCOassist', '[]', 0, '2018-06-18 07:00:18', '2018-06-18 07:00:18', '2019-06-18 12:30:18'),
('340815d34113d38da196c3c1e48972c00a0b06b41a331d40a24018bb36fd6641e748d6b98236b57d', 1, 11, 'ONCOassist', '[]', 0, '2020-01-02 04:53:41', '2020-01-02 04:53:41', '2021-01-02 10:23:41'),
('34280b46782dd10d4a019bba1a88232f5f11efeb8ba83df3d118654dbf8e565702ffa4ad5ef73951', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-07 03:30:55', '2020-01-07 03:30:55', '2021-01-07 09:00:55'),
('3435e62a500a7aff6a1c8da938b295b851b6e63199485eb6e5b45965c3e3b87f1d75ed0504932d8e', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 05:22:26', '2019-11-22 05:22:26', '2020-11-22 10:52:26'),
('34923a87cc130165c4fb1878940ee76463e5e596d459e953aff395c9ad7d253f6db4e8dabf7ce6da', 1, 11, 'ONCOassist', '[]', 0, '2019-05-31 02:19:57', '2019-05-31 02:19:57', '2020-05-31 07:49:57'),
('34c77e0f07121fb1dbb477dc77205a3d713abddba989c570701108802d875cdbca122ef7ec812461', 1, 5, 'ONCOassist', '[]', 0, '2018-05-29 06:33:37', '2018-05-29 06:33:37', '2019-05-29 12:03:37'),
('34de6b94cd81b6fae64d311e0a2bcfd1e05ba4b3a8b30ff2152265be1a78249e5753cf5dc8335e51', 1, 11, 'ONCOassist', '[]', 0, '2019-03-25 09:09:12', '2019-03-25 09:09:12', '2020-03-25 09:09:12'),
('35039c6d88063086abf2f88c6fc0d1fe6a79a1aab77f3c939552f02cd1490a93e7f910e54f833392', 1, 11, 'ONCOassist', '[]', 0, '2020-05-07 15:47:16', '2020-05-07 15:47:16', '2021-05-07 15:47:16'),
('3543fe423e4310cab4fc29d090903d797c7ca25dc9933840195977e1fdbd11fbfe8011e69092c9fd', 1, 11, 'ONCOassist', '[]', 0, '2020-03-11 14:02:20', '2020-03-11 14:02:20', '2021-03-11 14:02:20'),
('3584f083ca72626cd98706c7b087fff18fc22f564da8f6435e5bcc5315205490045fba57234ae235', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:49:53', '2020-01-17 00:49:53', '2021-01-17 06:19:53'),
('35bf4cd5104d2560a5d0482a7c3ef5e012b2eb647419411f0460a7685e515a9b5072417e3b0f9f22', 1, 11, 'ONCOassist', '[]', 0, '2019-01-22 15:08:12', '2019-01-22 15:08:12', '2020-01-22 15:08:12'),
('35bfc7e1373f1ae585dacf29b892e35425235790056f50c1c236a5bcf5cc52ad8cf29e6e3ee2d115', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:39:47', '2020-01-17 00:39:47', '2021-01-17 06:09:47'),
('35c405d4ee5289861a77481a0a5d6f431d41622f14a8c540ac2ef954a7b81c0c7b9eb697388d757b', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 03:54:57', '2019-11-06 03:54:57', '2020-11-06 09:24:57'),
('35d49a83e85581e624d7bf8d5bcf4b6364636958c0fa7545cd83387187075456794de4c55e218d09', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-09 03:28:53', '2020-01-09 03:28:53', '2021-01-09 08:58:53'),
('35f6a6f753e3272650a32a2c5d0c5973b36eb458253485b5a4c7c090a76a69c393254c2d289f1d06', 1, 11, 'ONCOassist', '[]', 0, '2018-06-29 14:13:33', '2018-06-29 14:13:33', '2019-06-29 07:13:33'),
('36031e36314731e666f3c7d6159c05ea53733efc911fc0f93f585ca02af5f019262b20d41800e694', 1, 11, 'ONCOassist', '[]', 0, '2018-11-13 07:59:40', '2018-11-13 07:59:40', '2019-11-13 07:59:40'),
('360c1fdf87b969c6fb1493273f3e1a71acafda652240abe1dcc3e294d8d5149fb75979be8f3544f7', 1, 11, 'ONCOassist', '[]', 0, '2019-11-10 23:04:39', '2019-11-10 23:04:39', '2020-11-11 04:34:39'),
('362049e92bce97fd13ca61f19db2a0b20cd6798a199efd4720871541fd659dd7d6dbca6f0b074caa', 1, 11, 'ONCOassist', '[]', 0, '2019-06-12 23:13:42', '2019-06-12 23:13:42', '2020-06-13 04:43:42'),
('363c368cec373ed348593d9edb7d6e160d030c7c7f05bfc9f0327f41711f7dbc820eba4310469d8a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-27 08:38:53', '2019-11-27 08:38:53', '2020-11-27 14:08:53'),
('3660264625a49e749ce7d968d3b6dc32f92ab658abe79f144879ef6383a82a4ad917f9b21f9daf1a', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:38:03', '2020-01-16 02:38:03', '2021-01-16 08:08:03'),
('3694a4fa6606a3ce9bd060bc090a27dd9fd20d254d48bcc59e82fb49b26412cd10f1c5d087339021', 1, 11, 'ONCOassist', '[]', 0, '2018-11-22 23:42:03', '2018-11-22 23:42:03', '2019-11-22 16:42:03'),
('369d086c9f4ec9f5415d983fe0688b27191a0b2b20b3182d4e86c17522680ba044c740b2906f5008', 1, 11, 'ONCOassist', '[]', 0, '2020-02-27 12:10:36', '2020-02-27 12:10:36', '2021-02-27 12:10:36'),
('36d0f40ade055aed30ce7f11f05976f71f0cd60111d8446c4fa213a86961cd402567e1e20b002c2c', 1, 11, 'ONCOassist', '[]', 0, '2019-04-23 12:44:01', '2019-04-23 12:44:01', '2020-04-23 12:44:01'),
('36e170e1cd2ea3c56624d026cfb4006d20a2d93c29cf57c371f6b583587776bf77cfe4789d67a4b0', 1, 11, 'ONCOassist', '[]', 0, '2018-11-14 05:25:27', '2018-11-14 05:25:27', '2019-11-14 05:25:27'),
('370c12ae79274cddc4c6896471be0fa1fc1f72f799c984faca8fbcdce35d9b213302f5ee8b31083b', 1, 11, 'ONCOassist', '[]', 0, '2020-03-19 11:40:45', '2020-03-19 11:40:45', '2021-03-19 11:40:45'),
('37a11b2d6054a3a1e0e4014960fedcdb5e26afd7887191aad59d1aae6187dad7108e77ce667e51c3', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 15:39:48', '2019-05-09 15:39:48', '2020-05-09 15:39:48'),
('37de8f5e60d3acb2399a42a714915f692a50bcfc92480c4c4086d515e649f5f5f608267df8448a81', 1, 11, 'ONCOassist', '[]', 0, '2020-03-16 05:13:48', '2020-03-16 05:13:48', '2021-03-16 05:13:48'),
('37f49b71a8aaa3c5a0d2ec2dd17041a262dba3ef0cae4b57c1afeda66cb52c02826c21c97de26b47', 1, 11, 'ONCOassist', '[]', 0, '2019-04-09 08:16:01', '2019-04-09 08:16:01', '2020-04-09 08:16:01'),
('37ff70e3af2936dee5c1dc3327e59ea6574f0e593fe1592b69f4709c729743e60232123a8a362ef0', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-06 23:47:00', '2020-01-06 23:47:00', '2021-01-07 05:17:00'),
('38335c4e07c0df64c8e5d7bf5c4a9af1186ef0a0bc6094e2d6f9a051dd3f97cd85089ad06fe70a57', 1, 11, 'ONCOassist', '[]', 0, '2018-09-14 13:23:33', '2018-09-14 13:23:33', '2019-09-14 06:23:33'),
('386019d58f594944f3165a13b11739806c05730739595b12c82e4add3dd42fde3c9d72863cdc43bd', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 05:30:01', '2019-11-04 05:30:01', '2020-11-04 11:00:01'),
('3882fa9a918b12fd795f70e88b23a47c12e49a0da79cb0f254b0532f924c2af9013807d8e085345e', 1, 11, 'ONCOassist', '[]', 0, '2018-11-14 12:46:55', '2018-11-14 12:46:55', '2019-11-14 12:46:55'),
('38a1e9d0b84ffbea61a233bc440e29f6a6cf0edeafe386d876521e7d06a54527a4184ab9bc831399', 1, 11, 'ONCOassist', '[]', 0, '2020-04-02 07:09:15', '2020-04-02 07:09:15', '2021-04-02 07:09:15'),
('38fd8c81d6f0339325ce10d3b11c3f86ce037b573f9c1439583ffdfb56c06f1a16939b4ce3a9b8c0', 1, 5, 'ONCOassist', '[]', 0, '2018-06-13 23:16:52', '2018-06-13 23:16:52', '2019-06-14 04:46:52'),
('3921ef8727eca1396e8b639cd1dabdd38eb8509fc0d537bb5c6b16aa9e1ae4aba44eff6fb2212c5c', 1, 11, 'ONCOassist', '[]', 0, '2019-11-27 02:31:26', '2019-11-27 02:31:26', '2020-11-27 08:01:26'),
('392ead859546a1c3384cddd3cfcdf7006a1212b545508e3ee3273711a6b56f8d418f810ea8a72ca5', 1, 11, 'ONCOassist', '[]', 0, '2020-04-17 06:53:47', '2020-04-17 06:53:47', '2021-04-17 06:53:47'),
('39430e5303fc4ec9c80c5daaea3549e312cae320987409ddb4c491103923b4415494003d96169c2d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 01:20:30', '2019-11-07 01:20:30', '2020-11-07 06:50:30'),
('39592823d90ad17e8fb386ed1f86e246c6a5fbdc4eee59248ab7005aca436ef2ecdc48e14644b5ea', 1, 11, 'ONCOassist', '[]', 0, '2018-07-26 13:10:24', '2018-07-26 13:10:24', '2019-07-26 13:10:24'),
('395de3553b4d081bf44cbc0e929346e8455063cdfeacb6c7e75358ffd5c71de02bdbb549cfd9e8a5', 1, 11, 'ONCOassist', '[]', 0, '2019-11-13 06:53:46', '2019-11-13 06:53:46', '2020-11-13 12:23:46'),
('3989ff6cbb0ea2a66175ae4d8da3f1b8447c1c29de9c004f4c1502c1186afb780cea5690b4b70fa6', 1, 11, 'ONCOassist', '[]', 0, '2019-03-26 15:12:10', '2019-03-26 15:12:10', '2020-03-26 15:12:10'),
('39c592e06e04c1e97b68f0c135dfeb8a28965018103d25cf8e11d1c4583a4b33e824e9cf4b5af42b', 1, 11, 'ONCOassist', '[]', 0, '2019-05-14 08:11:37', '2019-05-14 08:11:37', '2020-05-14 08:11:37'),
('3a1fa087497445445bd00980b3eab6be00b18287c27e6170e5ec3b8b8eb77743e36a2a58f962682f', 1, 11, 'ONCOassist', '[]', 0, '2019-01-17 13:04:54', '2019-01-17 13:04:54', '2020-01-17 13:04:54'),
('3a355be1204330e5a128c625e66ebd3550fb65200bf53a27a698cba1cf3e5e2c10803d7735ea6f06', 1, 11, 'ONCOassist', '[]', 0, '2019-04-08 17:57:09', '2019-04-08 17:57:09', '2020-04-08 17:57:09'),
('3a5dc3aeba3fab41fff1c8af68021e252b72edebf8b4308327dd2496dc9f1c0f3d8de5e56b07dc59', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 07:04:33', '2020-01-16 07:04:33', '2021-01-16 12:34:33'),
('3a7fcf61ba9102f92e3edbbf748d4b03bae906335dd952831613dc83925d8c917762e898c18694b9', 1, 11, 'ONCOassist', '[]', 0, '2019-03-29 06:40:04', '2019-03-29 06:40:04', '2020-03-29 06:40:04'),
('3a8ce3e42de67fe173e4322f9b91fd9b5fe28c1800fd757916aa041c24d66d475cf8fabfee35cc58', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:41:12', '2019-11-22 00:41:12', '2020-11-22 06:11:12'),
('3a9cc05eff1b2b0b7d14afe22103de831a88ba9f11a26a8944f040240a42b1030332740babc194cd', 1, 11, 'ONCOassist', '[]', 0, '2019-11-18 00:48:05', '2019-11-18 00:48:05', '2020-11-18 06:18:05'),
('3ac48a28c49dec4abb2bca787ab34561ab6f88f900958794d1ada81d294ff963c9210429dc1cd9ba', 1, 11, 'ONCOassist', '[]', 0, '2019-11-25 00:47:50', '2019-11-25 00:47:50', '2020-11-25 06:17:50'),
('3ad7df50b51d2d4493a82d9ad69770ade7abd430387cb8949e21c22215d0cc71dea8102c42fc3900', 1, 11, 'ONCOassist', '[]', 0, '2018-07-11 13:02:09', '2018-07-11 13:02:09', '2019-07-11 13:02:09'),
('3b056a80ab3776dc20dde8f53fb56d9f0e0f25dc557c02bd4f12985f280ebc887aff4e9f99fd625e', 1, 11, 'ONCOassist', '[]', 0, '2019-02-01 08:09:47', '2019-02-01 08:09:47', '2020-02-01 08:09:47'),
('3b32178ccce3e6d41c26264c3464139fd37b0e1a8b39a562b7e95e80790122ca3646a1e96115de07', 1, 11, 'ONCOassist', '[]', 0, '2018-11-30 10:51:45', '2018-11-30 10:51:45', '2019-11-30 10:51:45'),
('3b375f70648e3ed313a44bed4428fde08d6b2e0bc6433f713f5ed3693090b96f0bbf93a759f569c3', 1, 11, 'ONCOassist', '[]', 0, '2018-11-20 10:17:48', '2018-11-20 10:17:48', '2019-11-20 10:17:48'),
('3b4265d4a424901ae55d83c8b9139dc35b7395aa8a717a018a9273d06c193b0950be3518eca6bbf1', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:41:11', '2018-06-18 00:41:11', '2019-06-18 06:11:11'),
('3b5f82a9c81f950d2d94dac976b55b0d67b9b93c2b62d5ac0b432e03d61a323a05e4da80fa69ef58', 1, 11, 'ONCOassist', '[]', 0, '2019-04-10 15:21:21', '2019-04-10 15:21:21', '2020-04-10 15:21:21'),
('3b7c70056bc269cb71475d1dbcc93f7ae610da6fa6d938e5fa323dc7fd3de4386cc8d7ef7e52c51c', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-09 03:24:16', '2020-01-09 03:24:16', '2021-01-09 08:54:16'),
('3b960ef11a455a81a867ee7063259f89355b3fd95c23948e98ace0f0a35b3c2fdd7fbf6660e7c176', 1, 11, 'ONCOassist', '[]', 0, '2020-02-27 12:25:02', '2020-02-27 12:25:02', '2021-02-27 12:25:02'),
('3baa3b3a5f50c8e9cd3752f10e2eefe843524b8a6b5e48e56c4b01a981f4dc8bae63b6b1fd462bed', 1, 11, 'ONCOassist', '[]', 0, '2018-12-11 09:25:08', '2018-12-11 09:25:08', '2019-12-11 09:25:08'),
('3bad9a092d206ae1dbea3e88305fde5beeb4b75fe002174d7d0bb61c301b1503d75e4656d295955b', 1, 11, 'ONCOassist', '[]', 0, '2019-02-05 14:20:06', '2019-02-05 14:20:06', '2020-02-05 14:20:06'),
('3beda2df029a2d2b54f5ef99a438536055a846338af00c127f96a02c83f10a600ae7de1c7cfcf002', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 06:41:06', '2019-11-22 06:41:06', '2020-11-22 12:11:06'),
('3bf5c6c6b1daac1a36bc8cf0a96e2360d4b436410f7d51e2b139e6d9bf1c0da91b58d01af77c8b35', 1, 11, 'ONCOassist', '[]', 0, '2019-01-17 12:57:36', '2019-01-17 12:57:36', '2020-01-17 12:57:36'),
('3bf6f317b830539427c4e79b759638ebeb68fc11941b839623cb3f102e29ed506cb37ac0bba8cd49', 1, 11, 'ONCOassist', '[]', 0, '2019-05-07 17:08:37', '2019-05-07 17:08:37', '2020-05-07 17:08:37'),
('3c69689e096187525c70f7a8a2442abaa924bebc746e20c8179d968bee563b31489aef8bb7a5a1ee', 1, 11, 'ONCOassist', '[]', 0, '2019-04-24 08:21:49', '2019-04-24 08:21:49', '2020-04-24 08:21:49'),
('3ca0697be84d2b8e9d760d4e7f59e8d24a5d120f6c2010376b4dcd057a1df5bcd3d025e09133f52c', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 07:37:42', '2020-01-09 07:37:42', '2021-01-09 13:07:42'),
('3cf8608c871510a9f0cdd562bef610b3906e26ef7584ebf60129bd351b78036770092ffa7b1ae571', 1, 11, 'ONCOassist', '[]', 0, '2019-05-28 00:22:41', '2019-05-28 00:22:41', '2020-05-28 05:52:41'),
('3cfda3a5735284e35df8c000c5c43cee63e36426c75e163df37b7d6f1f0433cee425c6f8f34548c4', 1, 11, 'ONCOassist', '[]', 0, '2019-05-31 07:28:33', '2019-05-31 07:28:33', '2020-05-31 12:58:33'),
('3d3c87543cb01f75894f83ccbaa2c4cb86a27a1ea7ec61c9ecbe19a21d433532f5ca72eb3f2a329d', 1, 11, 'ONCOassist', '[]', 0, '2019-06-04 04:56:09', '2019-06-04 04:56:09', '2020-06-04 10:26:09'),
('3d632f2570327719891526e24d768176ac4bfc2c1805c08e6ce8496d8675b1392122b53d4d14090e', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 05:16:24', '2020-01-09 05:16:24', '2021-01-09 10:46:24'),
('3dd1ab2fffc066d25f115bbb1f0acfebe4b114b25049d906f6c977237162af61435e874c4e58effb', 1, 11, 'ONCOassist', '[]', 0, '2020-01-03 07:21:45', '2020-01-03 07:21:45', '2021-01-03 12:51:45'),
('3df5ba14c5f6d58f2083d092fa8bea2e8474d68f8028cb586c52fe537bc0928bbd7d463ff692cd6f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 04:16:15', '2019-11-06 04:16:15', '2020-11-06 09:46:15'),
('3e0dfd63c3b305b6eaeaa87eb1650c4494877f31d20e961d1bbbd90b18b8060b25066c95dde78c4b', 1, 11, 'ONCOassist', '[]', 0, '2019-02-05 10:24:27', '2019-02-05 10:24:27', '2020-02-05 10:24:27'),
('3e0fc21a54ae7ec226388237cf6c26bfc109505aee3c1afccdf8e2192633e687c538770f0d4197c2', 1, 5, 'ONCOassist', '[]', 0, '2018-05-30 05:30:23', '2018-05-30 05:30:23', '2019-05-30 11:00:23'),
('3e2fe69d684d82101fdef1994b1d64a028289fd22cb251056b8a896d48ff82cb114d43583dc3478a', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 01:01:53', '2020-01-17 01:01:53', '2021-01-17 06:31:53'),
('3e7b01e7d3b45112131d754f5d17c73a5c6d717eec7e8b0ffe18efde2fb2fc52d31f6450437a4b75', 1, 11, 'ONCOassist', '[]', 0, '2019-01-16 12:39:45', '2019-01-16 12:39:45', '2020-01-16 12:39:45'),
('3eaf8801d0341eb38ac66b1c8cee11b74f0f153f24135f03e58fe45e7c6f8f7cd09e1c7fd111d76c', 1, 11, 'ONCOassist', '[]', 0, '2019-07-16 06:13:12', '2019-07-16 06:13:12', '2020-07-16 11:43:12'),
('3eb8ad461601231cce82a875475ce5022e7a2ce85000730519856688661581e847c3184064de314a', 1, 11, 'ONCOassist', '[]', 0, '2019-07-16 04:35:30', '2019-07-16 04:35:30', '2020-07-16 10:05:30'),
('3ebdb28f95c62827503cf4b27506158402ffd35783dec18a74e957c09c78bd4745d020d639e58132', 1, 11, 'ONCOassist', '[]', 0, '2019-01-10 06:56:08', '2019-01-10 06:56:08', '2020-01-10 06:56:08'),
('3ec6eaf278c620c98a0cb2c71c80116fa5849eed606db079adb2baf03549f83a422786b35ee1a302', 1, 11, 'ONCOassist', '[]', 0, '2020-02-26 13:20:56', '2020-02-26 13:20:56', '2021-02-26 13:20:56'),
('3efb1b0b0fe453344c18f5cfc0ac495483d7e5b0de6616c6fa8f4d2597c598a29870785e82b0790f', 1, 11, 'ONCOassist', '[]', 0, '2020-03-06 05:54:07', '2020-03-06 05:54:07', '2021-03-06 05:54:07'),
('3f1424ef5561663a154c6940de64de9fcc023f8b4a2a53e5e927d9cb389251c4df78eee8176bdc5b', 1, 11, 'ONCOassist', '[]', 0, '2018-12-11 17:03:08', '2018-12-11 17:03:08', '2019-12-11 17:03:08'),
('3f515c2517a59345cd334f1b908dffa721b60773cd07b2ca4953a303c758c9c7cbbedcdec8260107', 1, 11, 'ONCOassist', '[]', 0, '2019-02-21 06:08:02', '2019-02-21 06:08:02', '2020-02-21 06:08:02'),
('3fb73523072eca33bcbadbc02d4eb8a33c035f46408237a2154c4b8a19881fb0911b899ba1f0aa87', 1, 11, 'ONCOassist', '[]', 0, '2020-01-03 06:18:24', '2020-01-03 06:18:24', '2021-01-03 11:48:24'),
('3febad7d38e765438ae5ee66027390ff6359e129401142957fc6fc050e66d9f8536f438b10039bf7', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 04:05:16', '2019-11-07 04:05:16', '2020-11-07 09:35:16'),
('40168be04475ad01bdff2f4078c0489f767d2a7eb0de613e138a7e29e8de9d8bcfce547e476243dc', 1, 11, 'ONCOassist', '[]', 0, '2020-02-27 10:19:05', '2020-02-27 10:19:05', '2021-02-27 10:19:05'),
('402ca1f642555b59a046ae39832c8817a53463a8818e155684088b87c3d01ebd6f8d4b96b1b1c403', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 05:32:45', '2019-11-06 05:32:45', '2020-11-06 11:02:45'),
('40350ce8f008876163a4d93d8981b687aad0c95bfce0ec4645528ed9ce73311e9140a4fabddd767c', 1, 11, 'ONCOassist', '[]', 0, '2019-02-11 11:18:34', '2019-02-11 11:18:34', '2020-02-11 11:18:34'),
('4057b9e71eef25c6c6d7c3e4e0069afa5eb885ce810a35179fd969ff254fddf461d0c2a5060f799f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 01:17:12', '2019-11-21 01:17:12', '2020-11-21 06:47:12'),
('4070ab0f387a24eeea809bf822f6b89c2f71f8c521bf86c0a0e191a909180c7f1ce45c837591b9c5', 1, 11, 'ONCOassist', '[]', 0, '2020-04-03 06:04:11', '2020-04-03 06:04:11', '2021-04-03 06:04:11'),
('407ac35df90d2e230fcc4bb1f19d2fdaba2a385ce01ecc01793b541919ce25012e70bb53ffde3a3d', 1, 11, 'ONCOassist', '[]', 0, '2019-02-11 08:45:07', '2019-02-11 08:45:07', '2020-02-11 08:45:07'),
('40fd2b50c461e8fb679dd91ef47cf43486f200273346f65311e1361405b5aa2192cb9ea5ce3c1cb7', 1, 11, 'ONCOassist', '[]', 0, '2018-07-31 06:01:19', '2018-07-31 06:01:19', '2019-07-31 06:01:19'),
('411aa662d1985eda537f0c77bf1f039e08bf0053da1b4af5f7981da4596941c939025359e9b7a505', 1, 11, 'ONCOassist', '[]', 0, '2019-04-01 10:01:58', '2019-04-01 10:01:58', '2020-04-01 10:01:58'),
('41643729c3d47913db859246d4a97249f39d6817827713e602c9f16ecd34d160f35c671ebcb3bc94', 1, 11, 'ONCOassist', '[]', 0, '2020-03-02 09:23:25', '2020-03-02 09:23:25', '2021-03-02 09:23:25'),
('416f27d4a422e4d0c8f91a493a12329568206966f023868b98ca1ba4d753ba9061f55cbf1c9f7661', 1, 11, 'ONCOassist', '[]', 0, '2019-04-25 08:11:17', '2019-04-25 08:11:17', '2020-04-25 08:11:17'),
('417809e2bf6cfbca4ff0b6f795ff9cdf4737b8a03a714de1a375605b5460f2b547771026b36df81f', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 08:01:42', '2020-01-16 08:01:42', '2021-01-16 13:31:42'),
('417994140786972ad77e62fdcd07f8f4ea4f3ec4dc0c01401347f6cdf33bd79d2c32c28bd869355c', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 09:55:51', '2019-02-13 09:55:51', '2020-02-13 09:55:51'),
('41c1126faa664e8c7d8b1c3afcf8fdc7889ff674dfdba83d76f42e262cb695e9a01a1695a728718c', 1, 11, 'ONCOassist', '[]', 0, '2018-06-25 04:24:26', '2018-06-25 04:24:26', '2019-06-25 09:54:26'),
('41fca3d48d193024b862dc21c8df8a5b25ff433d0aa4add03d38d817b38b194fb3e4be408f7a2869', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 05:21:28', '2020-01-15 05:21:28', '2021-01-15 10:51:28'),
('41fd4745f1ca643540a3e7a8c31ea6ef64d8e415ebb520f067a7934942a13c5be8d083cb3dcf5b64', 1, 11, 'ONCOassist', '[]', 0, '2018-11-14 12:00:28', '2018-11-14 12:00:28', '2019-11-14 12:00:28'),
('42286617bbf026218f39c0c17451da8c0b5b0d262555fd90141ce394b9509ea8e5b9d62d2a19d7ff', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 06:17:47', '2019-11-21 06:17:47', '2020-11-21 11:47:47'),
('4265aa74e3a20bbea5629aa1ab4718075f0ceb0ee9c09f21d3ef37459fbb136635e6565137156646', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 03:22:08', '2020-01-16 03:22:08', '2021-01-16 08:52:08'),
('4279449d3bb18d2ed72bcb5d4f038958b89c7c03af2e53c9eb5ce5c07aea6874df98244622e37c8c', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 07:26:42', '2020-01-15 07:26:42', '2021-01-15 12:56:42'),
('42a0889d32a1dad9e158a091c6b946dfa0876f9e92316033d540f09c98f411bcbaf5bd76cab1667b', 1, 11, 'ONCOassist', '[]', 0, '2019-04-08 06:33:54', '2019-04-08 06:33:54', '2020-04-08 06:33:54'),
('42a306853616cd4724fe0f87a63a044ba7fff91e59bba59521481356b1179db766337c548ce92756', 1, 11, 'ONCOassist', '[]', 0, '2019-06-09 23:42:20', '2019-06-09 23:42:20', '2020-06-10 05:12:20'),
('42aabc684cacf00e816da8d4e08e978e35b979cddb638b660f4a62ed2a1b3779131fa3e5bdf89267', 1, 11, 'ONCOassist', '[]', 0, '2019-02-27 18:41:38', '2019-02-27 18:41:38', '2020-02-27 18:41:38'),
('430201515b71bbd6b062428c0b589783772d0207193c42114122c1ff7a67789695154fe671a63f41', 1, 11, 'ONCOassist', '[]', 0, '2018-11-05 05:55:41', '2018-11-05 05:55:41', '2019-11-05 05:55:41'),
('430f2e722742a6d45bf3152dc7cb551e613b7b256de63e7f7d2ba805652ce1f6c2df2bc1d691610e', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 02:41:40', '2020-01-15 02:41:40', '2021-01-15 08:11:40'),
('431af3fda24be4996906a5693606640c572f1fe88709613b8e57c30084fb8678185d9fbbcba9d64d', 1, 11, 'ONCOassist', '[]', 0, '2019-02-05 05:36:55', '2019-02-05 05:36:55', '2020-02-05 05:36:55'),
('4333f07a0b7f1b47146c67d2706193e7c33e3eaaf9b8706d1ef0391afe1709cbb6411b92febcf682', 1, 11, 'ONCOassist', '[]', 0, '2019-11-15 05:06:29', '2019-11-15 05:06:29', '2020-11-15 10:36:29'),
('433b30d5f1538b6297febca1dbf709eeeb02e1b54a960088cf85afc9d00ee4b4dadaf7602a79d095', 1, 11, 'ONCOassist', '[]', 0, '2020-03-06 04:57:55', '2020-03-06 04:57:55', '2021-03-06 04:57:55'),
('4359083ef69fb9229ecdaee3f59e476dec2ee33d6a03c9eaa652e277ba0132e4e0a830d9cdfc9d86', 1, 11, 'ONCOassist', '[]', 0, '2018-08-31 11:19:51', '2018-08-31 11:19:51', '2019-08-31 11:19:51'),
('4369d6cfacbb80e71ae37ea65c6b79f115e482100c774e615431656944cd80d436ec66608339f78f', 1, 11, 'ONCOassist', '[]', 0, '2020-02-21 05:50:01', '2020-02-21 05:50:01', '2021-02-21 11:20:01'),
('4389fd00026fc7fd73e67f576076a63167136d08b9a78422791f31e47f189d639025c45ff2d82a1d', 1, 11, 'ONCOassist', '[]', 0, '2018-07-26 14:03:38', '2018-07-26 14:03:38', '2019-07-26 14:03:38'),
('43c02a9ce8c38569e19a4eb9f9c52143c20cdb5d22ff9f48b1c7bfde0e4d553ca79b4176728b092e', 1, 11, 'ONCOassist', '[]', 0, '2018-06-19 01:11:11', '2018-06-19 01:11:11', '2019-06-19 06:41:11'),
('43c3890f4ae54c2ed952812888e7b523b6e8ab3edfa9e624f8079b0b74028609008d19f86d32cbe3', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 06:28:19', '2019-11-07 06:28:19', '2020-11-07 11:58:19'),
('43e151dac65486fa51c7cbefdc9d1a19df8256cd8fe12e4b6338f4168e955d9213d08c9a8b4beb1d', 1, 5, 'ONCOassist', '[]', 0, '2018-06-14 23:07:58', '2018-06-14 23:07:58', '2019-06-15 04:37:58'),
('43f057869deff6ef63547a4401398bad2e3755d6065f14771819e7e67c000090656b69bba61ac83c', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 05:23:47', '2020-01-16 05:23:47', '2021-01-16 10:53:47'),
('4426c26b4eeddf8ccc091dc831ad9fa6df5d14f50abe3e23e611d2997fbd3102843eed75bb292e76', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 09:20:09', '2018-12-18 09:20:09', '2019-12-18 09:20:09'),
('4492971fcdfdf6746245324612cdf5fb249b1a5fef2e788fd0dabe4cf007b9da3f2736abf2927c53', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-13 08:17:19', '2020-01-13 08:17:19', '2021-01-13 13:47:19'),
('44a11deb28bcdd0210cc95c9cf7a85875e6510db1c93f14301ad704fd4151a6ab52246e2c2c7180a', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:13:06', '2020-01-15 03:13:06', '2021-01-15 08:43:06'),
('44c402ab77547f7eefeed9afaacf0facfe81a71e99a637d39b79aaee12cdfee3cba7644e44eed16d', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 09:59:19', '2020-04-20 09:59:19', '2021-04-20 09:59:19'),
('450bc506c3185a6e175cdc05bc0d15e9ce49418417968d9a0813333129cd74d422a72c42496d21ba', 1, 11, 'ONCOassist', '[]', 0, '2019-11-25 00:27:09', '2019-11-25 00:27:09', '2020-11-25 05:57:09'),
('451b67423e08ef01148f0703278130bcee4eb356a0dd127f53fe23df0a9cfa113c6ab68dd0c3f4ea', 1, 11, 'ONCOassist', '[]', 0, '2020-01-03 07:03:01', '2020-01-03 07:03:01', '2021-01-03 12:33:01'),
('45d26aed7a0d5d84fd05c25934ce3a574cd82be450f9186512774b973f63b9f5913a213d86470a0f', 1, 11, 'ONCOassist', '[]', 0, '2019-02-06 07:34:07', '2019-02-06 07:34:07', '2020-02-06 07:34:07'),
('45d8bd112f28b31bb7942197ad66584637ae0208ecf8bfbaa9e335afe0ab57c873aeb61a245d665b', 1, 11, 'ONCOassist', '[]', 0, '2020-03-06 11:16:36', '2020-03-06 11:16:36', '2021-03-06 11:16:36'),
('462ec62620cecd0e103242266fae07258d89f00d23fa82f68ccc5ccc520c13ddca4bde5ea21cd63c', 1, 11, 'ONCOassist', '[]', 0, '2018-11-01 05:59:25', '2018-11-01 05:59:25', '2019-11-01 05:59:25'),
('46472aba7ae216e7dd458d6d1ee6727a7b8491d5ac21d53e91bde1b3ff41740812f255df2faf6000', 1, 11, 'ONCOassist', '[]', 0, '2019-07-10 06:37:45', '2019-07-10 06:37:45', '2020-07-10 12:07:45'),
('465ac706c94e3e91c0529d8019335e57a849f04e1a5744a605674576c700cc0b68d86d90956433ad', 1, 11, 'ONCOassist', '[]', 0, '2018-09-05 13:58:50', '2018-09-05 13:58:50', '2019-09-05 13:58:50'),
('4677c0097fccee71d0c49ed91562aa383bc87ff450f6cb8878a7e70b19369a8febae03ef3056f355', 1, 11, 'ONCOassist', '[]', 0, '2018-09-04 11:26:51', '2018-09-04 11:26:51', '2019-09-04 11:26:51'),
('46bd4265135505f721c1820c9c753e1002c227c03404b2731a40a393b59178810bbe741b181370ef', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:01:17', '2020-01-16 06:01:17', '2021-01-16 11:31:17'),
('47085bccf808c85942933ba0c5d3beedaa73a45e678c42bf31e2a4649e8cda29aa4d3d520931f6b9', 1, 11, 'ONCOassist', '[]', 0, '2019-11-26 04:04:09', '2019-11-26 04:04:09', '2020-11-26 09:34:09'),
('470bcaf700525bcd62971b88518d3b5f98516f6879c88b138950357a6bf5fae9caee95203af385d4', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:32:31', '2020-01-16 06:32:31', '2021-01-16 12:02:31'),
('473639a224173fdb9b375d5938ebecd955988aa79ddc9c1efebcc0b1e168db63c05cb23969f7f639', 1, 11, 'ONCOassist', '[]', 0, '2020-04-06 05:15:17', '2020-04-06 05:15:17', '2021-04-06 05:15:17'),
('473b2de06bc8433e52ba2a3de5b0f5cb86627463c76d3d5921f27a3396a5fedacdf4de7cdf16991a', 1, 11, 'ONCOassist', '[]', 0, '2019-04-10 11:11:23', '2019-04-10 11:11:23', '2020-04-10 11:11:23'),
('476847cb6ec44d9eeeee267bb93c366c645fb8b290a8b94b231bb2a58273eefdc71684f3b5a32cf7', 1, 11, 'ONCOassist', '[]', 0, '2019-03-19 09:36:40', '2019-03-19 09:36:40', '2020-03-19 09:36:40'),
('47a1a26b4fc0fc9c0304176a64068913ff15e17e935505c3362b1b6f3a2b11c781e6e23dedce8bd8', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 01:02:42', '2020-01-15 01:02:42', '2021-01-15 06:32:42'),
('47b4bb2e49112633d02b1dbcec1c29b645ea0443657493e9de71abde9990b3181a761e724ded28af', 1, 11, 'ONCOassist', '[]', 0, '2019-07-16 06:22:34', '2019-07-16 06:22:34', '2020-07-16 11:52:34'),
('47bb8c86eaf1dc74b3b60fb6bec807d772048b6569e9631361fd7c3ccc5217941840d135f7a3bf44', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 05:16:56', '2019-02-13 05:16:56', '2020-02-13 05:16:56'),
('47d09b41e68d976c2d174a56b516a85a69fe1c4cdb6db7e0ceb108976a585f484e1e73cd2a7557b3', 1, 11, 'ONCOassist', '[]', 0, '2019-05-28 00:26:30', '2019-05-28 00:26:30', '2020-05-28 05:56:30'),
('47fc55197b0d89b6a0af81c13d7a1d6bb0e7d65577f9bac9d022b9da5468c6ad727db674d39fbd64', 1, 11, 'ONCOassist', '[]', 0, '2019-11-30 00:34:37', '2019-11-30 00:34:37', '2020-11-30 06:04:37'),
('47fcf5286ad78df92fd666e06644175cff0a62f97b8318a038d67c163eace0513a638abd53276bcd', 1, 11, 'ONCOassist', '[]', 0, '2019-05-17 02:50:19', '2019-05-17 02:50:19', '2020-05-17 08:20:19'),
('4806c78aeb7d6e2909b483e90d4d5256c9363af978c393a60a8fa2812e6c2b0a8737003e2dd35754', 1, 11, 'ONCOassist', '[]', 0, '2019-01-22 11:50:01', '2019-01-22 11:50:01', '2020-01-22 11:50:01'),
('483840af6773519f8943ab61892c2491f4c484e397673e0debdecd9bbd10ff3d41cc19299fae3a7f', 1, 11, 'ONCOassist', '[]', 0, '2020-02-24 03:41:37', '2020-02-24 03:41:37', '2021-02-24 09:11:37'),
('48af6ec4ad02e6d32492f8db3828d5d355af75ecc217b82ff4d2da2041626c2f8b6e62e3f2f9d524', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 00:49:16', '2019-11-04 00:49:16', '2020-11-04 06:19:16'),
('48afd69d1205497ab11b5b8451e9b3e0713b0a9792da298099379d9c147c5e3630b8640d847dbb29', 1, 11, 'ONCOassist', '[]', 0, '2018-08-31 11:19:58', '2018-08-31 11:19:58', '2019-08-31 11:19:58'),
('48b274d378367ee156fb36c94fc966d54ea7d7a45221ad4868d5457c592cfc2ad001ce335b33d790', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:25:28', '2020-01-16 02:25:28', '2021-01-16 07:55:28'),
('48b95213f385519682c8421a6cb12927bc6482d5dca4c087ed3ac65615acc315159412472470a1ee', 1, 11, 'ONCOassist', '[]', 0, '2019-05-08 08:11:23', '2019-05-08 08:11:23', '2020-05-08 08:11:23'),
('48d916b6843221616e6302bc5790e85515615c13925a2317d3f092f42f189098a5b189c4bb831353', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-20 23:41:06', '2020-01-20 23:41:06', '2021-01-21 05:11:06'),
('48ec9c4ba74933b4e60716dfb237c4aac1a881c8882baa2280fab66b4f118efa5ed1c383a70cb9d5', 1, 11, 'ONCOassist', '[]', 0, '2019-06-28 05:19:41', '2019-06-28 05:19:41', '2020-06-28 10:49:41'),
('48f72edca24970f43d7cacbdc830927a5ca03c665bec15dfb2fc5f9f9a0633997298fe304152bbb7', 1, 11, 'ONCOassist', '[]', 0, '2020-02-21 05:38:40', '2020-02-21 05:38:40', '2021-02-21 11:08:40'),
('48fc799fa7e1911da7ccf15a39fe953575c4f4ec9e10b19fbb9be1c05433660d044ef91d5dc3f797', 1, 11, 'ONCOassist', '[]', 0, '2019-04-05 08:54:45', '2019-04-05 08:54:45', '2020-04-05 08:54:45'),
('48fead585993c32669f7695f6ede129a916c6e7ba16c850c82665e79e44c66ff3c250fa41d627600', 1, 11, 'ONCOassist', '[]', 0, '2019-11-12 08:07:10', '2019-11-12 08:07:10', '2020-11-12 13:37:10'),
('4931d49611d282bc911317c449dffd3e269268d444798b218dac4ef2af78f28c5432727bb89ac3c5', 1, 11, 'ONCOassist', '[]', 0, '2019-04-12 08:05:49', '2019-04-12 08:05:49', '2020-04-12 08:05:49'),
('4938e826bce8fe3a57abb84b6fe29d3d5852f5425cc618fe5e165c2494b80ed63d19e15bad389312', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 03:01:19', '2020-01-16 03:01:19', '2021-01-16 08:31:19'),
('4939e42d66a8cefc20264bb7967852b7e5b5d783312ef023b82372ecc037ff311dde77c279cfeca7', 1, 11, 'ONCOassist', '[]', 0, '2019-03-19 09:07:06', '2019-03-19 09:07:06', '2020-03-19 09:07:06'),
('49890d60432187d6866d7923ab783b83c73f24a8114d50d6b72985418430b461e28e760a441c3f83', 1, 11, 'ONCOassist', '[]', 0, '2020-02-26 13:21:57', '2020-02-26 13:21:57', '2021-02-26 13:21:57'),
('49ad40251ae3486d0dfa15c69cfcc00fadb813edf0de29e2239cef2976464e7114042e1143ace49a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-27 07:17:38', '2019-11-27 07:17:38', '2020-11-27 12:47:38'),
('49c630fd98d83a50842b2b2c5babb2f2e13d1e7ec81ca66ea90ccd00ae8725bae53d8569e042f2d0', 1, 11, 'ONCOassist', '[]', 0, '2019-02-14 19:46:14', '2019-02-14 19:46:14', '2020-02-14 19:46:14'),
('4a28da9f38499a9e980bc674f68301f226e95095825ddaff6dee01088d419d656fc7265f43ddc9b7', 1, 11, 'ONCOassist', '[]', 0, '2020-04-16 06:07:24', '2020-04-16 06:07:24', '2021-04-16 06:07:24'),
('4a49bedf383f7dcb6e62634b7a3dbd10b81583531b2182089d7154a78b245c95c5ac7f810423755b', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 03:21:58', '2020-01-16 03:21:58', '2021-01-16 08:51:58'),
('4a65b901449a3bf6b0700f45dfdd124dc452f052a375589e394bb6783634b139c8ed52de2823cad0', 1, 11, 'ONCOassist', '[]', 0, '2019-02-21 07:34:04', '2019-02-21 07:34:04', '2020-02-21 07:34:04'),
('4a79f3a4ee30fb078d1faa4bec50800c2329fc9d426190fe52ac89e62387abc3b569f8b1bf115bff', 1, 11, 'ONCOassist', '[]', 0, '2019-11-18 02:24:17', '2019-11-18 02:24:17', '2020-11-18 07:54:17'),
('4b39c520b52e4e064f6014c321f8de24fc7f702db9faba4d420e432a49dce2e3be06b405b46e2cc6', 1, 11, 'ONCOassist', '[]', 0, '2018-06-19 04:48:59', '2018-06-19 04:48:59', '2019-06-19 10:18:59'),
('4b4d9d03538ecee1bb78796c49a9086b1be59e2de3bde380d74cd34c2ca128d6a0390a053f52f28d', 1, 11, 'ONCOassist', '[]', 0, '2018-07-31 07:06:28', '2018-07-31 07:06:28', '2019-07-31 07:06:28'),
('4b4fb82521d84dc2680d7e1c6e09bf292d12ab210ac672d4442de84b276f3325ff2b31252b0d84ac', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 05:42:47', '2019-11-22 05:42:47', '2020-11-22 11:12:47'),
('4b585d16fe1da70adc3ba21f3c96c70d37d7f9ab619bb574563e6c611c648e71fc11124a3f22af50', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-09 03:21:16', '2020-01-09 03:21:16', '2021-01-09 08:51:16'),
('4b85861502cdc98a1917660fa3cc75e5648263c5e714a93347b19e8b98e547026854c1d361e43e94', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:16:49', '2020-01-16 06:16:49', '2021-01-16 11:46:49'),
('4b86727cce331207a8c965b49a232db1d2a8de3a171a87cfaeda4129b655728102008aa38372d596', 1, 11, 'ONCOassist', '[]', 0, '2018-11-23 08:34:42', '2018-11-23 08:34:42', '2019-11-23 08:34:42');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('4b8ff732f62c0555acd2f7134d64f6020cfffc6646968cf3cc14ce3d4a3f1f52b2e66b3b00c940e8', 1, 5, 'ONCOassist', '[]', 0, '2018-05-29 00:19:51', '2018-05-29 00:19:51', '2019-05-29 05:49:51'),
('4be481133efa1fbd76e4a5751de594e4c3a24e886de93623af07ca13bc2bfa2801fabb86cc76fb16', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-23 01:52:00', '2020-01-23 01:52:00', '2021-01-23 07:22:00'),
('4be97a6f0e2ba9636099842e741f7c92740d39357fe8778e460a4b18e4ac929821231c46e35ffedf', 1, 11, 'ONCOassist', '[]', 0, '2019-02-11 11:28:46', '2019-02-11 11:28:46', '2020-02-11 11:28:46'),
('4c9f47c40f2864d79ae813760d68cbfe5efb36da6b1103ff777598b9865d4df60e8ac2128cae034e', 1, 11, 'ONCOassist', '[]', 0, '2019-06-26 00:50:29', '2019-06-26 00:50:29', '2020-06-26 06:20:29'),
('4cb581141b8542a54dc897f78c66bf9e43d526d1f85398e6323d6b6a6e892388a79b129fbf34d3fe', 1, 11, 'ONCOassist', '[]', 0, '2018-12-12 17:22:35', '2018-12-12 17:22:35', '2019-12-12 17:22:35'),
('4cb8ac4cce25ed444aefb9ec517dbdd75c43e164d1edaefe4db5b2f80d5114da41d54e60a66abf6a', 1, 11, 'ONCOassist', '[]', 0, '2019-02-20 17:27:15', '2019-02-20 17:27:15', '2020-02-20 17:27:15'),
('4ccad86db0b2a4b97c8a6b3e34eea2cb165aa88404b14a1370061607d6743c94519a84f77cb86895', 1, 11, 'ONCOassist', '[]', 0, '2019-11-18 01:18:22', '2019-11-18 01:18:22', '2020-11-18 06:48:22'),
('4cdb0e1de57936eb5ee5574f521400ac25418d11d690c86d4e06de55210a0cfaef620610acabd562', 1, 11, 'ONCOassist', '[]', 0, '2019-01-25 04:31:35', '2019-01-25 04:31:35', '2020-01-25 04:31:35'),
('4d27fbf8504d7c9031ab702defe56675007ad245a7b7550ec252d6d10f50944315b6da6da6eab5bb', 1, 11, 'ONCOassist', '[]', 0, '2019-05-03 15:11:41', '2019-05-03 15:11:41', '2020-05-03 15:11:41'),
('4d769344248ea98e4e4255ee40234751cbd58533f453af8cdc15c0186af70c60993dfffc4fffc245', 1, 11, 'ONCOassist', '[]', 0, '2019-05-08 13:51:12', '2019-05-08 13:51:12', '2020-05-08 13:51:12'),
('4d7aae2c2afb7501302cee2756e6f46f46098e4125ac9d71876ec558006dc0e1a73843c9645666bf', 1, 11, 'ONCOassist', '[]', 0, '2018-12-12 06:36:05', '2018-12-12 06:36:05', '2019-12-12 06:36:05'),
('4d8853b3f819dff609afc368d86f7e76a3a0fb5ad3bf008f107bf83b09220d5ec1edf308c92c6286', 1, 11, 'ONCOassist', '[]', 0, '2018-06-25 02:29:04', '2018-06-25 02:29:04', '2019-06-25 07:59:04'),
('4dac4420b4fe5c497f8ac5c4941075af7208601aa03c6c2a3e7f09d9c067246343df514edff900e5', 1, 11, 'ONCOassist', '[]', 0, '2019-11-26 03:17:36', '2019-11-26 03:17:36', '2020-11-26 08:47:36'),
('4dd5ff0ccb81f0d222fbc1b26d9654bedf5fa37453ba6c2f10d5b80e097aeb998e07d2571d2007d3', 1, 11, 'ONCOassist', '[]', 0, '2020-04-02 07:22:25', '2020-04-02 07:22:25', '2021-04-02 07:22:25'),
('4df5baaa8928dbe0d840be902e806e6b1c947251e2cebf4056247737a1415652284da286d243b06a', 1, 11, 'ONCOassist', '[]', 0, '2019-02-21 09:02:22', '2019-02-21 09:02:22', '2020-02-21 09:02:22'),
('4e26e971a59f2bb621beecea590917a17f21ed19da25cbdc7394bc4b20830538eb8a82379cf9a941', 1, 11, 'ONCOassist', '[]', 0, '2019-11-13 07:18:27', '2019-11-13 07:18:27', '2020-11-13 12:48:27'),
('4e7da7592432ecdfea0a486c920be3ca79beb7f4c5f894e7797f36fa94e81d8a07331a9482e1a55b', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 14:37:23', '2018-10-29 14:37:23', '2019-10-29 14:37:23'),
('4e7f791f54c582bcdb1fc467aa67f095535e5f8965ca9a29f89cbf1a980b30c37edc40e1f0f3a463', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-08 06:05:58', '2020-01-08 06:05:58', '2021-01-08 11:35:58'),
('4efbfa9c883da66d1c691cbb9271a16a00821a111a101218bc67d7ddf110ae0e6ae97ba1d710c71d', 1, 11, 'ONCOassist', '[]', 0, '2018-12-05 06:39:32', '2018-12-05 06:39:32', '2019-12-05 06:39:32'),
('4efd95c4bea955fb2064a5ffe8ff54b636714bd720d1e629c6fcfadccd2507d4a48712ff617290ba', 1, 11, 'ONCOassist', '[]', 0, '2018-12-10 13:01:57', '2018-12-10 13:01:57', '2019-12-10 13:01:57'),
('4f2441f956af16dd3324111f80befae2b672eaa3f80913d26c3d02da1bab2d73a6779f1e242c6939', 1, 11, 'ONCOassist', '[]', 0, '2018-10-04 06:51:20', '2018-10-04 06:51:20', '2019-10-04 06:51:20'),
('4f26992c4a26150be2cf8225fe03063d945ca52400530030ebdc6bfc474b01b257b296df4bfa0a52', 1, 11, 'ONCOassist', '[]', 0, '2019-10-22 01:50:26', '2019-10-22 01:50:26', '2020-10-22 07:20:26'),
('4f2ee276dea5b54576220e9bb106fbdff064018cec47991cc6d96732c021ef055e3196ee05d670fc', 1, 11, 'ONCOassist', '[]', 0, '2019-06-12 02:49:13', '2019-06-12 02:49:13', '2020-06-12 08:19:13'),
('4f2f624d8604abe22a5c7c5d5ac8537d2aeac12d040bc64f4c998b20f0425b6b4657f207076385b9', 1, 11, 'ONCOassist', '[]', 0, '2019-03-14 09:08:59', '2019-03-14 09:08:59', '2020-03-14 09:08:59'),
('4f60c2dd72b734c3d943268d244b62b76cd5f794039efc3707c0971584c81158effa433f9bea15e0', 1, 11, 'ONCOassist', '[]', 0, '2018-09-17 18:22:30', '2018-09-17 18:22:30', '2019-09-17 11:22:30'),
('4f966b058e12ee7d8a3002d1df87077e46fbc9da22d471f405d7a773970b14faa69fc830c93ee24c', 1, 11, 'ONCOassist', '[]', 0, '2019-01-31 09:53:34', '2019-01-31 09:53:34', '2020-01-31 09:53:34'),
('4fa555dc25549a819a61d2a24c330d2a5928c4993a367caf1d92aa40cfa21ac5007f8805915070ba', 1, 11, 'ONCOassist', '[]', 0, '2019-01-28 11:48:42', '2019-01-28 11:48:42', '2020-01-28 11:48:42'),
('4fc12c64842fcc997d4a075bd7739c00eab9758b5d54cb1d5abc6e299e3862d1f9e9e69e10c317d6', 1, 11, 'ONCOassist', '[]', 0, '2020-03-12 11:49:06', '2020-03-12 11:49:06', '2021-03-12 11:49:06'),
('4fd3d247bb8d86757949802d03be016c0e01d55ab8ce654e8fc42323dc06d6757400bcd22b55fe68', 1, 11, 'ONCOassist', '[]', 0, '2018-11-06 06:35:03', '2018-11-06 06:35:03', '2019-11-06 06:35:03'),
('500d3012f2b829369819d16ac21d06c18b368a1dfbf70592074b32c8da734548b7bd9ef1d97305b9', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:29:42', '2019-11-22 00:29:42', '2020-11-22 05:59:42'),
('502f038250621198d393838db04cbd888a05a2adcd47d697c174603b286326f212d3ef60f27d8dce', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 06:09:30', '2019-11-21 06:09:30', '2020-11-21 11:39:30'),
('503bb5d456e44cd7eb0f94cb838914740810ddad666678e547ffd2bd557f96a87c1f3129600e2688', 1, 11, 'ONCOassist', '[]', 0, '2018-06-20 22:58:48', '2018-06-20 22:58:48', '2019-06-21 04:28:48'),
('505a05d4318e08d7c13e67e714b157c1c228ede1cbe71faab0dba72a991acd1b5c6561494fe321da', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-13 02:50:08', '2020-01-13 02:50:08', '2021-01-13 08:20:08'),
('509dd0572c80d18d3be47778179c36c62e370f18f34a69e213b31d44801a8f2851b113439ef66d0e', 1, 11, 'ONCOassist', '[]', 0, '2019-03-29 09:17:55', '2019-03-29 09:17:55', '2020-03-29 09:17:55'),
('5140e1eab7cffd364bdea0c70fed320049c6fecabbee24c234784ab04ce10c7ad6371bddb0803f24', 1, 11, 'ONCOassist', '[]', 0, '2020-04-17 11:10:42', '2020-04-17 11:10:42', '2021-04-17 11:10:42'),
('5164b0959ef08917adbea8d6a7c4f676899fbcd2833e4d9386ae8e53758939d97351c773a608f33c', 1, 11, 'ONCOassist', '[]', 0, '2019-06-14 07:02:07', '2019-06-14 07:02:07', '2020-06-14 12:32:07'),
('516b4ac8462c23c7ca2f91e9b76aa6a93fdc3879058615c048963c2860ab86383e62f711eaae553f', 1, 11, 'ONCOassist', '[]', 0, '2019-02-06 14:13:46', '2019-02-06 14:13:46', '2020-02-06 14:13:46'),
('518a26d57535cfd596e3c44c23d8cdfe42bcbd05de43e13443e942e91d3f9ce533ea0776592aea2c', 1, 11, 'ONCOassist', '[]', 0, '2019-11-28 02:20:34', '2019-11-28 02:20:34', '2020-11-28 07:50:34'),
('5191f51941412bfc23addd3b89150e085ec248ebe2552afae4e333c0ade288176d7416bdc78c7949', 1, 11, 'ONCOassist', '[]', 0, '2019-06-05 00:18:06', '2019-06-05 00:18:06', '2020-06-05 05:48:06'),
('5198af8660317d1d28c46636cd1fdab16559f9dab654ec82032b2be59d2b8c5250beb75173d661b2', 1, 11, 'ONCOassist', '[]', 0, '2019-03-29 18:44:05', '2019-03-29 18:44:05', '2020-03-29 18:44:05'),
('51b6a0cec30e762fc8251d9e341bfb2a9ff59890f363640bc86104dfce6f6dac1e0306f5844e62c5', 1, 11, 'ONCOassist', '[]', 0, '2018-08-02 12:43:10', '2018-08-02 12:43:10', '2019-08-02 12:43:10'),
('51bcac4edc471f217b80895a45880324c4792e5f55108ec6e13bad87b2458e6ff87d492d94df56cd', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:06:00', '2020-01-16 06:06:00', '2021-01-16 11:36:00'),
('52178e7fccea4cd4be5c8f5a9b7351691c7505900aa380e9b21ce34b6543569add8c60e8ba164771', 1, 11, 'ONCOassist', '[]', 0, '2020-04-29 13:32:17', '2020-04-29 13:32:17', '2021-04-29 13:32:17'),
('52311a56169fcec3b07acbae8d38fe59cf9e49df06ccc3abde68a5c7500e62b3f7f403abeadebd8d', 1, 11, 'ONCOassist', '[]', 0, '2018-09-05 13:48:53', '2018-09-05 13:48:53', '2019-09-05 13:48:53'),
('523d195c13dfcaa7dcd98bac43b20b82a6f14403ae68fbacb3b3651e27e9764285dd7822edbd5d93', 1, 11, 'ONCOassist', '[]', 0, '2019-11-20 00:40:52', '2019-11-20 00:40:52', '2020-11-20 06:10:52'),
('52473ba0204b994df1609bc8e93a95a591bd8f8c42c20f5fc8d90d4bd3cd50a44121053221747714', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 15:14:21', '2020-04-20 15:14:21', '2021-04-20 15:14:21'),
('5274c65331ccecbd46b95e497e49343e459d473c9dbd45e41249583c7e9f5c60baf990d962ba6155', 1, 11, 'ONCOassist', '[]', 0, '2018-12-10 09:21:35', '2018-12-10 09:21:35', '2019-12-10 09:21:35'),
('5296ee2c9617084589261e21442c7cbd751029aa19dc5caa5c1bc6cf89213a01ea28b52d8fae1109', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 06:57:25', '2019-11-06 06:57:25', '2020-11-06 12:27:25'),
('52ba4cf1ec354f8cacf54f5703219229554ea8251db28e7972757010f6a6018f5a6b4e73c846558f', 1, 11, 'ONCOassist', '[]', 0, '2019-05-03 08:21:46', '2019-05-03 08:21:46', '2020-05-03 08:21:46'),
('52ea5b39937205af0e0f4d53e8f0fdeec99009b85204275e083f96e9a912eb12ad906864ce6d18cf', 1, 11, 'ONCOassist', '[]', 0, '2019-11-19 05:43:14', '2019-11-19 05:43:14', '2020-11-19 11:13:14'),
('530ba3bd7c1517817760adc457a7d16e5aca2f32de0e4c1f13de35e665ce8a8bb25679f54e874b86', 1, 11, 'ONCOassist', '[]', 0, '2018-08-03 15:22:59', '2018-08-03 15:22:59', '2019-08-03 15:22:59'),
('53bcef574b93a0ed80fbb7622fa4aeb78134cb157b97a4a29b8bee183320e7bb20b1c53170b946b7', 1, 11, 'ONCOassist', '[]', 0, '2019-01-17 05:13:20', '2019-01-17 05:13:20', '2020-01-17 05:13:20'),
('53c483cf20d43fc727cee70cae74a9436c85f29e660b2c806b99e3cf3d46892b702b9a35f13aace7', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:32:57', '2020-01-17 00:32:57', '2021-01-17 06:02:57'),
('53d014587027c3f68413744319002723264be24db80e25120b0a587b581810233f437ce3484e87a6', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 05:07:24', '2018-10-30 05:07:24', '2019-10-30 05:07:24'),
('53dde83a066e30cb388317ece6667868e3f44c983c0f769981ac6e06896b87b174426534e9c34daf', 1, 11, 'AIBotDemo', '[]', 0, '2020-02-20 07:30:13', '2020-02-20 07:30:13', '2021-02-20 13:00:13'),
('53e5ab809c185cf9c8694b92c721fc9537ac1417287551c1ed6a9b8c7709665fd159b778984f6e9b', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 13:54:25', '2020-04-20 13:54:25', '2021-04-20 13:54:25'),
('541c54a0ee8e857721e2afe08eb155f7e78d6f50b9ca44339891e319256a5c812b3bbeba73f0d7f6', 1, 11, 'ONCOassist', '[]', 0, '2018-07-24 11:31:56', '2018-07-24 11:31:56', '2019-07-24 11:31:56'),
('541d8aa1a90602f374cbfac58178227eb6484768b7accfca9cd363beebb149749e7d307db71f0f07', 1, 11, 'ONCOassist', '[]', 0, '2020-02-24 04:19:32', '2020-02-24 04:19:32', '2021-02-24 09:49:32'),
('543f80997c5e1cf4b87227d401d89b4f1f12803b6bef7f1a32817f513a3bc9440b91a57d9958c412', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 04:31:15', '2019-11-04 04:31:15', '2020-11-04 10:01:15'),
('545514633454d3ec7626a55a6f82d6be62b5dd8df3c2b1ae66ee9e07afe60797552f9adb28380b09', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:39:18', '2019-11-22 00:39:18', '2020-11-22 06:09:18'),
('545c3296aa984f0a2f4e16cfd67dd5cbfb46efdbe1f6730a4cbaa926cd5a4b5d3ab2f6e46bf19ebd', 1, 11, 'ONCOassist', '[]', 0, '2018-09-12 18:21:38', '2018-09-12 18:21:38', '2019-09-12 11:21:38'),
('54d3ae88de367c1d4bae895e86e9f247954dd9a5023296f7b6bb476670bc2690fd2528f7e05055a2', 1, 11, 'ONCOassist', '[]', 0, '2019-03-28 09:04:14', '2019-03-28 09:04:14', '2020-03-28 09:04:14'),
('54edf3a24126cd98849cc5e71cf0fdc360db0ada9a489d31c04d1fa4cf6f8082b96f21693d8365e5', 1, 11, 'ONCOassist', '[]', 0, '2019-11-27 03:57:08', '2019-11-27 03:57:08', '2020-11-27 09:27:08'),
('54ee8851a9b4e4a9a15cbad3ff77ae0e3b589ccfb5faaadb4b1e098177389cc5851570b356ec19de', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 07:58:50', '2019-11-05 07:58:50', '2020-11-05 13:28:50'),
('54f42b344ad0d8caef136ac0ebaeebb05a0819281d4b5c9bdab3b9c4272508ec22c9825c25906077', 1, 11, 'ONCOassist', '[]', 0, '2019-03-26 09:04:03', '2019-03-26 09:04:03', '2020-03-26 09:04:03'),
('54f79ef748661cf52197344a3aa47ddb1b477e71eac8238ef51ec3f9056415943e13baf0d176c1e4', 1, 11, 'ONCOassist', '[]', 0, '2018-11-22 23:42:29', '2018-11-22 23:42:29', '2019-11-22 16:42:29'),
('55130739594bbee59832f63560fcb97f84fb6d8806a0940eb1268bd281cc2828efafffef080f024a', 1, 11, 'ONCOassist', '[]', 0, '2019-01-17 11:43:27', '2019-01-17 11:43:27', '2020-01-17 11:43:27'),
('5525fa83bec92eb5345030d4fd6d5ffac6b7ba90c7f2ecc6f7cf83c3d64519ae2cc378b92a8caa60', 1, 11, 'ONCOassist', '[]', 0, '2019-03-20 09:31:28', '2019-03-20 09:31:28', '2020-03-20 09:31:28'),
('554695a9ae6ef4d25929c4f088cbd7681769d439fb84729424116633470b115f36c14015bdf75778', 1, 11, 'ONCOassist', '[]', 0, '2019-04-08 16:56:08', '2019-04-08 16:56:08', '2020-04-08 16:56:08'),
('55469fc001c5991d6f438c362e49d10ad0e4629de21a8a09049c98c5e5e776cfef5464e05557c443', 1, 11, 'ONCOassist', '[]', 0, '2018-12-03 10:46:55', '2018-12-03 10:46:55', '2019-12-03 10:46:55'),
('55688a4f35f458b6321328ffe662ed502a0c607aa1551efac2cf63e1576c9389917dbedc267db589', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 23:20:28', '2020-01-09 23:20:28', '2021-01-10 04:50:28'),
('55854d6270d6a37efdaf79b9504b43fccc428746184c5cdf0e9a8bfa3bf5e720776a5401ca8ece84', 1, 11, 'ONCOassist', '[]', 0, '2019-04-19 18:30:39', '2019-04-19 18:30:39', '2020-04-19 18:30:39'),
('55e1900e29f5e7cac862e8ad90e3e24d1391d603f45fd772a91fd0c36d5b09736ce7f4a9c7c08f19', 1, 11, 'ONCOassist', '[]', 0, '2018-08-31 11:46:06', '2018-08-31 11:46:06', '2019-08-31 11:46:06'),
('55ec73908160509a4d8d0ef5c4e4cddcb662d7c1a2c66072dd55163892eb27dd2d107810912577cc', 1, 11, 'ONCOassist', '[]', 0, '2020-04-24 04:44:04', '2020-04-24 04:44:04', '2021-04-24 04:44:04'),
('55ed406736e81b03ab94d56ef3988653dee45fd9185834b810453c2eee3a5d95f9e02c7c20c6e5b2', 1, 11, 'ONCOassist', '[]', 0, '2019-02-11 12:35:15', '2019-02-11 12:35:15', '2020-02-11 12:35:15'),
('571c7f7ba692ea9f0bb7de8eec983f3b9b61072f48b37a355e7e9ab6f4f3a5882695b96b6830cce6', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 05:19:15', '2020-01-15 05:19:15', '2021-01-15 10:49:15'),
('572a1ffd6511a929db58c178b3532d6fdfb167d56ead7d862680201e5f858fea092c3592dc5ab07a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-26 23:04:48', '2019-11-26 23:04:48', '2020-11-27 04:34:48'),
('5754ffde326cb48fe6aa3e1876201ba6f4003fcabf1ec7689f87408861759445c9e776d74478cd82', 1, 11, 'ONCOassist', '[]', 0, '2018-11-28 10:37:24', '2018-11-28 10:37:24', '2019-11-28 10:37:24'),
('57ab3911997108c9beffaec6f725a5500311c1aa9b04723808f7168151db10731fa5b10cd3dc7096', 1, 11, 'ONCOassist', '[]', 0, '2019-11-27 00:10:20', '2019-11-27 00:10:20', '2020-11-27 05:40:20'),
('57ae3e1231f397dcce1c6c9a58a7fa93ce8e4bcf084f4a33463d9bba78016f5ffee8e4eb9af82c60', 1, 11, 'ONCOassist', '[]', 0, '2018-09-07 21:05:00', '2018-09-07 21:05:00', '2019-09-07 14:05:00'),
('57c3a2d3bdac927fe4ed6c043c568bf74db2957e5ff4083bf6f532a288091d6d0c968e87a7432233', 1, 11, 'ONCOassist', '[]', 0, '2018-06-22 04:01:41', '2018-06-22 04:01:41', '2019-06-22 09:31:41'),
('5802d1d10168c5d4503615fb337557be5b5cacecc6265c9fcc3b4c140a39fde2b08c12b32f0bf731', 1, 11, 'ONCOassist', '[]', 0, '2018-07-09 06:18:52', '2018-07-09 06:18:52', '2019-07-09 06:18:52'),
('583ee0f6b6bc2e96aa2a060236bc0d0d9485482f7a5aec35599f6d3c09205544bf111a8565353e02', 1, 11, 'ONCOassist', '[]', 0, '2019-09-04 01:46:51', '2019-09-04 01:46:51', '2020-09-04 07:16:51'),
('58598efadd05cade4319261db74d1e8ab64b375e5f7fe50e565e2cf9c1132306663decc1ccf57d27', 1, 5, 'ONCOassist', '[]', 0, '2018-05-30 23:42:03', '2018-05-30 23:42:03', '2019-05-31 05:12:03'),
('58f405eb7c1b9ef11dcad164c4f9de1b50a25c65028cc587de28bb43e6e6ed2e19d942706a38b3fc', 1, 11, 'ONCOassist', '[]', 0, '2020-02-24 07:25:15', '2020-02-24 07:25:15', '2021-02-24 12:55:15'),
('5913c8be1555556f05789bb78c7510b41398d705de4c075b54caf2ca825e9f0b5cbde816f245b8d6', 1, 11, 'ONCOassist', '[]', 0, '2019-11-19 05:43:19', '2019-11-19 05:43:19', '2020-11-19 11:13:19'),
('592bebaa552fda668e37b71906d1a1aa4c5c699bc27bb37e223d70f66d66337178f17a059d1d5d8c', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:32:33', '2020-01-16 02:32:33', '2021-01-16 08:02:33'),
('59630020acd174b53193f6a4660578bada550c53d91a45acf21529e19561275f328570d7c4ef052b', 1, 11, 'ONCOassist', '[]', 0, '2019-01-29 15:29:11', '2019-01-29 15:29:11', '2020-01-29 15:29:11'),
('59b90e29c0424493a840dd0821c7ceee6b077b83f22b7c9da598c67c09df26fee004c28e3d7823dd', 1, 11, 'ONCOassist', '[]', 0, '2018-12-01 05:35:50', '2018-12-01 05:35:50', '2019-12-01 05:35:50'),
('59bbcf26f1e970416608d7003ea20998c8d4ee5faa70d0982240f5bc881d99748e170ae76d32842c', 1, 11, 'ONCOassist', '[]', 0, '2019-06-18 08:14:52', '2019-06-18 08:14:52', '2020-06-18 13:44:52'),
('59d849fd5504cf8dbdd118d4280bf534aeff4d145b38250b153439a5ebb76f15f584340069cdc3d2', 1, 11, 'ONCOassist', '[]', 0, '2016-02-11 11:15:08', '2016-02-11 11:15:08', '2017-02-11 16:45:08'),
('59ebb59944c284f1503d1ebacf2f8bad163369df4cec68665f833fbc8d9313c8b032ca1c6e7b6eeb', 1, 11, 'ONCOassist', '[]', 0, '2018-10-11 10:20:25', '2018-10-11 10:20:25', '2019-10-11 10:20:25'),
('59f88c4335506e78b9a9080dcf5cbbded24a41d62f566a2f9515eb50439db447bcf03cdcfb02c820', 1, 11, 'ONCOassist', '[]', 0, '2019-04-23 12:01:26', '2019-04-23 12:01:26', '2020-04-23 12:01:26'),
('5a3119601c62ce7d98a04c652c6eced97cd79c44efd1dacd207b21838b097ef440950831e3541e60', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:51:59', '2019-11-22 00:51:59', '2020-11-22 06:21:59'),
('5a43a86d78e5fff1f984e37fabc81b29fc21da117465105acd700e56753e294e25e6ff8c16d0064b', 1, 11, 'ONCOassist', '[]', 0, '2019-04-23 13:35:30', '2019-04-23 13:35:30', '2020-04-23 13:35:30'),
('5a6a3a7e0dd83e1a88f36ec1e548cf8541df6e7f3c9378d7b75ac2324e273b6a664b9d769d2e0da0', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 06:34:11', '2019-11-22 06:34:11', '2020-11-22 12:04:11'),
('5a9bbd424c92bd61775a692432c4261c2f7991ba40488e51ee2fd230fa4b9894d134dfa879d1600d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-19 01:24:42', '2019-11-19 01:24:42', '2020-11-19 06:54:42'),
('5aa0cc5fbf2ceb9c529cee0f1fe5b35c8fbaa217646e1eb11e328f8dc05eb756649474f76ee0bf20', 1, 11, 'ONCOassist', '[]', 0, '2019-01-03 07:12:20', '2019-01-03 07:12:20', '2020-01-03 07:12:20'),
('5aba0583c99476f446cada1723357c5cd278f6663c43ac1ff7ac5a708e3f66c66fc34790f5b9a76a', 1, 11, 'ONCOassist', '[]', 0, '2018-12-05 09:02:23', '2018-12-05 09:02:23', '2019-12-05 09:02:23'),
('5aed0bb228221c7b719c7f3d6cbf984758a9e0e9f8fcc0726aef9439f23e9a447a004fac5abf8383', 1, 11, 'ONCOassist', '[]', 0, '2018-11-20 12:42:50', '2018-11-20 12:42:50', '2019-11-20 12:42:50'),
('5b274cd08907f03d58c36b579f43fe243c9014ee5a419bde4e11830bc324af9b8f8c4d247767dea7', 1, 11, 'ONCOassist', '[]', 0, '2018-12-29 08:44:00', '2018-12-29 08:44:00', '2019-12-29 08:44:00'),
('5b40cc280918085eaa91ef51945a7939bdf9a29218e9888c5c6c0c95eb421ec211fed7d8d9c725f5', 1, 11, 'ONCOassist', '[]', 0, '2018-10-26 14:17:51', '2018-10-26 14:17:51', '2019-10-26 14:17:51'),
('5be0ae01e5244d7818709d53f9aef6a5c39d688bfbeb289270cb07fbce1f69582bb727901f8d686a', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-19 23:28:32', '2020-01-19 23:28:32', '2021-01-20 04:58:32'),
('5beedad429a735e2797c95cee8733211f3822d4e9f1e8d90a3f477f1c97576505fdc5d4abdb74edd', 1, 11, 'ONCOassist', '[]', 0, '2019-03-27 12:00:37', '2019-03-27 12:00:37', '2020-03-27 12:00:37'),
('5c2f6a0719b915238a606e91bf83eb49fe777fa8261274e0e0d003b6e860989267b186a3d971cf72', 1, 11, 'ONCOassist', '[]', 0, '2019-01-30 13:52:33', '2019-01-30 13:52:33', '2020-01-30 13:52:33'),
('5c5430199dfd84b0990a5b0a474e8ca5765c3a150c97a64ab359fd7c217aedb2d56eef9540e4c525', 1, 11, 'ONCOassist', '[]', 0, '2019-05-28 23:13:53', '2019-05-28 23:13:53', '2020-05-29 04:43:53'),
('5c7186e8dbbb7d507fbfa17605171beb87a78459a1d60791c60584e6db8f52acbecdc02da081dc80', 1, 11, 'ONCOassist', '[]', 0, '2019-01-25 15:08:51', '2019-01-25 15:08:51', '2020-01-25 15:08:51'),
('5c74677e49c458c1d8be79903bed232e6f39959e6cd5154bca380833e867321a5ad7705d23921bc6', 1, 11, 'ONCOassist', '[]', 0, '2019-04-17 15:40:49', '2019-04-17 15:40:49', '2020-04-17 15:40:49'),
('5c7c7871987dfe1ee5586a0dec85fb028831a10e31872d4f045d585ec8b74f668144eedb52bd3c54', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 03:14:03', '2020-01-16 03:14:03', '2021-01-16 08:44:03'),
('5cca30c34ecb168056fffb7a492fb74a8ad8c48ac017a0fdc91f8e952823f6ed76628dcaee141bca', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-12 23:09:21', '2020-01-12 23:09:21', '2021-01-13 04:39:21'),
('5ccb795a9b01e8606fec10b33053011373ac7751216dba0fb0f51e0521eea74d7f15d412d8cb76d1', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:14:42', '2020-01-16 02:14:42', '2021-01-16 07:44:42'),
('5ce7fda4ecee8f9eb58834d7a66324305543c65461a49cc786044d3cfade4b400560c71ee6bc70cd', 1, 11, 'ONCOassist', '[]', 0, '2019-04-16 08:07:03', '2019-04-16 08:07:03', '2020-04-16 08:07:03'),
('5d28da340d4da39025a4883bfc9b276ccfcb29064b5b45e502d6585d3ca449fb26a4fc67b4159da7', 1, 11, 'ONCOassist', '[]', 0, '2018-07-10 09:52:16', '2018-07-10 09:52:16', '2019-07-10 09:52:16'),
('5d29f9caf4dc7fc9cbd65a334c2acdb1179947597357e1aa01c85d08ef0beaecd2b97f39518105d3', 1, 11, 'ONCOassist', '[]', 0, '2019-05-13 18:35:42', '2019-05-13 18:35:42', '2020-05-13 18:35:42'),
('5d66a444880f30efb50e8d88b1398863e4e41e0323c4181d7a318ac20f689203778d2f42618c3c09', 1, 11, 'ONCOassist', '[]', 0, '2018-08-14 11:38:38', '2018-08-14 11:38:38', '2019-08-14 11:38:38'),
('5d6a16a5481e90399e9858af4c609933dbf7d668cc233a5e0bb5cc391fd6b382c1a52fed1696956b', 1, 11, 'ONCOassist', '[]', 0, '2019-07-22 05:52:32', '2019-07-22 05:52:32', '2020-07-22 11:22:32'),
('5d6e5f77364b527fcd7831379a0ebeb426819a9e968fef3bcc2dedf79423f76b4f0ec27a0cb96b72', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 03:56:55', '2019-11-04 03:56:55', '2020-11-04 09:26:55'),
('5d7d7c5522982434a6d1de348533f702ab29d8f49cd24d9fe9669f554cbf5ff20a88589696368d04', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 10:20:06', '2019-05-09 10:20:06', '2020-05-09 10:20:06'),
('5d99209a5d5975833604e52fc0d0d22720274de0ff0c3fbf5157ce2d1651c6962c2215249b74e018', 1, 11, 'ONCOassist', '[]', 0, '2018-06-25 05:55:59', '2018-06-25 05:55:59', '2019-06-25 11:25:59'),
('5d9c350be20ff91182ca45df89de46257d3201c48cb520103dbc157704002d217d1aa33fb76ad182', 1, 11, 'ONCOassist', '[]', 0, '2019-04-23 14:03:47', '2019-04-23 14:03:47', '2020-04-23 14:03:47'),
('5dbfd3609c1c2ff9af17ae8b9794986912c74753d29d5691ddb3b6484ed89b606855088390d3a2c0', 1, 11, 'ONCOassist', '[]', 0, '2019-10-23 02:55:22', '2019-10-23 02:55:22', '2020-10-23 08:25:22'),
('5dc561a54346e9a154a2b0e553d1e392bd85800a6ddfdf24595dea2ebf32c878981037d27ac9ff8a', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:42:49', '2018-06-18 00:42:49', '2019-06-18 06:12:49'),
('5e90c7f173f2596e68d7c7f0ce8a450b78b3fb0df801acbb2dc014f7851ca022393622d6d7651b8f', 1, 11, 'ONCOassist', '[]', 0, '2019-01-08 16:53:52', '2019-01-08 16:53:52', '2020-01-08 16:53:52'),
('5eedb5bb176d5375fd8c2a2760468c3c09db6d92bdc37ba284973ac6d4de2aef7672c6c49ac168a9', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-12 23:43:57', '2020-01-12 23:43:57', '2021-01-13 05:13:57'),
('5f00966e680c3ed4e694c0f98c304c74290314d9bb4039a22af9b022950c6c82abd9e6687fa917f9', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-12 23:46:46', '2020-01-12 23:46:46', '2021-01-13 05:16:46'),
('5f0657955ede20c5300cf9ae8695e4dee07293d5b5eeccd9645d3e5862572505f23b2ec3c21be008', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 12:55:28', '2019-02-13 12:55:28', '2020-02-13 12:55:28'),
('5f349c7d9d2644804efdbd6b5a4ad6a44a448f1e2fb0f28707fb85b2f542bebcf2968be675667205', 1, 11, 'ONCOassist', '[]', 0, '2020-01-03 05:15:38', '2020-01-03 05:15:38', '2021-01-03 10:45:38'),
('5f3ff00cdd99a5d822ef8883191f64a83d13bf4a19e898b7df854fb93da05b97228c88ee559bc191', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 07:21:46', '2020-01-09 07:21:46', '2021-01-09 12:51:46'),
('5f4b87bdde92a180046bb829874d59e02b4175498a8697f21c6033a47e5ecdf12174e10e5ff14bb5', 1, 11, 'ONCOassist', '[]', 0, '2019-03-25 10:36:06', '2019-03-25 10:36:06', '2020-03-25 10:36:06'),
('5f58725be31540e62959625fd65578a9f92cdc00d6537ee0185fae83845b466deb8d92ff45baafbb', 1, 11, 'ONCOassist', '[]', 0, '2018-06-27 14:17:41', '2018-06-27 14:17:41', '2019-06-27 07:17:41'),
('5f908a205f1a0412dc18664e99251ed34410cb6c827433db7d760e2d70b1844d0fe1917625235d5d', 1, 11, 'ONCOassist', '[]', 0, '2018-12-10 09:36:23', '2018-12-10 09:36:23', '2019-12-10 09:36:23'),
('5fde846cda97c42e2db9badd3207c4154d0763e04b09d4f8013bfb29b4782da70c5fb1748fa9dbe1', 1, 11, 'ONCOassist', '[]', 0, '2018-07-31 10:14:20', '2018-07-31 10:14:20', '2019-07-31 10:14:20'),
('5fe10c7ebeff370e3921b83fd1c6450e47bdf33b497efdc8221fabe7ca27646e5569307662e9219b', 1, 11, 'ONCOassist', '[]', 0, '2019-04-04 08:49:41', '2019-04-04 08:49:41', '2020-04-04 08:49:41'),
('5fe3eb95e958f6db6276a81b6a417d2931e89b82fdc28bc62f11f5ecfdde6f4b125bed2f106fd31a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-27 00:47:05', '2019-11-27 00:47:05', '2020-11-27 06:17:05'),
('600762500775ea156ef8696c1c63c6af3d89ff88aa6e586db416b7aee1f4562b01f22cc241bebf67', 1, 11, 'ONCOassist', '[]', 0, '2020-03-26 07:44:45', '2020-03-26 07:44:45', '2021-03-26 07:44:45'),
('602cbb89fb6fbdbdf5f8e9d7205ae1414f781f29dd433ea89df81aee682269dfc09071d19883bf6f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 01:07:50', '2019-11-07 01:07:50', '2020-11-07 06:37:50'),
('604a0d78e5d0bdf67a99bb9f4de7a89821dfe1a474a06ffb1915d9d8611ff909d646b12ae830ceb4', 1, 11, 'ONCOassist', '[]', 0, '2019-11-25 06:29:18', '2019-11-25 06:29:18', '2020-11-25 11:59:18'),
('604dafae02936c2999e07e6bb215f54933f06c71f682adc49f545b8d7486c0991bb4550b1be136c6', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 03:21:18', '2019-11-06 03:21:18', '2020-11-06 08:51:18'),
('6053e365735cbbf88c12ca252e59d449992c9d5be5193b7b9825d57ebc4e1172f933627d2c1e4417', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 06:27:08', '2020-01-15 06:27:08', '2021-01-15 11:57:08'),
('606bc6a60e2dc14f0c3b11ac2960094fd4481f3f85ea2a17cac4e38da7b999a53a941b4bcd35076d', 1, 11, 'ONCOassist', '[]', 0, '2019-04-19 07:15:11', '2019-04-19 07:15:11', '2020-04-19 07:15:11'),
('607ce09828607741d868ec6d92d5d3ac082d833fc87f37af87cf7b35972aeea1e18a47c10bb14b30', 1, 11, 'ONCOassist', '[]', 0, '2019-03-07 10:27:32', '2019-03-07 10:27:32', '2020-03-07 10:27:32'),
('607f785608805dc433ac76df9527efbd5230eda1bd08ff18ea9ee3a1124c160fff1d55b1b35155db', 1, 11, 'ONCOassist', '[]', 0, '2019-04-29 14:59:05', '2019-04-29 14:59:05', '2020-04-29 14:59:05'),
('60bd3441429b82cfe5e42d87846d2e439331b72ac215cbdbb3d11fc6df2fb822c8b6c7484644f182', 1, 11, 'ONCOassist', '[]', 0, '2018-09-11 13:55:09', '2018-09-11 13:55:09', '2019-09-11 06:55:09'),
('60bea8f9df8f48cdb81229b746dd39625067261473e3fa2b6ac95224e372849df42c91acb02926ac', 1, 11, 'ONCOassist', '[]', 0, '2018-07-10 06:23:00', '2018-07-10 06:23:00', '2019-07-10 06:23:00'),
('60e28324e92194b3622b33999c97ae70c97c262ae8e2ffb5f463cc8ba552dcab67860d310d904525', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 05:50:23', '2019-11-22 05:50:23', '2020-11-22 11:20:23'),
('6103dcdacf7e574a297cdf137beb5c52ce6d22fc1a4e82d105372794992a85e49eec195e475f7544', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:41:43', '2018-06-18 00:41:43', '2019-06-18 06:11:43'),
('613295839cfe84f9d0ed9b7b7cd8a80ef656593e4f1cfb02baca0ac156b5e74978e2252c7eb31779', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 13:44:54', '2018-12-04 13:44:54', '2019-12-04 13:44:54'),
('613b934f24e169fade9762b6525bf5c8a792705ffa9b4a181c0973a4cd0bc3ee6c6bea1fdb86397a', 1, 11, 'ONCOassist', '[]', 0, '2019-03-08 16:09:44', '2019-03-08 16:09:44', '2020-03-08 16:09:44'),
('614ea0beddc01f4e877dc9e54cc8e7604da8cef1a19b87339635dfdfea15c3d3172500638193e233', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:46:51', '2020-01-17 00:46:51', '2021-01-17 06:16:51'),
('619b4a10a1da0a5b19afe2487354517f02f7ba5ee2a125b6eb8a2d5a125e7c863cfc4edf8330bb00', 1, 5, 'ONCOassist', '[]', 0, '2018-05-30 00:52:35', '2018-05-30 00:52:35', '2019-05-30 06:22:35'),
('61a9742685d1dd6872a351fecde699165352394d339fb5323accd4d76663b7287caa010a6d5332e3', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 08:10:26', '2019-11-08 08:10:26', '2020-11-08 13:40:26'),
('61c262a6695d19d1987ee19fb7d86932eca3b03860015526180e21ed520bb49e0cd38120347832a7', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-12 23:03:03', '2020-01-12 23:03:03', '2021-01-13 04:33:03'),
('61c9fc61e328674ca11902432cf045512bc8ad6ecbbf8d42ba9627accc28dd783cf468545b9a6e65', 1, 11, 'ONCOassist', '[]', 0, '2019-03-22 10:27:25', '2019-03-22 10:27:25', '2020-03-22 10:27:25'),
('6235ed66764eba573b6853bb7aff44a76af95e4778ffa2ca7dc5c0f835913cd0770bad1a5e57246a', 1, 11, 'ONCOassist', '[]', 0, '2018-12-17 10:51:43', '2018-12-17 10:51:43', '2019-12-17 10:51:43'),
('623a0c8bb5e9e24a759ec41249b3e2d1b226336beeaa5de0957907767db2545c6807fe73ab17deac', 1, 11, 'ONCOassist', '[]', 0, '2018-08-16 12:48:34', '2018-08-16 12:48:34', '2019-08-16 12:48:34'),
('626e6d365add3bf840bbef00b4f1d64da21475e5a600c67cb3d8ad880674aa94ac0993dd9344f0a8', 1, 11, 'ONCOassist', '[]', 0, '2019-02-20 10:16:50', '2019-02-20 10:16:50', '2020-02-20 10:16:50'),
('628e48db5bd8f2d905f9629033ef2a8490058dcc93b29062c1fd475671b0cfb835ba1bec271b15f6', 1, 11, 'ONCOassist', '[]', 0, '2018-12-27 12:31:57', '2018-12-27 12:31:57', '2019-12-27 12:31:57'),
('62c7e1d04457931393ed4e06860942e82b50a4a7118b88004d868fbf50d8a787704caf502adf849a', 1, 11, 'ONCOassist', '[]', 0, '2019-01-18 10:13:37', '2019-01-18 10:13:37', '2020-01-18 10:13:37'),
('62cabe9107e1c7aa209c6060449d45f94cacfd4d2004fbaa4c8315b8f482241d0a645dbce559c91d', 1, 11, 'ONCOassist', '[]', 0, '2020-02-26 13:24:55', '2020-02-26 13:24:55', '2021-02-26 13:24:55'),
('6332c7624cbd937067fae61b2f522a394ffbb641a8669dc9b2c2ac67c6977593d959049614f3b4c0', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-08 06:41:43', '2020-01-08 06:41:43', '2021-01-08 12:11:43'),
('6340291da088c4fa5298440e738700f8b35b94cd9a659dd414e0bcb52795d24b99dfe36e53e21012', 1, 11, 'ONCOassist', '[]', 0, '2018-12-19 15:21:12', '2018-12-19 15:21:12', '2019-12-19 15:21:12'),
('635b3aebeea0ebf8db7d27d809ea17e49dc8016511f56ddb0c4c2172b9aef7792ade5b5c91dc12c2', 1, 11, 'ONCOassist', '[]', 0, '2019-02-19 20:06:56', '2019-02-19 20:06:56', '2020-02-19 20:06:56'),
('637531f3bd9295c7a71401033414de86f08a5fff407f0c26c568703a55c84ebf3bca7d4f9833046d', 1, 11, 'ONCOassist', '[]', 0, '2020-04-03 05:23:49', '2020-04-03 05:23:49', '2021-04-03 05:23:49'),
('63ae071d0cb5744937f0885076cd70286d6aaf165e1e5acda60b2fd90f8be2ae85865b650a998522', 1, 11, 'ONCOassist', '[]', 0, '2019-03-08 09:06:40', '2019-03-08 09:06:40', '2020-03-08 09:06:40'),
('63e8fb8c9332b57d7f8c26e828a5c42727888cf5c1cb0e3b6f6b8daf7ff0e84b56b00af60bf54162', 1, 11, 'ONCOassist', '[]', 0, '2018-06-20 08:27:04', '2018-06-20 08:27:04', '2019-06-20 13:57:04'),
('644ddb63ca0635f87f6677b5746d7427bed3c15b4929c2308071d0afdaea41135e9b978c3ad7f660', 1, 11, 'ONCOassist', '[]', 0, '2018-12-26 11:45:15', '2018-12-26 11:45:15', '2019-12-26 11:45:15'),
('64807718950d033471a3be229a1de5723983d809d5274a50e35af8786ad56b37efc6024ad68e14c8', 1, 11, 'ONCOassist', '[]', 0, '2019-02-15 06:10:45', '2019-02-15 06:10:45', '2020-02-15 06:10:45'),
('64a2a129e9b692c8b855a37033df6c69c1c3343e2718d7351de32bc6166ed1716cc9f03309131f6a', 1, 11, 'ONCOassist', '[]', 0, '2019-04-15 17:04:09', '2019-04-15 17:04:09', '2020-04-15 17:04:09'),
('64aa4e0f2361b033a98cd6c226660ca0f70e1bbb28dd54860d600d72c554da03649a86f0f2853c39', 1, 11, 'ONCOassist', '[]', 0, '2018-06-25 00:04:03', '2018-06-25 00:04:03', '2019-06-25 05:34:03'),
('64aae3b220f1efe0c1254d30931cf9678605e45cca422e1f0286ea26967ebbf5f7699f210592eccc', 1, 11, 'ONCOassist', '[]', 0, '2019-05-10 08:16:23', '2019-05-10 08:16:23', '2020-05-10 08:16:23'),
('64dff018a6ead736132bf5372c2570cf2506016cfbd3fb2ba7432f1b3447d5e74408315dd7641ec4', 1, 11, 'ONCOassist', '[]', 0, '2019-11-20 00:41:26', '2019-11-20 00:41:26', '2020-11-20 06:11:26'),
('64fd03d279160c2267ed7ef10da9fd16f569cf85ae67b044879305fad8dc059008175b705dd7d311', 1, 11, 'ONCOassist', '[]', 0, '2019-03-21 10:02:25', '2019-03-21 10:02:25', '2020-03-21 10:02:25'),
('65659d45d2b323eed937ba0c077af286d405cea89547915318c4ba216b2961b2a8d4660c52e691ad', 1, 11, 'ONCOassist', '[]', 0, '2020-03-19 09:15:48', '2020-03-19 09:15:48', '2021-03-19 09:15:48'),
('65ccbe91a1775fae4e136b45fe3fffda2f87cd3de1ca8a34e367f1abbea6dce21450e6ed73da3343', 1, 11, 'ONCOassist', '[]', 0, '2019-03-26 11:45:47', '2019-03-26 11:45:47', '2020-03-26 11:45:47'),
('65eac32332118c3f663c4aa53bb795f222d91bce742b58e2ca3e47355dfbd35a033200e1859f33fa', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:21:48', '2020-01-16 06:21:48', '2021-01-16 11:51:48'),
('6603305425fd899e78b3bf6d2700d94f0ba630802edb869ac3b8da9084e4772aa652ffb715adb449', 1, 11, 'ONCOassist', '[]', 0, '2019-02-04 10:08:24', '2019-02-04 10:08:24', '2020-02-04 10:08:24'),
('661ded306539697f8dae56497e93d28b379b5aeb58c567b021760d6f34daceceabbe467920f27074', 1, 11, 'ONCOassist', '[]', 0, '2019-01-11 15:01:49', '2019-01-11 15:01:49', '2020-01-11 15:01:49'),
('66471369cdcf47531f800e357423118944b8b105bb5df80c84aa0a57cc9258565e9374e9a49cc697', 1, 11, 'ONCOassist', '[]', 0, '2020-05-27 11:44:16', '2020-05-27 11:44:16', '2021-05-27 11:44:16'),
('668918ee53aaf16054a5f1eea02aa37d87e7fbf61f3265bbc362b4d2591ba5dd70c548334782d154', 1, 11, 'ONCOassist', '[]', 0, '2019-04-08 08:07:44', '2019-04-08 08:07:44', '2020-04-08 08:07:44'),
('668e701b00e059504c009761aae0968fdce249d21fb355aba4d1cb99191734d8d0e891d2d9a51821', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:12:49', '2020-01-15 03:12:49', '2021-01-15 08:42:49'),
('669f3cc16a3d3e413f9beaad89a7d69e14da6258c66ddf40d15785ced9601891c3cd33ca7335160f', 1, 5, 'ONCOassist', '[]', 0, '2018-05-30 06:19:38', '2018-05-30 06:19:38', '2019-05-30 11:49:38'),
('66a8798b5a22d61df2a43a186689836277e6ef76eb96320870ae14bb68fa99df5a6bf313b26be25e', 1, 11, 'ONCOassist', '[]', 0, '2019-01-31 16:03:49', '2019-01-31 16:03:49', '2020-01-31 16:03:49'),
('66db07d11c943c0cefd6f341248e46068ce7083b1ff5e67c95f87ff726a1a32ffb6aff8ed6865542', 1, 11, 'ONCOassist', '[]', 0, '2019-04-19 18:07:31', '2019-04-19 18:07:31', '2020-04-19 18:07:31'),
('671a68e695cce9a7e680d343e13edb277bc9dc99fb3ca8b68f560ed5dff4192cdd1744db88eeef5d', 1, 11, 'ONCOassist', '[]', 0, '2019-03-29 11:12:48', '2019-03-29 11:12:48', '2020-03-29 11:12:48'),
('673171022d3b514e9ba6466cf3f256daedea82da98cc0821f7cb2dfdf0c77fc566e7e5211fc170f2', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 07:33:36', '2020-01-15 07:33:36', '2021-01-15 13:03:36'),
('675946e6f2a02cc060b11d85c49b824f03513c115d929e6cf362b108cfce43bfc408476e33d2b1a3', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:38:36', '2020-01-16 02:38:36', '2021-01-16 08:08:36'),
('676237dc9f54704c4ce2f1bc602c15b3bfe04d950966fe8909c7cbf458d4670c8e653a5b34461306', 1, 11, 'ONCOassist', '[]', 0, '2020-03-03 05:18:02', '2020-03-03 05:18:02', '2021-03-03 05:18:02'),
('6783ed903f4041b5b097f2ad6cf4c1d97c9c6ee649ce734e7222600b31426d9ba1138b2cac6a71e3', 1, 11, 'ONCOassist', '[]', 0, '2019-10-22 23:28:39', '2019-10-22 23:28:39', '2020-10-23 04:58:39'),
('67adc5b85dd11cfd9607c9f1ebf003e5920eda408ae43e62e70575645f0fd09572559a5905c9ba7b', 1, 11, 'ONCOassist', '[]', 0, '2020-04-03 15:19:08', '2020-04-03 15:19:08', '2021-04-03 15:19:08'),
('67e0c28eade1f782ef3197e3d8d68485bf7a0019cc7a8f56ea5995a21f27ae39b586828c0671073d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-15 07:09:41', '2019-11-15 07:09:41', '2020-11-15 12:39:41'),
('684b4f1c162a30f823269cc91af4bdf4131c75dcd3f4ea683a5ca1a73be8610ed94d308a3405d6e7', 1, 11, 'ONCOassist', '[]', 0, '2018-11-05 06:49:12', '2018-11-05 06:49:12', '2019-11-05 06:49:12'),
('68559fc960db53a10f7c48b16a4bec78b74d8d792ae4c53a6ca356551ada63412a78d3ec13f92a33', 1, 11, 'ONCOassist', '[]', 0, '2019-06-03 06:38:46', '2019-06-03 06:38:46', '2020-06-03 12:08:46'),
('6876fdcace22b6f8fcc505ee7f9230f5904cdcdeb88d2b426e55332b92d118820a23999995253409', 1, 11, 'ONCOassist', '[]', 0, '2019-02-05 16:52:29', '2019-02-05 16:52:29', '2020-02-05 16:52:29'),
('68919d2a3b8b0d480c498ef3675a88282365fd2c2ad18ad162181081a9c381417f9112b9f47691fe', 1, 11, 'ONCOassist', '[]', 0, '2019-04-26 05:02:30', '2019-04-26 05:02:30', '2020-04-26 05:02:30'),
('69156cad737d2df9ce542f8bbfdcc382c162cb625edc5519c546d069fdf87dbd5e473cf579089902', 1, 11, 'ONCOassist', '[]', 0, '2019-12-19 02:40:46', '2019-12-19 02:40:46', '2020-12-19 08:10:46'),
('692201a3314083a182415e810e8a071079bf01bf992175a202d3a0058931845a8eb004376d4b9309', 1, 11, 'ONCOassist', '[]', 0, '2019-01-04 12:30:27', '2019-01-04 12:30:27', '2020-01-04 12:30:27'),
('693ca9d5ee622ae4fc5a749b096fee975806e3b3ee71157a05472f4cf35f807703e0f52f53091d7c', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 06:04:45', '2018-06-18 06:04:45', '2019-06-18 11:34:45'),
('69b5219dce4eda43a93f118c1e3e77adc6f558cc83d756d3acdf0914e8dea6615a064cfd80b2bf94', 1, 11, 'ONCOassist', '[]', 0, '2019-12-05 06:47:33', '2019-12-05 06:47:33', '2020-12-05 12:17:33'),
('69e95c6f695bf85e882988b6aef8c2cd4048e460f9314bddc9e68135d2809790ac39e95c4aac5cff', 1, 11, 'ONCOassist', '[]', 0, '2019-03-06 09:42:17', '2019-03-06 09:42:17', '2020-03-06 09:42:17'),
('6a0fda84eedf6a32c854245deb6a1a9051f433662a9b8e77e250f46ffd3d74dab4bb9d83736be027', 1, 11, 'ONCOassist', '[]', 0, '2019-03-14 10:13:34', '2019-03-14 10:13:34', '2020-03-14 10:13:34'),
('6a1aec7c99a095a260d3a90a3d593fd67cdc62ee88fd3717cf05e61ee500690739a7abb9a5c8327b', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 10:17:03', '2019-02-13 10:17:03', '2020-02-13 10:17:03'),
('6a66cd057efd857bf03f37e43571f95c8c8ba52f7213cd9b369cda46142d30218bed07e9db425678', 1, 11, 'ONCOassist', '[]', 0, '2018-12-13 15:22:41', '2018-12-13 15:22:41', '2019-12-13 15:22:41'),
('6aa681776776f73124fd63dbad5486ff80a19fc86edd7a637dd927c76a4bf9f298aa919fdfb9a4b2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 02:33:46', '2019-11-05 02:33:46', '2020-11-05 08:03:46'),
('6aa8975a56122f6876ae0a7579ab479e5e0fade24512d599f190d3292795bffc2fd56494e9620bb4', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 00:18:39', '2019-11-21 00:18:39', '2020-11-21 05:48:39'),
('6ac19d5a827a3ef5e34076d5f10a8e28f4becfe47b20b96ff8827a51650492dbff9722b02737c799', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 11:27:44', '2018-12-18 11:27:44', '2019-12-18 11:27:44'),
('6adea0df1ab9d6d243b8e591cae069189a7a1bf086c3dc3a90bbe03d5d7e5d23cfdf56ca549ef57d', 1, 11, 'ONCOassist', '[]', 0, '2018-07-09 06:19:56', '2018-07-09 06:19:56', '2019-07-09 06:19:56'),
('6af844e30932c52da910edc0d3680e19f0791a4657e8232c9f3768748ae347e4260f6ce67723d0f5', 1, 11, 'ONCOassist', '[]', 0, '2020-04-09 07:09:25', '2020-04-09 07:09:25', '2021-04-09 07:09:25'),
('6b1b9781d9fa7378b7d077f0aec7b467c4a5bc90ee8abd3728d675a1dbbf5c11f591ee4bd1a5b3d7', 1, 11, 'ONCOassist', '[]', 0, '2019-11-20 07:21:47', '2019-11-20 07:21:47', '2020-11-20 12:51:47'),
('6b493409690a29576ead3e3d99d01e557f1074ecdc210efe41fa8c48235309558a97f7793648aefb', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 17:42:08', '2020-04-20 17:42:08', '2021-04-20 17:42:08'),
('6b58423e2bbc7f65334e9def18b0d7cec48ea6eb4df48863a779ff55e2655a9ab659be056cfd2767', 1, 11, 'ONCOassist', '[]', 0, '2020-02-21 05:32:16', '2020-02-21 05:32:16', '2021-02-21 11:02:16'),
('6b5d529f9d99d364ca0e715313d012fa91e559a91a761b79ea0a187ef35de63e4f0b62799165260a', 1, 11, 'ONCOassist', '[]', 0, '2019-04-24 19:49:31', '2019-04-24 19:49:31', '2020-04-24 19:49:31'),
('6b66ba79a702e1bc2704046bf4b2cdb644c533168e193abf26200368cd6f24bf5c21cc9f1bc5b913', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 04:58:36', '2019-11-05 04:58:36', '2020-11-05 10:28:36'),
('6b9488fe12c9430299db6cc615b8dfb3eba534d888a37b032287e51b96fa11fb1b85dc921a39395a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-25 08:52:11', '2019-11-25 08:52:11', '2020-11-25 14:22:11'),
('6b967c87933b99b6fce681a04cd0f38a98a4c9d7eff54f4ab0e2d059c5d60acf1482faf1a71b8f6b', 1, 11, 'ONCOassist', '[]', 0, '2019-04-25 08:10:05', '2019-04-25 08:10:05', '2020-04-25 08:10:05'),
('6bd6b041453cc268759e5dd98413e713a718fcb7f66e314d24ca90195a4b6c99ab316ebd0ead4423', 1, 11, 'ONCOassist', '[]', 0, '2019-11-14 05:42:23', '2019-11-14 05:42:23', '2020-11-14 11:12:23'),
('6be712c3a4e628351d0a9304fdbc244ce740be081c7c0a12145b65a4fa4617c2c91d62a54cec84c1', 1, 11, 'ONCOassist', '[]', 0, '2019-06-04 23:15:42', '2019-06-04 23:15:42', '2020-06-05 04:45:42'),
('6c3c68ed0e163cbea92a247cccc3a23799699fba87d9c64a498c123e71e1798a500f1a6968c3c528', 7, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:24:34', '2020-01-16 06:24:34', '2021-01-16 11:54:34'),
('6c40609ab2bb7be5a5c8c98b85f295b2dda3e368b41087f743eb84cb8d9d7e29052369b1e85fab08', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 07:41:03', '2019-11-22 07:41:03', '2020-11-22 13:11:03'),
('6c5d37c788229dd8f59fd0fe75459a7384497ffea959541426924523246e345b6e2b3f9f13c0d257', 1, 11, 'ONCOassist', '[]', 0, '2018-12-13 15:33:09', '2018-12-13 15:33:09', '2019-12-13 15:33:09'),
('6c85bd91236927da1c461f1bd18da5d1bd1c91ef63bf30a735d097d09ea03dbc373ec80a2623c24b', 1, 11, 'ONCOassist', '[]', 0, '2020-06-30 14:58:13', '2020-06-30 14:58:13', '2021-06-30 07:58:13'),
('6ca8a64c4c71769c8dc8ec4fd18de2567b5e4be2a4c1e6f97a77ff64d134fa68d218ea0866ed38c2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-20 01:49:36', '2019-11-20 01:49:36', '2020-11-20 07:19:36'),
('6cb93e616c2e4ed24ed216e4adb8698a64696f848ed3a58cff32c2ea7d93b5ae7f4441dba67634c0', 1, 11, 'ONCOassist', '[]', 0, '2020-04-29 14:08:49', '2020-04-29 14:08:49', '2021-04-29 14:08:49'),
('6ce654dc9343a906c27b7b965f8ed888a94b3ac46115ec713d72596edec30e575e9c193084c41e0a', 1, 11, 'ONCOassist', '[]', 0, '2019-04-22 13:08:02', '2019-04-22 13:08:02', '2020-04-22 13:08:02'),
('6d1174b152ce0b5707e5781b7ecc9a343cbf69cf7237c74dfb66afcafce83fb2f7389642b54dae25', 1, 11, 'ONCOassist', '[]', 0, '2019-11-27 06:04:01', '2019-11-27 06:04:01', '2020-11-27 11:34:01'),
('6d795ba418d525b6869a0f89b305727e1760a699d3c8d5f0ddf68c08ef6ecae22cea237f70a359c0', 1, 11, 'ONCOassist', '[]', 0, '2018-09-26 17:08:33', '2018-09-26 17:08:33', '2019-09-26 10:08:33'),
('6d8b5dcfc31fee66d9b5e5a0eb09db449cd453f7fc1eaa9f8068414708e437b6958fbebc25239bbd', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 07:56:13', '2019-11-21 07:56:13', '2020-11-21 13:26:13'),
('6e5945c77bdc62527d4b982b0f8f0838a781a9ac872d0476ca2f47a72036ab24742615255385865f', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:26:03', '2020-01-16 06:26:03', '2021-01-16 11:56:03'),
('6e7852c7f9c829596c28ece5367e14535037c79e6bbf257512ff9a8e3213d3efcdca62ef19135cd6', 1, 11, 'ONCOassist', '[]', 0, '2018-07-04 12:34:20', '2018-07-04 12:34:20', '2019-07-04 12:34:20'),
('6ee4373b252d25d993eb6a4cd87ad26327e623dc58d5892baa398bd213373cb3e4704ac5a56e8e56', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 05:23:27', '2020-01-16 05:23:27', '2021-01-16 10:53:27'),
('6ee450a67f15f4652eb503dc50701816f989908e6c750a7e8ef861f60d1928c06cdb0e489cc149be', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 09:47:30', '2018-10-29 09:47:30', '2019-10-29 09:47:30'),
('6f1d50b1e2b78cf73cff560b5996063210ecfc7a1c80e7ee20c240a4de36701b6550a8eebb28a1d0', 1, 11, 'ONCOassist', '[]', 0, '2019-04-08 09:09:10', '2019-04-08 09:09:10', '2020-04-08 09:09:10'),
('6f32e9fdc5a6c6ba0a0be164dec7e1c8f0a9364cd8755079beeffa8db15710c3782d3d400348613b', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:35:19', '2020-01-16 02:35:19', '2021-01-16 08:05:19'),
('6fc3c00122b0af3bea87ddeb005ae4e739e1c69538aa18d1fe57a3ddcd5769931174b89dcab0ff1a', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 11:20:38', '2018-10-29 11:20:38', '2019-10-29 11:20:38'),
('6ffc1814a7c32666bc7c656c052539afda7324b7fd57dd7423c1fdd4e59985d7c303319dee0f32ac', 1, 11, 'ONCOassist', '[]', 0, '2018-09-26 15:59:49', '2018-09-26 15:59:49', '2019-09-26 08:59:49'),
('7012f41c11b0396612c57c311d4e92e47b34f701a2b88b6976a9a5ff9f9e02f30cf9420f0d4850f6', 1, 11, 'ONCOassist', '[]', 0, '2019-04-04 11:07:58', '2019-04-04 11:07:58', '2020-04-04 11:07:58'),
('70166a3aef373ee127c1db6f5722b9d40d414e95c15a501881987a0720c214c3be97abe07bbc5577', 1, 11, 'ONCOassist', '[]', 0, '2019-05-31 04:26:28', '2019-05-31 04:26:28', '2020-05-31 09:56:28'),
('7026860305d2c1fab068172cbbffb4e34add4f19828d4eb1c60a28d3aeef5ae60aa57317325072f7', 1, 11, 'ONCOassist', '[]', 0, '2019-01-02 09:51:14', '2019-01-02 09:51:14', '2020-01-02 09:51:14'),
('70478d792fec1f0df98765e4ef3449672b6986555ad9b3e3e3c141089e737a388788e35672b3de1a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-14 04:42:47', '2019-11-14 04:42:47', '2020-11-14 10:12:47'),
('7052bd78816fcbd190d5b1d5ac6b8b6b2df051d98e62c2ec09eb334fbaeb1c8cb0826a5dab2eacdc', 1, 11, 'ONCOassist', '[]', 0, '2019-07-30 04:08:34', '2019-07-30 04:08:34', '2020-07-30 09:38:34'),
('70782a6c3f334d1336a423aab30d20bf3148ecf15c4bb45822aa64d13dbaf62500be8eb2b39edcb9', 1, 11, 'ONCOassist', '[]', 0, '2018-10-06 08:23:02', '2018-10-06 08:23:02', '2019-10-06 08:23:02'),
('70a5f5bcaa8f33f7f79f0dbdb3fc5193c9666283ebacf204b5ca28c542927dfbf7c7187c192047d2', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 06:03:34', '2018-12-04 06:03:34', '2019-12-04 06:03:34'),
('70b69cb66df1a3e90885f46a05372b26d6387777e77bb4a68eda6f5ededae83f892ba86b4ed33a56', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 05:43:43', '2019-11-21 05:43:43', '2020-11-21 11:13:43'),
('70b8e6fca1b488704496cb52174fbc78c24ce738d70b11e371ab9762289c512ad322de9283eebce6', 1, 11, 'ONCOassist', '[]', 0, '2019-11-26 06:23:59', '2019-11-26 06:23:59', '2020-11-26 11:53:59'),
('71224cf4a8f1489a9ed52b747a6ceef65b54e54c041af5cb34b0989c5c2ad07399a68989eeefff1c', 1, 11, 'ONCOassist', '[]', 0, '2019-04-11 08:08:02', '2019-04-11 08:08:02', '2020-04-11 08:08:02'),
('71465b0a79f268fd9cace3f19363944d118fdb1b9ef853bb3fef972383b65fe8ed5f5ea567f99f8b', 1, 11, 'ONCOassist', '[]', 0, '2019-06-28 02:55:04', '2019-06-28 02:55:04', '2020-06-28 08:25:04'),
('7189007e98dc0d4e4463d40620d21b36526cac94124a0ddd9f811cb2608435aad989ad5b59135965', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 00:27:15', '2019-11-07 00:27:15', '2020-11-07 05:57:15'),
('71909278aebc8027c4bb78b6d4cc9b69ce4eae8f0435ebdc3dd2b51de162da099f5f2b894e618125', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 07:40:22', '2019-11-06 07:40:22', '2020-11-06 13:10:22'),
('71a3624bf911cd48dcb9ea7161e296bf800c50ee7d6d8bbe567ba67a8490cf9d29364003d251a12d', 1, 11, 'ONCOassist', '[]', 0, '2018-07-13 05:21:29', '2018-07-13 05:21:29', '2019-07-13 05:21:29'),
('71cc900820db54351583558aa0ba09db70fbc90461717d2725f4978534596e7b3e90943e2bc6e715', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-20 00:34:32', '2020-01-20 00:34:32', '2021-01-20 06:04:32'),
('71f0f3eccc02d82096938d928b6c567503c159fd9857d74ddf3028f992eb9409cdcb2df6b1c23397', 1, 11, 'ONCOassist', '[]', 0, '2020-03-19 12:16:05', '2020-03-19 12:16:05', '2021-03-19 12:16:05'),
('72291e999cc23075bda16598c41b8645a8b7d1a93c32182b12ed17111adfc634c0642c9ae4287790', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 00:26:55', '2019-11-21 00:26:55', '2020-11-21 05:56:55'),
('723f191d3b696ad22197029b8a9b57107839da5b5a58b1aa4f9a982fd7fcbd62827b478a09bbbdb7', 1, 5, 'ONCOassist', '[]', 0, '2018-05-30 02:19:14', '2018-05-30 02:19:14', '2019-05-30 07:49:14'),
('728056aa2f2640dbb784e7481745c0e2713a8fdc24f07c7969df6cb423d76bce74f484f18cef63d1', 1, 11, 'ONCOassist', '[]', 0, '2019-04-29 08:07:06', '2019-04-29 08:07:06', '2020-04-29 08:07:06'),
('7282363e63626506212c06f1f50b35bc87512207c2893fac540a66d0f874c53d4bd45a9a32f33727', 1, 11, 'ONCOassist', '[]', 0, '2019-02-25 15:11:31', '2019-02-25 15:11:31', '2020-02-25 15:11:31'),
('729bac0ef059fd909f37387efb20faa67c50875e0908d622f4094e375d6120c5f5eaaf71b1f7511d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-12 08:01:31', '2019-11-12 08:01:31', '2020-11-12 13:31:31'),
('72a46689ba2917e25cc54f67738ae913cdbe6a5605ab38327d36b97c3daa2d5c1f68abd4f11d52c2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 06:14:26', '2019-11-21 06:14:26', '2020-11-21 11:44:26'),
('72d3fc9076f3ac857bf864bbca3643fb552bef4643263e8803edef84a2c55641adb3ca674ad96b4b', 1, 11, 'ONCOassist', '[]', 0, '2020-04-29 08:00:17', '2020-04-29 08:00:17', '2021-04-29 08:00:17'),
('72e89f926c683c86df9638b99592d6163dbc4a9ee9b9f6b4384d835c9ce244cad53c43b479b9d06a', 1, 11, 'ONCOassist', '[]', 0, '2019-10-25 05:01:22', '2019-10-25 05:01:22', '2020-10-25 10:31:22'),
('7312480d1f8ac538f2a8a1ba8998c030c0cd0d9ea18544267640ad48fac74d72d1b709f1359c2918', 1, 11, 'ONCOassist', '[]', 0, '2019-01-30 12:56:04', '2019-01-30 12:56:04', '2020-01-30 12:56:04'),
('731f1149f3a93ee795699db073386df019812c5be2af16cb7fcd9fc87b1531e3fd96546320283a33', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 14:10:11', '2019-02-13 14:10:11', '2020-02-13 14:10:11'),
('73b9539abf1a0c05034060493c3874716c947bfd19f814bfd8f37677f197dcde62bb94555c66dbd1', 1, 11, 'ONCOassist', '[]', 0, '2020-02-28 04:48:23', '2020-02-28 04:48:23', '2021-02-28 04:48:23'),
('73e58c39bcd254c8262e1df79107e7cdf50d208c42f5976852a6dff9f65e651b95362a88d41e8f8b', 1, 11, 'ONCOassist', '[]', 0, '2020-05-22 11:03:47', '2020-05-22 11:03:47', '2021-05-22 11:03:47'),
('73ff73d91865d06fe473f9a000f37b9bcbd6fd56292196da83e122c3984b22f2cf5d0e0f7e6d4b7a', 1, 11, 'ONCOassist', '[]', 0, '2018-11-01 14:46:00', '2018-11-01 14:46:00', '2019-11-01 14:46:00'),
('740dfc9499e3b9d9e162c828b44c0d7ee815f18041fca5296b6e44494d72fc5a12250df898c99fa2', 1, 11, 'ONCOassist', '[]', 0, '2020-01-02 23:25:06', '2020-01-02 23:25:06', '2021-01-03 04:55:06'),
('7444af1d044cbdba8bcf8bb78cde58e4b742345cf3eba82c8c9c7d4545e88ccbd5020ed7e2d54c71', 1, 11, 'ONCOassist', '[]', 0, '2019-01-03 12:08:47', '2019-01-03 12:08:47', '2020-01-03 12:08:47'),
('74517befb55721d76d9dd579bf501ff0a83f3ada485f19e99e83fa73cd44fab6865d247139b79f19', 1, 11, 'ONCOassist', '[]', 0, '2019-06-28 01:18:27', '2019-06-28 01:18:27', '2020-06-28 06:48:27'),
('74ca241cd529a48da8bae5173b06258a23d2a58804de94277776b77ab5ae9af565f064cc251c8f5f', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-08 06:30:27', '2020-01-08 06:30:27', '2021-01-08 12:00:27'),
('74d02e57d31531d29dfe13bb5e5a6bdd55c4595358743c2a00e87001ec2ab0c1951aed09aa426fb3', 1, 11, 'ONCOassist', '[]', 0, '2019-11-26 06:28:54', '2019-11-26 06:28:54', '2020-11-26 11:58:54'),
('74e32a7ea10a4eb23ced994fcf16f4d5cae821bd215de3e5a92083f54c7a642114574337aa9ddbe6', 1, 11, 'ONCOassist', '[]', 0, '2019-11-24 23:05:38', '2019-11-24 23:05:38', '2020-11-25 04:35:38'),
('753b3d1d2356df7ebd728d9e66c387f264e3c426c8d6a14caf8230b83212aef515991ad43fc150cb', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 05:58:19', '2019-11-08 05:58:19', '2020-11-08 11:28:19'),
('75573b32fb5bab7ea00320447613442d0708c797214f4e19a9cfe6ee77eccb8cb35928bb4868e248', 1, 11, 'ONCOassist', '[]', 0, '2019-01-29 11:52:05', '2019-01-29 11:52:05', '2020-01-29 11:52:05'),
('75954ec21dcebf36adb096aa102def7909fb3bc3f014b4318308d851afc8e22436676d8a757fe20a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-15 03:34:33', '2019-11-15 03:34:33', '2020-11-15 09:04:33');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('759a17471f7c501e3f666915104e514c53ae3b35c1ea90d113f2c77c1145a5a5d8a739f514530de2', 1, 11, 'ONCOassist', '[]', 0, '2019-06-14 05:03:36', '2019-06-14 05:03:36', '2020-06-14 10:33:36'),
('75d623dbc8a60309dd6ce4f643165fa2b8293e79f7894318dd0a7e5afae2f2592c5404e30fc59604', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 11:32:19', '2018-12-04 11:32:19', '2019-12-04 11:32:19'),
('766d155769b43c4bd1fe75e293d65f46db7ce7b272371335e80ee022a8a9bd6cf0d728b62d097c38', 1, 11, 'ONCOassist', '[]', 0, '2019-11-12 07:08:47', '2019-11-12 07:08:47', '2020-11-12 12:38:47'),
('769fe9c07dddb62618d97faae9d1a732c7e9f2763bd80bf430e42830af77695aac5ef0197045c3a6', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 02:36:14', '2019-11-06 02:36:14', '2020-11-06 08:06:14'),
('76c2b498a008ca2a46149832bee75819fe3e719dac25f8bc49f9e68e7bf35aa6dfe22db14df51c3d', 1, 11, 'ONCOassist', '[]', 0, '2019-02-07 05:05:54', '2019-02-07 05:05:54', '2020-02-07 05:05:54'),
('76c4a6d4c24ea2ab4955164dac7b21d725519be4e42ecd772af5c4ae956f35096a067ccbf25fcf7f', 1, 11, 'ONCOassist', '[]', 0, '2018-09-07 19:43:01', '2018-09-07 19:43:01', '2019-09-07 12:43:01'),
('76cde1bd0dff6882ff9595d73ae0efef516fd9cf4a0697e778e4e15eaad58f5d513cdd5d6ac15784', 1, 11, 'ONCOassist', '[]', 0, '2018-11-29 07:53:42', '2018-11-29 07:53:42', '2019-11-29 07:53:42'),
('76e9eabe76fa56cde2dd95c6ef5554a9f563b462023b3a000a7b825e122212cda5a314f1731def2d', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:50:17', '2020-01-17 00:50:17', '2021-01-17 06:20:17'),
('7729b69204890f09d4c020809884567a325ea00664f98c3c10d699fea4f1d3869be4a847a0c3f549', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 05:58:34', '2018-12-04 05:58:34', '2019-12-04 05:58:34'),
('77331f1015831780506bbb379985c1d550ec42cd3adec435c4170b1dbc7c65f77132e2ce5caa6695', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 02:52:21', '2020-01-15 02:52:21', '2021-01-15 08:22:21'),
('774f1c823984721ce8063e7e8a4000ce00f0b86628288a8f9e1239a11c9b8a88331a66f0ae431910', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 11:42:51', '2019-05-09 11:42:51', '2020-05-09 11:42:51'),
('7785b0079fc999fa4412011e22665e8c256d6135dd9f0cd124c363f9caa33b4ad6ec496fb682a523', 1, 11, 'ONCOassist', '[]', 0, '2018-06-25 04:25:26', '2018-06-25 04:25:26', '2019-06-25 09:55:26'),
('77917c2fc1b3f405ffa7f33e7c08809cebb71ca4d16e2e1b2d3dc3013323d9cf48f7c3f11e9a756a', 1, 11, 'ONCOassist', '[]', 0, '2018-06-19 04:47:50', '2018-06-19 04:47:50', '2019-06-19 10:17:50'),
('77abd66e0e8b2da6c70662815191907ad49bbd9dd80aa235519e7080b23b79a322189feff1e5aeeb', 1, 11, 'ONCOassist', '[]', 0, '2019-04-26 08:35:00', '2019-04-26 08:35:00', '2020-04-26 08:35:00'),
('77bd6fd65d3bd79f0a361f8ffd789da53c1136a8e00aefa00b10063e6d5432e2b7a8d42afe731d7b', 1, 11, 'ONCOassist', '[]', 0, '2020-01-03 06:53:27', '2020-01-03 06:53:27', '2021-01-03 12:23:27'),
('77d40405c10bdd594742e96a4bae4959470fb57825fb83426a96faf35697e1bebaaee9fc51a37d21', 1, 11, 'ONCOassist', '[]', 0, '2019-01-17 04:59:28', '2019-01-17 04:59:28', '2020-01-17 04:59:28'),
('7800ff88a49e361be0935051bd01cecabe1b83616138619082246f62e1f540957dff419ebf3b866e', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 13:38:37', '2019-05-09 13:38:37', '2020-05-09 13:38:37'),
('781bee91869591de0273f28ba542c41c191edf604188ec1ab238e8a74a01dcb278dbe1516ac446e3', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:04:38', '2020-01-15 03:04:38', '2021-01-15 08:34:38'),
('783336078652163d9b79573b03894b29c4ea469c7bf8358a86753d62866dbf08bb52178d3294064b', 1, 11, 'ONCOassist', '[]', 0, '2019-11-01 05:59:50', '2019-11-01 05:59:50', '2020-11-01 11:29:50'),
('7867ccb76ff85e852e069d0d0a3a2b32879cdd0034394876bcd93402b18fe973b266e0a967874821', 1, 11, 'ONCOassist', '[]', 0, '2020-04-03 05:39:45', '2020-04-03 05:39:45', '2021-04-03 05:39:45'),
('7873c80c4a9343bdf294ba71c749e4210f1c504f0422855af7522d5dfe17fb44be18b318b3a95275', 1, 11, 'ONCOassist', '[]', 0, '2020-04-03 07:09:01', '2020-04-03 07:09:01', '2021-04-03 07:09:01'),
('788442b448ec3ba1943940064c0c92cf732000a5ff62cff2563018a37abcd3491243824d8c3f2f53', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 06:22:45', '2018-06-18 06:22:45', '2019-06-18 11:52:45'),
('788ec819d3d623085283db97fa2aceff1326ac72e45b7dd1a16aa1c8fd3628240cad645f0989d996', 1, 11, 'ONCOassist', '[]', 0, '2019-01-28 04:36:45', '2019-01-28 04:36:45', '2020-01-28 04:36:45'),
('78c1eaeb849f2f666c9eacedd84c476535ba3debb8ddbd030f715b4788c783b129139c8b5b74b22f', 1, 11, 'ONCOassist', '[]', 0, '2018-07-27 08:57:55', '2018-07-27 08:57:55', '2019-07-27 08:57:55'),
('78cb47a370a4e5ba56a149f6ec3725f1374b948bd7355c1a75b3d1269464c0c773210ae44712cfd9', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 16:55:01', '2018-12-18 16:55:01', '2019-12-18 16:55:01'),
('7904f5cb5d7daed648337fcf02492559f35a07f317ca58f92f38c0c35807698b43b4766f463a3577', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 08:54:57', '2019-05-09 08:54:57', '2020-05-09 08:54:57'),
('7910b8166ec1cc91a97292997516561e82bb3e4669b3df870875c398c604396b64f42790c091bd62', 1, 11, 'ONCOassist', '[]', 0, '2018-11-16 06:44:32', '2018-11-16 06:44:32', '2019-11-16 06:44:32'),
('79497ebdf1c12572681714ddd94adbe47999468684ba0f91a120a9df1b1164dd5f3902e62ee6bc00', 1, 11, 'ONCOassist', '[]', 0, '2019-11-15 02:21:53', '2019-11-15 02:21:53', '2020-11-15 07:51:53'),
('7961f377989cae4038e13d3b2142bf307c7feaf46b24d3a12dba65567af5f7c513c5a0a315566f94', 1, 11, 'ONCOassist', '[]', 0, '2019-02-07 12:25:01', '2019-02-07 12:25:01', '2020-02-07 12:25:01'),
('796f058a7fd693adc17fefe092040e9a4f75d8d03e4786795762950773d5f6129d96152074192ee4', 1, 11, 'ONCOassist', '[]', 0, '2019-05-28 03:37:58', '2019-05-28 03:37:58', '2020-05-28 09:07:58'),
('79b59b3f9f9bd86fb6edb3c423b0154c9f69b4052b711680727cbb31444ed7b64d7a750ee61cbbf5', 1, 11, 'ONCOassist', '[]', 0, '2018-07-11 08:12:21', '2018-07-11 08:12:21', '2019-07-11 08:12:21'),
('79c61b46476165ba4d32ebdd1780e9b2d0b0ae513d0ba7049120793aa83e4125581ea728243c94a9', 1, 11, 'ONCOassist', '[]', 0, '2018-07-10 12:26:26', '2018-07-10 12:26:26', '2019-07-10 12:26:26'),
('7a48edbedbec93e8357ff5e3ac1d6a8e16224724e91972d4b97dc2871b3aa76103253b7124c66fb9', 1, 11, 'ONCOassist', '[]', 0, '2019-04-18 05:25:24', '2019-04-18 05:25:24', '2020-04-18 05:25:24'),
('7a4a446ced0e773fd3d91a60a74766f374d5072d0c61cab749cbcc0d0976f5da54d7ba79cc5f25e7', 1, 5, 'ONCOassist', '[]', 0, '2018-05-30 05:20:42', '2018-05-30 05:20:42', '2019-05-30 10:50:42'),
('7a8e43b1e1c689120ae527cb11872c227ef63e7378a27964e5516e03b37ca032ca9e41e21a1d5206', 1, 11, 'ONCOassist', '[]', 0, '2019-07-10 06:38:29', '2019-07-10 06:38:29', '2020-07-10 12:08:29'),
('7a9473a24e20a35d777b6b755521c603c9931c6d9a8c4c8b8a5e6ef4d37b5c0e0c6c3e5712350f36', 1, 11, 'ONCOassist', '[]', 0, '2019-03-27 10:13:30', '2019-03-27 10:13:30', '2020-03-27 10:13:30'),
('7ad35d037f867b0c8c8b0d33082d44bbefec52f830f3008336dafddf83454d93a0fe14f2afa34d4e', 1, 11, 'ONCOassist', '[]', 0, '2019-05-10 04:45:45', '2019-05-10 04:45:45', '2020-05-10 04:45:45'),
('7ae9cfff8e15892a55f03ef41dfa8004cf4d79b55721a8da9192c61b08f3cdfeb6b5c19774262fb3', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 02:46:54', '2020-01-15 02:46:54', '2021-01-15 08:16:54'),
('7b0adc56be2501a3e237e5aa64365b6cbbf2ae1b14ec5d3dfb43fc15e1cb310d527465d0ec8d1f39', 1, 11, 'ONCOassist', '[]', 0, '2019-01-24 11:11:03', '2019-01-24 11:11:03', '2020-01-24 11:11:03'),
('7b13109b69395c471ce199281fa53dcf3f4dbeb744d3bf2d6a153f36d695aee59b1f851e659f4cf7', 1, 11, 'ONCOassist', '[]', 0, '2019-02-14 14:08:49', '2019-02-14 14:08:49', '2020-02-14 14:08:49'),
('7b27a629ad54a31583569f73ac81aed520b1401e375fd2e4e10bb991bb34618f0a33cc2a882dc6d8', 1, 11, 'ONCOassist', '[]', 0, '2018-12-10 09:38:36', '2018-12-10 09:38:36', '2019-12-10 09:38:36'),
('7b3e2fc38d1b5ecd78f3929e59cf5348f9de1f45bc633aaf7c13c887764daa1e2773885ae690d2a7', 1, 5, 'ONCOassist', '[]', 0, '2018-05-28 23:59:38', '2018-05-28 23:59:38', '2019-05-29 05:29:38'),
('7b8ced84497d2b6edbf3a2f2ef1cea4914288325c46bf452c2eca7aac4e0856466fdd83166a5a5b4', 1, 11, 'ONCOassist', '[]', 0, '2019-01-24 17:53:26', '2019-01-24 17:53:26', '2020-01-24 17:53:26'),
('7ba3acbd8addb5ed44c4025049a18e07be93b7015fd7e42b693733d0a86f1f10c178d8c11c059811', 1, 11, 'ONCOassist', '[]', 0, '2020-07-01 21:50:08', '2020-07-01 21:50:08', '2021-07-01 14:50:08'),
('7bab7b295ed684fb2ad78937e67e917a5c5c9c53120ee1ec3e8b8aa315b778d2c1ac7c78a9a592db', 1, 11, 'ONCOassist', '[]', 0, '2020-02-21 02:33:05', '2020-02-21 02:33:05', '2021-02-21 08:03:05'),
('7bc5146a08d037ede50ee3e6d82c893cd317843850850f8691c72c8141a201e3763f7f3e4deec2e3', 1, 5, 'ONCOassist', '[]', 0, '2018-05-30 05:30:55', '2018-05-30 05:30:55', '2019-05-30 11:00:55'),
('7bdc040ecc3816c02559e74d4eaf5e94a51787e535576f3b7f440193266ba06caf51a8133fac1792', 1, 11, 'ONCOassist', '[]', 0, '2019-11-26 00:02:43', '2019-11-26 00:02:43', '2020-11-26 05:32:43'),
('7c260a3b63cdfef60979738a37be0bdac503cd717c19eb124cec6d056b873b2109b11a2c0fcc45b3', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:35:20', '2019-11-22 00:35:20', '2020-11-22 06:05:20'),
('7c297a56ec7549f949ba53a00cc0c0ed993ff9ee3bcf235620020822ce0f4b0f1b5debddce6485cd', 1, 11, 'ONCOassist', '[]', 0, '2019-05-08 13:50:46', '2019-05-08 13:50:46', '2020-05-08 13:50:46'),
('7c6022b8c946279a4dadb160236436b359ad2b7a7f16dfee308dbfa2e8781ac686f1237ac3dacd4f', 1, 11, 'ONCOassist', '[]', 0, '2019-01-28 14:50:41', '2019-01-28 14:50:41', '2020-01-28 14:50:41'),
('7c695d0901c0bbc93187fa0b98b73671bf47338a7aa2333b09bd86407956f7c0eef7eaa52e1ae0b9', 1, 11, 'ONCOassist', '[]', 0, '2019-05-10 08:14:32', '2019-05-10 08:14:32', '2020-05-10 08:14:32'),
('7cac976704bc79283a2e839b49d4d09080f465b653d6cccc8cd38b067ce843bcb929587b873c7e3c', 1, 11, 'AIBotDemo', '[]', 0, '2020-02-19 03:59:20', '2020-02-19 03:59:20', '2021-02-19 09:29:20'),
('7cd45a5aba64dd8698c27285600f37e3c4ec8dbffae10aaac57aadd46d118a2747ebba56c09c4d39', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 00:15:41', '2020-01-16 00:15:41', '2021-01-16 05:45:41'),
('7d37f5ccd29715f482db8939d805ddc7b4db07f1bd1750f8e09295e9f9731842e7827161a8aa4f9f', 1, 11, 'ONCOassist', '[]', 0, '2020-03-26 13:36:52', '2020-03-26 13:36:52', '2021-03-26 13:36:52'),
('7d6816c88f5123b46c88e35bd70107179d377769191192e93e1e552214fc05a971fa37716af4e031', 1, 11, 'ONCOassist', '[]', 0, '2019-04-22 17:06:30', '2019-04-22 17:06:30', '2020-04-22 17:06:30'),
('7d8560580b77b0fc014446b025d124b4fed64cba948fb43c6c051c8ef4f750d8af647f5f1e7aa194', 1, 11, 'ONCOassist', '[]', 0, '2020-02-27 09:15:15', '2020-02-27 09:15:15', '2021-02-27 09:15:15'),
('7dabab71c61f7d6c3ab7279a16fae4123f8ff540c8a5ffb03383648db5310d5158bad0eb4262ea74', 1, 11, 'ONCOassist', '[]', 0, '2019-03-15 10:40:57', '2019-03-15 10:40:57', '2020-03-15 10:40:57'),
('7db3b325ea8431ca5faa8602c3a062a39ab66f68915b3216799f0fdbd474680dd23b3740cdd9a1c4', 1, 11, 'ONCOassist', '[]', 0, '2018-08-02 06:23:56', '2018-08-02 06:23:56', '2019-08-02 06:23:56'),
('7df29eb63b858c287c001f1d1de21b47073cd51974326c3660cff3e29dd83ccd75289716d35f9063', 1, 11, 'ONCOassist', '[]', 0, '2020-03-11 14:01:06', '2020-03-11 14:01:06', '2021-03-11 14:01:06'),
('7df6c8e970f334d02019a5016c4396128c6f84c09d80649cf7b16edce4a1ad2521237a9253f67977', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:55:16', '2020-01-16 02:55:16', '2021-01-16 08:25:16'),
('7df94b35dd0a59795a57b1c2c2709701fb46416e4918c81dc4e8b94561f2bcbb838e06ccb424035a', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 06:07:40', '2018-06-18 06:07:40', '2019-06-18 11:37:40'),
('7e091d96c2d60cfab89d6ed2f187767d535e80e1f91b743603481ec570fae76e54b6fdaa38957133', 1, 11, 'ONCOassist', '[]', 0, '2020-05-07 13:51:02', '2020-05-07 13:51:02', '2021-05-07 13:51:02'),
('7e3376717d3663a7483cf9f16997500650210278ac43da91ff9ac87df6fdff7a2e34f186af872d2d', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 10:22:44', '2020-04-20 10:22:44', '2021-04-20 10:22:44'),
('7e61b95e60db00817590f86aae7ab4c537d313c0f5e6384607671819b3199240911f0c13bfbbf092', 1, 11, 'ONCOassist', '[]', 0, '2019-07-02 01:54:54', '2019-07-02 01:54:54', '2020-07-02 07:24:54'),
('7e71900c3468b5f8b2e7968a276cd055b75bffc5e5fbc1d6787af7890b9d156ebb226b43be873b2f', 1, 11, 'ONCOassist', '[]', 0, '2018-09-04 11:31:43', '2018-09-04 11:31:43', '2019-09-04 11:31:43'),
('7ea1a85cd8808cd1bae2dae9a9a227f707be3009713fee98180d18a8747d494dcbf07bd7d156741d', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 06:17:41', '2018-06-18 06:17:41', '2019-06-18 11:47:41'),
('7eb2a4352958bd77f1b86504237e816af09d26c470df573a7074db9d5feec347eea8c2d542dcca61', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:48:22', '2019-11-22 00:48:22', '2020-11-22 06:18:22'),
('7ec3cec0d697553360f2cfe7f4468fd6b327725de2511b0bc9e24c5a36ab2beb05a87311964e1ec5', 1, 11, 'ONCOassist', '[]', 0, '2019-04-22 06:06:57', '2019-04-22 06:06:57', '2020-04-22 06:06:57'),
('7ee270bd9c8496f040fb104509c919015bc0aff63a5cb851c97d8d4bb950ffea4226af6f083ec1a7', 1, 11, 'ONCOassist', '[]', 0, '2020-04-07 05:00:21', '2020-04-07 05:00:21', '2021-04-07 05:00:21'),
('7ee3adc7c3f1e0b233b374bbc84ec40c1bae457b1615476b057b35cd1f7ceb3bdf8b2c2a39f0def8', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 05:19:50', '2020-01-16 05:19:50', '2021-01-16 10:49:50'),
('7ee5b91e62cd03532bb1e174c96db824a623e5697459aa27c2dbdcd9209ea4936389ab60c1fdac5f', 1, 11, 'ONCOassist', '[]', 0, '2020-01-02 23:23:45', '2020-01-02 23:23:45', '2021-01-03 04:53:45'),
('7eed28aed85122bde48771940a4a35af357065dda71b647a091b8498f2a7ad635d3af0fdd2e14672', 1, 11, 'ONCOassist', '[]', 0, '2018-11-29 12:27:07', '2018-11-29 12:27:07', '2019-11-29 12:27:07'),
('7efef0c942b95c8f346c4cc3692c92703643b26fb41998a05d8c1456bc8120d15474d7be83553856', 1, 11, 'ONCOassist', '[]', 0, '2018-12-11 09:40:41', '2018-12-11 09:40:41', '2019-12-11 09:40:41'),
('7f31d8dcbe76d82288ee496503c9b17c6f6d45754ac689ed9f134db0cb370fc5d886b564469e42c0', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 07:42:29', '2019-11-22 07:42:29', '2020-11-22 13:12:29'),
('7f4eca6db406027d6d3512601be56203e94e1bda612a24c58fc39bb04b635c33162a1a3a1004f733', 1, 11, 'ONCOassist', '[]', 0, '2019-03-07 09:25:53', '2019-03-07 09:25:53', '2020-03-07 09:25:53'),
('7f53d5836a8e18ce2c7539d284953be6c1e0beca2f71292e0719ec4f350a157b10a3919784342af4', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 07:20:22', '2020-01-16 07:20:22', '2021-01-16 12:50:22'),
('7f6f49f195f4f31ce8d430bfac284c26b216ebca8d8b3bd4dd06fc3a1adbda1554743bcee3d83bff', 1, 11, 'ONCOassist', '[]', 0, '2019-04-10 09:56:18', '2019-04-10 09:56:18', '2020-04-10 09:56:18'),
('7f8c59a69cd8359825452ad4897b3284eb8a48649b2bd8d45a65502e17748b37d26d38b5665e422b', 1, 11, 'ONCOassist', '[]', 0, '2020-04-29 13:13:34', '2020-04-29 13:13:34', '2021-04-29 13:13:34'),
('8009d3c61dd5781ca993f60736427921b581abf88b9a178012469e6391718b0198e577da88b8b91b', 1, 11, 'ONCOassist', '[]', 0, '2020-02-28 05:15:14', '2020-02-28 05:15:14', '2021-02-28 05:15:14'),
('8027623d49c6acafed4035850fa6992842adbb5ec1f61e9fa13ef2da9cd9b35536ecf21ba511464a', 1, 11, 'ONCOassist', '[]', 0, '2020-05-21 13:46:36', '2020-05-21 13:46:36', '2021-05-21 13:46:36'),
('808620bb538519b5892d30445355b4a5b1bf49598cdeaa17dca9d3733f217b40017b54e9f17777d2', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-10 07:20:56', '2020-01-10 07:20:56', '2021-01-10 12:50:56'),
('809f4a03e11d825ba206a5f9ce85f2dfb5862e71eef8306efc72d18b20d8859e855b10fbb66e1ba7', 1, 11, 'ONCOassist', '[]', 0, '2018-06-28 12:11:01', '2018-06-28 12:11:01', '2019-06-28 05:11:01'),
('80bf0f179dddfa557d936444e2b93825b8b304d6b7e95bfb237c96232e83148a5f2349589d939793', 1, 11, 'ONCOassist', '[]', 0, '2019-02-04 11:47:27', '2019-02-04 11:47:27', '2020-02-04 11:47:27'),
('80c8ddbca0faede76c0430ad1cb4213f6fca04d23c9ee02e0c7e3292f07d43bb760a6585297d3ab2', 1, 11, 'ONCOassist', '[]', 0, '2018-11-23 04:41:46', '2018-11-23 04:41:46', '2019-11-23 04:41:46'),
('80d9f16551b930e8471125ca6bb076fb301aee3ec3429afabea5e7a1088744b506a43dcc0a750baf', 1, 11, 'ONCOassist', '[]', 0, '2018-11-29 13:22:42', '2018-11-29 13:22:42', '2019-11-29 13:22:42'),
('80dce97c25723a3a9319d3e71c4a6c7fc97d82f4b97ebe536baa0be48c08945be1c621f654a2cd90', 1, 11, 'ONCOassist', '[]', 0, '2020-03-02 05:08:40', '2020-03-02 05:08:40', '2021-03-02 05:08:40'),
('80eb47463490b6ad399a32897d31f40eb94bae38cac0054c5fff1d75272c25ae94e86f1e0b7c3d9f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-18 02:04:41', '2019-11-18 02:04:41', '2020-11-18 07:34:41'),
('811cccbcce1aafe22396d1e754833a4e5743e283d5ad0cd34fbf58ddd0aafbfa10f71e74a985b5e7', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:04:42', '2020-01-16 06:04:42', '2021-01-16 11:34:42'),
('812cc5c77c8c6a4da2ac8700356de2f524ab6db285a178bc8e2e8c563e89af3daa608041c8d7aa13', 1, 11, 'ONCOassist', '[]', 0, '2018-12-06 10:13:26', '2018-12-06 10:13:26', '2019-12-06 10:13:26'),
('813cc4c05957b72a99ad2f1bdc9889bba880cb9f77e78c5f242c573a14a016271fdc00564aa90ac1', 1, 11, 'ONCOassist', '[]', 0, '2019-04-24 08:07:33', '2019-04-24 08:07:33', '2020-04-24 08:07:33'),
('8154d7173790e0fbe5f1fd285c824f31a5da2b1f129ddac9fc149dd73d8ac65d31e722c220441540', 1, 11, 'ONCOassist', '[]', 0, '2019-11-28 01:02:45', '2019-11-28 01:02:45', '2020-11-28 06:32:45'),
('81589a8bc0e1c62003a93fc5d00d2e6d163f1a853652f7717853960187f7d2ceeaaa2fccb86419db', 1, 11, 'ONCOassist', '[]', 0, '2018-12-03 14:16:38', '2018-12-03 14:16:38', '2019-12-03 14:16:38'),
('816c4f74c2f0c2f8ec60d0802bcbdc086937b5feacb599982558b54c4409f509f321f799a60b935a', 1, 11, 'ONCOassist', '[]', 0, '2019-03-29 17:32:32', '2019-03-29 17:32:32', '2020-03-29 17:32:32'),
('81a9c8ba3325db6efaa3c755cfe9446813d70ecae2807fa7e59002d0c6e85f2a5a6909c9b6b88fd5', 1, 11, 'ONCOassist', '[]', 0, '2019-01-17 05:09:12', '2019-01-17 05:09:12', '2020-01-17 05:09:12'),
('81bdb0174470bc99510cafef7306beedccf9df70bee8e7d31ae70cc241ac0a63b1f5f14dbe9bf631', 1, 11, 'ONCOassist', '[]', 0, '2020-02-26 12:56:06', '2020-02-26 12:56:06', '2021-02-26 12:56:06'),
('81c4aaed19357b45223cb1425d19c65bf7f2e05085abe0b26787027ce4a8c1aad19c1a416ba88bd4', 1, 11, 'ONCOassist', '[]', 0, '2018-12-14 09:07:46', '2018-12-14 09:07:46', '2019-12-14 09:07:46'),
('82112971d2b5618394da6c7a51ce72068f474edb78b0b97d263b10b05bcb954855712425b0fe9bdb', 1, 11, 'ONCOassist', '[]', 0, '2019-04-22 09:29:51', '2019-04-22 09:29:51', '2020-04-22 09:29:51'),
('8284e62d32b635bad3e9d5ec78449be3c56d37170f9ca0bcc9e92c642680b78a16adddf03bce4eee', 1, 11, 'ONCOassist', '[]', 0, '2018-11-02 06:34:43', '2018-11-02 06:34:43', '2019-11-02 06:34:43'),
('82ba1e402665e5cfe8b6c28cfeae45666f57059e9c44d18764a70e5465de0ad5391095c64124d863', 1, 11, 'ONCOassist', '[]', 0, '2019-01-22 11:17:04', '2019-01-22 11:17:04', '2020-01-22 11:17:04'),
('82bb80099a4a788ae6ed49152eb8c96b53757cfd3ec11bc6cd72456b9ae67a378ac629b88033420d', 1, 11, 'ONCOassist', '[]', 0, '2019-03-15 09:33:46', '2019-03-15 09:33:46', '2020-03-15 09:33:46'),
('82c26ea6a8d0234205f234beb13ab5cfe5dd894ac6ffd10ff9758eec596cbc9ef0d9ca8be3823bb7', 1, 11, 'ONCOassist', '[]', 0, '2018-09-06 15:50:44', '2018-09-06 15:50:44', '2019-09-06 08:50:44'),
('82c52ae4b6d1dbf69b48579283d231376c47150c22ae6cd905d7412198c6b3feaf44f35da87f137c', 1, 11, 'ONCOassist', '[]', 0, '2019-10-22 02:22:38', '2019-10-22 02:22:38', '2020-10-22 07:52:38'),
('82e954823f7908d52b1e117755e205840af3eccee8d97a861df7bc97006694d27eb1e52f2067e913', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 10:19:50', '2019-02-12 10:19:50', '2020-02-12 10:19:50'),
('82f005995e16b3debda9ec163664f8a2ad756dc6fc6aa0e8496c2c63b67e2eef409f03e32776f86e', 1, 11, 'ONCOassist', '[]', 0, '2019-07-10 06:43:50', '2019-07-10 06:43:50', '2020-07-10 12:13:50'),
('82fe1c0b6b7149b323387e4ae6035a4fd19599946513327b3cb72eda9a947e3674252d8d4058a5d7', 4, 11, 'ONCOassist', '[]', 0, '2020-01-03 08:35:45', '2020-01-03 08:35:45', '2021-01-03 14:05:45'),
('8301733ddc4b902fac50910ac60cfc86141dab1f3b9b7324c41e350c27f3bab88258efafab5189bf', 1, 11, 'ONCOassist', '[]', 0, '2020-03-16 04:52:40', '2020-03-16 04:52:40', '2021-03-16 04:52:40'),
('83399913ce492b0a7c967d7c37a0b8ea6572bea296e23cb5e8ce3b4392c6c0e7bf14c8c8ab1724fe', 1, 11, 'ONCOassist', '[]', 0, '2019-02-20 16:30:38', '2019-02-20 16:30:38', '2020-02-20 16:30:38'),
('8341471ca7a1168de94be9e6c12d1596a3c6bcf975e31e5e56ddd7d1383142424c9bbaf398c2f9c8', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:48:02', '2018-06-18 00:48:02', '2019-06-18 06:18:02'),
('835890479ddc2181732dff5c255f5af256653c5db98eff3c9cc9bdc485be40be4c06ab16dc3ad5f2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 06:41:54', '2019-11-07 06:41:54', '2020-11-07 12:11:54'),
('835c9fe02d950a635bdae2cfd776c195e517a69fba6267020dba2c6ff682257e800f8d42631b21b1', 1, 11, 'ONCOassist', '[]', 0, '2019-04-02 08:06:46', '2019-04-02 08:06:46', '2020-04-02 08:06:46'),
('83609c4dbb240bf1c751dfac6e743743e6c0cd7693632f545f8077aa8c5b2330e4d3714b01259496', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 01:46:56', '2020-01-16 01:46:56', '2021-01-16 07:16:56'),
('837df51d943cbc17b0a93c528944d038d68ab8be6a4921e4ca0e85c5ccde8d74a5e9d1e3bac89fbb', 1, 11, 'ONCOassist', '[]', 0, '2019-02-11 06:36:20', '2019-02-11 06:36:20', '2020-02-11 06:36:20'),
('83e50910614a7140508790e256d1e0624f513654ad8822a3bc6cb2b6da9dc7b660a922e9d897aaa4', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 06:45:56', '2018-12-18 06:45:56', '2019-12-18 06:45:56'),
('83ea6ef237e6e89aadce6b0248ee768c91a6180c0cc4782d9b728f6cf3b150dab76e53b1a6bc512e', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 02:00:33', '2019-11-22 02:00:33', '2020-11-22 07:30:33'),
('83f91049faeec55647f4a2fdd8c96ce5cfb84ae890098c7e8fc573d8fbe631e6b1e6def090184143', 1, 11, 'ONCOassist', '[]', 0, '2019-03-04 09:59:05', '2019-03-04 09:59:05', '2020-03-04 09:59:05'),
('84089700a8e1a59b628a2c138a6d0214f9398a23638559995eeda7979ad4262b081e9af9f07d240e', 1, 11, 'ONCOassist', '[]', 0, '2019-11-12 22:57:00', '2019-11-12 22:57:00', '2020-11-13 04:27:00'),
('840a777756a1e2b6970e5120b502a2e27d9a3401fe5ee233cdecf61c76c2f755d971a23a73a7eabf', 1, 11, 'ONCOassist', '[]', 0, '2018-08-20 09:07:27', '2018-08-20 09:07:27', '2019-08-20 09:07:27'),
('843fe76317de3960718dd0d4d69b7b8b114d9ba2304c7539b0250e9603dd54e75c06f992e324660e', 1, 11, 'ONCOassist', '[]', 0, '2020-04-28 08:22:20', '2020-04-28 08:22:20', '2021-04-28 08:22:20'),
('8471675f6f129f226f1984256f529f690c0e0782fd5538fef50f9066049072e0d42e19c760076945', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 02:20:04', '2019-11-07 02:20:04', '2020-11-07 07:50:04'),
('84999745218a9a5b50cb4bf8b98ef09c0b492d4fe46de3ec3935d761abcef1c66850f04b8d2be668', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 14:45:17', '2019-02-12 14:45:17', '2020-02-12 14:45:17'),
('8499c163900dc793dfcb577e5eccd326658dd4d2058656687d07ae983ba022609b7d4d00168ddd75', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 23:17:17', '2020-01-09 23:17:17', '2021-01-10 04:47:17'),
('84a7dc3102aa43da8193c6a34e3aeee55229c96429a494201762ea6284083a37ef86c17870d3a61f', 1, 11, 'ONCOassist', '[]', 0, '2018-07-09 06:19:38', '2018-07-09 06:19:38', '2019-07-09 06:19:38'),
('84aa2c781b26f2f44078d0de6a498ccb65669fb90931cdb3a458b22ce1f18353223a2c4db84e5ce8', 1, 11, 'ONCOassist', '[]', 0, '2019-01-03 08:09:04', '2019-01-03 08:09:04', '2020-01-03 08:09:04'),
('84cdc3b2cd661958aec151601ef83b61ac6c265dab69a04627d7ba7e237ed33ee2657b03e2aeb14d', 1, 11, 'ONCOassist', '[]', 0, '2019-05-14 16:52:19', '2019-05-14 16:52:19', '2020-05-14 16:52:19'),
('84d5f0a2158baa97938e675d08c1cebaf66139bede6b76e7b9ef1984cba6714c0205ee80ff935e73', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 13:22:28', '2018-10-29 13:22:28', '2019-10-29 13:22:28'),
('84f8e4a4448ffbe7b3ab9e0ef380d93f1938cace6e7ed4fb0918cd804da876ad94ed539b9529f886', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:30:07', '2019-11-22 00:30:07', '2020-11-22 06:00:07'),
('8512fa616cf128ec48b78f6c7e680dc4e814fc86e648418f9e415301c1ef066ccf1a7b6ba5b95725', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:29:38', '2020-01-16 06:29:38', '2021-01-16 11:59:38'),
('85627d0596778cc70eff7778ccbacc2fba4ffc1289e1cc1451cfd80626023d20a1e796ccfed2671c', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-23 01:05:42', '2020-01-23 01:05:42', '2021-01-23 06:35:42'),
('8564a2f7042a64a09b8bf1af7a2d8d731f94749033321f0180e8c4dc4d44376d0cda861edc9b34f6', 1, 11, 'ONCOassist', '[]', 0, '2020-03-03 08:52:06', '2020-03-03 08:52:06', '2021-03-03 08:52:06'),
('856fe02a7eba29573d6bc462eee8eff81f0f6488e5a7beeed4b3b3dfdbd5f8831c32d710b38d6416', 1, 11, 'ONCOassist', '[]', 0, '2019-06-11 23:15:29', '2019-06-11 23:15:29', '2020-06-12 04:45:29'),
('85a7155d61812b3ec1ccbf384bd3b6df775facd1d34a05f6e33f94d2df053a955d735446f5396e2b', 1, 11, 'ONCOassist', '[]', 0, '2020-02-24 05:05:06', '2020-02-24 05:05:06', '2021-02-24 10:35:06'),
('85be7c42d13a484b64ec418ff909e65e3cafab5aea9e81e9292dc557ea7c7fcb4394d7bd0bbb5015', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 06:17:00', '2019-02-12 06:17:00', '2020-02-12 06:17:00'),
('85d139720c9b7e8dd46b6821662f64f10d8d427f06459dd7c30351110e6eef00dba6e1260a511dd0', 1, 11, 'ONCOassist', '[]', 0, '2019-11-17 22:57:44', '2019-11-17 22:57:44', '2020-11-18 04:27:44'),
('85f1dc5836057772d79655561b9988581d72f02dfe889cb0e63008cfa489382717a7d2a169cb399d', 1, 11, 'ONCOassist', '[]', 0, '2020-04-29 12:23:27', '2020-04-29 12:23:27', '2021-04-29 12:23:27'),
('861bc7538802ad86d4f0b36a3dc90274d3fc1eff395f8aa113e2805e72cecc29b2eaed272ee80339', 1, 11, 'ONCOassist', '[]', 0, '2019-11-20 01:21:34', '2019-11-20 01:21:34', '2020-11-20 06:51:34'),
('8648ae1c3811c845d59471057572eb03c3ef4d74adc7098883f29addf928eb82c03bf2e679e057ef', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 16:40:50', '2018-12-18 16:40:50', '2019-12-18 16:40:50'),
('8699fc7f7a2247129a961a501e1c06706baf498ff360005d0eb593da7a2dde2e4aee7504107fd862', 1, 11, 'ONCOassist', '[]', 0, '2020-04-17 09:54:03', '2020-04-17 09:54:03', '2021-04-17 09:54:03'),
('86b1654330f5dd5c2beb7137a63f9cec5b34b66b09f967a9dce8ec565998542fef525651e1189ead', 1, 11, 'ONCOassist', '[]', 0, '2020-03-11 05:26:12', '2020-03-11 05:26:12', '2021-03-11 05:26:12'),
('86e1361453d3d1e2ffa19640c779b9f9a0969a7a0357cfc8c8ed55819bedb8356b9c5b495229e87e', 1, 11, 'ONCOassist', '[]', 0, '2018-11-29 12:21:46', '2018-11-29 12:21:46', '2019-11-29 12:21:46'),
('87023cc78916bfe8544b30af6287fb67930972689f4d76728afe0cdc28d112744f922027c97f6120', 1, 11, 'ONCOassist', '[]', 0, '2019-04-15 08:16:40', '2019-04-15 08:16:40', '2020-04-15 08:16:40'),
('8775404d0aea8eb702deef0f2f33dcb3b8a050edb51d1d1d53575134603765658ce77e386142a09a', 1, 11, 'ONCOassist', '[]', 0, '2019-05-15 06:45:37', '2019-05-15 06:45:37', '2020-05-15 12:15:37'),
('8776b48490c55e253fcd3f9c23ab271fe452d7c39f58278de3878c6606fc1944f0d9ee22f8e0526b', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 10:01:19', '2020-04-20 10:01:19', '2021-04-20 10:01:19'),
('877defd7ebec300b6abc5abf3221a2dce606f7bd2ae7e5b62265ab308d97efd0006f7d3dc2f6bac0', 1, 11, 'ONCOassist', '[]', 0, '2018-07-12 06:52:36', '2018-07-12 06:52:36', '2019-07-12 06:52:36'),
('87aa0ba46cc314f7555c97faaa273950ad77e5939afc42ca93f1dc7481b07f97977326dec03794aa', 1, 11, 'ONCOassist', '[]', 0, '2020-04-10 10:21:20', '2020-04-10 10:21:20', '2021-04-10 10:21:20'),
('87b5d2d8be9d6d0583f8bb3b4a4ef85b41f0cb48e88540e7ade087d1afc333068f719733c3ab2df5', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 01:02:33', '2020-01-17 01:02:33', '2021-01-17 06:32:33'),
('87b7f29919d7fa6e81d1d47c4c0627d8690a1e456c0db9202c9ac2e525ff240ebfec15cf502a3548', 1, 11, 'ONCOassist', '[]', 0, '2019-02-06 09:26:50', '2019-02-06 09:26:50', '2020-02-06 09:26:50'),
('880e421a892072b0a2d52e11caf8ac92150984efadcc8cbbdfd1599671d7f31c78370b846843397a', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 11:44:27', '2019-02-12 11:44:27', '2020-02-12 11:44:27'),
('88380e60bf93bf95ab825fd35cee347b42982379d15daa707ff874051f66c9103e2d8205da04ac9a', 1, 11, 'ONCOassist', '[]', 0, '2019-02-14 05:43:08', '2019-02-14 05:43:08', '2020-02-14 05:43:08'),
('8844a91c59b9aaffaf06875e4d6cf80a5d5e2f2d02e77cf98c02fe881c4eab87190728394156bfdf', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 03:06:37', '2020-01-16 03:06:37', '2021-01-16 08:36:37'),
('8884454b5f8b94b7d6906a43eb28b485e24c7da3835c7b6a9458c2f9ce1e59ce411e20b87ef26116', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 06:24:45', '2019-11-05 06:24:45', '2020-11-05 11:54:45'),
('88e0bd9c6f324f0b590ccb9c4ee7fb0777fc584773a33be5ecfc76693d7ca0a04bc802037a06d1ec', 1, 11, 'ONCOassist', '[]', 0, '2019-08-27 05:58:19', '2019-08-27 05:58:19', '2020-08-27 11:28:19'),
('8919810666c7df272b93f068cbd6a76d3a2ff27a16f81d34a8def6289759a225bf54f3c62cd5f988', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 03:10:49', '2020-01-16 03:10:49', '2021-01-16 08:40:49'),
('89480d6acbb35d335c050084ad1a9b2278ddb6e7d57a61d9b731397c20a9b3d1608a3dc7ab9e053c', 1, 11, 'ONCOassist', '[]', 0, '2019-05-13 13:15:41', '2019-05-13 13:15:41', '2020-05-13 13:15:41'),
('8976314d0b6c9fb7e77a36ff4bd77cb80d38960e1c249053413862dbf7fd8de947f63fde791f53d6', 1, 11, 'ONCOassist', '[]', 0, '2019-04-03 16:16:48', '2019-04-03 16:16:48', '2020-04-03 16:16:48'),
('89b6eeacb0eaab5fb55bf7dd0c7f729cd0094fb442a9cb1231ee6abb25a4765d91debc1d95426033', 1, 9, 'ONCOassist', '[]', 0, '2018-06-16 01:48:13', '2018-06-16 01:48:13', '2019-06-16 07:18:13'),
('8a2a947ad70bbfcd04a3c528940adc8ced2f2cf93b8df86872fcf578e3cea0fee2d180a606f75e1f', 1, 11, 'ONCOassist', '[]', 0, '2019-02-25 16:38:01', '2019-02-25 16:38:01', '2020-02-25 16:38:01'),
('8a51481bd93968ee697098c5e54c1097fa54f509c562ac41a5d9e4005d49d69a53cbc399fd4ffd6a', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:35:33', '2020-01-16 02:35:33', '2021-01-16 08:05:33'),
('8b0151b406ed93c5e40e47f9fdc3a4d35fd26221a12122a518956d141cc0406e4510399f789db1a3', 1, 11, 'ONCOassist', '[]', 0, '2019-06-07 05:06:39', '2019-06-07 05:06:39', '2020-06-07 10:36:39'),
('8b139204870157aae12911ca1168a028cb2ba86b4a5c4085912f8ed170035a378d17c94a2ff10cf4', 1, 11, 'ONCOassist', '[]', 0, '2020-05-15 06:17:59', '2020-05-15 06:17:59', '2021-05-15 06:17:59'),
('8b5727247b3866e2853528297a9014d02f1dbcbea846ac143be9e4e23dd78ac82d57492b23ad6b82', 1, 11, 'ONCOassist', '[]', 0, '2019-05-31 02:20:40', '2019-05-31 02:20:40', '2020-05-31 07:50:40'),
('8b6b64b71cfa2d4557813d85fd636ea9dcbc5e824ba53a0d9d20f7c7d014d5c4eaca3fcc634357e6', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 05:57:15', '2020-01-15 05:57:15', '2021-01-15 11:27:15'),
('8b91b5381f9a164aa5754928c437cee70107c1d247605b5594bf433bb23c50b366607c6ed58c3080', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 13:30:53', '2018-10-30 13:30:53', '2019-10-30 13:30:53'),
('8bc6fb0a571029ca6f5bd8348c74dce3f9ab5ac9db0ce1adffadd0a265acf934caa8b00af38aae18', 1, 11, 'ONCOassist', '[]', 0, '2019-04-05 11:28:06', '2019-04-05 11:28:06', '2020-04-05 11:28:06'),
('8bd273e6fe55251e01bdb13831b6402b00ecfa04f6323253a2cb15d0154f4be380437f85c01ca307', 1, 11, 'ONCOassist', '[]', 0, '2019-11-28 04:13:15', '2019-11-28 04:13:15', '2020-11-28 09:43:15'),
('8bd2ce9afa5a501fd6d3783fc56ca2180ff4d371e4f022e87235c580c0a40de64c6bd060a248a4de', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 01:21:09', '2019-11-21 01:21:09', '2020-11-21 06:51:09'),
('8bdb805cb37cf4898b3da42bbd6d433f75abe7ca422c3adaef87b7b467ae79837a65d949f5ce446f', 1, 11, 'ONCOassist', '[]', 0, '2019-04-10 10:20:35', '2019-04-10 10:20:35', '2020-04-10 10:20:35'),
('8c2f7c0cc915db77b7086bbd997f57f449303d2e513410b49b659c3c702e136036ea1512fddfb518', 1, 11, 'ONCOassist', '[]', 0, '2018-12-01 05:31:06', '2018-12-01 05:31:06', '2019-12-01 05:31:06'),
('8c6857d173086ee45d95833b041ed09c6c4afffd669a1c6bd85fdb938e0de417df99ed6da2a2102d', 1, 11, 'ONCOassist', '[]', 0, '2019-01-21 06:27:26', '2019-01-21 06:27:26', '2020-01-21 06:27:26'),
('8cb1b55ef832edfa36a878a2d1cccd951fe65dbde1a94562921d7f520329a59276844521392acb5d', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:46:07', '2018-06-18 00:46:07', '2019-06-18 06:16:07'),
('8cb9791e82e74ac3d2d1b765e6875d9ae62a44249e926d0b30fc2b747cff440007e67ac2fd2bc107', 1, 11, 'ONCOassist', '[]', 0, '2018-07-12 09:49:05', '2018-07-12 09:49:05', '2019-07-12 09:49:05'),
('8cc7e6197df096207ded98702a828e1026f74364dfe0f8d8e3eb78c44a2f48943a4efa2adcf3eed8', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 03:41:42', '2019-11-06 03:41:42', '2020-11-06 09:11:42'),
('8cd93b2963ce19fb9419dc4e5fffe724ec2a80528dbee7f07918f6a7847e740242f307e509833041', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 09:03:49', '2018-10-30 09:03:49', '2019-10-30 09:03:49'),
('8cf2c45148d03a7f4a2fe8f1145f54a4a5c09f21204f6de6c665638a5e36337f80e85c1157227966', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:59:30', '2020-01-17 00:59:30', '2021-01-17 06:29:30'),
('8cf6cb361e63aea19fe81433eb55434c36b73e18d8fe1665bc91e4a49c0a7de21974f4dc984950a4', 1, 11, 'ONCOassist', '[]', 0, '2020-04-10 05:02:13', '2020-04-10 05:02:13', '2021-04-10 05:02:13'),
('8d391775059a72d398c31796f0438d0840cd90744f9b4896b4d0009ae5dac13ba39bf12f32ed5134', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 09:19:57', '2018-10-29 09:19:57', '2019-10-29 09:19:57'),
('8d96fa15f2bdb0bb0f825fe46be41ed5c7d2f351dc8809203ebb68addac5c905b4d134db58cafebb', 1, 11, 'ONCOassist', '[]', 0, '2019-02-07 04:45:25', '2019-02-07 04:45:25', '2020-02-07 04:45:25'),
('8da4588d652c41fc2d839b46b0ccda2b6084ab74c92fd83caae9844029d3ea9fa9ffa6d43b27ab3e', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-13 01:47:13', '2020-01-13 01:47:13', '2021-01-13 07:17:13'),
('8e08e445d71e8d7aa570bba0b4b02f8089b1ab697de228465caca0b9617d9639fb6d66f12bfd4879', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 14:16:53', '2020-04-20 14:16:53', '2021-04-20 14:16:53'),
('8e1afe48294505a28fb1c9789cb7ec9ab4f389502604e2507b3ac26bf00e64a98f0fc98680adfc64', 1, 11, 'ONCOassist', '[]', 0, '2019-07-30 05:25:56', '2019-07-30 05:25:56', '2020-07-30 10:55:56'),
('8e41c95f76c779a137601b8cb039c45be720ddaac3d62abd07a7bcc52c2020792deac9babd1ad380', 1, 11, 'ONCOassist', '[]', 0, '2019-10-07 07:58:37', '2019-10-07 07:58:37', '2020-10-07 13:28:37'),
('8e67b73551c80aa5615c2771c7a3c530bc1914b2a2b2385d1a2862e60df76dae5412e8ee6cf3fc93', 1, 11, 'ONCOassist', '[]', 0, '2018-11-23 08:17:27', '2018-11-23 08:17:27', '2019-11-23 08:17:27'),
('8e898fa4f5480200ed2c9fda2bf64dcb91da74629cf40a56ffe6d7b5aa660532c86baaeb42b3936c', 1, 11, 'ONCOassist', '[]', 0, '2020-05-27 11:44:19', '2020-05-27 11:44:19', '2021-05-27 11:44:19'),
('8e8d11f158c99221119dade5d56e00442cb20f4368301e1cd9219d05c45460bfc34bff9dc319fcb5', 1, 11, 'ONCOassist', '[]', 0, '2019-11-03 23:01:02', '2019-11-03 23:01:02', '2020-11-04 04:31:02'),
('8e916b0d6dd4b897edc4fc8e14d0e8e7646276b016f765adedd73f7ead0114d982a3d8c5b71f353a', 1, 11, 'ONCOassist', '[]', 0, '2019-02-26 09:18:22', '2019-02-26 09:18:22', '2020-02-26 09:18:22'),
('8eb4b66bf832f7f7a9740ac34d16fcf87d64a8ef2c9058845fb5e8e50c09df9268f0ecb5cf2993bb', 1, 11, 'ONCOassist', '[]', 0, '2018-12-24 05:53:21', '2018-12-24 05:53:21', '2019-12-24 05:53:21'),
('8ebb0afb41b4458fe4a59a94e64e07ab7e05030a7729b229ae4c30ad7eb1bcfac7250694191ffc67', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 10:18:49', '2019-02-12 10:18:49', '2020-02-12 10:18:49'),
('8f31af9d37e301a344025ae63cc036bcc617a1d7cca77f0bb31666f08a1edb58a425df2bffa71b38', 1, 11, 'ONCOassist', '[]', 0, '2020-04-17 09:52:07', '2020-04-17 09:52:07', '2021-04-17 09:52:07'),
('8f341a422e18a259b21b540028b77a67b839bf173ead91a0564b8a3ae1919cbe102e24d932690f1c', 1, 11, 'ONCOassist', '[]', 0, '2019-06-18 07:37:52', '2019-06-18 07:37:52', '2020-06-18 13:07:52'),
('8f3ce73a53d881a50ed79f36fd492f34bb23b03309d5a816797554cc1a18aed93b15ddb1d769f166', 1, 11, 'ONCOassist', '[]', 0, '2019-11-25 00:43:54', '2019-11-25 00:43:54', '2020-11-25 06:13:54'),
('8f6bc9d1b74882f5a073f57a60b10e30f56ec5c8114041c69fb12b2354ca82c9877960f6639fd182', 1, 11, 'ONCOassist', '[]', 0, '2019-11-28 23:48:29', '2019-11-28 23:48:29', '2020-11-29 05:18:29'),
('8f88d5cc4c92bde67ff311b2b82eabf2413d9ba3a387a3aacda9485ce75331356059b31c172861c1', 1, 11, 'ONCOassist', '[]', 0, '2020-05-05 08:36:18', '2020-05-05 08:36:18', '2021-05-05 08:36:18'),
('8f8cc339e02514b774c8bb49cb58fa5137de6285c4d3b3c96cb461a80a052f6db418be997dd9aff3', 1, 11, 'ONCOassist', '[]', 0, '2018-07-27 07:07:05', '2018-07-27 07:07:05', '2019-07-27 07:07:05'),
('8fbb9acbe76031046db6177118792fddde0b6784a0127ae1044baec393a2744e8249e92267051ba1', 1, 11, 'ONCOassist', '[]', 0, '2018-08-20 11:51:52', '2018-08-20 11:51:52', '2019-08-20 11:51:52'),
('8fbff27ac5745ecd81422c400bb18ee60593c242ab207c29fde0fd33423f42900f43eb69d6f7882f', 1, 11, 'ONCOassist', '[]', 0, '2019-06-18 08:04:05', '2019-06-18 08:04:05', '2020-06-18 13:34:05'),
('8fc54417e5a7fb823a3fe2e34ac95e411d17e958f76e76c37781b90bc15e3865e50a512493b603dd', 1, 11, 'ONCOassist', '[]', 0, '2020-03-19 12:48:20', '2020-03-19 12:48:20', '2021-03-19 12:48:20'),
('902c2e1ada16a04bc6b4d783e242f844b3dbb50f46c67be30605d4d7902081ee3b1956cf8005f9e0', 1, 11, 'ONCOassist', '[]', 0, '2019-11-29 08:10:28', '2019-11-29 08:10:28', '2020-11-29 13:40:28'),
('9039b776ebd3713806ae4cb2fdf07c79f867bfc1fa14f3577bdaaae2bf4af9e4c646c8ebabc6a087', 1, 11, 'ONCOassist', '[]', 0, '2020-04-03 12:27:11', '2020-04-03 12:27:11', '2021-04-03 12:27:11'),
('90449bd7b7efbacb9b86187e37b956302b46f16e2a43560f2f627a02b36c2f11f40b7d8163064887', 1, 11, 'ONCOassist', '[]', 0, '2019-10-22 23:47:29', '2019-10-22 23:47:29', '2020-10-23 05:17:29'),
('905f402318117ca5af98632c178c9219639466d558338491581a516c51b4e3d98181ebd47d522180', 1, 11, 'ONCOassist', '[]', 0, '2019-11-14 05:47:26', '2019-11-14 05:47:26', '2020-11-14 11:17:26'),
('9090e674841f59a4534799b355fb2b63483e4aa8108ba329c8bf6ff150b4dc3dea009a12d692b81b', 1, 11, 'ONCOassist', '[]', 0, '2020-03-17 11:41:33', '2020-03-17 11:41:33', '2021-03-17 11:41:33'),
('90b252eba43456770d7c1900d15ae3d514f3e934518358e5057da808b86e6ce00a8b4575bc90d9b4', 1, 11, 'ONCOassist', '[]', 0, '2018-11-05 04:42:10', '2018-11-05 04:42:10', '2019-11-05 04:42:10'),
('90b4d8aa10c4f77c2ad8ad4f7c2036cd6c91468d5e61de98b87a0c2ba5094fc5b6bac92189eb6f08', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 05:06:13', '2018-10-30 05:06:13', '2019-10-30 05:06:13'),
('90c5386c19732dd959f744a9235574e038bcb03b695c02ff606467eaba21d1cfb244e1fa7d32907e', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 08:42:47', '2019-11-06 08:42:47', '2020-11-06 14:12:47'),
('90e65dbcb3fe042c9fb0a0b5ceb9cd41eb893b29566316f27d31857a48f129f6e48858cf8ae721ba', 1, 11, 'ONCOassist', '[]', 0, '2020-03-03 05:23:58', '2020-03-03 05:23:58', '2021-03-03 05:23:58'),
('90ec6241d7f9ea1cca2d0ffbfbcfc86c3ef5dc7bc68c9eb4f8d5dc0a5fc281a316cdebd412587a04', 1, 11, 'ONCOassist', '[]', 0, '2020-04-14 07:33:51', '2020-04-14 07:33:51', '2021-04-14 07:33:51'),
('90f3ce7acacbca88da851caa34bb5a6a9a8eab592882db681fad0f31781450813d07961a6502854a', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 09:26:29', '2019-02-12 09:26:29', '2020-02-12 09:26:29'),
('912998b2ebb644d6a9093bd4e11d3b39f949f55b2eb1cd78ef574626769f18db297df1e2aeb7d83d', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 07:09:44', '2020-01-16 07:09:44', '2021-01-16 12:39:44'),
('9145c3961504988160f98d02b13f3283a9d349a271fb405aeedad2beb86763bb6f1ab2130acca0ba', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:15:12', '2020-01-16 06:15:12', '2021-01-16 11:45:12'),
('914f8a594fcd777e1feff961208d0e9ba3ee6fbda9c6b6743c81cabba5656f2f273da371bbdf31df', 1, 11, 'ONCOassist', '[]', 0, '2019-02-14 07:50:17', '2019-02-14 07:50:17', '2020-02-14 07:50:17'),
('9158d8b5abe6fa7cff104ec6bad93821edb3d9a26e999390155a12de7276ad9686d007043ad18e2a', 1, 11, 'ONCOassist', '[]', 0, '2018-10-26 07:22:54', '2018-10-26 07:22:54', '2019-10-26 07:22:54'),
('915b11284cd986dd0bb56a7e91205182588a53f0c11e6557cb531941b1921a24b291c751794112b5', 1, 11, 'ONCOassist', '[]', 0, '2020-04-21 12:49:55', '2020-04-21 12:49:55', '2021-04-21 12:49:55'),
('917ec0bdccdd5a54c046cf072d4e52178430afe76c83372142060a47e9da05e2382d58850fe99026', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-17 01:32:47', '2020-01-17 01:32:47', '2021-01-17 07:02:47'),
('91812038dc3267a74bf53c20800b54671032a5a7be60140ee520186013d5097c73d52ee1147461ec', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 03:17:19', '2019-11-08 03:17:19', '2020-11-08 08:47:19'),
('9213ba1b5f05e12dd1aa91fef0c63202a55895a7138bd794a029396f552f424e09a26b66ef80f426', 1, 11, 'ONCOassist', '[]', 0, '2020-02-21 05:50:13', '2020-02-21 05:50:13', '2021-02-21 11:20:13'),
('9218882691175b7683b83d27cdf690bbe48544c75db138151767855ad7a367c44005f7579213e1c0', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 08:23:36', '2019-11-06 08:23:36', '2020-11-06 13:53:36'),
('9223139163ee1905d77140274ed19c1b86872778df1d09beb6ec9c788089647d367f66f6143a253b', 1, 11, 'ONCOassist', '[]', 0, '2019-03-12 09:09:22', '2019-03-12 09:09:22', '2020-03-12 09:09:22'),
('923219c0c292a6fa19a88b1e25c396dd8df80d5f42ed9e59d6d27bb31e0d629b3a1760fabf16e3e8', 1, 11, 'ONCOassist', '[]', 0, '2019-01-25 09:17:29', '2019-01-25 09:17:29', '2020-01-25 09:17:29'),
('9234505e994786afdad80f7be1eb397c965bf54b396a4b34d1390f90d59bfe09fa575634d790ca68', 1, 11, 'ONCOassist', '[]', 0, '2018-08-31 11:20:25', '2018-08-31 11:20:25', '2019-08-31 11:20:25'),
('92451e7b7653f6d6d8641712951d646d2c45c02e294690e79c6fec2c7de50052df418b5a418b6247', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 13:33:38', '2018-12-18 13:33:38', '2019-12-18 13:33:38'),
('924d8d6e0db72d3d3e65bdc0d8c418a22712b878366deb21d577d4c26bc92d8704c94bde896c0206', 1, 11, 'ONCOassist', '[]', 0, '2019-04-12 14:45:17', '2019-04-12 14:45:17', '2020-04-12 14:45:17'),
('9257d8773a18e073d7d5fde848dcfc451e0f9568788727778fc17fcebc7bde7030b2d83291ddce7b', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 06:00:39', '2019-11-08 06:00:39', '2020-11-08 11:30:39'),
('9267f2d1abffcb24a1f90bed07b4bfb305c7fbd603d1658ef249b3023a617b0d8f6759eb38b582cf', 1, 11, 'ONCOassist', '[]', 0, '2019-01-24 04:46:55', '2019-01-24 04:46:55', '2020-01-24 04:46:55'),
('927ae9d52aba35def4f52f3f38da8375ae1930dbde596c3f8936792b50739489a848be3a58446a2e', 1, 11, 'ONCOassist', '[]', 0, '2019-04-04 18:19:14', '2019-04-04 18:19:14', '2020-04-04 18:19:14'),
('92dde2c297b748941bc0884fd261c61272f6ed5d9d094ddd63a62364e93870d263f29f6882a68880', 1, 11, 'ONCOassist', '[]', 0, '2019-04-19 08:06:45', '2019-04-19 08:06:45', '2020-04-19 08:06:45'),
('931bfddcb083904c78e474104e7f6f05cc49cfdcf840bfeeee18104f565f9d9651dd03028d4c31bc', 1, 11, 'ONCOassist', '[]', 0, '2018-09-05 09:42:52', '2018-09-05 09:42:52', '2019-09-05 09:42:52'),
('932d8dddffa8f051ed5200e27c8110bd39b5ead0c293d88e472c5d509fed4b0284b3f8fdfe23ddef', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 14:55:59', '2019-02-12 14:55:59', '2020-02-12 14:55:59'),
('9366bea426357f16ddbd74d9e3cf6acc3effb453be22cb76420727624445ae8aad173915e36ef500', 1, 11, 'ONCOassist', '[]', 0, '2019-06-03 23:02:32', '2019-06-03 23:02:32', '2020-06-04 04:32:32'),
('9377bdab0ef1221f16470aa4cf7af63f0599f99670ad4bfef6a8d037bc29e7eab7012a84391c4087', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 07:32:50', '2020-01-09 07:32:50', '2021-01-09 13:02:50'),
('93b2024b26aacfb7f0fc79517988113dddf126f90bcaadbec16f2078672058dfb3d006577d99e35d', 1, 11, 'ONCOassist', '[]', 0, '2019-01-09 07:20:49', '2019-01-09 07:20:49', '2020-01-09 07:20:49'),
('93e42cc1d8e0c2a09ff0b4075c26862134b5fb391fed4699d1eef6d186c4c45fd56734eee64e1f53', 1, 11, 'ONCOassist', '[]', 0, '2019-04-10 11:57:25', '2019-04-10 11:57:25', '2020-04-10 11:57:25'),
('93f1d56254a07a59056b05366b5fe8f874eb2e69907bd844cf246fe81ff53f024582d247b116f8bb', 1, 11, 'ONCOassist', '[]', 0, '2019-09-03 23:52:41', '2019-09-03 23:52:41', '2020-09-04 05:22:41'),
('9402f2060fc4e3037876c761d9cf28d18242af5d5d67e21a48fdab4c1a848e23faf11c846de76ea5', 1, 11, 'ONCOassist', '[]', 0, '2019-01-28 07:18:54', '2019-01-28 07:18:54', '2020-01-28 07:18:54'),
('9405b600aba102152be3f6dfa34d490e4c04e5d0b155503d7a213556ae71a3765bc027e0699eb0f5', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-13 06:28:59', '2020-01-13 06:28:59', '2021-01-13 11:58:59'),
('94434d33fb378de8aa9bbf55e89cb9e304461122c54ed2153c1193cdaa6876f1400eaf34be891e6f', 1, 11, 'ONCOassist', '[]', 0, '2019-01-18 12:26:02', '2019-01-18 12:26:02', '2020-01-18 12:26:02'),
('94639bf55200ebe1c3352e7fcfef6ff82beeb24379ebd757f7475fca8626e1f1cbb0d2bb77a6a55a', 1, 11, 'ONCOassist', '[]', 0, '2020-03-20 08:17:22', '2020-03-20 08:17:22', '2021-03-20 08:17:22'),
('947da12bfc5e719325e20f0bfc5c1d426a2db74dce728e526619df150dc3fa233edc69a1bd52f57e', 1, 5, 'ONCOassist', '[]', 0, '2018-05-29 04:42:11', '2018-05-29 04:42:11', '2019-05-29 10:12:11'),
('948027e09b78fefa167531301cebf45a3a2e45783bd5477f5be3493145222f0bff00818839e6f3f8', 1, 11, 'ONCOassist', '[]', 0, '2019-01-22 07:53:50', '2019-01-22 07:53:50', '2020-01-22 07:53:50'),
('94dc9c77fb036ab80b432f0e86780352b36f79b0e8adea0b0d0172b0289d52816be0f2aa08d35778', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 03:30:13', '2020-01-09 03:30:13', '2021-01-09 09:00:13'),
('94e0b894869ac6ff6373efb00f780947ab901f3eb3728d1468e8ce8247f854d00101800409f4f9dd', 1, 11, 'ONCOassist', '[]', 0, '2020-03-20 04:30:28', '2020-03-20 04:30:28', '2021-03-20 04:30:28'),
('94e783453e6d2fbfd41a8d5f4822573b9e9a9b4fcfed42fdf8ea429471d379f23af49aeab85a501a', 1, 11, 'ONCOassist', '[]', 0, '2019-04-16 08:04:47', '2019-04-16 08:04:47', '2020-04-16 08:04:47'),
('9513e71987584411ed92824d0898ecf9cd6e296533ee1529468dc63e2d981aa3463860dfbe5b0393', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-12 23:08:21', '2020-01-12 23:08:21', '2021-01-13 04:38:21'),
('953aa632b8bb69c0dbe1b3d1c00ce080a357c1ff415be7d3a88b9b3279c9ffe7c078e8b29e0ebe20', 1, 11, 'ONCOassist', '[]', 0, '2018-07-26 14:33:07', '2018-07-26 14:33:07', '2019-07-26 14:33:07'),
('956fc5ade57f5ae23c687023ca84e2110ab4b326263f7e3a4d5756faa39d086980abac4a75f1bb45', 1, 11, 'ONCOassist', '[]', 0, '2018-09-05 04:59:22', '2018-09-05 04:59:22', '2019-09-05 04:59:22'),
('95957d537730f162e59c9e206c628f1229feb68b32a8010ccab7681a51d7eb3c5311bfa0bea51a25', 1, 11, 'ONCOassist', '[]', 0, '2019-03-28 12:06:32', '2019-03-28 12:06:32', '2020-03-28 12:06:32'),
('95a8da78993415384dcfecfc1a199b00cde9f7b0ae236d89fac9c32c38868f11292658cfde9aa0c1', 1, 11, 'ONCOassist', '[]', 0, '2019-12-13 03:42:57', '2019-12-13 03:42:57', '2020-12-13 09:12:57'),
('95b577dbf4412f7b9a005f517bbe9722eb030beac6649573635168e8759173ed1382796e4b59c920', 1, 11, 'ONCOassist', '[]', 0, '2018-12-26 11:45:45', '2018-12-26 11:45:45', '2019-12-26 11:45:45'),
('95c2ed430714e716818ef2fcdfdcb6c476ea1cd9ddfd4b249a67cf0f81911726392b7bc5fa0af4ea', 1, 11, 'ONCOassist', '[]', 0, '2020-02-27 04:59:23', '2020-02-27 04:59:23', '2021-02-27 04:59:23'),
('95f6e56c34d3fe6176e01cf01cbbe93a7404d810db49eed493f85c07abd652db81ecbc1a65016d0f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 04:56:18', '2019-11-06 04:56:18', '2020-11-06 10:26:18'),
('95f708a1f6ff7b017a9206e2c264de44f7f9027c18143011859ecf7f12eb70a72d2c5840e064ca63', 1, 9, 'ONCOassist', '[]', 0, '2018-06-16 04:52:21', '2018-06-16 04:52:21', '2019-06-16 10:22:21'),
('962ad1dcd8d4dfbd3b2f6dddcd2b8316e1c98420213abce3cd44b85c875754067d21b475975f6660', 1, 11, 'ONCOassist', '[]', 0, '2019-07-16 04:12:22', '2019-07-16 04:12:22', '2020-07-16 09:42:22'),
('96310b2cda3749c33b9a55f97ad9fbdb853653b3d7e176995998990b71b074883f9c11781b8b52d2', 1, 11, 'ONCOassist', '[]', 0, '2018-06-25 23:31:46', '2018-06-25 23:31:46', '2019-06-26 05:01:46'),
('96503546c3724c721bc60d5bdef0720f3d64060a71a5c1745d22c07bfc12f097b966f69920a5ba54', 1, 11, 'ONCOassist', '[]', 0, '2020-06-09 18:21:28', '2020-06-09 18:21:28', '2021-06-09 11:21:28'),
('96626c87230e227e832354855b18bc9b49e920cf6da4670c7775ea376ecf3d22fcdacd4e81e6a087', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-20 23:17:56', '2020-01-20 23:17:56', '2021-01-21 04:47:56'),
('96b7de16ba73356d98d32b27b52ea057f62bd4c07ed473c632b10036aef8e2c9dfcd0ff85935639d', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:14:09', '2020-01-16 02:14:09', '2021-01-16 07:44:09'),
('96c59f4c8e10958ae7a4029b3de1f8a047e1368a80cad17b0f1eb0f09e46334f531a45bd50b7b489', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:05:59', '2020-01-16 06:05:59', '2021-01-16 11:35:59'),
('96ff09fc25ea6601fe626a7dd2bf73de4407b0ba488cfbd43af15f716220a9fe409a991033378a1d', 1, 11, 'ONCOassist', '[]', 0, '2020-05-06 12:41:05', '2020-05-06 12:41:05', '2021-05-06 12:41:05'),
('977baed0a27eadf085554a2a70b36d014531696fe3dd1e3eb9fd6d74b1895e7d707e718ce5866e91', 1, 11, 'ONCOassist', '[]', 0, '2018-12-03 11:49:14', '2018-12-03 11:49:14', '2019-12-03 11:49:14'),
('97acfe54182e9a95edeef237fc81ce87e9716656ebdce9a2d007a831abe838d1ad89d99e0b74dcaf', 1, 11, 'ONCOassist', '[]', 0, '2018-10-26 12:52:40', '2018-10-26 12:52:40', '2019-10-26 12:52:40'),
('97b90cb6706a85ba63047ad7f25539800eb64bb4894656e97092e91a0c2a64e496f6fe7d8b0df70b', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 01:00:49', '2020-01-17 01:00:49', '2021-01-17 06:30:49'),
('97fba48ec06b194936dac6fc3fb9e7f983b8f7a45ed9e7260f0ab936b1a91f7b94c6a59364b6d38b', 1, 11, 'ONCOassist', '[]', 0, '2019-04-08 09:04:54', '2019-04-08 09:04:54', '2020-04-08 09:04:54'),
('98179beddd671be8703c8fb532fedd425728a7e3dd351db8745b72b4c67504fad8f35e0339756275', 1, 11, 'ONCOassist', '[]', 0, '2020-03-20 08:43:37', '2020-03-20 08:43:37', '2021-03-20 08:43:37'),
('981d40f265cfb771b249c2b91e8bb258f79e37a922fdab2d3985a80432e24b59720c81bc704b8fd9', 1, 11, 'ONCOassist', '[]', 0, '2019-02-06 06:20:15', '2019-02-06 06:20:15', '2020-02-06 06:20:15'),
('9887de6a55938dde84e9124463dd72c9293906ad9faa5464abfe524ed3e1c093aab9dc49d3a8bb9e', 1, 11, 'ONCOassist', '[]', 0, '2019-01-29 11:00:07', '2019-01-29 11:00:07', '2020-01-29 11:00:07'),
('98d59e2b3e98dbfbaa5853bfa8fd75dc3d428c7d63d572a414aa66b321d346ec3f6bddde331ffc18', 1, 11, 'ONCOassist', '[]', 0, '2019-10-30 07:08:54', '2019-10-30 07:08:54', '2020-10-30 12:38:54'),
('98dff84597306314eaf95c03d0ba7b8e629aa74d141414341cf71c6d41a23690e08f00761db56baf', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 11:08:18', '2018-12-04 11:08:18', '2019-12-04 11:08:18'),
('99712240b9617d552bcdb6d5e2a761f11ced3c97509d83d2a253f67f9a5b29b7cde5f69cf1eab024', 1, 11, 'ONCOassist', '[]', 0, '2020-04-02 10:12:19', '2020-04-02 10:12:19', '2021-04-02 10:12:19'),
('997bd91299c147598b4e07260902efcc4f1c6665646e260c29e9758fed68a95fe49f2381cff0e603', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 06:15:40', '2019-11-05 06:15:40', '2020-11-05 11:45:40'),
('99e57c4d25562d928b23967d7cbc2e60417ac3468d38f87551d979c65bb07cbb90967a892a526763', 1, 11, 'ONCOassist', '[]', 0, '2019-11-14 06:53:03', '2019-11-14 06:53:03', '2020-11-14 12:23:03'),
('99f3882a2dee0415f4313bbdac2fceadde3a6c74d21f6a3246135b266ba9592d8bcaf9b80345a950', 1, 11, 'ONCOassist', '[]', 0, '2020-04-17 11:57:39', '2020-04-17 11:57:39', '2021-04-17 11:57:39'),
('9a52972ebe1f09a463ba01f0387ce3dc34f19de10ee4768eb849ca0d6fc93a8e99d73d18db5d73dd', 1, 11, 'ONCOassist', '[]', 0, '2020-04-02 15:11:33', '2020-04-02 15:11:33', '2021-04-02 15:11:33'),
('9a581d55cf8d6eaefabce96d965341252006bf4b6f81f695da966a6bcc03406103c1d060ad84dfe2', 1, 11, 'ONCOassist', '[]', 0, '2019-03-25 09:07:20', '2019-03-25 09:07:20', '2020-03-25 09:07:20'),
('9a6396782b0e2a01974cd42088253b65e8bd9c78f06a00b7991d477cceec4630bfce2bebfb495151', 1, 11, 'ONCOassist', '[]', 0, '2019-03-13 09:16:17', '2019-03-13 09:16:17', '2020-03-13 09:16:17');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('9a66a324aa23d8b8eeb781cab69c7c202128ef19a8fd2fdb391e2a1efc108dcf4bf26702644f4c59', 1, 11, 'ONCOassist', '[]', 0, '2019-04-04 08:19:05', '2019-04-04 08:19:05', '2020-04-04 08:19:05'),
('9aa5bb31bbc530704d6d9874dbbac66227a99426c9974873304069b638a5e2d4a10c3b596771e384', 1, 11, 'ONCOassist', '[]', 0, '2018-12-07 15:20:41', '2018-12-07 15:20:41', '2019-12-07 15:20:41'),
('9adbcb368a31ab435314976fd626acad4a5f4ed90f4924f522745ac21dcdde8aec21e13550f1dd23', 1, 11, 'ONCOassist', '[]', 0, '2019-05-13 08:15:30', '2019-05-13 08:15:30', '2020-05-13 08:15:30'),
('9afcd9d19a34f39a237973de564ed9671a51e0b7cbdf217a5bdf891743cf9776b4164d9ef4d9fbe4', 1, 11, 'ONCOassist', '[]', 0, '2019-05-15 23:21:04', '2019-05-15 23:21:04', '2020-05-16 04:51:04'),
('9b853a7a12adf3283b149bb8e66940e03e98c07210ff6b9c75ff77f38409b12148e0a948da1032ba', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 03:00:35', '2019-11-07 03:00:35', '2020-11-07 08:30:35'),
('9bae6dfcfda00459c25004a84bf67f7c91cd1bd0764d27316ccd451ef100ef215991705df9bc6dcb', 1, 11, 'ONCOassist', '[]', 0, '2018-12-19 07:13:04', '2018-12-19 07:13:04', '2019-12-19 07:13:04'),
('9bfad407843100f569178d2b7b4df7037f8ddfb215c61828a82e9fe3994a33f1604774fef2b4f765', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-10 07:10:08', '2020-01-10 07:10:08', '2021-01-10 12:40:08'),
('9c57a74ba724a2cf9f0eb70cc69f02debc88e963dbc4ae726d6874a8f1fbf78fe97a8f78b23396ec', 1, 11, 'ONCOassist', '[]', 0, '2020-02-21 03:28:39', '2020-02-21 03:28:39', '2021-02-21 08:58:39'),
('9c7f0adb0229efbaea014a0f077477561de265e6e729540ce7311c53f4b1b81501f8244e2606ba32', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 05:58:27', '2019-11-08 05:58:27', '2020-11-08 11:28:27'),
('9c8704d3a61248b6c88a35ae8b5bf14f0ea859117b4d432089edcaabfe41b6ef680ea6e67e464941', 1, 11, 'ONCOassist', '[]', 0, '2020-05-01 05:40:58', '2020-05-01 05:40:58', '2021-05-01 05:40:58'),
('9cce38c3c1ab16cb3928b77d443cc2c34706bf4ef3bda278c8a62b0077c1e6f6f285128e3beb30b1', 1, 11, 'ONCOassist', '[]', 0, '2018-06-28 13:27:54', '2018-06-28 13:27:54', '2019-06-28 06:27:54'),
('9ced2b83517c4385514e217f37398f23c9cbbeef9729ad41a9417483df0f89a5806cf902e87c7f1a', 1, 11, 'ONCOassist', '[]', 0, '2019-03-13 09:17:12', '2019-03-13 09:17:12', '2020-03-13 09:17:12'),
('9d310faa76c902258b693a6f47fafa33a397e1df53096ceb55fcdc679892ecbbf851c05653acf199', 1, 11, 'ONCOassist', '[]', 0, '2020-03-05 11:04:29', '2020-03-05 11:04:29', '2021-03-05 11:04:29'),
('9d3c2d1982cbaa17f95e3788c0ce38f45d0cc4ae3244090b46edc30b10841fe0c53a0262531f8c2c', 1, 11, 'ONCOassist', '[]', 0, '2019-11-11 05:19:09', '2019-11-11 05:19:09', '2020-11-11 10:49:09'),
('9d95ca97efa288df890906fefa8179bf9ed008c718a62de72fe65397559afed2c397225487d8bf71', 1, 11, 'ONCOassist', '[]', 0, '2018-12-19 04:34:40', '2018-12-19 04:34:40', '2019-12-19 04:34:40'),
('9d973161b422e8ed751d55bfa1191519b1cc63ebc5670f0734276035d2062104615fc5d217f4e2b8', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 08:11:47', '2019-05-09 08:11:47', '2020-05-09 08:11:47'),
('9dc7eb2bf56c6c95382e0cb5143d550b93ef291f226017bfb0bc95e284253a194b00df031d52d9d5', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 02:47:29', '2020-01-15 02:47:29', '2021-01-15 08:17:29'),
('9de0bef0cd50833f7312dd02042559847ca5b5f7a87b82b4ff6500c392be4666719d7e79a88abfbe', 1, 11, 'ONCOassist', '[]', 0, '2018-11-28 09:43:48', '2018-11-28 09:43:48', '2019-11-28 09:43:48'),
('9de80fed0572ea94193308a76bfe86050951c639f9ec7a06599794c3ad90c1b53b9d2b5e27221873', 1, 11, 'ONCOassist', '[]', 0, '2019-07-01 02:13:05', '2019-07-01 02:13:05', '2020-07-01 07:43:05'),
('9e38515f1922a45eb77702e82f8504b017b61dd19aa75923c2a31edecde10c2388aee16b9d0a1891', 1, 11, 'ONCOassist', '[]', 0, '2019-02-14 14:10:16', '2019-02-14 14:10:16', '2020-02-14 14:10:16'),
('9e3c9ac8ddb9e2c5e49fcd50b1f1913afca70cdda6880abc4897cabb7b99d7c43fd1d38ba4e8a5f3', 1, 11, 'ONCOassist', '[]', 0, '2018-09-13 17:54:44', '2018-09-13 17:54:44', '2019-09-13 10:54:44'),
('9e4a669ae12160aba9316b1cc2ac7c00342a218223093ea948f276d8a0179f1b120de3ac3d29ba2d', 1, 11, 'ONCOassist', '[]', 0, '2019-04-21 13:46:08', '2019-04-21 13:46:08', '2020-04-21 13:46:08'),
('9ec5038d0e226deec03e02a6cf864f7fd742dc1213f8a06f9370f60bcffc0a45cc4d04acb929b296', 1, 11, 'ONCOassist', '[]', 0, '2019-11-20 22:57:34', '2019-11-20 22:57:34', '2020-11-21 04:27:34'),
('9eca932dca2ff1659142e1db15adb353ba0a353a9437bbb8e1179d59da5acb5b9fc8537dfcd1e34e', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 10:12:14', '2019-05-09 10:12:14', '2020-05-09 10:12:14'),
('9f02fd83e03d1c3a328753a30f07cc1dd30b14088e5276615ce864ee55d7214a45fc70327e441bf6', 1, 11, 'ONCOassist', '[]', 0, '2019-10-10 05:25:27', '2019-10-10 05:25:27', '2020-10-10 10:55:27'),
('9f056a0891400354aa3b3c2f69acfccb251144aeeebed20e897920e8afa643e1b7188882566664ac', 1, 11, 'ONCOassist', '[]', 0, '2020-04-02 10:09:22', '2020-04-02 10:09:22', '2021-04-02 10:09:22'),
('9f323fcbb0502c3b0feecf3b279aac8e4e00ddd5b632eef955ef7375f6693eda1358729bd140b0f9', 1, 11, 'ONCOassist', '[]', 0, '2019-10-29 23:59:16', '2019-10-29 23:59:16', '2020-10-30 05:29:16'),
('9f6cc0a67c4c5a0505cef3235810d9f0a71a05a9bfafc1d3509b76d80e4076e2744275c3e689b189', 1, 11, 'ONCOassist', '[]', 0, '2018-11-23 12:17:46', '2018-11-23 12:17:46', '2019-11-23 12:17:46'),
('9fa69fa6c67a692fb6e6fbfca06bbcf49d4d7bf9d6b8f3219c82abe791e9fc873c54ad947609e769', 1, 11, 'ONCOassist', '[]', 0, '2020-03-26 06:39:28', '2020-03-26 06:39:28', '2021-03-26 06:39:28'),
('a041f2127a502d41f4186af30a791ef086b53e77ff19fb1feef9bf80510a68bc2836085f0642cff9', 1, 11, 'ONCOassist', '[]', 0, '2020-04-06 08:17:37', '2020-04-06 08:17:37', '2021-04-06 08:17:37'),
('a047dadc0c1c07a8faa3e1d197fc951c6044d780107a3891e4043627e21a70f07652d0690e59e7d7', 1, 11, 'ONCOassist', '[]', 0, '2018-07-24 07:29:38', '2018-07-24 07:29:38', '2019-07-24 07:29:38'),
('a04c19feda75c3d7b296fe4632b0d2909406c03b62dbe02e7d13e177b8feaefac60851c5541b97f1', 1, 11, 'ONCOassist', '[]', 0, '2019-09-03 23:51:36', '2019-09-03 23:51:36', '2020-09-04 05:21:36'),
('a04cb944aa5c3d40812a1f46806f2383266b090a4380e7c86a30900994d4990a97cc181203a1d8a6', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 04:58:15', '2018-10-30 04:58:15', '2019-10-30 04:58:15'),
('a0859455df20101b80c16e06dc68405ce7de8cc8d3b0dcb48b59df86496cd492c500e2abf6cf4c6e', 1, 11, 'ONCOassist', '[]', 0, '2020-04-17 09:52:04', '2020-04-17 09:52:04', '2021-04-17 09:52:04'),
('a0b100c54a07a7bf93e55c7b50dfffa9e50ebfad14850b27c35b9a1046b0c1551d11970dc28bd555', 1, 11, 'ONCOassist', '[]', 0, '2019-11-19 05:27:25', '2019-11-19 05:27:25', '2020-11-19 10:57:25'),
('a0c36d26679160ae7264fb7d8abed61935f02375d6f0b1d4dbfcba5b1e510011b0fc8a82e0e93433', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 04:16:15', '2019-11-04 04:16:15', '2020-11-04 09:46:15'),
('a0cd20c5901d14c69d96fee5e6f010734226352001a9f8c8bc370ac30a33790a0f927ac23e7fbb0d', 1, 11, 'ONCOassist', '[]', 0, '2019-05-15 23:04:29', '2019-05-15 23:04:29', '2020-05-16 04:34:29'),
('a0d7e69ff653f5adf2eeebb5321070aa68fe1f053d4742359e2715549fc8f35af54ab4ac5a5d068f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-19 01:56:45', '2019-11-19 01:56:45', '2020-11-19 07:26:45'),
('a0e1e1a401ea01e19b382cabb84998606d5a8b07407463984ca788fee4aaf35620b10249ee569e00', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 23:44:57', '2019-11-07 23:44:57', '2020-11-08 05:14:57'),
('a0e471e0889604631a40592995770e67e903574a5ba733a6bd5e596fda6ddcbb92b1fff4a2724e43', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:56:54', '2020-01-16 02:56:54', '2021-01-16 08:26:54'),
('a11783b4c07277f0bacee4b098167939012da864a0014596693151ce8e9dce1b5a75de31e3775aa4', 1, 11, 'ONCOassist', '[]', 0, '2018-08-31 11:22:40', '2018-08-31 11:22:40', '2019-08-31 11:22:40'),
('a128986f1e78a38ecf30360f8c02e540ab8d9353dc6af2758134c6becf6984fdfe9abaf42a7b96a3', 1, 11, 'ONCOassist', '[]', 0, '2019-04-02 05:52:31', '2019-04-02 05:52:31', '2020-04-02 05:52:31'),
('a18ca29298144e48283c3354135565d5109d08071a59eb7ad2788da9bc91fb4d45a80d9e94c0f30a', 1, 11, 'ONCOassist', '[]', 0, '2020-03-17 12:39:55', '2020-03-17 12:39:55', '2021-03-17 12:39:55'),
('a1dae51b2c212f50752f426071a4a5aeb181dfaf966824fa681e90ff61f116096236ded5133d3257', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 03:11:33', '2019-11-05 03:11:33', '2020-11-05 08:41:33'),
('a1f25558100e8abde8277fcf6381bdd2e8c9ae75fd1172273a966ff0404e42a0fa2baa0302c5f2c0', 1, 11, 'ONCOassist', '[]', 0, '2019-06-07 05:16:46', '2019-06-07 05:16:46', '2020-06-07 10:46:46'),
('a26e687f7c1e1178dc2b8c926781bffbdf29a7d6bee7e95c0f7964ffffdfe0c4ffb54550c4a54722', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 09:24:19', '2019-02-13 09:24:19', '2020-02-13 09:24:19'),
('a283e5a0e2336dc0b28025522aec50fa87fba2e10d1dc7af9815de1d8170c8bcae5be8a53653ff0e', 1, 11, 'ONCOassist', '[]', 0, '2019-04-01 19:42:35', '2019-04-01 19:42:35', '2020-04-01 19:42:35'),
('a2a10b49b4c3d87e264691c4c9b4d3d21c183e11ff73e62d9bd3cc62fb1eb1053143b98a10eb5112', 1, 11, 'ONCOassist', '[]', 0, '2019-11-14 06:47:44', '2019-11-14 06:47:44', '2020-11-14 12:17:44'),
('a2b50090a97f474f2e6a8d4349e161f8c36b0b507649bffaac4ed6cda8fcd4f52aaa28ad46709863', 1, 11, 'ONCOassist', '[]', 0, '2018-08-14 11:34:22', '2018-08-14 11:34:22', '2019-08-14 11:34:22'),
('a320acdfc9df45f3a50b63275c2880483237e56d3a57b9cfd0d7b49c52ff337edaa57b005c17b4b3', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 06:52:35', '2019-11-06 06:52:35', '2020-11-06 12:22:35'),
('a33579edfd9f1276cd37975fa357845432bd58dbfcf4970cf473a02787cb768fc19353d4b0195426', 1, 11, 'ONCOassist', '[]', 0, '2018-07-27 08:45:20', '2018-07-27 08:45:20', '2019-07-27 08:45:20'),
('a33c422af8c35c51e7cb643bd1ef1575b3d26adbdc6a6a4cb8c7c061179f18f8327e7bbe15e9585d', 1, 11, 'ONCOassist', '[]', 0, '2020-04-02 13:57:56', '2020-04-02 13:57:56', '2021-04-02 13:57:56'),
('a36d7d0822a4d099b3d66dd9824aa7b2a56d3b48112c3236975689f478d66328d0c241d76ed49d01', 1, 11, 'ONCOassist', '[]', 0, '2019-02-25 09:10:15', '2019-02-25 09:10:15', '2020-02-25 09:10:15'),
('a37095fadb58902145a6a1d52c9eb18b0186edc9b90e627677bd0481a3b0e5e8960ab9b94c6de1e3', 1, 11, 'ONCOassist', '[]', 0, '2019-05-15 08:03:05', '2019-05-15 08:03:05', '2020-05-15 08:03:05'),
('a3a887c80c07c59399c4ab1172aa212e837454d376c36eca5760cefc069eab4db48170123f800dce', 1, 11, 'ONCOassist', '[]', 0, '2018-06-29 21:04:22', '2018-06-29 21:04:22', '2019-06-29 14:04:22'),
('a3dc475cdf93566ebd51838312705240507eb5acc96bc496e44fafc6918fc8ab0d1a64cb94953a92', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 06:43:34', '2019-11-22 06:43:34', '2020-11-22 12:13:34'),
('a3ee765a0f6713670a3a391532ec64482b6358f2ea2932774678557dbbb526d50660c795a7a6d36c', 1, 11, 'ONCOassist', '[]', 0, '2019-03-07 09:14:50', '2019-03-07 09:14:50', '2020-03-07 09:14:50'),
('a3f564b4c7f5aa0a713011fdd27f0a6d08f0b5ddbaa20238a7ef4555a1da074a944eb1d9a86fca81', 1, 11, 'ONCOassist', '[]', 0, '2020-04-02 07:43:14', '2020-04-02 07:43:14', '2021-04-02 07:43:14'),
('a41afaa97f2d847a3929722d14c9dfe797bb9e7b7b0e585e83bd01d51e772184e74a59ae9726fa06', 1, 11, 'ONCOassist', '[]', 0, '2020-04-17 09:46:13', '2020-04-17 09:46:13', '2021-04-17 09:46:13'),
('a43f36f98edcaf690ea13c7ed13db08fd9fa783478ebd55a98fb9b56397d2b084afd57d929f1adff', 1, 11, 'ONCOassist', '[]', 0, '2019-11-25 23:58:44', '2019-11-25 23:58:44', '2020-11-26 05:28:44'),
('a485a0ebdfb49795a42b5f7feed36ec9f75d53296f7ff28f50267c5921f8a582689ffc1869b8ade1', 1, 11, 'ONCOassist', '[]', 0, '2019-04-30 14:58:16', '2019-04-30 14:58:16', '2020-04-30 14:58:16'),
('a4b16db0a651d737e2e6db966a1522d35cb8f0e961a9cd3922fcc5223ede8db1db645e7cfb7431b0', 1, 11, 'ONCOassist', '[]', 0, '2019-02-15 13:00:18', '2019-02-15 13:00:18', '2020-02-15 13:00:18'),
('a57a85203271d264694c10796fca02136bb9a6361bc6ef7fc1c96d3fb4016c4a4c3146ba0c9a64d2', 1, 11, 'ONCOassist', '[]', 0, '2019-06-28 03:54:18', '2019-06-28 03:54:18', '2020-06-28 09:24:18'),
('a5cf6ad8b1f271fe5980ef2913b1fe6a6e73f19ffa193995232b28a88d282931ac097a7db0e52dee', 1, 11, 'ONCOassist', '[]', 0, '2020-03-11 13:55:38', '2020-03-11 13:55:38', '2021-03-11 13:55:38'),
('a5d8be9c1429d0169be44e0ca492633c864c2fc4d45f5b686f4da5b9a791ac9328a968c01f45ed44', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 03:19:20', '2020-01-09 03:19:20', '2021-01-09 08:49:20'),
('a5e1ffb57d07c4f998c6de56c152a29a16fd965777e84f6e72132e8c464809301b2c3c82d2850c43', 1, 11, 'ONCOassist', '[]', 0, '2019-07-26 00:13:31', '2019-07-26 00:13:31', '2020-07-26 05:43:31'),
('a60d5e00e6e218363486c9ad1cbd5cf537aac4babf23f0e2e2905748e3848215d3120e01d020c8a6', 1, 11, 'ONCOassist', '[]', 0, '2020-04-02 07:44:07', '2020-04-02 07:44:07', '2021-04-02 07:44:07'),
('a60e8fd6d3694ffeb54401b127ff7dfc589a8e956271dc26f91e39243307d2353397f6058d8377ab', 1, 11, 'ONCOassist', '[]', 0, '2019-06-10 23:40:36', '2019-06-10 23:40:36', '2020-06-11 05:10:36'),
('a633b0bafb6f631c66cc829cc02207f3c55a00a033180f45fbe48bbc3a97afd3ce4d028c2008b4b3', 1, 11, 'ONCOassist', '[]', 0, '2018-10-05 10:47:25', '2018-10-05 10:47:25', '2019-10-05 10:47:25'),
('a6553638e9ad841a912921fb849af2e3fb00c49ddf0e260212ede0911f6f07316dfcac7b500b9fb3', 1, 11, 'ONCOassist', '[]', 0, '2019-04-17 08:14:44', '2019-04-17 08:14:44', '2020-04-17 08:14:44'),
('a65935692377a19af1712815f3fc4370b81981b4aebacf7c724f5479101a1d1b007b0922c698d719', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 11:57:44', '2018-10-29 11:57:44', '2019-10-29 11:57:44'),
('a67fe6ac3ae1aba0fc335dd79649ede4b5d38c60f15510a5903a9ef7f70b5067acb7a1a30f584dde', 1, 11, 'ONCOassist', '[]', 0, '2019-01-25 09:29:55', '2019-01-25 09:29:55', '2020-01-25 09:29:55'),
('a682742a3784a1b92ad62ee933d66f5f9ca7b32671aacb72954c04006b4ecfe1d66c6e6079f6e3ff', 1, 11, 'ONCOassist', '[]', 0, '2019-11-18 01:09:31', '2019-11-18 01:09:31', '2020-11-18 06:39:31'),
('a68884eee0d8e308e46b6504fd6a4c2d8b0b8bfaf60261d3315298fd735455a58106c65ae1adea53', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 01:31:19', '2019-11-06 01:31:19', '2020-11-06 07:01:19'),
('a6b451a4222b095ebc451015034e14a9a92d82536004adaf06aed1d8813465f208443febd1de5280', 1, 11, 'ONCOassist', '[]', 0, '2019-03-08 16:39:48', '2019-03-08 16:39:48', '2020-03-08 16:39:48'),
('a6ca7802ea3458267dc668e62251a15d89da11f03fbde32d29860fe08fbe6e149cf1cf3e5e0ebdd8', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:27:34', '2018-06-18 00:27:34', '2019-06-18 05:57:34'),
('a6efefcaebef3ccc7ebcd04175a5a46a8afce457ad3757de9077587b81e7ae46e5080c2bda6e694f', 1, 11, 'ONCOassist', '[]', 0, '2019-04-04 16:00:56', '2019-04-04 16:00:56', '2020-04-04 16:00:56'),
('a7151dbebba2c85837dbef57dadcd50dfe26bd39cbca29c3f855f29c3ee636eadd159bbb6849b81d', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:11:12', '2020-01-15 03:11:12', '2021-01-15 08:41:12'),
('a71982483264b02fc40eb5dae6beb2cd33d973ac2245befb74891b2d3d99b462a657c7200f33be97', 1, 11, 'ONCOassist', '[]', 0, '2019-01-03 09:46:17', '2019-01-03 09:46:17', '2020-01-03 09:46:17'),
('a73c58065bbe6ae2ccaeee664c86a716995f1c86a2983faead6fd649256a515d098882fdb32c45d5', 1, 11, 'ONCOassist', '[]', 0, '2019-04-16 15:08:55', '2019-04-16 15:08:55', '2020-04-16 15:08:55'),
('a7459ebb3def60e6959fc4acb26e3c39f8538245ac282351cf1da542d64d788fda5eae2df38acdcb', 1, 11, 'ONCOassist', '[]', 0, '2019-01-28 10:09:17', '2019-01-28 10:09:17', '2020-01-28 10:09:17'),
('a75d1e9f6bce7be421684b6ee34de72ca1123b14b34193ec605f4ba1f7690b46ef4d8b45f54de0b8', 1, 11, 'ONCOassist', '[]', 0, '2019-04-03 16:30:54', '2019-04-03 16:30:54', '2020-04-03 16:30:54'),
('a75fbd039ce5e7ae8d61e14f1ce2768a3ddd123854087dc339a44d2ec56bbe611d67e1a614445549', 1, 11, 'ONCOassist', '[]', 0, '2018-09-05 11:51:58', '2018-09-05 11:51:58', '2019-09-05 11:51:58'),
('a81518aaf9cde315e408818c98aa12c83d9b6f39ce04b37f376f1bc30f3f485ba5d855279f5ae8ba', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 00:50:01', '2019-11-04 00:50:01', '2020-11-04 06:20:01'),
('a81b17a67c471eefac9a6c7f1242677cce22e43d4f2502cf9bf8ce02b88e08f0e1f97fdec781aadf', 1, 11, 'ONCOassist', '[]', 0, '2019-11-18 01:52:17', '2019-11-18 01:52:17', '2020-11-18 07:22:17'),
('a82f7664b21769f9b1ebfb5c21bc4796a2fc1fec3241a079822fb2216a3c02558afc221e2d2a2442', 1, 11, 'ONCOassist', '[]', 0, '2020-03-26 07:34:31', '2020-03-26 07:34:31', '2021-03-26 07:34:31'),
('a85652d43307f89bfbcc240ccc1daa3d8469b7760e3b18f6451dfbae73e4d5474ec458ad92e0eef2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 00:48:25', '2019-11-05 00:48:25', '2020-11-05 06:18:25'),
('a861d93f2b42f10405feaf3f01ed0dcdb2e568b876a89f728a05c907bd240193ac91b22ebee00312', 1, 11, 'ONCOassist', '[]', 0, '2018-06-25 03:20:46', '2018-06-25 03:20:46', '2019-06-25 08:50:46'),
('a893b405f16b0bd267db41c86a1375c78d141090daa65500ca8e7e9a9ea6ed011f44e9170fa74582', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 01:29:29', '2019-11-06 01:29:29', '2020-11-06 06:59:29'),
('a8a41f0aa75aee92e66ce609a5880d0ea8ba057721cb9fb859b761a732c62825f4889e014b29a519', 1, 11, 'ONCOassist', '[]', 0, '2018-08-31 11:49:20', '2018-08-31 11:49:20', '2019-08-31 11:49:20'),
('a8ab03cce2be0e165ecda0229c46ca714830314b8a04a311353d4e9e385ce1feedd4c85bd261f804', 1, 11, 'ONCOassist', '[]', 0, '2019-07-02 00:20:26', '2019-07-02 00:20:26', '2020-07-02 05:50:26'),
('a8b371459e9f33a79fb5ada55cdd0d0b6285f2b3cc0c25c761ae4e326392c6c6a2fa30382c8b346f', 1, 11, 'ONCOassist', '[]', 0, '2018-12-01 06:18:00', '2018-12-01 06:18:00', '2019-12-01 06:18:00'),
('a8c66398527d49a9c6cff53026580ff3383cd36740030f290703dfb229e274f0c55bff60e81b715a', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 03:42:24', '2020-01-09 03:42:24', '2021-01-09 09:12:24'),
('a8d18d11af6c1dad9cc2ebc150b5ccc1a2f15c042d3f4afec9766b53c8a5998c8dd8d34f661ead11', 1, 11, 'ONCOassist', '[]', 0, '2019-11-11 23:00:40', '2019-11-11 23:00:40', '2020-11-12 04:30:40'),
('a8f08df65f17d2caa3d6fcd49bebffe7cad5a44199c805a23f855df5101921e5ff0531207c5ca7dc', 1, 11, 'ONCOassist', '[]', 0, '2018-12-10 09:48:05', '2018-12-10 09:48:05', '2019-12-10 09:48:05'),
('a8f7fbc43f87f525b3095458300f253f6d0895d5566ab5d853c9327ea8d5eebbb90ef395102ab543', 1, 11, 'ONCOassist', '[]', 0, '2019-01-31 18:14:24', '2019-01-31 18:14:24', '2020-01-31 18:14:24'),
('a92f3892a449aab1f3d96d4828b9623ecdb2af615a8b7e713e1f15a6922554a73b0e6a25e3594efd', 1, 11, 'ONCOassist', '[]', 0, '2019-03-26 15:39:22', '2019-03-26 15:39:22', '2020-03-26 15:39:22'),
('a94ad4f66e00124a5b36623b883dd31c2c8c96cf9849d89eb7b73dc39a9bf9d112e8ec4245300c24', 1, 11, 'ONCOassist', '[]', 0, '2019-01-16 11:44:08', '2019-01-16 11:44:08', '2020-01-16 11:44:08'),
('a9ca1ca8797b60c649582c531c6dc6c5605820e32a1e1de1a66ead2c8d8fddb36f93c812eeaa6f72', 1, 11, 'ONCOassist', '[]', 0, '2019-04-02 15:10:54', '2019-04-02 15:10:54', '2020-04-02 15:10:54'),
('a9dc9e8473785000128099d90be607feec85e91efb1f47619f7635a4837b9a976c908155ec9f8d0d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-26 00:39:16', '2019-11-26 00:39:16', '2020-11-26 06:09:16'),
('a9edc6cebc0c8189efcf833007deba1103de5f63f9f18f885ee40f7e2eee96fa1671cc15fdd8626d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 08:21:59', '2019-11-07 08:21:59', '2020-11-07 13:51:59'),
('aa541ca7ff16bdd26b7407ecd0ff129a44f720b09e54771f01700a40256dc1d93d12a23f72bbeb38', 1, 11, 'ONCOassist', '[]', 0, '2019-04-23 12:46:09', '2019-04-23 12:46:09', '2020-04-23 12:46:09'),
('aa5dd8e9fe9ea40eadbfac065be63238dbd2b822df84c9fccdc7f3ce3a2ff3baf38570bfb225682b', 1, 11, 'ONCOassist', '[]', 0, '2019-01-17 09:24:45', '2019-01-17 09:24:45', '2020-01-17 09:24:45'),
('aa9f29fc8e8f51958334ad879003086739f6b34fc7a5f15064b35b908d4ff598aeb4c7ef65509fa4', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 14:46:44', '2018-12-18 14:46:44', '2019-12-18 14:46:44'),
('aaa537376e43700ec4329d7de4e17065fb43e0f9111ced8ccb607dacbb732df7f1bcb9b47b5747ca', 1, 11, 'ONCOassist', '[]', 0, '2019-01-29 05:21:42', '2019-01-29 05:21:42', '2020-01-29 05:21:42'),
('aab81ec00bb2000bf523f0a9e3ba8313ffa7f53e822d96b2a749faf1a097e63a3d3d6dd911a43a50', 1, 11, 'ONCOassist', '[]', 0, '2018-08-20 11:55:35', '2018-08-20 11:55:35', '2019-08-20 11:55:35'),
('aae233fbf4bcc0ba413886e7c6cc830c51dec4f667546c0f68fb872e37c7e0e6e8093712001faecc', 1, 11, 'ONCOassist', '[]', 0, '2019-04-18 17:47:19', '2019-04-18 17:47:19', '2020-04-18 17:47:19'),
('aaf531abeb1a264b025734dbab578e2ad4ee85ce986aa7362791d853c892852ae69f136c45e5fea3', 1, 5, 'ONCOassist', '[]', 0, '2018-06-15 22:28:06', '2018-06-15 22:28:06', '2019-06-16 03:58:06'),
('ab156cab639ba2d2eb34e952ad16081f6a9e3b75f5b667cca5596f56b98374ace100332ca769ec9a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-12 00:07:59', '2019-11-12 00:07:59', '2020-11-12 05:37:59'),
('ab28bbe6e89d4d5df499a6edf966650efec5095507bc05fec8bcbc15e0f2fb93df0fb26015f4b48c', 1, 11, 'ONCOassist', '[]', 0, '2019-02-21 17:39:38', '2019-02-21 17:39:38', '2020-02-21 17:39:38'),
('ab3b7cfa8760f609db5ec87513685206f98057ec96548d407e246a81a9aa189153563894a1c1a12c', 1, 11, 'ONCOassist', '[]', 0, '2019-04-08 05:31:22', '2019-04-08 05:31:22', '2020-04-08 05:31:22'),
('ab3d29c10050f310d47ffa1aaba875aa4786ced625b98cc3d5e6840e2edf20f9a445113ed84ee2fc', 1, 11, 'ONCOassist', '[]', 0, '2019-05-15 08:32:38', '2019-05-15 08:32:38', '2020-05-15 14:02:38'),
('ab406d163469e810d99126aebe535efc4c6b958a6a028c7c4186254466ec3084ca4e86cfeb839be8', 1, 11, 'ONCOassist', '[]', 0, '2020-01-02 04:52:10', '2020-01-02 04:52:10', '2021-01-02 10:22:10'),
('ab4cc057efeaafc3317889bed3540288b2d4d2acb896b440f4db17c63c82b6b96e804d50a84dd130', 1, 11, 'ONCOassist', '[]', 0, '2019-01-03 07:40:19', '2019-01-03 07:40:19', '2020-01-03 07:40:19'),
('ab6d917892bad0e88b8a50233ad3a0c4a5358462e7821dbaf5b866975cee6280f00d3d55248c841c', 1, 11, 'ONCOassist', '[]', 0, '2019-05-01 14:51:42', '2019-05-01 14:51:42', '2020-05-01 14:51:42'),
('abc0b78a3095221623442c59332dcd0c51be24508c94b6795970d8448c021c92a6ce7eaf2417ed08', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 06:40:36', '2020-01-15 06:40:36', '2021-01-15 12:10:36'),
('abf1394c315b8b9e23db3af19a3a1ca6da9f8122b66085662933dc84d9523ad1cd9068c8d3ac4169', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 00:16:09', '2020-01-15 00:16:09', '2021-01-15 05:46:09'),
('ac16f8dd58aef8fb242144653afd32fe068b03148c45cf72929c5cce2a021df0f113067862ee3a27', 1, 11, 'ONCOassist', '[]', 0, '2019-11-08 07:28:53', '2019-11-08 07:28:53', '2020-11-08 12:58:53'),
('ac4605b398cb04da761dd75be80e77cdeabca0945c9b14b5d409408110a71f0d4f3bd1c178391ff9', 1, 11, 'ONCOassist', '[]', 0, '2019-04-10 20:44:40', '2019-04-10 20:44:40', '2020-04-10 20:44:40'),
('ac52713be892720fb3a44ee24b94725e4c09dd3bc3e572720865c02436f793b07734db6c5776019d', 1, 11, 'ONCOassist', '[]', 0, '2020-03-19 08:25:15', '2020-03-19 08:25:15', '2021-03-19 08:25:15'),
('aca2dbf4ea04b76dd6de73f689d6fe90f8d237250c99f5caf39bfbece5f476951641333e86cd8193', 1, 11, 'ONCOassist', '[]', 0, '2018-10-12 06:25:19', '2018-10-12 06:25:19', '2019-10-12 06:25:19'),
('acb2e55e9c338827f38de2229347695ec57786a9632cb38c2a4928578f7c444dbf2311db81514fc0', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:03:42', '2020-01-16 06:03:42', '2021-01-16 11:33:42'),
('ad19a0c537a86db4b3831ee59acd80d21aa619a92808f085e6fb7205ae9a734e2b346efd3e362bb4', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 06:42:05', '2020-01-15 06:42:05', '2021-01-15 12:12:05'),
('ad2c861c6d75fe9c2d1171513ab51fda5ee08c8abd82ad04a2649c78ca56c3b6d09698eb2e39690f', 1, 9, 'ONCOassist', '[]', 0, '2018-06-16 05:26:05', '2018-06-16 05:26:05', '2019-06-16 10:56:05'),
('ad8b7c84d7ac437d1e021ec06274b29a8942d029fbcb23670ddbe0c61bf802361f0eaccc66629f89', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 07:10:45', '2018-12-18 07:10:45', '2019-12-18 07:10:45'),
('ad9a1f0b5e37564a58bb597a03449ac8043803ef4b869e26d0722778caf5ce8aa07d4f2ea29ee7ba', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 09:20:31', '2018-12-04 09:20:31', '2019-12-04 09:20:31'),
('ad9efc9a4f738c723da372324528f10297cd9522261c876e5b0d61a1e1a7b46188b16b05058dc296', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 11:38:02', '2020-04-20 11:38:02', '2021-04-20 11:38:02'),
('adbcdf30efd2b05b0dc3a77a792d82b91ca5b4f81b9da000bfaf4ea7dc15a62672030b687bb20afa', 1, 11, 'ONCOassist', '[]', 0, '2019-11-27 23:35:09', '2019-11-27 23:35:09', '2020-11-28 05:05:09'),
('adcbf0f67f6e867e31d6d88321fc6f18298f409bebe3292010b151c0a50f2a0b7ccbd298a3dc7359', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 04:56:21', '2018-12-18 04:56:21', '2019-12-18 04:56:21'),
('ae0b23d3599b1236aaf016e3ee360461e0b58d770f4ce7b748ee9024ad0474efe45b8a24f9b4d235', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 04:30:58', '2018-10-30 04:30:58', '2019-10-30 04:30:58'),
('ae1b3587cb6865b89b0b3a26a0b28fa94ce70b0c58a565b117b60f1ff7b9a4e27312b5f3eb4c00a4', 1, 9, 'ONCOassist', '[]', 0, '2018-06-16 03:16:01', '2018-06-16 03:16:01', '2019-06-16 08:46:01'),
('ae1d124a4dbbce1b8bc890a40d154aefcd5abc5146089af9a90daeb7f6cd5770ab79e492e1678376', 1, 11, 'ONCOassist', '[]', 0, '2019-04-09 15:14:08', '2019-04-09 15:14:08', '2020-04-09 15:14:08'),
('ae31a8f363b93a233693d46b4b85af20ca93795d33e2cc6e925a23f20492d47ea124cb27bcedd9e7', 1, 11, 'ONCOassist', '[]', 0, '2019-11-24 23:44:03', '2019-11-24 23:44:03', '2020-11-25 05:14:03'),
('ae62def27a4dfc592c86631d46d817155693153070e5b499075c2b5a08cc38e802fa2b1cadae9f65', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 09:50:01', '2018-12-04 09:50:01', '2019-12-04 09:50:01'),
('ae8833d242b8c934d50e0d55aef886d77796b25696e348fafefad3241fc7c1e10c02ba1e2ede1dca', 1, 11, 'ONCOassist', '[]', 0, '2018-11-15 11:10:26', '2018-11-15 11:10:26', '2019-11-15 11:10:26'),
('ae8c11bdd74a97a9aa75b3558f3df01b8314b75ac4acf2782d4999e4ef40da2ceed38fefd92367f6', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 04:57:18', '2019-11-06 04:57:18', '2020-11-06 10:27:18'),
('aedfc2d2ffeaff49934609932330deeb5e1b53f6fc3d9e108c1d3a538e1dd5ff2cff3eacd1333313', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:48:42', '2018-06-18 00:48:42', '2019-06-18 06:18:42'),
('aef82cb40fd3d9857bcd713987b13fe690a10a13e928631ed04b709a2f4b2a4386b5e644cf5b5427', 1, 11, 'ONCOassist', '[]', 0, '2020-03-06 09:29:05', '2020-03-06 09:29:05', '2021-03-06 09:29:05'),
('af0cd7dd716bc4c187f8f67f7a5a5a84bb273451fd7db63eca0f78732ddf8b5356c3465de7212e64', 1, 11, 'ONCOassist', '[]', 0, '2018-06-29 16:33:07', '2018-06-29 16:33:07', '2019-06-29 09:33:07'),
('af1f5f41bf79913a83fd091d3607d3ea7db24d3cd190881832639fa82168fd5fd10ba2e92e133ef3', 1, 11, 'ONCOassist', '[]', 0, '2020-04-30 10:09:56', '2020-04-30 10:09:56', '2021-04-30 10:09:56'),
('af2d8f7d4405b38595f488cff26b3b02be98070d6a81cc1d6bea09ced73b27bb6d8934cd8de08701', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:00:45', '2020-01-16 06:00:45', '2021-01-16 11:30:45'),
('af3b3e048368fa1c72fce6242888db520997d2bedb372afe26c6489f6dcc9459a45ec79b0cc62358', 1, 11, 'ONCOassist', '[]', 0, '2019-10-23 01:27:43', '2019-10-23 01:27:43', '2020-10-23 06:57:43'),
('af6a6f368a1560b975693a940f8feddff1d3672a5deb23501a48a2ed8c6745ebb076fc853a89177b', 1, 11, 'ONCOassist', '[]', 0, '2020-01-03 05:25:48', '2020-01-03 05:25:48', '2021-01-03 10:55:48'),
('af79b47be52826d96ad40a9cc3eb31276e6ab80b297c3ab89d1740e5d471e45c4dab180de7585bb9', 1, 11, 'ONCOassist', '[]', 0, '2019-02-07 10:55:10', '2019-02-07 10:55:10', '2020-02-07 10:55:10'),
('afa3f425138bc5a017b8a77850ac5800336a11b2d3a5307b2105ccfb564e6c2a04a113145e71d8fc', 1, 11, 'ONCOassist', '[]', 0, '2019-01-18 04:57:33', '2019-01-18 04:57:33', '2020-01-18 04:57:33'),
('affbc19a9842a7ecd50f387cc8f6a4b761b10a0a8cda4ec0982a82754a101d960e469174eeaee742', 1, 11, 'ONCOassist', '[]', 0, '2019-11-25 23:38:47', '2019-11-25 23:38:47', '2020-11-26 05:08:47'),
('b0407eedf2dcd8afb04bd700ab3c24bc9f2632c9bd641cc4f36fb351f05ffd9d75298ccedca6cf7d', 1, 11, 'ONCOassist', '[]', 0, '2018-12-05 09:45:59', '2018-12-05 09:45:59', '2019-12-05 09:45:59'),
('b097268d09d6135bb31a9b361bb2dde7e6bbc255e0f2d98a9b5399826d050542d67e2d9cafd83c22', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 06:56:08', '2020-01-17 06:56:08', '2021-01-17 12:26:08'),
('b0d3e1ebec4a3285ac3df1048d1696e423287e74c351a238aa72bc66e879f465804aeded6e415880', 1, 11, 'ONCOassist', '[]', 0, '2019-07-11 00:48:33', '2019-07-11 00:48:33', '2020-07-11 06:18:33'),
('b0e6a66f8c77df0cd36b0a33cd5ef4aed73c3583bef01dbc57c4e8b7d696fe3c9110d0809199f6ba', 1, 11, 'ONCOassist', '[]', 0, '2018-12-01 05:18:05', '2018-12-01 05:18:05', '2019-12-01 05:18:05'),
('b1037c416576e7be2bd64ecc012602fdd987c23792303a71d8bcf96aa2ce0a6387d19e06cf2e6240', 1, 11, 'ONCOassist', '[]', 0, '2019-02-14 11:39:14', '2019-02-14 11:39:14', '2020-02-14 11:39:14'),
('b11c60dab8e926a0ba0df065f1668fa8ca9e05993eba17406f68cecdf3b07c6fa8f16e0170892c1c', 1, 11, 'ONCOassist', '[]', 0, '2019-02-14 09:20:49', '2019-02-14 09:20:49', '2020-02-14 09:20:49'),
('b1317393574c898f2b625fa71add2077b56209902777b4703991098ff3e05c4ef87255078c8f2208', 1, 11, 'ONCOassist', '[]', 0, '2018-07-11 05:03:07', '2018-07-11 05:03:07', '2019-07-11 05:03:07'),
('b13508b324810762635d1b9c75d1f3172fc11117c696e533ba8438f16653ac3724b02807e628641c', 1, 11, 'ONCOassist', '[]', 0, '2018-08-30 06:20:46', '2018-08-30 06:20:46', '2019-08-30 06:20:46'),
('b1777a5f46c1dd1a2918cb2d1581591c440c219eafaee4629fde8bbf483c9ec58558840a8c7d2744', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 03:27:31', '2020-01-09 03:27:31', '2021-01-09 08:57:31'),
('b18bab770e825cd38542a1e219b5327bd1a650281a950dc2792caeaf711d760de097638a0955b557', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:28:03', '2020-01-17 00:28:03', '2021-01-17 05:58:03'),
('b1a147243ddf543daf3fa41823bf1588a8210fe8f91c06d86674fd0a9a0819ae8a179841b92e873d', 1, 11, 'ONCOassist', '[]', 0, '2019-05-15 08:16:22', '2019-05-15 08:16:22', '2020-05-15 08:16:22'),
('b1b48e471ab18cb81caba44084fc9c8596a50d3d8a0554bb48c1abc5a7a4a32fe05da3fdb1d6bb0e', 1, 11, 'ONCOassist', '[]', 0, '2020-04-03 11:57:10', '2020-04-03 11:57:10', '2021-04-03 11:57:10'),
('b1df2789afd641af16c007cdeee4287c91187ff9d88ad825061ae543aa880480018b4d9bd23ef048', 1, 9, 'ONCOassist', '[]', 0, '2018-06-16 03:15:34', '2018-06-16 03:15:34', '2019-06-16 08:45:34'),
('b216c0e39f8edafb2aabfedca4c17d6f7dbac02e976323c79396a4a63af9e0bbb7800c51a849bbbc', 1, 11, 'ONCOassist', '[]', 0, '2020-05-06 12:27:22', '2020-05-06 12:27:22', '2021-05-06 12:27:22'),
('b23a8bd7ae4e8edb9f451dc55ba0715d57a1092a6e47280c6a05cd975598c5c61b9a79455ac50c19', 1, 11, 'ONCOassist', '[]', 0, '2018-11-01 05:26:38', '2018-11-01 05:26:38', '2019-11-01 05:26:38'),
('b2974d7435a1ce0e5a8c24725e9c6a61bf9fffc4752252834150eb89d7a36b6be6bfe48b5f5ddf56', 1, 11, 'ONCOassist', '[]', 0, '2020-04-02 10:09:36', '2020-04-02 10:09:36', '2021-04-02 10:09:36'),
('b29bc0b6ed99aa26c96e34ab5f5349ed7598f1f307155b6ea8dc9e4c812609401e4174ed893a932d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 03:18:18', '2019-11-06 03:18:18', '2020-11-06 08:48:18'),
('b2befbf48597c0314d6202396db0269982455b18717e841e92dce9708b3628adcbc7f1432855e291', 1, 11, 'ONCOassist', '[]', 0, '2019-04-24 15:55:35', '2019-04-24 15:55:35', '2020-04-24 15:55:35'),
('b2bf2de01713792a0de1f44fe822202f268f102e9ff0ec6adc2992b330cef9b10363a02a0b479ac2', 1, 11, 'ONCOassist', '[]', 0, '2018-11-13 08:31:06', '2018-11-13 08:31:06', '2019-11-13 08:31:06'),
('b2e43efea6b50adde3cc1d6367bce78212692e26c01f27260037a187b4d6b90989821970304211f3', 1, 11, 'ONCOassist', '[]', 0, '2018-06-19 04:17:56', '2018-06-19 04:17:56', '2019-06-19 09:47:56'),
('b2eb1ed5fb66e4df19390263eb247c63f553b033b3d7bd4c82f9e7155fa26e77ac0aef4943b28d26', 1, 11, 'ONCOassist', '[]', 0, '2019-04-11 13:16:52', '2019-04-11 13:16:52', '2020-04-11 13:16:52'),
('b32b4e87f04668c10d3b0c06dafd51415a56254851c8cc3647237333134be573effd24a321f36b48', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 08:22:50', '2019-11-04 08:22:50', '2020-11-04 13:52:50'),
('b3471a5219729e26b4bbfd728136d4dd4649d0128e4000effb8a99ffa8807a791dd117f4e6987a76', 1, 11, 'ONCOassist', '[]', 0, '2019-03-21 18:34:24', '2019-03-21 18:34:24', '2020-03-21 18:34:24'),
('b374d027e48b5f4e03ae98ad7caa1b26c512cbcee103a094612858bbaf1d41c1fe4df3664c963a65', 1, 11, 'ONCOassist', '[]', 0, '2020-02-29 13:45:18', '2020-02-29 13:45:18', '2021-03-01 13:45:18'),
('b3bab31f336139cdb0b38a1c24d567c68934cdaef323046136f056fd849bf830b79d4afe157173d1', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:32:41', '2020-01-17 00:32:41', '2021-01-17 06:02:41'),
('b450afb4f87566a2f1fa061bfcc6b103640c8c45c9356114e9e11e4e2531095bf476ccef1ca46e01', 1, 11, 'ONCOassist', '[]', 0, '2019-02-14 04:59:11', '2019-02-14 04:59:11', '2020-02-14 04:59:11'),
('b4721aac227ea47cbfb863182c6fc25a819b833845dd12f42f027c92432da7f64af00f0e1cce6164', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 06:41:40', '2018-10-29 06:41:40', '2019-10-29 06:41:40'),
('b496a50dd1dbc5dd7fd0b3cd82995f9c56d158ad69289c88345125149634689923bae5ba5f00236f', 1, 11, 'ONCOassist', '[]', 0, '2018-12-19 07:12:34', '2018-12-19 07:12:34', '2019-12-19 07:12:34'),
('b4d0d37ce892a8fb9deb145b554d8612df5818876f9c5ae010709f257ad402996017345987b6a0a4', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 17:09:12', '2018-12-04 17:09:12', '2019-12-04 17:09:12'),
('b4d16a4272e991463be9df21cbc74031bc094c34346e943a64847f55a44fe0b6488bbc57ed07f1a4', 1, 11, 'ONCOassist', '[]', 0, '2018-11-28 06:13:57', '2018-11-28 06:13:57', '2019-11-28 06:13:57'),
('b53051a7cca35e964e585f9c13f2316b41e8a9e102f758bef0a0070811a2e8ed704e17c79c3efb5d', 1, 11, 'ONCOassist', '[]', 0, '2019-07-30 05:22:04', '2019-07-30 05:22:04', '2020-07-30 10:52:04'),
('b570787b8c31dde2afc74d8e5b41f01eeec917b7426e2ebae7c20bde1c7e2f2114e3917934932ac7', 1, 11, 'ONCOassist', '[]', 0, '2020-03-05 11:15:52', '2020-03-05 11:15:52', '2021-03-05 11:15:52'),
('b59f3fdbd8b46d35b1952f494b5895b9e58a64320b9103fc0dd33d72cf782e396c68c11669bb5448', 1, 11, 'ONCOassist', '[]', 0, '2018-09-12 12:19:16', '2018-09-12 12:19:16', '2019-09-12 05:19:16'),
('b5ead058199f05b48b6b9b12d023471ad9c9fb50cfba73e469194ae290957ccdae07b576e380c46e', 1, 11, 'ONCOassist', '[]', 0, '2020-04-17 11:20:31', '2020-04-17 11:20:31', '2021-04-17 11:20:31'),
('b64c759fb42bddc25c36d63e0c7e0a5c1722edfc7020195c2f71ddf502d7138ab86a75ac0c99942a', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:43:56', '2020-01-17 00:43:56', '2021-01-17 06:13:56'),
('b6991fd721ed8219b8d042389048b68513a098f202dd194102305c7b2bd97378e0e685edca5d71bc', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 07:29:15', '2020-01-15 07:29:15', '2021-01-15 12:59:15'),
('b6b765be380980bb73da265f9d7ada7c81ed23b8a03d70421d397be9cdb2828c237bde900a1fac1c', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 04:00:56', '2020-01-15 04:00:56', '2021-01-15 09:30:56'),
('b6ba34f430e667c43ca009c32aeb525f79b67d09271ed7d4d89f9e769e32b7fc836686bfe96f45ab', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 08:21:29', '2018-10-29 08:21:29', '2019-10-29 08:21:29'),
('b6bb86b7d9e0d7c4399f366f5345ecb62dcac4dce2c12402c3c5bec667135a3a23497e19dbdb0dd6', 1, 11, 'ONCOassist', '[]', 0, '2019-07-16 06:34:40', '2019-07-16 06:34:40', '2020-07-16 12:04:40'),
('b6cc156e3d58bd23413971513df3918d8616513623f7d2cd4d3f2754688f59002a088a8cfbb50c28', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 09:08:26', '2019-11-06 09:08:26', '2020-11-06 14:38:26'),
('b6e5d1cce0aa54ca469d96bc40dbf689a1f4cc699b8910259090705c6977b3bd2a8b80ebff9511d5', 1, 5, 'ONCOassist', '[]', 0, '2018-06-13 03:14:34', '2018-06-13 03:14:34', '2019-06-13 08:44:34'),
('b71fdb3b4b44e523c1603d2142bc23096739ed725f278d25eaf6466cd9bfc9dd26e20a65bdf91860', 1, 11, 'ONCOassist', '[]', 0, '2019-02-21 07:24:31', '2019-02-21 07:24:31', '2020-02-21 07:24:31'),
('b723a770cc1d45c2747418a00f9905b077e8bd8f4c68ad9b3f8d6f90bc802fd2feb3f7483c562e7a', 1, 11, 'ONCOassist', '[]', 0, '2018-11-02 06:31:15', '2018-11-02 06:31:15', '2019-11-02 06:31:15'),
('b74aca9efd0dbc040bca183273c9878f13e084fa53f4e1490f7a0fb65e917d6945dc2a0de9581a9e', 1, 11, 'ONCOassist', '[]', 0, '2019-01-23 09:43:57', '2019-01-23 09:43:57', '2020-01-23 09:43:57'),
('b77099030b99796113775238cacf8db51a62fe1e0b2d9c0bc821d587f1b2db92c064073a40d2d7be', 1, 11, 'ONCOassist', '[]', 0, '2020-01-03 04:44:49', '2020-01-03 04:44:49', '2021-01-03 10:14:49'),
('b7a0846b3482cc0cd4d98c0f8b2a64e8eaa836452d29d333aa15f088187965fe54c0194ef2947dc7', 1, 11, 'ONCOassist', '[]', 0, '2019-11-27 02:19:19', '2019-11-27 02:19:19', '2020-11-27 07:49:19'),
('b7d8646ce5c9e31d3431f64a3e5e8bd7728c9786659139b2eb73df78912c303330c17be87e731bde', 1, 11, 'ONCOassist', '[]', 0, '2018-12-14 09:04:53', '2018-12-14 09:04:53', '2019-12-14 09:04:53'),
('b8144240ef1c46dc59c64730b41103ac264ee4ab98d99b4b5035cb998a3a33d012db3118c653ee1d', 1, 11, 'ONCOassist', '[]', 0, '2020-02-24 04:24:54', '2020-02-24 04:24:54', '2021-02-24 09:54:54'),
('b8606c9352c4ee57e1c5af8b4b2edb994e4cb8359e9a64e291915d106992983afdd8a5e4cc410ba5', 1, 11, 'ONCOassist', '[]', 0, '2019-07-16 23:19:31', '2019-07-16 23:19:31', '2020-07-17 04:49:31'),
('b87b7a335742327306c64a295cc22173c2c65b27524215e2fd60a4a488b22de2b39a45f5777d83c7', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 14:16:04', '2019-05-09 14:16:04', '2020-05-09 14:16:04'),
('b87eda238704c121fa991427ed3b24b1063350977db1d3c7f0c207929ecd8793fb018359679fc209', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 05:20:08', '2018-10-29 05:20:08', '2019-10-29 05:20:08'),
('b88011e6ac51c8b3735cc8d35399c46c5f6d812bc6c0a51a103c512bddde57e89528b1deb666aa54', 1, 11, 'ONCOassist', '[]', 0, '2019-11-28 00:37:38', '2019-11-28 00:37:38', '2020-11-28 06:07:38'),
('b89aed95966989e468a7a1b44b69ffb312b9923cb3eafd4c2825bfd539413766d72b92c8beafd428', 1, 11, 'ONCOassist', '[]', 0, '2019-02-22 09:54:49', '2019-02-22 09:54:49', '2020-02-22 09:54:49'),
('b8f05500c9c876d16b2dc70ac38535ec9accd8ebc748f466619e38e9465c0d879be360b9a09b6585', 1, 11, 'ONCOassist', '[]', 0, '2018-06-28 13:22:14', '2018-06-28 13:22:14', '2019-06-28 06:22:14'),
('b8f2eead6f84dfb3eb9685a1dd0697f117b7206d4d6ca0c7dc896e54fd4ac277a269eb4968f4b83c', 1, 11, 'ONCOassist', '[]', 0, '2018-09-06 18:19:15', '2018-09-06 18:19:15', '2019-09-06 11:19:15'),
('b9376a529c10afff3f1cebecc4a18d7916aa5ae454719cf128d27eee46f7f2c532c361dddff7d766', 1, 11, 'ONCOassist', '[]', 0, '2019-11-25 05:20:15', '2019-11-25 05:20:15', '2020-11-25 10:50:15'),
('b98643aa0dd1c3e139ecf43c313d174582a53672135737bb594ca4d6766772f67639c907e327f9fa', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 09:20:20', '2019-02-13 09:20:20', '2020-02-13 09:20:20'),
('b9be4b78e3b0fc799e67a895da1a863153505ad7fb8b88600cf9b63af50e20f4ab6c025a6be00662', 1, 11, 'ONCOassist', '[]', 0, '2018-06-27 14:02:54', '2018-06-27 14:02:54', '2019-06-27 07:02:54'),
('b9f5e00ab4bcd6896dddb55c64d73ef3b21d978cc6503f4a7741698bb9d60b1450e96c47a67aa88a', 1, 11, 'ONCOassist', '[]', 0, '2019-02-21 05:32:13', '2019-02-21 05:32:13', '2020-02-21 05:32:13'),
('b9f9ff7ec33e890a7f47fed3b5cb7dd6ff2b31a567a6e434a1efa8d10d2b014a6dd114d49496da88', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 06:26:19', '2020-01-15 06:26:19', '2021-01-15 11:56:19'),
('b9fcf3cdd21d455311b71204c3b180cb7a46ef018205f4262d3a3507a1c12af7d088b939066f74e0', 1, 11, 'ONCOassist', '[]', 0, '2018-07-10 13:43:50', '2018-07-10 13:43:50', '2019-07-10 13:43:50'),
('ba23493752f526fb0666c3807e9ba9658ba3b30ab4dd86ddc1e2b4c67990466e9342a41f462ef1b5', 1, 11, 'ONCOassist', '[]', 0, '2020-02-28 05:11:15', '2020-02-28 05:11:15', '2021-02-28 05:11:15'),
('ba4bf852d2618163141f4d8593ccc8b0c81af54e31962d75ef9e98618a666831993cb4d90d3d2b9e', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 11:15:14', '2020-04-20 11:15:14', '2021-04-20 11:15:14'),
('ba5644bbcb0f0c54583a63cd5c39e64628ad34a471e2de122880da4f64aced16d5dcb9488422ff32', 1, 11, 'ONCOassist', '[]', 0, '2019-11-29 05:45:52', '2019-11-29 05:45:52', '2020-11-29 11:15:52'),
('ba69cd461720fea200289969323e035a4a3821a9e4f2132595b87b48dc9ffba41a44444a65dc7148', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 00:12:24', '2019-11-07 00:12:24', '2020-11-07 05:42:24'),
('ba99ab6fa0009d8b087bc8bc2505168855999e1c581a31dde2bd781622ae6079c228c9a436b00eda', 1, 11, 'ONCOassist', '[]', 0, '2019-05-16 00:34:55', '2019-05-16 00:34:55', '2020-05-16 06:04:55'),
('bab59928a5d3f3fe6e2159bbe60d7a151300ab7588bd2c77700d36650224167d331b13c0a6782c7d', 1, 11, 'ONCOassist', '[]', 0, '2020-04-02 14:58:41', '2020-04-02 14:58:41', '2021-04-02 14:58:41'),
('bad18abbd878588318fd1dee3effbace1312fde27e4bd2a18ed3d473cabcc0a56cbaae9d1f487bd6', 1, 11, 'ONCOassist', '[]', 0, '2019-04-08 08:34:23', '2019-04-08 08:34:23', '2020-04-08 08:34:23'),
('bade8c5053b1edeb8e047425e59c54127bd9c5ae8a960f86c72e9eeccbf063b6ba91a6c10a9d27b7', 1, 11, 'ONCOassist', '[]', 0, '2019-05-08 13:55:00', '2019-05-08 13:55:00', '2020-05-08 13:55:00'),
('bb05504f9375cd9df79d1c62bdc41c6c7511b58e6f955e7ae5b00e6090135fff80c8bb96ff77066a', 1, 11, 'ONCOassist', '[]', 0, '2018-06-19 04:47:18', '2018-06-19 04:47:18', '2019-06-19 10:17:18'),
('bb1cde196d198b5cdc9da858f63cb5bc596c12866008a5cdc714211974f5a473588fc00627d43cb9', 1, 11, 'ONCOassist', '[]', 0, '2020-03-02 06:00:01', '2020-03-02 06:00:01', '2021-03-02 06:00:01'),
('bb3fcb024935a79e6d9b1e0533531e0afebd9edfdcc190cc6e0d0ce4f006236262227d7c087137b1', 1, 11, 'ONCOassist', '[]', 0, '2020-02-24 05:02:42', '2020-02-24 05:02:42', '2021-02-24 10:32:42'),
('bb49a3e0755e6787da9e8e1ce1211faef5671f875143d39371e809d98bd59f77996064fa2d4e166c', 1, 11, 'ONCOassist', '[]', 0, '2019-01-15 11:26:02', '2019-01-15 11:26:02', '2020-01-15 11:26:02'),
('bbc9d69bb1d609688b304573430d8cc993bf583421eb442eb588fff10223165e6228df073dfd4312', 1, 11, 'ONCOassist', '[]', 0, '2019-05-08 13:52:33', '2019-05-08 13:52:33', '2020-05-08 13:52:33'),
('bc5585db22bd06cf238932253e274e18f44a31f3af2c4958a709b3d97cb16d71e9433ae9a70dc3e6', 1, 11, 'ONCOassist', '[]', 0, '2019-07-10 06:36:44', '2019-07-10 06:36:44', '2020-07-10 12:06:44'),
('bc5c3bb7ebda1773dfade5aa6bf4b890f56081cbd978653d50a22b6b26f57cabb70d8179ea259aad', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:44:13', '2020-01-17 00:44:13', '2021-01-17 06:14:13'),
('bcbbfa6abf17b282f8fddebebe65be35d7a18a2539bd064f4174391f331733d46295093f27045386', 1, 11, 'ONCOassist', '[]', 0, '2020-04-21 09:17:16', '2020-04-21 09:17:16', '2021-04-21 09:17:16'),
('bcbc8bfc08cde7c4a6a21e03a4be42ec4bd20ccbe5dcfdc871338b29eb56f6b8680273600aae617a', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-22 00:50:28', '2020-01-22 00:50:28', '2021-01-22 06:20:28'),
('bd0dc137a3ebe1ee56d4a532012abcd44baf34b49cee3f69103f4f86fe7ead8a380772257efd103b', 1, 11, 'ONCOassist', '[]', 0, '2019-10-24 23:16:10', '2019-10-24 23:16:10', '2020-10-25 04:46:10'),
('bd3d405b1e9fcb17fe1b02a493fd37dccd24091bc3ad232ae1bf7f236f5a552eee8fd934bbc6133a', 1, 11, 'ONCOassist', '[]', 0, '2019-04-23 12:49:28', '2019-04-23 12:49:28', '2020-04-23 12:49:28'),
('bd3f0a2ce0bf42ee2b46205842e4e718e604c818f4d4f4ae44c168e297971ffdd1c5489d241015a8', 1, 11, 'ONCOassist', '[]', 0, '2019-03-13 17:35:22', '2019-03-13 17:35:22', '2020-03-13 17:35:22'),
('bd620bad404e9be93d19af9011b8cef0f0cfbd3286ffcc5bf9b2852cb36c09b5879f60e28caa7bec', 1, 11, 'ONCOassist', '[]', 0, '2018-12-01 04:32:32', '2018-12-01 04:32:32', '2019-12-01 04:32:32'),
('bd7459ab0b9bb15446d711dad062940f01911b557742c940a1cedb30fd0437fea8f1a7cdafe468cc', 1, 11, 'ONCOassist', '[]', 0, '2019-04-23 08:16:42', '2019-04-23 08:16:42', '2020-04-23 08:16:42'),
('bd93d452111e064fb30fc7b51fe034b4d90be331315c6af0fd6e45272192b0534ff8da81ae933be6', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 06:57:30', '2019-11-21 06:57:30', '2020-11-21 12:27:30'),
('bddda59dccb3dcd684003177dbc3f13e51a004047305923452ec54d279f161f545abf549e4544304', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:35:14', '2020-01-17 00:35:14', '2021-01-17 06:05:14'),
('be28c8a0769dbee8fcb27a1bfb9aeb45afdc68b8fe82724e757793238ffe59918a69180a686c5ba6', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 06:17:01', '2019-11-21 06:17:01', '2020-11-21 11:47:01'),
('be3c7176a9ab88a05d085fc7260e534a901aa09dbf5b7e32b3c00365517e73276600bf2e15732476', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 02:38:12', '2019-11-07 02:38:12', '2020-11-07 08:08:12'),
('be5b85d008411e0f2082c80dbf1eb9d0d644092003b99ead513affaa324b348bbbb850463bef55b1', 1, 11, 'ONCOassist', '[]', 0, '2019-04-23 12:53:27', '2019-04-23 12:53:27', '2020-04-23 12:53:27'),
('be608118c8391c6ed5adbae655c38cbd6ff901955bfe01ed846966b3cf860708c2fc73956a19592f', 1, 11, 'ONCOassist', '[]', 0, '2018-12-03 10:52:46', '2018-12-03 10:52:46', '2019-12-03 10:52:46'),
('be6f310a609ff3e4d3d2f662bf72d8a41e08c4de2e6d031735427413f5112a3125bcca447f3fea63', 1, 11, 'ONCOassist', '[]', 0, '2019-01-30 04:35:37', '2019-01-30 04:35:37', '2020-01-30 04:35:37'),
('be8862c9ac0132589c39a84d68d7c5578448f0c8c574dcb8aeff442814e858032a8e588e429624aa', 1, 11, 'ONCOassist', '[]', 0, '2018-10-16 10:18:40', '2018-10-16 10:18:40', '2019-10-16 10:18:40'),
('beecde57c2eacf723735e87fa31210fffcbbd5ce016f7da34cd6850e90bdb7f54a4b7cf5dad5b978', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-10 07:54:29', '2020-01-10 07:54:29', '2021-01-10 13:24:29'),
('beee9a841ebc388229389c3ffb0eb4094cc28ab50e45fd9309901e92f01f0372b098b7437ad837dd', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 01:30:47', '2019-11-06 01:30:47', '2020-11-06 07:00:47'),
('bf395056c05fbe571f21b86b1468c8057a8eeaa931c703b3ef51fe1420747e87fb13bebc4263d78f', 1, 11, 'ONCOassist', '[]', 0, '2019-10-29 23:03:03', '2019-10-29 23:03:03', '2020-10-30 04:33:03'),
('bf468248d5604d5fe836d108cf9f3b4fc61996b2dc31135e38c56ef1ed9ff8c1b1c30031580c8579', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 11:15:13', '2018-10-29 11:15:13', '2019-10-29 11:15:13'),
('bf8aab8d8cc207b812c4765ed9a82f3c72ba933cd9e67ff3ffaa6f728a77accba18d644d617899c3', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-13 03:19:36', '2020-01-13 03:19:36', '2021-01-13 08:49:36'),
('bfcd30a6005f48fc978d46210e474f442b42af924208bd1948a7b3c652f1112f886f49f478254a09', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 03:02:14', '2020-01-16 03:02:14', '2021-01-16 08:32:14'),
('bfdfa3e2b105b1693e45494ffb9a413b629a95a11c7808db06cba3c188ea047b1c7e2ef23299f023', 1, 5, 'ONCOassist', '[]', 0, '2018-05-29 04:09:39', '2018-05-29 04:09:39', '2019-05-29 09:39:39'),
('c014685cbdf3a71f6bfd9bb7c6b562b0ed9d0dc836cd9043447846d842c6af5d5f12ee811371ae8b', 1, 11, 'ONCOassist', '[]', 0, '2020-05-07 13:59:42', '2020-05-07 13:59:42', '2021-05-07 13:59:42'),
('c02063c1e6aabeee6ce3be2794889c7c670498f18d53c49ed85fa8139693814df86108cbfe69f5c9', 1, 11, 'ONCOassist', '[]', 0, '2018-11-15 05:51:25', '2018-11-15 05:51:25', '2019-11-15 05:51:25'),
('c034c53b78c4c4a65ff94b2b56d41c16c96d864457f7447ddf6751dc470a9b1d1d148d2ef0150292', 1, 11, 'ONCOassist', '[]', 0, '2019-04-01 05:59:24', '2019-04-01 05:59:24', '2020-04-01 05:59:24'),
('c051e5cd50ac3e98931dde34d109ded86035e36ca1ed66ac2dee97f8755e5812bd7cb576dcaf1325', 1, 11, 'ONCOassist', '[]', 0, '2019-04-02 09:12:05', '2019-04-02 09:12:05', '2020-04-02 09:12:05'),
('c0526f3f26a1e33558a985f366fffb9565216fa8f1908ec7e8436a9ebb0bc76e443ef6cd4ff4a4dc', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 09:10:24', '2019-02-12 09:10:24', '2020-02-12 09:10:24'),
('c06d870f04871af0f0533232ce40b9447ae624223ec2cbe8419861cd183e53ee97e862806e327fc2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-14 08:37:05', '2019-11-14 08:37:05', '2020-11-14 14:07:05'),
('c087213daf423d270f0c9142ce616f86f6dd153f8b10e07ac0de637ccda9afa9ad021c252db9f8b3', 1, 11, 'ONCOassist', '[]', 0, '2020-03-20 06:15:53', '2020-03-20 06:15:53', '2021-03-20 06:15:53'),
('c0bc25b552b67c703825893c1fcca753efd8243bac3861aada2cc687efebf0a2d07665a2bd99ca10', 1, 11, 'ONCOassist', '[]', 0, '2018-11-23 08:27:34', '2018-11-23 08:27:34', '2019-11-23 08:27:34'),
('c0df656c31123a44a203c0107dc89a9431ae1e20547462c800741e1b7b7afbf768f350a37ef0c1a1', 1, 11, 'ONCOassist', '[]', 0, '2018-08-20 08:49:13', '2018-08-20 08:49:13', '2019-08-20 08:49:13'),
('c0f56736a84399b04e873a99aad93e9f90c55a3a9865cc6f839321b9e2c4e1649a533e43ac4e1c0c', 1, 11, 'ONCOassist', '[]', 0, '2018-06-21 23:08:39', '2018-06-21 23:08:39', '2019-06-22 04:38:39'),
('c112ac7a99d9ffdd71212b04d7a40063ab7d1af2715f71d73341e8aca1bda47993d3b6a22c143bc7', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 09:09:57', '2018-10-29 09:09:57', '2019-10-29 09:09:57'),
('c1af6acf1f665b37bf954b10b23f9a55a050af097bb44a8cdf3dafce904cf5daa2b3aa241f5c74fc', 1, 11, 'ONCOassist', '[]', 0, '2019-07-25 23:54:17', '2019-07-25 23:54:17', '2020-07-26 05:24:17'),
('c1b292b8cc44a7614a89f4bee35931ce99a3f15d2fc9a43d2afdad0416fc1681fb2b6e0c84ceab9f', 1, 11, 'ONCOassist', '[]', 0, '2018-12-13 11:24:14', '2018-12-13 11:24:14', '2019-12-13 11:24:14'),
('c1bf4b9714b5744dfd5fa382875408f220155147df44e6e6ce70857363bba33b137e8704ccfc83d3', 1, 11, 'ONCOassist', '[]', 0, '2019-09-03 23:54:20', '2019-09-03 23:54:20', '2020-09-04 05:24:20'),
('c1d789f4061e9d639dc4c6c43c2fe838674eaa9ca07c8ce226f9d85202f048be1b1938013b3a7b1e', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:41:43', '2020-01-16 06:41:43', '2021-01-16 12:11:43'),
('c1ff819a31799146f104a2afd337aca669d0c508545c936ec976055ae4abe07964fa204d964e9491', 1, 11, 'ONCOassist', '[]', 0, '2020-04-01 08:22:26', '2020-04-01 08:22:26', '2021-04-01 08:22:26'),
('c21605cfbe64c39433814e642b5ad9f0550061477733eb63ff9fc09f72a5429629601f8188f84c26', 1, 11, 'ONCOassist', '[]', 0, '2020-03-11 08:31:07', '2020-03-11 08:31:07', '2021-03-11 08:31:07'),
('c22b6a4ad7a318bbf264b3518b5f2a4f1010732e86cb902cdbc4ba8c71542b3ef4154194de3e765c', 1, 11, 'ONCOassist', '[]', 0, '2019-02-11 09:53:29', '2019-02-11 09:53:29', '2020-02-11 09:53:29'),
('c2395eafa1428ded46da051fcbdfcd3ca4eec67f189866e2bebbbb7826513e82584948681ed128e2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 07:36:03', '2019-11-21 07:36:03', '2020-11-21 13:06:03'),
('c288af8e826c83b7d7b544fed1905f1641801b252b1817b80e5740183df92debe560f32f01bd19fa', 1, 11, 'ONCOassist', '[]', 0, '2019-12-06 00:29:10', '2019-12-06 00:29:10', '2020-12-06 05:59:10'),
('c2f3bbc73b3a371e987fe48a89b95027beac046d99f4348a20baa382e36786eb9bac1f03d91d571e', 1, 11, 'ONCOassist', '[]', 0, '2019-04-23 08:12:28', '2019-04-23 08:12:28', '2020-04-23 08:12:28'),
('c32ae67a13a3d4bb8c94528cffb3e1d3a12e2e950c92e1d156dc10d585dd97354865851e49c0e660', 1, 11, 'ONCOassist', '[]', 0, '2018-11-15 13:45:19', '2018-11-15 13:45:19', '2019-11-15 13:45:19'),
('c3481ba2deb21d039e759abc578f7cd3e0d02b3f0ac9416893f1ae7d3d2aaba05f7bf08e81e7c31c', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:41:33', '2018-06-18 00:41:33', '2019-06-18 06:11:33'),
('c36bb31ee0c17d4e059489d44572ca4456350d287f2700194831155f976e1a81c7db36b629823009', 1, 11, 'ONCOassist', '[]', 0, '2018-07-13 14:17:22', '2018-07-13 14:17:22', '2019-07-13 14:17:22'),
('c37d42aa4b93e9e4e01158e35402c87ffef175003dbf2b870c319757cdc8eacd4afc78dcd54833c2', 1, 11, 'ONCOassist', '[]', 0, '2019-02-08 20:39:29', '2019-02-08 20:39:29', '2020-02-08 20:39:29'),
('c38eee8d48d4d15ef0ed4286ef0cfa5d58702ffb43b5f1de2a827da198e25f400ab17fc46c2c7ad3', 1, 9, 'ONCOassist', '[]', 0, '2018-06-16 03:15:27', '2018-06-16 03:15:27', '2019-06-16 08:45:27'),
('c3976bc1df78bc2361cbddee286f12536a7d93e0d0d96829bc7fcb02251a14d88ad05b7b3395f601', 1, 11, 'ONCOassist', '[]', 0, '2019-02-08 05:19:18', '2019-02-08 05:19:18', '2020-02-08 05:19:18'),
('c3ba6243903fe6a0b4b66ca99afd87262da8b96c441b099f09ef53997fbfe61d39e3ea1c0e5cfeaa', 1, 5, 'ONCOassist', '[]', 0, '2018-06-15 03:24:43', '2018-06-15 03:24:43', '2019-06-15 08:54:43');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('c3edf47f1a2c83e9932e0667119422eead555e9d982853d262b25b0d2ce9c3ff0a9c88631e40ee39', 1, 11, 'ONCOassist', '[]', 0, '2020-06-08 21:40:35', '2020-06-08 21:40:35', '2021-06-08 14:40:35'),
('c4103eb0e6c3b0b4d804c5e6b676ed379b6df0af3411aba07b647a23c020c3a7a46ff9ae830fed20', 1, 11, 'ONCOassist', '[]', 0, '2020-03-04 11:02:26', '2020-03-04 11:02:26', '2021-03-04 11:02:26'),
('c415680ef4e691ed03feb242c3a7e1c6ff108da088410b41be1a7b579fa7ffaafa75bff9114f7e1e', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 05:09:42', '2018-10-29 05:09:42', '2019-10-29 05:09:42'),
('c42101ae0b7d16c59d5765e414755b1eb91e2d289c0a4f3c96ceedd35fb51cfbce388ba5acb56595', 1, 11, 'ONCOassist', '[]', 0, '2019-03-28 18:56:48', '2019-03-28 18:56:48', '2020-03-28 18:56:48'),
('c4370282c103c2bebb0c320c7975346b88682fb134c5641630f8f0dc49dd9378f5d043ad5c097e10', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 04:34:17', '2020-01-15 04:34:17', '2021-01-15 10:04:17'),
('c4396fef2798fd2a476f21fdef20c588f6a5c1fac20264163f9c60d56331ed5b8abf0c711bdca832', 1, 11, 'ONCOassist', '[]', 0, '2020-04-03 06:08:25', '2020-04-03 06:08:25', '2021-04-03 06:08:25'),
('c46692c0edae66bebee0102e117816c52f56da03118e171142b591ebb580c9502d49ca9c12a38943', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 04:24:44', '2018-06-18 04:24:44', '2019-06-18 09:54:44'),
('c48d1e21d57b994aeb23c31c979fee8f7db704efa67357c56738ee05051d88f3cb46918977bdc7e9', 1, 11, 'ONCOassist', '[]', 0, '2018-06-25 04:34:01', '2018-06-25 04:34:01', '2019-06-25 10:04:01'),
('c49226384a0451300778a298b9d240ed87ed1c65b2707399475d61298cbeecb864b12adc8b0ae2a2', 1, 11, 'ONCOassist', '[]', 0, '2019-04-04 10:48:38', '2019-04-04 10:48:38', '2020-04-04 10:48:38'),
('c49ec0d6fa9847baacc80d7e77b0132142b957cba4e39a38d96bf0da5fc30c9670b79daf9bc13622', 1, 11, 'ONCOassist', '[]', 0, '2019-11-18 23:04:31', '2019-11-18 23:04:31', '2020-11-19 04:34:31'),
('c4a394eec9c0b6f5ec17ba784114dfe715036c64434a3499238dc8ebfeb1e037838fa0cd0ea6703a', 1, 11, 'ONCOassist', '[]', 0, '2019-02-08 09:12:33', '2019-02-08 09:12:33', '2020-02-08 09:12:33'),
('c4eb5f5fcbce73ce6795d8d1476c05830ed39111dc187a11ac713c32661ae2d3e5233c28e0afee9c', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 14:32:08', '2018-10-29 14:32:08', '2019-10-29 14:32:08'),
('c515d759a750ef5eb1a29f90e91e17598b55551d3f70aa6ffa333aa2efc62183b36321e03c544a51', 1, 11, 'ONCOassist', '[]', 0, '2019-11-19 01:25:05', '2019-11-19 01:25:05', '2020-11-19 06:55:05'),
('c52137e86db5a3451e67d7b640c01a8060b5868f17b3b49c98ed6c4da02dfd9c456b4e5ad6ebfd33', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 09:21:43', '2019-02-13 09:21:43', '2020-02-13 09:21:43'),
('c52b3b4916efff6b5f6369ab192ef565f029359e28dfd52aa7c2c35061794f636f1887ebedb286cf', 1, 11, 'ONCOassist', '[]', 0, '2020-04-03 10:00:51', '2020-04-03 10:00:51', '2021-04-03 10:00:51'),
('c54248114fd1c7fee84cb7de57a19693d08b487c32f290cb156b900c7ea96c387611132e0dfb06f8', 1, 11, 'ONCOassist', '[]', 0, '2019-03-11 09:33:30', '2019-03-11 09:33:30', '2020-03-11 09:33:30'),
('c55e587fa78346cf47c449a2ab7a45a9c36bb8c959b6c84108182f996895da92b48f6ac5e5e40833', 1, 11, 'ONCOassist', '[]', 0, '2019-03-25 05:00:44', '2019-03-25 05:00:44', '2020-03-25 05:00:44'),
('c55f691ee3abe8fb9357d968ecb93e1348b6e0115dc288fb6bf25f0c704fe7143ed20401488b7f48', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 13:21:33', '2018-10-29 13:21:33', '2019-10-29 13:21:33'),
('c5d9552c6e4e65f067e38f6299bc9668a3ae3a0bfbbaaeb09dcc64fbae4adb6fbc6c3649b0ce76b6', 1, 11, 'ONCOassist', '[]', 0, '2019-04-23 14:03:41', '2019-04-23 14:03:41', '2020-04-23 14:03:41'),
('c5eb939b33fa635359a6eaf85761e4c2b0bc7aa87c68360d846b27380ea7643dd9d70c58a73e6d4d', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:20:34', '2020-01-16 06:20:34', '2021-01-16 11:50:34'),
('c639b0d7d091b256f9bb8939d12ee08f03ef2c7c14d547efaeb5ee69db1224ed61c73b246d403cae', 1, 11, 'ONCOassist', '[]', 0, '2018-07-26 12:32:24', '2018-07-26 12:32:24', '2019-07-26 12:32:24'),
('c647aa30110dfd33961b4c2963f41082092abd34edfa70da7991d2ad8a2eef5c2ad6948cb087eab4', 1, 11, 'ONCOassist', '[]', 0, '2019-02-18 10:28:40', '2019-02-18 10:28:40', '2020-02-18 10:28:40'),
('c64dc7dab9a0fbd0e3b480e4446739bc41e0dbce18dd5d25f258830c52c5d9b47a954174bec9c271', 1, 11, 'ONCOassist', '[]', 0, '2019-04-05 08:10:45', '2019-04-05 08:10:45', '2020-04-05 08:10:45'),
('c66b732e110891fefebf93b96bfad9648ec53409c48f78fead308cb124a90584808138450e5ef6fa', 1, 11, 'ONCOassist', '[]', 0, '2019-03-22 16:05:57', '2019-03-22 16:05:57', '2020-03-22 16:05:57'),
('c6b4c4020e927c9b4512ce3a803d5b666aeaf847bcea31681ca0607358f3adffb5faa7eefca8fad8', 1, 11, 'ONCOassist', '[]', 0, '2019-04-19 10:51:39', '2019-04-19 10:51:39', '2020-04-19 10:51:39'),
('c6c19c81ea4afc784022e65034f9e097bc26922259d34a9a6b143dd51fc79fdc5aa6d1b6fc6cff17', 1, 11, 'ONCOassist', '[]', 0, '2019-04-03 08:07:47', '2019-04-03 08:07:47', '2020-04-03 08:07:47'),
('c6d74a531cadd9bd1f6db1ddc246fd1f55fccece9ea0e597760f07ea050088aaf483f1a45aa48434', 1, 11, 'ONCOassist', '[]', 0, '2019-02-14 10:58:52', '2019-02-14 10:58:52', '2020-02-14 10:58:52'),
('c7133447adb72fe9ffb40a502abdad6e3a775f7a7d41d83c8ca46d8d01f1b50ab5bf3b0b2c953b65', 1, 11, 'ONCOassist', '[]', 0, '2018-12-24 05:53:52', '2018-12-24 05:53:52', '2019-12-24 05:53:52'),
('c754df89bcd4f819a6d14699287cc563ae1f98d854714621c09a26b19e44fbc6935e4d0b7e61ef3e', 1, 11, 'ONCOassist', '[]', 0, '2019-06-07 03:35:57', '2019-06-07 03:35:57', '2020-06-07 09:05:57'),
('c777af27d67bebb59cf2e8c1b33cc282cadf6e00bacf725f2c5036b2812ec5c687668aba82ab4dd3', 1, 11, 'ONCOassist', '[]', 0, '2020-04-17 06:51:48', '2020-04-17 06:51:48', '2021-04-17 06:51:48'),
('c782a4f351d463c5e338b987c1b2c457422db47a5f7a6ecdebc4ef0e15ca0289b24b84c09b86d1c6', 1, 11, 'ONCOassist', '[]', 0, '2020-03-11 08:42:53', '2020-03-11 08:42:53', '2021-03-11 08:42:53'),
('c79931898037df737d8ae6ba0ec4dece76edb1e7964daa434b0648bf84a1c90ff75fce217feba09c', 1, 11, 'ONCOassist', '[]', 0, '2019-02-06 07:10:35', '2019-02-06 07:10:35', '2020-02-06 07:10:35'),
('c799647f769bae21ff629232a61bc6dcee3d1a12b99d483773d1e05b062191e8f74ba0532cfecb1e', 1, 11, 'ONCOassist', '[]', 0, '2018-11-23 10:15:34', '2018-11-23 10:15:34', '2019-11-23 10:15:34'),
('c79cbccec513fed5a2ed0724bed889d1d16878a76a9a715f3b324837c6fa37ca0c2274f16f01beba', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:39:53', '2019-11-22 00:39:53', '2020-11-22 06:09:53'),
('c7c1814a8ab8eda79705a61e2a8f5f09962e930a947a8450705b40cd0c42e3c0f7431e70a1ebbd21', 1, 11, 'ONCOassist', '[]', 0, '2020-05-26 06:03:24', '2020-05-26 06:03:24', '2021-05-26 06:03:24'),
('c8291c493e30a8ca5dcda44a8c3bbaa5ed992cd483f3fefac0833fce8cb45ad31e312a9e6a8aac03', 1, 11, 'ONCOassist', '[]', 0, '2019-04-19 08:15:56', '2019-04-19 08:15:56', '2020-04-19 08:15:56'),
('c82d7801868f7a5fb5e929c7625ebdb600fa976439009b8db1359043f91d9e04b74c6a4859aaf98d', 1, 11, 'ONCOassist', '[]', 0, '2019-03-08 06:18:10', '2019-03-08 06:18:10', '2020-03-08 06:18:10'),
('c8522b211c6bce8b8dfdf3193688c998a8c1e6ea139f58b35c22d3ff72ea4991b01f393c7e7836e3', 1, 11, 'ONCOassist', '[]', 0, '2019-10-24 03:34:03', '2019-10-24 03:34:03', '2020-10-24 09:04:03'),
('c89961199b9015635faf8136308e61756bcdd52a2b89af025785314fbb3e9cec6f2c4065a6d5fe00', 1, 11, 'ONCOassist', '[]', 0, '2019-03-20 15:22:06', '2019-03-20 15:22:06', '2020-03-20 15:22:06'),
('c8a9ca7d8827575c91e36120dc053104cf1e1b15e0470919690e201b260bb82fdae1784258c9cd25', 1, 11, 'ONCOassist', '[]', 0, '2019-11-14 23:32:04', '2019-11-14 23:32:04', '2020-11-15 05:02:04'),
('c8c0bd3469a66c88dd9370dc153d180dfcd5aa5235a536c769ca3ad2e94f9ef0434855e2914ef80b', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 00:34:24', '2019-11-05 00:34:24', '2020-11-05 06:04:24'),
('c8dd6bbd2f5534dda6af3f4fc4ee00a980a1248c272e69d2da1221e4dc759e8e3427b423408629d1', 1, 11, 'ONCOassist', '[]', 0, '2018-06-19 23:03:21', '2018-06-19 23:03:21', '2019-06-20 04:33:21'),
('c8fded70ab0207d752c7a1acdd633960d710eaee2b388d78007341ed99d0b51ef1301dacdf4f5e57', 1, 11, 'ONCOassist', '[]', 0, '2020-03-05 05:21:22', '2020-03-05 05:21:22', '2021-03-05 05:21:22'),
('c90c845fa1450d81da1ac7b6bd17255a545d71c424ed3d4168008d022f432542f15206a0143df364', 1, 11, 'ONCOassist', '[]', 0, '2019-04-29 08:32:38', '2019-04-29 08:32:38', '2020-04-29 08:32:38'),
('c937e85441fd2a238098961867e23522ffadcef3df0bc1e3209e868959b98ff36d36e3fc36e1ef1e', 1, 11, 'ONCOassist', '[]', 0, '2018-09-26 15:34:52', '2018-09-26 15:34:52', '2019-09-26 08:34:52'),
('c96ef54b4c2297a1ec8472768d7bb017d3e5a0de2baa06181c65be81f25d1f90ba19c3b0cb354c29', 1, 11, 'ONCOassist', '[]', 0, '2019-11-18 03:43:17', '2019-11-18 03:43:17', '2020-11-18 09:13:17'),
('c97629bab2824a529fb38b7bbe67f30aeefc55fd4282426cce151f0b98cc2a74dbc78fb345ade663', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 03:01:11', '2020-01-16 03:01:11', '2021-01-16 08:31:11'),
('c9822e7e99d0b87c3f822ca34ea6aa1f1c1846053fa4fa785d1f96e0c6baecde2c821bc0a57a2e9d', 1, 11, 'ONCOassist', '[]', 0, '2020-02-26 13:20:12', '2020-02-26 13:20:12', '2021-02-26 13:20:12'),
('c991fc4dbbb9ece4986e49761415853729cabe702616065afaf4707100b2bac3f44254bbd833e128', 1, 11, 'ONCOassist', '[]', 0, '2018-07-04 12:42:28', '2018-07-04 12:42:28', '2019-07-04 12:42:28'),
('c9e05db1af9785592dc03d33550530b1a50135704aee96599c6a457c41fc56981e6c86f2740f1b68', 1, 11, 'ONCOassist', '[]', 0, '2019-01-18 14:33:58', '2019-01-18 14:33:58', '2020-01-18 14:33:58'),
('ca6df3ea2ccc69e2e607f0523444295b1623c9294d41bc795dda68c1e18a015cebd8228da851b6ef', 1, 11, 'ONCOassist', '[]', 0, '2020-02-27 12:12:30', '2020-02-27 12:12:30', '2021-02-27 12:12:30'),
('ca6f66b75306467683e8e46dfd325bddedbd4aefb63359cdc359d661f56f050aaf7de9930f2d85fb', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:29:55', '2020-01-17 00:29:55', '2021-01-17 05:59:55'),
('ca74b05c69085a4b27c2c4023c88d604e3a9051b7dda8c177ac5193154671dfed6644f637a81f85d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 05:41:06', '2019-11-06 05:41:06', '2020-11-06 11:11:06'),
('ca975237e6fc8b3ada0cfacfc6c43c23bc463618bcbe12eddc01c25fb2b35ef1b5ccbea222859f14', 1, 11, 'ONCOassist', '[]', 0, '2018-11-29 07:59:37', '2018-11-29 07:59:37', '2019-11-29 07:59:37'),
('caade97318f9d7dc30cbef9c4dda89b9dd7eefaec38e638a38c103d20c48dbe3b2dcffd6a97b764b', 1, 11, 'ONCOassist', '[]', 0, '2020-04-10 10:09:26', '2020-04-10 10:09:26', '2021-04-10 10:09:26'),
('cb4c8369bf168eedf593fd2c001f729511e42e957ff9c70159e3438bd0a4e6666a23a7a97127a36c', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 05:06:57', '2020-01-16 05:06:57', '2021-01-16 10:36:57'),
('cb52298dc9c361144f08e065c2ebbcaa9ac884be6439a8c6ef8c8afee3cad441a9f3a8aa84eb3878', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 23:23:40', '2019-11-05 23:23:40', '2020-11-06 04:53:40'),
('cb64fa7fa6fe9369ad5079f6a33038246ea6a725d51964185df4c42758249f7a9d63fe9946bd84dc', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 10:01:35', '2020-04-20 10:01:35', '2021-04-20 10:01:35'),
('cbe10983a5f63afb341e1cfb5cf5921554fb962711f2dfb14877ebc87f70350ac34ed3dab9205758', 1, 11, 'ONCOassist', '[]', 0, '2019-01-17 12:52:28', '2019-01-17 12:52:28', '2020-01-17 12:52:28'),
('cbfe50745f43613d6a604cfd3204c7eebc41c249b885c80d7a6203def1260b56728749a86d05a463', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 07:01:49', '2020-01-16 07:01:49', '2021-01-16 12:31:49'),
('cc284850dbdd9686c8a0f7d4a14f6f8fead5b5c63c61487c8925592a6662adada1c181c7b81f1a3f', 1, 11, 'ONCOassist', '[]', 0, '2019-03-29 09:20:41', '2019-03-29 09:20:41', '2020-03-29 09:20:41'),
('cc46659d4a201e6cddcc1eb526e3dff3e9e56df1f7b579d5b472f05afcef00b5776af4e2bf33b79d', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-12 23:41:58', '2020-01-12 23:41:58', '2021-01-13 05:11:58'),
('cc8db2981a07f3aa5ec3cc7904d055aafb9a5993493de2bbd0579a22f32d8860f23e88b194a567b7', 1, 11, 'ONCOassist', '[]', 0, '2020-05-06 13:04:39', '2020-05-06 13:04:39', '2021-05-06 13:04:39'),
('ccd6283ddabbbc0d99352c7ee01f270f245a503617a841be87d70c8fa7738b790c73ebd56ac46c56', 1, 11, 'ONCOassist', '[]', 0, '2019-01-26 17:54:12', '2019-01-26 17:54:12', '2020-01-26 17:54:12'),
('cce060724db669747767e89d011ccfe5bf8eea496f4b0266852d5fe7dea83492899553e477c14072', 1, 11, 'ONCOassist', '[]', 0, '2019-04-10 15:31:57', '2019-04-10 15:31:57', '2020-04-10 15:31:57'),
('cd1209a4ce15ad78a6ff370e62548fadd759817d90371c41e0209fdd2d58214582a5dc8f9ba117e6', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:10:36', '2020-01-15 03:10:36', '2021-01-15 08:40:36'),
('cd4e22822cb7b9cad3656adb6a390bb32f22ec21dfe9c345d09b5ae4d549f02ab09177ee12baa186', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 11:35:09', '2019-02-12 11:35:09', '2020-02-12 11:35:09'),
('cd79c33bf41c115569ea5fb50e5195c73c044c7dde133dd321c912cb192f64e4ff770c145fa6d8e0', 1, 11, 'ONCOassist', '[]', 0, '2020-04-03 05:40:02', '2020-04-03 05:40:02', '2021-04-03 05:40:02'),
('cd79ea0ce7a47f86d6b6fabeeb7e47c288e6443eb834f31fe6d57bd1a21b796ca4445d139912fac8', 1, 11, 'ONCOassist', '[]', 0, '2019-05-02 10:57:22', '2019-05-02 10:57:22', '2020-05-02 10:57:22'),
('cd8dab3d530453872019d9a81535d0c6faf3c5f8e6acb8dd8584edf55d9e6476271a0cfb2afa09d2', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 11:09:06', '2018-12-18 11:09:06', '2019-12-18 11:09:06'),
('cd91ae859d0c5ba794e860fe1b75dca0346a7e143f185741065e1de96a91d1bd2e48493187ca4b88', 1, 11, 'ONCOassist', '[]', 0, '2019-02-18 12:50:28', '2019-02-18 12:50:28', '2020-02-18 12:50:28'),
('cdb43bacd0e19d5e5a6688d6756fe9ae2a7dcfdce5563b8a7ed14fe0757e8dcf93829c3a218dba6d', 1, 11, 'ONCOassist', '[]', 0, '2019-01-28 04:52:46', '2019-01-28 04:52:46', '2020-01-28 04:52:46'),
('cdc0cdedce49eb6d537f899b00b549256abc3b4e0193dad8bd641e15a8099368ddc586d759fcd07b', 1, 11, 'ONCOassist', '[]', 0, '2018-07-27 07:03:27', '2018-07-27 07:03:27', '2019-07-27 07:03:27'),
('cddb01dd352218e7faef02dda4cc4c4271183ea61279645bbc267b8012612a4ffc673ed36781276c', 1, 11, 'ONCOassist', '[]', 0, '2018-08-20 08:37:54', '2018-08-20 08:37:54', '2019-08-20 08:37:54'),
('ce1126b2f3b70e6bc9f4f734d2acb68ffde3f2cfd3a3ba78e38a6a87fee6c36f9d88669f071cf6a9', 1, 11, 'ONCOassist', '[]', 0, '2019-02-08 10:48:03', '2019-02-08 10:48:03', '2020-02-08 10:48:03'),
('ce1edf85bd513e61c0dcf374a1d5955fd239d2dc43629c1efef3da97d1ba6afebca0c5f6f65b8574', 1, 11, 'ONCOassist', '[]', 0, '2018-12-17 10:51:31', '2018-12-17 10:51:31', '2019-12-17 10:51:31'),
('ce516741514b1b70bee13731bcddf908a930b2d9958b9fcf669aa51a9a178f8b6de6fae6a885cfa7', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 07:28:39', '2020-01-15 07:28:39', '2021-01-15 12:58:39'),
('ce5f3b79c8b3745b8373d40abe1d15e2458f2e92eb9a5105f51acf3a268ce5f517af8e8a4e6b8b30', 1, 11, 'ONCOassist', '[]', 0, '2019-07-18 06:24:42', '2019-07-18 06:24:42', '2020-07-18 11:54:42'),
('ce5f4ceca08d89baf3d833d137af653607dafd0cc5d784892a61b231115de4d66b294bf6cfc70ffb', 1, 11, 'ONCOassist', '[]', 0, '2019-02-15 12:21:44', '2019-02-15 12:21:44', '2020-02-15 12:21:44'),
('ce9816d849f98b4474a0d1d778264443d6d5e9869d088a5f558b2411557973fb22e4caca49c7f3d8', 1, 11, 'ONCOassist', '[]', 0, '2018-11-28 12:10:21', '2018-11-28 12:10:21', '2019-11-28 12:10:21'),
('ceac7c9396a769c354fb746eb62958f59e08b29115dc1017df24bfdca5bcac8bd98539a571e6d419', 1, 11, 'ONCOassist', '[]', 0, '2019-05-17 01:05:54', '2019-05-17 01:05:54', '2020-05-17 06:35:54'),
('ced2c913e491c52850f412b66de6570250b81cfa8e682c8b76478ebe66883292a1984472c2a4ff50', 1, 5, 'ONCOassist', '[]', 0, '2018-05-28 23:48:31', '2018-05-28 23:48:31', '2019-05-29 05:18:31'),
('cedea64ec41b3616f72f378587483f40a941058f8fbb5335fe4fda46f13381e4f5a56aa85c2be644', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 06:55:57', '2020-04-20 06:55:57', '2021-04-20 06:55:57'),
('cee79d0311cc2184afa1e8496a27a7e94e1d3840143d44d1140b340b42558d2537da90c104588a29', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 07:10:15', '2020-01-16 07:10:15', '2021-01-16 12:40:15'),
('cefbd7f695305906f410e102e1044fd3bf0b3fe3b70b5bf1470930615fb9c397eabc61c79a5e7015', 1, 11, 'ONCOassist', '[]', 0, '2018-09-17 11:42:09', '2018-09-17 11:42:09', '2019-09-17 04:42:09'),
('cf403eea051532bb3e601a6864f9a92efcd8c3c210bc89295c62736ac0f6cde04febc0a802ca635f', 1, 11, 'ONCOassist', '[]', 0, '2019-03-12 09:14:03', '2019-03-12 09:14:03', '2020-03-12 09:14:03'),
('cf5d41bb46b3d9bc89acc01041a4a1c237c8e9fa180f03f8814d326e1b25a9ffbc877f167936db13', 1, 11, 'ONCOassist', '[]', 0, '2019-03-06 09:17:25', '2019-03-06 09:17:25', '2020-03-06 09:17:25'),
('d02a4fd16aae90aa8ca7ad454ed6b82c4c7f398b4fe99cb61051e79ba121556f458ca6475ee95e82', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 07:00:22', '2018-12-04 07:00:22', '2019-12-04 07:00:22'),
('d0bffef47a1f4d823a7d0148bd951fbbad9548daade64fbbd1b52c516b34cb130e51a6c2d7a6d639', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 02:54:23', '2019-11-06 02:54:23', '2020-11-06 08:24:23'),
('d0cca058d91a93265616ee91be1904e513c5878f7f157cb76151a4be806d77678fb9626ddcb925a9', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 09:20:18', '2019-02-12 09:20:18', '2020-02-12 09:20:18'),
('d0d0cd5c4d11eab5da539b864630e7410e23cdebc5d96e0866c381728dbaff3e604a334d03852c63', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:33:47', '2018-06-18 00:33:47', '2019-06-18 06:03:47'),
('d12e0778a076431aeffbb78f9b582490f5efee786f75a22b7ea461f9aa52cb2dd066de22d411aaf0', 1, 11, 'ONCOassist', '[]', 0, '2020-02-26 13:57:36', '2020-02-26 13:57:36', '2021-02-26 13:57:36'),
('d1891250516ee85d0d74565efaf02993ccac5253f299d9c0afe17d859bc2bad8eadbcf25f80ad524', 1, 9, 'ONCOassist', '[]', 0, '2018-06-17 23:10:50', '2018-06-17 23:10:50', '2019-06-18 04:40:50'),
('d1b3442996f9e687b60c284dc70cdcf5d4e7762032b27ca50d9de0b006edbd71e11461a05e65cf8d', 1, 11, 'ONCOassist', '[]', 0, '2020-03-06 08:15:52', '2020-03-06 08:15:52', '2021-03-06 08:15:52'),
('d1e69d16e081276f70b58717074464e80e7992a2254e99d7afbcb3f826fb818191445867f3145847', 1, 11, 'ONCOassist', '[]', 0, '2020-05-06 12:46:28', '2020-05-06 12:46:28', '2021-05-06 12:46:28'),
('d1fb620507922cc2c9776cd1c1d3134e6cf4c57634aae2778a0d2f75721292ba91b8d169dc6b9310', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 11:25:00', '2019-05-09 11:25:00', '2020-05-09 11:25:00'),
('d23d8c641abbcafcd399519208d61905d00e4c2de761e248c6d7be609255c690c0680f6224fc6aac', 1, 11, 'ONCOassist', '[]', 0, '2020-01-02 05:17:54', '2020-01-02 05:17:54', '2021-01-02 10:47:54'),
('d2ab4c490866de06b1c6016a5efd0702eae72d5280dee27d5aca9fe96a2a9db08bb353c681e0e7fe', 1, 11, 'ONCOassist', '[]', 0, '2019-11-11 07:52:27', '2019-11-11 07:52:27', '2020-11-11 13:22:27'),
('d2cbcad5cf85013a51688f81745717785f6374c050dee74802cccaad93fe898beb75ae82e017ef53', 1, 11, 'ONCOassist', '[]', 0, '2018-12-10 11:23:58', '2018-12-10 11:23:58', '2019-12-10 11:23:58'),
('d2dbad6d2081564a6cb0bb4f9d848144780b0e736790ec9afd8c671641ba878eef645602acd226a8', 1, 11, 'ONCOassist', '[]', 0, '2019-11-11 03:00:16', '2019-11-11 03:00:16', '2020-11-11 08:30:16'),
('d30750bd6436ea53643b204b198c8f975b763b01f4a7c648f543ae07e22052e779c142300bbad33c', 1, 11, 'ONCOassist', '[]', 0, '2018-08-22 10:39:42', '2018-08-22 10:39:42', '2019-08-22 10:39:42'),
('d310dddf3298bb63788aa8b28fc298f493c5da3a4d34a8e86520c2d65faf7de3a0737d35d9d34e0b', 1, 11, 'ONCOassist', '[]', 0, '2020-03-05 11:33:16', '2020-03-05 11:33:16', '2021-03-05 11:33:16'),
('d3cc085e2e5515139cf21cd13dcee57b75fca38c07775f9be3122b99888a2c15a6ad6ce4d7c01414', 1, 11, 'ONCOassist', '[]', 0, '2019-10-31 22:59:01', '2019-10-31 22:59:01', '2020-11-01 04:29:01'),
('d4835c155344562b206016b55de7ec24c6e606675102ceea2cf8a3e09da79ed514a89dff3fbeb6ef', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 06:01:19', '2020-01-15 06:01:19', '2021-01-15 11:31:19'),
('d4924d0ea9f0c24712bfde42107666e034983a9b08e7266759fe3ee773a6aee768b6eb8b34f3970f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 02:44:43', '2019-11-05 02:44:43', '2020-11-05 08:14:43'),
('d4b3c068608f9b53b3c5f5103bb41dbe5638859be01e26c51a75735c7cd7b49594ee4c95a3d5a05b', 1, 11, 'ONCOassist', '[]', 0, '2018-12-29 07:49:48', '2018-12-29 07:49:48', '2019-12-29 07:49:48'),
('d4b9ee7b064b93ffd5af00bb9a8d6206b690145c97a3f8650e9e6fc6719cc2315c93862d3cf192dd', 1, 11, 'ONCOassist', '[]', 0, '2019-06-05 08:22:00', '2019-06-05 08:22:00', '2020-06-05 13:52:00'),
('d4c3da0149cd134d270134f1249a6757783edb34aff3c7b8c126577e71472611f31831d34289fa9b', 1, 11, 'ONCOassist', '[]', 0, '2020-02-29 12:33:40', '2020-02-29 12:33:40', '2021-03-01 12:33:40'),
('d4c8d71868097498a7564ea8c3d9d5ea705537208785bdd8044c0cd19935928d1e9636053e6dcfbb', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 06:39:22', '2019-11-22 06:39:22', '2020-11-22 12:09:22'),
('d4f0054cbe05a2a74caa4b66a05a0a31e83fe845d85dd5b633c1d7dfeaafa27982f5bb3903c1a373', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 06:18:34', '2019-11-21 06:18:34', '2020-11-21 11:48:34'),
('d4feb9eb4e62e1145e8a9281b6e94555bd302faa7f38bfe7f7cce98b1d1e6da6bd32449d468db3b9', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 08:09:33', '2019-05-09 08:09:33', '2020-05-09 08:09:33'),
('d54772c2a3c203d9fe72c4c7e19b6dfb0332a0f89a23ffa27c6839aef1803f3b95769ce6ffd5dc39', 1, 11, 'ONCOassist', '[]', 0, '2020-02-21 04:10:50', '2020-02-21 04:10:50', '2021-02-21 09:40:50'),
('d563893450182b7912324ae92c0d72473332764e4293df34d518402fb5d417af341a3be265ddeb56', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 13:16:11', '2019-02-12 13:16:11', '2020-02-12 13:16:11'),
('d56b3b362a8f626518f0733a65cf1c697ce484b2b281b2fe2e18cffedfc64b68a1b4e3304c907657', 1, 11, 'ONCOassist', '[]', 0, '2019-10-22 04:06:45', '2019-10-22 04:06:45', '2020-10-22 09:36:45'),
('d58ef91f343b20d837b1082933e4558e92a79565e6931b2aa7d0144d4063d3eb5978e0021d816d04', 1, 11, 'ONCOassist', '[]', 0, '2019-02-11 09:19:48', '2019-02-11 09:19:48', '2020-02-11 09:19:48'),
('d5a304e636c8acf8736c0ed9c219d0a23579930b5d4c0f7a3f8318ee770995d333a156c0aac654e0', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:47:29', '2020-01-15 03:47:29', '2021-01-15 09:17:29'),
('d5a4c58c8f4c74c15d91187ba90db59ad17f9ad6618ac6886c764891679425da5a703d1eda4a49b3', 1, 11, 'ONCOassist', '[]', 0, '2019-04-09 13:56:40', '2019-04-09 13:56:40', '2020-04-09 13:56:40'),
('d5d5155ac762465b79fb6b77d16f65374974bebcbb2814593196e8ef355849b278b4c1358140dd4f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 05:59:09', '2019-11-07 05:59:09', '2020-11-07 11:29:09'),
('d65c04288f70ac1e1366d73eca79900154631e3a5ae4b1af6121a91e808801af175f187780bcde4d', 1, 11, 'ONCOassist', '[]', 0, '2018-12-14 11:31:40', '2018-12-14 11:31:40', '2019-12-14 11:31:40'),
('d6a01028d19a62fc568711016636642964e4336fce4a5f6cb443073c069fa46450ca59c687c16ac5', 1, 11, 'ONCOassist', '[]', 0, '2019-03-21 18:32:08', '2019-03-21 18:32:08', '2020-03-21 18:32:08'),
('d6f62a79cc347ce661fc5384d2ff9894cae55116f034bcb28b15f1be04200e4c5048e41c0a9b979d', 1, 5, 'ONCOassist', '[]', 0, '2018-05-29 03:39:54', '2018-05-29 03:39:54', '2019-05-29 09:09:54'),
('d706083ce6431ef459388b0378a1f42a17f130886fc112b3b274910560665963ad4f98eb086fde9b', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 03:57:10', '2019-11-05 03:57:10', '2020-11-05 09:27:10'),
('d75629fa9ccfd6b2c0b72f6d44eb913be8cff4325615a06c060935960322b3900efb3dc5505482c6', 1, 11, 'ONCOassist', '[]', 0, '2018-07-27 06:52:40', '2018-07-27 06:52:40', '2019-07-27 06:52:40'),
('d7963af875acfdc1b72b9700d2a5b15d65c06c20b854dbd0b6989878fbdd4d23e4fba9008ece09d3', 1, 11, 'ONCOassist', '[]', 0, '2019-11-20 02:40:47', '2019-11-20 02:40:47', '2020-11-20 08:10:47'),
('d7c528e81ff9fd23c6f08316328b4a4025e7f761639249bdf0cf164bdb9ad8e22f393292f18aefae', 1, 11, 'ONCOassist', '[]', 0, '2019-02-11 10:00:33', '2019-02-11 10:00:33', '2020-02-11 10:00:33'),
('d7de9e6841353a782ec6943b9080a645d0d9367c1529c1e1a616cd40289a983d6da2922ec3c721a0', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-12 23:10:12', '2020-01-12 23:10:12', '2021-01-13 04:40:12'),
('d7f13313c0e9ce73e6b5da286ae486d935353f89308cd0557a319fcbc9d692cf25f87aa8fd6a615f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-20 23:35:50', '2019-11-20 23:35:50', '2020-11-21 05:05:50'),
('d80e30b99603e4fba9be325e7761755da0e35179ce589781f0669dda6b262bcddf72e931c46246f5', 1, 11, 'ONCOassist', '[]', 0, '2020-04-17 10:04:18', '2020-04-17 10:04:18', '2021-04-17 10:04:18'),
('d81f31a9ad32c3a869549d2a186da36a5461e494d61e700630438fd01f41bdf05a711181064765f8', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:34:34', '2019-11-22 00:34:34', '2020-11-22 06:04:34'),
('d82d7c36ec7e3632fa93e9ef48a92a55f91b88296cfd9bba5a2a375f11c262ded709d1e3b5ab98a7', 1, 11, 'ONCOassist', '[]', 0, '2019-04-01 15:44:39', '2019-04-01 15:44:39', '2020-04-01 15:44:39'),
('d83f00e0ad08442b8b2d9f4b7f23aeae401f861efa4ee573635d0a5b5232a0110147655aaa580fbf', 1, 11, 'ONCOassist', '[]', 0, '2019-01-17 12:19:15', '2019-01-17 12:19:15', '2020-01-17 12:19:15'),
('d8475c9820e3cb6e59dbbd0e7e63adb2700038bc15766a901070c0cd23f55f620b4261da9f0e2ed2', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 14:49:23', '2019-02-12 14:49:23', '2020-02-12 14:49:23'),
('d870855fb40ec91a23d891dd6df39cd5f0b03ede5e48ab0c37d27354fe50bd71103322129ed5cae2', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 05:57:30', '2020-01-16 05:57:30', '2021-01-16 11:27:30'),
('d876bd9141fc2d76220da62220ab6a6768671d8f44d40ff62dea7e307408266d99f182913f5d3bfd', 1, 11, 'ONCOassist', '[]', 0, '2019-05-01 08:27:38', '2019-05-01 08:27:38', '2020-05-01 08:27:38'),
('d89be9ad665b2847462a435735513661892313a0ec922089db702ac33160739a0dd0931b92933520', 1, 11, 'ONCOassist', '[]', 0, '2020-04-29 13:38:03', '2020-04-29 13:38:03', '2021-04-29 13:38:03'),
('d8a3708631c957dd84eefbb30de95afe7b8bc88258f5d024fc8b453f7d037fdb8f1f254e2c180eb1', 1, 11, 'ONCOassist', '[]', 0, '2020-01-02 04:40:58', '2020-01-02 04:40:58', '2021-01-02 10:10:58'),
('d8d7e24c615358edc3fe32c31e4eb958bcd341be3ce333a182e41dbb496257755bdb20551f0637de', 1, 11, 'ONCOassist', '[]', 0, '2019-05-10 13:30:43', '2019-05-10 13:30:43', '2020-05-10 13:30:43'),
('d9067fff18c3b1752b468fea028b793ea4d16e577cfc2aab4fbb66eacc2b5f9745fe609fd2ab8b4d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 03:51:57', '2019-11-04 03:51:57', '2020-11-04 09:21:57'),
('d97bcec403154c31926a2ccdd019651cef0cd9e0a057fbee017682a6eb080484b089ef6e3aeb4810', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:33:51', '2018-06-18 00:33:51', '2019-06-18 06:03:51'),
('d980a848cee636365b0240575047856e710372414aab064eaa8b722602cfac0be9eb651e323099e3', 1, 11, 'ONCOassist', '[]', 0, '2019-11-18 07:20:31', '2019-11-18 07:20:31', '2020-11-18 12:50:31'),
('d9f6d3900c19b6d09bf873724badc7d69bb16bfeda3751c616dfd2aae59747dc9dd51782a3d0bc70', 1, 9, 'ONCOassist', '[]', 0, '2018-06-16 01:47:52', '2018-06-16 01:47:52', '2019-06-16 07:17:52'),
('da2acb70e81f5c09c032e5aa151c480932a429121760753d2a89b1e1587fa52e12e4d24e2912a211', 1, 11, 'ONCOassist', '[]', 0, '2018-09-14 15:55:34', '2018-09-14 15:55:34', '2019-09-14 08:55:34'),
('da41b1c3511e1d19136a030434248b71c2b3c0c22439cc0a09453f098d71be883d52ee0e47a854d8', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 00:33:01', '2019-11-07 00:33:01', '2020-11-07 06:03:01'),
('daa6242543df917a353205c023defe360d06b5166451f77476de77849605b84e1cc40c2b842b54fb', 1, 11, 'ONCOassist', '[]', 0, '2019-03-21 18:18:16', '2019-03-21 18:18:16', '2020-03-21 18:18:16'),
('db22fdfc723ad54a8d1251f79c29a4223e9fc45e8825e0e2fc7309e99fc1dbe15468e9edb3b9784c', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 09:34:22', '2018-10-29 09:34:22', '2019-10-29 09:34:22'),
('db31ec37613970fd3d493ab43d6ab6976d5bf92233c3443bfd52d678105053189a8063cd07b0c790', 1, 11, 'ONCOassist', '[]', 0, '2018-11-28 12:51:44', '2018-11-28 12:51:44', '2019-11-28 12:51:44'),
('db6321f2499833448be5ea62dcd999615d6e2ac6c5ee4a2fbce5f81308f0ef95b0b421af645131da', 1, 11, 'ONCOassist', '[]', 0, '2018-11-23 10:14:14', '2018-11-23 10:14:14', '2019-11-23 10:14:14'),
('db8ea26dca851b0b370f32660643314313690bfdb29a14ddffc9b34fa181afe9de03bde6af145c98', 1, 11, 'ONCOassist', '[]', 0, '2019-03-21 18:34:47', '2019-03-21 18:34:47', '2020-03-21 18:34:47'),
('dba702bff3cc999aea7d14efef4df00054929022e2ada5cffdd6ceb41a7b085e6916dd69c537db37', 1, 11, 'ONCOassist', '[]', 0, '2020-04-20 12:50:56', '2020-04-20 12:50:56', '2021-04-20 12:50:56'),
('dbabb2aa018628a0184339c984d0f7ef5425ebb3c4e1a438b05d11616e8cfc94a98d037b2af60419', 1, 11, 'ONCOassist', '[]', 0, '2019-01-22 09:09:09', '2019-01-22 09:09:09', '2020-01-22 09:09:09'),
('dbd818dc7ed85bd8582cc9703a410cf6e5d6585ddf9273a7573e7b1e19ccb293853527acaa5e10f7', 1, 11, 'ONCOassist', '[]', 0, '2019-01-03 09:51:53', '2019-01-03 09:51:53', '2020-01-03 09:51:53'),
('dc959ea19be4d154e6b98f38bfa1382c8072f639ffa7487ffdf653bb14ef8293212890139917ffe4', 1, 11, 'ONCOassist', '[]', 0, '2018-11-30 14:59:03', '2018-11-30 14:59:03', '2019-11-30 14:59:03'),
('dcb6e60e5193044ded58fd00498dd270b3c50b4a72dea1d43b847e5c2a70254a27e51c6b6210b75b', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 12:56:22', '2018-10-30 12:56:22', '2019-10-30 12:56:22'),
('dceea27aa158dbdcd4d8aa5e0d7a3cef3cfecfd15124c49232ee72a19e383a36a1bdee3d089f4ab0', 1, 11, 'ONCOassist', '[]', 0, '2019-04-09 08:07:23', '2019-04-09 08:07:23', '2020-04-09 08:07:23'),
('dcf3074f8aaa8e78f43a4761c2b4b273cc2877ccdb05c61f61af336c38ea0120fec7e059e751f21a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 01:32:30', '2019-11-06 01:32:30', '2020-11-06 07:02:30'),
('dd0574a51ba8e8cba7547b6ae05a634381ad29d39df1b7f45c8b5873bda874338699ff82a98e3ad2', 1, 11, 'ONCOassist', '[]', 0, '2019-02-25 15:52:50', '2019-02-25 15:52:50', '2020-02-25 15:52:50'),
('dd2d750bc325b52fa72434dfdc6528a2feea4b818820e825aa5da6478b557a118404b51132aefac4', 1, 11, 'ONCOassist', '[]', 0, '2020-04-10 07:37:52', '2020-04-10 07:37:52', '2021-04-10 07:37:52'),
('dd3440096c2e9ff774805bb5884bf68c07f4004874502bbf10bff2351dee1fb8f9650b72dee21898', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 13:47:00', '2018-12-18 13:47:00', '2019-12-18 13:47:00'),
('dd53a79d0ef8939d052d627d64b9bc2c27059d6535295e75d009c95cc58caa0b09eed4fa84e9f493', 1, 11, 'ONCOassist', '[]', 0, '2020-04-29 11:10:54', '2020-04-29 11:10:54', '2021-04-29 11:10:54'),
('dd855a5550a3ca588d07349c8d8e58f8bed8384a64c4d1e710a2a328b877823ef5c27514a144dbae', 1, 11, 'ONCOassist', '[]', 0, '2018-09-13 16:50:33', '2018-09-13 16:50:33', '2019-09-13 09:50:33'),
('dd8f94c35369d2481b1de2ced8c302ba482b817cf9657cc2758311806cd0c92814913bddcba3cd18', 1, 11, 'ONCOassist', '[]', 0, '2020-05-07 06:03:14', '2020-05-07 06:03:14', '2021-05-07 06:03:14'),
('dd979cb7616ca388f32c11e5b08bc846725a6345656d20234f68a21ed2b2fad1f4e92afa337a42ad', 1, 11, 'ONCOassist', '[]', 0, '2019-04-02 15:55:43', '2019-04-02 15:55:43', '2020-04-02 15:55:43'),
('dd9efc5368051a21a753db33a0df275f41b905ae958e1276d200f116448488be59c7698f2e3ca96d', 1, 11, 'ONCOassist', '[]', 0, '2019-11-26 08:28:55', '2019-11-26 08:28:55', '2020-11-26 13:58:55'),
('dde8eefe17e0d938347e2ed3ba548a674d12e2e4ba6881ab66a69deec34a1de6dd35d8d6f2ff37c1', 1, 11, 'ONCOassist', '[]', 0, '2019-01-28 08:41:06', '2019-01-28 08:41:06', '2020-01-28 08:41:06'),
('de166a151a3d54570cdd6e131415d99227ee980395117166c63644c000349e8a2adc41ff9b84f2bd', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 07:06:16', '2019-11-04 07:06:16', '2020-11-04 12:36:16'),
('de32b53a50aa436c51f8e396e018324314d8fe3b74b922e629c75d1984c3e193d23804f79ca52b9e', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 07:05:37', '2019-11-04 07:05:37', '2020-11-04 12:35:37'),
('de7c2ab371b825adea662ba1b3ba974a02b6ff684b844ddcc4771b9822de0972821f5ab1fc027dc2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 02:30:37', '2019-11-06 02:30:37', '2020-11-06 08:00:37'),
('dea4b218f85ee8cb8490ac535c0d79741f54e4f082e455c27b87ef7c94c6ef481b7623ecc381ef32', 1, 11, 'ONCOassist', '[]', 0, '2019-01-23 05:44:39', '2019-01-23 05:44:39', '2020-01-23 05:44:39'),
('df48e23067b55f718cf79232b0db2e7e4e3eaaa710ca404fef8a3492cf5e9feeb5709f764d4fdb64', 1, 11, 'ONCOassist', '[]', 0, '2019-10-25 07:41:36', '2019-10-25 07:41:36', '2020-10-25 13:11:36'),
('df506ffa284d3db77aeb5d7b8bb7ae8c52a495fd9d28e7b0737909628d8bdb49c039bb85d31906af', 1, 11, 'ONCOassist', '[]', 0, '2019-01-31 12:12:59', '2019-01-31 12:12:59', '2020-01-31 12:12:59'),
('df585d5fe4f42e31d8f629e3c2f10dbaaa3f6fb4d01c4eadd10e320bc1899b9d4aaa69ee6664a5c4', 1, 11, 'ONCOassist', '[]', 0, '2019-06-03 06:52:39', '2019-06-03 06:52:39', '2020-06-03 12:22:39'),
('df68a291224de87228ea5105641a3178e41359e3705bfc9e970e9c570dfe1e04ff73bbde2117bd0a', 1, 11, 'ONCOassist', '[]', 0, '2019-03-20 09:10:34', '2019-03-20 09:10:34', '2020-03-20 09:10:34'),
('df895e995bcb75f53ca0a19c7382c94206d605411974e3b807cc03b52d1ed84608f2c901d841e3e0', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-10 08:26:01', '2020-01-10 08:26:01', '2021-01-10 13:56:01'),
('df8c4aaa52469e8d3da596d40549eb3ee9071e304cd8d16025911cb59247a7ab37abf283382d7bcc', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:03:49', '2020-01-15 03:03:49', '2021-01-15 08:33:49'),
('dff23e93616306e8b1499b4aca7391508c78d37524bbb019de2ad328be43b94b484f9b855c3dd117', 1, 11, 'ONCOassist', '[]', 0, '2019-04-15 08:53:46', '2019-04-15 08:53:46', '2020-04-15 08:53:46'),
('e00ce54167c5c39844791f61df12f8d5fda5570306dbc73b836bfe405940b2b3fb732b6234902d15', 1, 11, 'ONCOassist', '[]', 0, '2019-11-01 02:57:22', '2019-11-01 02:57:22', '2020-11-01 08:27:22'),
('e00ea86bc08b349fcccd84d7a32ca82dd4e582a74108de4cef45384a861befe9179b50996ebb3c7f', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 00:43:26', '2019-11-07 00:43:26', '2020-11-07 06:13:26'),
('e02e6c0a5d62fe866dfdd798963f7cb9c0c4dabc3cedca2d6a265ed85300b094da7c67491d5ec988', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 06:42:48', '2019-11-22 06:42:48', '2020-11-22 12:12:48'),
('e03d705f5c12c4f4450d73256c6c852560ea70a9e45af1f0f649ea5c6fede4829593065e22602541', 1, 11, 'ONCOassist', '[]', 0, '2019-02-08 10:32:28', '2019-02-08 10:32:28', '2020-02-08 10:32:28'),
('e08bd5b8bf990183ba4ac6e3cbdb00c0147ba6257be71db3f5609d9511133ccf2645a0664123062b', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 23:45:02', '2019-11-05 23:45:02', '2020-11-06 05:15:02'),
('e0e4f6caac2a83fd4b2ed6472c750885a364bf793efc67a74208852deba7f86e3aa85892f685bdea', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:07:53', '2020-01-16 02:07:53', '2021-01-16 07:37:53'),
('e0f1967cbfc4627114e94f963bde0b45dafa86f8d24061ccbdc81bf7117a0584deb336d4156124c9', 1, 11, 'ONCOassist', '[]', 0, '2019-10-30 00:00:34', '2019-10-30 00:00:34', '2020-10-30 05:30:34'),
('e123641163464be64891f5653b70f15b5b4e8fee7755eb718e1ebf70036e8bc9fe562a9533a6930e', 1, 11, 'ONCOassist', '[]', 0, '2019-05-08 17:06:58', '2019-05-08 17:06:58', '2020-05-08 17:06:58'),
('e16ed863e5dcc9ec50f41affb4a4f36e00630ae33b6b899aa5e4baf3a80dd4d5d20c9fd65d8728a7', 1, 11, 'ONCOassist', '[]', 0, '2019-03-22 09:06:05', '2019-03-22 09:06:05', '2020-03-22 09:06:05'),
('e1ae4626781e87b750e11b97c3b8f6e605f037944b27212f9635d730ee5febcf05f391a08bfe5bd5', 1, 11, 'ONCOassist', '[]', 0, '2018-10-08 09:04:26', '2018-10-08 09:04:26', '2019-10-08 09:04:26'),
('e1f992c793ac636870daa186b8bb4b8a26cf5cd96559dda14912012db18d62394b8ad3a019a269c3', 1, 11, 'ONCOassist', '[]', 0, '2019-02-15 09:34:09', '2019-02-15 09:34:09', '2020-02-15 09:34:09'),
('e208a0ca9a2b0ba49e7b5d0792564c755ce8752f35a05dcde62e5a42566f5062993e13ebcdb9c17e', 1, 11, 'ONCOassist', '[]', 0, '2019-05-02 08:42:49', '2019-05-02 08:42:49', '2020-05-02 08:42:49'),
('e21266eb38d990aa7145680715760620bf98130055d3a13789834e77f4127c540d43b2079f90010a', 1, 11, 'ONCOassist', '[]', 0, '2019-03-22 16:35:42', '2019-03-22 16:35:42', '2020-03-22 16:35:42'),
('e23b53a3afc7db23f39e0305c060fa94ffb311fc0fbb7595dc71a0f62d815072b830e29aecbc322a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 07:43:41', '2019-11-22 07:43:41', '2020-11-22 13:13:41'),
('e258aba69b223526798a847243795a4638c483230214a8badc6b31500a49d8eb0d0327844425c45e', 1, 11, 'ONCOassist', '[]', 0, '2018-12-19 08:26:26', '2018-12-19 08:26:26', '2019-12-19 08:26:26'),
('e25ecb494143fb8e231e7ee5f6ce5bf62d40b6ae3a32ef6ec4f2e5436599551c96da867130541e55', 1, 11, 'ONCOassist', '[]', 0, '2018-10-02 22:52:40', '2018-10-02 22:52:40', '2019-10-02 15:52:40'),
('e26df1a6ca96162aa659359d5719e408a5caf3e3053f136a983ac1c0fdabd1635b5009377b0bbb4b', 1, 11, 'ONCOassist', '[]', 0, '2018-11-05 04:17:48', '2018-11-05 04:17:48', '2019-11-05 04:17:48'),
('e274bc58f0646b05b824b180175458d1e75920f662fd971a217c850ff103089ac12da13468ec7fd4', 1, 11, 'ONCOassist', '[]', 0, '2019-02-12 09:26:27', '2019-02-12 09:26:27', '2020-02-12 09:26:27'),
('e2ec09e76552be6c6664520fac89bdf79a2c8db68f2c4260e978fcdc835548075bfb147692286c52', 1, 5, 'ONCOassist', '[]', 0, '2018-05-30 05:30:31', '2018-05-30 05:30:31', '2019-05-30 11:00:31'),
('e32be219fba02880fa34b0501602973c7081d4668ea4ff9d16baff8932dd2a5aab5965a07fbc2db6', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-12 23:36:49', '2020-01-12 23:36:49', '2021-01-13 05:06:49'),
('e3506f72bbc51ea8283ff382448dcb6350e1d8c4364e0b002bece58ca26dbb1ef736fe1c5939c877', 1, 11, 'ONCOassist', '[]', 0, '2019-06-28 01:58:57', '2019-06-28 01:58:57', '2020-06-28 07:28:57'),
('e35a661b8991d8841f56c954d4bf3811f99b67b0f2f13b746644aee4533eb24660531aea65dced50', 1, 11, 'ONCOassist', '[]', 0, '2019-11-26 05:36:19', '2019-11-26 05:36:19', '2020-11-26 11:06:19'),
('e360fc25f9075b26f44f66f24227c326a0e5726d38a3634cf330d6e4c21142227b59f553b3f2ac33', 1, 11, 'ONCOassist', '[]', 0, '2018-11-28 10:14:38', '2018-11-28 10:14:38', '2019-11-28 10:14:38'),
('e3849d7f0b3fec02a93f650955110a5e0ead5f4f06dea97ddb2ed600dc1de2e2db89f61ba4ce9e1c', 1, 11, 'ONCOassist', '[]', 0, '2018-08-02 14:41:57', '2018-08-02 14:41:57', '2019-08-02 14:41:57'),
('e39308fbd01635fe05da2e4ef08f8c80e395bdafac3985327a6b13e1cc6f9687c49c1b45757b0ca0', 1, 11, 'ONCOassist', '[]', 0, '2018-10-01 21:09:49', '2018-10-01 21:09:49', '2019-10-01 14:09:49'),
('e39dff38d2b876bcf43eb5aed6869cc575e4fac5fe3038ec6dcbd75cb62f67420a497582a85277c8', 1, 11, 'ONCOassist', '[]', 0, '2019-02-08 20:48:09', '2019-02-08 20:48:09', '2020-02-08 20:48:09'),
('e3af1e48bd76b9196ec58a009ed113e688aa8c41a4dc61d1d2a958b1476a20ababb03fa2b872edd2', 1, 11, 'ONCOassist', '[]', 0, '2020-05-22 11:44:08', '2020-05-22 11:44:08', '2021-05-22 11:44:08'),
('e3c453e4440f9f5632a1c3a37abf04cdf8c9255f9b4988f48ef5746e289c3bcb6ac9635ed7df4d9b', 1, 11, 'ONCOassist', '[]', 0, '2019-10-23 23:20:46', '2019-10-23 23:20:46', '2020-10-24 04:50:46'),
('e3d7782e030b5b64920c72755db3f4351bd9b9e1b323f62ac65a8be2ad7eeb309c6779fe26e21c32', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 23:52:17', '2019-11-21 23:52:17', '2020-11-22 05:22:17'),
('e4e4e0ae166f85d5c1d55d6c347c7fe53e4297ed54bea112c81a4e6670678a99a424437e84d8f374', 1, 11, 'ONCOassist', '[]', 0, '2020-03-05 07:49:45', '2020-03-05 07:49:45', '2021-03-05 07:49:45'),
('e522e762bbe7fa02578bf40750a95c6648b984c51d96545b469f6987d58d00a711e3c495c8769e74', 1, 11, 'ONCOassist', '[]', 0, '2020-04-03 06:03:21', '2020-04-03 06:03:21', '2021-04-03 06:03:21'),
('e544f51de857be37e3f08d1285dfe9d496f55a80b689c861dce51d8e47249668f25d5622051ba489', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 13:33:43', '2019-05-09 13:33:43', '2020-05-09 13:33:43'),
('e559ecce7dfbf0ef0689fbbc8c49b2f64a0a12b91913c0b39e05103b987bc53502194c571fd65ec0', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-22 00:30:42', '2020-01-22 00:30:42', '2021-01-22 06:00:42'),
('e5632e9b9153672cb9d4fc7d58205f247c83f42093fbeee2c70a34c167292027b4fb095d78cb5246', 1, 11, 'ONCOassist', '[]', 0, '2020-03-19 12:26:06', '2020-03-19 12:26:06', '2021-03-19 12:26:06'),
('e583459d46ea02e1b9daf37994cbd6d85ffd5ffad522ac15285fc70746d286207f502712ca4524fa', 1, 11, 'ONCOassist', '[]', 0, '2019-10-24 07:37:55', '2019-10-24 07:37:55', '2020-10-24 13:07:55'),
('e58460da11da21802c59ff8111008c55267a600401983b88924f56033e3e9b4ce0c1024a3cc04362', 1, 11, 'ONCOassist', '[]', 0, '2018-09-06 16:43:22', '2018-09-06 16:43:22', '2019-09-06 09:43:22'),
('e5a7db7d43691c8edceec8df4975fa655c1fcfaf43713d2a09e930608ea316d8c1665f4f0735a877', 1, 11, 'ONCOassist', '[]', 0, '2019-03-11 09:39:18', '2019-03-11 09:39:18', '2020-03-11 09:39:18'),
('e5bf752f0a3fdf2a2a95db0500a81683383edb5e48d60be17ae6cace901e7cc7b846f5bdb09b897a', 1, 11, 'ONCOassist', '[]', 0, '2019-11-28 02:22:54', '2019-11-28 02:22:54', '2020-11-28 07:52:54'),
('e5ec87398dc0e3bfc28aa99e2e27a8ec58dd5eb4642402c201b0b70824a16b2521c8f58d53e6a4d0', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:12:10', '2020-01-15 03:12:10', '2021-01-15 08:42:10'),
('e5f0693d0ac2925e03489e3fa4bfeb32e68b7ecd735877cca9613546613ec1972c6d43744e03ba10', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-10 06:52:54', '2020-01-10 06:52:54', '2021-01-10 12:22:54'),
('e60666c7f7390c65672bbf38a1ef54ebdb5d5824813568aae31091658f2368e873404d461e231368', 1, 11, 'ONCOassist', '[]', 0, '2019-03-22 11:01:15', '2019-03-22 11:01:15', '2020-03-22 11:01:15'),
('e6139c946c2a81f336bc7cc3c5438684ec08a4e962434de5ea63230e2bd03591ae9b2a851d5300d1', 1, 11, 'ONCOassist', '[]', 0, '2019-04-30 07:59:39', '2019-04-30 07:59:39', '2020-04-30 07:59:39'),
('e61db69a2a5f561c9bd62ea1821d93f3817b4894e42d6467ee4505bae902d2f7046444f171d78473', 1, 11, 'ONCOassist', '[]', 0, '2019-06-05 08:17:28', '2019-06-05 08:17:28', '2020-06-05 13:47:28'),
('e64a98d5c8f8c4ad8fa42ff20f4005d00df616ee69758943d4b6b68e3a601d27286405d7d50a3b3a', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:26:00', '2018-06-18 00:26:00', '2019-06-18 05:56:00'),
('e6511dfb8d0e3e1f737b8eb83ec2ff9d189c62a53ae0700b9535c5003c4714bcb41d5b7287dc4c37', 1, 11, 'ONCOassist', '[]', 0, '2019-11-20 04:15:44', '2019-11-20 04:15:44', '2020-11-20 09:45:44'),
('e655cc9d643a2b9fc43819428b9f6e7b3603df20d1499acd2f485c6df4689f33bf0b3762cbbcb40e', 1, 11, 'ONCOassist', '[]', 0, '2019-05-03 08:13:56', '2019-05-03 08:13:56', '2020-05-03 08:13:56'),
('e6710fb3e59b00de07e77bd9f3b1a0b6146904741fc98607b585b6f34fed6f205b5bf3fda93ca10b', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 05:50:52', '2019-11-07 05:50:52', '2020-11-07 11:20:52'),
('e6b596171bd06128e9baa30982f8dc3c396d56a1b0d4d82ae5cbeca6f6d75db7f251d24a5d34e96a', 1, 11, 'ONCOassist', '[]', 0, '2020-04-21 04:51:48', '2020-04-21 04:51:48', '2021-04-21 04:51:48'),
('e7151f86054ce05f66dccf9d194e99a587f09dfa13d1b7b8a3f7c82582d2051dfe2c04677383046c', 1, 11, 'ONCOassist', '[]', 0, '2019-12-19 03:34:20', '2019-12-19 03:34:20', '2020-12-19 09:04:20'),
('e715a67a3384fb50d139bad99eb9e389548f7f3905c3396869755b372b5c1b011baf79dd31363ad2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 01:13:10', '2019-11-05 01:13:10', '2020-11-05 06:43:10'),
('e76ebe3207da1bdf75c1236ebed7afd810c48e348f404bce7291039b70a0a206e48e6b7e2923fc99', 1, 11, 'ONCOassist', '[]', 0, '2019-04-01 15:45:03', '2019-04-01 15:45:03', '2020-04-01 15:45:03'),
('e782b8ab862198dd829f9b25bd34e25ee7a2423966ab42901429461c02e56f3b0a3e0348f1f1250e', 1, 11, 'ONCOassist', '[]', 0, '2019-04-08 10:50:38', '2019-04-08 10:50:38', '2020-04-08 10:50:38'),
('e7ba268c83ebc1118cdfdae545e65d344d7f9a5b10bfd56b6d882fafafecefdbb60d3a991fb04272', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:27:20', '2018-06-18 00:27:20', '2019-06-18 05:57:20'),
('e7dc056ef1bcc0d0411f10650850bbdc938c8fe9899b4d19017281e70ad23a0771bd7bf8e6c8e06a', 1, 11, 'ONCOassist', '[]', 0, '2020-03-11 14:48:08', '2020-03-11 14:48:08', '2021-03-11 14:48:08'),
('e7e405723b11b96516e463987e8d65bad0f12b89a404cc8e6eb73eb59d4a0d403559c4291f4df309', 1, 11, 'ONCOassist', '[]', 0, '2019-02-19 11:05:06', '2019-02-19 11:05:06', '2020-02-19 11:05:06'),
('e8322c6aa5286e57b57797d29b060c100a891cf1a0244f56b253184129709e30a267fa6fd4adb5eb', 1, 11, 'ONCOassist', '[]', 0, '2018-06-29 21:17:08', '2018-06-29 21:17:08', '2019-06-29 14:17:08'),
('e86338a1146d08474d235f394be38328f58d39cf7f9bf76af06eaa169cfc6a6f89c6556a1325cdf1', 1, 11, 'ONCOassist', '[]', 0, '2019-11-20 00:54:34', '2019-11-20 00:54:34', '2020-11-20 06:24:34'),
('e8f0e7e09fe81f1dbf5a1645495c44721abca5c1cd09d3afee4b7fbc20590051db38663ac1381805', 1, 11, 'ONCOassist', '[]', 0, '2019-01-11 06:13:52', '2019-01-11 06:13:52', '2020-01-11 06:13:52'),
('e90b5b6944b843acd1f0d05de63dd3e262ea3adceb2d49dc84ab71db5cf88471059c3f6a6845ae8e', 1, 11, 'ONCOassist', '[]', 0, '2019-11-27 02:57:28', '2019-11-27 02:57:28', '2020-11-27 08:27:28'),
('e9270e0c490ff85968c08f277509d0f8f009cdfc27b67c6518df6772d20e5e36093f8dd2d2bd67a9', 1, 11, 'ONCOassist', '[]', 0, '2019-06-28 03:56:09', '2019-06-28 03:56:09', '2020-06-28 09:26:09'),
('e935a894625cc65b81def0639ccc25bac18c28b743539cd322f8685a3d81b4b1ed28a843082e9a38', 1, 11, 'ONCOassist', '[]', 0, '2019-06-04 00:07:40', '2019-06-04 00:07:40', '2020-06-04 05:37:40'),
('e9a882e527f604e4526c1c313a3091ab8d5bd9008a810df1dca54b3c8b0d232b60ed430d70fe922c', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 08:22:29', '2019-11-04 08:22:29', '2020-11-04 13:52:29'),
('e9b49cc24d06eee4523a53908f01225a9bc7fa3abb1314acaf47bf6f9141a6667cd5afd477c3aa85', 1, 11, 'ONCOassist', '[]', 0, '2019-05-02 17:05:13', '2019-05-02 17:05:13', '2020-05-02 17:05:13'),
('ea2165ce1478695dfe15e37e57ee21e5f127dde6911670896cab11a55639dbc8f1797f68e6d45bc3', 1, 11, 'ONCOassist', '[]', 0, '2018-06-18 06:54:30', '2018-06-18 06:54:30', '2019-06-18 12:24:30'),
('ea8568734b4612c05ca52df8a4bad5cf4e50f98936d6e091f7421a4fda412c0fdcef39e122a8bc25', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 02:55:01', '2019-11-05 02:55:01', '2020-11-05 08:25:01'),
('ea8f4f44a90a25cac9f800ac8349c570c5f7d5f62b603a3d4762eb3a5a4a4402a6a87dd3ab81eda7', 1, 11, 'ONCOassist', '[]', 0, '2019-11-20 02:23:11', '2019-11-20 02:23:11', '2020-11-20 07:53:11'),
('ea99bf47940222867cec534c7dececfb5547d24ea47bd7ef51ec0c27387b77e766620b1f1d283cde', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:02:23', '2020-01-16 06:02:23', '2021-01-16 11:32:23'),
('eabb5381790b6426ab90e303d2e7558a02b6a429f1e732de68fb783e7652333893ef3ac5ec0e11cd', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 06:18:52', '2018-12-18 06:18:52', '2019-12-18 06:18:52'),
('eabff295f04522611f92003a09ea4995ac8a9bc0d71b5da2c0b5d6b24e48fbe8a2d8191272aab54c', 1, 11, 'ONCOassist', '[]', 0, '2019-04-17 11:04:43', '2019-04-17 11:04:43', '2020-04-17 11:04:43'),
('eacf16bad40f1dbbf0547354af89ef1b2af452b60cfd57f07ab40752d802cd305c8b417a41983192', 1, 11, 'ONCOassist', '[]', 0, '2019-01-03 05:46:43', '2019-01-03 05:46:43', '2020-01-03 05:46:43'),
('eaef60e1d46bda294105e387470bdb4ad274ddc4fc3b13ce54e6abc0c29bd876a2c82ea53b9daf01', 1, 11, 'ONCOassist', '[]', 0, '2019-02-06 16:13:32', '2019-02-06 16:13:32', '2020-02-06 16:13:32'),
('eb4bb4923319ef1bb55e732c2c4db1596e127c33d4433a196555900aa875b5cddc4d03a05b58a504', 1, 11, 'ONCOassist', '[]', 0, '2019-11-13 07:13:22', '2019-11-13 07:13:22', '2020-11-13 12:43:22'),
('eb5dc43cb97d7edf016404817f0efd59dfa3efce044f9a0750e0d499cafb45eeb246f991793b870a', 1, 11, 'ONCOassist', '[]', 0, '2020-04-17 10:30:14', '2020-04-17 10:30:14', '2021-04-17 10:30:14'),
('eb697fab3bcbded43925fe71bcfc67c85afe39836c6c1b927153ff8b5970c3058412a37e669d5c3d', 1, 11, 'ONCOassist', '[]', 0, '2019-10-23 02:10:25', '2019-10-23 02:10:25', '2020-10-23 07:40:25'),
('eb7aee187c09e6e531846955ccadb037ce28cbf74abf78368a40542c197aabd9a2f42bc080be2f1b', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-10 05:42:16', '2020-01-10 05:42:16', '2021-01-10 11:12:16'),
('ebd41ae83660cc9be484674cc188fd135f0aa260f7882539802b334a4a4ad9e69198b32b64809e37', 1, 11, 'ONCOassist', '[]', 0, '2020-04-13 05:01:55', '2020-04-13 05:01:55', '2021-04-13 05:01:55'),
('ebf1398a889c54d1d03d8ce3db3d512ec5a17400cccebf0e4e904d5acdb482a2f8c040dddccf223f', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-10 05:26:23', '2020-01-10 05:26:23', '2021-01-10 10:56:23'),
('ebf3373fa67008eeed997fb9577d0558d61bed36f8be06374a50fe41771130107f7327f05bb9ef6a', 1, 11, 'ONCOassist', '[]', 0, '2019-02-21 07:00:54', '2019-02-21 07:00:54', '2020-02-21 07:00:54'),
('ebf6e9baa8b5f616b6b536ecb83db7500aaf406d07931fbeb596fdc54071c40a2c02f06bb8e47392', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 02:57:49', '2019-11-07 02:57:49', '2020-11-07 08:27:49'),
('ec12b6a8f5ccc14337859c00167a30e6e74c3000304527bc1320099b1dc36ce22a34561525d16f30', 1, 11, 'ONCOassist', '[]', 0, '2019-06-14 06:04:48', '2019-06-14 06:04:48', '2020-06-14 11:34:48'),
('ec1c1eb6b2dbd416537d28e29b0231f98fab7f5b69a88269fa5df1ee13d8549c358a5b06a6133aca', 1, 11, 'ONCOassist', '[]', 0, '2019-01-25 05:15:32', '2019-01-25 05:15:32', '2020-01-25 05:15:32'),
('ec6741bb9b33ef27cc002dcb4ce1f553d2d691c2d34120ef0a178f07220f6ebe4d6f9b2d173e6570', 1, 11, 'ONCOassist', '[]', 0, '2019-04-17 08:06:47', '2019-04-17 08:06:47', '2020-04-17 08:06:47'),
('ec6ff7144cb469ff049eff8fedf209f494abfac7b574e6011173e9872f25d245bd2e18445f6dba69', 1, 11, 'ONCOassist', '[]', 0, '2020-02-26 13:58:57', '2020-02-26 13:58:57', '2021-02-26 13:58:57'),
('ecb11f3c3aa72ba900213de6d31fed667c3958f8b7a822f5a4e1d2a94470f99c366b5d71a3621d2b', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 06:38:27', '2019-11-04 06:38:27', '2020-11-04 12:08:27'),
('ecb2c46a33d8edadfcb263a79ab3310931225d6a2761d973d6c7b5cee0f1674dcb253022c94eec81', 1, 11, 'ONCOassist', '[]', 0, '2018-11-20 11:17:24', '2018-11-20 11:17:24', '2019-11-20 11:17:24'),
('ecbb9117e085fa0125d6e8ec57fa708754ab05a342b0955f69b3dff1411a6c6894178f10040b1777', 1, 11, 'ONCOassist', '[]', 0, '2020-03-04 14:39:45', '2020-03-04 14:39:45', '2021-03-04 14:39:45'),
('ed3ead7c1ce4967d1dfa1499355188a1c652ed61dc9e25046ac39bb62e33f609e7e02bdbd17a7664', 1, 11, 'ONCOassist', '[]', 0, '2019-06-04 23:48:33', '2019-06-04 23:48:33', '2020-06-05 05:18:33'),
('ed4e9a5f1b3ef04a49f9888e533bccf6589e62ef728e4572669410ed7f94db41b79ead216452ae4d', 1, 11, 'ONCOassist', '[]', 0, '2019-07-17 23:14:22', '2019-07-17 23:14:22', '2020-07-18 04:44:22'),
('edc6fda3d8a6d573264198014b42655b32bfcb82ab83f520f71c7c558e9c1eea4d8d250dee2d764e', 1, 11, 'ONCOassist', '[]', 0, '2019-04-01 15:45:18', '2019-04-01 15:45:18', '2020-04-01 15:45:18'),
('edc9f0f461d1c9957ebdd856718755b8a80b66db220f7de0544e05d0fb2237882b9d087a35e6d66d', 1, 11, 'ONCOassist', '[]', 0, '2018-06-18 06:54:31', '2018-06-18 06:54:31', '2019-06-18 12:24:31'),
('edf474651b547512e5bab29572d599570f2c3859df23e389dc7c8fc8026a76bfe957680465fc2e2d', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 05:19:42', '2020-01-15 05:19:42', '2021-01-15 10:49:42'),
('edf4a16341d2d5f0239c5d9d60528dc2f2a1fadb8274c97ba02387d6f85920379c33b374a5202ac5', 1, 11, 'ONCOassist', '[]', 0, '2019-02-19 10:12:21', '2019-02-19 10:12:21', '2020-02-19 10:12:21'),
('edf7755b9d2ba22b383169d3f2741824c9835358c12ffeb9202889cb67f5b1501de164f73af410a8', 1, 11, 'ONCOassist', '[]', 0, '2019-11-13 06:53:59', '2019-11-13 06:53:59', '2020-11-13 12:23:59'),
('ee05a7a7137b56722184294fa284b60e2659d380838992b07b4abfd065b3a63c4d2d13f19eeaeca6', 1, 11, 'ONCOassist', '[]', 0, '2020-05-06 15:25:14', '2020-05-06 15:25:14', '2021-05-06 15:25:14'),
('ee0f0ffcd5049323067b29f999e50b3350e6e0febd9a583754a2ab3479e21c519e8d3e804af1bfaa', 1, 11, 'ONCOassist', '[]', 0, '2019-04-29 08:16:27', '2019-04-29 08:16:27', '2020-04-29 08:16:27'),
('ee169517d3404401958b209f1398f3a76e00dffbd94b27f4d491e7f00743da0e6d2e768375421ba5', 1, 9, 'ONCOassist', '[]', 0, '2018-06-16 04:43:18', '2018-06-16 04:43:18', '2019-06-16 10:13:18'),
('ee1e0cd8d47659f9eba0aacae1308bdfa06b9c8c94c879cdd724cb381eb220b841e8cb16c98c71a8', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:47:23', '2020-01-17 00:47:23', '2021-01-17 06:17:23');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('ee35e8829b49a51d7db61cf59a386cbc29e362ab3d26b8bd0da8453285ca003352e7fb5aa01074ab', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 07:33:48', '2020-01-15 07:33:48', '2021-01-15 13:03:48'),
('ee499b1a5f4b1b8a23c11212cfa3bb9758e665d9f0fd6345c591989fae095da9d6183130230367f0', 1, 11, 'ONCOassist', '[]', 0, '2018-12-06 10:51:19', '2018-12-06 10:51:19', '2019-12-06 10:51:19'),
('ee7779d80d364a6a6c536e1b719a4257225c45e4b94de056dcecebd33787c00a84625a09da08535f', 1, 11, 'ONCOassist', '[]', 0, '2019-02-11 06:37:11', '2019-02-11 06:37:11', '2020-02-11 06:37:11'),
('eebab9d84ff848ade8cb14f746232d1640269fb7f2eab35991ad529c6a8edc003146949d87e17a57', 1, 11, 'ONCOassist', '[]', 0, '2018-06-20 23:16:00', '2018-06-20 23:16:00', '2019-06-21 04:46:00'),
('eee2625848af1bad6e225fd7717186867ba11f1a8e06947d262c7376726937b089dfb0ed1b015642', 1, 11, 'ONCOassist', '[]', 0, '2019-11-05 03:03:07', '2019-11-05 03:03:07', '2020-11-05 08:33:07'),
('eee3e9643943fd182423591d546863ed68c6d8c311458937efa59c0ab75e9a26b59dda87d4b73fb4', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-15 03:11:44', '2020-01-15 03:11:44', '2021-01-15 08:41:44'),
('eef1bd27f73f94f5ac08ac877ae3089020838a28a231075b23d44e8acd30a2561df9bd5257c92b7d', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 04:32:15', '2018-10-30 04:32:15', '2019-10-30 04:32:15'),
('efa859940b600d3d1acd574e3bbfefffd6b69095e2fcf8ccc17397201b157d9fd2d189c3d5a07ff7', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 10:07:18', '2018-12-04 10:07:18', '2019-12-04 10:07:18'),
('efc7fb4a8bad7dc6c39e9f2264733133a1bee98c76ef90089d0e933197b129a5bd2a2614d6e4d4a0', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-12 23:44:25', '2020-01-12 23:44:25', '2021-01-13 05:14:25'),
('efcb55f8e34f854e7c87d452d4959bd6dff1fea3d21486f36a4e476cdbc32129d8779baf7c079d11', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 04:14:53', '2019-11-04 04:14:53', '2020-11-04 09:44:53'),
('efd18f6f65ad1e30c6abe03a6167b63d868566eb51dcf7b020939093aeb056ee8dcc3a0f4e22bd6e', 1, 11, 'ONCOassist', '[]', 0, '2018-11-28 12:09:24', '2018-11-28 12:09:24', '2019-11-28 12:09:24'),
('efd4fa70e89477f16e543e384b9f26ecc766d7084e9c47fde2cb2efb9ab63cccd3ff04fbb77e92b4', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-13 05:15:37', '2020-01-13 05:15:37', '2021-01-13 10:45:37'),
('f019ad8a24f4fe2fa8ae0bcaa8c8c30ad1b7a58ee83555e6de749d51084c625843931387cbc00759', 1, 11, 'ONCOassist', '[]', 0, '2019-02-07 11:09:20', '2019-02-07 11:09:20', '2020-02-07 11:09:20'),
('f065e8701f7517a5c06c86b6bbfe48aa96e682d781b18119d784ecbbfb8d50ebca0a2b7e198b1bb9', 1, 11, 'ONCOassist', '[]', 0, '2018-07-11 06:43:53', '2018-07-11 06:43:53', '2019-07-11 06:43:53'),
('f06955c7286c9908a2cc1b1d085d824e5df232344645fb10aaa1c1d21d07d47e8240d5a6bb0bf117', 1, 11, 'ONCOassist', '[]', 0, '2018-12-04 07:02:49', '2018-12-04 07:02:49', '2019-12-04 07:02:49'),
('f06f627d545ae2aa919c912f4cd3f531364dfa171c4f8b67a8504b6d90bd11feb29f8bba15e35b55', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 12:24:38', '2018-10-29 12:24:38', '2019-10-29 12:24:38'),
('f06fb64ac4965451d2651c55396150bdf6490dad9e59eafda2820830e3fc4b9181144303b5501948', 1, 11, 'ONCOassist', '[]', 0, '2018-09-12 18:12:59', '2018-09-12 18:12:59', '2019-09-12 11:12:59'),
('f085c568f601772a1ea2e3a236855120f573deb578734effd67d2147cb45b8e469245ccf75b2b79e', 1, 11, 'ONCOassist', '[]', 0, '2019-11-19 06:52:06', '2019-11-19 06:52:06', '2020-11-19 12:22:06'),
('f0dbc8e78204131f90b2e60981abffc9e11ff3bd0938bb098d59bc19bccc659d0b378adc91193603', 1, 11, 'ONCOassist', '[]', 0, '2020-02-21 04:21:56', '2020-02-21 04:21:56', '2021-02-21 09:51:56'),
('f0eb89f134eefb0137471c4c9ba28a187db47ee12b39b69f19c76b4be4d6b604f1d84e4507744722', 1, 11, 'ONCOassist', '[]', 0, '2019-06-14 05:02:40', '2019-06-14 05:02:40', '2020-06-14 10:32:40'),
('f12608a77b2b37b08db5b75b3487f5350db8dda6dd10392ae82cb335f645a1b23f2b0f4c201c04ea', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 05:28:31', '2019-11-06 05:28:31', '2020-11-06 10:58:31'),
('f12a7674ec35efc0c2958191883a2b21d67e18dec94e20e8ed08eaa9cb77168e81aa9dbd1adb7397', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-13 08:01:32', '2020-01-13 08:01:32', '2021-01-13 13:31:32'),
('f12f0d49e15cd64523a30afd5cbf9ad00c78d2cd3bba02482131c1e2cafffce1cd614c09ae6ed972', 1, 11, 'ONCOassist', '[]', 0, '2019-10-25 03:56:54', '2019-10-25 03:56:54', '2020-10-25 09:26:54'),
('f1425677af290803a72feb0a1fb45de7124388ac66ac1dd2b1d5a395bae6749788bb0cee43f4c7e4', 1, 11, 'ONCOassist', '[]', 0, '2018-12-19 15:22:59', '2018-12-19 15:22:59', '2019-12-19 15:22:59'),
('f14849c5052a6956fb1f44f43fea5094b66c766606db7d917fbd97b91cdd628b4e4326fe841b1e9e', 1, 11, 'ONCOassist', '[]', 0, '2019-10-22 02:11:23', '2019-10-22 02:11:23', '2020-10-22 07:41:23'),
('f1aba0c3363b4138399501263a19d52a79013c2bf130ac7baf78a87fb68f1720dba3dfef20094296', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 09:04:45', '2018-10-30 09:04:45', '2019-10-30 09:04:45'),
('f1dfcd2fd05da412a7563b12a1ad9f0e803b3c4c862125579d1535a65708ec22617c4ad123c6e195', 1, 11, 'ONCOassist', '[]', 0, '2019-11-18 00:06:54', '2019-11-18 00:06:54', '2020-11-18 05:36:54'),
('f1e32a489a8e04a180574e517a99654fc81d4e7c61fcc01533e772fa1e05a55701b80c7370993be6', 1, 11, 'ONCOassist', '[]', 0, '2018-12-03 10:47:24', '2018-12-03 10:47:24', '2019-12-03 10:47:24'),
('f1e9ae057f8fb08d0617ac52c080bf35143ea494daf894d4ba3153018447e6485093527445fbb0f2', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:54:22', '2020-01-16 06:54:22', '2021-01-16 12:24:22'),
('f1fd7df45b9e8476542a1af136496518767f72a4450e7038104521f4d250ad8bf291652df685a81b', 1, 11, 'ONCOassist', '[]', 0, '2019-10-24 05:25:13', '2019-10-24 05:25:13', '2020-10-24 10:55:13'),
('f233a838b7568ee05c9178f843e462183e24ff8408c16549aa8072303a5d5b22959cebacb2fdf43f', 1, 11, 'ONCOassist', '[]', 0, '2018-10-03 13:39:20', '2018-10-03 13:39:20', '2019-10-03 06:39:20'),
('f25f410b526d1fa452cbdda505f175733d899113b93d2a3e070d90ddac93d4925c7734d53d4edd58', 1, 11, 'ONCOassist', '[]', 0, '2019-11-28 04:30:49', '2019-11-28 04:30:49', '2020-11-28 10:00:49'),
('f2a67c04b4b0533b98455009fdf5431584b26cf1d164fd6dfddc3e100bbba8a23723646d27453e86', 1, 11, 'ONCOassist', '[]', 0, '2020-06-18 11:49:11', '2020-06-18 11:49:11', '2021-06-18 04:49:11'),
('f2d1fee7198c32ae5a0032d4d2f344789a22c83a7c91caee023df58f52dbc4d8d422d5c7283c4d41', 1, 11, 'ONCOassist', '[]', 0, '2018-12-13 15:27:41', '2018-12-13 15:27:41', '2019-12-13 15:27:41'),
('f2db1a031636fd9f79a0b1e7aea7e0107f990185b0a74a70261083780d2165a51f5180ed561098c8', 1, 11, 'ONCOassist', '[]', 0, '2019-07-22 00:39:46', '2019-07-22 00:39:46', '2020-07-22 06:09:46'),
('f2fd9453a208619a573f71741b85d8b4e962cc4699017e67e64ed3e870726ae8cef1882e98f0f8c5', 1, 11, 'ONCOassist', '[]', 0, '2019-07-16 06:37:40', '2019-07-16 06:37:40', '2020-07-16 12:07:40'),
('f34db51e2853c9982cd344531c176b835c08ba727fd6f81e0a1b90dbde8098d73d9c2522a29e678d', 1, 11, 'ONCOassist', '[]', 0, '2018-12-18 14:23:13', '2018-12-18 14:23:13', '2019-12-18 14:23:13'),
('f38cb1e8218575ac2f62b9ca0a0327592bf8a932596d19d8e1340afac15502ab44226cb6cfbfc608', 1, 11, 'ONCOassist', '[]', 0, '2018-10-30 13:10:06', '2018-10-30 13:10:06', '2019-10-30 13:10:06'),
('f3a66cf35c1c19f6262106c7c0ef6d42c89237c24c3bd48adb5cc58659531fc6ef71d44d3f9c1563', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:23:48', '2019-11-22 00:23:48', '2020-11-22 05:53:48'),
('f3b31ffc15f4abe73a68544315a33857cf5c27389353b5a0126809283822c46ac3af4d629691b593', 1, 11, 'ONCOassist', '[]', 0, '2019-04-25 15:12:27', '2019-04-25 15:12:27', '2020-04-25 15:12:27'),
('f3c5ff4e717d15ab09e62d361eb3fb1d0ae73a281aad689dec16b3497c4bbc9b28c68879dd6e6a61', 1, 11, 'ONCOassist', '[]', 0, '2020-01-02 04:41:12', '2020-01-02 04:41:12', '2021-01-02 10:11:12'),
('f3cca710e053a73be2a68a4ce909a713574df793d5a0d965e5c3593caa9c7d55d5eee42424059c6b', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 11:21:03', '2019-02-13 11:21:03', '2020-02-13 11:21:03'),
('f3d29eacd5c146a510eead049cf99b1d130943801e32a4780a22241aa7620b64d091946afe456a6a', 1, 11, 'ONCOassist', '[]', 0, '2018-12-05 09:17:47', '2018-12-05 09:17:47', '2019-12-05 09:17:47'),
('f3f233a72a10eb2a40c585662d41c3fb1c3c75663116b70320bc0ca5fdbac941b886a51ae602ff46', 1, 11, 'ONCOassist', '[]', 0, '2019-05-08 08:32:46', '2019-05-08 08:32:46', '2020-05-08 08:32:46'),
('f3f8bb6c636d25b8d153bf3bfa27813d7c6db99376c0e8d68802e6f8d8a389a75d62640c5a7d76fc', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 02:16:17', '2020-01-16 02:16:17', '2021-01-16 07:46:17'),
('f402347fa68ad6a53fd1e79edf2e9dc72c975d9e8532a3e4aacf1e49a05fa125a3279f1dad89dff7', 1, 11, 'ONCOassist', '[]', 0, '2019-06-13 00:40:06', '2019-06-13 00:40:06', '2020-06-13 06:10:06'),
('f40d298b2cd417e7b9640b0786389c94e6965419e5580afda7162a062c97fcd73b57197fba635306', 1, 11, 'ONCOassist', '[]', 0, '2019-11-22 00:45:35', '2019-11-22 00:45:35', '2020-11-22 06:15:35'),
('f48922c9eff4321dc1547da084f3fe3b61775525ebddb769e0e131ad908f34d879877ce22ff176b7', 1, 11, 'ONCOassist', '[]', 0, '2019-01-29 13:48:55', '2019-01-29 13:48:55', '2020-01-29 13:48:55'),
('f4896bee109a6dace46d5931597b1b6e31cb0096f6d3be6d01ee59ad49980b8a942a50ca2d79daf6', 1, 11, 'ONCOassist', '[]', 0, '2020-03-12 13:54:46', '2020-03-12 13:54:46', '2021-03-12 13:54:46'),
('f4e9ec3709c68e2c94ddf6a9f63cba8e4931a24c6f33fb8c5cc8932fe1cb0134d02e909f8cab669a', 1, 11, 'ONCOassist', '[]', 0, '2019-03-08 16:33:21', '2019-03-08 16:33:21', '2020-03-08 16:33:21'),
('f502d376fa8d90547328b1d694d6bf43c70627532b1d0c4e1da52941b1835c10094235883820aad0', 1, 11, 'ONCOassist', '[]', 0, '2019-11-04 07:05:25', '2019-11-04 07:05:25', '2020-11-04 12:35:25'),
('f560f1fb897b35ca5d5168be2066b64970cb111f66c0ed52757d19d82cbd408326d1b3c3efadcfc2', 1, 11, 'ONCOassist', '[]', 0, '2020-04-10 10:42:07', '2020-04-10 10:42:07', '2021-04-10 10:42:07'),
('f56bdd7892ba06ab02a782574138dd39d8169170101dac1e3cb384f54dd0946887a719425dd90ffd', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 16:14:43', '2019-05-09 16:14:43', '2020-05-09 16:14:43'),
('f574a86958a420bb088043198ca0bc6164ee06adfd77cf8576b23e5259905beba60a333cbc7f75ff', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 01:14:38', '2019-11-21 01:14:38', '2020-11-21 06:44:38'),
('f5a630d85263a01bf6663233078199b958443eace24bb2d974b030d06b57e9cfaf4277e13cfe8067', 1, 11, 'ONCOassist', '[]', 0, '2019-11-06 08:34:34', '2019-11-06 08:34:34', '2020-11-06 14:04:34'),
('f5b1c6f06af5039ad0b36f63d4458b21b6ac0039e487f66072742bbcbac7bef93924d3493203b584', 1, 11, 'ONCOassist', '[]', 0, '2019-02-28 13:48:27', '2019-02-28 13:48:27', '2020-02-28 13:48:27'),
('f5c78b8b7dcbf8de28f2a331cfdafde9fd50a10fa1d65d74a7b2207029f6160591d85d829ce96681', 1, 11, 'ONCOassist', '[]', 0, '2020-03-06 08:02:58', '2020-03-06 08:02:58', '2021-03-06 08:02:58'),
('f5d07e6a3a02d2aaa5971977cc14937757abe6dc9146f930cb5c55bc6a0890832288b985145db2a3', 1, 11, 'ONCOassist', '[]', 0, '2019-11-12 07:52:32', '2019-11-12 07:52:32', '2020-11-12 13:22:32'),
('f5dc73ba891d8429e00a4cbe49e852a0a5720c224b95901054da2baac358e565c9598ae804f6849b', 1, 11, 'ONCOassist', '[]', 0, '2019-07-02 01:56:11', '2019-07-02 01:56:11', '2020-07-02 07:26:11'),
('f5e8e3f3116587dbc05d67ef7eff76cf9634748bbdb0b80b11233de23b33c3748aa7547c4d6c8ae1', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-09 03:30:38', '2020-01-09 03:30:38', '2021-01-09 09:00:38'),
('f60aca027d2b35f63b8291b63486fc5f34cdfcb99cd5e5969bbe6bcae14b76974662146a6de10071', 1, 11, 'ONCOassist', '[]', 0, '2019-05-07 08:06:07', '2019-05-07 08:06:07', '2020-05-07 08:06:07'),
('f6314022cf2f78528d79c576ce7455f6835847477bcacb75336ba48ae04f7736900a1c8ceffdd224', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-13 01:29:43', '2020-01-13 01:29:43', '2021-01-13 06:59:43'),
('f632ec988ef0ec7fb5d71d6c75c5f1de9df5e64ab8f3d106e326fb52208f5383b710c7040f186287', 1, 11, 'ONCOassist', '[]', 0, '2019-11-25 22:58:38', '2019-11-25 22:58:38', '2020-11-26 04:28:38'),
('f633ab723935e5a439f4c55ed9b90a7bb4e9cc5601a37a3472e8f50faab7aea31942947ea0efe8f7', 1, 11, 'ONCOassist', '[]', 0, '2019-04-24 19:27:59', '2019-04-24 19:27:59', '2020-04-24 19:27:59'),
('f642992d0b287c5bf267f66e067af2d6cbbe0eb1bca62e73fce12b2f772a42b716075c6e1e0a4f47', 1, 11, 'ONCOassist', '[]', 0, '2018-10-31 13:36:11', '2018-10-31 13:36:11', '2019-10-31 13:36:11'),
('f68aab85114ba98f8ab843d18b4932568f127006fac599bb2dba589357ddfca4bbd7475ad7b04571', 1, 11, 'ONCOassist', '[]', 0, '2018-11-12 12:26:39', '2018-11-12 12:26:39', '2019-11-12 12:26:39'),
('f69daa77d5b777680d9d92e97a8a6ab72cf15ddd336140193740b7a17175d75a231cccc34f1fa822', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-09 03:35:39', '2020-01-09 03:35:39', '2021-01-09 09:05:39'),
('f6c632459e28fc241290922ed843aad6267fe6f8e71657bbe9b54591a3fafb9c3d0798a244b121cc', 1, 11, 'ONCOassist', '[]', 0, '2019-02-07 05:19:09', '2019-02-07 05:19:09', '2020-02-07 05:19:09'),
('f6f46435c381804b9e7a666350fdf2aa9452122d7bcdfd8b89086096ae7d3596afdf459b8bd75178', 1, 11, 'ONCOassist', '[]', 0, '2019-06-14 05:20:32', '2019-06-14 05:20:32', '2020-06-14 10:50:32'),
('f73060727aa3b9d69a6f8a5fefc437148959ab2c5be1b5b14c83a194d27228d75ad124a14659de6f', 1, 11, 'ONCOassist', '[]', 0, '2018-11-30 04:45:54', '2018-11-30 04:45:54', '2019-11-30 04:45:54'),
('f732e55534222891e8790728984e2a34da69d0987237472d083e241cf4bfae2039d052834c46601e', 1, 11, 'ONCOassist', '[]', 0, '2019-02-15 11:26:53', '2019-02-15 11:26:53', '2020-02-15 11:26:53'),
('f747849552922a503cc1c09f62fb23c2cb994da3411e0118599e5b31a2b69375e78099a0edfe69a2', 1, 11, 'ONCOassist', '[]', 0, '2019-01-17 06:20:50', '2019-01-17 06:20:50', '2020-01-17 06:20:50'),
('f74a7a22728767caed883e4df50f952f146caaa3614602bbdd372f5b0c614ec73937ff08327d6e61', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-17 00:33:09', '2020-01-17 00:33:09', '2021-01-17 06:03:09'),
('f76b3f5c6a822454df850b1cb484038d3d32d7a119b9b02e8a70fb5d0bbd562363f2ac6d21492ed2', 1, 11, 'ONCOassist', '[]', 0, '2019-02-07 11:56:55', '2019-02-07 11:56:55', '2020-02-07 11:56:55'),
('f76e6126c24b8748e3ce84c717ccc610af95d45d96feca7f99911535159176b4ec330c013f8895f6', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 02:43:39', '2019-11-21 02:43:39', '2020-11-21 08:13:39'),
('f7daad629481b7a29f0b1cb89177de55da9a78bc4ed659217efc7744dafb016aefff755a09d38607', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:25:16', '2020-01-16 06:25:16', '2021-01-16 11:55:16'),
('f83ee951b746781b56cd9f65de5dd31129b8ec3febc06267a2a136452339db850df1861f50648c3b', 1, 11, 'ONCOassist', '[]', 0, '2019-05-14 08:08:10', '2019-05-14 08:08:10', '2020-05-14 08:08:10'),
('f84787b41777410fe74bb329f7673523cc6e49f04cb64e2638938a8725a9ade24301cd5647c322fc', 1, 11, 'ONCOassist', '[]', 0, '2020-04-02 10:39:09', '2020-04-02 10:39:09', '2021-04-02 10:39:09'),
('f848ca75760d46548428a7b47f1347d6c0350a5deb9596697b9ade79ddb94f4fb6d4826eb5e70029', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 06:04:45', '2019-11-07 06:04:45', '2020-11-07 11:34:45'),
('f85f161ef171f202d87a2c0830cf7e0c960116d3f8cb183773a6478a925d6ba59a1c52e16e8f558a', 1, 11, 'ONCOassist', '[]', 0, '2018-11-01 11:12:09', '2018-11-01 11:12:09', '2019-11-01 11:12:09'),
('f8640736c3b2dc9991dc46792d6b69f83f1960ec4ab31da85e4cfb2912e2eb04d768f92cae8843b2', 1, 11, 'ONCOassist', '[]', 0, '2019-11-21 06:16:37', '2019-11-21 06:16:37', '2020-11-21 11:46:37'),
('f8b58d0a514d121cc6b295c80cfeb026d02b0ced9fc05a37ac137592532db57080e3c0800ba15099', 1, 11, 'ONCOassist', '[]', 0, '2019-02-11 11:46:32', '2019-02-11 11:46:32', '2020-02-11 11:46:32'),
('f8db60bd682d7e0837e3627d19fdddcf2706837952464ba769be014779b08edf1a2c30ab069e066e', 1, 11, 'ONCOassist', '[]', 0, '2018-06-18 06:55:34', '2018-06-18 06:55:34', '2019-06-18 12:25:34'),
('f8de74f4f614ad76562bc563c61d2cb9ad8859468c14b3d9b027e0d55bba51d4c39058f13aaa81d4', 1, 11, 'ONCOassist', '[]', 0, '2019-02-13 06:40:03', '2019-02-13 06:40:03', '2020-02-13 06:40:03'),
('f92023b082341de440b63403b366392e4a8491d7ec488395b6a51f01eb42c13935bab419848bb414', 1, 11, 'ONCOassist', '[]', 0, '2019-02-21 07:34:27', '2019-02-21 07:34:27', '2020-02-21 07:34:27'),
('f9682f4b448e5cab164b451dfceae2610f34476bde0b6f9074845378c972afc48bd2f65ee17b51c1', 1, 11, 'ONCOassist', '[]', 0, '2019-02-27 09:18:04', '2019-02-27 09:18:04', '2020-02-27 09:18:04'),
('f96ebf5a768a62ffd11405dc41c13ec0978b950c3fd059c668d72d3f02869a5db6ec9fb894094b8b', 1, 9, 'ONCOassist', '[]', 0, '2018-06-18 00:49:07', '2018-06-18 00:49:07', '2019-06-18 06:19:07'),
('f9cacdc533125902ed4dc56d62cda01322e4c0c3ff63076463bb57de915790634840c0c97065139c', 1, 11, 'ONCOassist', '[]', 0, '2018-11-28 06:09:52', '2018-11-28 06:09:52', '2019-11-28 06:09:52'),
('f9d893f81d6c0b7cca2b2085d057f83f9f6388a0d813817bf7a91abcec828bd1cc648053f822acd3', 1, 11, 'ONCOassist', '[]', 0, '2020-03-11 14:07:01', '2020-03-11 14:07:01', '2021-03-11 14:07:01'),
('f9dfc8fb5e1564a96b4f8808cf02a7042011fcd3b5734da05aa4ab3aeb829a6c1b29e95df3102fa1', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-16 08:05:52', '2020-01-16 08:05:52', '2021-01-16 13:35:52'),
('f9e509dea96d57b2a1cb8729e003455d8b3337d0ed2a4aeaf260c3d5f51021fcbb97cb456c8e1af9', 1, 11, 'ONCOassist', '[]', 0, '2018-12-17 09:23:53', '2018-12-17 09:23:53', '2019-12-17 09:23:53'),
('f9f4aac1bb74e0ae1353a123a17d8a794b1cdf06ac26f01f4411987423600e7b586924d07d91a96b', 1, 11, 'ONCOassist', '[]', 0, '2019-05-08 14:47:18', '2019-05-08 14:47:18', '2020-05-08 14:47:18'),
('fa20bce15c8bbfa3dab68eca602e3a27200b5ae010c710d20e9897109f743028d1622c445f916f7a', 1, 11, 'ONCOassist', '[]', 0, '2018-11-23 09:10:48', '2018-11-23 09:10:48', '2019-11-23 09:10:48'),
('fb6354f20c95413a0a8634260c03c06c48d024c38aeb0d628c59ed298a94632c0051bd55d2e6024c', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 06:16:08', '2020-01-16 06:16:08', '2021-01-16 11:46:08'),
('fb70dba56700f84b59939a4362f4c9fdf8e2074246a5113c49927bce2d455685f0907825b6af95bb', 1, 11, 'ONCOassist', '[]', 0, '2019-11-25 05:20:24', '2019-11-25 05:20:24', '2020-11-25 10:50:24'),
('fbbafb693d782e4d04a902e295bbfd26ea503ecb76791c3748bd18cfea3d971d6a77ea224d6c7c82', 1, 11, 'ONCOassist', '[]', 0, '2020-04-21 05:08:34', '2020-04-21 05:08:34', '2021-04-21 05:08:34'),
('fbc7a7a69f9d0bb9b2e260c3b959dfe7082a524d932242f5828aea55fee2ae387d5ba7a39a837f57', 4, 11, 'AIBotDemo', '[]', 0, '2020-01-16 03:12:52', '2020-01-16 03:12:52', '2021-01-16 08:42:52'),
('fbeb1c77b3a1e06087c1f3b8ea8728dce0ddb5dff374715e1ef7fa4ce30ed705d1946af7069ac26a', 1, 11, 'ONCOassist', '[]', 0, '2018-12-19 11:51:09', '2018-12-19 11:51:09', '2019-12-19 11:51:09'),
('fbff67db40ca41e2b8c07db0617fcfeeab7cfedcd46c4a76b18a03dc80701345d974e5789c97e042', 1, 11, 'ONCOassist', '[]', 0, '2019-04-04 10:42:42', '2019-04-04 10:42:42', '2020-04-04 10:42:42'),
('fc18ea5b95544150079088fd645d5f38bb2f68dd5a50a3d1acc199e240fe95f620deb7fed8ee8d90', 1, 11, 'ONCOassist', '[]', 0, '2018-06-27 14:27:42', '2018-06-27 14:27:42', '2019-06-27 07:27:42'),
('fc376f5ca2224c05c36314b5588d2e69f88410e90a5abcbfb58c00f5a1312f01fdec606a661867de', 1, 11, 'ONCOassist', '[]', 0, '2018-10-31 09:37:45', '2018-10-31 09:37:45', '2019-10-31 09:37:45'),
('fd14a74919f991bde9a52f9319062828a1aae6c24df836035694b412849ccb037aa94599c0e4e179', 1, 11, 'ONCOassist', '[]', 0, '2019-01-28 23:54:16', '2019-01-28 23:54:16', '2020-01-28 23:54:16'),
('fd4e5f959bd59eff6401cda64794c83ab45e98aa1b449fb6652c79f1846f6213f0c76175030d32fa', 1, 11, 'AIBotDemo', '[]', 0, '2020-01-10 07:10:27', '2020-01-10 07:10:27', '2021-01-10 12:40:27'),
('fd549bf39f2346da62462c67ec4b59760ca631bcd583ad2663fe375e19b07dd87d1c4a13f3db3015', 1, 11, 'ONCOassist', '[]', 0, '2019-11-18 07:10:21', '2019-11-18 07:10:21', '2020-11-18 12:40:21'),
('fd75c319768fa4c6a4a25985fe04c9dfe337f62158d9d1ec3d1fc578cc38c61fb42f3b5b365b46cf', 1, 11, 'ONCOassist', '[]', 0, '2018-11-02 06:12:38', '2018-11-02 06:12:38', '2019-11-02 06:12:38'),
('fd9ce38fea6083c6847275dee5f77a5de815d385b607005be8657b6cc3ae0a89aaba1f921974a78f', 1, 11, 'ONCOassist', '[]', 0, '2019-05-09 14:40:50', '2019-05-09 14:40:50', '2020-05-09 14:40:50'),
('fe16b75f31122af558074b6986a4678daab80c70f78ed061eaf30ac2ac042781cb0e88866212abfb', 1, 11, 'ONCOassist', '[]', 0, '2018-10-29 13:09:56', '2018-10-29 13:09:56', '2019-10-29 13:09:56'),
('fe654385855a34587c37160449abc455e942d05a52c3a836997df19e0ae87e9a985a38391e84b2b7', 1, 11, 'ONCOassist', '[]', 0, '2019-11-07 01:07:40', '2019-11-07 01:07:40', '2020-11-07 06:37:40'),
('feb4fffea453cd4d97dfdd2d0b2a4c9f9d0eb05cd201acf63e4e590e95a5e3ea5808fa8cfcb8cc93', 1, 11, 'ONCOassist', '[]', 0, '2018-08-01 09:15:39', '2018-08-01 09:15:39', '2019-08-01 09:15:39'),
('feeff2fb9472b0b3485616d036492912e67267b77d7a6420d62d5b195497e82f5ff9ce62e3031d61', 1, 11, 'ONCOassist', '[]', 0, '2019-05-01 08:09:27', '2019-05-01 08:09:27', '2020-05-01 08:09:27'),
('ff0740da947987c89f49019d828ba128e267fdc698ca2b9c2e7213a2c54b46ed61d1488a92036f8d', 1, 11, 'ONCOassist', '[]', 0, '2019-04-01 05:31:05', '2019-04-01 05:31:05', '2020-04-01 05:31:05'),
('ff09bd7c6941ed2e2a12a0c63bc36a495c02e6636d4c692e8e4baea4a7da77b1a922bec71762fa57', 1, 5, 'ONCOassist', '[]', 0, '2018-05-28 07:34:39', '2018-05-28 07:34:39', '2019-05-28 13:04:39'),
('ff16f18d8d480396d0baee057262752e465c44a88038fb93e270559a9c8cd3daaa833c5e65f73c34', 1, 11, 'ONCOassist', '[]', 0, '2018-07-10 09:53:31', '2018-07-10 09:53:31', '2019-07-10 09:53:31'),
('ff3b04637b3b1de8b60c0903ac10cf58cd5cdfc820f9dd8dc81813b654ef40538e471d5af66d0cba', 1, 11, 'ONCOassist', '[]', 0, '2019-02-21 07:26:41', '2019-02-21 07:26:41', '2020-02-21 07:26:41'),
('ff7092897fa44a22f5728848cf599ea897b7fa849961ce3330938b1b6f26bec56ee9ae09e465edf1', 1, 11, 'ONCOassist', '[]', 0, '2019-06-05 04:44:48', '2019-06-05 04:44:48', '2020-06-05 10:14:48'),
('ff8f740d177a390661c985db5540ee765f149c2a6d9b1f2c927cf4972495402b3792c384ff1e1499', 1, 11, 'ONCOassist', '[]', 0, '2019-04-10 08:07:00', '2019-04-10 08:07:00', '2020-04-10 08:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'uOvryNmknr9KHDfeDyPSodeqHe17Qre0pHVPNQ67', 'http://localhost', 1, 0, 0, '2017-09-11 02:15:52', '2017-09-11 02:15:52'),
(2, NULL, 'Laravel Password Grant Client', 'A7eJxkk5Cc2nxggQ7raTzB5eHx672OwADub8Hkzx', 'http://localhost', 0, 1, 0, '2017-09-11 02:15:52', '2017-09-11 02:15:52'),
(3, NULL, 'Laravel Personal Access Client', 'oywvQUL3JmQxjV9B2sfuObjBj7Jr1m6Ip7DYTwAZ', 'http://localhost', 1, 0, 0, '2017-12-19 03:09:22', '2017-12-19 03:09:22'),
(4, NULL, 'Laravel Password Grant Client', 'vjmdyYLRf63X45uhq9iBo6pChKIYPiJszMco1ot3', 'http://localhost', 0, 1, 0, '2017-12-19 03:09:22', '2017-12-19 03:09:22'),
(5, NULL, 'Laravel Personal Access Client', 'ttbO1B99tJvkRvZmFZjj25VJK8DRySg01IkG5yXr', 'http://localhost', 1, 0, 0, '2017-12-28 03:16:30', '2017-12-28 03:16:30'),
(6, NULL, 'Laravel Password Grant Client', 'ZqnPokPFD7jeEhJlKciEuhGflnLW4pTBXKaDBbHA', 'http://localhost', 0, 1, 0, '2017-12-28 03:16:30', '2017-12-28 03:16:30'),
(7, NULL, 'Laravel Personal Access Client', 'Xb3yU32nVkyiYtHRQUSvYppspYKIFQTwdbGBFQ5m', 'http://localhost', 1, 0, 0, '2018-06-16 01:39:05', '2018-06-16 01:39:05'),
(8, NULL, 'Laravel Password Grant Client', 'uHEhSE4wB9Zdb6JZOFh1gMO9Z1wFmO4IQtv0JU3d', 'http://localhost', 0, 1, 0, '2018-06-16 01:39:05', '2018-06-16 01:39:05'),
(9, NULL, 'Laravel Personal Access Client', 'VOyjDUodkiDxgEFHUJ54xXUisyD9IS6pZ3SY9gLY', 'http://localhost', 1, 0, 0, '2018-06-16 01:39:18', '2018-06-16 01:39:18'),
(10, NULL, 'Laravel Password Grant Client', 'tHHz141WR1zM7o8mzBxs5WZjyMaz9XIpN0HDCSkq', 'http://localhost', 0, 1, 0, '2018-06-16 01:39:18', '2018-06-16 01:39:18'),
(11, NULL, 'Laravel Personal Access Client', '7zeJ9xtvI45mtz8ipJZxneeQsr2GXfY7WKZSW9nQ', 'http://localhost', 1, 0, 0, '2018-06-18 06:53:30', '2018-06-18 06:53:30'),
(12, NULL, 'Laravel Password Grant Client', 'RmV0ONrpzjTiks53D1Qi4FTrUCF6jWx6xudSi5nT', 'http://localhost', 0, 1, 0, '2018-06-18 06:53:30', '2018-06-18 06:53:30');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-09-11 02:15:52', '2017-09-11 02:15:52'),
(2, 3, '2017-12-19 03:09:22', '2017-12-19 03:09:22'),
(3, 5, '2017-12-28 03:16:30', '2017-12-28 03:16:30'),
(4, 7, '2018-06-16 01:39:05', '2018-06-16 01:39:05'),
(5, 9, '2018-06-16 01:39:18', '2018-06-16 01:39:18'),
(6, 11, '2018-06-18 06:53:30', '2018-06-18 06:53:30');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `label` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `module` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `label`, `name`, `description`, `module`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Update', 'can_update', 'Update Permission for CMS', 1, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', '2020-01-06 18:30:00'),
(2, 'View', 'can_view', 'View Permission for CMS', 1, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', '2020-01-05 18:30:00'),
(3, 'Create', 'can_create', 'Create Permission for CMS', 1, 1, '2017-12-13 18:30:00', '2017-12-13 18:30:00', '2020-01-05 18:30:00'),
(4, 'Delete', 'can_delete', 'Delete Permission for CMS', 1, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', '2020-01-05 18:30:00'),
(5, 'Update', 'can_update', 'Update Permission for Email Template', 2, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', '2019-12-24 18:30:00'),
(6, 'View', 'can_view', 'View Permission for Email Template', 2, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', '2019-12-24 18:30:00'),
(7, 'Create', 'can_create', 'Create Permission for Email Template', 2, 1, '2017-12-13 18:30:00', '2017-12-13 18:30:00', '2019-12-24 18:30:00'),
(8, 'Delete', 'can_delete', 'Delete Permission for Email Template', 2, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', '2019-12-24 18:30:00'),
(9, 'Update', 'can_update', 'Update Permission for Role', 3, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', NULL),
(10, 'View', 'can_view', 'View Permission for Role', 3, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', NULL),
(11, 'Create', 'can_create', 'Create Permission for Role', 3, 1, '2017-12-13 18:30:00', '2017-12-13 18:30:00', NULL),
(17, 'Update', 'can_update', 'Update Permission for Settings', 5, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', NULL),
(18, 'View', 'can_view', 'View Permission for Settings', 5, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', NULL),
(39, 'View', 'can_view', 'View Permission for Categories', 10, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', NULL),
(41, 'Delete', 'can_delete', 'Delete Permission for sub-categories', 11, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', NULL),
(42, 'Create', 'can_create', 'Create Permission for sub-categories', 11, 1, '2017-12-13 18:30:00', '2017-12-13 18:30:00', NULL),
(43, 'View', 'can_view', 'View Permission for sub-categories', 11, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', NULL),
(44, 'Update', 'can_update', 'Update Permission for sub-categories', 11, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', NULL),
(45, 'Create', 'can_create', 'Create Permission for Settings', 5, 1, '2017-12-13 18:30:00', '2017-12-13 18:30:00', NULL),
(46, 'View', 'can_view', 'View Permission for Dashboard', 12, 1, '2017-12-12 18:30:00', '2017-12-12 18:30:00', NULL),
(47, 'Create', 'can_create', 'Create Permission for Categories', 10, 1, '2020-02-21 09:07:48', '2020-02-21 09:07:48', NULL),
(48, 'Update', 'can_update', 'Update Permission for Categories', 10, 1, '2020-02-21 10:10:07', '2020-02-21 10:10:07', NULL),
(49, 'Delete', 'can_delete', 'Delete Permission for Categories', 10, 1, '2020-02-21 10:37:05', '2020-02-21 10:37:05', NULL),
(50, 'View', 'can_view', 'View Permission for Products', 13, 1, '2020-02-23 18:30:00', '2020-02-23 18:30:00', NULL),
(51, 'Create', 'can_create', 'Create Permission for Products', 13, 1, '2020-02-24 09:07:48', '2020-02-24 09:07:48', NULL),
(52, 'Update', 'can_update', 'Update Permission for Products', 13, 1, '2020-02-24 10:10:07', '2020-02-24 10:10:07', NULL),
(53, 'Delete', 'can_delete', 'Delete Permission for Products', 13, 1, '2020-02-24 10:37:05', '2020-02-24 10:37:05', NULL),
(58, 'Delete', 'can_delete', 'Delete Permission for Vip', 14, 1, '2020-02-24 10:37:05', '2020-02-24 10:37:05', NULL),
(59, 'Update', 'can_update', 'Update Permission for Vip', 14, 1, '2020-02-24 10:10:07', '2020-02-24 10:10:07', NULL),
(60, 'Create', 'can_create', 'Create Permission for Vip', 14, 1, '2020-02-24 09:07:48', '2020-02-24 09:07:48', NULL),
(61, 'View', 'can_view', 'View Permission for Vip', 14, 1, '2020-02-23 18:30:00', '2020-02-23 18:30:00', NULL),
(62, 'Delete', 'can_delete', 'Delete Permission for Vip Setting', 16, 1, '2020-02-24 10:37:05', '2020-02-24 10:37:05', NULL),
(63, 'Update', 'can_update', 'Update Permission for Vip Setting', 16, 1, '2020-02-24 10:10:07', '2020-02-24 10:10:07', NULL),
(64, 'Create', 'can_create', 'Create Permission for Vip Setting', 16, 1, '2020-02-24 09:07:48', '2020-02-24 09:07:48', NULL),
(65, 'View', 'can_view', 'View Permission for Vip Setting', 16, 1, '2020-02-23 18:30:00', '2020-02-23 18:30:00', NULL),
(66, 'Delete', 'can_delete', 'Delete Permission for Anouncement', 15, 1, '2020-02-24 10:37:05', '2020-02-24 10:37:05', NULL),
(67, 'Update', 'can_update', 'Update Permission for Anouncement', 15, 1, '2020-02-24 10:10:07', '2020-02-24 10:10:07', NULL),
(68, 'Create', 'can_create', 'Create Permission for Anouncement', 15, 1, '2020-02-24 09:07:48', '2020-02-24 09:07:48', NULL),
(69, 'View', 'can_view', 'View Permission for Anouncement', 15, 1, '2020-02-23 18:30:00', '2020-02-23 18:30:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `catId` int(11) DEFAULT NULL,
  `subCatId` int(11) NOT NULL,
  `title_en` varchar(500) NOT NULL,
  `title_ur` varchar(500) DEFAULT NULL,
  `productImg` varchar(255) DEFAULT NULL,
  `trafficFlow` tinyint(2) DEFAULT '0' COMMENT '0-Left 1-Right',
  `label` varchar(255) DEFAULT NULL,
  `sortOrder` varchar(10) DEFAULT NULL,
  `productDesc_en` longtext,
  `productDesc_ur` longtext,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0=Inactive,1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `catId`, `subCatId`, `title_en`, `title_ur`, `productImg`, `trafficFlow`, `label`, `sortOrder`, `productDesc_en`, `productDesc_ur`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, '12 FACINGS', '12 چہرے', '1582722554.jpg', 1, '1584015069.png', '4', NULL, NULL, 1, '2020-02-26 13:09:14', '2020-04-02 14:46:10', '2020-04-02 14:46:10'),
(2, 1, 6, '6 FACINGS', '6 چہرے', '1582780238.jpg', 0, '1585824934.png', '3', NULL, NULL, 1, '2020-02-27 05:10:38', '2020-04-02 14:46:16', '2020-04-02 14:46:16'),
(3, 1, 6, '9 FACINGS', '9 چہرے', '1582780304.jpg', 0, '1585824996.png', '2', NULL, NULL, 1, '2020-02-27 05:11:44', '2020-04-02 14:46:20', '2020-04-02 14:46:20'),
(4, 1, 7, '3 FACINGS', '3 چہرے', '1582780343.jpg', 0, '1585825010.png', '1', NULL, NULL, 1, '2020-02-27 05:12:23', '2020-04-02 14:46:24', '2020-04-02 14:46:24'),
(5, 1, 7, '6 FACINGS', '6 چہرے', '1582780390.jpg', 0, '1585825023.png', '4', NULL, NULL, 1, '2020-02-27 05:13:10', '2020-04-02 14:47:35', '2020-04-02 14:47:35'),
(6, 3, 8, '1 SHELF', '1 شیلف', '1582780444.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:14:04', '2020-04-02 14:47:33', '2020-04-02 14:47:33'),
(7, 3, 9, '1 AND A HALF SHELF', '1 اور آدھی شیلف', '1582780486.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:14:46', '2020-04-02 14:47:30', '2020-04-02 14:47:30'),
(8, 3, 9, '2 SHELVES', '2 شیلف', '1582780523.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:15:23', '2020-04-02 14:47:28', '2020-04-02 14:47:28'),
(9, 3, 9, '3 SHELVES', '3 شیلف', '1582780559.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:15:59', '2020-04-02 14:47:26', '2020-04-02 14:47:26'),
(10, 3, 9, '4 SHELVES', '4 شیلف', '1582780596.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:16:36', '2020-04-02 14:47:23', '2020-04-02 14:47:23'),
(11, 4, 10, 'CHILLED PLACEMENT', 'بچی جگہ', '1582780649.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:17:29', '2020-04-02 14:47:21', '2020-04-02 14:47:21'),
(12, 4, 10, 'AMBIENT PLACEMENT', 'امیینٹ پلیس', '1582780702.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:18:22', '2020-04-02 14:47:18', '2020-04-02 14:47:18'),
(13, 4, 11, 'CHILLED PLACEMENT', 'بچی جگہ', '1582780776.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:19:36', '2020-04-02 14:47:16', '2020-04-02 14:47:16'),
(14, 4, 11, 'AMBIENT PLACEMENT', 'امیینٹ پلیس', '1582780819.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:20:19', '2020-04-02 14:47:14', '2020-04-02 14:47:14'),
(15, 4, 12, 'CHILLED PLACEMENT', 'بچی جگہ', '1582780855.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:20:55', '2020-04-02 14:47:11', '2020-04-02 14:47:11'),
(16, 4, 12, 'AMBIENT PLACEMENT', 'امیینٹ پلیس', '1582780895.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:21:35', '2020-04-02 14:47:08', '2020-04-02 14:47:08'),
(17, 4, 13, 'CHILLED PLACEMENT', 'بچی جگہ', '1582780933.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:22:13', '2020-04-02 14:47:03', '2020-04-02 14:47:03'),
(18, 4, 13, 'AMBIENT PLACEMENT', 'امیینٹ پلیس', '1582780975.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:22:55', '2020-04-02 14:46:53', '2020-04-02 14:46:53'),
(19, 5, 14, 'BABY COOLER', 'بیبی کولر', '1582781020.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:23:40', '2020-04-02 14:46:50', '2020-04-02 14:46:50'),
(20, 5, 14, 'SMALL OPEN FRONT COOLER', 'چھوٹے اوپن فرنٹ کولر', '1582781055.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:24:15', '2020-04-02 14:46:48', '2020-04-02 14:46:48'),
(21, 5, 14, 'COUNTER TOP COOLER', 'کاؤنٹر ٹاپ کولر', '1582781096.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:24:56', '2020-04-02 14:46:45', '2020-04-02 14:46:45'),
(22, 5, 14, 'OPEN FRONT COOLER', 'فرنٹ کولر کھولیں', '1582781142.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:25:42', '2020-04-02 14:46:42', '2020-04-02 14:46:42'),
(23, 5, 14, 'FAST LANE GLASS DOOR COOLER', 'فاسٹ لین گلاس دروازہ کولر', '1582781214.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:26:54', '2020-04-02 14:46:40', '2020-04-02 14:46:40'),
(24, 5, 14, 'MEGA DOOR COOLER', 'میگا ڈور کولر', '1582781253.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:27:33', '2020-04-02 14:46:37', '2020-04-02 14:46:37'),
(25, 5, 14, 'SLIM MEGA COOLER', 'سلیم میگا کولر', '1582781330.jpg', 0, NULL, NULL, NULL, NULL, 1, '2020-02-27 05:28:50', '2020-04-02 14:46:31', '2020-04-02 14:46:31'),
(26, 5, 14, 'CAN COOLER', 'کولر کر سکتے ہیں', '1582781505.jpg', 0, '1583935572.jpg', NULL, NULL, NULL, 1, '2020-02-27 05:31:45', '2020-04-02 14:46:28', '2020-04-02 14:46:28'),
(27, 1, 2, '12 Facings', '12 اطراف', '1585226443.png', 1, NULL, '1', '', '', 1, '2020-03-26 12:40:43', '2020-05-07 07:05:44', '2020-05-07 07:05:44'),
(28, 1, 6, '6 FACINGS', '6 اطراف', '1585839059.png', 1, NULL, '2', '', '', 1, '2020-04-02 14:50:59', '2020-05-07 07:06:41', '2020-05-07 07:06:41'),
(29, 1, 6, '9 FACINGS', '9 اطراف', '1585839583.png', 1, '-', '4', '', '', 1, '2020-04-02 14:59:43', '2020-05-07 07:06:34', '2020-05-07 07:06:34'),
(30, 1, 7, '3 FACINGS', '3 اطراف', '1585839698.png', 1, NULL, '4', '', '', 0, '2020-04-02 15:01:38', '2020-06-30 15:20:37', NULL),
(31, 1, 7, '6 FACINGS', '6 اطراف', '1585839862.png', 1, NULL, '5', '', '', 1, '2020-04-02 15:04:22', '2020-05-07 07:07:32', '2020-05-07 07:07:32'),
(32, 3, 8, '1 SHELF', '1 شیلف', '1588835911.png', 1, '-', '6', '', '', 1, '2020-04-02 15:06:50', '2020-05-07 07:18:31', NULL),
(33, 3, 9, '1 SHELF', '1 شیلف', '1588836050.png', 1, '-', '7', '', '', 1, '2020-04-02 15:13:37', '2020-05-07 07:20:50', NULL),
(34, 3, 9, '2 SHELVES', '2 شیلف', '1588836002.png', 1, '-', '8', '', '', 1, '2020-04-02 15:14:23', '2020-05-07 07:20:02', NULL),
(35, 3, 9, '3 SHELVES', '3 شیلف', '1588836014.png', 1, '-', '9', '', '', 1, '2020-04-02 15:15:13', '2020-05-07 07:20:14', NULL),
(36, 3, 8, '4 SHELVES', '4 شیلف', '1588856896.png', 1, '-', '10', 'Without 4 packs', 'Without 4 packs', 1, '2020-04-02 15:15:49', '2020-05-07 13:08:16', NULL),
(37, 4, 15, 'CHILLED PLACEMENT', 'ٹھنڈی جگہ', '1588835393.png', 1, '1585840882.png', '11', '', '', 1, '2020-04-02 15:20:53', '2020-05-07 07:09:53', NULL),
(38, 4, 15, 'AMBIENT PLACEMENT', 'وسیع جگہ', '1588835381.png', 1, '1585840960.png', '12', '', 'null', 1, '2020-04-02 15:22:40', '2020-05-07 07:09:41', NULL),
(39, 4, 24, 'CHILLED PLACEMENT', 'ٹھنڈی جگہ', '1588835434.png', 1, '1585841060.png', '13', '', '', 1, '2020-04-02 15:24:20', '2020-05-07 07:10:34', NULL),
(40, 4, 24, 'AMBIENT PLACEMENT', 'وسیع جگہ', '1588835423.png', 1, '1585841106.png', '14', '', '', 1, '2020-04-02 15:25:06', '2020-05-07 07:10:23', NULL),
(41, 4, 25, 'CHILLED PLACEMENT', 'ٹھنڈی جگہ', '1588835466.png', 1, '1585841202.png', '15', '', '', 1, '2020-04-02 15:26:42', '2020-05-07 07:11:06', NULL),
(42, 4, 25, 'AMBIENT PLACEMENT', 'وسیع جگہ', '1588835453.png', 1, '1585841246.png', '16', '', '', 1, '2020-04-02 15:27:26', '2020-05-07 07:10:53', NULL),
(43, 4, 26, 'CHILLED PLACEMENT', 'ٹھنڈی جگہ', '1588835846.png', 1, '1585841301.png', '17', '', '', 1, '2020-04-02 15:28:21', '2020-05-07 07:17:26', NULL),
(44, 4, 26, 'AMBIENT PLACEMENT', 'وسیع جگہ', '1588835829.png', 1, '1587110937.png', '18', '', '', 1, '2020-04-02 15:29:09', '2020-05-07 07:17:09', NULL),
(45, 5, 14, '<no-title>', '<no-title>', '1588855789.png', 1, '-', '20', '', '', 1, '2020-04-02 15:37:57', '2020-05-07 12:49:49', NULL),
(46, 5, 16, '<no-title>', '<no-title>', '1585841927.png', 1, NULL, '21', '', '', 1, '2020-04-02 15:38:47', '2020-05-07 13:01:47', '2020-05-07 13:01:47'),
(47, 5, 17, '<no-title>', '<no-title>', '1588855739.png', 1, '-', '22', '', '', 1, '2020-04-02 15:39:14', '2020-05-07 12:48:59', NULL),
(48, 5, 18, '<no-title>', '<no-title>', '1588855732.png', 1, '-', '23', '', '', 1, '2020-04-02 15:39:51', '2020-05-07 12:48:52', NULL),
(49, 5, 19, '<no-title>', '<no-title>', '1588855716.png', 1, '-', '24', '', '', 1, '2020-04-02 15:40:33', '2020-05-07 12:48:36', NULL),
(50, 5, 20, '<no-title>', '<no-title>', '1588855706.png', 1, '-', '25', '', '', 1, '2020-04-02 15:40:56', '2020-05-07 12:48:26', NULL),
(51, 5, 22, '<no-title>', '<no-title>', '1588849093.png', 1, '-', '26', '', '', 1, '2020-04-02 15:41:33', '2020-05-07 10:58:13', NULL),
(52, 5, 23, '<no-title>', '<no-title>', '1588856535.png', NULL, '-', '27', '', '', 1, '2020-04-02 15:42:10', '2020-05-07 13:02:43', NULL),
(53, 1, 2, '12 Facings', '12 اطراف', '1588768623.png', 1, '-', '1', '', '', 1, '2020-05-06 12:37:03', '2020-05-07 07:05:51', NULL),
(60, 1, 6, '9 FACINGS', '9 اطراف', '1593506822.png', 1, '-', '3', '', '', 1, '2020-05-06 15:33:34', '2020-06-30 15:47:03', NULL),
(61, 1, 6, '9 FACINGS', '9 اطراف', '1588779294.png', 1, '-', '5', '', '', 1, '2020-05-06 15:34:54', '2020-05-07 07:07:07', NULL),
(62, 1, 6, '9 FACINGS', '9 اطراف', '1588779333.png', 1, '', '6', '', '', 1, '2020-05-06 15:35:33', '2020-05-06 15:35:33', NULL),
(63, 1, 7, '6 FACINGS', '6 اطراف', '1588779451.png', 1, '-', '6', '', '', 1, '2020-05-06 15:37:31', '2020-05-06 15:37:46', NULL),
(64, 3, 8, '4 SHELVES', '4 شیلف', '1588837543.png', NULL, '-', '12', 'With 4 packs', 'With 4 packs', 1, '2020-05-07 07:45:43', '2020-05-07 07:49:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `redbull_settings`
--

CREATE TABLE `redbull_settings` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Site Settings',
  `field_type` varchar(50) NOT NULL DEFAULT 'input',
  `field_type_value` varchar(50) NOT NULL DEFAULT 'text',
  `seq_no` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL COMMENT 'Reference of user table	',
  `updated_by` int(11) DEFAULT NULL COMMENT 'Reference of user table',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `redbull_settings`
--

INSERT INTO `redbull_settings` (`id`, `label`, `name`, `value`, `description`, `type`, `field_type`, `field_type_value`, `seq_no`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Application Title', 'app_title', 'WING MAN', NULL, 1, 'input', 'text', 1, NULL, NULL, NULL, '2020-04-20 07:02:01', NULL),
(2, 'Application Sub-Title', 'app_subtitle', 'PROGRAM 2020', NULL, 1, 'input', 'text', 1, NULL, NULL, NULL, '2020-04-20 07:02:01', NULL),
(3, 'Language Text', 'app_lang', 'Select language to start', NULL, 1, 'input', 'text', 1, NULL, NULL, NULL, '2020-04-20 07:24:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(2) DEFAULT '1' COMMENT '0=Inactive, 1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 1, '2017-12-14 18:30:00', '2019-12-31 05:34:04', NULL),
(2, 'Vendors (Store Owners)', 1, '2017-12-15 05:26:07', '2020-01-17 00:48:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=REDUNDANT;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7256, 1, 11, '2020-01-15 01:12:01', '2020-01-15 01:12:01', NULL),
(7257, 1, 9, '2020-01-15 01:12:01', '2020-01-15 01:12:01', NULL),
(7258, 1, 10, '2020-01-15 01:12:01', '2020-01-15 01:12:01', NULL),
(7259, 1, 45, '2020-01-15 01:12:01', '2020-01-15 01:12:01', NULL),
(7260, 1, 17, '2020-01-15 01:12:01', '2020-01-15 01:12:01', NULL),
(7261, 1, 18, '2020-01-15 01:12:01', '2020-01-15 01:12:01', NULL),
(7262, 1, 39, '2020-01-15 01:12:01', '2020-01-15 01:12:01', NULL),
(7263, 1, 42, '2020-01-15 01:12:01', '2020-01-15 01:12:01', NULL),
(7264, 1, 44, '2020-01-15 01:12:01', '2020-01-15 01:12:01', NULL),
(7265, 1, 43, '2020-01-15 01:12:01', '2020-01-15 01:12:01', NULL),
(7266, 1, 41, '2020-01-15 01:12:01', '2020-01-15 01:12:01', NULL),
(7338, 1, 46, '2020-01-15 01:12:01', '2020-01-15 01:12:01', NULL),
(7359, 2, 39, '2020-01-17 00:48:09', '2020-01-17 00:48:09', NULL),
(7360, 2, 46, '2020-01-17 00:48:09', '2020-01-17 00:48:09', NULL),
(7361, 1, 47, '2020-02-21 09:26:37', '2020-02-21 09:26:37', NULL),
(7362, 1, 48, '2020-02-21 10:11:22', '2020-02-21 10:11:22', NULL),
(7363, 1, 49, '2020-02-21 10:38:03', '2020-02-21 10:38:03', NULL),
(7364, 1, 50, '2020-02-24 07:08:58', '2020-02-24 07:08:58', NULL),
(7365, 1, 51, '2020-02-24 07:12:12', '2020-02-24 07:12:12', NULL),
(7366, 1, 52, '2020-02-24 07:12:12', '2020-02-24 07:12:12', NULL),
(7367, 1, 53, '2020-02-24 07:12:43', '2020-02-24 07:12:43', NULL),
(7368, 1, 58, NULL, NULL, NULL),
(7369, 1, 59, NULL, NULL, NULL),
(7370, 1, 60, '2020-02-23 18:30:00', NULL, NULL),
(7371, 1, 61, '2020-02-23 18:30:00', NULL, NULL),
(7372, 1, 62, '2020-02-21 10:38:03', '2020-02-21 10:38:03', NULL),
(7373, 1, 63, '2020-02-24 07:08:58', '2020-02-24 07:08:58', NULL),
(7374, 1, 64, '2020-02-24 07:12:12', '2020-02-24 07:12:12', NULL),
(7375, 1, 65, '2020-02-24 07:12:12', '2020-02-24 07:12:12', NULL),
(7376, 1, 66, '2020-02-21 10:38:03', '2020-02-21 10:38:03', NULL),
(7377, 1, 67, '2020-02-24 07:08:58', '2020-02-24 07:08:58', NULL),
(7378, 1, 68, '2020-02-24 07:12:12', '2020-02-24 07:12:12', NULL),
(7379, 1, 69, '2020-02-24 07:12:12', '2020-02-24 07:12:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Site Settings',
  `field_type` varchar(50) NOT NULL DEFAULT 'input',
  `field_type_value` varchar(50) NOT NULL DEFAULT 'text',
  `seq_no` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL COMMENT 'Reference of user table	',
  `updated_by` int(11) DEFAULT NULL COMMENT 'Reference of user table',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `label`, `name`, `value`, `description`, `type`, `field_type`, `field_type_value`, `seq_no`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Site Email', 'Email', 'dharmeshkt@weblineindia.com', NULL, 1, 'input', 'email', 1, 1, 1, '2017-09-14 14:30:00', '2019-11-30 00:40:19', NULL),
(2, 'From Email', 'from_email', 'dharmeshkt@weblineindia.com', NULL, 1, 'input', 'email', 2, 1, 1, '2017-10-03 20:00:00', '2019-11-30 00:40:19', NULL),
(3, 'Allowed IPs', 'allowed_ips', '192.168.100.161,192.168.100.130,192.168.100.134,203.88.154.206,185.173.60.9,192.168.100.116', NULL, 1, 'textarea', '', 3, 1, 1, '2017-09-14 20:00:00', '2018-07-09 06:19:16', NULL),
(4, 'Records Per Page', 'records_per_page', '10', NULL, 1, 'input', 'number', 4, 1, 1, '2017-12-24 18:30:00', '2020-01-07 06:05:50', NULL),
(5, 'Host', 'host', 'localhost', NULL, 2, 'input', 'text', 1, 1, 1, '2017-09-14 14:30:00', '2017-09-29 02:43:40', NULL),
(6, 'Port', 'port', '25', NULL, 2, 'input', 'number', 4, 1, 1, '2017-10-03 20:00:00', '2017-10-04 07:25:10', NULL),
(7, 'Username', 'username', NULL, NULL, 2, 'input', 'text', 2, 1, 1, '2017-09-14 20:00:00', '2018-01-25 01:38:30', NULL),
(8, 'Password', 'password', NULL, NULL, 2, 'input', 'text', 3, 1, 1, '2017-12-24 18:30:00', '2018-04-24 08:23:13', NULL),
(9, 'Encryption', 'encryption', 'tls', NULL, 2, 'input', 'text', 5, 1, 1, '2017-12-24 18:30:00', '2018-01-15 01:32:05', NULL),
(10, 'TTL Minimum Value', 'ttl_minimum_value', '2', NULL, 4, 'input', 'number', 1, 1, 1, '2017-10-03 20:00:00', '2018-06-20 23:47:14', '2020-04-20 11:10:44'),
(11, 'TTL Maximum Value', 'ttl_maximum_value', '14', NULL, 4, 'input', 'number', 2, 1, 1, '2017-10-03 20:00:00', '2019-02-12 11:40:56', '2020-04-20 11:10:41'),
(12, 'Vote Weight', 'vote_weight', '2', NULL, 3, 'input', 'number', 1, 1, 1, '2017-10-03 20:00:00', '2019-04-03 08:36:31', '2020-04-20 11:10:37'),
(13, 'Open Weight', 'open_weight', '1', NULL, 3, 'input', 'number', 2, 1, 1, '2017-10-03 20:00:00', '2019-04-03 08:26:45', '2020-04-20 11:10:34'),
(14, 'Share Weight', 'share_weight', '0', NULL, 3, 'input', 'number', 3, 1, 1, '2017-10-03 20:00:00', '2017-10-04 07:25:10', '2020-04-20 11:10:30'),
(15, 'Comment Weight', 'comment_weight', '0', NULL, 3, 'input', 'number', 4, 1, 1, '2017-10-03 20:00:00', '2017-10-04 07:25:10', '2020-04-20 11:10:26'),
(16, 'TTL Default Value', 'ttl_default_value', '7', NULL, 4, 'input', 'number', 3, 1, 1, '2017-10-03 20:00:00', '2017-10-04 07:25:10', '2020-04-20 11:10:23'),
(17, 'TTL Rank Add', 'ttl_rank_add', '1', NULL, 4, 'input', 'number', 4, 1, 1, '2017-10-03 20:00:00', '2017-10-04 07:25:10', '2020-04-20 11:10:18'),
(18, 'TTL Rank Percent', 'ttl_rank_percent', '0.9', NULL, 4, 'input', 'number', 5, 1, 1, '2017-10-03 20:00:00', '2018-06-20 23:48:19', '2020-04-20 11:10:15'),
(19, 'TTL Depreciation', 'ttl_depreciation', '1.05', NULL, 4, 'input', 'number', 6, 1, 1, '2017-10-03 20:00:00', '2017-10-04 07:25:10', '2020-04-20 11:10:07'),
(20, 'Title', 'title', 'Dashboard', NULL, 1, 'input', 'text', 5, 1, 1, '2017-10-03 20:00:00', '2020-01-17 01:03:16', '2020-04-20 11:10:02'),
(21, 'Logo', 'logo', '1579262416_logo.svg', NULL, 1, 'input', 'file', 6, 1, 1, '2017-10-03 20:00:00', '2020-01-17 06:30:16', '2020-04-20 11:09:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0' COMMENT '0=Inactive,1=Active',
  `email_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `contact_number`, `domain`, `status`, `email_token`, `remember_token`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super', 'Admin', 'admin@redbullpwa.com', '$2y$10$HtL8Op8bCRK/ZOH37iLQ.OGKNcRmbVIJpCzqlEk7WlE8sXiXeK9JW', '1234567899', '', 1, NULL, 'C7tLLbsHGn7lbniu3wqjhq8q8k2sJoDfXofI48iSyMEtdDHCKeNu9sKsw3GD', NULL, NULL, '2017-12-18 04:10:48', '2020-02-26 13:20:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `user_id`, `role_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, '2017-12-14 18:30:00', '2017-12-14 18:30:00', NULL),
(9, 6, 2, 1, '2020-01-16 04:06:18', '2020-01-16 04:06:18', NULL),
(13, 5, 2, 1, '2020-01-16 04:11:01', '2020-01-16 04:11:01', NULL),
(20, 7, 2, 1, '2020-01-16 05:04:27', '2020-01-16 05:04:27', NULL),
(23, 4, 2, 1, '2020-01-16 05:04:27', '2020-01-16 05:04:27', NULL),
(24, 8, 2, 1, '2020-01-21 00:22:53', '2020-01-21 00:22:53', NULL),
(25, 9, 2, 1, '2020-01-21 00:24:24', '2020-01-21 00:24:24', NULL),
(26, 10, 2, 1, '2020-01-21 00:27:56', '2020-01-21 00:27:56', NULL),
(27, 11, 2, 1, '2020-01-21 00:30:51', '2020-01-21 00:30:51', NULL),
(28, 12, 2, 1, '2020-01-21 00:46:08', '2020-01-21 00:46:08', NULL),
(29, 13, 2, 1, '2020-01-21 00:48:01', '2020-01-21 00:48:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vip_categories`
--

CREATE TABLE `vip_categories` (
  `id` int(11) NOT NULL,
  `title_en` varchar(500) NOT NULL,
  `title_ur` varchar(500) NOT NULL,
  `description_en` longtext,
  `description_ur` longtext,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0=Inactive,1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vip_categories`
--

INSERT INTO `vip_categories` (`id`, `title_en`, `title_ur`, `description_en`, `description_ur`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'CATEGORY A', 'قسم A', '<table align=\"left\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<thead>\r\n		<tr>\r\n			<td style=\"height:39.0pt; width:144pt\">&nbsp;</td>\r\n			<td style=\"height:39.0pt; width:109pt\"><strong>Current Situation</strong></td>\r\n			<td style=\"height:39.0pt; width:113pt\"><strong>Pre Excise And Pre VAT Situation</strong></td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Recommended Selling Price</td>\r\n			<td style=\"height:14.4pt\">10</td>\r\n			<td style=\"height:14.4pt\">5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">VAT</td>\r\n			<td style=\"height:14.4pt\">0.48</td>\r\n			<td style=\"height:14.4pt\">0</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Net Shelf Price</td>\r\n			<td style=\"height:14.4pt\">9.52</td>\r\n			<td style=\"height:14.4pt\">5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">List Price</td>\r\n			<td style=\"height:14.4pt\">4.3125</td>\r\n			<td style=\"height:14.4pt\">5.21</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Rebates %</td>\r\n			<td style=\"height:14.4pt\">14%</td>\r\n			<td style=\"height:14.4pt\">14%</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Rebates Amount</td>\r\n			<td style=\"height:14.4pt\">0.6</td>\r\n			<td style=\"height:14.4pt\">0.72</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Excise Tax</td>\r\n			<td style=\"height:14.4pt\">4.68</td>\r\n			<td style=\"height:14.4pt\">0</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Net Buying Price</td>\r\n			<td style=\"height:14.4pt\">8.39</td>\r\n			<td style=\"height:14.4pt\">4.48</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Trade Margin</td>\r\n			<td style=\"height:14.4pt\">1.14</td>\r\n			<td style=\"height:14.4pt\">1.02</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', '<table align=\"left\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<thead>\r\n		<tr>\r\n			<td style=\"height:39.0pt; width:144pt\">&nbsp;</td>\r\n			<td style=\"height:39.0pt; width:109pt\"><strong>حالیہ حالت</strong></td>\r\n			<td style=\"height:39.0pt; width:113pt\"><strong>ایکسائز اور ویٹ سے قبل حالت</strong></td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">تجویز کردہ قیمت فروخت</td>\r\n			<td style=\"height:14.4pt\">10</td>\r\n			<td style=\"height:14.4pt\">5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ویٹ</td>\r\n			<td style=\"height:14.4pt\">0.48</td>\r\n			<td style=\"height:14.4pt\">0</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">شیلف کی کل قیمت</td>\r\n			<td style=\"height:14.4pt\">9.52</td>\r\n			<td style=\"height:14.4pt\">5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">فہرست کی قیمت</td>\r\n			<td style=\"height:14.4pt\">4.3125</td>\r\n			<td style=\"height:14.4pt\">5.21</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ریبیٹ %</td>\r\n			<td style=\"height:14.4pt\">14%</td>\r\n			<td style=\"height:14.4pt\">14%</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ریبیٹ کی رقم</td>\r\n			<td style=\"height:14.4pt\">0.6</td>\r\n			<td style=\"height:14.4pt\">0.72</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ایکسائز ٹیکس</td>\r\n			<td style=\"height:14.4pt\">4.68</td>\r\n			<td style=\"height:14.4pt\">0</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">کل قیمت خریدار</td>\r\n			<td style=\"height:14.4pt\">8.39</td>\r\n			<td style=\"height:14.4pt\">4.48</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ٹریڈ کا مارجن</td>\r\n			<td style=\"height:14.4pt\">1.14</td>\r\n			<td style=\"height:14.4pt\">1.02</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, '2020-03-12 13:55:30', '2020-04-28 10:56:54', NULL),
(2, 'CATEGORY B', 'قسم B', '<table align=\"left\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<thead>\r\n		<tr>\r\n			<td style=\"height:39.0pt; width:144pt\">&nbsp;</td>\r\n			<td style=\"height:39.0pt; width:109pt\"><strong>Current Situation</strong></td>\r\n			<td style=\"height:39.0pt; width:113pt\"><strong>Pre Excise And Pre VAT Situation</strong></td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Recommended Selling Price</td>\r\n			<td style=\"height:14.4pt\">10</td>\r\n			<td style=\"height:14.4pt\">5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">VAT</td>\r\n			<td style=\"height:14.4pt\">0.48</td>\r\n			<td style=\"height:14.4pt\">0</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Net Shelf Price</td>\r\n			<td style=\"height:14.4pt\">9.52</td>\r\n			<td style=\"height:14.4pt\">5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">List Price</td>\r\n			<td style=\"height:14.4pt\">4.3125</td>\r\n			<td style=\"height:14.4pt\">5.21</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Rebates %</td>\r\n			<td style=\"height:14.4pt\">12%</td>\r\n			<td style=\"height:14.4pt\">12%</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Rebates Amount</td>\r\n			<td style=\"height:14.4pt\">0.52</td>\r\n			<td style=\"height:14.4pt\">0.62</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Excise Tax</td>\r\n			<td style=\"height:14.4pt\">4.68</td>\r\n			<td style=\"height:14.4pt\">0</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Net Buying Price</td>\r\n			<td style=\"height:14.4pt\">8.48</td>\r\n			<td style=\"height:14.4pt\">4.58</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Trade Margin</td>\r\n			<td style=\"height:14.4pt\">1.05</td>\r\n			<td style=\"height:14.4pt\">0.92</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', '<table align=\"left\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<thead>\r\n		<tr>\r\n			<td style=\"height:39.0pt; width:144pt\">&nbsp;</td>\r\n			<td style=\"height:39.0pt; width:109pt\"><strong>حالیہ حالت</strong></td>\r\n			<td style=\"height:39.0pt; width:113pt\"><strong>ایکسائز اور ویٹ سے قبل حالت</strong></td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">تجویز کردہ قیمت فروخت</td>\r\n			<td style=\"height:14.4pt\">10</td>\r\n			<td style=\"height:14.4pt\">5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ویٹ</td>\r\n			<td style=\"height:14.4pt\">0.48</td>\r\n			<td style=\"height:14.4pt\">0</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">شیلف کی کل قیمت</td>\r\n			<td style=\"height:14.4pt\">9.52</td>\r\n			<td style=\"height:14.4pt\">5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">فہرست کی قیمت</td>\r\n			<td style=\"height:14.4pt\">4.3125</td>\r\n			<td style=\"height:14.4pt\">5.21</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ریبیٹ %</td>\r\n			<td style=\"height:14.4pt\">12%</td>\r\n			<td style=\"height:14.4pt\">12%</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ریبیٹ کی رقم</td>\r\n			<td style=\"height:14.4pt\">0.52</td>\r\n			<td style=\"height:14.4pt\">0.62</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ایکسائز ٹیکس</td>\r\n			<td style=\"height:14.4pt\">4.68</td>\r\n			<td style=\"height:14.4pt\">0</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">کل قیمت خریدار</td>\r\n			<td style=\"height:14.4pt\">8.48</td>\r\n			<td style=\"height:14.4pt\">4.58</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ٹریڈ کا مارجن</td>\r\n			<td style=\"height:14.4pt\">1.05</td>\r\n			<td style=\"height:14.4pt\">0.92</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, '2020-03-12 13:55:51', '2020-04-28 10:57:55', NULL),
(3, 'CATEGORY C', 'قسم C', '<table align=\"left\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<thead>\r\n		<tr>\r\n			<td style=\"height:39.0pt; width:144pt\">&nbsp;</td>\r\n			<td style=\"height:39.0pt; width:109pt\"><strong>Current Situation</strong></td>\r\n			<td style=\"height:39.0pt; width:113pt\"><strong>Pre Excise And Pre VAT Situation</strong></td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Recommended Selling Price</td>\r\n			<td style=\"height:14.4pt\">10</td>\r\n			<td style=\"height:14.4pt\">5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">VAT</td>\r\n			<td style=\"height:14.4pt\">0.48</td>\r\n			<td style=\"height:14.4pt\">0</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Net Shelf Price</td>\r\n			<td style=\"height:14.4pt\">9.52</td>\r\n			<td style=\"height:14.4pt\">5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">List Price</td>\r\n			<td style=\"height:14.4pt\">4.3125</td>\r\n			<td style=\"height:14.4pt\">5.21</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Rebates %</td>\r\n			<td style=\"height:14.4pt\">9%</td>\r\n			<td style=\"height:14.4pt\">9%</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Rebates Amount</td>\r\n			<td style=\"height:14.4pt\">0.39</td>\r\n			<td style=\"height:14.4pt\">0.75</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Excise Tax</td>\r\n			<td style=\"height:14.4pt\">4.68</td>\r\n			<td style=\"height:14.4pt\">0</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Net Buying Price</td>\r\n			<td style=\"height:14.4pt\">8.6</td>\r\n			<td style=\"height:14.4pt\">4.74</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">Trade Margin</td>\r\n			<td style=\"height:14.4pt\">0.92</td>\r\n			<td style=\"height:14.4pt\">0.76</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', '<table align=\"left\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<thead>\r\n		<tr>\r\n			<td style=\"height:39.0pt; width:144pt\">&nbsp;</td>\r\n			<td style=\"height:39.0pt; width:109pt\"><strong>حالیہ حالت</strong></td>\r\n			<td style=\"height:39.0pt; width:113pt\"><strong>ایکسائز اور ویٹ سے قبل حالت</strong></td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">تجویز کردہ قیمت فروخت</td>\r\n			<td style=\"height:14.4pt\">10</td>\r\n			<td style=\"height:14.4pt\">5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ویٹ</td>\r\n			<td style=\"height:14.4pt\">0.48</td>\r\n			<td style=\"height:14.4pt\">0</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">شیلف کی کل قیمت</td>\r\n			<td style=\"height:14.4pt\">9.52</td>\r\n			<td style=\"height:14.4pt\">5.5</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">فہرست کی قیمت</td>\r\n			<td style=\"height:14.4pt\">4.3125</td>\r\n			<td style=\"height:14.4pt\">5.21</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ریبیٹ %</td>\r\n			<td style=\"height:14.4pt\">9%</td>\r\n			<td style=\"height:14.4pt\">9%</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ریبیٹ کی رقم</td>\r\n			<td style=\"height:14.4pt\">0.39</td>\r\n			<td style=\"height:14.4pt\">0.75</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ایکسائز ٹیکس</td>\r\n			<td style=\"height:14.4pt\">4.68</td>\r\n			<td style=\"height:14.4pt\">0</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">کل قیمت خریدار</td>\r\n			<td style=\"height:14.4pt\">8.6</td>\r\n			<td style=\"height:14.4pt\">4.74</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n			<td style=\"height:14.4pt\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:14.4pt\">ٹریڈ کا مارجن</td>\r\n			<td style=\"height:14.4pt\">0.92</td>\r\n			<td style=\"height:14.4pt\">0.76</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 1, '2020-04-03 09:55:31', '2020-04-28 10:58:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vip_details`
--

CREATE TABLE `vip_details` (
  `id` int(11) NOT NULL,
  `vipId` int(11) NOT NULL,
  `detailTitle_en` varchar(255) DEFAULT NULL,
  `detailTitle_ur` varchar(255) DEFAULT NULL,
  `subTitle_en` varchar(255) DEFAULT NULL,
  `subTitle_ur` varchar(255) DEFAULT NULL,
  `vipImg` varchar(255) DEFAULT NULL,
  `description_en` longtext,
  `description_ur` longtext,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vip_details`
--

INSERT INTO `vip_details` (`id`, `vipId`, `detailTitle_en`, `detailTitle_ur`, `subTitle_en`, `subTitle_ur`, `vipImg`, `description_en`, `description_ur`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Detail Title 1', 'تفصیل سے عنوان 1', 'Sub Title 1', 'ذیلی عنوان 1', '1584021532.jpg', '<p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', '<p>لوریم اِپسم پرنٹنگ اور ٹائپسیٹنگ انڈسٹری کا صرف ڈمی متن ہے۔ لوریم ایپسم 1500s کے بعد سے ہی انڈسٹری کا معیاری ڈمی متن رہا ہے ، جب ایک نامعلوم پرنٹر ٹائپ کی ایک گیلی لے کر اس کو ٹائپ کرتے ہوئے ٹائپ نمونہ کی کتاب بناتا ہے۔</p>', 1, '2020-03-12 13:58:52', '2020-04-03 09:49:53', '2020-04-03 09:49:53'),
(2, 1, '<none>', '<none>', 'Range', 'حد', '1587113623.png', NULL, 'null', 1, '2020-04-03 09:45:28', '2020-06-30 15:14:43', NULL),
(3, 1, 'Min 12 facings', 'کم سے کم 12 اطراف', 'Main Placement Chilled', 'مرکزی ٹھنڈی جگہ', '1587113667.png', 'null', 'null', 1, '2020-04-03 09:49:49', '2020-06-30 15:48:29', NULL),
(4, 1, 'Ambient', 'وسیع', 'Additional Placement', 'مزید جگہ', '1587113753.png', NULL, 'null', 1, '2020-04-03 09:50:34', '2020-06-30 15:31:06', NULL),
(5, 1, '<none>', '<none>', 'Cashier Cooler', 'کیشئرر کولر', '1587113730.png', NULL, 'null', 1, '2020-04-03 09:51:13', '2020-06-30 15:31:13', NULL),
(6, 1, '<none>', '<none>', 'POS', 'پی او سی', '1587113770.png', NULL, 'null', 1, '2020-04-03 09:51:56', '2020-06-30 15:31:18', NULL),
(7, 1, 'Recommended Selling Price', 'تجویز کردہ قیمت فروخت', 'Price', 'قیمت', '1587113803.png', '<p>Incl. VAT</p>', '<p>ویٹ شامل ہے</p>', 1, '2020-04-03 09:52:57', '2020-04-28 11:10:49', NULL),
(8, 2, '<none>', '<none>', 'Range', 'حد', '1587113820.png', NULL, 'null', 1, '2020-04-03 09:57:04', '2020-06-30 15:31:29', NULL),
(9, 2, 'Min 9 facings', 'کم سے کم 9 اطراف', 'Main Placement Chilled', 'مرکزی ٹھنڈی جگہ', '1587113829.png', NULL, 'null', 1, '2020-04-03 09:57:52', '2020-06-30 15:33:40', NULL),
(10, 2, 'Ambient', 'وسیع', 'Additional Placement', 'مزید جگہ', '1587113840.png', NULL, 'null', 1, '2020-04-03 09:58:25', '2020-06-30 15:31:47', NULL),
(11, 2, '<none>', '<none>', 'Cashier Cooler', 'کیشئرر کولر', '1587113851.png', NULL, 'null', 1, '2020-04-03 09:58:50', '2020-06-30 15:33:58', NULL),
(12, 2, '<none>', '<none>', 'POS', 'پی او سی', '1587113865.png', NULL, 'null', 1, '2020-04-03 09:59:16', '2020-06-30 15:32:08', NULL),
(13, 2, 'Recommended Selling Price', 'تجویز کردہ قیمت فروخت', 'Price', 'قیمت', '1587113874.png', '<p>Incl. VAT</p>', '<p>ویٹ شامل ہے</p>', 1, '2020-04-03 09:59:43', '2020-04-28 11:26:08', NULL),
(14, 3, '<none>', '<none>', 'Range', 'حد', '1587113893.png', NULL, 'null', 1, '2020-04-03 10:00:30', '2020-06-30 15:32:16', NULL),
(15, 3, 'Min 6 facings', 'کم سے کم 6 اطراف', 'Main Placement Chilled', 'مرکزی ٹھنڈی جگہ', '1587113905.png', NULL, 'null', 1, '2020-04-03 10:01:08', '2020-06-30 15:32:22', NULL),
(16, 3, '<none>', '<none>', 'POS', 'پی او سی', '1587113920.png', NULL, 'null', 1, '2020-04-03 10:01:42', '2020-06-30 15:32:28', NULL),
(17, 3, 'Recommended Selling Price', 'تجویز کردہ قیمت فروخت', 'Price', 'قیمت', '1587113929.png', '<p>Incl. VAT</p>', '<p>ویٹ شامل ہے</p>', 1, '2020-04-03 10:02:11', '2020-04-28 11:29:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vip_setting`
--

CREATE TABLE `vip_setting` (
  `id` int(11) NOT NULL,
  `vipImg` varchar(255) DEFAULT NULL,
  `description_en` longtext,
  `description_ur` longtext,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vip_setting`
--

INSERT INTO `vip_setting` (`id`, `vipImg`, `description_en`, `description_ur`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, '1584620394.png', '<p>This is a special members club where you will receive discounts based on counterparts in store that will drive incremental sales, helping you earn more profit!</p>', '<p>یہ ایک خصوصی ممبروں کا کلب ہے جہاں آپ کو اسٹور میں ایک جیسی چیزوں پر رعایت ملے گی جو آپ کو زیادہ سے زیادہ منافع کمانے میں مدد فراہم کرنے والے اضافی فروخت کو چلائے گی۔</p>', 1, '2020-03-19 02:41:08', '2020-04-28 10:48:44', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anouncement`
--
ALTER TABLE `anouncement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `redbull_settings`
--
ALTER TABLE `redbull_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vip_categories`
--
ALTER TABLE `vip_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vip_details`
--
ALTER TABLE `vip_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vip_setting`
--
ALTER TABLE `vip_setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anouncement`
--
ALTER TABLE `anouncement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `redbull_settings`
--
ALTER TABLE `redbull_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7380;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `vip_categories`
--
ALTER TABLE `vip_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vip_details`
--
ALTER TABLE `vip_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `vip_setting`
--
ALTER TABLE `vip_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
