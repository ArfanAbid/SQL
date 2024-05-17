CREATE DATABASE Lab___10;

----------------------
	--Task 1
----------------------

CREATE TABLE person (
    p_id INT PRIMARY KEY,
    Name NVARCHAR(50),
    City NVARCHAR(50),
    age INT
);


CREATE PROCEDURE InsertPerson
    @p_id INT,
    @Name NVARCHAR(50),
    @City NVARCHAR(50),
    @Age INT
AS
BEGIN
    INSERT INTO person (p_id, Name, City, age)
    VALUES (@p_id, @Name, @City, @Age);
END;

EXEC InsertPerson 1, 'Shahid', 'D.G.KHAN', 25;

EXEC InsertPerson 2, 'Ahmad', 'Multan', 20;

EXEC InsertPerson 3, 'Ali', 'Multan', 22;


SELECT * FROM person;


---------------------------
	--Task 2
----------------------------


CREATE TABLE Emp (
    E_ID INT PRIMARY KEY,
    E_Name NVARCHAR(50),
    E_Salary DECIMAL(10, 4),
    E_Dept INT
);

CREATE TABLE Tbl_Dept (
    D_ID INT PRIMARY KEY,
    D_Name NVARCHAR(50),
    D_Head NVARCHAR(50)
);


INSERT INTO Emp (E_ID, E_Name, E_Salary, E_Dept)
VALUES (101, 'Shahid', 401, 10000.0000),
       (102, 'Faisal', 40000.0000, 403),
       (103, 'Nadeem', 90000.0000, 402),
       (104, 'Omer', 60000.0000, 404),
       (105, 'Adnan', 33000.0000, 401),
       (106, 'Shehryar', 27000.0000, 401),
       (107, 'Asif', 150000.0000, 401),
       (108, 'Imran', 160000.0000, 402),
       (109, 'Yasir', 140000.0000, 403),
       (110, 'Habib', 150000.0000, 404);

INSERT INTO Tbl_Dept (D_ID, D_Name, D_Head)
VALUES (401, 'Computer Engg', 'Asif'),
       (402, 'Software Engg', 'Imran'),
       (403, 'Telecom Engg', 'Computer Sci'),
       (404, 'Telecom Engg', 'Yasir');


CREATE PROCEDURE GetComputerEngineersAndHead
AS
BEGIN
    SELECT E.E_Name, E.E_Salary, D.D_Head
    FROM Emp E
    JOIN Tbl_Dept D ON E.E_Dept = D.D_ID
    WHERE D.D_Name = 'Computer Engg';
END;
GO


EXEC GetComputerEngineersAndHead;
