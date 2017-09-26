-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2017 at 04:29 PM
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

DROP TABLE IF EXISTS `cdac_book_request_logs`;
--
-- Table structure for table `cdac_book_request_logs`
--

CREATE TABLE IF NOT EXISTS `cdac_book_request_logs` (
  `id` bigint(20) NOT NULL,
  `book_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `entity_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `book_requested_count` int(11) DEFAULT NULL,
  `requesting_to` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requesting_dt` date NOT NULL,
  `book_dispatched_count` int(11) NOT NULL DEFAULT '0',
  `dispatched_dt` date DEFAULT NULL,
  `book_received_count` int(11) NOT NULL DEFAULT '0',
  `received_dt` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_dt` date DEFAULT NULL,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cdac_book_request_logs`
--

INSERT INTO `cdac_book_request_logs` (`id`, `book_code`, `entity_code`, `book_requested_count`, `requesting_to`, `requesting_dt`, `book_dispatched_count`, `dispatched_dt`, `book_received_count`, `received_dt`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(3, 'CB-1', 'HPO01', 100, 'ARC-1', '2017-09-26', 90, '2017-09-26', 90, '2017-09-27', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_book_request_logs`
--
ALTER TABLE `cdac_book_request_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entity_code` (`entity_code`),
  ADD KEY `requesting_to` (`requesting_to`),
  ADD KEY `book_code` (`book_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cdac_book_request_logs`
--
ALTER TABLE `cdac_book_request_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cdac_book_request_logs`
--
ALTER TABLE `cdac_book_request_logs`
  ADD CONSTRAINT `cdac_book_request_logs_ibfk_1` FOREIGN KEY (`entity_code`) REFERENCES `cdac_entities` (`entity_code`),
  ADD CONSTRAINT `cdac_book_request_logs_ibfk_2` FOREIGN KEY (`requesting_to`) REFERENCES `cdac_entities` (`entity_code`),
  ADD CONSTRAINT `cdac_book_request_logs_ibfk_3` FOREIGN KEY (`book_code`) REFERENCES `cdac_books` (`book_code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
