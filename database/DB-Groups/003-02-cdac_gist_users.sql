-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2017 at 06:11 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cdac_gist`
--

-- --------------------------------------------------------

drop table if exists  `users`;

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `about` text
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `about`) VALUES
(1, '127.0.0.1', 'member', '$2y$08$imUhMPvlnKrRoEUq6GaUru66dEGWvfEVDJXWmbWfaXz6KowdgHcQi', NULL, 'member@member.com', NULL, NULL, NULL, 'ON04cZo8iJTiM3VJnGCJiO', 1451903855, 1503649181, 1, 'Member', 'One', NULL, NULL, NULL),
(2, '::1', 'test@gmail.com', '$2y$08$pBjF0ejO6uL.NWxbQ1hSa.hXxJVoMjjvJrcI3Kplu2zTBRt1/0aSq', NULL, 'test@gmail.com', NULL, NULL, NULL, NULL, 1495919240, 1496168015, 1, 'Test', 'User', NULL, NULL, NULL),
(3, '::1', 'shwetashanks@gmail.com', '$2y$08$VxZ27g35fpZ/tdgh5hQH/.POiokCTAdt7PL5fSuVzhLI0aILlUV1O', NULL, 'shwetashanks@gmail.com', NULL, NULL, NULL, NULL, 1495973025, 1495973109, 1, 'Shweta', 'S', NULL, NULL, NULL),
(4, '::1', 'cdacm', '$2y$08$dVjFgqMei7xQubrg81fH1Onyz7zAxJFJvrle3hhQr6vMDkj4i.Poy', NULL, 'cdacm@cdac.in', NULL, NULL, NULL, NULL, 1500808643, NULL, 1, 'CDAC', 'M', NULL, NULL, NULL),
(5, '::1', 'atcm', '$2y$08$82m53lCFL/XIdgNxv2wwueMcie5r/NxfmquEv/64y9C9l3HzT.05a', NULL, 'atcm@cdac.in', NULL, NULL, NULL, NULL, 1500808690, 1506432871, 1, 'ATC', 'M', NULL, NULL, NULL),
(6, '::1', 'arcm', '$2y$08$nIXAOwRJNMGTtgZlkHSbXuTwYX4SR.OhfP1WxD4k19VfBG4QCsHZO', NULL, 'arcm@cdac.in', NULL, NULL, NULL, NULL, 1500808738, NULL, 1, 'ARC', 'M', NULL, NULL, NULL),
(7, '::1', 'atct', '$2y$08$9L3wqX7Tm7I.C3aDe7nNeOt8ZP9VJLdwU/L1PRNKr5tKuE8S6TJFi', NULL, 'atct@cdac.in', NULL, NULL, NULL, NULL, 1500808841, NULL, 1, 'ATC', 'T', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;