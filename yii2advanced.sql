-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2019 at 04:49 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2advanced`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `companies_company_id` int(11) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `branch_address` varchar(100) NOT NULL,
  `branch_created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `branch_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `companies_company_id`, `branch_name`, `branch_address`, `branch_created_date`, `branch_status`) VALUES
(1, 1, 'HQ', 'Colombo', '2019-12-11 13:32:07', 'active'),
(2, 2, 'City Office', 'Ratmalana', '2019-12-11 13:32:57', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_email` varchar(100) NOT NULL,
  `company_address` varchar(100) NOT NULL,
  `compnay_created_date` date NOT NULL,
  `company_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`company_id`, `company_name`, `company_email`, `company_address`, `compnay_created_date`, `company_status`) VALUES
(1, 'Virtusa', 'info@virtusa.lk', 'Colombo', '2019-12-11', 'active'),
(2, 'Konekt', 'info@konekt.lk', 'Ratmlana', '2019-12-11', 'active'),
(3, '99X Technology', 'info@99x.com', 'Colombo', '2019-12-11', 'active'),
(4, 'WSO2', 'info@wso2.com', 'Colombo', '2019-12-11', 'active'),
(5, 'Smashy ERP', 'info@smashyerp.com', 'Maharagama', '2019-12-16', 'active'),
(6, 'Arimac', 'info@arimac.lk', 'Colombo', '0000-00-00', 'active'),
(7, 'Virtusa', 'info@virtusa.lk', 'Colombo', '0000-00-00', 'active'),
(8, 'Hela', 'info@hela.com', 'Katunayake', '2019-01-23', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `branches_branch_id` int(11) NOT NULL,
  `companies_company_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `department_created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `department_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `branches_branch_id`, `companies_company_id`, `department_name`, `department_created_date`, `department_status`) VALUES
(1, 1, 1, 'Enginnering', '2019-12-11 13:32:28', 'active'),
(2, 2, 2, 'Business Development', '2019-12-11 13:33:30', 'active'),
(3, 1, 1, 'HR', '2019-12-11 16:33:06', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1575903496),
('m130524_201442_init', 1575903507),
('m190124_110200_add_verification_token_column_to_user_table', 1575903508);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(1, '', '', 'dilshanka', 'xMO9OVDPHmwom4Tpe0hTVdhCOYIobQKi', '$2y$13$UJXHQurnAuBhGQtcRxw5ZuEPhRDInTEGbPFH2zm2RP2aM0wlCjD/i', NULL, 'dilshanka@konekt.lk', 10, 1575903839, 1575903839, '0e1SKcQt_PalfgsYxgBF4o7sdqLl7u-f_1575903839'),
(2, '', '', 'admin', '_XS7bw7Uzy2YqYLutWB-t4Bz1yD7Mzut', '$2y$13$pSqvHe5pyQvRVqQV8NLNM.hsp1RQ12sKWOUqRZ/sijxzuiGZ9zdIi', NULL, 'admin@konekt.lk', 10, 1575904854, 1575904854, 'I3i-NBMn0-4KOP-l_39P4c0n2pv9KY7C_1575904854'),
(3, 'John', 'Doe', 'johndoe', 'tMqupv0N0ON3L4n5oCDRkLGUrFEhh66T', '$2y$13$KTsWMCDRGcwyDpJ0Xm8R..TSe5aAE1/d3sOD64k4H7XqmDaqa88tG', NULL, 'j@gmail.com', 10, 1575913568, 1575913568, 'KIajdNcyqyZVPcfjb05eZe3eq3KKWtH-_1575913568'),
(4, 'araliya', 'araliya', 'araliya', '6zVgZSvlfHWWZg5NBVIldDSLbSNhuUZt', '$2y$13$9BjNyNyTWDMXH6L8wZ7zduKq3uXM5OB1bgA6LmUn5Du3cWSitwUQi', NULL, 'araliya@gmail.com', 10, 1576050619, 1576050619, 'MKQQ94ObORAKUyFXKpTjglJA6wSrGAlJ_1576050619');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `fk_company_branch` (`companies_company_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `fk_branch` (`branches_branch_id`),
  ADD KEY `fk_company` (`companies_company_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `fk_company_branch` FOREIGN KEY (`companies_company_id`) REFERENCES `companies` (`company_id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `fk_branch` FOREIGN KEY (`branches_branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `fk_company` FOREIGN KEY (`companies_company_id`) REFERENCES `companies` (`company_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
