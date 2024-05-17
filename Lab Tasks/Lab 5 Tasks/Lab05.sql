CREATE DATABASE Lab5;

					-- Task 1

CREATE TABLE student(
Sid INT PRIMARY KEY CHECK (Sid > 0),
Name VARCHAR(50)  NOT NULL UNIQUE,
Address VARCHAR(100) DEFAULT 'Taxila',
Gender VARCHAR(30),
AGE INT
);

					-- Task 2
-- Q1
CREATE TABLE Supplier(
SupplierId INT PRIMARY KEY ,
SupplierName VARCHAR(50)
);
INSERT INTO Supplier (SupplierID, SupplierName)
VALUES
(1, 'Supp A');

SELECT * FROM Supplier;


CREATE TABLE Product (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(50),
SupplierID INT,
CategoryID INT,
Unit VARCHAR(50),
Price FLOAT, 
FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierId)
);

SELECT * FROM Product;

INSERT INTO Product(ProductID, ProductName, SupplierID, CategoryID, Unit, Price)
VALUES
(1,'Chais',1,1,'10 boxes x 20 bags',18),
(2,'Chang',1,1,'24 - 12 oz bottles',19),
(3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10),
(4,'Chef Antons Cajun Seasoning',1,2,'48 - 6 oz jars',22),
(5,'Chef Antons Gumbo Mix',1,2,'36 boxes',21.35);

-- Q2
DELETE FROM Product
WHERE ProductName LIKE 'C%[sg]';

-- Q3
SELECT COUNT(ProductID) AS Total
FROM Product1;



						-- Task 3

CREATE TABLE Customer (
    ID INT,
    NAME VARCHAR(50),
    AGE INT,
    ADDRESS VARCHAR(100),
    SALARY DECIMAL
);

INSERT INTO Customer (ID, NAME, AGE, ADDRESS, SALARY) VALUES
(1, 'Toseef', 32, 'Islamabad', 2000.00),
(2, 'Tuafial', 25, 'Muzaffarabad', 1500.00),
(3, 'Adnan', 23, 'Kotil', 2000.00),
(4, 'Talha', 25, 'Chikhar', 6500.00),
(5, 'Shahid', 27, 'Neelum', NULL),
(6, 'Yasir', 22, 'Muzaffarabad', NULL);

UPDATE Customer
SET SALARY = 8500.00
WHERE ID = 5;

UPDATE Customer
SET SALARY = 4500.00
WHERE ID = 6;

ALTER TABLE Customer
ALTER COLUMN SALARY  NOT NULL;
