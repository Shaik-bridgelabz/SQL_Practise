/*
Database table Partitioning in SQL

What is a database table partitioning?

Partitioning is the database process where very large tables are divided into multiple smaller parts.
The main purpose of partitioning is to maintain large tables and to reduce the overall response time 
to read and load data for particular SQL operations.

There are two types of partitioning:
1. Vertical Partitioning
2. Horizontal Partitioning

Vertical Partitioning:
Vertical table partitioning is mostly used to increase SQL Server performance especially in cases
where a query retrieves all columns from a table. In this case to reduce access times the 
BLOB columns can be split to its own table. 
Vertical partitioning splits a table into two or more tables containing different columns:

Student_master                            Student_detail
Student_id                                Student_id
Student_name                              Documents_image
Address
Email 
Documents_image

In above two tables. One is Student_master which contain unique studentid, studentname, address and email
and here created another Student_detail table because one student have multiple documents images so that 
use vertical partitioning.

Horizontal Partitioning:
Horizontal partitioning divides a table into multiple tables that contain the same number of columns,but fewer rows.

For example, if a table contains a large number of rows that represent monthly reports it could be partitioned 
horizontally into tables by years, with each table representing all monthly reports for a specific year. 
This way queries requiring data for a specific year will only reference the appropriate table.

Tables are horizontally partitioned based on a column which will be used for partitioning and 
the ranges associated to each partition. 
Partitioning column is usually a datetime column but all data types that are valid for use as 
index columns can be used as a partitioning column.

Query to check if my sql version supports partitioning
*/

SELECT
	PLUGIN_NAME as Name,
    PLUGIN_VERSION as Version,
    PLUGIN_STATUS as Status
    FROM INFORMATION_SCHEMA.PLUGINS
    WHERE PLUGIN_TYPE='STORAGE ENGINE';

--How to create horizontal Partition on a table

 CREATE TABLE members1 (
    firstname VARCHAR(25) NOT NULL,
    lastname VARCHAR(25) NOT NULL,
    username VARCHAR(16) NOT NULL,
    email VARCHAR(35),
    joined DATE NOT NULL
    )
    PARTITION BY RANGE( YEAR(joined) ) (
    PARTITION p0 VALUES LESS THAN (1960),
    PARTITION p1 VALUES LESS THAN (1970),
    PARTITION p2 VALUES LESS THAN (1980),
    PARTITION p3 VALUES LESS THAN (1990),
    PARTITION p4 VALUES LESS THAN MAXVALUE
    );

/*
Types that can be used while Partitioning
1. RANGE
2. LIST
3. HASH
4. KEY
*/

--LIST Example:
CREATE TABLE employees (
    id INT NOT NULL,
    fname VARCHAR(30),
    lname VARCHAR(30),
    hired DATE NOT NULL DEFAULT '1970-01-01',
    separated DATE NOT NULL DEFAULT '9999-12-31',
    job_code INT,
    store_id INT
)
PARTITION BY LIST(store_id) (
    PARTITION pNorth VALUES IN (3,5,6,9,17),
    PARTITION pEast VALUES IN (1,2,10,11,19,20),
    PARTITION pWest VALUES IN (4,12,13,14,18),
    PARTITION pCentral VALUES IN (7,8,15,16)
);

--HASH Example:

CREATE TABLE employees (
    id INT NOT NULL,
    fname VARCHAR(30),
    lname VARCHAR(30),
    hired DATE NOT NULL DEFAULT '1970-01-01',
    separated DATE NOT NULL DEFAULT '9999-12-31',
    job_code INT,
    store_id INT
)
PARTITION BY HASH(author)
PARTITIONS 4;

--KEY Example:

CREATE TABLE k1 (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(20)
)
PARTITION BY KEY()
PARTITIONS 2;

--Query to check partitions and number of rows present in it:

SELECT PARTITION_NAME,TABLE_ROWS 
FROM information_schema.partitions 
WHERE TABLE_SCHEMA='partitioningdb' 
AND TABLE_NAME = 'members' 
AND PARTITION_NAME IS NOT NULL;