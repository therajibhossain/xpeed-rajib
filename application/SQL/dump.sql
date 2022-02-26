-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2021 at 05:01 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `luminosity`
--

-- --------------------------------------------------------

--
-- Table structure for table `submitted_forms`
--

CREATE TABLE IF NOT EXISTS `submitted_forms` (
  `id` bigint(20) NOT NULL,
  `amount` int(10) NOT NULL,
  `buyer` varchar(255) NOT NULL,
  `receipt_id` varchar(20) NOT NULL,
  `items` varchar(255) DEFAULT NULL,
  `buyer_email` varchar(250) DEFAULT NULL,
  `buyer_ip` varchar(220) DEFAULT NULL,
  `note` text NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `hash_key` varchar(255) DEFAULT NULL,
  `entry_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `entry_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `email_verification_tokens`
--

CREATE TABLE `email_verification_tokens` (
  `id` int(11) NOT NULL,
  `email` varchar(300) NOT NULL,
  `token` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `forgot_password_tokens`
--

CREATE TABLE `forgot_password_tokens` (
  `id` int(11) NOT NULL,
  `email` varchar(300) NOT NULL,
  `token` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_used` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login_tokens`
--

CREATE TABLE `login_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uniq_id` varchar(32) NOT NULL,
  `email` varchar(300) NOT NULL,
  `username` varchar(30) NOT NULL,
  `display_name` varchar(30) NOT NULL,
  `password` varchar(300) NOT NULL,
  `about` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_img` varchar(200) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `submitted_forms`
--
ALTER TABLE `submitted_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verification_tokens`
--
ALTER TABLE `email_verification_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forgot_password_tokens`
--
ALTER TABLE `forgot_password_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_tokens`
--
ALTER TABLE `login_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `submitted_forms`
--
ALTER TABLE `submitted_forms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_verification_tokens`
--
ALTER TABLE `email_verification_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forgot_password_tokens`
--
ALTER TABLE `forgot_password_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_tokens`
--
ALTER TABLE `login_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

DELIMITER $$
CREATE PROCEDURE `delete_submitted_forms_aliases`(IN `formID` VARCHAR(32))
    MODIFIES SQL DATA
BEGIN
    DELETE FROM submitted_forms WHERE id = formID;
END$$
DELIMITER ;