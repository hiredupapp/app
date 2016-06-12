################################################################################
# Author:  Jason Richardson
# Date:    05/13/2016
# Purpose: Retrieve the metadata for stored procedure
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS getProcParameters $$
CREATE  PROCEDURE getProcParameters(
   IN procName VARCHAR(45))
BEGIN

SELECT 
  PARAMETER_NAME 	AS ParmName
  ,PARAMETER_MODE	AS ParmMode
FROM 
  information_schema.parameters 
WHERE 
  SPECIFIC_NAME = procName
  AND SPECIFIC_SCHEMA = Database()
ORDER BY 
  ORDINAL_POSITION;
      
END $$

DELIMITER ;

