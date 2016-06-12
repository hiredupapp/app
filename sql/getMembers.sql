################################################################################
# Author:  Jason Richardson
# Date:    06/11/2016
# Purpose: Return a single member attributes
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS getMembers $$
CREATE  PROCEDURE getMembers(
   IN resId INT
   ,IN usr VARCHAR(255))
BEGIN

	IF resId = 0 THEN
		set resId = NULL;
	END IF;
    IF usr = '0' THEN
		set usr = NULL;
	END IF;
	    
	SELECT 
      ResourceId                AS resId
      ,LastName                 AS lName
      ,FirstName                AS fName
      ,UserName                 AS usr
      ,LocationId               AS locId
      ,ZipCode                  AS zip
      ,City                     AS zipCity
      ,State                    AS zipState
      ,EmploymentStatusId       AS empStatId
      ,EmploymentStatus         AS empStat
      ,CurrentSalaryId          AS curSalId
      ,CurrentSalary            AS curSal
      ,DesiredSalaryId          AS desSalId
      ,DesiredSalary            AS desSal
    FROM 
      vwMembers
	WHERE
      ResourceId = IFNULL(resId, ResourceId)
      AND UserName = IFNULL(usr, UserName);
      
END $$

DELIMITER ;

/*
call getMembers(80, '0');

describe vwMembers;
*/

