SELECT year(NOW());
SELECT NOW();
SELECT CURRENT_TIMESTAMP();

-- Calculate the number of months between two dates
SELECT TIMESTAMPDIFF(day, '2024-01-22', '2024-03-01') AS MonthsDifference;
SELECT DATEDIFF('2020-04-01', '2020-01-01') AS daysDifference;
SELECT DATE_SUB('2020-02-25', INTERVAL 7 DAY) AS res_date;

-- adding date to given date
SELECT TIMESTAMPADD(year, 5, '2024-03-01') AS Monthsadd;
SELECT DATE_ADD('2024-03-01', INTERVAL DATEDIFF('2024-04-01', '2024-03-01') DAY) AS NewDate;
SELECT DATE_ADD(DATE_ADD(DATE_ADD('2020-02-25 10:00:00', INTERVAL 7 DAY ),INTERVAL 12 HOUR),INTERVAL 5 MINUTE) AS new_date;



/** formats the date 2020-02-25 into a readable string using specific format codes.
Breakdown of SQL format:
%d → Day of the month (2 digits): 25
%b → Abbreviated month name: Feb
%Y → 4-digit year: 2020
%W → Full weekday name: Tuesday
%w → Numeric weekday (0=Sunday, 6=Saturday): 2 **/
SELECT DATE_FORMAT("2020-02-25"," %d %b %Y %W %w");
SELECT str_to_date("feb 25 2020 04:50 PM","%b %d %Y %h:%i%p");
/*parses the string "feb 25 2020 04:50 PM" into a proper DATETIME format using the given format string:
Format breakdown:
%b → Abbreviated month name (e.g., Feb)
%d → Day of the month (25)
%Y → Four-digit year (2020)
%h → Hour (01..12) in 12-hour format (04)
%i → Minutes (50)
%p → AM or PM (PM)**/

       
SELECT DATE(CURRENT_TIMESTAMP()); # EXTRACT DATE
SELECT MINUTE('2024-11-25 21:20:43');
SELECT year(CURRENT_TIMESTAMP());

use employee;
select * from worker;
 /*List employees who have been with the company for more than 5 years*/
SELECT WORKER_id, joining_date
FROM WORKER
WHERE joining_date >= YEAR(current_timestamp()) - 5;
 