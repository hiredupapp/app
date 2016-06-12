################################################################################
# Author:  Jason Richardson
# Date:    05/29/2016
# Purpose: Insert new resource skill-proficiency new ResourceId
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS delResourceSkillsProficiencies $$
CREATE  PROCEDURE delResourceSkillsProficiencies (
   IN resId INT
   ,IN skId INT
   ,IN profId INT)
BEGIN

	DELETE
    FROM
      resourceSkillsProficiencies 
    WHERE
      ResourceId = resId
      AND SkillId = skId
      AND ProficiencyId = profId;
          
END $$

DELIMITER ;

/*
call delResourceSkillsProficiencies(77, 75, 75);

select * from resources;
select * from ResourceSkillsProficiencies;
describe ResourceSkillsProficiencies;

*/
