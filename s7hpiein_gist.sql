-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2017 at 02:10 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `s7hpiein_gist`
--

-- --------------------------------------------------------

--
-- Table structure for table `arc_atc`
--

CREATE TABLE `arc_atc` (
  `atc_id` varchar(10) NOT NULL,
  `atc_name` varchar(40) NOT NULL,
  `atc_contact_point_name` varchar(40) NOT NULL,
  `atc_contact_point_phone` int(11) NOT NULL,
  `atc_address` varchar(100) NOT NULL,
  `atc_city` varchar(20) NOT NULL,
  `atc_district` varchar(20) NOT NULL,
  `atc_state` varchar(20) NOT NULL,
  `atc_pincode` int(11) NOT NULL,
  `atc_contact_phone` int(11) NOT NULL,
  `atc_video_link` varchar(50) NOT NULL,
  `atc_total_computers` int(11) NOT NULL,
  `atc_total_area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `arc_interview_schedule`
--

CREATE TABLE `arc_interview_schedule` (
  `interview_id` varchar(10) NOT NULL,
  `interview_by` varchar(50) NOT NULL,
  `interview_date` date NOT NULL,
  `inetrview_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ARC interview details';

-- --------------------------------------------------------

--
-- Table structure for table `atc_batch`
--

CREATE TABLE `atc_batch` (
  `batch_id` varchar(10) NOT NULL,
  `batch_period` int(11) NOT NULL,
  `batch_total_students` int(11) NOT NULL,
  `batch_status` varchar(20) NOT NULL,
  `batch_course_id` varchar(10) NOT NULL,
  `batch_start_date` date NOT NULL,
  `batch_end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `atc_faculty`
--

CREATE TABLE `atc_faculty` (
  `faculty_id` varchar(10) NOT NULL,
  `faculty_firstname` varchar(40) NOT NULL,
  `faculty_lastname` varchar(40) NOT NULL,
  `faculty_contact_ph` int(11) NOT NULL,
  `faculty_email_id` varchar(40) NOT NULL,
  `faculty_address` varchar(100) NOT NULL,
  `faculty_city` varchar(20) NOT NULL,
  `faculty_district` varchar(20) NOT NULL,
  `faculty_state` varchar(20) NOT NULL,
  `faculty_pincode` int(11) NOT NULL,
  `faculty_joining_date` date NOT NULL,
  `faculty_dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ATC faculty details';

-- --------------------------------------------------------

--
-- Table structure for table `atc_students`
--

CREATE TABLE `atc_students` (
  `student_id` varchar(10) NOT NULL,
  `student_firstname` varchar(40) NOT NULL,
  `student_lastname` varchar(40) NOT NULL,
  `student_father_or_husband_name` varchar(40) NOT NULL,
  `student_permanent_address` varchar(100) NOT NULL,
  `student_permanent_city` varchar(20) NOT NULL,
  `student_permanent_district` varchar(20) NOT NULL,
  `student_permanent_state` varchar(20) NOT NULL,
  `student_permanent_pincode` int(11) NOT NULL,
  `student_correspondance_address` varchar(100) NOT NULL,
  `student_correspondance_city` varchar(20) NOT NULL,
  `student_correspondance_district` varchar(20) NOT NULL,
  `student_correspondance_state` varchar(20) NOT NULL,
  `student_correspondance_pincode` int(11) NOT NULL,
  `student_center_id` int(11) NOT NULL,
  `student_dob` date NOT NULL,
  `student_admission_date` date NOT NULL,
  `student_gender` varchar(10) NOT NULL,
  `student_marital_status` varchar(10) NOT NULL,
  `student_email_id` varchar(50) NOT NULL,
  `student_mobile_no` int(11) NOT NULL,
  `student_landline_no` int(11) NOT NULL,
  `student_disability` varchar(10) NOT NULL,
  `student_bank_account_no` int(20) NOT NULL,
  `student_bank_name` varchar(20) NOT NULL,
  `student_bank_ifsc_code` varchar(10) NOT NULL,
  `student_social_status` varchar(10) NOT NULL,
  `student_annual_income` int(11) NOT NULL,
  `student_other_income` int(11) NOT NULL,
  `student_highest_qualification` varchar(10) NOT NULL,
  `student_details_created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `student_details_created_by` varchar(10) NOT NULL,
  `student_detaild_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `student_details_modified_by` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Student details';

-- --------------------------------------------------------

--
-- Table structure for table `cdac_arc`
--

CREATE TABLE `cdac_arc` (
  `arc_id` varchar(10) NOT NULL,
  `arc_name` varchar(10) NOT NULL,
  `arc_address` varchar(10) NOT NULL,
  `arc_city` varchar(10) NOT NULL,
  `arc_district` varchar(10) NOT NULL,
  `arc_state` varchar(10) NOT NULL,
  `arc_pincode` int(6) NOT NULL,
  `arc_telephone_no` int(10) NOT NULL,
  `arc_mobile_no` int(10) NOT NULL,
  `arc_created_date` date NOT NULL,
  `arc_created_by` varchar(10) NOT NULL,
  `arc_modified_date` date NOT NULL,
  `arc_modified_by` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdac_books`
--

CREATE TABLE `cdac_books` (
  `book_id` varchar(10) NOT NULL,
  `book_name` varchar(10) NOT NULL,
  `book_description` varchar(10) NOT NULL,
  `book_created_by` varchar(10) NOT NULL,
  `book_modified_by` varchar(10) NOT NULL,
  `book_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `book_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Book details';

-- --------------------------------------------------------

--
-- Table structure for table `cdac_cmo_ca_user`
--

CREATE TABLE `cdac_cmo_ca_user` (
  `cdac_user_id` varchar(10) NOT NULL,
  `cdac_user_firstname` varchar(40) NOT NULL,
  `cdac_user_lastname` varchar(40) NOT NULL,
  `cdac_user_address` varchar(100) NOT NULL,
  `cdac_user_city` varchar(20) NOT NULL,
  `cdac_user_state` varchar(20) NOT NULL,
  `cdac_user_pincode` int(11) NOT NULL,
  `cdac_user_mobile_no` int(11) NOT NULL,
  `cdac_user_status` varchar(10) NOT NULL,
  `cdac_user_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdac_courses`
--

CREATE TABLE `cdac_courses` (
  `course_id` varchar(10) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `course_duration` int(11) NOT NULL,
  `course_has_online_exam` tinyint(1) NOT NULL,
  `course_created_date` date NOT NULL,
  `course_created_by` varchar(10) NOT NULL,
  `course_modified_date` date NOT NULL,
  `course_modified_by` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='CDAC Courses offered';

-- --------------------------------------------------------

--
-- Table structure for table `cdac_course_subjects`
--

CREATE TABLE `cdac_course_subjects` (
  `cs_course_id` varchar(10) NOT NULL,
  `cs_subject_id` varchar(10) NOT NULL,
  `cs_start_date` date NOT NULL,
  `cs_end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdac_exams`
--

CREATE TABLE `cdac_exams` (
  `exam_id` varchar(10) NOT NULL,
  `exam_name` varchar(10) NOT NULL,
  `exam_duration` int(11) NOT NULL,
  `exam_type` varchar(10) NOT NULL,
  `exam_start_date` date NOT NULL,
  `exam_created_by` varchar(10) NOT NULL,
  `exam_modified_by` varchar(10) NOT NULL,
  `exam_created_date` date NOT NULL,
  `exam_modified_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Exam details';

-- --------------------------------------------------------

--
-- Table structure for table `cdac_fees`
--

CREATE TABLE `cdac_fees` (
  `fee_course_id` varchar(10) NOT NULL,
  `fee_student_type` varchar(10) NOT NULL,
  `fee_amount` int(11) NOT NULL,
  `fee_type` varchar(10) NOT NULL,
  `fee_status` varchar(10) NOT NULL,
  `fee_start_date` date NOT NULL,
  `fee_end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Fee details';

-- --------------------------------------------------------

--
-- Table structure for table `cdac_projects`
--

CREATE TABLE `cdac_projects` (
  `project_id` varchar(10) NOT NULL,
  `project_name` varchar(10) NOT NULL,
  `project_description` varchar(10) NOT NULL,
  `project_owner` varchar(10) NOT NULL,
  `project_assignee` varchar(10) NOT NULL,
  `project_commence_date` date NOT NULL,
  `project_duration` int(11) NOT NULL,
  `project_status` varchar(10) NOT NULL,
  `project_end_date` date NOT NULL,
  `project_cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdac_states`
--

CREATE TABLE `cdac_states` (
  `state_id` varchar(10) NOT NULL,
  `state_name` varchar(10) NOT NULL,
  `state_grade` varchar(10) NOT NULL,
  `state_status` varchar(10) NOT NULL,
  `state_details` varchar(10) NOT NULL,
  `state_created_by` varchar(10) NOT NULL,
  `state_modified_by` varchar(10) NOT NULL,
  `state_created_date` date NOT NULL,
  `state_modified_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdac_subjects`
--

CREATE TABLE `cdac_subjects` (
  `subject_id` varchar(10) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `subject_title` varchar(50) NOT NULL,
  `subject_duration` int(11) NOT NULL,
  `subject_created_by` varchar(10) NOT NULL,
  `subject_created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `subject_modified_by` varchar(10) NOT NULL,
  `subject_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Subject details';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arc_atc`
--
ALTER TABLE `arc_atc`
  ADD PRIMARY KEY (`atc_id`);

--
-- Indexes for table `arc_interview_schedule`
--
ALTER TABLE `arc_interview_schedule`
  ADD PRIMARY KEY (`interview_id`);

--
-- Indexes for table `atc_batch`
--
ALTER TABLE `atc_batch`
  ADD PRIMARY KEY (`batch_id`);

--
-- Indexes for table `atc_faculty`
--
ALTER TABLE `atc_faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `atc_students`
--
ALTER TABLE `atc_students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `cdac_arc`
--
ALTER TABLE `cdac_arc`
  ADD PRIMARY KEY (`arc_id`);

--
-- Indexes for table `cdac_books`
--
ALTER TABLE `cdac_books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `cdac_cmo_ca_user`
--
ALTER TABLE `cdac_cmo_ca_user`
  ADD PRIMARY KEY (`cdac_user_id`);

--
-- Indexes for table `cdac_courses`
--
ALTER TABLE `cdac_courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `cdac_course_subjects`
--
ALTER TABLE `cdac_course_subjects`
  ADD PRIMARY KEY (`cs_course_id`,`cs_subject_id`);

--
-- Indexes for table `cdac_fees`
--
ALTER TABLE `cdac_fees`
  ADD PRIMARY KEY (`fee_course_id`);

--
-- Indexes for table `cdac_projects`
--
ALTER TABLE `cdac_projects`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `cdac_subjects`
--
ALTER TABLE `cdac_subjects`
  ADD PRIMARY KEY (`subject_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
