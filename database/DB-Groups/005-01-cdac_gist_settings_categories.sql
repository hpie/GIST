-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2017 at 05:22 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

drop table if exists `cdac_categories`;

--
-- Table structure for table `cdac_categories`
--

CREATE TABLE IF NOT EXISTS `cdac_categories` (
  `category_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `category_title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `category_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Category Type for Category if they need to be grouped.',
  `category_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cdac_categories`
--

INSERT INTO `cdac_categories` (`category_code`, `category_title`, `category_description`, `category_type`, `category_status`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('10', 'Secondary Education', 'Secondary Education', 'EDU', 'A', 'system', '2017-07-23 13:10:08', NULL, '2017-07-23 13:10:08'),
('12', 'Senior Secondary Education', 'Senior Secondary Education', 'EDU', 'A', 'system', '2017-07-23 13:10:08', NULL, '2017-07-23 13:10:08'),
('A', 'A GRADE', 'Grade A Center', 'GRD', 'A', 'system', '2016-12-31 02:00:00', NULL, '2017-07-23 11:11:12'),
('B', 'B GRADE', 'Grade B Center', 'GRD', 'A', '', '2016-12-31 02:00:00', NULL, '2017-07-23 11:11:12'),
('DIP', 'Diploma', 'Diploma', 'EDU', 'A', 'system', '2017-08-03 14:55:05', NULL, '2017-08-03 14:55:05'),
('GRAD', 'Graduation', 'Graduation', 'EDU', 'A', 'system', '2017-08-03 14:55:05', NULL, '2017-08-03 14:55:05'),
('NEW', 'New Admission', 'New Admissoin', 'ENR', 'A', 'system', '2017-08-03 14:55:05', NULL, '2017-08-03 14:55:05'),
('PGDIP', 'PG Diploma', 'Post Ggraduate Diploma', 'EDU', 'A', 'system', '2017-08-03 14:55:05', NULL, '2017-08-03 14:55:05'),
('POSTGRAD', 'Post Graduation', 'Post Graduation', 'EDU', 'A', 'system', '2017-08-03 14:55:05', NULL, '2017-08-03 14:55:05'),
('RET', 'Returning Student', 'Returning Student', 'ENR', 'A', 'system', '2017-08-03 14:55:05', NULL, '2017-08-03 14:55:05'),
('UPG', 'Upgraded', 'Upgraded Course', 'ENR', 'A', 'system', '2017-08-03 14:55:05', NULL, '2017-08-03 14:55:05'),
('ADR', 'Address', 'Address', 'POD', 'A', 'system', '2017-08-03 14:55:05', NULL, '2017-08-03 14:55:05'),
('ID', 'Identity', 'Identity', 'POD', 'A', 'system', '2017-08-03 14:55:05', NULL, '2017-08-03 14:55:05'),
('QUAL', 'Qualification', 'Qualification', 'POD', 'A', 'system', '2017-08-03 14:55:05', NULL, '2017-08-03 14:55:05'), 
('CERT', 'Certificates', 'Certificates', 'PDT', 'A', 'system', '2017-08-03 14:55:05', NULL, '2017-08-03 14:55:05'),
('PASS', 'Passport', 'Passport', 'PDT', 'A', 'system', '2017-08-03 14:55:05', NULL, '2017-08-03 14:55:05'),
('LIC', 'License', 'License', 'PDT', 'A', 'system', '2017-08-03 14:55:05', NULL, '2017-08-03 14:55:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_categories`
--
ALTER TABLE `cdac_categories`
  ADD PRIMARY KEY (`category_code`),
  ADD UNIQUE KEY `category_title` (`category_title`);
