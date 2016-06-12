call utlCreateBackupTable('members', '_members');

DROP TABLE IF EXISTS members;

CREATE TABLE `members` (
  `ResourceId` int(11) NOT NULL AUTO_INCREMENT,
  `EmploymentStatusId` int NULL,
  `CurrentSalaryId` int NULL,
  `DesiredSalaryId` int NULL,
  PRIMARY KEY (`ResourceId`),
  FOREIGN KEY (EmploymentStatusId) REFERENCES employmentStatuses(EmploymentStatusId),
  FOREIGN KEY (CurrentSalaryId) REFERENCES salaryRanges(salaryId),
  FOREIGN KEY (DesiredSalaryId) REFERENCES salaryRanges(salaryId)
);
/*
INSERT INTO members
SELECT
  ResourceId
  ,EmploymentStatusId
  ,CurrentSalaryId
  ,DesiredSalaryId
FROM
  _members;
  
  */
  
select * from members;