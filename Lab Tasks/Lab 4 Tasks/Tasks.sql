CREATE DATABASE Lab_04;

								---------------------------
										-- Lab Task 1
								---------------------------

CREATE TABLE Customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
contact_name VARCHAR(50),
address VARCHAR(100),
city VARCHAR(70),
postalCode INT,
country VARCHAR(50)
);

SHOW TABLES;

INSERT INTO Customers (customer_id, customer_name, contact_name, address, city, postalCode, country)
VALUES
    (1001, 'Tech Solutions Inc.', 'Michael Johnson', '1234 Tech Avenue', 'San Francisco', 94105, 'USA'),
    (1002, 'Global Foods Ltd.', 'Emily Wang', '456 International Blvd', 'London', 44304, 'UK'),
    (1003, 'Health & Wellness Co.', 'Sarah Patel', '789 Wellness Street', 'Sydney', 2000, 'Australia'),
    (1004, 'Green Energy Corp.', 'David Smith', '101 Renewable Drive', 'Berlin', 10178, 'Germany'),
    (1005, 'Fashion Forward LLC', 'Sophia Chang', '222 Style Boulevard', 'Paris', 75001, 'France');
    
SELECT * FROM customers;

-- • Write an SQL statement that selects all Customers with a City starting with the letter "s”.

SELECT * 
FROM customers
WHERE city LIKE 'S%';

-- Write an SQL statement that selects all Customers with a City ending with the letter “s”

SELECT *
FROM customers
WHERE city LIKE '%S';

-- Write an SQL statement that selects all Customers with a City containing the pattern “land”

SELECT * 
FROM customers
WHERE city LIKE '%land%';

-- Write an SQL statement that selects all Customers with a City not containing the pattern “land”.

SELECT * 
FROM customers
WHERE city NOT LIKE '%land%';

-- Write an SQL statement that selects the two first Customers from table who belong to “Germany” or “France”.

SELECT TOP 2 * 
FROM customers
WHERE country IN ('Germany','France')
ORDER BY customer_id;

--LIMIT 2;


-- Write an SQL statement that selects all Customers with a City of "Germany" or "Australia" without using ‘OR’ operator

SELECT * 
FROM customers
WHERE country IN ('Germany','Australia');


					------------------------------------
					--         	Lab Task 2
					------------------------------------
               
CREATE TABLE student(
id INT UNIQUE,
firstName VARCHAR(50),
lastName VARCHAR(50)
);

INSERT INTO student 
VALUES
(100001,'jawalant','patel'),
(100002,'Hiren','Amin'),
(100003,'Yogesh','Patil');

				-- a)

SELECT *
FROM student
WHERE id != 100002;

			   -- b)

SELECT *
FROM student
WHERE id IN (100001,100003);

			  -- c)
SELECT TOP 2 *
FROM student;
			  -- d)
SELECT *
FROM student
WHERE lastName like 'patil';
-- OR
SELECT *
FROM student
WHERE id= 100003;




					------------------------------------
					--         	Lab Task 3
					------------------------------------

CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(50),
SupplierID INT,
CategoryID INT,
Unit VARCHAR(50),
Price FLOAT
);

SELECT * FROM Products;

INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, Unit, Price)
VALUES
(1,'Chais',1,1,'10 boxes x 20 bags',18),
(2,'Chang',1,1,'24 - 12 oz bottles',19),
(3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10),
(4,'Chef Antons Cajun Seasoning',1,2,'48 - 6 oz jars',22),
(5,'Chef Antons Gumbo Mix',1,2,'36 boxes',21.35);

-- Write an SQL statement that selects all products with a price from 10 to 20
SELECT * 
FROM Products
WHERE Price BETWEEN 10 AND 20; 

--• Write an SQL statement that selects all products with a price from 20 to 30.

SELECT * 
FROM Products
WHERE Price BETWEEN 20 AND 30;

-- Write anSQL statement that selects all products with a pricefrom 10 to 22 but products with a CategoryIDof 1,2, or 3 should not be displayed.
SELECT *
FROM Products
WHERE Price BETWEEN 10 AND 22
AND CategoryID NOT IN (1,2,3) ;

-- Write an SQL statement that selects all products with a ProductName beginning with any of the letter not between 'C' and 'M'
SELECT *
FROM Products
WHERE ProductName NOT BETWEEN 'C%' AND 'M';
