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
/**  calculate the total transaction amount for each customer for
 the current year. The output should contain Customer_Name and the total amount.**/
 SELECT `Customer Name`, SUM(`Sales`) as TOTAL_SALES
 FROM SAMPLESTORE 
 WHERE YEAR(`Order Date`)=YEAR(CURDATE())-8
 GROUP BY `Customer Name`;