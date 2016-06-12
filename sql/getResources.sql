################################################################################
# Author:  Jason Richardson
# Date:    04/29/2016
# Purpose: Return all or one resource
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS getResources $$
CREATE  PROCEDURE getResources(
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
      r.FirstName 		AS fName
      ,r.LastName		AS lName
      ,r.UserName    	AS usr
      ,r.ResourceId 	AS rId
      ,l.ZipCode		AS zip
    FROM 
      resources	r		LEFT OUTER JOIN
      locations l 
        on r.LocationId = l.LocationId
	WHERE
      ResourceId = IFNULL(resId, ResourceId)
      AND UserName = IFNULL(usr, UserName);
      
END $$

DELIMITER ; ;

/*
call getResources(0, '0');

update resources set locationId = (select locationId from locations where ZipCode = '48236') where emailAddress = 'mike@hiredupapp.com';
*/

