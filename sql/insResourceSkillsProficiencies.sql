################################################################################
# Author:  Jason Richardson
# Date:    05/29/2016
# Purpose: Insert new resource skill-proficiency new ResourceId
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS insResourceSkillsProficiencies $$
CREATE  PROCEDURE insResourceSkillsProficiencies(
   IN resId INT
   ,IN skId INT
   ,IN profId INT
   ,IN durId INT)
BEGIN

	INSERT INTO resourceSkillsProficiencies (ResourceId, SkillId, ProficiencyId, DurationId)
		SELECT
		  resId
		  ,skId 
		  ,profId
          ,durId;
      
END $$

DELIMITER ;

/*
call insresourceSkillsProficiencies(77, 75, 75, 75);

select * from resources;
select * From durationRanges;
select * from ResourceSkillsProficiencies;
describe ResourceSkillsProficiencies;

*/
