-- Sql Sub queries

--Get the names of user and his mobile number for the person who has placed order

--using subquery
select username,mobilenum from user u where exists (select user_id from orders o where o.user_id =u.id);

--using joins
select username,mobilenum from user u inner join orders o on o.user_id = u.id group by username;

--Get the names of user and his mobile number for the person who has purchased any particular item 

--using subquery
select username,mobilenum from user u where exists (select user_id from orders o where o.user_id =u.id and o.product_id in (select id from books b where b.title='Sleeping Beauties'));

--using joins and subquery
select username,mobilenum from user u where id in (select user_id from orders o inner join books on o.product_id=books.id where books.id=46 group by user_id);

--Get the names of user and his mobile number for the person who has not placed order

select username,mobilenum from user u where not exists (select user_id from orders o where o.user_id =u.id);

-- Query to get how many users present on a particular day

select distinct(user_name),datetime from logdata where EXISTS (select distinct(user_name) from logdata where datetime='2019-09-18' or datetime='2019-09-19' or datetime='2019-09-20');

