CREATE DATABASE SALES;
USE SALES;
CREATE TABLE SALE (
ORDER_DATE date ,
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


