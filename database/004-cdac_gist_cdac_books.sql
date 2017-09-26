-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2017 at 05:01 PM
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
-- Table structure for table `cdac_books`
--

CREATE TABLE IF NOT EXISTS `cdac_books` (
  `book_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `book_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `book_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `book_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` date NOT NULL,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `modified_dt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cdac_books`
--

INSERT INTO `cdac_books` (`book_code`, `book_name`, `book_description`, `book_status`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('CB-1', 'Com Basic', 'Com Basic', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-10', 'Intro to E', 'Intro to E', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-11', 'ECOM', 'ECOM', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-12', 'VB. NET', 'VB. NET', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-13', 'C', 'C', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-14', 'C++', 'C++', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-15', 'BASIC JAVA', 'BASIC JAVA', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-16', 'ADV. JAVA', 'ADV. JAVA', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-17', 'ACCESS', 'ACCESS', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-18', 'DATA STRU. THRU C', 'DATA STRU. THRU C', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-19', 'LINUX', 'LINUX', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-2', 'COMP ORG', 'COMP ORG', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-20', 'UNIX', 'UNIX', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-21', 'ML', 'ML', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-22', 'S/W ENGG', 'S/W ENGG', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-23', 'SSAD', 'SSAD', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-24', 'NETWRKG CNPTS', 'NETWRKG CNPTS', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-25', 'Designing & Animation', 'Designing & Animation', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-26', 'Advanced Excel 2007', 'Advanced Excel 2007', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-27', 'XML', 'XML', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-28', 'SQL', 'SQL', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-29', '2D Animation (Intro to Flash)', '2D Animation (Intro to Flash)', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-3', 'MSO 2013', 'MSO 2013', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-30', '2D Animation (Swish Max,GIF)', '2D Animation (Swish Max,GIF)', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-31', 'Basics of Audio Editing', 'Basics of Audio Editing', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-32', 'Basics of Video Streaming and Editing', 'Basics of Video Streaming and Editing', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-33', 'Concepts of Graphics', 'Concepts of Graphics', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-34', 'Image Editing (Abode Indesign)', 'Image Editing (Abode Indesign)', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-35', 'Image Editing (Intro to Abode Photo)', 'Image Editing (Intro to Abode Photo)', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-36', 'Image Editing (Corel Draw)', 'Image Editing (Corel Draw)', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-37', '2D Animation (Toon Boon)', '2D Animation (Toon Boon)', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-38', '3D Animation (3D Max)', '3D Animation (3D Max)', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-39', '3D Animation (Poser Picture)', '3D Animation (Poser Picture)', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-4', 'BOO', 'BOO', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-40', 'Advanced Audio Editing', 'Advanced Audio Editing', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-41', 'Advanced Image Editing', 'Advanced Image Editing', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-42', 'Video Streaming & Editing', 'Video Streaming & Editing', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-43', 'Tally ERP 9', 'Tally ERP 9', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-5', 'PM', 'PM', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-6', 'Tally 9', 'Tally 9', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-7', 'ASP.net', 'ASP.net', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-8', 'OR  9i', 'OR  9i', 'A', '', '0000-00-00', '', '0000-00-00'),
('CB-9', 'Info Tech', 'Info Tech', 'A', '', '0000-00-00', '', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_books`
--
ALTER TABLE `cdac_books`
  ADD PRIMARY KEY (`book_code`),
  ADD UNIQUE KEY `book_name` (`book_name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
