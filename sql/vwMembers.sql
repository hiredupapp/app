################################################################################
# Author:  Jason Richardson
# Date:    06/11/2016
# Purpose: Return all member properties
################################################################################

USE hiredup$HiredUp;


CREATE OR REPLACE VIEW vwMembers
AS

    SELECT 
      r.ResourceId              
      ,r.LastName               
      ,r.FirstName              
      ,r.UserName               
      ,l.LocationId             
      ,l.ZipCode                
      ,l.City                   
      ,l.State                  
      ,e.EmploymentStatusId     
      ,e.EmploymentStatus       
      ,sc.SalaryId                                      AS CurrentSalaryId
      ,sc.Salary                                        AS CurrentSalary
      ,sd.SalaryId                                      AS DesiredSalaryId
      ,sd.Salary                                        AS DesiredSalary
    FROM 
      resources r                                       INNER JOIN
      members m
        on r.ResourceId = m.ResourceId                  INNER JOIN
      locations l 
        on l.LocationId = r.LocationId                  INNER JOIN
      EmploymentStatuses e
        on e.employmentStatusId = m.employmentStatusId  INNER JOIN
      SalaryRanges sc
        on sc.salaryId = m.CurrentSalaryId              INNER JOIN
      SalaryRanges sd
        on sd.salaryId = m.DesiredSalaryId;
      


/*
select * from vwMembers;

describe locations;
*/

