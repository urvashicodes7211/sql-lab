--Part – A:  
--1. Implement scalar function to return "Welcome to DBMS Lab". 

CREATE OR ALTER FUNCTION PRINT_MSG()
RETURNS VARCHAR(50)
AS
BEGIN
	RETURN ('Welcome to DBMS Lab')
END 

SELECT DBO.PRINT_MSG()

--2. Implement scalar function to calculate simple interest. 

CREATE OR ALTER FUNCTION CAL_SI(@P INT,@R INT,@N INT)
RETURNS INT
AS
BEGIN
	RETURN ((@P * @R * @N)/100)
END 

SELECT DBO.CAL_SI(100,1,1)

--3. Implement scalar function to find difference in days between two dates. 

CREATE OR ALTER FUNCTION DIFF_DAY(@D1 DATETIME , @D2 DATETIME)
RETURNS INT
AS
BEGIN
	RETURN (DATEDIFF(DAY,@D1,@D2))
END 

SELECT DBO.DIFF_DAY('2025-2-2','2026-2-2')

--4. Implement scalar function to check whether number is odd or even. 

CREATE OR ALTER FUNCTION ODD_EVEN(@N INT)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @RES VARCHAR(10)
	IF(@N % 2 = 0)
	BEGIN
		SET @RES = 'EVEN'
	END
	ELSE
	BEGIN
		SET @RES = 'ODD'
	END
	RETURN @RES
END 

SELECT DBO.ODD_EVEN(11)

--5. Implement scalar function to print numbers from 1 to N. 

CREATE OR ALTER FUNCTION ONE_N(@N INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @I INT = 1
	DECLARE @RES VARCHAR(100)=''
	WHILE @I <= @N
	BEGIN 
		SET @RES=@RES + CAST(@I AS VARCHAR)+' '
		SET @I=@I+1
	END
	RETURN @RES
END 

SELECT DBO.ONE_N(11)
 
--Part – B:  

--6. Implement scalar function to calculate factorial of given number. 

CREATE OR ALTER FUNCTION FAC_CAL(@N INT)
RETURNS INT
AS
BEGIN
	DECLARE @I INT = 1
	DECLARE @RES INT = 1 
	WHILE @I <= @N
	BEGIN 
		SET @RES = @RES * @I
		SET @I=@I+1
	END
	RETURN @RES
END 

SELECT DBO.FAC_CAL(6)

--7. Implement scalar function to check palindrome number. 

CREATE OR ALTER FUNCTION PALINDROME(@N INT)
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @I INT = 1
	DECLARE @M INT 
	DECLARE @ORI INT = @N
	DECLARE @RES INT = 0 
	DECLARE @ANS VARCHAR(20)

	WHILE @I <= @N
	BEGIN 
		SET @M = @N % 10
		SET @N = @N / 10
		SET @RES = (@RES * 10 ) + @M
	END
	IF(@RES = @ORI)
	BEGIN
		SET @ANS = 'PALINDROME'
	END
	ELSE
	BEGIN
		SET @ANS = 'NOT PALINDROME'
	END
	RETURN @ANS
END 

SELECT DBO.PALINDROME(616)

--8. Implement scalar function to find maximum of three numbers. 

CREATE OR ALTER FUNCTION MAX_3_NUM(@N1 INT,@N2 INT , @N3 INT)
RETURNS INT
AS
BEGIN
	DECLARE @I INT = 1
	DECLARE @RES INT
	IF(@N1 > @N2 AND @N1 > @N3)
	BEGIN
		SET @RES = @N1
	END
	ELSE IF(@N2 > @N3 AND @N2 > @N1)
	BEGIN
		SET @RES = @N2
	END
	ELSE
	BEGIN
		SET @RES = @N3
	END
	RETURN @RES
END 

SELECT DBO.MAX_3_NUM(6,12,0)

--9. Implement scalar function to calculate square and cube of a number. 

CREATE OR ALTER FUNCTION SQRT_CUBE(@N INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @RES VARCHAR(100)=''
	DECLARE @QUR INT 
	DECLARE @CUBE INT
	SET @QUR = (@N * @N) 
	SET @CUBE = (@N * @N * @N) 

	SET @RES= CONCAT(@QUR ,' ', @CUBE)
	
	RETURN @RES
END 

SELECT DBO.SQRT_CUBE(2)

 
--From the table EMPLOYEE perform the following queries:  

--Part – C:  

--10. Implement scalar function to return employee full details using EID. 

CREATE OR ALTER FUNCTION EM_DETAILS(@ID INT)
RETURNS TABLE
AS 
RETURN (SELECT * FROM EMPLOYEE WHERE @ID = EID)

SELECT * FROM EM_DETAILS(101)

--11. Implement scalar function to return highest salary from a given department. 

CREATE OR ALTER FUNCTION DEP_HIG_SALARY(@DEP VARCHAR(20))
RETURNS INT
AS
BEGIN
	RETURN (SELECT MAX(SALARY) FROM EMPLOYEE WHERE DEPARTMENT = @DEP)
END

SELECT  DBO.DEP_HIG_SALARY('IT')

--12. Implement scalar function to count total employees in EMPLOYEE table. 

CREATE OR ALTER FUNCTION TOTAL_EMP()
RETURNS INT
AS
BEGIN
	RETURN(SELECT COUNT(*) FROM EMPLOYEE)
END

SELECT DBO.TOTAL_EMP()

--13. Implement scalar function to find total experience of employee using JoiningYear. 

CREATE OR ALTER FUNCTION TOTAL_EXP(@ID INT)
RETURNS INT
AS
BEGIN
	RETURN(SELECT 2026 - JoiningYear FROM EMPLOYEE WHERE EID = @ID)
END

SELECT DBO.TOTAL_EXP(101)

--14. Implement scalar function to return total number of employees in a given department. 

CREATE OR ALTER FUNCTION DEP_EMP_COUNT(@DEP VARCHAR(20))
RETURNS INT
AS
BEGIN
	RETURN(SELECT COUNT(*) FROM EMPLOYEE WHERE DEPARTMENT = @DEP)
END

SELECT DBO.DEP_EMP_COUNT('IT')

--15. Implement scalar function to count total employees from a given city.

CREATE OR ALTER FUNCTION CITY_EMP_COUNT(@CITY VARCHAR(20))
RETURNS INT
AS
BEGIN
	RETURN(SELECT COUNT(*) FROM EMPLOYEE WHERE CITY = @CITY)
END

SELECT DBO.CITY_EMP_COUNT('RAJKOT')
