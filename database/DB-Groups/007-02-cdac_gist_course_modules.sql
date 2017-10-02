-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2017 at 06:05 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

drop table if exists `cdac_course_modules`;

--
-- Table structure for table `cdac_course_modules`
--

CREATE TABLE IF NOT EXISTS `cdac_course_modules` (
  `row_id` bigint(20) NOT NULL,
   `course_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `module_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
 ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cdac_course_modules`
--

INSERT INTO `cdac_course_modules` (`row_id`, `module_code`, `course_code`) VALUES
(1, 'C', 'ADMCA'),
(2, 'JAVA', 'ADMCA'),
(3, 'NC', 'ADMCA');


--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_course_modules`
--
ALTER TABLE `cdac_course_modules`
  ADD PRIMARY KEY (`row_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cdac_course_modules`
--
ALTER TABLE `cdac_course_modules`
  MODIFY `row_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;