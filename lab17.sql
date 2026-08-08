--From the table EMPLOYEE perform the following queries:  

--Part – A: 

--1. Create a view Employee_All with all columns.

CREATE VIEW EMPLOYEE_ALL
AS 
SELECT * FROM EMPLOYEE

SELECT * FROM EMPLOYEE_ALL


--2. Create a view Employee_NameDeptSalary having columns FirstName, Department and Salary.

CREATE VIEW EMPLOYEE_NAMEDEPTSALARY
AS 
SELECT FIRSTNAME , DEPARTMENT, SALARY FROM EMPLOYEE

SELECT * FROM EMPLOYEE_NAMEDEPTSALARY


--3. Create a view Employee_Basic having columns EID, FirstName and City. 


CREATE VIEW EMPLOYEE_BASIC
AS 
SELECT EID , FIRSTNAME , CITY FROM EMPLOYEE

SELECT * FROM EMPLOYEE_BASIC


--4. Create a view IT_Employees that displays IT department data only. 

CREATE VIEW IT_EMPLOYEES
AS 
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT = 'IT'

SELECT * FROM IT_EMPLOYEES

--5. Create a view HR_Employees that displays HR department data only. 

CREATE VIEW HR_EMPLOYEES
AS 
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT = 'HR'

SELECT * FROM HR_EMPLOYEES

--6. Create a view Employee_2026 that displays employees joined in 2026 only.

CREATE VIEW EMPLOYEE_2026
AS 
SELECT * FROM EMPLOYEE
WHERE JOININGYEAR = 2026

SELECT * FROM EMPLOYEE_2026

--7. Create a view Patel_Employees that displays employees whose last name is PATEL. 

CREATE VIEW PATEL_EMPLOYEES
AS 
SELECT * FROM EMPLOYEE
WHERE LASTNAME = 'PATEL'

SELECT * FROM PATEL_EMPLOYEES

--8. Create a view High_Salary_Emp having all columns but employees whose salary is more than 12000.

CREATE VIEW HIGH_SALARY_EMP
AS 
SELECT * FROM EMPLOYEE
WHERE SALARY > 12000

SELECT * FROM HIGH_SALARY_EMP

--9. Create a view that displays information of all employees whose salary is above 14000. 


CREATE VIEW HIGH_SALARY_EMP_14000
AS 
SELECT * FROM EMPLOYEE
WHERE SALARY > 14000

SELECT * FROM HIGH_SALARY_EMP_14000

--10. Create a view that displays employees having salary below 10000. 

CREATE VIEW LOW_SALARY_EMP_10000
AS 
SELECT * FROM EMPLOYEE
WHERE SALARY < 10000

SELECT * FROM LOW_SALARY_EMP_10000

--11. Create a view Server_Dept that displays Server department employees only. 

CREATE VIEW SERVER_DEPT
AS 
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT = 'SERVER'

SELECT * FROM SERVER_DEPT



--12. Insert a new record into Employee_Basic view. (111, MEET, SURAT) 

INSERT INTO EMPLOYEE_BASIC (EID, FIRSTNAME, CITY)
VALUES(111,'MEET','SURAT');

SELECT * FROM EMPLOYEE_BASIC
 

--13. Update the department of DEEP from ADMIN to IT in Employee_NameDeptSalary view. 

UPDATE EMPLOYEE_NAMEDEPTSALARY
SET DEPARTMENT = 'IT'
WHERE FIRSTNAME = 'DEEP'

SELECT * FROM EMPLOYEE_NAMEDEPTSALARY

--14. Delete an employee whose EID is 107 from Employee_Basic view. 

DELETE FROM EMPLOYEE_BASIC
WHERE EID = 107

SELECT * FROM EMPLOYEE_BASIC

--15. Drop IT_Employees view from the database. 

DROP VIEW IT_EMPLOYEES
 
--Part – B: 

--16. Create a view Admin_Employees that displays ADMIN department employees only. 

CREATE VIEW ADMIN_EMPLOYEES
AS 
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT = 'ADMIN'

