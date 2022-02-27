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









-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping data for table xpeedrajib.email_verification_tokens: ~2 rows (approximately)
DELETE FROM `email_verification_tokens`;
/*!40000 ALTER TABLE `email_verification_tokens` DISABLE KEYS */;
INSERT INTO `email_verification_tokens` (`id`, `email`, `token`, `created_at`) VALUES
	(1, 'aamin2@velometric.com', 'f99733fbd72b3ee960fa711d7e5e4d284eef3210d0a168c1a34f74fdf4754698', '2022-02-24 17:53:55'),
	(3, 'rajibhossain.php@gmail.com', '4c865d43994c505c529794f6572b4e98ddce42aaa582ac016861ee4d2b2ecae5', '2022-02-24 17:57:12');
/*!40000 ALTER TABLE `email_verification_tokens` ENABLE KEYS */;

-- Dumping data for table xpeedrajib.forgot_password_tokens: ~0 rows (approximately)
DELETE FROM `forgot_password_tokens`;
/*!40000 ALTER TABLE `forgot_password_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `forgot_password_tokens` ENABLE KEYS */;

-- Dumping data for table xpeedrajib.login_tokens: ~18 rows (approximately)
DELETE FROM `login_tokens`;
/*!40000 ALTER TABLE `login_tokens` DISABLE KEYS */;
INSERT INTO `login_tokens` (`id`, `user_id`, `token`, `created_at`) VALUES
	(1, 1, 'b6ac3a9dd103801f37d73e0b288b313fb6baf9c7127218d86eb8bb3e87ab6a5a', '2022-02-24 17:57:45'),
	(2, 1, '85ca827316cfff9d9307effc678bc2b83a803cad9c4e96d95a900302d9c04971', '2022-02-26 11:30:09'),
	(3, 1, 'a79be18d70f266470356abfd8ed3655bdccf5f58f0726580744faa4bab5e4ffd', '2022-02-27 00:26:32'),
	(4, 1, '9c40af8a2f946e648bde69b8969d7dc22d5a8809f423a75ada296145e994ae8b', '2022-02-27 17:09:33'),
	(5, 1, 'd40cb7ece3ca2182130f5ecf38c6bc0e2219ba96893b29c1debf65c9044a4cc6', '2022-02-27 17:10:45'),
	(6, 1, 'b734171221bfc441fe627cf9a496cde598ee984f2befdd305e25ada65fe7ae5b', '2022-02-27 17:21:05'),
	(7, 1, '2b940b7c01bbe3bf9bc5268961e19d4a23a97a437ecc58521e38d01622e32e8c', '2022-02-27 18:00:30'),
	(8, 1, '6635aa7d34aecaaf825037b6015790d3091d558702765884da856a57a92f3c17', '2022-02-27 18:00:30'),
	(9, 1, '6df46e012485d451b802b2d10216e5251276cdbe1f358c2cf19e18e06d37a004', '2022-02-27 19:26:38'),
	(10, 1, '00e4875b96d011ccb500bbcd8caed38300008a26e1fc20091f95cb00e79ded23', '2022-02-27 19:49:30'),
	(11, 1, '0cb16de6c5b2422a66ddf2c8443375191eb91d2c4c90eeaac82960db39889a37', '2022-02-27 20:34:32'),
	(12, 1, 'a4366cf24d5edb4160e699f40a187034d518cc82f292216b697d2d572bc8f62e', '2022-02-27 21:47:23'),
	(13, 1, '89dbeb7dc8d344b2642035e37dd2dbbb85feedafa965dafe12670187ee280206', '2022-02-27 21:52:57'),
	(14, 1, '184af9a5f063db6f1119ae54b57123237a3242e7dcbce677e61182e2bfb5057b', '2022-02-27 21:58:25'),
	(15, 1, '79b74e5e7c6e6204f8af13133b0d44ceaf7f74ae8aeb7c0a0379017029c40d23', '2022-02-27 22:00:54'),
	(16, 1, '6791fb32580c867a40162454ea6142426821d4c01fad49fcd11ad49ff019421a', '2022-02-27 22:10:55'),
	(17, 1, '34f85dd16d85f650f7f1f3cb01effcf4952aeba1dc7c904bf7ec518a1bc2c37e', '2022-02-27 23:18:02'),
	(18, 1, '0ca02939e48598511d55c33fa258ffb11e357edebee4b6dd094c697966b2dd0b', '2022-02-27 23:24:37');
/*!40000 ALTER TABLE `login_tokens` ENABLE KEYS */;

-- Dumping data for table xpeedrajib.submitted_forms: ~0 rows (approximately)
DELETE FROM `submitted_forms`;
/*!40000 ALTER TABLE `submitted_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `submitted_forms` ENABLE KEYS */;

-- Dumping data for table xpeedrajib.users: ~1 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `uniq_id`, `email`, `username`, `display_name`, `password`, `about`, `created_at`, `profile_img`, `verified`) VALUES
	(1, 'b6b840123ce86c15bed26fe5d9b57423', 'rajibhossain.php@gmail.com', 'rajib', 'Rajib Hossain', '$2y$10$86Vq89HA6DyGCTXxSweeVec3l4VkdiKXJErB9nTQBOyQZgNowMJqi', '', '2022-02-24 17:57:11', '78dd1528e3cb243617b9eac0fcac70d135e8b0c26d6aec5d897143f00bdd925f__ceedaf94ac9610031ab5e582eaf36aba.png', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
