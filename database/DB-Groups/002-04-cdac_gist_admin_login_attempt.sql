--
-- Drop table if exists `admin_login_attempts`
--

DROP TABLE IF EXISTS `admin_login_attempts`;

--
-- Table structure for table `admin_login_attempts`
--

CREATE TABLE IF NOT EXISTS `admin_login_attempts` (
  `id` int(11) unsigned NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Indexes for table `admin_login_attempts`
--
ALTER TABLE `admin_login_attempts`
  ADD PRIMARY KEY (`id`);
