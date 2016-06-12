call utlCreateBackupTable('employmentStatuses', '_employmentStatuses');

DROP TABLE IF EXISTS employmentStatuses;

CREATE TABLE `employmentStatuses` (
  `EmploymentStatusId` int(11) NOT NULL AUTO_INCREMENT,
  `EmploymentStatus` varchar(45) NOT NULL,
  `ItemOrder` int NOT NULL,
  PRIMARY KEY (`EmploymentStatusId`)
)COMMENT = 'Salary ranges to simplify input';


/*
INSERT INTO employmentStatuses
SELECT
  EmploymentStatusId
  ,EmploymentStatus
  ,ItemOrder
FROM
  _employmentStatuses;
  
  */
  
  

INSERT INTO employmentStatuses (EmploymentStatus, ItemOrder) VALUES ('Ready', 1);
INSERT INTO employmentStatuses (EmploymentStatus, ItemOrder) VALUES ('Willing', 2);
INSERT INTO employmentStatuses (EmploymentStatus, ItemOrder) VALUES ('Happy', 3);
INSERT INTO employmentStatuses (EmploymentStatus, ItemOrder) VALUES ('Make Me Move', 4);
INSERT INTO employmentStatuses (EmploymentStatus, ItemOrder) VALUES ('It''s a Secret', 5);

select * from employmentStatuses;