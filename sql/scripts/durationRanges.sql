call utlCreateBackupTable('durationRanges', '_durationRanges');

/*
Duration ranges to be used in matching algorithms
Calculation field represents the score assigned to each duration for formula usage
*/

DROP TABLE IF EXISTS durationRanges;

CREATE TABLE `durationRanges` (
  `DurationId` int(11) NOT NULL AUTO_INCREMENT,
  `Duration` varchar(45) NOT NULL,
  `Calculation` decimal (5,2) NOT NULL,
  `ItemOrder` int NOT NULL,
  `Archived` bit NOT NULL DEFAULT 0,
  PRIMARY KEY (DurationId)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8
  COMMENT = 'Duration ranges to simplify input and job matching formula';
/*
INSERT INTO durationRanges
SELECT
  DurationId
  ,Duration
  ,Calculation
  ,ItemOrder
  ,Archived
FROM
  _durationRanges;
  */
  
 
INSERT INTO durationRanges (Duration, Calculation, ItemOrder) VALUES ('< 6 months', 1, 1);
INSERT INTO durationRanges (Duration, Calculation, ItemOrder) VALUES ('6 - 12 months', 2, 2);
INSERT INTO durationRanges (Duration, Calculation, ItemOrder) VALUES ('1 - 2 years', 4, 3);
INSERT INTO durationRanges (Duration, Calculation, ItemOrder) VALUES ('2 - 5 years', 8, 4);
INSERT INTO durationRanges (Duration, Calculation, ItemOrder) VALUES ('5 - 10 years', 16, 5);
INSERT INTO durationRanges (Duration, Calculation, ItemOrder) VALUES ('> 10 years', 32, 6);

select * from durationRanges;