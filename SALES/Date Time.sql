SELECT year(NOW());
SELECT NOW();
SELECT CURRENT_TIMESTAMP();
SELECT TIMESTAMPDIFF(month, '2024-01-22', '2024-03-01') AS MonthsDifference;
SELECT TIMESTAMPADD(year, 5, '2024-03-01') AS Monthsadd;

SELECT str_to_date("feb 25 2020 04:50 PM","%b %d %Y %h:%i%p");
SELECT DATE_SUB('2020-02-25', INTERVAL 7 DAY) AS res_date;
SELECT DATE_ADD(DATE_ADD(DATE_ADD('2020-02-25 10:00:00', INTERVAL 7 DAY ),INTERVAL 12 HOUR),INTERVAL 5 MINUTE) AS new_date;
SELECT DATE_FORMAT("2020-02-25"," %d %b %Y %W %w");
SELECT DATEDIFF('2020-04-01', '2020-01-01') AS daysDifference;
SELECT DATE_ADD('2024-03-01', INTERVAL DATEDIFF('2024-04-01', '2024-03-01') DAY) AS NewDate;
       
SELECT DATE(CURRENT_TIMESTAMP()); # EXTRACT DATE
SELECT MINUTE('2024-11-25 21:20:43');
SELECT year(CURRENT_TIMESTAMP());

use employee;
select * from worker;
 /*List employees who have been with the company for more than 5 years*/
SELECT WORKER_id, joining_date
FROM WORKER
WHERE joining_date >= YEAR(current_timestamp()) - 5;
 