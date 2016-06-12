call utlCreateBackupTable('salaryRanges', '_salaryRanges');

DROP TABLE IF EXISTS salaryRanges;

CREATE TABLE `salaryRanges` (
  `SalaryId` int(11) NOT NULL AUTO_INCREMENT,
  `Salary` varchar(45) NOT NULL,
  `ItemOrder` int NOT NULL,
  PRIMARY KEY (`SalaryId`)
)COMMENT = 'Salary ranges to simplify input';


/*
INSERT INTO salaryRanges
SELECT
  SalaryId
  ,Salary
  ,ItemOrder
FROM
  _salaryRanges;
  
  */
  
INSERT INTO salaryRanges (Salary, ItemOrder) VALUES ('< 35K', 1);
INSERT INTO salaryRanges (Salary, ItemOrder) VALUES ('35K-45K', 2);
INSERT INTO salaryRanges (Salary, ItemOrder) VALUES ('45K-55K', 3);
INSERT INTO salaryRanges (Salary, ItemOrder) VALUES ('55K-65K', 4);
INSERT INTO salaryRanges (Salary, ItemOrder) VALUES ('65K-75K', 5);
INSERT INTO salaryRanges (Salary, ItemOrder) VALUES ('75K-85K', 6);
INSERT INTO salaryRanges (Salary, ItemOrder) VALUES ('85K-95K', 7);
INSERT INTO salaryRanges (Salary, ItemOrder) VALUES ('> 95K', 8);

select * from salaryRanges;