-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2017 at 09:27 AM
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

DROP TABLE IF EXISTS `atc_prospectus_book_issue_logs`;
--
-- Table structure for table `atc_prospectus_book_issue_logs`
--

CREATE TABLE IF NOT EXISTS `atc_prospectus_book_issue_logs` (
  `row_id` bigint(20) NOT NULL,
  `enrolment_id` bigint(20) NOT NULL,
  `entity_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `issue_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prospectus_issue_dt` date NOT NULL,
  `created_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `atc_prospectus_book_issue_logs`
--
ALTER TABLE `atc_prospectus_book_issue_logs`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `enrolment_id` (`enrolment_id`),
  ADD KEY `entity_code` (`entity_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atc_prospectus_book_issue_logs`
--
ALTER TABLE `atc_prospectus_book_issue_logs`
  MODIFY `row_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `atc_prospectus_book_issue_logs`
--
ALTER TABLE `atc_prospectus_book_issue_logs`
  ADD CONSTRAINT `atc_student_prospectus_issue_logs_ibfk_1` FOREIGN KEY (`enrolment_id`) REFERENCES `atc_student_enrolments` (`row_id`),
  ADD CONSTRAINT `atc_student_prospectus_issue_logs_ibfk_5` FOREIGN KEY (`entity_code`) REFERENCES `cdac_entities` (`entity_code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
