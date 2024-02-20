USE dbms;

CREATE TABLE student_2 (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT,
    grade VARCHAR(3),
    city VARCHAR(50)
);


INSERT INTO student_2 (rollno, name, marks, grade, city) 
VALUES
    (101, 'John Doe', 85, 'A', 'New York'),
    (102, 'Jane Smith', 92, 'A+', 'Los Angeles'),
    (103, 'Michael Johnson', 78, 'B', 'Chicago'),
    (104, 'Emily Brown', 70, 'C', 'New York'),
    (105, 'David Wilson', 89, 'A', 'Chicago'),
    (106, 'Sarah Davis', 95, 'A+', 'Miami'),
    (107, 'Daniel Martinez', 83, 'A-', 'New York'),
    (108, 'Jessica Taylor', 72, 'B-', 'Seattle'),
    (109, 'Christopher Anderson', 60, 'D', 'Atlanta'),
    (110, 'Olivia White', 88, 'A', 'Chicago');
    
    
SELECT MAX(marks) FROM student_2;

SELECT city,COUNT(rollno) 
FROM student_2 
GROUP BY city;

SELECT grade,COUNT(rollno)
FROM student_2
GROUP BY grade
ORDER BY grade ;

--- count no of students in each city where max marks cross 90
SELECT city,COUNT(name)   
FROM student_2
GROUP BY city
HAVING MAX(marks) > 90 ;

--- WHERE and HAVING 

SELECT city
FROM student_2
WHERE grade='A'
GROUP BY city
HAVING MAX(marks) > 85;

--- General order/Sequence

SELECT city
FROM student_2
WHERE grade='A'
GROUP BY city
HAVING MAX(marks) >= 85
ORDER BY city ASC;

--- Table Related Querues

SET SQL_SAFE_UPDATES=0; --- for turn off safe mode

UPDATE student_2
SET grade='O'
Where grade='A+';

SELECT * FROM student_2;

UPDATE student_2
SET marks=12
WHERE rollno=109;

UPDATE student_2
SET grade='B'
WHERE marks BETWEEN 80 AND 90;

UPDATE student_2
SET marks=marks +1;

DELETE FROM student_2
WHERE marks < 33;

SELECT * FROM student_2;

--- Alter:

ALTER TABLE student_2
ADD COLUMN age INT;

ALTER TABLE student_2
DROP COLUMN age;

---------- Practice Alter

ALTER TABLE student_2
ADD COLUMN age INT NOT NULL DEFAULT 18;

ALTER TABLE student_2
MODIFY COLUMN age VARCHAR(2);

----- ERROR : Data too long to insert
INSERT INTO student_2 (rollno, name, marks, grade, city,age)    
VALUES
(109, 'John Doe', 85, 'A', 'New York',100);

---- so we use CHANGE 

ALTER TABLE student_2
CHANGE age stu_age INT;

---- now we can insert data 
INSERT INTO student_2 (rollno, name, marks, grade, city,stu_age)    
VALUES
(109, 'John Doe', 85, 'A', 'New York',100);


ALTER TABLE student
RENAME student_0;



---------------------------------------------------------


