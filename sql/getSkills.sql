################################################################################
# Author:  Jason Richardson
# Date:    05/28/2016
# Purpose: Return all or a filtered collection of skills
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS getSkills $$
CREATE  PROCEDURE getSkills(
   IN skId INT
   ,IN skill VARCHAR(255)
   ,IN skillCat VARCHAR(255))
BEGIN

	IF skId = '0' THEN
		set skId = NULL;
    END IF;
    IF skill = '0' THEN
		set skill = NULL;
	END IF;
    IF skillCat = '0' THEN
		set skillCat = NULL;
	END IF;
        
	SELECT 
      sc.skillId                 AS skillId
      ,sc.skillName              AS skillName
      ,sc.skillCatId        AS skillCatId
      ,sc.SkillCatName           AS skillCatName
    FROM 
      vwSkillCategories sc
	WHERE
      sc.SkillId = IFNULL(skId, sc.SkillId)
      AND sc.skillName like CONCAT('%', IFNULL(skill, sc.skillName), '%')
      AND sc.SkillCatName = IFNULL(skillCat, sc.SkillCatName)
      AND sc.skillArchived = 0
      AND sc.skillCatArchived = 0;
      
END $$

DELIMITER ; ;

/*
call getSkills('0', 'soft skills');

describe skills;

*/

