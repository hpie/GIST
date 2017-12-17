-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2017 at 06:05 AM
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

DROP TABLE IF EXISTS `cdac_prospectuses`;

--
-- Table structure for table `cdac_prospectuses`
--

CREATE TABLE IF NOT EXISTS `cdac_prospectuses` (
  `prospectus_code` bigint(20) NOT NULL,
  `prospectus_request_id` bigint(20) NOT NULL,
  `prospectus_status` bigint(20) NOT NULL,
  `created_dt` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `modified_dt` int(11) DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_prospectuses`
--
ALTER TABLE `cdac_prospectuses`
  ADD PRIMARY KEY (`prospectus_code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Constraints for table `cdac_prospectus_requests`
--
ALTER TABLE `cdac_prospectuses`
  ADD CONSTRAINT `cdac_prospectuses_ibfk_1` FOREIGN KEY (`prospectus_request_id`) REFERENCES `cdac_prospectus_requests` (`id`);