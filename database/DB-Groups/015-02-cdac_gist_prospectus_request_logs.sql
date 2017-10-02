-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2017 at 03:39 PM
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

DROP TABLE IF EXISTS `cdac_prospectus_request_logs`;
--
-- Table structure for table `cdac_prospectus_request_logs`
--

CREATE TABLE IF NOT EXISTS `cdac_prospectus_request_logs` (
  `id` bigint(20) NOT NULL,
  `entity_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `prospectus_received_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Received from CDAC/ARC',
  `prospectus_dispatched_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Dispatched to the requested ATC',
  `prospectus_transaction_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'IN or OUT for reporting',
  `to_entity_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed_dt` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_dt` date DEFAULT NULL,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cdac_prospectus_request_logs`
--

INSERT INTO `cdac_prospectus_request_logs` (`id`, `entity_code`, `prospectus_received_count`, `prospectus_dispatched_count`, `prospectus_transaction_type`, `to_entity_code`, `processed_dt`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, ' HPS11',  10, 8, 'IN', 'ATC', '2017-08-14', NULL, NULL, NULL, NULL),
(2, 'Him-01',  10, 8, 'IN', 'ATC', '2017-08-14', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_prospectus_request_logs`
--
ALTER TABLE `cdac_prospectus_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cdac_prospectus_request_logs`
--
ALTER TABLE `cdac_prospectus_request_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
