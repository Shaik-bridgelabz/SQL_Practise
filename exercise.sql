-- Sql Exercise

-- Query used to create table with partitions

CREATE TABLE `logdata` (
  `DateTime` date NOT NULL,
  `Cpu Count` int(11) NOT NULL,
  `Cpu Work` double NOT NULL,
  `Cpu idle` double NOT NULL,
  `cpu_percent` float NOT NULL,
  `Usage Cpu Count` int(11) NOT NULL,
  `number of software interrupts since boot` int(11) NOT NULL,
  `number of system calls since boot` int(11) NOT NULL,
  `number of interrupts since boot` int(11) NOT NULL,
  `cpu avg load over 1 min` float NOT NULL,
  `cpu avg load over 5 min` float NOT NULL,
  `cpu avg load over 15 min` float NOT NULL,
  `system_total_memory` varchar(20) NOT NULL,
  `system_used_memory` varchar(20) NOT NULL,
  `system_free_memory` varchar(20) NOT NULL,
  `system_active_memory` varchar(20) NOT NULL,
  `system_inactive_memory` varchar(20) NOT NULL,
  `system_buffers_memory` varchar(20) NOT NULL,
  `system_cached_memory` varchar(20) NOT NULL,
  `system_shared_memory` varchar(20) NOT NULL,
  `system_avalible_memory` varchar(20) NOT NULL,
  `disk_total_memory` varchar(20) NOT NULL,
  `disk_used_memory` varchar(20) NOT NULL,
  `disk_free_memory` varchar(20) NOT NULL,
  `disk_read_count` int(11) NOT NULL,
  `disk_write_count` int(11) NOT NULL,
  `disk_read_bytes` varchar(20) NOT NULL,
  `disk_write_bytes` varchar(20) NOT NULL,
  `time spent reading from disk` int(11) NOT NULL,
  `time spent writing to disk` int(11) NOT NULL,
  `time spent doing actual I/Os` int(11) NOT NULL,
  `number of bytes sent` int(11) NOT NULL,
  `number of bytes received` int(11) NOT NULL,
  `number of packets sent` int(11) NOT NULL,
  `number of packets recived` int(11) NOT NULL,
  `total number of errors while receiving` int(11) NOT NULL,
  `total number of errors while sending` int(11) NOT NULL,
  `total number of incoming packets which were dropped` int(11) NOT NULL,
  `total number of outgoing packets which were dropped` int(11) NOT NULL,
  `boot_time` time NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `keyboard` int(11) NOT NULL,
  `mouse` int(11) NOT NULL,
  `technology` varchar(20) NOT NULL,
  `files_changed` int(11) NOT NULL
)PARTITION BY RANGE (dayofmonth(`DateTime`))
(PARTITION `p0` VALUES LESS THAN (19),
 PARTITION `p1` VALUES LESS THAN (20),
 PARTITION `p2` VALUES LESS THAN (21));

--Query to get user based on their technology

select distinct(user_name) from logdata where technology='java';

select count(distinct(user_name)),technology from logdata group by technology;

-- Query to get count of keyboard and mouse idle for all users

select distinct(user_name),count(keyboard=0),count(mouse=0) from logdata group by user_name;

-- Query to get count of keyboard and mouse idle for all users on a particular day

select distinct(user_name),DateTime,count(keyboard=0),count(mouse=0) from logdata group by user_name,DateTime;

-- Query to get how many users present on a particular day

select distinct(user_name),datetime from logdata where EXISTS (select distinct(user_name) from logdata where datetime='2019-09-18' or datetime='2019-09-19' or datetime='2019-09-20');

select user_name, count(present) from (select distinct(user_name), day(datetime) as present from logdata) d group by user_name;

select user_name, count(present) from (select distinct(user_name), day(datetime) as present from logdata) d group by user_name having count(present)<3;

