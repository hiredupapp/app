call utlCreateBackupTable('skills', '_skills');

/*
SkillsCategory may need to be broken out into an associative entity if skills grow into "soft" skills and begin crossing 
categories, but let's start here.
*/

DROP TABLE IF EXISTS skills;

CREATE TABLE `skills` (
  `SkillId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `SkillCategoryId` int(11) NOT NULL,
  `Archived` bit NOT NULL DEFAULT 0,
  PRIMARY KEY (`SkillId`),
  FOREIGN KEY (SkillCategoryId) REFERENCES skillsCategories(SkillCategoryId)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8
  COMMENT = 'Categorized list of skills';
/*
INSERT INTO skills
SELECT
  SkillId
  ,Name
  ,Archived
FROM
  _skills;
*/

  
INSERT INTO skills (Name, SkillCategoryId)
SELECT
  'Python'
  ,(SELECT SkillCategoryId FROM skillsCategories WHERE Name = 'IT');

INSERT INTO skills (Name, SkillCategoryId)
SELECT
  'MySQL'
  ,(SELECT SkillCategoryId FROM skillsCategories WHERE Name = 'IT');

INSERT INTO skills (Name, SkillCategoryId)
SELECT
  'T-SQL'
  ,(SELECT SkillCategoryId FROM skillsCategories WHERE Name = 'IT');
  
INSERT INTO skills (Name, SkillCategoryId)
SELECT
  'PL-SQL'
  ,(SELECT SkillCategoryId FROM skillsCategories WHERE Name = 'IT');

INSERT INTO skills (Name, SkillCategoryId)
SELECT
  'Organization'
  ,(SELECT SkillCategoryId FROM skillsCategories WHERE Name = 'Soft Skills');
  
INSERT INTO skills (Name, SkillCategoryId)
SELECT
  'Verbal Communication'
  ,(SELECT SkillCategoryId FROM skillsCategories WHERE Name = 'Soft Skills');
  
--  select * from skills;
  