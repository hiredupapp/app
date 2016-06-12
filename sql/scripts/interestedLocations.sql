call utlCreateBackupTable('interestedLocations', '_interestedLocations');

DROP TABLE IF EXISTS interestedLocations;

CREATE TABLE `interestedLocations` (
  `ResourceId` int(11) NOT NULL,
  `LocationId` int(11) NOT NULL,
  PRIMARY KEY (`ResourceId`, `LocationId`),
  FOREIGN KEY (ResourceId) REFERENCES resources(ResourceId),
  FOREIGN KEY (LocationId) REFERENCES locations(LocationId)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*
INSERT INTO interestedLocations
SELECT
  ResourceId
  ,LocationId
FROM
  _interestedLocations;
*/
   
select * from interestedLocations;