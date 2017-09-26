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

DROP TABLE IF EXISTS `atc_student_book_issue_logs`;
--
-- Table structure for table `atc_student_book_issue_logs`
--

CREATE TABLE IF NOT EXISTS `atc_student_book_issue_logs` (
  `row_id` bigint(20) NOT NULL,
  `student_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `entity_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `course_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `module_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `book_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `issue_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `book_issue_dt` date NOT NULL,
  `created_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `atc_student_book_issue_logs`
--

INSERT INTO `atc_student_book_issue_logs` (`row_id`, `student_id`, `entity_code`, `course_code`, `module_code`, `book_code`, `issue_status`, `book_issue_dt`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 'PACE-11757', 'HPO01', 'ADMCA', 'C', 'CB-1', 'Issued', '2017-08-17', 'member', '2017-08-03 19:50:48', '', '2017-08-03 19:50:48'),
(2, 'PACE-11756', 'HPO01', 'ADMCA', 'C', 'CB-1', 'P', '0000-00-00', 'member', '2017-08-03 20:04:16', '', '2017-08-03 20:04:16'),
(3, 'PACE-11756', 'HPO01', 'ADMCA', 'JAVA', 'CB-15', 'P', '0000-00-00', 'member', '2017-08-03 20:04:16', '', '2017-08-03 20:04:16'),
(4, 'PACE-11756', 'HPO01', 'ADMCA', 'NC', 'CB-10', 'P', '0000-00-00', 'member', '2017-08-03 20:04:16', '', '2017-08-03 20:04:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atc_student_book_issue_logs`
--
ALTER TABLE `atc_student_book_issue_logs`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_code` (`course_code`),
  ADD KEY `module_code` (`module_code`),
  ADD KEY `book_code` (`book_code`),
  ADD KEY `entity_code` (`entity_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atc_student_book_issue_logs`
--
ALTER TABLE `atc_student_book_issue_logs`
  MODIFY `row_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `atc_student_book_issue_logs`
--
ALTER TABLE `atc_student_book_issue_logs`
  ADD CONSTRAINT `atc_student_book_issue_logs_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `atc_student_registrations` (`student_id`),
  ADD CONSTRAINT `atc_student_book_issue_logs_ibfk_2` FOREIGN KEY (`course_code`) REFERENCES `cdac_courses` (`course_code`),
  ADD CONSTRAINT `atc_student_book_issue_logs_ibfk_3` FOREIGN KEY (`module_code`) REFERENCES `cdac_modules` (`module_code`),
  ADD CONSTRAINT `atc_student_book_issue_logs_ibfk_4` FOREIGN KEY (`book_code`) REFERENCES `cdac_books` (`book_code`),
  ADD CONSTRAINT `atc_student_book_issue_logs_ibfk_5` FOREIGN KEY (`entity_code`) REFERENCES `cdac_entities` (`entity_code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
