-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2017 at 06:38 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

drop table if exists `entity_faculty_modules`;

--
-- Table structure for table `entity_faculty_modules`
--

CREATE TABLE IF NOT EXISTS `entity_faculty_modules` (
  `row_id` bigint(20) NOT NULL,
  `faculty_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `module_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `atc_faculty_modules`
--

INSERT INTO `entity_faculty_modules` (`row_id`, `faculty_code`, `module_code`) VALUES
(5, 'FAC-01', 'JAVA'),
(6, 'FAC-01', 'C'),
(7, 'FAC-02', 'HTML'),
(8, 'FAC-02', 'NC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `entity_faculty_modules`
--
ALTER TABLE `entity_faculty_modules`
  ADD PRIMARY KEY (`row_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `entity_faculty_modules`
--
ALTER TABLE `entity_faculty_modules`
  MODIFY `row_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;