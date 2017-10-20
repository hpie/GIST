-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2017 at 04:20 PM
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

DROP TABLE IF EXISTS `couriers`;
DROP TABLE IF EXISTS `cdac_couriers`;

--
-- Table structure for table `couriers`
--

CREATE TABLE IF NOT EXISTS `cdac_couriers` (
  `row_id` int(11) NOT NULL,
  `docket_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `carrier_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `entity_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sending_to` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `courier_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sent_dt` date NOT NULL,
  `content_details` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `received_dt` date NOT NULL,
  `created_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modified_dt` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `couriers`
--

INSERT INTO `cdac_couriers` (`row_id`, `docket_code`, `carrier_code`, `entity_code`, `sending_to`, `courier_status`, `sent_dt`, `content_details`, `comments`, `received_dt`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(16, '1000', '3', 'ARC-1', 'CDAC', '', '2017-10-07', '100 books 200 books', '', '0000-00-00', '', '2017-10-06 13:54:18', '', '0000-00-00 00:00:00'),
(17, '2000', '3', 'ARC-1', 'HPO01', '', '2017-10-07', '100 books', '', '2017-10-07', '', '2017-10-06 14:05:25', '', '0000-00-00 00:00:00'),
(18, '12345', '2', 'HPO01', 'ARC-1', 'REC', '2017-10-07', '100 books', '', '2017-10-07', '', '2017-10-06 14:17:16', '', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `couriers`
--
ALTER TABLE `cdac_couriers`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `entity_code` (`entity_code`),
  ADD KEY `sending_to` (`sending_to`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `cdac_couriers`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `couriers`
--
ALTER TABLE `cdac_couriers`
  ADD CONSTRAINT `couriers_ibfk_1` FOREIGN KEY (`entity_code`) REFERENCES `cdac_entities` (`entity_code`),
  ADD CONSTRAINT `couriers_ibfk_2` FOREIGN KEY (`sending_to`) REFERENCES `cdac_entities` (`entity_code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
