################################################################################
# Author:  Jason Richardson
# Date:    06/10/2016
# Purpose: Return all skills for a resource
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS getResourceSkills $$
CREATE  PROCEDURE getResourceSkills(
   IN resId INT)
BEGIN

	SELECT 
      r.ResourceId                              AS rId
      ,sc.skillId                               AS skillId
      ,sc.skillName                             AS skillName
      ,sc.skillCatId                            AS skillCatId
      ,sc.skillCatName                          AS skillCatName
      ,p.ProficiencyId                          AS profId
      ,p.Name                                   AS profName
      ,p.Description                            AS profDescription
      ,d.DurationId                             AS durId
      ,d.Duration                               AS dur
    FROM 
      resourceSkillsProficiencies rsp           INNER JOIN
      resources r 
        on r.ResourceId = rsp.ResourceId        INNER JOIN
      vwSkillCategories sc
        on sc.SkillId = rsp.SkillId             INNER JOIN
      proficiencies p 
        on p.ProficiencyId = rsp.ProficiencyId  INNER JOIN
      durationRanges d
        on d.DurationId = rsp.DurationId         
	WHERE
      rsp.resourceId = resId;
      
END $$

DELIMITER ; ;

/*
call getResourceSkills(80);

describe resourceSkillsProficiencies;
select * from durationRanges;

select * From resourceSkillsProficiencies;

select * from resources;

*/

