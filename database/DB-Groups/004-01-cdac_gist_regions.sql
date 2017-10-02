-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2017 at 06:54 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

drop table if exists `cdac_regions`;

--
-- Table structure for table `cdac_regions`
--

CREATE TABLE IF NOT EXISTS `cdac_regions` (
  `region_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `region_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cdac_regions`
--

INSERT INTO `cdac_regions` (`region_code`, `region_name`, `created_by`, `created_dt`, `status`) VALUES
('GJ-01', 'Gujrat North',  '', '2016-12-31 18:30:00', 'A'),
('GJ-02', 'Gujrat South', '', '2016-12-31 18:30:00', 'A'),
('HP', 'Himachal Pradesh', '', '2016-12-31 18:30:00', 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_regions`
--
ALTER TABLE `cdac_regions`
  ADD PRIMARY KEY (`region_code`);
