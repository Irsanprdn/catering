-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Sep 2024 pada 15.54
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sim_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_code` varchar(255) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `category_code`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'CA_01', 'Random', '2024-05-10 15:43:22', '2024-05-10 15:43:22'),
(2, 'CA_02', 'Paket', '2024-06-09 02:17:08', '2024-06-09 02:17:08'),
(3, 'CA_03', 'Olahan Ayam', '2024-07-16 12:38:19', '2024-07-16 12:38:19'),
(4, 'CA_04', 'Sayuran', '2024-07-23 03:15:17', '2024-07-23 03:15:17'),
(5, 'CA_05', 'Aneka Sambal', '2024-07-23 03:15:38', '2024-07-23 03:15:38'),
(6, 'CA_06', 'Olahan Daging', '2024-07-23 03:16:16', '2024-07-23 03:16:16'),
(7, 'CA_07', 'Olahan Mie', '2024-08-01 08:41:03', '2024-08-01 08:41:03'),
(8, 'CA_08', 'Olahan Tempe/Tahu', '2024-08-01 08:41:37', '2024-08-01 08:41:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `thousand_separator` varchar(255) NOT NULL,
  `decimal_separator` varchar(255) NOT NULL,
  `exchange_rate` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', ',', '.', NULL, '2024-05-10 15:43:22', '2024-05-10 15:43:22'),
(2, 'Rupiah', 'IDR', 'Rp.', '.', ',', NULL, '2024-05-10 16:03:16', '2024-05-10 16:03:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `customer_email`, `customer_phone`, `city`, `country`, `address`, `created_at`, `updated_at`) VALUES
(1, 'sopian', 'fhianguns@gmail.com', '087886868434', 'Bogor', 'Indonesia', 'Jl.Kemang Raya', '2024-05-10 16:07:03', '2024-07-12 11:54:25'),
(3, 'Irsan', 'muhammadirsanperdana@gmail.com', '083127284737', 'Tangerang', 'Indonesia', 'Gang palet kontrakan ungu pasir gadung cikupa', '2024-09-17 12:05:59', '2024-09-17 12:05:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `expenses`
--

INSERT INTO `expenses` (`id`, `category_id`, `date`, `reference`, `details`, `amount`, `created_at`, `updated_at`) VALUES
(2, 2, '2024-07-12', 'EXP-00001', 'Minyak goreng 2liter', 10000000, '2024-07-12 15:28:44', '2024-07-14 13:38:02'),
(3, 1, '2024-08-01', 'EXP-00003', 'Gas 3kg', 2500000, '2024-08-01 08:34:41', '2024-08-01 08:34:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `category_name`, `category_description`, `created_at`, `updated_at`) VALUES
(1, 'Keperluan Dapur', 'Gas dll', '2024-06-22 02:58:13', '2024-07-14 09:02:29'),
(2, 'Belanja', 'Belanja bumbu dapur', '2024-07-12 15:27:20', '2024-07-12 15:27:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'Modules\\Product\\Entities\\Product', 1, '65cd43ce-c40f-47ff-8b9f-4a496d0ac88c', 'images', '1715360559', '1715360559.jpg', 'image/jpeg', 'public', 'public', 11477, '[]', '[]', '{\"thumb\": true}', '[]', 1, '2024-05-10 16:02:44', '2024-05-10 16:02:46'),
(3, 'Modules\\Product\\Entities\\Product', 2, 'a4472370-4bcd-45f9-8900-1885377b48bb', 'images', '1720181172', '1720181172.jpg', 'image/jpeg', 'public', 'public', 41655, '[]', '[]', '{\"thumb\": true}', '[]', 1, '2024-07-05 11:06:22', '2024-07-05 11:06:23'),
(4, 'Modules\\Product\\Entities\\Product', 3, '4d242aac-cb98-49d6-b755-1f93e5a8dfa7', 'images', '1720181307', '1720181307.jpg', 'image/jpeg', 'public', 'public', 140124, '[]', '[]', '{\"thumb\": true}', '[]', 1, '2024-07-05 11:08:29', '2024-07-05 11:08:29'),
(5, 'Modules\\Product\\Entities\\Product', 4, 'be8d5720-8e99-46b5-ae54-99202f5e3fc7', 'images', '1721708403', '1721708403.jpg', 'image/jpeg', 'public', 'public', 236209, '[]', '[]', '{\"thumb\": true}', '[]', 1, '2024-07-23 03:20:05', '2024-07-23 03:20:07'),
(6, 'Modules\\Product\\Entities\\Product', 5, '3934b461-1dbf-466d-832a-a9897127a9da', 'images', '1721708539', '1721708539.jpg', 'image/jpeg', 'public', 'public', 48812, '[]', '[]', '{\"thumb\": true}', '[]', 1, '2024-07-23 03:22:39', '2024-07-23 03:22:39'),
(7, 'Modules\\Product\\Entities\\Product', 6, 'e2b127d9-c510-4d2b-adef-af2d25b78823', 'images', '1721708707', '1721708707.jpg', 'image/jpeg', 'public', 'public', 59002, '[]', '[]', '{\"thumb\": true}', '[]', 1, '2024-07-23 03:25:17', '2024-07-23 03:25:17'),
(9, 'App\\Models\\User', 30, '690b7978-e25d-464c-879d-e4ba9d3c4e3f', 'avatars', '1721917481', '1721917481.jpg', 'image/jpeg', 'public', 'public', 109993, '[]', '[]', '[]', '[]', 1, '2024-07-25 13:24:43', '2024-07-25 13:24:43'),
(11, 'App\\Models\\User', 1, 'b82f2401-8b71-485d-a712-241eccf1ad89', 'avatars', '1721995855', '1721995855.jpg', 'image/jpeg', 'public', 'public', 46531, '[]', '[]', '[]', '[]', 1, '2024-07-26 11:10:57', '2024-07-26 11:10:57'),
(12, 'App\\Models\\User', 31, '39f8bb8a-79fd-4dd9-86ff-ffada657fef0', 'avatars', '1722356096', '1722356096.jpg', 'image/jpeg', 'public', 'public', 46531, '[]', '[]', '[]', '[]', 1, '2024-07-30 15:15:02', '2024-07-30 15:15:02'),
(13, 'Modules\\Product\\Entities\\Product', 7, 'de0c11cb-c174-4e4e-aa8c-153528c6bd02', 'images', '1722505440', '1722505440.jpg', 'image/jpeg', 'public', 'public', 120993, '[]', '[]', '{\"thumb\": true}', '[]', 1, '2024-08-01 08:44:09', '2024-08-01 08:44:11'),
(14, 'Modules\\Product\\Entities\\Product', 8, '0bea4a44-aca4-40d7-a631-0e2e52f84bc6', 'images', '1722505594', '1722505594.jpg', 'image/jpeg', 'public', 'public', 70704, '[]', '[]', '{\"thumb\": true}', '[]', 1, '2024-08-01 08:46:37', '2024-08-01 08:46:37'),
(15, 'Modules\\Product\\Entities\\Product', 9, '9faeef2d-f074-4cc6-8a7c-3182d59c6b60', 'images', '1722505777', '1722505777.jpg', 'image/jpeg', 'public', 'public', 130798, '[]', '[]', '{\"thumb\": true}', '[]', 1, '2024-08-01 08:49:46', '2024-08-01 08:49:47'),
(16, 'Modules\\Product\\Entities\\Product', 10, 'c702f15a-c79b-4e79-928a-a607a81c3250', 'images', '1722506192', '1722506192.jpg', 'image/jpeg', 'public', 'public', 77577, '[]', '[]', '{\"thumb\": true}', '[]', 1, '2024-08-01 08:56:51', '2024-08-01 08:56:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_07_14_145038_create_categories_table', 1),
(5, '2021_07_14_145047_create_products_table', 1),
(6, '2021_07_15_211319_create_media_table', 1),
(7, '2021_07_16_010005_create_uploads_table', 1),
(8, '2021_07_16_220524_create_permission_tables', 1),
(9, '2021_07_22_003941_create_adjustments_table', 1),
(10, '2021_07_22_004043_create_adjusted_products_table', 1),
(11, '2021_07_28_192608_create_expense_categories_table', 1),
(12, '2021_07_28_192616_create_expenses_table', 1),
(13, '2021_07_29_165419_create_customers_table', 1),
(14, '2021_07_29_165440_create_suppliers_table', 1),
(15, '2021_07_31_015923_create_currencies_table', 1),
(16, '2021_07_31_140531_create_settings_table', 1),
(17, '2021_07_31_201003_create_sales_table', 1),
(18, '2021_07_31_212446_create_sale_details_table', 1),
(19, '2021_08_07_192203_create_sale_payments_table', 1),
(20, '2021_08_08_021108_create_purchases_table', 1),
(21, '2021_08_08_021131_create_purchase_payments_table', 1),
(22, '2021_08_08_021713_create_purchase_details_table', 1),
(23, '2021_08_08_175345_create_sale_returns_table', 1),
(24, '2021_08_08_175358_create_sale_return_details_table', 1),
(25, '2021_08_08_175406_create_sale_return_payments_table', 1),
(26, '2021_08_08_222603_create_purchase_returns_table', 1),
(27, '2021_08_08_222612_create_purchase_return_details_table', 1),
(28, '2021_08_08_222646_create_purchase_return_payments_table', 1),
(29, '2021_08_16_015031_create_quotations_table', 1),
(30, '2021_08_16_155013_create_quotation_details_table', 1),
(31, '2023_07_01_184221_create_units_table', 1),
(32, '2024_05_13_222336_drop_product_barcode_symbology_from_products_table', 2),
(33, '2024_08_26_202449_add_feature_self_order', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 30),
(1, 'App\\Models\\User', 31),
(2, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@gmail.com', '$2y$10$zSm6xSBJ.o4ECCwA2GWhdeo9VQpbafM9bvWZqSSg9JWJXZT7leg22', '2024-07-30 15:11:49'),
('fhianguns@gmail.com', '$2y$10$eeZ/WoM2VDNCn7m9UmggGuSz8j4hXWlXLP8NO3dvoklAH5Tu34MMm', '2024-07-30 15:15:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'edit_own_profile', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(2, 'access_user_management', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(3, 'show_total_stats', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(4, 'show_month_overview', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(5, 'show_weekly_sales_purchases', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(6, 'show_monthly_cashflow', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(7, 'show_notifications', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(8, 'access_products', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(9, 'create_products', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(10, 'show_products', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(11, 'edit_products', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(12, 'delete_products', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(13, 'access_product_categories', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(14, 'print_barcodes', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(15, 'access_adjustments', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(16, 'create_adjustments', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(17, 'show_adjustments', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(18, 'edit_adjustments', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(19, 'delete_adjustments', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(20, 'access_quotations', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(21, 'create_quotations', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(22, 'show_quotations', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(23, 'edit_quotations', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(24, 'delete_quotations', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(25, 'create_quotation_sales', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(26, 'send_quotation_mails', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(27, 'access_expenses', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(28, 'create_expenses', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(29, 'edit_expenses', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(30, 'delete_expenses', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(31, 'access_expense_categories', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(32, 'access_customers', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(33, 'create_customers', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(34, 'show_customers', 'web', '2024-05-10 15:43:17', '2024-05-10 15:43:17'),
(35, 'edit_customers', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(36, 'delete_customers', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(37, 'access_suppliers', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(38, 'create_suppliers', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(39, 'show_suppliers', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(40, 'edit_suppliers', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(41, 'delete_suppliers', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(42, 'access_sales', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(43, 'create_sales', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(44, 'show_sales', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(45, 'edit_sales', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(46, 'delete_sales', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(47, 'create_pos_sales', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(48, 'access_sale_payments', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(49, 'access_sale_returns', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(50, 'create_sale_returns', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(51, 'show_sale_returns', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(52, 'edit_sale_returns', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(53, 'delete_sale_returns', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(54, 'access_sale_return_payments', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(55, 'access_purchases', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(56, 'create_purchases', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(57, 'show_purchases', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(58, 'edit_purchases', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(59, 'delete_purchases', 'web', '2024-05-10 15:43:18', '2024-05-10 15:43:18'),
(60, 'access_purchase_payments', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(61, 'access_purchase_returns', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(62, 'create_purchase_returns', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(63, 'show_purchase_returns', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(64, 'edit_purchase_returns', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(65, 'delete_purchase_returns', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(66, 'access_purchase_return_payments', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(67, 'access_reports', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(68, 'access_currencies', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(69, 'create_currencies', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(70, 'edit_currencies', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(71, 'delete_currencies', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(72, 'access_settings', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(73, 'access_units', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_cost` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_unit` varchar(255) DEFAULT NULL,
  `product_stock_alert` int(11) NOT NULL,
  `product_order_tax` int(11) DEFAULT NULL,
  `product_tax_type` tinyint(4) DEFAULT NULL,
  `product_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `product_code`, `product_quantity`, `product_cost`, `product_price`, `product_unit`, `product_stock_alert`, `product_order_tax`, `product_tax_type`, `product_note`, `created_at`, `updated_at`) VALUES
