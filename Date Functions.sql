select curdate();   --display current date

select curtime(); --display current time

select current_timestamp();   --display cureent date and time

select curdate() + 0;   --display in yyyymmdd format

DATE(expr)
--Extracts the date part of the date or datetime expression expr.
Select DATE('2003-12-31 01:02:03');

DATEDIFF(expr1,expr2)
Select DATEDIFF('2020-08-21','1997-12-10');

DATE_ADD(date,INTERVAL expr unit)
DATE_SUB(date,INTERVAL expr unit)
Select DATE_ADD(current_timestamp(), INTERVAL 1 HOUR);
Select DATE_SUB(current_timestamp(), INTERVAL 1 HOUR);
Select DATE_ADD(current_timestamp(), INTERVAL 2 DAY);
Select DATE_ADD(current_timestamp(), INTERVAL 2 MONTH);

DATE_FORMAT(date,format)
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%W %M %Y');
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%W %M %Y %H %i %s');

DAY(date)
Select DAY(curdate());

DAYNAME(date)
Select DAYNAME('1997-12-10');

STR_TO_DATE(str,format)
SELECT STR_TO_DATE('04/31/2004', '%m/%d/%Y');

