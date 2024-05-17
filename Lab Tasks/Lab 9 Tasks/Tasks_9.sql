CREATE DATABASE Lab_09;
-- ARFAN ABID (22-CS-55)

		--------------------------------
				--Task 1
		---------------------------------

CREATE TABLE SalesPerson (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary INT
);

CREATE TABLE Customer1 (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    Industry_Type VARCHAR(1)
);

CREATE TABLE Orders (
    Number INT PRIMARY KEY,
    order_date DATE,
    cust_id INT,
    salesperson_id INT,
    Amount INT,
    FOREIGN KEY (cust_id) REFERENCES Customer1(ID),
    FOREIGN KEY (salesperson_id) REFERENCES SalesPerson(ID)
);

INSERT INTO SalesPerson (ID, Name, Age, Salary) VALUES
(1, 'Abe', 61, 140000),
(2, 'Bob', 34, 44000),
(5, 'Chris', 34, 40000),
(7, 'Dan', 41, 52000),
(8, 'Ken', 57, 115000),
(11, 'Joe', 38, 38000);

INSERT INTO Customer1 (ID, Name, City, Industry_Type) VALUES
(4, 'Samsonic', 'pleasant', 'J'),
(6, 'Panasung', 'oaktown', 'J'),
(7, 'Samony', 'jackson', 'B'),
(9, 'Orange', 'Jackson', 'B');

INSERT INTO Orders (Number, order_date, cust_id, salesperson_id, Amount) VALUES
(10, '1996-08-02', 4, 2, 540),
(20, '1999-01-30', 4, 8, 1800),
(30, '1995-07-14', 9, 1, 460),
(40, '1998-01-29', 7, 2, 2400),
(50, '1998-02-03', 6, 7, 600),
(60, '1998-03-02', 6, 7,720),
(70, '1998-05-06', 9, 7, 150);

-- ARFAN ABID (22-CS-55)

--• The names of all salespeople that have an order with Samsonic.
SELECT s.Name
FROM SalesPerson s
JOIN Orders o 
ON s.ID = o.salesperson_id
JOIN Customer1 c 
ON o.cust_id = c.ID
WHERE c.Name = 'Samsonic';

-- • The names of all salespeople that do not have an order with Samsonic.
SELECT Name 
FROM SalesPerson 
WHERE ID NOT IN (SELECT DISTINCT salesperson_id FROM Orders WHERE cust_id=(SELECT ID FROM Customer WHERE Name = 'Samsonic'));


-- ARFAN ABID (22-CS-55)

--• The names of all salespeople that 2 or more orders
SELECT s.Name
FROM SalesPerson s
JOIN Orders o 
ON s.ID = o.salesperson_id
GROUP BY s.Name
HAVING COUNT(o.Number) >= 2;

-- Write a SQL statement to insert rows into a table called highAchiever(Name, Age), where a salesperson must have a salary of 100,000 or greater to be included in the table.

CREATE TABLE highAchiever (
    Name VARCHAR(50),
    Age INT
);

INSERT INTO highAchiever (Name, Age)
SELECT Name, Age
FROM SalesPerson
WHERE Salary >= 100000;

SELECT * FROM highAchiever;





		-------------------------
			-- Task 2
		-------------------------
CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Campus_Address VARCHAR(255),
    Major VARCHAR(100)
);

CREATE TABLE Instructors (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Location VARCHAR(255)
);

CREATE TABLE Courses (
    ID INT PRIMARY KEY,
    Course_Title VARCHAR(255),
    Instructor_ID INT,
    FOREIGN KEY (Instructor_ID) REFERENCES Instructors(ID)
);

