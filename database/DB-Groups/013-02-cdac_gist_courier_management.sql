-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2017 at 11:17 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

-- Drop table if exists

DROP TABLE IF EXISTS `cdac_couriers`;

--
-- Table structure for table `cdac_couriers`
--

CREATE TABLE IF NOT EXISTS `cdac_couriers` (
  `row_id` int(11) NOT NULL,
  `docket_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `carrier_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `from_entity_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `from_entity_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `to_entity_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `to_entity_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `package_sent_dt` date NOT NULL,
  `package_content_details` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `package_received_dt` date NULL,
  `created_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `modified_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdac_couriers`
--

INSERT INTO `cdac_couriers` (`row_id`, `docket_code`, `carrier_code`, `from_entity_type`, `from_entity_code`, `to_entity_type`, `to_entity_code`, `status`, `package_sent_dt`, `package_content_details`, `comments`, `package_received_dt`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(8, 'ABC100', '1', 'ATC', 'HPO01', 'ARC', 'ARC-1', '', '2017-08-28', '100 books', '', '0000-00-00', '', '2017-08-28 21:11:23', '', '0000-00-00 00:00:00'),
(9, 'DTDC-01', '1', '1', 'ARC-1', '2', 'Him-01', '', '2017-08-30', 'Test Package', 'book 1 book 2', '0000-00-00', '', '2017-08-28 20:15:55', '', '0000-00-00 00:00:00'),
(10, 'FEDEX-01', '2', 'ATC', 'HPU01', 'ARC', 'GUJ-1', '', '2017-08-30', 'Marks Sheets', 'Marks Sheets', '0000-00-00', '', '2017-08-28 21:10:53', '', '0000-00-00 00:00:00'),
(11, 'DTDC-01', '3', 'ATC', 'HPC01', 'ARC', 'GUJ-1', '', '2017-08-30', 'Certificates', 'Certificates', '0000-00-00', '', '2017-08-28 20:49:02', '', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_couriers`
--
ALTER TABLE `cdac_couriers`
  ADD PRIMARY KEY (`row_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cdac_couriers`
--
ALTER TABLE `cdac_couriers`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;