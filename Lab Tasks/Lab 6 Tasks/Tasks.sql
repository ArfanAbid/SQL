CREATE DATABASE Lab_06;

USE Lab_06;

														-------------
														-- Task 1
														-------------

CREATE TABLE Customer(
First_Name Char(50),
Last_Name Char(50),
Address Char(50),
City Char(50),
Country Char(25),
Birth_Date datetime,
);

-- Write an SQL statement to convert the above table into following table
ALTER TABLE customer
ADD gender CHAR(1);

SELECT * FROM customer;

-- • Write SQL statement(s) to change “Birth_Date” to “Age” with data type Integer.

ALTER TABLE customer
ALTER COLUMN Birth_Date Age INT;  -- ERROR
/*
use this 
EXEC SP_RENAME 
‘TABLE_NAME.COLUMN_NAME’ , 
‘NEW_NAME’ , ‘COLUMN’
*/


-- • Create an Index on the “Customer” table using “First_Name” and “Age”.

CREATE INDEX idx_Customer_FirstName_Age
ON Customer (First_Name, age);

												------------
												--	Task 2
												------------

 -- Decompose the above table into new tables using foreign key relationship between the  parent (Product) and child (Supplier) table.

 CREATE TABLE Supplier (
   SupplierID INT PRIMARY KEY,
   ProductName VARCHAR(50),

);
INSERT INTO Supplier ( SupplierID,ProductName)
VALUES
(1,'Chais'),
(2,'Chang'),
(3,'Aniseed Syrup'),
(4,'Chef Antons Cajun Seasoning'),
(5,'Chef Antons Gumbo Mix');


 CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(50),
SupplierID INT,
CategoryID INT,
Unit VARCHAR(50),
Price FLOAT
FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID) 
);

SELECT * FROM Products;

INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, Unit, Price)
VALUES
(1,'Chais',1,1,'10 boxes x 20 bags',18),
(2,'Chang',1,1,'24 - 12 oz bottles',19),
(3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10),
(4,'Chef Antons Cajun Seasoning',1,2,'48 - 6 oz jars',22),
(5,'Chef Antons Gumbo Mix',1,2,'36 boxes',21.35);


-- • Add a new attribute Supplier_Name into child table (Supplier).

ALTER TABLE supplier
ADD Supplier_Name VARCHAR(50);

-- • Write an SQL statement that selects all supplier names whose price is not less than 20.

SELECT * 
FROM Products
WHERE Price >= 20;

-- Write an SQL statement that selects all products whose name is starting with “C” and ending with “s” or “g”

SELECT * 
FROM products
WHERE ProductName LIKE 'C%s' OR ProductName LIKE 'C%g';

--  Write an SQL statement to delete the “ProductName” entries from the table.

ALTER TABLE Products
DROP COLUMN ProductName;



									-----------------
									---     Task 3
									------------------


CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50)
);

INSERT INTO Students (Student_ID, Student_Name)
VALUES
(38214, 'Ali'),
(54907, 'Ahsan'),
(66324, 'Bilal'),
(70542, 'Naee');


CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY,
    Faculty_Name VARCHAR(50)
);

INSERT INTO Faculty (Faculty_ID, Faculty_Name)
VALUES
(38214, 'Ali'),
(54907, 'Ahsan'),
(66324, 'Bilal'),
(70542, 'Naee');

-- • Write a query to add an attribute “Class” to the Student table

ALTER TABLE students
ADD Class VARCHAR(50);

-- • Write a query to change the field for Student_Name to 40 characters

ALTER TABLE Students
ALTER COLUMN Student_Name VARCHAR(40);



--• Write a query to remove the Student table
DROP TABLE Students


-- • Write a query to add another column in the Faculty table with an auto increment field
ALTER TABLE Faculty
ADD  Faculty_ID_auto INT IDENTITY(1,1);


--- Write a query to add another column Department in the Faculty table. The column  must not contain any value other than the values COMPUTER or CompEngg.
ALTER TABLE Faculty
ADD  Department VARCHAR(20) DEFAULT NULL CHECK (Department IN ('COMPUTER', 'CompEngg'));



-- • Write a query to change the auto increment field to start from 50

ALTER TABLE Faculty
ALTER Faculty_ID INT IDENTITY(50,1);   

-- IN this System ADD COLUMN is not supported insteadd use ADD
-- ALSO AUTO_INCREMENT is not supported  insteads use IDENTITY






