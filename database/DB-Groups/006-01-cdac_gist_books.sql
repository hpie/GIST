-- --------------------------------------------------------

DROP TABLE IF EXISTS `cdac_books` ;

--
-- Table structure for table `cdac_books`
--

CREATE TABLE IF NOT EXISTS `cdac_books` (
  `book_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `book_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `book_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cdac_books`
--

INSERT INTO `cdac_books` (`book_code`, `book_name`, `book_description`, `status`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
('CB-1', 'Com Basic', 'Com Basic', 'A', '', '2016-01-31', '', '2016-01-31'),
('CB-10', 'Intro to E', 'Intro to E', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-11', 'ECOM', 'ECOM', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-12', 'VB. NET', 'VB. NET', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-13', 'C', 'C', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-14', 'C++', 'C++', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-15', 'BASIC JAVA', 'BASIC JAVA', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-16', 'ADV. JAVA', 'ADV. JAVA', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-17', 'ACCESS', 'ACCESS', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-18', 'DATA STRU. THRU C', 'DATA STRU. THRU C', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-19', 'LINUX', 'LINUX', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-2', 'COMP ORG', 'COMP ORG', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-20', 'UNIX', 'UNIX', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-21', 'ML', 'ML', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-22', 'S/W ENGG', 'S/W ENGG', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-23', 'SSAD', 'SSAD', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-24', 'NETWRKG CNPTS', 'NETWRKG CNPTS', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-25', 'Designing & Animation', 'Designing & Animation', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-26', 'Advanced Excel 2007', 'Advanced Excel 2007', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-27', 'XML', 'XML', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-28', 'SQL', 'SQL', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-29', '2D Animation (Intro to Flash)', '2D Animation (Intro to Flash)', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-3', 'MSO 2013', 'MSO 2013', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-30', '2D Animation (Swish Max,GIF)', '2D Animation (Swish Max,GIF)', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-31', 'Basics of Audio Editing', 'Basics of Audio Editing', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-32', 'Basics of Video Streaming and Editing', 'Basics of Video Streaming and Editing', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-33', 'Concepts of Graphics', 'Concepts of Graphics', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-34', 'Image Editing (Abode Indesign)', 'Image Editing (Abode Indesign)', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-35', 'Image Editing (Intro to Abode Photo)', 'Image Editing (Intro to Abode Photo)', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-36', 'Image Editing (Corel Draw)', 'Image Editing (Corel Draw)', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-37', '2D Animation (Toon Boon)', '2D Animation (Toon Boon)', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-38', '3D Animation (3D Max)', '3D Animation (3D Max)', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-39', '3D Animation (Poser Picture)', '3D Animation (Poser Picture)', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-4', 'BOO', 'BOO', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-40', 'Advanced Audio Editing', 'Advanced Audio Editing', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-41', 'Advanced Image Editing', 'Advanced Image Editing', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-42', 'Video Streaming & Editing', 'Video Streaming & Editing', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-43', 'Tally ERP 9', 'Tally ERP 9', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-5', 'PM', 'PM', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-6', 'Tally 9', 'Tally 9', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-7', 'ASP.net', 'ASP.net', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-8', 'OR  9i', 'OR  9i', 'A', '',  '2016-01-31', '',  '2016-01-31'),
('CB-9', 'Info Tech', 'Info Tech', 'A', '',  '2016-01-31', '',  '2016-01-31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdac_books`
--
ALTER TABLE `cdac_books`
  ADD PRIMARY KEY (`book_code`),
  ADD UNIQUE KEY `book_name` (`book_name`);
