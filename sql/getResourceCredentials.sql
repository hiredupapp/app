################################################################################
# Author:  Jason Richardson
# Date:    05/14/2016
# Purpose: Return only user credentials necessary for logging in
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS getResourceCredentials $$
CREATE  PROCEDURE getResourceCredentials(
   IN usr VARCHAR(255))
BEGIN

	IF usr = '0' THEN
		set usr = NULL;
	END IF;
        
	SELECT 
      Password 	AS pwd
    FROM 
      resources
	WHERE
      UserName = IFNULL(usr, UserName);
      
END $$

DELIMITER ; ;

/*
call getResourceCredentials('jrichardson1@gmail.com');
call getResourceCredentials(null);

select * from resources;
*/