--SQL String Functions

SELECT ascii('t');   --This function is used to find the ASCII value of a character.

SELECT INSTR('shaik', 'a');  --used to find the occurrence of an alphabet

SELECT LENGTH('shaik'); --used to find the length of a word.

SELECT LOWER('SHAIK');   --used to convert the upper case string into lower case

SELECT POSITION('a' IN 'shaik');  --used to find position of the first occurrence of the given alphabet.

SELECT REPEAT('shaik', 2);  --used to write the given string again and again till the number of times mentioned.

SELECT RIGHT('shaikmohammed@gmail.com', 4); --used to SELECT a sub string from the right end of the given size

SELECT STRCMP('google.com', 'yahoo.com');
--If string1 and string2 are the same, the STRCMP function will return 0.
--If string1 is smaller than string2, the STRCMP function will return -1.
--If string1 is larger than string2, the STRCMP function will return 1.

SELECT UCASE ("shaik");  --used to make the string in upper case

