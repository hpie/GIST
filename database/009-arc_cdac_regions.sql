DROP TABLE IF EXISTS `arc_cdac_regions`;
 
--
-- Table structure for table `arc_cdac_regions`
--
CREATE TABLE IF NOT EXISTS `arc_cdac_regions` (
  `row_id` bigint(20) NOT NULL,
  `entity_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `region_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;


--
-- Indexes for table `arc_cdac_regions`
--
ALTER TABLE `arc_cdac_regions`
  ADD PRIMARY KEY (`row_id`);


--
-- AUTO_INCREMENT for table `arc_cdac_regions`
--
ALTER TABLE `arc_cdac_regions`
  MODIFY `row_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=0;