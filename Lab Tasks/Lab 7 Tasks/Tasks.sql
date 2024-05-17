CREATE DATABASE Lab_07;

------------------------------------------
			-- Task 2
------------------------------------------

CREATE TABLE Supplier2(
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(50)
);

INSERT INTO Supplier2
VALUES
(10000,'IBM'),
(10001,'Hewlett Packard'),
(10002,'Microsoft'),
(10003,'Nvdia');


CREATE TABLE Orderr(
order_id INT PRIMARY KEY,
supplier_id INT,
order_date DATE
);

INSERT INTO Orderr
VALUES
(500125,10000,'2003/05/12'),
(500126,10001,'2003/05/13');


			-- a)

SELECT Supplier2.supplier_id,supplier_name,order_date
FROM Supplier2
LEFT JOIN Orderr
ON Supplier2.supplier_id=Orderr.supplier_id
ORDER BY supplier_id;

			-- b)
SELECT Orderr.order_id,order_date,supplier_name
FROM Supplier2
RIGHT JOIN Orderr
ON Supplier2.supplier_id=Orderr.supplier_id
ORDER BY order_id;

			-- c)

SELECT Supplier2.supplier_id,supplier_name,order_date
FROM Supplier2
FULL JOIN Orderr
ON Supplier2.supplier_id=Orderr.supplier_id
ORDER BY supplier_id;

----------------------------------------------------
			--  Task 3
----------------------------------------------------



CREATE TABLE Building (
    Building_name VARCHAR(10),
    Capacity INT
);

INSERT INTO Building (Building_name, Capacity) VALUES
('1e', 24),
('1w', 32),
('2e', 16),
('2w', 20);

CREATE TABLE Employees (
    Role VARCHAR(50),
    Name VARCHAR(50),
    Building VARCHAR(10),
    Years_employed INT
);

INSERT INTO Employees (Role, Name, Building, Years_employed) VALUES
('Engineer', 'Becky A.', '1e', 4),
('Engineer', 'Malcom S.', '1e', 1),
('Artist', 'Lillia A.', '2w', 7),
('Artist', 'Brandon J.', '2w', 7),
('Manager', 'Daria O.', '2w', 6);

-- List all buildings and the distinct employee roles in each building (including empty buildings)

SELECT DISTINCT Building_name, Role 
FROM Building
LEFT JOIN Employees 
ON Building_name = Building;


----------------------------------------------------------
				-- Task 4
---------------------------------------------------------

CREATE TABLE Movies (
    Id INT,
    Title VARCHAR(255),
    Director VARCHAR(255),
    Year INT,
    Length_minutes INT
);

INSERT INTO Movies (Id, Title, Director, Year, Length_minutes) VALUES
(1, 'Toy Story', 'John Lasseter', 1995, 81),
(2, 'A Bug''s Life', 'John Lasseter', 1998, 95),
(3, 'Toy Story 2', 'John Lasseter', 1999, 93),
(4, 'Monsters, Inc.', 'Pete Docter', 2001, 92),
(5, 'Finding Nemo', 'Andrew Stanton', 2003, 107),
(6, 'The Incredibles', 'Brad Bird', 2004, 116);

CREATE TABLE Boxoffice (
    Movie_id INT,
    Rating DECIMAL(3,1),
    Domestic_sales INT,
    International_sales INT
);

INSERT INTO Boxoffice (Movie_id, Rating, Domestic_sales, International_sales) VALUES
(5, 8.2, 380843261, 555900000),
(4, 7.4, 268492764, 475066843),
(1, 8.0, 206445654, 417277164),
(2, 6.4, 191452396, 368400000),
(3, 7.9, 245852179, 239163000),
(6, 8.0, 261441092, 370001000);


-- • Find the domestic and international sales for each movie 

SELECT m.Title, b.Domestic_sales, b.International_sales
FROM Movies m
INNER JOIN Boxoffice b 
ON m.Id = b.Movie_id;

-- Show the sales numbers for each movie that did better internationally rather than domestically 

SELECT m.Title, b.Domestic_sales, b.International_sales
FROM Movies m
INNER JOIN Boxoffice b
ON m.Id = b.Movie_id
WHERE b.International_sales > b.Domestic_sales;


-- • List all the movies by their ratings in descending order 

SELECT a.Title,b.Rating
FROM Movies a
INNER JOIN Boxoffice b
ON a.Id=b.Movie_id
ORDER BY Rating DESC;


