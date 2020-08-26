/*
Aggregate Functions in SQL

1) COUNT

Counting all rows
*/

select count(*) from orders;

--Counting individual columns

select count(distinct order_num) from orders;

--Counting non-numerical columns

select count(ordered_on) as 'no of dates' from orders;

--2) SUM

select SUM(total_price) from orders;

select SUM(quantity) from orders where user_id=1;

--3)MIN/MAX

select MIN(total_price) as 'min_price' from orders;

select MAX(total_price) as 'min_price' from orders;

select MIN(total_price) as 'min_price',
MAX(total_price) as 'max_price' 
from orders where order_num=1001;

--4)AVG

select AVG(total_price) as 'avg_price' from orders;

