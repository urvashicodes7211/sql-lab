--From the table STUDENT perform the following queries:  
--Part – A:  

--1. INSERT Procedures: Create stored procedures to insert records into STUDENT tables 
--(SP_INSERT_STUDENT) 

CREATE OR ALTER PROC SP_INSERT_STUDENT
@ID INT , 
@NAME VARCHAR(20) , 
@CITY VARCHAR(20) , 
@SPI DECIMAL(4,2) , 
@BRANCH VARCHAR(20)
AS
BEGIN 
	INSERT INTO STUDENT 
	VALUES(@ID,@NAME,@CITY,@SPI,@BRANCH)
END

EXEC SP_INSERT_STUDENT 115 ,'PUSHTI', 'RAJKOT', 9.48, 'COMPUTER'

EXEC SP_INSERT_STUDENT 116 , 'NIKUNJ' ,'SURAT', 8.80, 'CHEMICAL'

SELECT * FROM STUDENT

--2. INSERT Procedures: Create stored procedures to insert records into DEPOSIT tables  
--(SP_INSERT_DEPOSIT)

CREATE OR ALTER PROC SP_INSERT_DEPOSIT
@ACTNO INT , 
@CNAME VARCHAR(20) , 
@BNAME VARCHAR(20) , 
@AMOUNT INT , 
@DATE DATETIME
AS
BEGIN 
	INSERT INTO DEPOSIT 
	VALUES(@ACTNO,@CNAME,@BNAME,@AMOUNT,@DATE)
END

EXEC SP_INSERT_DEPOSIT 118 , 'HEMENT', 'BEDI', 16000 ,'05-05-2025'

EXEC SP_INSERT_DEPOSIT 119, 'RAVI', 'MAVDI' ,24000, '09-07-2024'

SELECT * FROM DEPOSIT

--3. UPDATE Procedures: Create stored procedure SP_UPDATE_STUDENT to update Branch in STUDENT 
--table. (Update using studentID) 


CREATE OR ALTER PROC SP_UPDATE_STUDENT
@ID INT,
@BRANCH VARCHAR(20)
AS
BEGIN 
	UPDATE STUDENT
	SET BRANCH = @BRANCH
	WHERE STDID = @ID
END

EXEC SP_UPDATE_STUDENT 115 , 'ELECTRICAL' 

EXEC SP_UPDATE_STUDENT 116 ,'MECHANICAL'

SELECT * FROM STUDENT

--4.DELETE Procedures: Create stored procedure SP_DELETE_STUDENT to delete records from STUDENT 
--where Student Name is RAVI. 

CREATE OR ALTER PROC SP_DELETE_STUDENT
@NAME VARCHAR(20)
AS
BEGIN 
	DELETE FROM STUDENT
	WHERE SNAME = @NAME
END

EXEC SP_DELETE_STUDENT 'RAVI'

SELECT * FROM STUDENT

--5. SELECT BY PRIMARY KEY: Create stored procedures to select records by primary key 
--(SP_SELECT_STUDENT_BY_ID) from Student table. (Display All Columns) 

CREATE OR ALTER PROC SP_SELECT_STUDENT_BY_ID
@ID INT 
AS
BEGIN 
	SELECT * FROM STUDENT
	WHERE STDID = @ID
END

EXEC SP_SELECT_STUDENT_BY_ID 101

EXEC SP_SELECT_STUDENT_BY_ID 111



--6. Create a stored procedure that shows details of the first 5 students ordered by SPI (Highest First). 

CREATE OR ALTER PROC PR_TOP5
AS
BEGIN 
	SELECT TOP 5 *
	FROM STUDENT
	ORDER BY SPI DESC
END

EXEC PR_TOP5

--From the table EMPLOYEE perform the following queries:  
--Part – B:   
--7. Create a stored procedure which displays all employee details.

CREATE OR ALTER PROC PR_ALLEMP
AS
BEGIN 
	SELECT * FROM EMPLOYEE
END

EXEC PR_ALLEMP

--8. Create a stored procedure that takes department name as input and returns all the employee in that 
--department. 

CREATE OR ALTER PROC PR_DEP_WISE
@DEP VARCHAR(20)
AS
BEGIN 
	SELECT * FROM EMPLOYEE
	WHERE DEPARTMENT = @DEP
END

EXEC PR_DEP_WISE 'IT'

--Part – C:  
--9. Create a stored procedure which displays department-wise maximum, minimum, and average salary of 
--employee. 
CREATE OR ALTER PROC PR_MAX_MIN_AVG_SALARY
AS
BEGIN 
	SELECT DEPARTMENT,MAX(SALARY),MIN(SALARY),AVG(SALARY)
	FROM EMPLOYEE
	GROUP BY DEPARTMENT
END

EXEC PR_MAX_MIN_AVG_SALARY 

--10. Create a stored procedure that accepts department name as parameter and returns total salary of their 
--department. 
CREATE OR ALTER PROC PR_DEP_SALARY_SUM
@DEP VARCHAR(20)
AS
BEGIN 
	SELECT SUM(SALARY)
	FROM EMPLOYEE
	WHERE DEPARTMENT = @DEP
END

EXEC PR_DEP_SALARY_SUM 'IT'