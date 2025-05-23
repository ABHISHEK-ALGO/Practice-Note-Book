/** Leet code Problems **/
use geeks;
SHOW TABLES;
SELECT * FROM SAMPLESTORE;
 -- to find unique elements 
SELECT (SELECT DISTINCT(`CUSTOMER_ID`) AS UNIQ FROM SAMPLESTORE) AS CNT FROM SAMPLESTORE;

--SUBSTR USE CASES --  
SELECT `Ship Mode`,CONCAT(UPPER(SUBSTR(STATE,1,3)),"-",UPPER(SUBSTR(CITY,1,3))) AS LOC_CODE
FROM samplestore;
SELECT `ORDER ID`,CONCAT(UPPER(SUBSTR(STATE,1,4)),"-",LOWER(SUBSTR(CITY,1,4))) AS LOC_CODE FROM SAMPLESTORE ;

-- TOTAL AND UNIQ CUSTOMER --  
SELECT 
    COUNT(*) AS TotalCount,
    COUNT(DISTINCT `Customer ID`) AS UniqueCustomerCount
FROM 
    geeks.samplestore;

SELECT COUNT(*) AS TOTAL_COUNT,
COUNT(DISTINCT ('CUSTOMER ID')) AS UNIQ
FROM SAMPLESTORE;



/** Delete duplicate Customer id **/
USE GEEKS;
SHOW TABLES;
DELETE FROM samplestore WHERE`Customer ID` NOT IN 
(
SELECT `Customer ID` FROM 
(
SELECT MIN(`Customer ID`) as Uniq FROM samplestore GROUP BY `Customer Name`) as dist
);

/** Cloning the database **/
SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS GEEKS_CL;
USE GEEKS;
SHOW TABLES;
CREATE TABLE GEEKS_CL.CUSTOMER_CL AS SELECT * FROM GEEKS.CUSTOMER;

USE GEEKS_CL;
SHOW TABLES;

/** CLONE THE TABLE SHEMEA ONLY**/
CREATE TABLE GEEKS_CL.CUST LIKE GEEKS.CUSTOMER;
SHOW TABLES;

CREATE TABLE IF NOT EXISTS GEEKS.EMP_RECORDS (
EMP_ID VARCHAR(4) NOT NULL,
 FIRST_NAME VARCHAR(100) NOT NULL,
 LAST_NAME VARCHAR(100),
 GENDER VARCHAR(1),
 ROLE VARCHAR(100),
 DEPT VARCHAR(100),
 MANAGER_ID VARCHAR(100),
 EXP INT NOT NULL CHECK (EXP >=0),
 CONSTRAINT GENDER_CHECK CHECK (GENDER IN ('M','F','O'))) ENGINE = INNODB;
 
 CREATE TABLE IF NOT EXISTS GEEKS.EMP (
EMP_ID VARCHAR(4) NOT NULL,
FIRST_NAME VARCHAR(100) NOT NULL,
LAST_NAME VARCHAR(100));

ALTER TABLE GEEKS.EMP 
ADD COLUMN DEPT VARCHAR(100);
 
 ALTER TABLE GEEKS.EMP_RECORDS 
 MODIFY GENDER VARCHAR (1) NOT NULL ;
 
 ALTER TABLE GEEKS.EMP_RECORDS
 MODIFY MANAGER_ID VARCHAR(100) NOT NULL ;
 
 ALTER TABLE GEEKS.EMP_RECORDS
 CHANGE COLUMN ROLE JOB VARCHAR(100);
 
 DESCRIBE GEEKS.EMP_RECORDS;
 
 ALTER TABLE GEEKS.EMP_RECORDS 
 DROP COLUMN MANAGER_ID;
 
 ALTER TABLE GEEKS.EMP_RECORDS
 RENAME TO GEEKS.RECOR;
 
 USE GEEKS;
 SHOW TABLES;

SELECT* FROM CUSTOMER;
ALTER TABLE GEEKS.CUSTOMER 
ADD name VARCHAR(100)
GENERATED ALWAYS AS (CONCAT(First_Name,' ',Last_Name));

/** inserting into tabel **/
INSERT INTO 
geeks.recor(EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EXP)
VALUES ("E260", "Roy", "Collins", "M", "RETAIL",3);
 INSERT INTO 
GEEKS.RECOR(EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EXP)
 VALUES
 ("E620", "Katrina", "Allen", "F", "RETAIL",3),
 ("E583", "Janet", "Hale", "F", "RETAIL", "3"),
 ("E612", "Tracy", "Norris", "F", "RETAIL", "2"),
 ("E002", "Cynthia", "Brooks", "F", "ALL", "1");
select * from geeks.recor;

