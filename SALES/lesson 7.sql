CREATE DATABASE SALES;
USE SALES;
CREATE TABLE SAL (
order_no INT ,
c_id INT,	
c_name VARCHAR(100),
s_code INT,
p_name varchar(100),
qty int ,
price int);

CREATE TABLE CUSTOMERS (
c_id INT,
c_name VARCHAR(100),
c_location VARCHAR (100),
c_phonenumber varchar(20)
);
create table PRODUCTS(p_code INT,
p_name VARCHAR (100),
price INT,
stock INT,
category VARCHAR (100));
SHOW TABLES;
SELECT * FROM products;
SELECT * FROM SALES_DATASETS;
SELECT * FROM customer_datasets;

/** find the name of the CUSTOMER with the highest price in each
 REGION**/

SELECT C.C_LOCATION, S.P_NAME,S.Price
FROM SALES_DATASETS S
JOIN
CUSTOMER_DATASETS C ON S.C_ID = C.C_ID
WHERE (C.C_LOCATION,S.PRICE)
IN (
 SELECT C.C_LOCATION, MAX(S.Price)
 FROM
 SALES_DATASETS S
 JOIN
 CUSTOMER_DATASETS C ON S.C_id = C.C_id
 GROUP BY C.C_LOCATION
 );

use geeks;
show tables;
SELECT * FROM SAMPLESTORE;
/** WILDCARDS **/
SELECT * FROM SAMPLESTORE WHERE `SHIP DATE`  LIKE "%-11-%" ; /**ESCAPE TO TREAT WILDCARDS AS LITERALS**/

/**  calculate the total transaction amount for each customer for
 the current year. The output should contain Customer_Name and the total amount.**/
 SELECT `Customer Name`, SUM(`Sales`) as TOTAL_SALES
 FROM SAMPLESTORE 
 WHERE YEAR(`Order Date`)=YEAR(CURDATE())-8
 GROUP BY `Customer Name`;
 
 use geeks;
 SELECT * FROM SAMPLESTORE;
 
 /** MOM sales **/
WITH MonthlySales AS (SELECT  date_format(`Order Date`,'%Y-%m') as MONTH, SUM(Sales) AS TOTAL_SALES
FROM SAMPLESTORE GROUP BY DATE_FORMAT(`Order Date`,'%Y-%m')
),
SalesWithChange AS (SELECT Month, Total_Sales,
LAG(Total_Sales) OVER (ORDER BY Month) AS Previous_Sales
FROM MonthlySales)
SELECT Month, Total_Sales,
(CASE
	WHEN Previous_Sales IS NOT NULL 
    THEN 
		((Total_Sales - Previous_Sales) / Previous_Sales) * 100
ELSE NULL
END) AS MoM_Change
FROM SalesWithChange;

/** cum sales by product name **/

SELECT `PRODUCT NAME` , SUM(SALES) OVER (PARTITION BY `PRODUCT NAME` ORDER BY `ORDER DATE`  ) AS CUMM_SALES
FROM SAMPLESTORE ;

SELECT `PRODUCT NAME` , SUM(SALES) AS TOTAL_SALES FROM SAMPLESTORE 
group by `PRODUCT NAME` ORDER BY TOTAL_SALES;



/** calculate yearly growth in sales **/
WITH YEARLY_SALES AS (SELECT EXTRACT(YEAR FROM `ORDER DATE`) AS YEAR ,
SUM(SALES) AS TOTAL_SALES FROM SAMPLESTORE
GROUP BY EXTRACT(YEAR FROM `ORDER DATE`)
)
SELECT YEAR,TOTAL_SALES,LAG(TOTAL_SALES) OVER (ORDER BY YEAR) AS PREVIOUS_YEAR_SALES,
((TOTAL_SALES - LAG(TOTAL_SALES) OVER (ORDER BY YEAR))/LAG(TOTAL_SALES) OVER (ORDER BY YEAR))* 100 AS 
SALES_GROWTH 
FROM YEARLY_SALES;

/** find the most recent sale for each product **/
SELECT * FROM SAMPLESTORE;
SELECT `PRODUCT NAME` ,MAX(`ORDER DATE`) AS RECENT_ORDER FROM SAMPLESTORE 
GROUP BY `PRODUCT NAME`;

/** Calculate Moving Average FOR EVERY 3 MONTHS **/
SELECT * FROM SAMPLESTORE;
SELECT `ORDER DATE` , SALES , AVG(SALES) OVER (ORDER BY `ORDER DATE` ROWS BETWEEN 2 preceding AND CURRENT ROW ) AS MOVING_AVERAGE
FROM SAMPLESTORE;

/** Calculate the Difference Between Current and Previous Rows **/
SELECT * FROM SAMPLESTORE;
SELECT `ORDER ID` , SALES , SALES - LAG(SALES) OVER (ORDER BY `ORDER ID`) AS DIFFERENCE
FROM SAMPLESTORE;