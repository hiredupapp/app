call utlCreateBackupTable('resourceSkillsProficiencies', '_resourceSkillsProficiencies');

/*
SkillsCategory may need to be broken out into an associative entity if skills grow into "soft" skills and begin crossing 
categories, but let's start here.
*/

DROP TABLE IF EXISTS resourceSkillsProficiencies;

CREATE TABLE `resourceSkillsProficiencies` (
  `ResourceId` int(11) NOT NULL,
  `SkillId` int(11) NOT NULL,
  `ProficiencyId` int(11) NOT NULL,
  `DurationId` INT(11) NOT NULL,
  PRIMARY KEY (`ResourceId`, `SkillId`, `ProficiencyId`),
  FOREIGN KEY (ResourceId) REFERENCES resources(ResourceId),
  FOREIGN KEY (SkillId) REFERENCES skills(SkillId),
  FOREIGN KEY (ProficiencyId) REFERENCES proficiencies(ProficiencyId),
  FOREIGN KEY (DurationId) REFERENCES durationRanges(DurationId)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8
  COMMENT = 'Resources with skill proficiencies';
/*
INSERT INTO resourceSkillsProficiencies
SELECT
  ResourceId
  ,SkillId
  ,ProficiencyId
  ,DurationId
FROM
  _resourceSkillsProficiencies;
*/

  
-- select * from resourceSkillsProficiencies;

  