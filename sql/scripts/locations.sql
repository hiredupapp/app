call utlCreateBackupTable('locations', '_locations');

DROP TABLE IF EXISTS locations;

CREATE TABLE `locations` (
  `LocationId` int(11) NOT NULL AUTO_INCREMENT,
  `ZipCode` varchar(10) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Latitude` decimal(10,8) DEFAULT NULL,
  `Longitude` decimal(11,8) DEFAULT NULL,
  PRIMARY KEY (`LocationId`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*
INSERT INTO locations
SELECT
  ZipCode
  ,City
  ,State
  ,Latitude
  ,Longitude
FROM
  _locations;
*/
INSERT INTO locations (ZipCode, City, State, Latitude, Longitude)
VALUES (0, 'Unknown', 'Unknown', 0, 0);
/*
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/cityzip.csv' 
INTO TABLE locations
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ZipCode, City, State, Latitude, Longitude);

-- Any ZipCodes with 0 prefixes may have been truncated
UPDATE locations
  SET ZipCode = RIGHT(CONCAT('00000', ZipCode), 5)
where
  LENGTH(ZipCode) < 5;
  */
  
