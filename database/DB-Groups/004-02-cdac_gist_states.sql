-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2017 at 04:57 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

DROP TABLE IF EXISTS `cdac_states`;

--
-- Table structure for table `cdac_states`
--

CREATE TABLE IF NOT EXISTS `cdac_states` (
  `state_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `state_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cdac_states`
--

INSERT INTO `cdac_states` (`state_code`, `state_name`, `country_id`, `status`, `created_by`, `created_dt`) VALUES
('AN', 'ANDAMAN & NICOBAR', 1, 'A', '', '2016-12-31 18:30:00'),
('AP', 'ANDHRA PRADESH', 1, 'A', '', '2016-12-31 18:30:00'),
('AR', 'ARUNACHAL PRADESH', 1, 'A', '', '2016-12-31 18:30:00'),
('AS', 'ASSAM', 1, 'A', '', '2016-12-31 18:30:00'),
('BH', 'BIHAR', 1, 'A', '', '2016-12-31 18:30:00'),
('CH', 'CHANDIGARH', 1, 'A', '', '2016-12-31 18:30:00'),
('CS', 'CHATTISGARH', 1, 'A', '', '2016-12-31 18:30:00'),
('DA', 'DAMAN & DIU', 1, 'A', '', '2016-12-31 18:30:00'),
('DL', 'DELHI', 1, 'A', '', '2016-12-31 18:30:00'),
('DN', 'DADRA & NAGAR', 1, 'A', '', '2016-12-31 18:30:00'),
('GA', 'GOA', 1, 'A', '', '2016-12-31 18:30:00'),
('GJ', 'GUJRAT', 1, 'A', '', '2016-12-31 18:30:00'),
('HP', 'HIMACHAL PRADESH', 1, 'A', '', '2016-12-31 18:30:00'),
('HR', 'HARYANA', 1, 'A', '', '2016-12-31 18:30:00'),
('JH', 'JHARKHAND', 1, 'A', '', '2016-12-31 18:30:00'),
('JK', 'JAMMU & KASHMIR', 1, 'A', '', '2016-12-31 18:30:00'),
('KA', 'KARNATAKA', 1, 'A', '', '2016-12-31 18:30:00'),
('KL', 'KERALA', 1, 'A', '', '2016-12-31 18:30:00'),
('LK', 'LAKSHDWEEP', 1, 'A', '', '2016-12-31 18:30:00'),
('MG', 'MEGHALAYA', 1, 'A', '', '2016-12-31 18:30:00'),
('MH', 'MAHARASHTRA', 1, 'A', '', '2016-12-31 18:30:00'),
('MI', 'MIZORAM', 1, 'A', '', '2016-12-31 18:30:00'),
('MN', 'MANIPUR', 1, 'A', '', '2016-12-31 18:30:00'),
('MP', 'MADHYA PRADESH', 1, 'A', '', '2016-12-31 18:30:00'),
('NG', 'NAGALAND', 1, 'A', '', '2016-12-31 18:30:00'),
('OR', 'ORISSA', 1, 'A', '', '2016-12-31 18:30:00'),
('PB', 'PUNJAB', 1, 'A', '', '2016-12-31 18:30:00'),
('PY', 'PONDICHERY', 1, 'A', '', '2016-12-31 18:30:00'),
('RJ', 'RAJASTHAN', 1, 'A', '', '2016-12-31 18:30:00'),
('SK', 'SIKKIM', 1, 'A', '', '2016-12-31 18:30:00'),
('TN', 'TAMIL NADU', 1, 'A', '', '2016-12-31 18:30:00'),
('TR', 'TRIPURA', 1, 'A', '', '2016-12-31 18:30:00'),
('TS', 'TELANGANA', 1, 'A', '', '2016-12-31 18:30:00'),
('UA', 'UTTARANCHAL', 1, 'A', '', '2016-12-31 18:30:00'),
('UP', 'UTTAR PRADESH', 1, 'A', '', '2016-12-31 18:30:00'),
('WB', 'WEST BENGAL', 1, 'A', '', '2016-12-31 18:30:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_states`
--
ALTER TABLE `cdac_states`
  ADD PRIMARY KEY (`state_code`),
  ADD UNIQUE KEY `state_name` (`state_name`);