/** operators **/
use campusx;
show tables;
CREATE TABLE IF NOT EXISTS campusx.EMP_TABLE (
EMP_ID VARCHAR(4) NOT NULL,
FIRST_NAME VARCHAR(100) NOT NULL,LAST_NAME VARCHAR(100),
GENDER VARCHAR(1),
ROLE VARCHAR(100),
DEPT VARCHAR(100),
MANAGER_ID VARCHAR(100),
check(GENDER in ('M', 'F', 'O')
)) ENGINE=INNODB;

INSERT INTO 
campusx.EMP_TABLE(EMP_ID,FIRST_NAME,LAST_NAME,GENDER,ROLE,DEPT,MANAGER_ID)
 VALUES
 ("E620", "Katrina", "Allen", "F", "JUNIOR DATA SCIENTIST", "RETAIL", "E612"),
 ("E583", "Janet", "Hale", "F", "MANAGER", "RETAIL", "E002"),
 ("E612", "Tracy", "Norris", "F", "MANAGER", "RETAIL", "E002"),
 ("E002", "Cynthia", "Brooks", "F", "PRESIDENT", "ALL", "E001");
 
 TRUNCATE TABLE CAMPUSX.EMP_TABLE ;
 ALTER TABLE CAMPUSX.EMP_TABLE 
 ADD EXP INT ;
 INSERT INTO 
CAMPUSX.EMP_TABLE(EMP_ID,FIRST_NAME,LAST_NAME,GENDER,ROLE,DEPT,MANAGER_ID,EXP)
 VALUES
 ("E260", "Roy", "Collins", "M", "SENIOR DATA SCIENTIST", "RETAIL", "E583", 7),
 ("E620", "Katrina", "Allen", "F", "JUNIOR DATA SCIENTIST", "RETAIL", "E612", 2),
 ("E583", "Janet", "Hale", "F", "MANAGER", "RETAIL", "E002", 14),
 ("E612", "Tracy", "Norris", "F", "MANAGER", "RETAIL", "E002", 13),
 ("E002", "Cynthia", "Brooks", "F", "PRESIDENT", "ALL", "E001", 17);
 
 INSERT INTO CAMPUSX.EMP_TABLE(EMP_ID,FIRST_NAME,LAST_NAME,GENDER,ROLE,DEPT,MANAGER_ID, EXP)
 VALUES 
("E001", "Arthur", "Black", "M", "CEO","RETAIL", "E003",NULL);
SELECT * FROM CAMPUSX.EMP_TABLE 
WHERE EXP IS NULL;

/* ONE EMP FROM EACH DEPT*/
SELECT DEPT, EMP_ID, FIRST_NAME, LAST_NAME, GENDER, ROLE
FROM campusx.EMP_TABLE
WHERE (EMP_ID, DEPT) IN (
    SELECT MIN(EMP_ID), DEPT
    FROM campusx.EMP_TABLE
    GROUP BY DEPT
);

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, ROLE, DEPT
FROM campusx.EMP_TABLE
GROUP BY EMP_ID, FIRST_NAME, LAST_NAME, GENDER, ROLE, DEPT
LIMIT 0, 1000;

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, ROLE, DEPT, EXP
FROM CAMPUSX.EMP_TABLE
WHERE EXP >= 5 AND EXP <= 10
GROUP BY EMP_ID, FIRST_NAME, LAST_NAME, GENDER, ROLE, DEPT, EXP
LIMIT 0, 1000;

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, ROLE, DEPT, EXP
FROM CAMPUSX.EMP_TABLE
WHERE (DEPT, EMP_ID) IN (
    SELECT DEPT, MIN(EMP_ID)
    FROM CAMPUSX.EMP_TABLE
    WHERE EXP >= 5 AND EXP <= 10
    GROUP BY DEPT
)
LIMIT 0, 1000;

 
 SELECT * FROM CAMPUSX.EMP_TABLE
 WHERE EXP BETWEEN 7 AND 14;
 
 /** Participants **/
 CREATE TABLE participant(
 id_number int,first_name text,last_name text,city text,
 state_code text,shirt_or_hat text,quiz_points int,team text,
 signup date,age int,company text);
 
 SELECT CITY, AVG(QUIZ_POINTS) FROM PARTICIPANT
 WHERE (TEAM = 'Angry Ants') AND (CITY LIKE "Mo%") AND (COMPANY IS NOT NULL)
 GROUP  BY CITY;
 
 /** THIRD FROM LAST**/
 SELECT first_name, last_name, team, quiz_points
 FROM participant
 ORDER BY QUIZ_POINTS 
 LIMIT 1 OFFSET 2;
 
 
 
 

 