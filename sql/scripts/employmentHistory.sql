call utlCreateBackupTable('employmentHistory', '_employmentHistory');

/*
We do not care so much about Name / Description - 255 max to force conciseness
Duration and skill much more important
*/

DROP TABLE IF EXISTS employmentHistory;

CREATE TABLE `employmentHistory` (
  `EmploymentId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Summary` varchar(255) NULL,
  `Start` date NOT NULL,
  `Finish` date NOT NULL,
  `LocationId` int(11) NOT NULL,
--  `RoleId` int(11) NOT NULL,
--  `SalarayId` int(11) NOT NULL,
  `Current` bit NOT NULL DEFAULT 0,
  PRIMARY KEY (`EmploymentId`),
  FOREIGN KEY (LocationId) REFERENCES locations(LocationId)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8
  COMMENT = 'List of previous positions a member has held';
/*
INSERT INTO employmentHistory
SELECT
  EmploymentId
  ,Name
  ,Summary
  ,Start
  ,Finish
  ,LocationId
  ,Current
FROM
  _employmentHistory;
  */
  
--  select * from employmentHistory;
  