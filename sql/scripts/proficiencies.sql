call utlCreateBackupTable('proficiencies', '_proficiencies');

/*
General proficiencies that will likely evolve to be defined at the skills level
e.g. what does it mean to be an Expert at MySQL
provide descriptions that educate members to think outside of their bubble and rate themselves relative to all others in the industry
and not just those they are currently surrounded by
*/
DROP TABLE IF EXISTS proficiencies;

CREATE TABLE `proficiencies` (
  `ProficiencyId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `Archived` bit NOT NULL DEFAULT 0,
  PRIMARY KEY (`ProficiencyId`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8
  COMMENT = 'Proficiency ratings';
/*
INSERT INTO proficiencies
SELECT
  ProficiencyId
  ,Name
  ,Archived
FROM
  _proficiencies;

*/

-- https://hr.od.nih.gov/workingatnih/competencies/proficiencyscale.htm
INSERT INTO proficiencies (Name, Description) VALUES ('Fundamental Awareness', 'You have a common knowledge or an understanding of basic techniques and concepts.');
INSERT INTO proficiencies (Name, Description) VALUES ('Novice', 'You have the level of experience gained in a classroom and/or experimental scenarios or as a trainee on-the-job. You are expected to need help when performing this skill.');
INSERT INTO proficiencies (Name, Description) VALUES ('Intermediate', 'You are able to successfully complete tasks in this competency as requested. Help from an expert may be required from time to time, but you can usually perform the skill independently.');
INSERT INTO proficiencies (Name, Description) VALUES ('Advanced', 'You can perform the actions associated with this skill without assistance. You are certainly recognized within your immediate organization as "a person to ask" when difficult questions arise regarding this skill.');
INSERT INTO proficiencies (Name, Description) VALUES ('Expert', 'You are known as an expert in this area. You can provide guidance, troubleshoot and answer questions related to this area of expertise and the field where the skill is used.');


  
 select * from proficiencies;
  