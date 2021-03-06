--SQL Transactions

--A transaction is an atomic unit of database operations against the data in one or more databases. The effects of all the SQL statements in a transaction can be either all committed to the database or all rolled back.

START TRANSACTION;
 insert into demo(id,name) values(1,'shaik');
insert into demo(id,name) values(2,'sss');
select * from demo;

--When we try to see the data in demo table from another connection the data will not be available because we have not committed yet.

commit;

--if we check after commit the data will be available from any connection.
--.........................................................................................................................................................................................................................................................................................................................................................

START TRANSACTION;
insert into demo(id,name) values(3,'asdf');
insert into demo(id,name) values(4,'abcd');
 select * from demo;
+----+-------+
| id | name  |
+----+-------+
|  1 | shaik |
|  2 | sss   |
|  3 | asdf  |
|  4 | abcd  |
+----+-------+

 ROLLBACK;
 select * from demo;
+----+-------+
| id | name  |
+----+-------+
|  1 | shaik |
|  2 | sss   |
+----+-------+

--....................................................................................................................................................................................................................................................

--SQL TABLES LOCK

--1) Read lock

LOCK TABLES demo READ;
select * from demo;          //working

insert into demo(id,name) values(4,'abcd');     //not working
--ERROR 1099 (HY000): Table 'demo' was locked with a READ lock and can't be updated

--TO unlock

--UNLOCK tables;

--2)Write lock

LOCK TABLES demo WRITE;
insert into demo(id,name) values(3,'asdf');  //working

UNLOCK tables;