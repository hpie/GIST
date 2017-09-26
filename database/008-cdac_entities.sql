-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2017 at 05:14 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

DROP TABLE IF EXISTS `cdac_entities`;
--
-- Table structure for table `cdac_entities`
--

--
-- Table structure for table `cdac_entities`
--

CREATE TABLE IF NOT EXISTS `cdac_entities` (
  `entity_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `entity_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entity_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ATC' COMMENT 'Either ATC, ARC or CDAC',
  `entity_grade` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Grade Mandatory for ATC A, B , C  D etc. Courses fee etc are dependent on it',
  `entity_parent_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `entity_address_line1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entity_address_line2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_address_city` bigint(20) NOT NULL,
  `entity_address_postcode` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `entity_contact_number` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `entity_contact_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_status` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cdac_entities`
--


INSERT INTO `cdac_entities` (`entity_code`, `entity_name`, `entity_type`, `entity_grade`, `entity_parent_code`, `entity_address_line1`, `entity_address_line2`, `entity_address_city`, `entity_address_postcode`, `entity_contact_number`, `entity_contact_email`, `entity_status`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('HPS11', 'Shivam Institute For Vocational Training', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:37:37'),
('HPU01', 'Universal Education Institute ', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:37:38'),
('ARC-1', 'North ARC', 'ARC', NULL, 'CDAC', 'Line1 Add', 'Line2 Add', 395, '171001', '11111111', 'arc-north@gmail.com', 'A', NULL, '2016-12-31 02:00:00', NULL, '2017-05-29 23:33:23'),
('CDAC', 'CDAC Pune', 'CDAC', NULL, '', 'Line1 Add', 'Line2 Add', 395, '171001', '11111111', 'cdac=gist-pace@cdac.in', 'A', 'system', '2016-12-30 20:30:00', NULL, '2017-05-29 18:03:23'),
('Him-01', 'HPIE', 'ATC', NULL, 'ARC-1', 'SBI Building', 'Lakkar Bazzar', 395, '#10', '1122334455', 'test1@gmail.com', 'A', NULL, '2017-05-29 08:11:42', NULL, '2017-09-25 09:37:38'),
('Him-02', 'HIMIT', 'ATC', NULL, 'ARC-1', '#10', 'Street 1', 395, '171001', '22222222', 'test@gmail.com', 'A', NULL, '2016-12-31 07:30:00', NULL, '2017-09-25 09:37:38'),
('HP508', 'SD INSTITUTE OF IT & MANAGEMENT ', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:37:38'),
('HPA01', 'Arena Info Solution', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:37:38'),
('HPA02', 'Alma computing college', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'B', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:38:13'),
('HPA03', 'Angel Eye Educational Society', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:38:31'),
('HPA04', 'Association For Social Research And Action', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:38:49'),
('HPAO1', 'Arena Info Solutions', 'ATC', NULL, 'ARC-1', '\r\n\r\n', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:39:05'),
('HPB01', 'Bharat Web Technology', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:39:28'),
('HPB02', 'Bharat web Technology', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:39:41'),
('HPB03', 'Bcs College Of Education & Information Technology ', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:39:51'),
('HPC01', 'Cal-C', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:40:01'),
('HPC02', 'Chooreshwar Education Trust', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:40:20'),
('HPC03', 'Career Pride Education & Welfare  Society', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:40:32'),
('HPD01', 'Dhaneshwari Institute Of It', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:40:42'),
('HPD02', 'Dhaneshwari Infotech', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:40:55'),
('HPD03', 'DICE Education Society', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:41:04'),
('HPD04', 'DICE Education Society', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:41:12'),
('HPD05', 'Dev Aastha Institute Of Education ', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:41:22'),
('HPE01', 'Education Arena', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPE02', 'Education Arena (Chowari)', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPE03', 'Emblem Education', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPE04', 'Emblem Education', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPE05', 'EMBLEM EDUCATION', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPG01', 'Grace Education', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPG02', 'Genious Computer Education & Training ', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPG03', 'Global Information & Technology Institute', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPG04', 'Gurukul Tech. Learn. Inst. Berthin', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPG05', 'Gurukul Technical Institute ', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPG06', 'Global Information & Technology Institute', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPG07', 'Gurukul Technical Institute', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPH01', 'Himachal Education Society', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPH02', 'Him Productive Center For Development of Education', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPH03', 'Him Webcom Technorite', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPH04', 'Him Educational Training Society', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPH05', 'Him Gaurav Institute', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPI01', 'Info tech Computer Center', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPI02', 'Institute Of Computer & Competative  Exam', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPI03', 'Infotech computer center', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPI04', 'Infotech computer center', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPK01', 'Kalu Bhat Multi Purpose Society', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPM01', 'Mec Computer Education', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPM02', 'Mamta Computer Center', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPM03', 'Make My Skill', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPM04', 'Mamta Computer Centre', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPM05', 'Mountain Institute Of Computer Education', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPN01', 'Net 4 Academy', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPN02', 'Net 4 Academy', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPN03', 'Nice Computer Center', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPO01', 'Oasis Institute Of Computer Education And Language', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPO02', 'Optech Vidya Computer Centre', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPP02', 'Pride Institute Of Knowledge & Skill', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPR01', 'RDS Computer Center', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPR02', 'R.R.G.S.D. College', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPR03', 'Right Institute Of  Information Technolology', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS03', 'Sun Rise Institute', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS04', 'Svm Computer Centre', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS05', 'saraswat computer education', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS06', 'S.R Institue ', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS07', 'Shiksha Sanchar Educational Trust', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS08', 'Sd Institute Of It & Management', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS09', 'Shivam Institute For Vocational Training', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS10', 'Sv Infotech', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS12', 'Shivam Institute For Vocational Training ', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS13', 'Shivam Institute for Vocational Training', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS14', 'Shivam Institute for vocational training', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS15', 'Shiksha Sanchar Educational Trust ', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS16', 'Skill Institute Of Education', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS17', 'Shivam Institute For Vocational Training', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS18', 'Social Management Association , Education Society', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS19', 'Shivam Institute For Vocational Training ', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPSO3', 'Sun Rise Institute', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPSO4', 'SVM computer center', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPV01', 'Valu of Wisdom', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPV03', 'Value of Wisdom It Center ', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPW01', 'Wisdom Institute Of Technology ', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('NOB01', 'Brain Square Technologies', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('NOF01', 'Friends Computer', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('NOG03', 'Gn Infotech', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('NOH03', 'Him Productive Institute of Education', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('NOS06', 'Sarav Shiksha Education Society', '', NULL, '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-06-06 04:57:03'),
('HPS02', 'Shree Education', 'ATC', NULL, 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 04:57:03', NULL, '2017-09-25 09:37:37'),
('ARC01', 'TESTARC', 'ARC', NULL, 'CDAC01', 'qwe', 'dsa', 395, '121212', '1122334455', 'asd', 'A', NULL, '2017-09-25 15:55:16', 'webmaster', '2017-09-25 16:29:06'),
('ARC02', 'ARCTest', 'ARC', NULL, 'CDAC01', 'ASD', 'DSA', 306, '332211', '12211221', 'asdf', 'A', 'webmaster', '2017-09-25 16:25:50', 'webmaster', '2017-09-25 16:27:33'),
('ATC01', 'ATC One', 'ATC', 'B', 'ARC01', 'qwe', 'wreqe', 395, '332211', '123456789', 'asd@asd.com', 'AC', 'webmaster', '2017-09-25 20:34:42', NULL, '2017-09-25 20:34:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_entities`
--
ALTER TABLE `cdac_entities`
  ADD PRIMARY KEY (`entity_code`),
  ADD UNIQUE KEY `entity_contact_email` (`entity_contact_email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
