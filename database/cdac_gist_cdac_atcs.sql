-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2017 at 05:00 PM
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

--
-- Table structure for table `cdac_atcs`
--

CREATE TABLE IF NOT EXISTS `cdac_atcs` (
  `atc_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `atc_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `atc_address_line1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `atc_address_line2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `atc_address_city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `atc_address_postcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `atc_arc_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `atc_contact_number` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `atc_contact_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `atc_type` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `atc_category` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_dt` timestamp NULL DEFAULT '2016-12-31 18:30:00',
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cdac_atcs`
--

INSERT INTO `cdac_atcs` (`atc_code`, `atc_name`, `atc_address_line1`, `atc_address_line2`, `atc_address_city`, `atc_address_postcode`, `atc_arc_code`, `atc_contact_number`, `atc_contact_email`, `atc_type`, `atc_category`, `status`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(' HPS02', 'Shree Education', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
(' HPS11', 'Shivam Institute For Vocational Training', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
(' HPU01', 'Universal Education Institute ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('Him-01', 'HPIE', 'SBI Building', 'Lakkar Bazzar', '395', '#10', 'ARC-1', '1122334455', 'test@gmail.com', 'B', 'B', 'A', NULL, '2017-05-29 13:41:42', NULL, '2017-05-30 04:24:55'),
('Him-02', 'HIMIT', '#10', 'Street 1', '395', '171001', 'ARC-1', '22222222', 'test@gmail.com', 'C', 'C', 'A', NULL, '2016-12-31 13:00:00', NULL, '2017-05-30 01:57:53'),
('HP508', 'SD INSTITUTE OF IT & MANAGEMENT ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPA01', 'Arena Info Solution', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPA02', 'Alma computing college', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'B', 'system', '2017-06-06 10:27:03', NULL, '2017-06-17 14:02:08'),
('HPA03', 'Angel Eye Educational Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPA04', 'Association For Social Research And Action', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPAO1', 'Arena Info Solutions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPAO4', 'Association For Social Research & Action', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPB01', 'Bharat Web Technology', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPB02', 'Bharat web Technology', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPB03', 'Bcs College Of Education & Information Technology ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPC01', 'Cal-C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPC02', 'Chooreshwar Education Trust', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPC03', 'Career Pride Education & Welfare  Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPD01', 'Dhaneshwari Institute Of It', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPD02', 'Dhaneshwari Infotech', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPD03', 'DICE Education Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPD04', 'DICE Education Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPD05', 'Dev Aastha Institute Of Education ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPE 01', 'Education Arena', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPE-01', 'Education Arena', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPE01', 'Education Arena', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPE02', 'Education Arena (Chowari)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPE03', 'Emblem Education', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPE04', 'Emblem Education', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPE05', 'EMBLEM EDUCATION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG01', 'Grace Education', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG02', 'Genious Computer Education & Training ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG03', 'Global Information & Technology Institute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG04', 'Gurukul Tech. Learn. Inst. Berthin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG05', 'Gurukul Technical Institute ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG06', 'Global Information & Technology Institute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPG07', 'Gurukul Technical Institute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPH01', 'Himachal Education Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPH02', 'Him Productive Center For Development of Education', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPH03', 'Him Webcom Technorite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPH04', 'Him Educational Training Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPH05', 'Him Gaurav Institute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPI01', 'Info tech Computer Center', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPI02', 'Institute Of Computer & Competative  Exam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPI03', 'Infotech computer center', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPI04', 'Infotech computer center', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPK01', 'Kalu Bhat Multi Purpose Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPM01', 'Mec Computer Education', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPM02', 'Mamta Computer Center', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPM03', 'Make My Skill', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPM04', 'Mamta Computer Centre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPM05', 'Mountain Institute Of Computer Education', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPN01', 'Net 4 Academy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPN02', 'Net 4 Academy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPN03', 'Nice Computer Center', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPO01', 'Oasis Institute Of Computer Education And Language', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPO02', 'Optech Vidya Computer Centre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPP02', 'Pride Institute Of Knowledge & Skill', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPR01', 'RDS Computer Center', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPR02', 'R.R.G.S.D. College', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPR03', 'Right Institute Of  Information Technolology', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS011', 'Shivam Institute For Vocational Training', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS02', 'Shree Education', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS03', 'Sun Rise Institute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS04', 'Svm Computer Centre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS05', 'saraswat computer education', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS06', 'S.R Institue ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS07', 'Shiksha Sanchar Educational Trust', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS08', 'Sd Institute Of It & Management', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS09', 'Shivam Institute For Vocational Training', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS10', 'Sv Infotech', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS11', 'Shivam Institute For Vocational Training', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS12', 'Shivam Institute For Vocational Training ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS13', 'Shivam Institute for Vocational Training', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS14', 'Shivam Institute for vocational training', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS15', 'Shiksha Sanchar Educational Trust ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS16', 'Skill Institute Of Education', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS17', 'Shivam Institute For Vocational Training', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS18', 'Social Management Association , Education Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPS19', 'Shivam Institute For Vocational Training ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPSO3', 'Sun Rise Institute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPSO4', 'SVM computer center', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPU01', 'Universal Educational Institute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPV01', 'Valu of Wisdom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPV03', 'Value of Wisdom It Center ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('HPW01', 'Wisdom Institute Of Technology ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOB01', 'Brain Square Technologies', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOF01', 'Friends Computer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOF02', 'FRIENDS COMPUTER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOG03', 'Gn Infotech', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOH01', 'Him Computer Center', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOH03', 'Him Productive Institute of Education', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOHO1', 'Him Computer Center  ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOHO3', 'Him Productive Institute of Education', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03'),
('NOS06', 'Sarav Shiksha Education Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'system', '2017-06-06 10:27:03', NULL, '2017-06-06 10:27:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_atcs`
--
ALTER TABLE `cdac_atcs`
  ADD PRIMARY KEY (`atc_code`),
  ADD UNIQUE KEY `atc_contact_number` (`atc_contact_number`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
