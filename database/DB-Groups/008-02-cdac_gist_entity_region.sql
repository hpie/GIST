-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2017 at 04:51 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

DROP TABLE IF EXISTS `arc_cdac_regions`;

--
-- Table structure for table `arc_cdac_regions`
--

CREATE TABLE IF NOT EXISTS `arc_cdac_regions` (
  `row_id` bigint(20) NOT NULL,
  `entity_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `region_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arc_cdac_regions`
--
ALTER TABLE `arc_cdac_regions`
  ADD PRIMARY KEY (`row_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arc_cdac_regions`
--
ALTER TABLE `arc_cdac_regions`
  MODIFY `row_id` bigint(20) NOT NULL AUTO_INCREMENT;