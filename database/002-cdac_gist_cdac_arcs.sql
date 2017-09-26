-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2017 at 04:59 PM
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
-- Table structure for table `cdac_arcs`
--

CREATE TABLE IF NOT EXISTS `cdac_arcs` (
  `arc_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `arc_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `arc_address_line1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `arc_address_line2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `arc_address_city` bigint(20) DEFAULT NULL,
  `arc_address_postcode` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `arc_contact_number` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `arc_contact_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_dt` timestamp NULL DEFAULT '2016-12-31 07:30:00',
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cdac_arcs`
--

INSERT INTO `cdac_arcs` (`arc_code`, `arc_name`, `arc_address_line1`, `arc_address_line2`, `arc_address_city`, `arc_address_postcode`, `arc_contact_number`, `arc_contact_email`, `status`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('ARC-1', 'North ARC', 'Line1 Add', 'Line2 Add', 395, '171001', '11111111', 'arc-north@gmail.com', 'A', NULL, '2016-12-31 07:30:00', NULL, '2017-05-30 05:03:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_arcs`
--
ALTER TABLE `cdac_arcs`
  ADD PRIMARY KEY (`arc_code`),
  ADD UNIQUE KEY `arc_contact_email` (`arc_contact_email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
