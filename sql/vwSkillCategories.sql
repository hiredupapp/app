################################################################################
# Author:  Jason Richardson
# Date:    06/10/2016
# Purpose: Return all skills with categories
################################################################################

USE hiredup$HiredUp;


CREATE OR REPLACE VIEW vwSkillCategories
AS

    SELECT 
      s.SkillId                 AS skillId
      ,s.Name                   AS skillName
      ,s.Archived               AS skillArchived
      ,sc.SkillCategoryId       AS skillCatId      
      ,sc.Name                  AS skillCatName
      ,sc.Archived              AS skillCatArchived
    FROM 
      skills s                  INNER JOIN
      skillsCategories sc
        on s.SkillCategoryId = sc.SkillCategoryId;
      


/*
select * from vwSkillCategories;

describe skillscategories;
*/