SELECT * FROM ADMIN_EMPLOYEES

--17. Create a view Female_Employees that displays female employee data only. 

CREATE VIEW FEMALE_EMPLOYEES
AS 
SELECT * FROM EMPLOYEE
WHERE GENDER = 'FEMALE'

SELECT * FROM FEMALE_EMPLOYEES

--18. Create a view Male_Employees that displays male employee data only. 

CREATE VIEW MALE_EMPLOYEES
AS 
SELECT * FROM EMPLOYEE
WHERE GENDER = 'MALE'

SELECT * FROM MALE_EMPLOYEES

--19. Create a view Rajkot_Employees that displays employees from Rajkot city only. 

CREATE VIEW RAJKOT_EMPLOYEES
AS 
SELECT * FROM EMPLOYEE
WHERE CITY = 'RAJKOT'

SELECT * FROM RAJKOT_EMPLOYEES

--20. Create a view Ahmedabad_Employees that displays employees from Ahmedabad city only. 

CREATE VIEW AHMEDABAD_EMPLOYEES
AS 
SELECT * FROM EMPLOYEE
WHERE CITY = 'AHMEDABAD'

SELECT * FROM AHMEDABAD_EMPLOYEES

--21. Create a view Salary_Between that displays employees whose salary is between 10000 and 14000. 

CREATE VIEW SALARY_BETWEEN
AS 
SELECT * FROM EMPLOYEE
WHERE SALARY BETWEEN 10000 AND 14000

SELECT * FROM SALARY_BETWEEN

--22. Create a view Recent_Employees that displays employees joined after 2023. 

CREATE VIEW RECENT_EMPLOYEES
AS 
SELECT * FROM EMPLOYEE
WHERE JOININGYEAR > 2023

SELECT * FROM RECENT_EMPLOYEES

--23. Create a view Old_Employees that displays employees joined before 2023. 

CREATE VIEW OLD_EMPLOYEES
AS 
SELECT * FROM EMPLOYEE
WHERE JOININGYEAR < 2023

SELECT * FROM OLD_EMPLOYEES

--24. Create a view Employees_Start_R that displays employees whose first name starts with R. 

CREATE VIEW EMPLOYEES_START_R
AS 
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE 'R%'

SELECT * FROM EMPLOYEES_START_R

--25. Create a view Employees_End_A that displays employees whose first name ends with A. 

CREATE VIEW EMPLOYEES_END_A
AS 
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '%A'

SELECT * FROM EMPLOYEES_END_A
 
--Part – C: 

--26. Create a view Employees_NameContains_H that displays employees whose first name contains H. 

CREATE VIEW EMPLOYEES_NAMECONTAINS_H
AS 
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '%H%'

SELECT * FROM EMPLOYEES_NAMECONTAINS_H

--27. Create a view for the employees whose first name contains vowels. 

CREATE VIEW EMPLOYEES_NAMECONTAINS_VOWELS
AS 
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE '%[AEIOU]%'

SELECT * FROM EMPLOYEES_NAMECONTAINS_VOWELS

--28. Create a view FourLetter_Name having EID, FirstName and Department columns in which FirstName 
--consists of four letters. 

CREATE VIEW FOURLETTER_NAME
AS 
SELECT EID , FIRSTNAME , DEPARTMENT  FROM EMPLOYEE
WHERE FIRSTNAME LIKE '____'

SELECT * FROM FOURLETTER_NAME

--29. Create a view for the employees whose name starts with M and ends with N. 

CREATE VIEW EMPLOYEES_NAMECONTAINS_M_N
AS 
SELECT * FROM EMPLOYEE
WHERE FIRSTNAME LIKE 'M%N'

SELECT * FROM EMPLOYEES_NAMECONTAINS_M_N

--30. Create a view Transport_Dept that displays Transport department employees only.

CREATE VIEW TRANSPORT_DEPT
AS 
SELECT *  FROM EMPLOYEE
WHERE DEPARTMENT = 'TRANSPORT'

SELECT * FROM TRANSPORT_DEPT