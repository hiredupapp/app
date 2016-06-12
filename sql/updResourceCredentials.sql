################################################################################
# Author:  Jason Richardson
# Date:    05/14/2016
# Purpose: Keep credential logic isolated from other profile transactions
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS updResourceCredentials $$
CREATE  PROCEDURE updResourceCredentials(
   IN usr VARCHAR(45)
   ,IN pwd CHAR(87))
BEGIN

	UPDATE 
      resources
	SET 
      Password =  pwd
	WHERE
	  UserName = usr;
      
END $$

DELIMITER ;