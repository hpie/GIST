-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2017 at 10:57 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

drop table if exists `cdac_courses`;

--
-- Table structure for table `cdac_courses`
--

CREATE TABLE IF NOT EXISTS `cdac_courses` (
  `course_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `course_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `course_category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cdac_courses`
--

INSERT INTO `cdac_courses` (`course_code`, `course_name`, `course_description`, `course_status`, `course_category`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('ADMCA', 'ADMCA', 'ADMCA', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('ADMCP', 'ADMCP', 'ADMCP', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('ADMCT', 'ADMCT', 'ADMCT', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('ADMM', 'ADMM', 'ADMM', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('C', 'C', 'C', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('C++', 'C++', 'C++', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('CAIL', 'CAIL', 'CAIL', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('CAJAVA', 'CAJAVA', 'CAJAVA', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('CAP', 'CAP', 'CAP', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('CAPHP', 'CAPHP', 'CAPHP', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('CAUTOCAD3DMAX', 'CAUTOCAD3DMAX', 'CAUTOCAD3DMAX', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('CBJAVA', 'CBJAVA', 'CBJAVA', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('CBOSS&OT', 'CBOSS&OT', 'CBOSS&OT', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('CCB&MT', 'CCB&MT', 'CCB&MT', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('CDOTTECH', 'CDOTTECH', 'CDOTTECH', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('CFLASH', 'CFLASH', 'CFLASH', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('CINDESIGN', 'CINDESIGN', 'CINDESIGN', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('CMM', 'CMM', 'CMM', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('CMOA ', 'CMOA ', 'CMOA ', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('DGMDP', 'DGMDP', 'DGMDP', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('DHN', 'DHN', 'DHN', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('DJAVA', 'DJAVA', 'DJAVA', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('DMCA', 'DMCA', 'DMCA', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('DMCO', 'DMCO', 'DMCO', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('DMCP', 'DMCP', 'DMCP', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('DMM', 'DMM', 'DMM', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('DMOA', 'DMOA', 'DMOA', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('DMOA&FA', 'DMOA&FA', 'DMOA&FA', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('DMWT&P', 'DMWT&P', 'DMWT&P', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('MSO', 'MSO', 'MSO', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('PGDMCA', 'PGDMCA', 'PGDMCA', 'A', NULL, '', '0000-00-00', '', '0000-00-00'),
('TALLY ERP9', 'TALLY ERP9', 'TALLY ERP9', 'A', NULL, '', '0000-00-00', '', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_courses`
--
ALTER TABLE `cdac_courses`
  ADD PRIMARY KEY (`course_code`),
  ADD UNIQUE KEY `course_name` (`course_name`);
