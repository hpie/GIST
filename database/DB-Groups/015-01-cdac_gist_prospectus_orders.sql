-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2017 at 04:44 PM
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

DROP TABLE IF EXISTS `cdac_prospectus_orders`;

-- --------------------------------------------------------

--
-- Table structure for table `cdac_prospectus_orders`
--

CREATE TABLE IF NOT EXISTS `cdac_prospectus_orders` (
  `id` bigint(20) NOT NULL,
  `entity_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `requesting_to` varchar(20) COLLATE utf8_unicode_ci NOT NULL,  
  `requesting_count` int(11) NOT NULL,
  `requesting_dt` date NOT NULL,
  `expected_dt` date DEFAULT NULL,
  `request_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dispatched_count` int(11) NOT NULL,
  `dispatched_dt` date DEFAULT NULL,
  `delivery_mode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_reference` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `received_dt` date DEFAULT NULL,
  `received_count` int(11) DEFAULT NULL,
  `reason_for_loss` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` date NOT NULL,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `modified_dt` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for table `cdac_prospectus_orders`
--
ALTER TABLE `cdac_prospectus_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entity_code` (`entity_code`);
  

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cdac_prospectus_orders`
--
ALTER TABLE `cdac_prospectus_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cdac_prospectus_orders`
--
ALTER TABLE `cdac_prospectus_orders`
  ADD CONSTRAINT `cdac_prospectus_orders_ibfk_1` FOREIGN KEY (`entity_code`) REFERENCES `cdac_entities` (`entity_code`),
  ADD CONSTRAINT `cdac_prospectus_orders_ibfk_2` FOREIGN KEY (`requesting_to`) REFERENCES `cdac_entities` (`entity_code`)  ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
