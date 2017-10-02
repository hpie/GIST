-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2017 at 07:19 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

drop table if exists `atc_student_enrolments`;

--
-- Table structure for table `atc_student_enrolments`
--

CREATE TABLE IF NOT EXISTS `atc_student_enrolments` (
  `row_id` bigint(20) NOT NULL COMMENT 'This is the admission id of the registered student',
  `student_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `course_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `start_dt` date NOT NULL,
  `end_dt` date DEFAULT NULL,
  `enrollment_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'New Admission, Upgrade, Returning Student',
  `upgraded_from` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'This will have old course if the student is upgraded',
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ONG' COMMENT 'Ongoing, Completed, Upgraded, Dropped',
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atc_student_enrolments`
--
ALTER TABLE `atc_student_enrolments`
  ADD PRIMARY KEY (`row_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atc_student_enrolments`
--
ALTER TABLE `atc_student_enrolments`
  MODIFY `row_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'This is the admission id of the registered student';