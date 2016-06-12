################################################################################
# Author:  Jason Richardson
# Date:    04/30/2016
# Purpose: Insert new resources and return the new ResourceId
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS insResource $$
CREATE  PROCEDURE insResource(
   IN fName VARCHAR(45)
   ,IN lName VARCHAR(45)
   ,IN usr VARCHAR(45)
   ,IN locId INT
   ,OUT resId INT)
BEGIN

	INSERT INTO resources (FirstName, LastName, UserName, LocationId, CreatedOn)
		SELECT
		  fName
		  ,lName
		  ,usr
          ,CASE WHEN locId = 0 
                THEN (SELECT LocationId FROM locations WHERE ZipCode = '00000')
                ELSE locId      END
          ,NOW();

	SET resId = LAST_INSERT_ID();
      
END $$

DELIMITER ;

/*
set @out = 0;
call insResource('Miriam', 'Richardson', 'miriamGraceRichardson@gmail.com', 0, @out);
select @out;

select * from resources;
select * from locations where City = 'Unknown'; where zipCode = '48236';
*/
