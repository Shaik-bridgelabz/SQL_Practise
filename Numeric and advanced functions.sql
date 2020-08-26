--SQL Advanced Functions

SELECT BIN(9);  ---It converts a decimal number to a binary number.

SELECT COALESCE(NULL,NULL,'shaikmd',NULL,'shaik'); ---It returns the first non-null expression in a list

SELECT CONNECTION_ID(); --It returns the unique connection ID for the current connection

SELECT CURRENT_USER();  --It returns the user name and host name for the MySQL account used by the server to authenticate the current client.

SELECT IF(200<500, "YES", "NO");  --It returns one value if a condition is TRUE, or another value if a condition is FALSE.

SELECT LAST_INSERT_ID();  --It returns the first AUTO_INCREMENT value that was set by the most recent INSERT or UPDATE statement

--SQL Numeric Functions

SELECT ABS(-10);  --returns the absolute value of a number.

SELECT ACOS(0.25);  --returns the cosine of a number.

SELECT ASIN(0.25);  --returns the sine of a number.

SELECT ATAN(0.25);  --returns the tangent of a number.

SELCT CEIL(25.75)  --returns the smallest integer value that is greater than or equal to a number.

SELECT FLOOR(25.75); --returns the largest integer value that is less than or equal to a number

SELECT LOG(2); ---returns the base-10 logarithm of a number

SELECT MOD(18, 4);  --returns the remainder of n divided by m

SELECT POW(4, 2);  --returns m raised to the nth power.

SELECT ROUND(5.553); --returns a number rounded to a certain number of decimal places.

SELECT SQRT(25); --returns the square root of a number.

SELECT TRUNCATE(7.53635, 2); //returns 7.53635 truncated to 2 places right of the decimal point.
