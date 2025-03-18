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
 
 SELECT `ORDER ID`,SUBSTR(`ORDER ID`,9,14) AS ORDER_NUM , `Order Date`, NOW() AS PRESENT_TIME
 FROM SAMPLESTORE;
  SELECT `ORDER ID`,MID(`ORDER ID`,9,14) AS ORDER_NUM , `Order Date`, NOW() AS PRESENT_TIME
 FROM SAMPLESTORE;
 
 /** count of distinct UNOQUE records in transac table tran id ae uniue while distinct customer can be there **/
 select COUNT(`Order ID`) AS ORIGNAL ,COUNT(distinct(`Order ID`)) AS CNT_UNIQUE FROM SAMPLESTORE;
  SELECT COUNT(`ORDER ID`) AS ORIGINAL , COUNT(DISTINCT(`ORDER ID`)) AS UNIQ FROM SAMPLESTORE ;
  
 /**DUPLICATE RECORDDS **/
 SELECT * FROM SAMPLESTORE; 
 SELECT `City` FROM SAMPLESTORE
 GROUP BY `City` having count(*)>1;
 
 --  identify duplicate records in a table based on specific columns where both cust and order id same--
SELECT `Customer ID`, `Order ID`, COUNT(*) AS Duplicate_Count
FROM SAMPLESTORE
GROUP BY `Customer ID`,`Order ID`
HAVING COUNT(*) > 1;
SELECT `CUSTOMER ID`,`ORDER ID`,COUNT(*) AS DUPLICATE_COUNT FROM SAMPLESTORE
GROUP BY `Customer ID`,`ORDER ID`
HAVING COUNT(*) > 1;

-- return only one record per duplicate group, --
SELECT `Customer ID`, `Order ID`, COUNT(*) AS Duplicate_Count
FROM SAMPLESTORE
GROUP BY `Customer ID`,`Order ID`
HAVING COUNT(*) = 1;

 

-- ELIMINATE DUPLICATE--
DELETE FROM samplestore WHERE`Customer ID` NOT IN 
(
SELECT `Customer ID` FROM 
(
SELECT MIN(`Customer ID`) as Uniq FROM samplestore GROUP BY `Customer Name`) as dist
);
 
DELETE t1 FROM samplestore t1
JOIN (
    SELECT `Customer ID`, MIN(id) AS keep_id
    FROM samplestore
    GROUP BY `Customer ID`
) t2 
ON t1.`Customer ID` = t2.`Customer ID` 
AND t1.id > t2.keep_id;



 
 
 SELECT `CATEGORY` FROM SAMPLESTORE
 GROUP BY `CATEGORY` having sum(Quantity) > 2;
 select * from samplestore;
 SELECT  `CUSTOMER ID`,`CUSTOMER NAME`,COUNT(*) AS CNT FROM SAMPLESTORE GROUP BY `CUSTOMER ID`,`CUSTOMER NAME`;
 

 