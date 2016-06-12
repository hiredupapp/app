################################################################################
# Author:  Jason Richardson
# Date:    06/10/2016
# Purpose: Insert new members
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS insMember $$
CREATE  PROCEDURE insMember(
   IN resId INT
   ,IN empStatId INT
   ,IN curSalId INT
   ,IN desSalId INT)
BEGIN

	IF empStatId = 0 THEN
		set empStatId = NULL;
    END IF;
    IF curSalId = 0 THEN
		set curSalId = NULL;
	END IF;
    IF desSalId = 0 THEN
		set desSalId = NULL;
	END IF;

	INSERT INTO memberS (ResourceId, EmploymentStatusId, CurrentSalaryId, DesiredSalaryId)
		SELECT
		  resId
		  ,empStatId
		  ,curSalId
          ,desSalId;

END $$

DELIMITER ;

/*

call insMember(80, 5, 6, 13);


select * from members;
select * from employmentStatuses;

*/
