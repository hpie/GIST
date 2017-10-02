-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2017 at 07:07 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

drop table if exists `atc_student_documents`;

--
-- Table structure for table `atc_student_documents`
--

CREATE TABLE IF NOT EXISTS `atc_student_documents` (
  `document_id` bigint(20) NOT NULL,
  `student_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `document_purpose` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'allowed values: address, identification, qualification',
  `document_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'allowed values: passport,certificates,adhar card, license card',
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `verified` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'allowed values: YES, NO',
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atc_student_documents`
--
ALTER TABLE `atc_student_documents`
  ADD PRIMARY KEY (`document_id`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atc_student_documents`
--
ALTER TABLE `atc_student_documents`
  MODIFY `document_id` bigint(20) NOT NULL AUTO_INCREMENT;