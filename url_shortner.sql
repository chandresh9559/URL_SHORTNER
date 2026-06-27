-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 27, 2026 at 01:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `url_shortner`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `created_at`, `updated_at`, `email`) VALUES
(1, 'ABC Business', '2026-06-26 23:39:12', '2026-06-26 23:39:12', ''),
(2, 'DEF Business', '2026-06-26 23:39:12', '2026-06-26 23:39:12', ''),
(3, 'GHI Business', '2026-06-26 23:39:12', '2026-06-26 23:39:12', ''),
(4, 'Chandresh Yadav', '2026-06-27 02:24:16', '2026-06-27 02:24:16', '');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2026_06_26_174643_create_companies_table', 1),
(4, '2026_06_26_174644_create_users_table', 1),
(5, '2026_06_26_180710_create_short_urls_table', 1),
(6, '2026_06_27_085556_update_short_urls_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('f1ksBcVycX9kIGmtXGc6J6ZCqljPGoCiyzHom09j', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYWFhbm9Za1RQamJ6YkFBSTF0VElNb05Fckx5eW10S1dzbTJUZzNtbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQ/c29ydF9ieV9kYXRlPXRvZGF5IjtzOjU6InJvdXRlIjtzOjk6ImRhc2hib2FyZCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEyO30=', 1782559559);

-- --------------------------------------------------------

--
-- Table structure for table `short_urls`
--

CREATE TABLE `short_urls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `original_url` text NOT NULL,
  `short_code` varchar(8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hits` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `short_urls`
--

