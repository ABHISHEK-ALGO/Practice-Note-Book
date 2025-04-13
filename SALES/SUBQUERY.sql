use CAMPUSX;
show tables;
select* from employee_db;

/*Suppose you need to determine the count of managers and the total team strength excluding them in the retail domain in MySQL*/
SELECT M.DEPT , COUNT(DISTINCT M.EMP) AS MANAGER_COUNT,
(SELECT COUNT(DISTINCT E.EMP) FROM employee_db E
WHERE E.ROLE NOT IN ('MANAGER','CEO','PRESIDENT') AND E.DEPT IN ('RETAIL')) AS `TEAM_STRENGTH`
FROM employee_db M WHERE M.ROLE  IN ('MANAGER') AND M.DEPT = "RETAIL";

/** Suppose you need to determine the list of upcoming projects with no 
manager and team member assigned to them in MySQL**/
use campusx;
SELECT p.PROJ_ID, p.PROJ_NAME, p.DOMAIN
FROM PROJ_RECORDS p
WHERE p.PROJ_ID NOT IN (
SELECT DISTINCT a.PROJ_ID
FROM PROJ_ASSIGN a
 ) AND p.STATUS IN ("YTS");
 

/**Comparison operators can be used to compare a single value 
returned by a subquery with the expression in the WHERE clause.Suppose you need to determine the employee with the highest 
experience in the organization in MySQL.**/
SELECT E.EMP_ID , CONCAT('FIRST_NAME',' ','LAST_NAME') AS FULL_NAME , E.ROLE , E.DEPT ,E.EXP
FROM HR_EMP_TABLE E WHERE E.EXP = (SELECT MAX(EXP) FROM HR_EMP_TABLE);


/**A subquery that returns more than one value can be used 
with IN or NOT IN operators in the WHERE clause.Suppose you need to determine the list of all managers who have not 
been assigned to any projects in the organization in MySQL.**/
SELECT 
e.EMP_ID, e.FIRST_NAME, e.LAST_NAME, e.ROLE, e.DEPT
FROM HR_EMP_TABLE e
WHERE e.EMP_ID NOT IN (
SELECT DISTINCT a.EMP_ID FROM PROJ_ASSIGN a
 ) AND e.ROLE IN ("MANAGER");
