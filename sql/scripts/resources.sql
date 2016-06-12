call utlCreateBackupTable('resources', '_resources');

DROP TABLE IF EXISTS resources;

CREATE TABLE `resources` (
  `ResourceId` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `UserName` varchar(225) DEFAULT NULL,
  `Password` char(87) DEFAULT NULL,
  `LocationId` int(11) NOT NULL DEFAULT 0,
  `LastLogin` datetime DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  PRIMARY KEY (`ResourceId`),
  FOREIGN KEY (LocationId) REFERENCES locations(LocationId),
  UNIQUE KEY `UQ_EmailAddress` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*
INSERT INTO resources
SELECT
  ResourceId
  ,LastName
  ,FirstName
  ,UserName
  ,Password
  ,LocationId
  ,LastLogin
FROM
  _resources;
  
  */
select * from resources;