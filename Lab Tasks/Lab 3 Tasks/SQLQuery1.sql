CREATE DATABASE Lab_03;

USE lab_03;

CREATE TABLE student(
Name VARCHAR(50),
Reg_NO INT PRIMARY KEY,
Courses VARCHAR(50),
Course_Code INT,
Offered_By VARCHAR(50)
);


INSERT INTO student (Name, Reg_NO, Courses, Course_Code, Offered_By)
VALUES
('Ali', 1, 'DIP', 1001, 'Mr. A'),
('Basit', 2, 'DBMS', 1002, 'Mr. X'),
('Akram', 3, 'OS', 1003, 'Mr. Y'),
('Asad', 4, 'DBMS', 1002, 'Mr. X'),
('Zeeshan', 5, 'DIP', 1001, 'Mr. A'),
('Muneer', 6, 'OS', NULL, 'Mr. Y'),
('Shafqat', 7, 'NM', 1004, 'Mr. H'),
('Ahsan', 8, 'OS', 1003, 'Mr. Y'),
('Ikram', 9, 'DIP', NULL, 'Mr. A'), 
('Hassan', 10, 'DSP', NULL, NULL); 



SELECT * FROM student

-- Task 1 PART 1: 
SELECT COUNT(Courses) AS Courses_Count FROM student;
SELECT COUNT(Course_Code) AS Offered_Code_Count From student;
SELECT COUNT(Offered_By) AS Offered_By_Count FROM student;

-- Task 1 PART 2:
SELECT COUNT(DISTINCT Reg_NO) AS Total FROM student WHERE Course_Code=1002;

-- Task 1 part 3:
SELECT COUNT(*) AS Total_DIP_Student FROM student WHERE Courses='DIP';

-- Task 2: 

SELECT LOWER(Name) AS  LowerCase_Name FROM student;
SELECT LOWER(Courses) AS  LowerCase_Name FROM student;
SELECT LOWER(Offered_By) AS  LowerCase_Name FROM student;


SELECT UPPER(Name) AS  UpperCase_Name FROM student;
SELECT UPPER(Courses) AS  UpperCase_Name FROM student;
SELECT UPPER(Offered_By) AS  UpperCase_Name FROM student;


-- Task 3: 

SELECT Courses, COUNT(Name) AS No_Of_Students FROM student GROUP BY Courses;


-- Task 4:

SELECT MAX(Reg_NO) AS Max_RegNO  FROM student;
SELECT MIN(Course_Code) AS Max_CourseCode  FROM student;

-- Task 5:

SELECT LEN(Name) AS Max_Length FROM student;

-- Task 6: 

SELECT AVG(Reg_NO) AS Max_REG FROM student;


