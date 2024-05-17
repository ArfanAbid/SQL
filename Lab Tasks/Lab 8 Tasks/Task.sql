CREATE DATABASE Lab_08;
					---------------
					--Task 1
					---------------
--Create a Table and apply a Composite key on it

CREATE TABLE Employee (
    EmployeeID INT,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    PRIMARY KEY (EmployeeID, DepartmentID)
);

					---------------
					--Task 2
					---------------
-- Design the following table and run the queries to convert the table to 1NF (Normal form):

CREATE TABLE Branch (
    branchNo VARCHAR(10),
    branchAddress VARCHAR(100),
    telNo VARCHAR(20)
);

INSERT INTO Branch (branchNo, branchAddress, telNo)
VALUES 
    ('B001', '8 Jefferson Way, Portland, OR 97201', '503-555-3618'),
    ('B001', '8 Jefferson Way, Portland, OR 97201', '503-555-2727'),
    ('B001', '8 Jefferson Way, Portland, OR 97201', '503-555-6534'),
    ('B002', 'City Center Plaza, Seattle, WA 98122', '206-555-6756'),
    ('B002', 'City Center Plaza, Seattle, WA 98122', '206-555-8836'),
    ('B003', '14-8th Avenue, New York, NY 10012', '212-371-3000'),
    ('B004', '16-14th Avenue, Seattle, WA 98128', '206-555-3131'),
    ('B004', '16-14th Avenue, Seattle, WA 98128', '206-555-4112');

	SELECT * FROM Branch;
	DROP TAble Branch;


				    ---------------
					--Task 3
					---------------
--Design the following table and run the queries to convert the table to 2NF:


-- Staff table
CREATE TABLE Staff (
    staffNo INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    hoursPerWeek INT
);

-- Branch table
CREATE TABLE Branch (
    branchNo VARCHAR(10) PRIMARY KEY,
    branchAddress VARCHAR(100)
);

INSERT INTO Staff (staffNo, name, position, hoursPerWeek)
VALUES 
    (54555, 'Ellen Layman', 'Assistant', 16),
    (4555, 'Ellen Layman', 'Assistant', 9),
    (4612, 'Dave Sinclair', 'Assistant', 14),
    (84612, 'Dave Sinclair', 'Assistant', 10);

INSERT INTO Branch (branchNo, branchAddress)
VALUES 
    ('B002', 'City Center Plaza, Seattle, WA 98122'),
    ('B004', '16-14th Avenue, Seattle, WA 98128');

	SELECT * FROM Staff;
	SELECT * FROM Branch;



				    ---------------
					--Task 4
					---------------

--Design the following table and run the queries to convert the table to 3NF:

-- Staff table
CREATE TABLE Staff1 (
    staffNo VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Branch table
CREATE TABLE Branch1 (
    branchNo INT PRIMARY KEY,
    branchAddress VARCHAR(100),
    telNo VARCHAR(20)
);

-- StaffBranch table
CREATE TABLE StaffBranch (
    staffNo VARCHAR(10),
    branchNo INT,
    PRIMARY KEY (staffNo, branchNo),
    FOREIGN KEY (staffNo) REFERENCES Staff1(staffNo),
    FOREIGN KEY (branchNo) REFERENCES Branch1(branchNo)
);

INSERT INTO Staff1 (staffNo, name, position, salary)
VALUES 
    ('S0003', 'Tom Daniels', 'Manager', 1500),
    ('S0010', 'Sally Adams', 'Manager', 3250),
    ('S0415', 'Mary Martinez', 'Manager', 2250),
    ('S0416', 'Robert Chin', 'Supervisor', 4100),
    ('S0417', 'Sally Stern', 'Manager', 4800),
    ('S0418', 'Art Peters', 'Assistant', 3000);

INSERT INTO Branch1 (branchNo, branchAddress, telNo)
VALUES 
    (1, '8 Jefferson Way, Portland, OR 97201', '503-555-3618'),
    (2, 'City Center Plaza, Seattle, WA 98122', '206-555-6756'),
    (3, '14 - 8th Avenue, New York, NY 10012', '212-371-3000'),
    (4, '16 - 14th Avenue, Seattle, WA 98128', '206-555-3131');

INSERT INTO StaffBranch (staffNo, branchNo)
VALUES 
    ('S0003', 1),
    ('S0010', 1),
    ('S0415', 2),
    ('S0416', 2),
    ('S0417', 4),
    ('S0418', 2);

	SELECT * FROM StaffBranch;



