use sales;
select * from transactions;
select * from customers;
-- find deyails of customers who have transacted during dinner time --  
SELECT c.*
FROM customers c
JOIN transactions t ON c.customerid = t.customerid
WHERE time(t.transactiondate) BETWEEN '19:00:00' AND '22:00:00';

SELECT c.*
FROM customers c
JOIN transactions t ON c.customerid = t.customerid
WHERE TIME(STR_TO_DATE(t.transactiondate, '%Y-%m-%d %H:%i:%s')) 
      BETWEEN '19:00:00' AND '22:00:00';


-- To calculate the total commission for all transactions. 
SELECT SUM(t.amount * c.commission_rate / 100) AS total_commission
FROM transactions t
JOIN customers cu ON t.customer_id = cu.id
JOIN country c ON cu.country_id = c.id;worker

USE SALES;
SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS;
SELECT * FROM TRANSACTIONS;

-- FIND DETAILS OF CUSTOMERS TRANSACTED BETWEEN DINNER TIME 8-11--
SELECT C.*
FROM CUSTOMERS C 
INNER JOIN TRANSACTIONS T ON C.`CUSTOMERID` = T.`CUSTOMERID`
WHERE TIME(T.TRANSACTIONDATE) BETWEEN '20:00:00' AND '23:00:00';

SELECT TIMESTAMPDIFF(HOUR, STR_TO_DATE(order_date, '%Y-%m-%d %H:%i:%s'), NOW()) AS hours_difference
FROM orders;



-- FIND TOTAL sale of a product BY PRODUCT ID,who purchased it CUSTOMERID in REGIEN TOP
SELECT SUM(T.QUANTITY * T.PRICE) AS TOTAL_PRODUCT_SALE,P.PRODUCTID,CU.CUSTOMERNAME,CU.REGION
FROM TRANSACTIONS T
INNER JOIN PRODUCTS P ON T.PRODUCTID = P.PRODUCTID
INNER JOIN CUSTOMERS CU ON T.CUSTOMERID = CU.CUSTOMERID
WHERE CU.REGION = "South America"
GROUP BY P.PRODUCTID,CU.CUSTOMERNAME,CU.REGION
ORDER BY TOTAL_PRODUCT_SALE DESC
LIMIT 2,1;

-- customer not made transactioins
SELECT c.*
FROM customers c
LEFT JOIN transactions t ON c.customerid = t.customerid
WHERE t.transactionid IS NULL;

-- frequent customer in recent last 6 months 
SELECT customerid
FROM transactions
GROUP BY customerid
HAVING COUNT(DISTINCT MONTH(STR_TO_DATE(transactiondate, '%Y-%m-%d %H:%i:%s'))) = 6;

SELECT DISTINCT CUSTOMERID
FROM TRANSACTIONS
WHERE STR_TO_DATE(TRANSACTIONDATE,'%Y-%m-%d %H:%i:%s') >= DATE_SUB('2024-10-14',INTERVAL 6 MONTH);

select count(DISTINCT MONTH(STR_TO_DATE(transactiondate, '%Y-%m-%d %H:%i:%s'))) from transactions;
