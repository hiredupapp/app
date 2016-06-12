call utlCreateBackupTable('skillsCategories', '_skillsCategories');

DROP TABLE IF EXISTS skillsCategories;

/*
Values will start general and potentially expand into sub-categories / role-based
e.g. IT-DBA, IT-Web
*/

CREATE TABLE `skillsCategories` (
  `SkillCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Archived` bit NOT NULL DEFAULT 0,
  PRIMARY KEY (`SkillCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8
  COMMENT = 'Skill categories; e.g. IT, HR, Finance, ...';
/*
INSERT INTO skillsCategories
SELECT
  SkillCategoryId
  ,Name
  ,Archived
FROM
  _skillsCategories;
*/

INSERT INTO skillsCategories (Name) VALUES ('IT');
INSERT INTO skillsCategories (Name) VALUES ('Soft Skills');


-- select * From skillsCategories;