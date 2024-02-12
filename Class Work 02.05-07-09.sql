USE bitscopy_classwork;

SHOW TABLES;

SELECT *
FROM tasks;

SELECT *
FROM client;

#creating a new table from an existing table
CREATE TABLE category_drm AS
SELECT *
FROM tasks
WHERE category = 'DRM';

SELECT *
FROM category_drm;

### Adding or dropping a column

ALTER TABLE category_drm
ADD COLUMN email VARCHAR(255);

SELECT *
FROM category_drm;

#To change a column's data type or constraints, 
#use ALTER TABLE with the MODIFY COLUMN or ALTER COLUMN

ALTER TABLE category_drm
MODIFY COLUMN email VARCHAR(320);

-- For SQL Server, the command is ALTER COLUMN
-- ALTER TABLE employees
-- ALFTER COLUMN email INVARCHAR(320);

### Drop column
ALTER TABLE category_drm
DROP COLUMN email;

# summarizing the data into a new table
CREATE TABLE tasks_number AS
SELECT taskid, COUNT(*) AS task_count
FROM tasks
GROUP BY taskid;

SELECT *
FROM tasks_number;

CREATE TABLE Average_Credit AS
SELECT state, AVG(CreditLimit) AS average
FROM client
GROUP BY state;

SELECT *
FROM Average_Credit;

# updating table
UPDATE category_drm
SET email = 'new.email@example.com'
WHERE TaskID = 'DAll';

DELETE FROM category_drm
WHERE TaskID = 'DA11';

#02/07

SHOW TABLES;

# ORDER BY USING MULTIPLE COLUMNS (sorting by row with these functions)
SELECT *
FROM client
ORDER BY balance DESC, creditlimit ASC;

SELECT *
FROM client
ORDER BY City DESC;

SELECT *
FROM client
ORDER BY balance DESC;

SELECT *
FROM client
ORDER BY balance DESC, city DESC;

SELECT street, city
FROM client
ORDER BY 1 DESC, 2 DESC;

#Math functions in SQL

SELECT ABS(balance) AS Abs_Balance, ClientName
FROM client;

SELECT LOG(creditlimit) AS Log_Credit, ZipCode
FROM client;

SELECT *
 FROM consultant;
 
 SELECT Rate*Hours AS Weekly_Salary
 FROM consultant;

SELECT POW(Rate, 2) AS Rate_Squared
FROM consultant;

SELECT SQRT(Rate) AS Square_Root_Rate
FROM consultant;

### String Functions

SELECT UPPER(street) AS Street_Upper
FROM consultant;

SELECT LOWER(street) AS Street_Upper
FROM consultant;

# If you do not rename the column it will show up as the function
SELECT LEFT (city, 3)
FROM client;

SELECT REVERSE (clientname) AS Reverse_Client
FROM client;

#Substring(String, start, length)\
SELECT SUBSTRING(city,2,3) AS Substring_Text
FROM client;

#CONCAT- Merge Columns
#CONCAT(string1, string2,...)
#Can use to create primary key and unique identifiers

SELECT CONCAT(city, street) AS City_Street
FROM client;

SELECT CONCAT(clientnum, zipcode) AS Longest_Street_Name
FROM client;

#CHAR_LENGTH(string)
SELECT CHAR_LENGTH (street) AS Longest_Street_Name
FROM client;

SELECT COUNT(*) AS Credit_Limit_Per_Client, creditlimit
FROM client
GROUP BY 2;

SELECT Clientnum, Zipcode
FROM client
WHERE 1>677;

#ROLLUP
SELECT AVG(creditlimit) AS Credit_Limit_Avg, Creditlimit
FROM client
GROUP BY ROLLUP(2);

SELECT AVG(CreditLimit)
FROM client;

SHOW TABLES;

SELECT *
FROM client;

SELECT SUM(balance) AS Total_Balance, Creditlimit
FROM client
GROUP BY ROLLUP(2);

SELECT SUM(balance)
FROM client;

