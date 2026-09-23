--From the table STUDENT perform the following queries:  

--Part – A: 

--1. Create a table valued function to display all student records.

CREATE OR ALTER FUNCTION ALL_STU_REC()
RETURNS TABLE
AS
RETURN 
SELECT * FROM STUDENT

SELECT * FROM ALL_STU_REC()

--2. Create a table valued function that accepts CITY and returns all students from that city. 

CREATE OR ALTER FUNCTION ALL_CITY_STU(@CITY VARCHAR(20))
RETURNS TABLE
AS
RETURN 
SELECT * FROM STUDENT
WHERE CITY = @CITY

SELECT * FROM ALL_CITY_STU('RAJKOT')


--3. Create a table valued function that accepts BRANCH and returns all students of that branch. 

CREATE OR ALTER FUNCTION ALL_BRANCH_STU(@BNAME VARCHAR(20))
RETURNS TABLE
AS
RETURN 
SELECT * FROM STUDENT
WHERE BRANCH = @BNAME

SELECT * FROM ALL_BRANCH_STU('COMPUTER')

--4. Create a table valued function that accepts SPI and returns students whose SPI is greater than entered 
--SPI. 

CREATE OR ALTER FUNCTION ALL_SPI_STU(@SPI DECIMAL(4,2))
RETURNS TABLE
AS
RETURN 
SELECT * FROM STUDENT
WHERE SPI > @SPI

SELECT * FROM ALL_SPI_STU(8.5)

--5. Create a table valued function that accepts MIN_SPI and MAX_SPI and returns students whose SPI lies 
--between given range. 

CREATE OR ALTER FUNCTION ALL_BETWEEN_SPI(@MIN_SPI DECIMAL(4,2) ,@MAX_SPI DECIMAL(4,2))
RETURNS TABLE
AS
RETURN 
SELECT * FROM STUDENT
WHERE SPI >= @MIN_SPI AND SPI <= @MAX_SPI

SELECT * FROM ALL_BETWEEN_SPI(7,8.5)

 
--Part – B:  


--6. Create a table valued function that accepts STDID and returns details of that student. 

CREATE OR ALTER FUNCTION ALL_ID_STU(@ID INT)
RETURNS TABLE
AS
RETURN 
SELECT * FROM STUDENT
WHERE STDID = @ID

SELECT * FROM ALL_ID_STU(101)

--7. Create a table valued function that accepts CITY and returns students whose SPI is greater than 7 from 
--that city. 

CREATE OR ALTER FUNCTION ALL_CITY_7_GRE_SPI(@CITY VARCHAR(20))
RETURNS TABLE
AS
RETURN 
SELECT * FROM STUDENT
WHERE CITY = @CITY AND SPI > 7

SELECT * FROM ALL_CITY_7_GRE_SPI('RAJKOT')

--8. Create a table valued function that accepts BRANCH and returns students whose SPI is less than 8 from 
--that branch. 

CREATE OR ALTER FUNCTION ALL_BRANCH_8_LES_SPI(@BRANCH VARCHAR(20))
RETURNS TABLE
AS
RETURN 
SELECT * FROM STUDENT
WHERE BRANCH = @BRANCH AND SPI < 8

SELECT * FROM ALL_BRANCH_8_LES_SPI('COMPUTER')

--9. Create a table valued function that accepts TOPN and returns top N students based on SPI. 

CREATE OR ALTER FUNCTION ALL_TOP_N_SPI(@N INT)
RETURNS TABLE
AS
RETURN 
SELECT TOP (@N) * FROM STUDENT
ORDER BY SPI DESC

SELECT * FROM ALL_TOP_N_SPI(5)

--10. Create a table valued function that accepts BRANCH and returns highest SPI student from that branch. 
 
CREATE OR ALTER FUNCTION ALL_BRANCH_MAX_SPI(@BRANCH VARCHAR(20))
RETURNS TABLE
AS
RETURN 
SELECT TOP 1 * FROM STUDENT
WHERE BRANCH = @BRANCH 
ORDER BY SPI DESC

SELECT * FROM ALL_BRANCH_MAX_SPI('COMPUTER')

--Part – C:  

--11. Create a table valued function that accepts CITY and returns total students from that city. 

CREATE OR ALTER FUNCTION ALL_COUNT_CITY(@CITY VARCHAR(20))
RETURNS TABLE
AS
RETURN 
SELECT COUNT(*) AS COUNT_CITY FROM STUDENT
WHERE CITY = @CITY

SELECT * FROM ALL_COUNT_CITY('RAJKOT')

--12. Create a table valued function that accepts BRANCH and returns students ordered by SPI in descending 
--order. 

CREATE OR ALTER FUNCTION ALL_BRANCH_SPI(@BRANCH VARCHAR(20))
RETURNS TABLE
AS
RETURN 
SELECT * FROM STUDENT
WHERE BRANCH = @BRANCH 


SELECT * FROM ALL_BRANCH_SPI('COMPUTER')
ORDER BY SPI DESC

--13. Create a table valued function that accepts CITY and returns top 3 student from that city based on SPI. 

CREATE OR ALTER FUNCTION ALL_TOP_3_CITY(@CITY VARCHAR(20))
RETURNS TABLE
AS
RETURN 
SELECT TOP 3 * FROM STUDENT
WHERE CITY = @CITY
ORDER BY SPI DESC

SELECT * FROM ALL_TOP_3_CITY('RAJKOT')

--14. Create a table valued function that accepts STDID and returns student rank based on SPI (RANK). 

CREATE OR ALTER FUNCTION ALL_ID_RANK(@ID INT)
RETURNS TABLE
AS
RETURN
(
	SELECT STDID , SNAME, CITY,
           RANK() OVER (ORDER BY SPI DESC) AS STUDENT_RANK
    FROM STUDENT
)

SELECT * FROM ALL_ID_RANK(103)
WHERE STDID = 103

--15. Create a table valued function that accepts BRANCH and returns students having second highest SPI 
--from that branch. 

CREATE OR ALTER FUNCTION BRANCH_2ND_HIG(@BRANCH VARCHAR(20))
RETURNS TABLE
AS
RETURN 
(
    SELECT * FROM
    (
        SELECT *,
        DENSE_RANK() OVER (ORDER BY SPI DESC) AS RANK_NO
        FROM STUDENT
        WHERE BRANCH = @BRANCH
    ) AS T
    WHERE RANK_NO = 2
)

SELECT * FROM BRANCH_2ND_HIG('COMPUTER')
