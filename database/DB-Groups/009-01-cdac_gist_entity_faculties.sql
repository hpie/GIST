-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2017 at 06:35 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

drop table if exists  `cdac_entity_faculties`;

--
-- Table structure for table `cdac_entity_faculties`
--

CREATE TABLE IF NOT EXISTS `cdac_entity_faculties` (
  `faculty_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `entity_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `faculty_joining_dt` date NOT NULL,
  `faculty_leaving_dt` date DEFAULT NULL,
  `faculty_status`varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `faculty_gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `faculty_mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `faculty_email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `faculty_dob` date NOT NULL,
  `current_address_line1` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `current_address_line2` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_address_city` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `current_address_pincode` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `permanent_address_line1` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `permanent_address_line2` varchar(40) COLLATE utf8_unicode_ci NULL,
  `permanent_address_city` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `permanent_address_pincode` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cdac_entity_faculties`
--

INSERT INTO `cdac_entity_faculties` (`faculty_code`, `first_name`, `last_name`, `entity_code`, `faculty_joining_dt`, `faculty_leaving_dt`, `faculty_gender`, `faculty_mobile`, `faculty_email`, `faculty_dob`, `faculty_status`, `current_address_line1`, `current_address_line2`, `current_address_city`, `current_address_pincode`, `permanent_address_line1`, `permanent_address_line2`, `permanent_address_city`, `permanent_address_pincode`, `status`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('FAC-01', 'Test', 'Fac', ' HPS02', '2017-07-03', NULL, 'F', '112233455', 'test@test.com', '1997-07-01', 'P', 'Ad1, Ad2', 'Ad2', '2', '332211', 'Ad2', 'Ad2', '2', '332211', 'A', '', '2017-07-11 07:25:18', NULL, '2017-07-11 07:25:18'),
('FAC-02', 'New', 'Fac', 'Him-01', '2016-07-01', NULL, 'M', '221133114411', 'test@hpie.in', '1998-07-01', 'P', 'Ad1, Ad2', 'Ad2', '395', '332211', 'Ad2', 'Ad2', '395', '332211', 'A', '', '2017-07-11 07:37:04', NULL, '2017-07-11 07:37:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_entity_faculties`
--
ALTER TABLE `cdac_entity_faculties`
  ADD PRIMARY KEY (`faculty_code`),
  ADD UNIQUE KEY `faculty_email` (`faculty_email`),
  ADD UNIQUE KEY `contact_phone` (`faculty_mobile`);