CREATE TABLE Grades (
    Student_ID INT,
    Course_ID INT,
    Grade CHAR(2),
    FOREIGN KEY (Student_ID) REFERENCES Students(ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(ID),
    PRIMARY KEY (Student_ID, Course_ID)
);



		-----------------------
			-- Task 3
		-----------------------

CREATE TABLE products1 (
    PRODUCT_ID INT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(100)
);

CREATE TABLE sales (
    SALE_ID INT PRIMARY KEY,
    PRODUCT_ID INT,
    YEAR INT,
    QUANTITY INT,
    PRICE DECIMAL(10, 2),
    FOREIGN KEY (PRODUCT_ID) REFERENCES products1(PRODUCT_ID)
);

INSERT INTO products1 (PRODUCT_ID, PRODUCT_NAME) VALUES
(100, 'Nokia'),
(200, 'IPhone'),
(300, 'Samsung');

INSERT INTO sales (SALE_ID, PRODUCT_ID, YEAR, QUANTITY, PRICE) VALUES
(1, 100, 2010, 25, 5000),
(2, 100, 2011, 16, 5000),
(3, 100, 2012, 8, 5000),
(4, 200, 2010, 10, 9000),
(5, 200, 2011, 15, 9000),
(6, 200, 2012, 20, 9000),
(7, 300, 2010, 20, 7000),
(8, 300, 2011, 18, 7000),
(9, 300, 2012, 20, 7000);



-- i. Write a SQL query to find the products which does not have sales at all?
SELECT p.PRODUCT_ID, p.PRODUCT_NAME
FROM products1 p
LEFT JOIN sales s 
ON p.PRODUCT_ID = s.PRODUCT_ID
WHERE s.SALE_ID IS NULL;




-- ii. Write a SQL query to find the products whose sales decreased in 2012 compared to 2011?
SELECT p.PRODUCT_NAME
FROM products1 p
INNER JOIN sales s2012 ON p.PRODUCT_ID = s2012.PRODUCT_ID AND s2012.YEAR = 2012
INNER JOIN sales s2011 ON p.PRODUCT_ID = s2011.PRODUCT_ID AND s2011.YEAR = 2011
WHERE s2012.QUANTITY < s2011.QUANTITY;


--iii. Write a query to select the top product sold in each year?
SELECT YEAR,PRODUCT_NAME,QUANTITY
FROM (SELECT s.YEAR,
		p.PRODUCT_NAME,
        s.QUANTITY,
        ROW_NUMBER() OVER (PARTITION BY s.YEAR ORDER BY s.QUANTITY DESC) AS rank
    FROM sales s
    JOIN products1 p ON s.PRODUCT_ID = p.PRODUCT_ID
) AS ranked_sales
WHERE rank = 1;



--iv. Write a query to find the total sales of each product?
SELECT s.PRODUCT_ID,p.PRODUCT_NAME,SUM(s.QUANTITY) AS total_sales
FROM sales s
JOIN products1 p ON s.PRODUCT_ID = p.PRODUCT_ID
GROUP BY s.PRODUCT_ID, p.PRODUCT_NAME;

-- iv.OR    Write a query to find the total sales of each product?
SELECT p.PRODUCT_ID,p.PRODUCT_NAME,SUM(s.QUANTITY) AS total_sales
FROM products1 p
LEFT JOIN sales s 
ON p.PRODUCT_ID = s.PRODUCT_ID
GROUP BY p.PRODUCT_ID, p.PRODUCT_NAME;


-- v. Write a SQL query to find the products which have continuous increase in sales every year?
SELECT DISTINCT p.PRODUCT_ID,p.PRODUCT_NAME
FROM  sales s
JOIN products1 p ON s.PRODUCT_ID = p.PRODUCT_ID
LEFT JOIN  sales s_prev ON s.PRODUCT_ID = s_prev.PRODUCT_ID AND s.YEAR = s_prev.YEAR + 1
WHERE s_prev.QUANTITY IS NULL OR s.QUANTITY > s_prev.QUANTITY;




--vi. Write a query to find the products whose quantity sold in a year should be greater than the average quantity of the product sold across all the years?

SELECT s.PRODUCT_ID,p.PRODUCT_NAME,s.YEAR,s.QUANTITY
FROM sales s
JOIN products1 p ON s.PRODUCT_ID = p.PRODUCT_ID
WHERE s.QUANTITY > (SELECT AVG(QUANTITY) FROM sales WHERE PRODUCT_ID = s.PRODUCT_ID);



--vii. Write a query to compare the products sales of "IPhone" and "Samsung" in each year? The output should look like as:

SELECT YEAR,
	SUM(CASE WHEN p.PRODUCT_NAME = 'IPhone' THEN s.QUANTITY ELSE 0 END) AS IPhone_Sales,
    SUM(CASE WHEN p.PRODUCT_NAME = 'Samsung' THEN s.QUANTITY ELSE 0 END) AS Samsung_Sales
FROM sales s
JOIN products1 p ON s.PRODUCT_ID = p.PRODUCT_ID
WHERE p.PRODUCT_NAME IN ('IPhone', 'Samsung')
GROUP BY YEAR
ORDER BY YEAR;


-----------------------------------------------------------------
CREATE TABLE ProductSales (
    YEAR INT,
    IPHONE_QUANT INT,
    SAM_QUANT INT,
    IPHONE_PRICE INT,
    SAM_PRICE INT
);

INSERT INTO ProductSales (YEAR, IPHONE_QUANT, SAM_QUANT, IPHONE_PRICE, SAM_PRICE) VALUES
(2010, 10, 20, 9000, 7000),
(2011, 15, 18, 9000, 7000),
(2012, 20, 20, 9000, 7000);




--viii. Write a query to find the number of products sold in each year?
SELECT YEAR,IPHONE_QUANT + SAM_QUANT AS total_products_sold
FROM ProductSales;







-- ARFAN ABID (22-CS-55


--ix. How will you go about identifying duplicate records in a table?
SELECT YEAR, IPHONE_QUANT, SAM_QUANT, IPHONE_PRICE, SAM_PRICE
FROM ProductSales
GROUP BY YEAR, IPHONE_QUANT, SAM_QUANT, IPHONE_PRICE, SAM_PRICE
HAVING  COUNT(*) > 1;






		------------------------
		   -- Task 4
		------------------------
-- A hospital has a large number ...........

CREATE TABLE PHYSICIAN (
    Physician_ID INT PRIMARY KEY,
    Specialty VARCHAR(100)
);

CREATE TABLE PATIENT (
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(100),
    Admitting_Physician_ID INT,
    FOREIGN KEY (Admitting_Physician_ID) REFERENCES PHYSICIAN(Physician_ID)
);

CREATE TABLE TREATMENT_DETAIL (
    Treatment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Physician_ID INT,
    Date DATE,
    Time TIME,
    Results VARCHAR(255),
    FOREIGN KEY (Patient_ID) REFERENCES PATIENT(Patient_ID),
    FOREIGN KEY (Physician_ID) REFERENCES PHYSICIAN(Physician_ID)
);





		-------------------------
				-- Task 5
		--------------------------

 --Emerging Electric wishes...........

CREATE TABLE CUSTOMER (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address_Street VARCHAR(255),
    Address_City VARCHAR(100),
    Address_State VARCHAR(100),
    Address_Zip_Code VARCHAR(20),
    Telephone VARCHAR(20)
);

CREATE TABLE LOCATION (
    Location_ID INT PRIMARY KEY,
    Customer_ID INT,
    Address_Street VARCHAR(255),
    Address_City VARCHAR(100),
    Address_State VARCHAR(100),
    Address_Zip_Code VARCHAR(20),
    Val_Type  VARCHAR(100),
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

CREATE TABLE RATE (
    Rate_ID INT PRIMARY KEY,
    Location_ID INT,
    Rate_Class VARCHAR(100),
    Rate_Per_KWH DECIMAL(10, 2),
    FOREIGN KEY (Location_ID) REFERENCES LOCATION(Location_ID)
);
