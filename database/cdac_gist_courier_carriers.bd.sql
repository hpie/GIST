-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2017 at 11:16 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

-- Drop tables if exists

DROP TABLE IF EXISTS `courier_carriers`;

--
-- Table structure for table `courier_carriers`
--

CREATE TABLE IF NOT EXISTS `courier_carriers` (
  `row_id` int(11) NOT NULL,
  `carrier_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `carrier_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `carrier_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courier_carriers`
--

INSERT INTO `courier_carriers` (`row_id`, `carrier_code`, `carrier_name`, `carrier_status`, `url`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 'VRL123', 'VRL', 'A', 'google.com', '', '2017-08-20 05:23:41', '', '0000-00-00 00:00:00'),
(2, 'FEDEX', 'FEDEX', 'A', '', '', '2017-08-28 20:44:49', '', '0000-00-00 00:00:00'),
(3, 'DTDC', 'DTDC', 'A', '', '', '2017-08-28 20:44:49', '', '0000-00-00 00:00:00'),
(4, 'GATI', 'GATI', 'A', '', '', '2017-08-28 20:45:51', '', '0000-00-00 00:00:00'),
(5, 'FIRSTFLIGHT', 'First Flight', 'A', '', '', '2017-08-28 20:45:51', '', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courier_carriers`
--
ALTER TABLE `courier_carriers`
  ADD PRIMARY KEY (`row_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courier_carriers`
--
ALTER TABLE `courier_carriers`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;