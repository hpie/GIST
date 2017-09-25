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

CREATE TABLE IF NOT EXISTS `cdac_entities` (
  `entity_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `entity_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entity_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
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

INSERT INTO `cdac_entities` (`entity_code`, `entity_name`, `entity_type`, `entity_parent_code`, `entity_address_line1`, `entity_address_line2`, `entity_address_city`, `entity_address_postcode`, `entity_contact_number`, `entity_contact_email`, `entity_status`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(' HPS02', 'Shree Education', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:07:37'),
(' HPS11', 'Shivam Institute For Vocational Training', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:07:37'),
(' HPU01', 'Universal Education Institute ', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:07:38'),
('ARC-1', 'North ARC', 'ARC', 'CDAC', 'Line1 Add', 'Line2 Add', 395, '171001', '11111111', 'arc-north@gmail.com', 'A', NULL, '2016-12-31 07:30:00', NULL, '2017-05-30 05:03:23'),
('CDAC', 'CDAC Pune', 'CDAC', '', 'Line1 Add', 'Line2 Add', 395, '171001', '11111111', 'cdac=gist-pace@cdac.in', 'A', 'system', '2016-12-31 02:00:00', NULL, '2017-05-29 23:33:23'),
('Him-01', 'HPIE', 'ATC', 'ARC-1', 'SBI Building', 'Lakkar Bazzar', 395, '#10', '1122334455', 'test1@gmail.com', 'A', NULL, '2017-05-29 13:41:42', NULL, '2017-09-25 15:07:38'),
('Him-02', 'HIMIT', 'ATC', 'ARC-1', '#10', 'Street 1', 395, '171001', '22222222', 'test@gmail.com', 'A', NULL, '2016-12-31 13:00:00', NULL, '2017-09-25 15:07:38'),
('HP508', 'SD INSTITUTE OF IT & MANAGEMENT ', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:07:38'),
('HPA01', 'Arena Info Solution', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:07:38'),
('HPA02', 'Alma computing college', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'B', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:08:13'),
('HPA03', 'Angel Eye Educational Society', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:08:31'),
('HPA04', 'Association For Social Research And Action', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:08:49'),
('HPAO1', 'Arena Info Solutions', 'ATC', 'ARC-1', '\r\n\r\n', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:09:05'),
('HPAO4', 'Association For Social Research & Action', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:09:17'),
('HPB01', 'Bharat Web Technology', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:09:28'),
('HPB02', 'Bharat web Technology', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:09:41'),
('HPB03', 'Bcs College Of Education & Information Technology ', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:09:51'),
('HPC01', 'Cal-C', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:10:01'),
('HPC02', 'Chooreshwar Education Trust', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:10:20'),
('HPC03', 'Career Pride Education & Welfare  Society', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:10:32'),
('HPD01', 'Dhaneshwari Institute Of It', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:10:42'),
('HPD02', 'Dhaneshwari Infotech', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:10:55'),
('HPD03', 'DICE Education Society', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:11:04'),
('HPD04', 'DICE Education Society', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:11:12'),
('HPD05', 'Dev Aastha Institute Of Education ', 'ATC', 'ARC-1', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-09-25 15:11:22'),
('HPE 01', 'Education Arena', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPE-01', 'Education Arena', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPE01', 'Education Arena', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPE02', 'Education Arena (Chowari)', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPE03', 'Emblem Education', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPE04', 'Emblem Education', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPE05', 'EMBLEM EDUCATION', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG01', 'Grace Education', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG02', 'Genious Computer Education & Training ', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG03', 'Global Information & Technology Institute', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG04', 'Gurukul Tech. Learn. Inst. Berthin', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG05', 'Gurukul Technical Institute ', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG06', 'Global Information & Technology Institute', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG07', 'Gurukul Technical Institute', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPH01', 'Himachal Education Society', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPH02', 'Him Productive Center For Development of Education', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPH03', 'Him Webcom Technorite', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPH04', 'Him Educational Training Society', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPH05', 'Him Gaurav Institute', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPI01', 'Info tech Computer Center', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPI02', 'Institute Of Computer & Competative  Exam', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPI03', 'Infotech computer center', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPI04', 'Infotech computer center', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPK01', 'Kalu Bhat Multi Purpose Society', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPM01', 'Mec Computer Education', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPM02', 'Mamta Computer Center', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPM03', 'Make My Skill', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPM04', 'Mamta Computer Centre', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPM05', 'Mountain Institute Of Computer Education', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPN01', 'Net 4 Academy', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPN02', 'Net 4 Academy', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPN03', 'Nice Computer Center', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPO01', 'Oasis Institute Of Computer Education And Language', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPO02', 'Optech Vidya Computer Centre', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPP02', 'Pride Institute Of Knowledge & Skill', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPR01', 'RDS Computer Center', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPR02', 'R.R.G.S.D. College', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPR03', 'Right Institute Of  Information Technolology', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS011', 'Shivam Institute For Vocational Training', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS02', 'Shree Education', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS03', 'Sun Rise Institute', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS04', 'Svm Computer Centre', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS05', 'saraswat computer education', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS06', 'S.R Institue ', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS07', 'Shiksha Sanchar Educational Trust', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS08', 'Sd Institute Of It & Management', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS09', 'Shivam Institute For Vocational Training', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS10', 'Sv Infotech', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS11', 'Shivam Institute For Vocational Training', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS12', 'Shivam Institute For Vocational Training ', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS13', 'Shivam Institute for Vocational Training', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS14', 'Shivam Institute for vocational training', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS15', 'Shiksha Sanchar Educational Trust ', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS16', 'Skill Institute Of Education', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS17', 'Shivam Institute For Vocational Training', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS18', 'Social Management Association , Education Society', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS19', 'Shivam Institute For Vocational Training ', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPSO3', 'Sun Rise Institute', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPSO4', 'SVM computer center', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPU01', 'Universal Educational Institute', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPV01', 'Valu of Wisdom', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPV03', 'Value of Wisdom It Center ', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPW01', 'Wisdom Institute Of Technology ', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOB01', 'Brain Square Technologies', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOF01', 'Friends Computer', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOF02', 'FRIENDS COMPUTER', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOG03', 'Gn Infotech', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOH01', 'Him Computer Center', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOH03', 'Him Productive Institute of Education', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOHO1', 'Him Computer Center  ', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOHO3', 'Him Productive Institute of Education', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOS06', 'Sarav Shiksha Education Society', '', '', '', NULL, 0, '', '', NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03');

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
