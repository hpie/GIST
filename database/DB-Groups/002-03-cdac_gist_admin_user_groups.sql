--
-- Drop table if exists `admin_users_groups`
--

DROP TABLE IF EXISTS `admin_users_groups`;

--
-- Table structure for table `admin_users_groups`
--

CREATE TABLE IF NOT EXISTS `admin_users_groups` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_users_groups`
--

INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);
