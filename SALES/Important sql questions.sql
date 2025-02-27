

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
 SELECT MAX(PROFIT) AS MAXIMUM_PRO_FURNI From  SAMPLESTORE
 WHERE CATEGORY = 'Furniture';
 
 SELECT format(CATEGORY,4) FROM SAMPLESTORE;
 
 SELECT `ORDER ID`,MID(`ORDER ID`,9,14) AS ORDER_NUM , `Order Date`, NOW() AS PRESENT_TIME
 FROM SAMPLESTORE;
 
 /** count of distinct UNOQUE records **/
 select COUNT(`Order ID`) AS ORIGNAL ,COUNT(distinct(`Order ID`)) AS CNT_UNIQUE FROM SAMPLESTORE;
 
 /**DUPLICATE RECORDDS **/
 SELECT * FROM SAMPLESTORE;
 SELECT `City` FROM SAMPLESTORE
 GROUP BY `City` having count(*)=1;
 
 SELECT column1, column2, COUNT(*)
FROM table_name
GROUP BY column1, column2
HAVING COUNT(*) > 1;

 --  identify duplicate records in a table based on specific columns where both cust and order id same--
SELECT `Customer ID`, `Order ID`, COUNT(*) AS Duplicate_Count
FROM SAMPLESTORE
GROUP BY `Customer ID`,`Order ID`
HAVING COUNT(*) > 1;

-- return only one record per duplicate group, --
DELETE FROM SAMPLESTORE WHERE (`Customer ID` ,`Order ID`) IN (
SELECT `Customer ID`, `Order ID`, COUNT(*) AS Duplicate_Count
FROM SAMPLESTORE
GROUP BY `Customer ID`,`Order ID`
HAVING COUNT(*) > 1);
SELECT `Customer ID`, `Order ID`, MAX(`Row ID`) AS Latest_Order
FROM SAMPLESTORE
GROUP BY `Customer ID`, `Order ID`;

-- ELIMINATE DUPLICATE--
DELETE FROM samplestore WHERE`Customer ID` NOT IN 
(
SELECT `Customer ID` FROM 
(
SELECT MIN(`Customer ID`) as Uniq FROM samplestore GROUP BY `Customer Name`) as dist
);
 
 
 
 SELECT `CATEGORY` FROM SAMPLESTORE
 GROUP BY `CATEGORY` having sum(Quantity) > 2;
 select * from samplestore;
 SELECT  `CUSTOMER ID`,`CUSTOMER NAME`,COUNT(*) AS CNT FROM SAMPLESTORE GROUP BY `CUSTOMER ID`,`CUSTOMER NAME`;
 

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

USE GEEKS;
SHOW TABLES;
SELECT * FROM SAMPLESTORE;

-- Step 1: Generate the last 7 days from the fixed date
WITH DateRange AS (
    SELECT DATE_sub('2016-01-07',INTERVAL n DAY) AS OrderDate
    FROM (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL 
          SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6) AS Numbers
)
-- Step 2: Calculate daily revenue
SELECT 
    d.OrderDate,
    COALESCE(SUM(o.Sales), 0) AS TotalRevenue
FROM 
    DateRange d
LEFT JOIN 
    SAMPLESTORE o ON d.OrderDate = o.`Order Date`
GROUP BY 
    d.OrderDate
ORDER BY 
    d.OrderDate DESC;
    

/** CTE **/
use geeks;
select * from samplestore;
WITH CUST_COR AS (SELECT * FROM SAMPLESTORE WHERE SEGMENT = 'Corporate')
SELECT `Order ID`,`City` from CUST_COR WHERE SALES > '200' ORDER  BY SALES;