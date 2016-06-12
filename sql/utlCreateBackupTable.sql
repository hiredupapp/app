################################################################################
# Author:  Jason Richardson
# Date:    05/27/2016
# Purpose: Create a physical backup copy of the a table in preparation for 
#			schema modification
################################################################################

USE hiredup$HiredUp;

DELIMITER $$

DROP PROCEDURE IF EXISTS utlCreateBackupTable $$
CREATE  PROCEDURE utlCreateBackupTable(
   IN tableName VARCHAR(45)
   ,IN backupName VARCHAR(45))
BEGIN

IF EXISTS (SELECT table_name FROM information_schema.tables WHERE table_schema=database() and table_name = tableName) THEN
	IF NOT EXISTS (SELECT table_name FROM information_schema.tables WHERE table_schema=database() and table_name = backupName) THEN
		SET @qry = (SELECT CONCAT('CREATE TABLE ', backupName, ' SELECT * FROM ', tableName));
		PREPARE stmt FROM @qry;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
        
		SELECT 'Backup Complete' AS RESULT;
	ELSE
		SELECT CONCAT(backupName, ' already exists') AS RESULT;
	END IF;
ELSE
	SELECT CONCAT(tableName, ' does not exist') AS RESULT;
END IF;
    
END $$

DELIMITER ;