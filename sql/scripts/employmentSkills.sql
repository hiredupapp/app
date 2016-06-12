call utlCreateBackupTable('employmentSkills', '_employmentSkills');

/*
Capture which skills were used on which jobs and how long they were used
*/

DROP TABLE IF EXISTS employmentSkills;

CREATE TABLE `employmentSkills` (
  `ResourceId` int(11) NOT NULL,
  `EmploymentId` int(11) NOT NULL,
  `SkillId` int(11) NOT NULL,
  `DurationId` int(11) NOT NULL,
  PRIMARY KEY (ResourceId, EmploymentId, SkillId),
  FOREIGN KEY (ResourceId) REFERENCES resources(ResourceId),
  FOREIGN KEY (EmploymentId) REFERENCES employmentHistory(EmploymentId),
  FOREIGN KEY (SkillId) REFERENCES skills(SkillId),  
  FOREIGN KEY (DurationId) REFERENCES durationRanges(DurationId)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8
  COMMENT = 'Skills utilized during current and past employment';
/*
INSERT INTO employmentSkills
SELECT
  ResourceId
  ,EmploymentId
  ,SkillId
  ,DurationId
FROM
  _employmentSkills;
  */
  
select * from employmentSkills;

  
  
  