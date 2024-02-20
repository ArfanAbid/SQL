---- Practice questions

CREATE TABLE student_3 (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT,
    grade VARCHAR(3),
    city VARCHAR(50)
);


INSERT INTO student_3 (rollno, name, marks, grade, city) 
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
    
    
    
ALTER TABLE student_3
RENAME column name TO full_Name;
--- OR
ALTER TABLE student_3
CHANGE name full_name VARCHAR (50);

SELECT * FROM student_3;

SET SQL_SAFE_UPDATES=0; --- for turn off safe mode

DELETE FROM student_3
WHERE marks < 80;

ALTER TABLE student_3
DROP COLUMN grade;