INSERT INTO `short_urls` (`id`, `company_id`, `user_id`, `original_url`, `short_code`, `created_at`, `updated_at`, `hits`) VALUES
(1, 1, 2, 'https://getbootstrap.com/docs/5.3/getting-started/introduction/', 'Fk7VD7', '2026-06-27 04:48:00', '2026-06-27 04:48:00', 0),
(2, 1, 2, 'https://getbootstrap.com/docs/5.3/getting-started/introduction/', 'gscKRw', '2026-06-27 05:23:41', '2026-06-27 05:23:41', 0),
(3, 1, 2, 'https://getbootstrap.com/docs/5.3/getting-started/introduction/', 'zMv800', '2026-06-27 05:23:46', '2026-06-27 05:23:46', 0),
(4, 1, 2, 'https://getbootstrap.com/docs/5.3/getting-started/introduction/', 'gZfiTk', '2026-06-27 05:23:53', '2026-06-27 05:23:53', 0),
(5, 1, 2, 'https://getbootstrap.com/docs/5.3/getting-started/introduction/', 'mGLeNq', '2026-06-27 05:23:58', '2026-06-27 05:23:58', 0),
(6, 1, 2, 'https://getbootstrap.com/docs/5.3/getting-started/introduction/', 'UQ3UWP', '2026-06-27 05:24:04', '2026-06-27 05:24:04', 0),
(7, 3, 12, 'https://drive.google.com/file/d/1ani2g0Jknw3AtqKfU6LP75lRC-7JFCVk/view?pli=1', '2FUhZX', '2026-06-27 05:43:11', '2026-06-27 05:43:11', 0),
(8, 3, 12, 'https://drive.google.com/file/d/1ani2g0Jknw3AtqKfU6LP75lRC-7JFCVk/view?pli=1', 'PRZCER', '2026-06-27 05:43:17', '2026-06-27 05:43:17', 0),
(9, 3, 12, 'https://getbootstrap.com/docs/5.3/getting-started/introduction/', 'GlRe8I', '2026-06-27 05:43:22', '2026-06-27 05:43:22', 0),
(10, 3, 12, 'https://chatgpt.com/c/6a3eaab5-0c80-83e8-8113-37e973042f1b?mweb_fallback=1', 'kpluBx', '2026-06-27 05:43:38', '2026-06-27 05:43:38', 0),
(11, 3, 12, 'https://chatgpt.com/c/6a3eaab5-0c80-83e8-8113-37e973042f1b?mweb_fallback=1', 'dTpA4M', '2026-06-27 05:43:45', '2026-06-27 05:43:45', 0),
(12, 3, 12, 'https://chatgpt.com/c/6a3eaab5-0c80-83e8-8113-37e973042f1b?mweb_fallback=1', 'f7AD6f', '2026-06-27 05:43:50', '2026-06-27 05:43:50', 0),
(13, 3, 12, 'https://getbootstrap.com/docs/5.3/getting-started/introduction/', '22XDQY', '2026-06-27 05:43:55', '2026-06-27 05:43:55', 0),
(14, 3, 12, 'https://chatgpt.com/c/6a3eaab5-0c80-83e8-8113-37e973042f1b?mweb_fallback=1', 'CpOQVA', '2026-06-27 05:44:01', '2026-06-27 05:44:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `role`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, 'superadmin', 'Super Admin', 'superadmin@yopmail.com', NULL, '$2y$12$1eyw9qepnu0sVqyRTCZu.Oe9.LY35Noik1WPBYRi8jLgjK2woiMB6', NULL, '2026-06-26 23:27:56', '2026-06-26 23:27:56'),
(2, 1, 'admin', 'Deepu', 'deepu@yopmail.com', NULL, '$2y$12$Ucwvy8tffpSEB5jZAAdoW.4zVDKO/ZpJInadF6CGXuCPj5SxlQ5ly', NULL, '2026-06-27 00:10:58', '2026-06-27 00:10:58'),
(3, 1, 'member', 'Rahul', 'rahul@yopmail.com', NULL, '$2y$12$jD1fTuAUElqWKwt5OmZqLO3n3r/61gvpGv9opRZ24xNS8Hau/iQsa', NULL, '2026-06-27 00:10:58', '2026-06-27 00:10:58'),
(4, 1, 'sales', 'Ankush', 'ankush@yopmail.com', NULL, '$2y$12$MmpsVQMhO4azVoTkfbFGN.4eQ39Ben1GFJwqK1PWp6lH/XXzNKhhy', NULL, '2026-06-27 00:10:59', '2026-06-27 00:10:59'),
(5, 1, 'manager', 'Deepak', 'deepak@yopmail.com', NULL, '$2y$12$QOMJBr21ZFKciOsajvf6LeEdvujMT/EjqoeLrN3iP4EIyxCWkOgY2', NULL, '2026-06-27 00:10:59', '2026-06-27 00:10:59'),
(6, 2, 'admin', 'Deepankar', 'deepankar@yopmail.com', NULL, '$2y$12$TvY34Zngg3373oxWjUnYJu3SOrDK5RtpbImKtRLreTpyBGeRk3Fnu', NULL, '2026-06-27 00:10:59', '2026-06-27 00:10:59'),
(7, 2, 'member', 'Anil', 'anil@yopmail.com', NULL, '$2y$12$p7lJtC4Sru7rrO1e/4JmR.tm7EGaZ0eNuy6hp7xv4a7GNl95Uq6sW', NULL, '2026-06-27 00:11:00', '2026-06-27 00:11:00'),
(8, 2, 'sales', 'Aman', 'aman@yopmail.com', NULL, '$2y$12$ZgXb.iv4.zKObZtOAnBIt.hbwOhhRzsyPxVqsM3KWk8u7z9JQ/plu', NULL, '2026-06-27 00:11:00', '2026-06-27 00:11:00'),
(9, 2, 'manager', 'Raman', 'raman@yopmail.com', NULL, '$2y$12$oHE/E/6x03g4Ddl44ymIbeOjEDMNEtvN0WwEJoSo/TI/LLwhjee6.', NULL, '2026-06-27 00:11:01', '2026-06-27 00:11:01'),
(10, 3, 'admin', 'Prince', 'price@yopmail.com', NULL, '$2y$12$hnEaNAm5bclyY9IqpEOxUOZkhnyZ80i//Fkp7gqH1Twm4P9wtB3L.', NULL, '2026-06-27 00:11:01', '2026-06-27 00:11:01'),
(11, 3, 'member', 'Anubhav', 'anubhav@yopmail.com', NULL, '$2y$12$dHZGVsII7ZiqsBxf6f7Kx.XfI9XMiwbEk2nrQqZTK0Tp81SFPPJGO', NULL, '2026-06-27 00:11:01', '2026-06-27 00:11:01'),
(12, 3, 'sales', 'Ananya', 'ananya@yopmail.com', NULL, '$2y$12$bkEFbyItMbARqcMhWxSGguH.tzZGU8VtjOYTlk2JyHM5vjCE3i4Yi', NULL, '2026-06-27 00:11:02', '2026-06-27 00:11:02'),
(13, 3, 'admin', 'Aradhya', 'aradhya@yopmail.com', NULL, '$2y$12$Hmj74RDCsAuTHMV.vq44LOeWVMf/FbWt/XlRXgFP5VcQScyy71ks6', NULL, '2026-06-27 00:11:02', '2026-06-27 00:11:02'),
(14, 1, 'member', 'Naman', 'naman@yopmail.com', NULL, '$2y$12$oYkH05fHlQMRjTRHAbaPa.n0.X26QHsZDfI73X1B5OWEgWlquT8cy', NULL, '2026-06-27 03:55:00', '2026-06-27 03:55:00'),
(15, 1, 'manager', 'CK Insurance', 'insuranceck@yopmail.com', NULL, '$2y$12$HVYEM2G3k43GYx2dyK8W2elqMC7LBajKxU8hN1yK.mD6j47830q1K', NULL, '2026-06-27 04:31:34', '2026-06-27 04:31:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `short_urls`
--
ALTER TABLE `short_urls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `short_urls_short_code_unique` (`short_code`),
  ADD KEY `short_urls_company_id_foreign` (`company_id`),
  ADD KEY `short_urls_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_company_id_foreign` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `short_urls`
--
ALTER TABLE `short_urls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `short_urls`
--
ALTER TABLE `short_urls`
  ADD CONSTRAINT `short_urls_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `short_urls_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
