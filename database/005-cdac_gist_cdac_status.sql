-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2017 at 05:00 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

--
-- Table structure for table `cdac_status`
--

CREATE TABLE IF NOT EXISTS `cdac_status` (
  `status_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status_title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `status_group` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'GEN' COMMENT 'Category Groups for Status if they nee to be selectively displayed.',
  `status_mode` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A' COMMENT 'A = All, C = Create, E = Edit',
  `status` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT '2016-12-31 07:30:00',
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cdac_status`
--

INSERT INTO `cdac_status` (`status_code`, `status_title`, `status_description`, `status_group`, `status_mode`, `status`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('A', 'Active', 'Active Entity', 'GEN', 'A', 'A', '', '2016-12-31 07:30:00', NULL, '2017-07-23 09:57:49'),
('ACT', 'Active ATC', 'ATC is Active', 'ATC-STS', 'A', 'A', '', '2016-12-31 07:30:00', NULL, '2017-07-23 10:48:35'),
('CAN', 'Cancelled Order', 'Order cancelled', 'ORD-STS', 'E', 'A', '', '2016-12-31 07:30:00', NULL, '2017-07-23 09:56:09'),
('COM', 'Completed', 'Completed Course', 'ENR-STS', 'A', 'A', 'system', '2016-12-31 13:00:00', NULL, '2017-08-03 14:55:05'),
('D', 'Deleted', 'Deleted Entity', 'GEN', 'A', 'A', '', '2016-12-31 07:30:00', NULL, '2017-07-23 09:57:58'),
('DMG', 'Damaged Item', 'Order Damaged in transit', 'ORD-RES', 'E', 'A', '', '2016-12-31 07:30:00', NULL, '2017-07-23 09:56:09'),
('DRP', 'Dropped', 'Student Dropped the Course ', 'ENR-STS', 'A', 'A', 'system', '2016-12-31 13:00:00', NULL, '2017-08-03 14:55:05'),
('LST', 'Lost in Transit', 'Order Lost in transit', 'ORD-RES', 'E', 'A', '', '2016-12-31 07:30:00', NULL, '2017-07-22 14:36:00'),
('ONG', 'Ongoing - Current ', 'In Progress Course', 'ENR-STS', 'A', 'A', 'system', '2016-12-31 13:00:00', NULL, '2017-08-03 14:55:05'),
('ORD', 'Order Placed', 'Request sent to print house', 'ORD-STS', 'C', 'A', '', '2016-12-31 07:30:00', NULL, '2017-07-23 09:56:09'),
('P', 'Pending', 'Action Pending on Entity', 'GEN', 'A', 'A', '', '2016-12-31 07:30:00', NULL, '2017-07-23 09:58:46'),
('PEN', 'Order Pending', 'Pending to be ordered', 'ORD-STS', 'C', 'A', '', '2016-12-31 07:30:00', NULL, '2017-07-23 09:56:09'),
('REC', 'Order Received', 'Order received from print house', 'ORD-STS', 'E', 'A', '', '2016-12-31 07:30:00', NULL, '2017-07-23 09:56:09'),
('S', 'Suspended', 'Suspended Entity', 'GEN', 'A', 'A', '', '2016-12-31 07:30:00', NULL, '2017-07-23 09:58:14'),
('UPG', 'Upgraded', 'Upgraded Course', 'ENR-STS', 'A', 'A', 'system', '2016-12-31 13:00:00', NULL, '2017-08-03 14:55:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_status`
--
ALTER TABLE `cdac_status`
  ADD PRIMARY KEY (`status_code`),
  ADD UNIQUE KEY `status_title` (`status_title`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
