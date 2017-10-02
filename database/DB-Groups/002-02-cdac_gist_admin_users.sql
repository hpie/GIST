--
-- Drop table if exists `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;

--
-- Table structure for table `admin_users`
--

CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(11) unsigned NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `entity_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'ATC',
  `entity_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `entity_type`, `entity_code`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES
(1, '127.0.0.1', 'webmaster', '$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '65fF2L3gh8w53I21JrtJcO', 1451900190, 1505744378, 1, 'Webmaster', ''),
(2, '127.0.0.1', 'cdac', '$2y$08$FZYs5uXbhgUytuZtkwRgsOBYun4iW6KstBoedddckXGf1JC3epnSS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1451900228, 1506523290, 1, 'CDAC', 'USER'),
(3, '127.0.0.1', 'arc', '$2y$08$34ox04Q1N5NMqhbSkcoTcuOwTV.2JIem5IqD4vJLU5Vlq4.u/V1T2', NULL, NULL, 'ARC', 'ARC-1', NULL, NULL, NULL, 'PEGaw4yNA2NgXu8zp2A3xO', 1451900430, 1506858843, 1, 'ARC', 'USER'),
(4, '127.0.0.1', 'atc', '$2y$08$2A1izeZpfugR6SqNs9ftQ.r47nN0iGvUojPBOeonmNVUteoQQaNLW', NULL, 'atc@cdac.com', 'ATC', 'HPO01', NULL, NULL, NULL, 'RfxY1uvRPOPLqBERqwBWOO', 1451900439, 1506858855, 1, 'ATC', 'USER'),
(5, '::1', 'hpu01', '$2y$08$QQUmoeujK1Hb3PJB1kMKGOR/IPc1Dc9t2FO0tLqOCL4oVlhFnMUma', NULL, NULL, 'ATC', 'HPU01', NULL, NULL, NULL, NULL, 1503952033, 1503953626, 1, 'ATC-HPU01', 'Center'),
(6, '::1', 'hpc01', '$2y$08$d.KOiCipryJD1CF9r88rC.oEEvY/dcfrglSw9EOpcGsaqiMcjBSnK', NULL, NULL, 'ATC', 'HPC01', NULL, NULL, NULL, 'PZ1BjJD9aPLFrQf4RaRv/u', 1503952096, 1503998279, 1, 'ATC-HPC01', 'Center'),
(7, '::1', 'hpv01', '$2y$08$.JTo052fy1rY/hWb.QZGIOCBHDqZpaH8gk8cwtASy6EU8mIFDk3Pm', NULL, NULL, 'ATC', 'HPV01', NULL, NULL, NULL, NULL, 1503952269, NULL, 1, 'ATC-HPV01', 'Center'),
(8, '::1', 'arc1', '$2y$08$ONrRsdTDhnVQ0h/42/EpUO/AbSjouxnfFwS295lHJFnELfLyt.Uj.', NULL, NULL, 'ARC', 'ARC-1', NULL, NULL, NULL, NULL, 1503952652, NULL, 1, 'ARCNorth', 'Center'),
(9, '::1', 'arc2', '$2y$08$/YnIhcnSSvlWNmcT2o2zk.2jSb1BT7g2aZGpDxcMHhPn/ObeNqiLm', NULL, NULL, 'ARC', 'ARC-2', NULL, NULL, NULL, NULL, 1503952689, NULL, 1, 'ARCSouth', 'Center'),
(10, '::1', 'guj1', '$2y$08$skGHo/QeayIi7us/U0VXbuWcjsEkd6MunTaCwYEP7vmqp52hNTdkq', NULL, NULL, 'ARC', 'GUJ-1', NULL, NULL, NULL, NULL, 1503952724, 1503952859, 1, 'ARCGujrat', 'Center');


--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);
