-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2017 at 06:59 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

drop table if exists `atc_student_enquiries`;

--
-- Table structure for table `atc_student_enquiries`
--

CREATE TABLE IF NOT EXISTS `atc_student_enquiries` (
  `id` bigint(20) NOT NULL,
  `enquiry_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `entity_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `student_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intended_course` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `other_course_name` varchar(50) COLLATE utf8_unicode_ci NULL,
  `enquiry_dt` date NOT NULL,
  `enquiry_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `prospectus_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prospectus_payment` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enquiry_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `enquiry_notes` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atc_student_enquiries`
--

INSERT INTO `atc_student_enquiries` (`id`, `enquiry_id`, `first_name`, `last_name`, `entity_code`, `student_id`, `intended_course`, `enquiry_dt`, `enquiry_status`, `prospectus_number`, `prospectus_payment`, `enquiry_email`, `enquiry_notes`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 'ENQ-1', 'Sanjay', 'Verma', 'HPD03', '', 'CMM', '0000-00-00', 'E', '', 'No', 'sanjay@hpie.in', 'asda asfasd sdfs', '', '2017-06-26 15:12:00', NULL, '2017-06-26 15:12:00'),
(2, 'ENQ-2', 'Sanjay', 'Verma', 'HPD02', '', 'ADMCP', '2017-06-30', 'E', '', 'No', 'sanjay@hpie.in', 'asascfasvc ', '', '2017-06-26 15:14:25', NULL, '2017-06-26 15:14:25'),
(3, 'ENQ-3', 'Sanjay', 'Verma', 'HPV01', '', 'ADMCA', '2017-06-01', 'E', '', 'No', 'sanjay@hpie.in', 'AS ASF SDAFVSD ', 'member', '2017-06-26 15:23:20', NULL, '2017-06-26 15:23:20'),
(4, 'ENQ-4', 'Test', 'Student', 'HPE 01', '', 'CMOA ', '2017-06-01', 'E', '', 'No', 'sanjay@hpie.in', 'sampe ntes', 'member', '2017-06-28 16:57:12', NULL, '2017-06-28 16:57:12'),
(5, 'ENQ-5', 'Sanjay', 'Verma', 'HPD04', 'Him-01-ST-1', 'CFLASH', '2017-06-01', 'E', '', 'No', 'sanjay@hpie.in', 'dfsgsdhnfj ', 'member', '2017-06-29 10:08:37', NULL, '2017-06-29 10:08:37'),
(6, 'ENQ-6', 'Shweta', 'S', 'HPA01', NULL, 'CCB&MT', '2017-08-04', 'E', '', NULL, 'sss@abc.com', 'note', 'member', '2017-08-03 19:21:27', NULL, '2017-08-03 19:21:27'),
(7, 'ENQ-7', 'Amit', 'S', 'HPD05', NULL, 'CDOTTECH', '2017-08-04', 'E', '', NULL, 'sare@areare.com', 'joorep', 'member', '2017-08-03 19:25:49', NULL, '2017-08-03 19:25:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atc_student_enquiries`
--
ALTER TABLE `atc_student_enquiries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atc_student_enquiries`
--
ALTER TABLE `atc_student_enquiries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;