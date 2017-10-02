-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2017 at 06:31 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

drop table if exists `cdac_entity_facilities`;

--
-- Table structure for table `cdac_entity_facilities`
--

CREATE TABLE IF NOT EXISTS `cdac_entity_facilities` (
  `id` bigint(20) NOT NULL,
  `entity_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `facility_area` varchar(20) COLLATE utf8_unicode_ci NULL,
  `facility_classes` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `facility_labs` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `facility_restrooms` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `facility_library` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'A',
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'SYSTEM',
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_entity_facilities`
--
ALTER TABLE `cdac_entity_facilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entity_code` (`entity_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cdac_entity_facilities`
--
ALTER TABLE `cdac_entity_facilities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cdac_entity_facilities`
--
ALTER TABLE `cdac_entity_facilities`
  ADD CONSTRAINT `entity_facilities_ibfk_1` FOREIGN KEY (`entity_code`) REFERENCES `cdac_entities` (`entity_code`);