(1, 3, 'Ayam Goreng', '001', 10, 2000000, 2500000, 'PC', 1, NULL, NULL, 'Ayam goreng + sambal + lalapan', '2024-05-10 16:02:43', '2024-07-23 03:17:21'),
(2, 3, 'Ayam Bakar', '002', 10, 2000000, 2500000, 'PC', 1, NULL, NULL, 'Ayam Bakar + sambal + lalapan', '2024-05-13 15:34:19', '2024-07-23 03:18:00'),
(3, 2, 'Paket ayam bakar 7Hari', 'P7H', 8, 20000000, 25000000, '7H', 100, 11, NULL, NULL, '2024-06-09 02:21:45', '2024-07-12 15:14:04'),
(4, 3, 'Ayam Rica', '003', 8, 2000000, 2700000, 'PC', 1, NULL, NULL, 'Ayam rica dengan kemangi', '2024-07-16 12:58:39', '2024-07-30 22:59:32'),
(5, 5, 'Sambel Ijo', '011', 30, 200000, 300000, 'PC', 1, NULL, NULL, 'Sambel Ijo', '2024-07-23 03:22:39', '2024-07-23 03:23:04'),
(6, 4, 'Capcay', '021', 48, 300000, 500000, 'PC', 1, NULL, NULL, 'Capcay dengan isi sayuran wortel, Buncis, kembang Kol dan Baso', '2024-07-23 03:25:17', '2024-07-30 22:49:01'),
(7, 8, 'Orek Tempe', '031', 50, 250000, 500000, 'PC', 1, NULL, NULL, NULL, '2024-08-01 08:44:09', '2024-08-01 08:44:39'),
(8, 7, 'Mie Goreng', '041', 50, 300000, 500000, 'PC', 1, NULL, NULL, NULL, '2024-08-01 08:46:37', '2024-08-01 08:46:37'),
(9, 6, 'Oseng Daging Pedas', '004', 50, 1500000, 2000000, 'PC', 1, NULL, NULL, NULL, '2024-08-01 08:49:46', '2024-08-01 08:52:42'),
(10, 2, 'Paket 1', '010', 50, 1800000, 2500000, 'Pkt', 1, NULL, NULL, 'Ayam/daging - Tempe/tahu - Sayur - sambel - lalapan', '2024-08-01 08:56:51', '2024-08-01 08:56:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_evidence` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_return_details`
--

CREATE TABLE `purchase_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_return_payments`
--

CREATE TABLE `purchase_return_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_evidence` text DEFAULT NULL,
  `payment_status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `quotations`
--

INSERT INTO `quotations` (`id`, `date`, `reference`, `customer_id`, `customer_name`, `tax_percentage`, `tax_amount`, `discount_percentage`, `discount_amount`, `shipping_amount`, `total_amount`, `status`, `note`, `created_at`, `updated_at`, `payment_evidence`, `payment_status`) VALUES
(1, '2024-05-13', 'QT-00001', 1, 'sopian', 0, 0, 0, 0, 0, 10000000, 'Sent', NULL, '2024-05-13 12:42:24', '2024-06-03 13:51:47', NULL, NULL),
(2, '2024-06-09', 'QT-00002', 1, 'sopian', 0, 0, 0, 0, 7000000, 24500000, 'Sent', NULL, '2024-06-09 02:08:19', '2024-07-11 14:46:31', '1', NULL),
(12, '2024-09-18', 'QT-00003', 3, 'Irsan', 0, 0, 0, 0, 0, 25000000, 'Pending', NULL, '2024-09-18 12:52:24', '2024-09-18 12:52:24', 'uploads/bukti-pembayaran/1726667544-shopee-logo-40483.png', 'penuh');

-- --------------------------------------------------------

--
-- Struktur dari tabel `quotation_details`
--

CREATE TABLE `quotation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `quotation_details`
--

INSERT INTO `quotation_details` (`id`, `quotation_id`, `product_id`, `product_name`, `product_code`, `quantity`, `price`, `unit_price`, `sub_total`, `product_discount_amount`, `product_discount_type`, `product_tax_amount`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'Ayam Goreng', '001', 4, 2500000, 2500000, 10000000, 0, 'fixed', 0, '2024-06-03 13:51:47', '2024-06-03 13:51:47'),
(4, 2, 1, 'Ayam Goreng', '001', 7, 2500000, 2500000, 17500000, 0, 'fixed', 0, '2024-07-11 14:46:31', '2024-07-11 14:46:31'),
(11, 12, 3, 'Paket ayam bakar 7Hari', 'P7H', 1, 25000000, 25000000, 2500000, 0, 'fixed', 0, '2024-09-18 12:52:24', '2024-09-18 12:52:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2024-05-10 15:43:19', '2024-05-10 15:43:19'),
(2, 'Super Admin', 'web', '2024-05-10 15:43:21', '2024-05-10 15:43:21'),
(3, 'Kasir', 'web', '2024-05-14 13:18:47', '2024-05-14 13:18:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(20, 1),
(20, 3),
(21, 1),
(21, 3),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(25, 3),
(26, 1),
(27, 1),
(27, 3),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(39, 1),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(45, 1),
(46, 1),
(47, 1),
(47, 3),
(48, 1),
(49, 1),
(49, 3),
(50, 1),
(50, 3),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id`, `date`, `reference`, `customer_id`, `customer_name`, `tax_percentage`, `tax_amount`, `discount_percentage`, `discount_amount`, `shipping_amount`, `total_amount`, `paid_amount`, `due_amount`, `status`, `payment_status`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(35, '2024-07-12', 'SL-00001', 1, 'sopian', 0, 0, 0, 0, 0, 27500000, 27500000, 0, 'Completed', 'Paid', 'Cash', NULL, '2024-07-12 13:52:42', '2024-07-12 13:52:42'),
(36, '2024-07-12', 'SL-00036', 1, 'sopian', 0, 0, 0, 0, 2000000, 27000000, 27000000, 0, 'Completed', 'Paid', 'Cash', NULL, '2024-07-12 13:53:45', '2024-07-12 13:53:45'),
(40, '2024-07-31', 'SL-00037', 1, 'sopian', 0, 0, 0, 0, 0, 2700000, 10000000, -7300000, 'Completed', 'Paid', 'Cash', NULL, '2024-07-30 22:59:32', '2024-07-30 22:59:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sale_details`
--

INSERT INTO `sale_details` (`id`, `sale_id`, `product_id`, `product_name`, `product_code`, `quantity`, `price`, `unit_price`, `sub_total`, `product_discount_amount`, `product_discount_type`, `product_tax_amount`, `created_at`, `updated_at`) VALUES
(32, 35, 2, 'Ayam Bakar', '002', 1, 2500000, 2500000, 2500000, 0, 'fixed', 0, '2024-07-12 13:52:42', '2024-07-12 13:52:42'),
(33, 35, 3, 'Paket ayam bakar 7Hari', 'P7H', 1, 25000000, 25000000, 25000000, 0, 'fixed', 0, '2024-07-12 13:52:42', '2024-07-12 13:52:42'),
(34, 36, 3, 'Paket ayam bakar 7Hari', 'P7H', 1, 25000000, 25000000, 25000000, 0, 'fixed', 0, '2024-07-12 13:53:45', '2024-07-12 13:53:45'),
(38, 40, 4, 'Ayam Rica', '003', 1, 2700000, 2700000, 2700000, 0, 'fixed', 0, '2024-07-30 22:59:32', '2024-07-30 22:59:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sale_payments`
--

CREATE TABLE `sale_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sale_payments`
--

INSERT INTO `sale_payments` (`id`, `sale_id`, `amount`, `date`, `reference`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(34, 35, 27500000, '2024-07-12', 'INV/SL-00001', 'Cash', NULL, '2024-07-12 13:52:42', '2024-07-12 13:52:42'),
(35, 36, 27000000, '2024-07-12', 'INV/SL-00036', 'Cash', NULL, '2024-07-12 13:53:45', '2024-07-12 13:53:45'),
(39, 40, 10000000, '2024-07-31', 'INV/SL-00037', 'Cash', NULL, '2024-07-30 22:59:32', '2024-07-30 22:59:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sale_returns`
--

CREATE TABLE `sale_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sale_returns`
--

INSERT INTO `sale_returns` (`id`, `date`, `reference`, `customer_id`, `customer_name`, `tax_percentage`, `tax_amount`, `discount_percentage`, `discount_amount`, `shipping_amount`, `total_amount`, `paid_amount`, `due_amount`, `status`, `payment_status`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(3, '2024-07-12', 'SLRN-00001', 1, 'sopian', 0, 0, 0, 0, 0, 25000000, 25000000, 0, 'Pending', 'Paid', 'Cash', NULL, '2024-07-12 14:39:46', '2024-07-12 15:14:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sale_return_details`
--

CREATE TABLE `sale_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sale_return_details`
--

INSERT INTO `sale_return_details` (`id`, `sale_return_id`, `product_id`, `product_name`, `product_code`, `quantity`, `price`, `unit_price`, `sub_total`, `product_discount_amount`, `product_discount_type`, `product_tax_amount`, `created_at`, `updated_at`) VALUES
(6, 3, 3, 'Paket ayam bakar 7Hari', 'P7H', 1, 25000000, 25000000, 25000000, 0, 'fixed', 0, '2024-07-12 15:14:04', '2024-07-12 15:14:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sale_return_payments`
--

CREATE TABLE `sale_return_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_return_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sale_return_payments`
--

INSERT INTO `sale_return_payments` (`id`, `sale_return_id`, `amount`, `date`, `reference`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(3, 3, 25000000, '2024-07-12', 'INV/SLRN-00001', 'Cash', NULL, '2024-07-12 14:56:22', '2024-07-12 14:56:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_email` varchar(255) NOT NULL,
  `company_phone` varchar(255) NOT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `default_currency_id` int(11) NOT NULL,
  `default_currency_position` varchar(255) NOT NULL,
  `notification_email` varchar(255) NOT NULL,
  `footer_text` text NOT NULL,
  `company_address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `company_name`, `company_email`, `company_phone`, `site_logo`, `default_currency_id`, `default_currency_position`, `notification_email`, `footer_text`, `company_address`, `created_at`, `updated_at`) VALUES
(1, 'Rosani Catering', 'rosanicatering@gmail.com', '085678789090', NULL, 2, 'prefix', 'notification@test.com', 'Triangle Pos © 2021 || Developed by <strong><a target=\"_blank\" href=\"https://fahimanzam.me\">Fahim Anzam</a></strong>', 'Bogor, Indonesia', '2024-05-10 15:43:22', '2024-06-25 14:56:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_email` varchar(255) NOT NULL,
  `supplier_phone` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_name`, `supplier_email`, `supplier_phone`, `city`, `country`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Roni', 'Roni@gmail.com', '087886865656', 'Bogor', 'Indonesia', 'Jl. Kemang Raya', '2024-05-14 13:14:51', '2024-05-14 13:14:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `operation_value` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `units`
--

INSERT INTO `units` (`id`, `name`, `short_name`, `operator`, `operation_value`, `created_at`, `updated_at`) VALUES
(1, 'Piece', 'PC', NULL, NULL, '2024-05-10 15:43:22', '2024-07-15 11:50:27'),
(2, 'Paket 7H', '7H', '-', 7, '2024-06-09 02:16:29', '2024-06-09 02:16:43'),
(3, 'Paket 1Bln', 'Pkt 1bln', NULL, NULL, '2024-07-15 11:10:53', '2024-07-15 11:10:53'),
(5, 'Paket', 'Pkt', NULL, NULL, '2024-08-01 08:53:33', '2024-08-01 08:53:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `uploads`
--

CREATE TABLE `uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `folder` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `uploads`
--

INSERT INTO `uploads` (`id`, `folder`, `filename`, `created_at`, `updated_at`) VALUES
(1, '66437343bf2c8-1715696451', '1715696451.jpg', '2024-05-14 13:20:52', '2024-05-14 13:20:52'),
(2, '664374d8a3420-1715696856', '1715696856.jpg', '2024-05-14 13:27:36', '2024-05-14 13:27:36'),
(3, '66437827263d7-1715697703', '1715697703.jpg', '2024-05-14 13:41:43', '2024-05-14 13:41:43'),
(4, '66437836bdaee-1715697718', '1715697718.jpg', '2024-05-14 13:41:58', '2024-05-14 13:41:58'),
(5, '664379d78849d-1715698135', '1715698135.jpg', '2024-05-14 13:48:55', '2024-05-14 13:48:55'),
(6, '66437a1ebcfd2-1715698206', '1715698206.jpg', '2024-05-14 13:50:06', '2024-05-14 13:50:06'),
(7, '66437b312a72b-1715698481', '1715698481.jpg', '2024-05-14 13:54:41', '2024-05-14 13:54:41'),
(8, '66437c95457a5-1715698837', '1715698837.jpg', '2024-05-14 14:00:37', '2024-05-14 14:00:37'),
(9, '664380db4e87d-1715699931', '1715699931.jpg', '2024-05-14 14:18:51', '2024-05-14 14:18:51'),
(10, '6643811d3a123-1715699997', '1715699997.jpg', '2024-05-14 14:19:57', '2024-05-14 14:19:57'),
(11, '664488fc203fa-1715767548', '1715767548.jpg', '2024-05-15 09:05:53', '2024-05-15 09:05:53'),
(12, '6644896d79a3b-1715767661', '1715767661.jpg', '2024-05-15 09:07:41', '2024-05-15 09:07:41'),
(13, '667bf1400d8c4-1719398720', '1719398720.png', '2024-06-26 09:45:20', '2024-06-26 09:45:20'),
(14, '667bf18ee3a50-1719398798', '1719398798.png', '2024-06-26 09:46:39', '2024-06-26 09:46:39'),
(15, '667c0071d9aa0-1719402609', '1719402609.png', '2024-06-26 10:50:10', '2024-06-26 10:50:10'),
(16, '667c04b7ee400-1719403703', '1719403703.png', '2024-06-26 11:08:24', '2024-06-26 11:08:24'),
(17, '667c079170f61-1719404433', '1719404433.png', '2024-06-26 11:20:33', '2024-06-26 11:20:33'),
(18, '667c07b8f09dc-1719404472', '1719404472.png', '2024-06-26 11:21:13', '2024-06-26 11:21:13'),
(19, '667c083536654-1719404597', '1719404597.png', '2024-06-26 11:23:17', '2024-06-26 11:23:17'),
(20, '667c0c56cfcec-1719405654', '1719405654.png', '2024-06-26 11:40:55', '2024-06-26 11:40:55'),
(21, '667c0d00d0bf1-1719405824', '1719405824.png', '2024-06-26 11:43:45', '2024-06-26 11:43:45'),
(22, '667c0eb450a64-1719406260', '1719406260.png', '2024-06-26 11:51:00', '2024-06-26 11:51:00'),
(23, '667c127c78601-1719407228', '1719407228.png', '2024-06-26 12:07:08', '2024-06-26 12:07:08'),
(24, '667c14c08ba9e-1719407808', '1719407808.png', '2024-06-26 12:16:48', '2024-06-26 12:16:48'),
(25, '667c1621663fd-1719408161', '1719408161.png', '2024-06-26 12:22:41', '2024-06-26 12:22:41'),
(26, '667c1670cb13f-1719408240', '1719408240.png', '2024-06-26 12:24:00', '2024-06-26 12:24:00'),
(27, '667c16e742395-1719408359', '1719408359.png', '2024-06-26 12:25:59', '2024-06-26 12:25:59'),
(28, '667c17235005f-1719408419', '1719408419.png', '2024-06-26 12:26:59', '2024-06-26 12:26:59'),
(29, '667c176e00742-1719408494', '1719408494.png', '2024-06-26 12:28:14', '2024-06-26 12:28:14'),
(30, '667c1910c80e7-1719408912', '1719408912.png', '2024-06-26 12:35:12', '2024-06-26 12:35:12'),
(31, '667c1995958bc-1719409045', '1719409045.png', '2024-06-26 12:37:25', '2024-06-26 12:37:25'),
(32, '667c19f82f62e-1719409144', '1719409144.png', '2024-06-26 12:39:04', '2024-06-26 12:39:04'),
(33, '667c1bb8536dc-1719409592', '1719409592.png', '2024-06-26 12:46:32', '2024-06-26 12:46:32'),
(34, '667c1c16096aa-1719409686', '1719409686.png', '2024-06-26 12:48:06', '2024-06-26 12:48:06'),
(35, '667c1c7be6bc4-1719409787', '1719409787.png', '2024-06-26 12:49:48', '2024-06-26 12:49:48'),
(36, '667c1cb648f4d-1719409846', '1719409846.png', '2024-06-26 12:50:46', '2024-06-26 12:50:46'),
(37, '66880af1dc683-1720191729', '1720191729.jpg', '2024-07-05 14:02:09', '2024-07-05 14:02:09'),
(38, '66966bb493340-1721134004', '1721134004.png', '2024-07-16 11:46:45', '2024-07-16 11:46:45'),
(39, '669f31ae849f4-1721708974', '1721708974.png', '2024-07-23 03:29:34', '2024-07-23 03:29:34'),
(40, '669f31e14f9c6-1721709025', '1721709025.png', '2024-07-23 03:30:25', '2024-07-23 03:30:25'),
(41, '66a0a69b95d09-1721804443', '1721804443.jpg', '2024-07-24 06:00:43', '2024-07-24 06:00:43'),
(42, '66a0b1ae7739b-1721807278', '1721807278.jpg', '2024-07-24 06:47:58', '2024-07-24 06:47:58'),
(43, '66a0b1f56f81f-1721807349', '1721807349.jpg', '2024-07-24 06:49:09', '2024-07-24 06:49:09'),
(44, '66a0b46343fd8-1721807971', '1721807971.jpg', '2024-07-24 06:59:31', '2024-07-24 06:59:31'),
(45, '66a0b4863982c-1721808006', '1721808006.jpg', '2024-07-24 07:00:06', '2024-07-24 07:00:06'),
(46, '66a0b7656d87c-1721808741', '1721808741.jpg', '2024-07-24 07:12:21', '2024-07-24 07:12:21'),
(48, '66a25ba4c3fdd-1721916324', '1721916324.jpg', '2024-07-25 13:05:24', '2024-07-25 13:05:24'),
(49, '66a25c2622450-1721916454', '1721916454.jpg', '2024-07-25 13:07:34', '2024-07-25 13:07:34'),
(50, '66a25f66b5ea7-1721917286', '1721917286.jpg', '2024-07-25 13:21:26', '2024-07-25 13:21:26'),
(51, '66a25fc934cfb-1721917385', '1721917385.jpg', '2024-07-25 13:23:05', '2024-07-25 13:23:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', NULL, '$2y$10$3dAdgWuRbIHugyG12OL28OKJWUSplgXHpEGq1zzE7fRS30G4bu4vG', 1, NULL, '2024-05-10 15:43:21', '2024-07-26 11:10:35'),
(30, 'kasir3', 'kasir3@test.com', NULL, '$2y$10$rVo6W/ZTZXLGO.SLeVUITeMSXTnP.mkx.Gil2ZRWnGVzA4zQYCBSu', 1, NULL, '2024-07-25 13:23:53', '2024-07-26 11:12:52'),
(31, 'Sopian Sauri', 'fhianguns@gmail.com', NULL, '$2y$10$YAZdQekW1GYSZoEsqU4Z1uTyzFlp.XTsvz2H0gLSEMDvuDA8jVYRK', 1, NULL, '2024-07-30 15:15:01', '2024-07-30 15:15:01');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_code_unique` (`category_code`);

--
-- Indeks untuk tabel `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_code_unique` (`product_code`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`);

--
-- Indeks untuk tabel `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_details_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_details_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_payments_purchase_id_foreign` (`purchase_id`);

--
-- Indeks untuk tabel `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_returns_supplier_id_foreign` (`supplier_id`);

--
-- Indeks untuk tabel `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_details_purchase_return_id_foreign` (`purchase_return_id`),
  ADD KEY `purchase_return_details_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_payments_purchase_return_id_foreign` (`purchase_return_id`);

--
-- Indeks untuk tabel `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotations_customer_id_foreign` (`customer_id`);

--
-- Indeks untuk tabel `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_details_quotation_id_foreign` (`quotation_id`),
  ADD KEY `quotation_details_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_customer_id_foreign` (`customer_id`);

--
-- Indeks untuk tabel `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_details_sale_id_foreign` (`sale_id`),
  ADD KEY `sale_details_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `sale_payments`
--
ALTER TABLE `sale_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_payments_sale_id_foreign` (`sale_id`);

--
-- Indeks untuk tabel `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_returns_customer_id_foreign` (`customer_id`);

--
-- Indeks untuk tabel `sale_return_details`
--
ALTER TABLE `sale_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_return_details_sale_return_id_foreign` (`sale_return_id`),
  ADD KEY `sale_return_details_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `sale_return_payments`
--
ALTER TABLE `sale_return_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_return_payments_sale_return_id_foreign` (`sale_return_id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `quotation_details`
--
ALTER TABLE `quotation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `sale_payments`
--
ALTER TABLE `sale_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `sale_returns`
--
ALTER TABLE `sale_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `sale_return_details`
--
ALTER TABLE `sale_return_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `sale_return_payments`
--
ALTER TABLE `sale_return_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_categories` (`id`);

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Ketidakleluasaan untuk tabel `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `purchase_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_details_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD CONSTRAINT `purchase_payments_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD CONSTRAINT `purchase_returns_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD CONSTRAINT `purchase_return_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_return_details_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  ADD CONSTRAINT `purchase_return_payments_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD CONSTRAINT `quotation_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `quotation_details_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `sale_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sale_details_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sale_payments`
--
ALTER TABLE `sale_payments`
  ADD CONSTRAINT `sale_payments_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD CONSTRAINT `sale_returns_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `sale_return_details`
--
ALTER TABLE `sale_return_details`
  ADD CONSTRAINT `sale_return_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sale_return_details_sale_return_id_foreign` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sale_return_payments`
--
ALTER TABLE `sale_return_payments`
  ADD CONSTRAINT `sale_return_payments_sale_return_id_foreign` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
