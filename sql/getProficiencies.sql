################################################################################
# Author:  Jason Richardson
# Date:    05/29/2016
# Purpose: Return all proficiencies
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS getProficiencies $$
CREATE  PROCEDURE getProficiencies()
BEGIN

	SELECT 
      ProficiencyId     AS profId
      ,Name             AS profName
      ,Description      AS ProfDescr
    FROM 
      proficiencies
	WHERE
      Archived = 0;
      
END $$

DELIMITER ; ;

/*
call getProficiencies();

describe proficiencies;

*/