#CASE WHEN
#The CASE expression goes through a bunch of condition abd when the first one is
#meet it returns a result

#CASE
  #WHEN condtion1 THEN result1
  #WHEN condtion2 THEN result2
#ELSE result
#END

SELECT CreditLimit,
CASE
WHEN CreditLimit<= 2500 THEN "Bad Credit"
WHEN CreditLimit<= 5000 THEN "Okay Credit"
WHEN CreditLimit<= 7500 THEN "Good Credit"
ELSE "Good Credit"
END AS Credit_Rating
FROM client;

#CASE WHEN with Aggregations
### Count number of rows that meet a certain condition

SELECT
CASE
WHEN CreditLimit<= 2500 THEN "Bad Credit"
WHEN CreditLimit<= 5000 THEN "Okay Credit"
WHEN CreditLimit<= 7500 THEN "Better Credit"
ELSE "Good Credit"
END AS Credit_Rating,
AVG(creditlimit) AS Average_Credit
FROM client
GROUP BY
CASE
WHEN CreditLimit<= 2500 THEN "Bad Credit"
WHEN CreditLimit<= 5000 THEN "Okay Credit"
WHEN CreditLimit<= 7500 THEN "Better Credit"
ELSE "Good Credit"
END;

SELECT
CASE
WHEN CreditLimit<= 2500 THEN "Bad Credit"
WHEN CreditLimit<= 5000 THEN "Okay Credit"
WHEN CreditLimit<= 7500 THEN "Better Credit"
ELSE "Good Credit"
END AS Credit_Rating,
COUNT(*) AS Number_Of_Creditors
FROM client
GROUP BY
CASE
WHEN CreditLimit<= 2500 THEN "Bad Credit"
WHEN CreditLimit<= 5000 THEN "Okay Credit"
WHEN CreditLimit<= 7500 THEN "Better Credit"
ELSE "Good Credit"
END;

SELECT city,CASE
WHEN city IN ('Easton','Sunland','Lizton') THEN "Region 1"
WHEN city IN ('Harpersburg','Amo') THEN "Region 2"
ELSE "Region 3"
END AS 'region'
FROM client;

#ORDER BY CASE
#Sort by city, and clientname but if city is Easton, then sort by city then zipcode
SELECT *
FROM client
ORDER BY city,
   CASE
      WHEN city = "Easton" THEN zipcode
      ELSE clientname
   END;
   
SELECT * 
FROM tasks;

#Order by category, then description, But if category ="SOM" then order by category
SELECT *
FROM tasks
ORDER BY category,
  CASE
      WHEN category = "SOM" THEN price
      ELSE description
  END;
  
#SUBQUERIES IN SQL -> Query within a query
#First part is everyone with credit limit of 5000 and City doesn't start with A
#Second one is everyone with credit limit of 5000
SELECT client.*
  FROM (
        SELECT *
         FROM client
        WHERE creditlimit = 5000
	) client
WHERE LEFT(city,1) <> 'A';

SELECT *
FROM client
WHERE creditlimit = 5000;

#First one is example of all tasks
#Second and Third are the same thing in differnt code
SELECT * FROM tasks;

SELECT * FROM
 (SELECT * FROM tasks
 WHERE price<=65) tasks
 WHERE category = 'DRM';
 
SELECT *
FROM tasks
WHERE price<=65 AND category = 'DRM';

SHOW TABLES;

#JOINS
#Identify the primary and foreign key
#Select rows by table.column name syntax
#Next Two are same thing

SELECT client.clientnum, client.clientname, consultant.consltnum
FROM client # Left table
JOIN consultant ON client.consltnum=consultant.consltnum; # Right table

SELECT client.clientnum, client.clientname, consultant.consltnum
FROM client
INNER JOIN consultant ON client.consltnum=consultant.consltnum;

SELECT a.clientnum, a.clientname, b.consltnum
FROM client a #a refers to the client tables
INNER JOIN consltant b ON a.consltnum=b.consltnum
