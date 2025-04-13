SHOW DATABASES;
USE EMPLOYEE;
SHOW TABLES;
DROP TABLE WORKER;
CREATE TABLE WORKER(
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO WORKER (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES  
(1, 'Monika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2020-02-14 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2020-02-14 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2011-06-14 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2011-06-14 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2020-01-14 09:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2011-04-14 09:00:00', 'Admin')
;

SELECT * FROM WORKER;
DROP TABLE BONUS;
CREATE TABLE BONUS(
WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
    REFERENCES WORKER (WORKER_ID)
    ON DELETE CASCADE
    );
    
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 -- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;

-- Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(FIRST_NAME) AS WORKER_NAME FROM WORKER;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT(DEPARTMENT) AS UNOQUE_DEPT FROM WORKER;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT SUBSTRING(FIRST_NAME,1,3) AS FIRST_3 FROM WORKER;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(FIRST_NAME,'b') from WORKER WHERE FIRST_NAME = 'Amitabh'; 
SELECT INSTR('Abhishek Singh Malviya','M') ;

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(FIRST_NAME) AS FIRST_NAME FROM WORKER;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(DEPARTMENT) FROM WORKER;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT(DEPARTMENT),LENGTH(DEPARTMENT) FROM WORKER;

-- Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME,'a','A') as new_name from worker ;
SELECT REPLACE(abhishek,'a','b') as new_name ;
-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.  
SELECT CONCAT(FIRST_NAME," ",LAST_NAME) AS COMPLETE_NAME FROM WORKER;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT *FROM WORKER ORDER BY FIRST_NAME;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM WORKER ORDER BY FIRST_NAME,DEPARTMENT DESC;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME IN ('Vipul','Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ('Vipul','Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * FROM WORKER WHERE DEPARTMENT = 'Admin';
select * from worker where department in ('Admin');

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE "%A%";-- NOT CASE SENSITIVE

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE "%A";

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE "______H";

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM WORKER WHERE SALARY BETWEEN 10000 AND 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM WORKER WHERE YEAR(JOINING_DATE) = '2014' AND MONTH(JOINING_DATE) = '02';

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(*) FROM WORKER WHERE DEPARTMENT = 'Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT *,CONCAT(FIRST_NAME," ",LAST_NAME) AS FULL_NAME FROM WORKER WHERE (SALARY >= 50000) & (SALARY <= 100000);
SELECT  *,CONCAT(FIRST_NAME," ",LAST_NAME) AS FULL_NAME FROM WORKER WHERE SALARY BETWEEN 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT ,COUNT(worker_id) AS WORKER_IN_DEPT FROM WORKER GROUP BY DEPARTMENT ORDER BY WORKER_IN_DEPT DESC;
SELECT DEPARTMENT,COUNT(WORKER_ID) AS WORKER_IN_DEPT FROM WORKER GROUP BY DEPARTMENT ORDER BY WORKER_IN_DEPT DESC;
select* from worker;
-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT w.* FROM WORKER AS W INNER JOIN TITLE AS T ON W.WORKER_ID = T.WORKER_REF_ID WHERE T.WORKER_TITLE = 'Manager';
SELECT W.* FROM WORKER AS W INNER JOIN TITLE AS T ON W.WORKER_ID = T.WORKER_REF_ID WHERE T.WORKER_TITLE = 'Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT WORKER_TITLE,COUNT(*) AS NO_OF_WORKER_IN_TITLES FROM TITLE GROUP BY WORKER_TITLE HAVING NO_OF_WORKER_IN_TITLES>1;
SELECT WORKER_TITLE , COUNT(*) AS NO_OF_WORKER_IN_TITLES FROM TITLE GROUP BY WORKER_TITLE HAVING NO_OF_WORKER_IN_TITLES > 1;

-- Q-26. SUM OF SALARIES GIVEN TO DIFFERENT TITLES.
 

SELECT T.WORKER_TITLE , SUM(W.SALARY) AS TITLE_SALARY
FROM WORKER W INNER JOIN TITLE T ON W.WORKER_ID = T.WORKER_REF_ID
GROUP BY T.WORKER_TITLE
ORDER BY TITLE_SALARY DESC
LIMIT 1 offset 3 ;

-- Q-27. FIND UNIQUE WORKER NAME
SELECT W.FIRST_NAME,COUNT(*) AS UNIQ FROM WORKER AS W INNER JOIN TITLE AS T ON W.WORKER_ID = T.WORKER_REF_ID
GROUP BY W.FIRST_NAME 
HAVING COUNT(*) = 1;

SELECT FIRST_NAME , COUNT(*) AS UNIQ FROM WORKER GROUP BY FIRST_NAME HAVING COUNT(*) = 1;

-- Q-28. Write an SQL query to show only odd rows from a table.
SELECT * FROM WORKER WHERE MOD(WORKER_ID,2) !=0 ;

 -- Q-29. Write an SQL query to show only even rows from a table.
 SELECT * FROM WORKER WHERE MOD(WORKER_ID , 2) = 0;
 
 -- Q-28. Write an SQL query to clone a new table from another table.
 CREATE TABLE CLONE_WORKER LIKE WORKER;
 INSERT INTO CLONE_WORKER SELECT * FROM WORKER;
 SELECT* FROM CLONE_WORKER;
 
 -- Q-29. Write an SQL query to fetch intersecting records of two tables.
 SELECT WORKER.* FROM WORKER INNER JOIN CLONE_WORKER USING(WORKER_ID);
 
 -- Q-31. Write an SQL query to show the current date and time.
 SELECT CURDATE();
 SELECT DATE(CURRENT_TIMESTAMP());
 
 SELECT TIME(NOW());
 
 -- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
 SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 5;
 
 
 -- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
 SELECT * FROM WORKER  ORDER BY SALARY DESC LIMIT 4,1;
 SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 5;
 
 -- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
  SELECT * FROM WORKER W1 WHERE 4 =(SELECT COUNT(DISTINCT (W2.SALARY)) FROM WORKER W2 
 WHERE W2.SALARY >= W1.SALARY);
 
 SELECT * FROM WORKER W1 WHERE SALARY = (SELECT SALARY FROM WORKER ORDER BY SALARY DESC LIMIT 4,1 );
 SELECT SALARY FROM WORKER ORDER BY SALARY DESC LIMIT 5;
 
 
  
  
 -- Q-35. Write an SQL query to fetch the list of employees with the same salary.
 SELECT W1.* FROM WORKER W1,WORKER W2 
 WHERE W1.SALARY = W2.SALARY AND W1.WORKER_ID != W2.WORKER_ID;
 
 SELECT W1.* FROM WORKER W1 CROSS JOIN WORKER W2;
SELECT W1.* FROM WORKER W1,WORKER W2;

 -- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
 SELECT MAX(SALARY) AS MAX_SAL FROM WORKER 
 WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM WORKER);
 
 SELECT * FROM WORKER W1 WHERE 2 = (SELECT COUNT(DISTINCT (W2.SALARY)) FROM WORKER W2 WHERE W2.SALARY >= W1.SALARY);
 
 -- Q-37. Write an SQL query to show one row twice in results from a table.
select * from worker
UNION ALL
select * from worker ORDER BY worker_id;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
select worker_id from worker where worker_id not in (select worker_ref_id from bonus);
SELECT * FROM BONUS;

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM WORKER WHERE WORKER_ID <= (SELECT COUNT(WORKER_ID/2 FROM WORKER);
select * from worker where worker_id <= (select count(worker_id)/2 from worker);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
select department, count(department) as depCount from worker group by department having depCount < 4;

-- Q-41. 
SELECT client.a, client.b FROM customer AS client;
/*--  The SQL clause GROUP BY 1 is a shorthand way of grouping by the first column in the SELECT statement.
Explanation:
In GROUP BY 1, the 1 refers to the first column in the SELECT clause, not a column named 1.

Instead of specifying a column name, it uses the position (index) of the column in the SELECT list. 
The clause ORDER BY 1 is a shorthand way of sorting results based on the first column in the SELECT statement.*/

/*ANY_VALUE() in SQL
The function ANY_VALUE() is used in SQL to return an arbitrary value from a group of rows when using GROUP BY without requiring that column to be part of an aggregate function.
Why Use ANY_VALUE()?
Normally, when using GROUP BY, all columns in the SELECT clause must either be:Aggregated (e.g., SUM(), COUNT(), AVG(), etc.), or
Included in the GROUP BY clause`.
If you try to select a non-aggregated column without including it in GROUP BY, MySQL (and some databases) will throw an error.
ANY_VALUE() tells SQL to return any arbitrary value for that column without aggregation.

SELECT customer_id, ANY_VALUE(order_date)  
FROM orders  
GROUP BY customer_id;
*/

/*The RAND() function generates a random floating-point number between 0 and 1. It is commonly used when selecting random rows from a table or generating random values.*/
SELECT * FROM customer AS clients;
SELECT * FROM customer clients;

SELECT * FROM customer1, customer2;
SELECT * FROM c1, c2, customer1, customer2;

/*What This Query Does
This query performs a Cartesian Join (also called a Cross Join) between customer1 and customer2.
It will return every combination of rows from both tables.
If customer1 has 10 rows and customer2 has 20 rows, the result will have 10 × 20 = 200 rows.This performs a Cartesian Join (Cross Join) between four tables: c1, c2, customer1, and customer2.*/

/*The FOUND_ROWS() function is used in MySQL to get the number of rows returned by the previous query without the LIMIT clause affecting the count.
SELECT SQL_CALC_FOUND_ROWS * FROM customers LIMIT 10;
SELECT FOUND_ROWS();
 How it works:
The SQL_CALC_FOUND_ROWS option tells MySQL to calculate the total number of rows before applying LIMIT 10.
The second query SELECT FOUND_ROWS(); retrieves the total row count that would have been returned without LIMIT.*/
SELECT SQL_CALC_FOUND_ROWS * FROM customers LIMIT 10;
SELECT FOUND_ROWS();
SELECT country, COUNT(customer_id) AS total_customers
FROM customers
WHERE status = 'active'
GROUP BY country;
/*How It Works:
WHERE status = 'active' → Filters out inactive customers before grouping.
GROUP BY country → Groups remaining customers by country.
COUNT(customer_id) → Counts customers in each group.*/