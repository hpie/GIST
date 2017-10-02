-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2017 at 11:20 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

drop table if exists `atc_student_qualifications`;
--
-- Table structure for table `atc_student_qualifications`
--

CREATE TABLE IF NOT EXISTS `atc_student_qualifications` (
  `qualification_id` bigint(20) NOT NULL,
  `student_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `highest_qualification` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'allowed values: 10th, 12th, Diploma, Graduate, Post Graduate',
  `10_max_marks` int(4) DEFAULT NULL,
  `10_obtained_marks` int(4) DEFAULT NULL,
  `10_passing_year` date DEFAULT NULL,
  `10_institute_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `10_board_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `12_max_marks` int(4) DEFAULT NULL,
  `12_obtained_marks` int(4) DEFAULT NULL,
  `12_passing_year` date DEFAULT NULL,
  `12_institute_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `12_board_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diploma_max_marks` int(4) DEFAULT NULL,
  `diploma_obtained_marks` int(4) DEFAULT NULL,
  `diploma_passing_year` date DEFAULT NULL,
  `diploma_institute_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diploma_board_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `graduate_max_marks` int(4) DEFAULT NULL,
  `graduate_obtained_marks` int(4) DEFAULT NULL,
  `graduate_passing_year` date DEFAULT NULL,
  `graduate_institute_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `graduate_board_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_graduate_max_marks` int(4) DEFAULT NULL,
  `post_graduate_obtained_marks` int(4) DEFAULT NULL,
  `post_graduate_passing_year` date DEFAULT NULL,
  `post_graduate_institute_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_graduate_board_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
   `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atc_student_qualifications`
--
ALTER TABLE `atc_student_qualifications`
  ADD PRIMARY KEY (`qualification_id`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atc_student_qualifications`
--
ALTER TABLE `atc_student_qualifications`
  MODIFY `qualification_id` bigint(20) NOT NULL AUTO_INCREMENT;