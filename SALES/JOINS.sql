SHOW DATABASES;
USE CAMPUSX;
SHOW TABLES;
SELECT*FROM HR_EMP_TABLE;
SELECT*FROM PROJ_ASSIGN;

-- MANAGERS HAVING MORE THAN 2 REPORTEE-- 
SELECT M.FIRST_NAME
FROM HR_EMP_TABLE M 
INNER JOIN HR_EMP_TABLE E
ON E.`MANAGER ID` = M.`EMP_ID`
GROUP BY M.`MANAGER ID`, M.FIRST_NAME
HAVING COUNT(E.EMP_ID) >=2;

/*EMP ASSIGNED TO PROJECT FROM HEAELTHCARE DEPARTMENT*/
SELECT E.EMP_ID,P.PROJ_ID,E.FIRST_NAME,E.DEPT FROM HR_EMP_TABLE E
INNER JOIN PROJ_ASSIGN P ON E.EMP_ID = P.EMP_ID
WHERE DEPT IN ('HEALTHCARE');

/* Your manager wants the details of the ongoing projects along with the  number of employees working on them.
A LEFT JOIN returns all records from the left table, and matching records from the right table. If there is no match, NULLs are returned.

Use Cases of LEFT JOIN
✅ Finding unmatched data (e.g., users who haven’t registered)
✅ Retrieving all data from one table, even if there's no match in the second
✅ Handling optional relationships (e.g., customers who haven’t made a purchase)*/
SELECT * FROM PROJ_RECORDS;
SELECT * FROM PROJ_ASSIGN;
SELECT P.PROJ_ID,R.PROJ_NAME, R.STATUS , R.DOMAIN,COUNT(EMP_ID) AS NO_OF_EMPL FROM PROJ_RECORDS R
LEFT JOIN PROJ_ASSIGN P USING (PROJ_ID)
GROUP BY PROJ_ID,R.PROJ_NAME, R.STATUS , R.DOMAIN ;


/* Your manager wants the details of each employee along with the 
number of projects assigned to them*/
SELECT E.EMP_ID,E.FIRST_NAME, E.DEPT,E.ROLE , COUNT(DISTINCT P.PROJ_ID) AS `PROJ_COUNT`
FROM PROJ_ASSIGN P
RIGHT JOIN HR_EMP_TABLE E ON E.EMP_ID = P.EMP_ID
WHERE E.ROLE NOT IN ("MANAGER","PRESIDENT","CEO")
GROUP BY E.EMP_ID,E.FIRST_NAME, E.DEPT,E.ROLE
ORDER BY PROJ_COUNT;

/* Your manager wants you to identify the number of employees 
reporting to each manager including the President and the CEO.
An INNER JOIN returns only the matching rows between two tables based on the given condition.

Use Cases of INNER JOIN
✅ Retrieving only matching records
✅ Ensuring data integrity by excluding unmatched records
✅ When you only care about linked data and not missing values

*/
SELECT M.FIRST_NAME AS MANAGER, M.EMP_ID AS MANAGER_ID,COUNT(R.EMP_ID) AS REPORTING_EMP_COUNT , M.ROLE AS ROLE_
FROM HR_EMP_TABLE M
INNER JOIN HR_EMP_TABLE R
ON M.EMP_ID = R.EMP_ID
AND R.EMP_ID != M.`MANAGER ID`
WHERE M.ROLE IN ("MANAGER","PRESIDENT","CEO")
GROUP BY MANAGER,MANAGER_ID,ROLE_
ORDER BY M.EMP_ID;

/**SELF JOIN TO COMPARE WITHIN DIFFERENT ROWS OF SAME TABLE FIND CUST ID WHERE ORDER VALUE GREATER THAN PREVIOUSA 
SELF JOIN is a join where a table is joined with itself. It is used when we need to compare rows within the same table.

Use Cases of SELF JOIN
✅ Finding hierarchical relationships (e.g., employees and managers in the same table)
✅ Finding duplicate or related records
✅ Comparing values within the same table**/
SELECT * FROM SWIGGY_SALES;
SELECT S1.CUSTOMER_ID,S1.ORDER_DATE,S1.ORDER_VALUE
FROM SWIGGY_SALES S1
LEFT JOIN SWIGGY_SALES S2
ON S2.ORDER_DATE = DATE_SUB(S1.ORDER_DATE ,INTERVAL 1 DAY)
WHERE S1.ORDER_VALUE > S2.ORDER_VALUE
ORDER BY ORDER_DATE; 

-- PERCENTAGE OF ORDERS BY CUSTOMERS-- 
use geeks;
WITH TOTALORDERS AS (SELECT COUNT(`ORDER ID`) AS TOTAL_ORDERS FROM SAMPLESTORE)
SELECT S.`CUSTOMER ID`, ROUND((COUNT(`ORDER ID`)/(T.TOTAL_ORDERS)*100),2) AS percentage
FROM SAMPLESTORE S 
CROSS JOIN TOTALORDERS T
GROUP BY S.`CUSTOMER ID`,T.TOTAL_ORDERS;
 /**A CROSS JOIN produces the Cartesian product of two tables, meaning every row from the first table is paired with every row from the second table.
 To Generate All Possible Combinations:
Used when you need every row from one table paired with every row from another.
To Combine with Aggregation:
As in your problem, CROSS JOIN helps us get the total number of users without needing a JOIN condition.*/




