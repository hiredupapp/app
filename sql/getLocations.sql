################################################################################
# Author:  Jason Richardson
# Date:    05/28/2016
# Purpose: Return filtered collection of zipCode
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS getLocations $$
CREATE  PROCEDURE getLocations(
   IN zip INT)
BEGIN
        
	SELECT 
      LocationId						AS locId
	  ,ZipCode							AS zip
	  ,City								AS city
	  ,State							AS state
	  ,CAST(Latitude AS CHAR(12))	AS latitude
	  ,CAST(Longitude AS CHAR(12))	AS longitude
    FROM 
      locations l 
	WHERE
      ZipCode LIKE CONCAT(zip, '%');
      
END $$

DELIMITER ; ;

/*
call getLocations(48);
SELECT * FROM locations;

describe locations;
*/

