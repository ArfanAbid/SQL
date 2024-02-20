USE  dbms;

CREATE TABLE student_1(
Name VARCHAR(50),
Reg_NO INT PRIMARY KEY,
Courses VARCHAR(100),
Course_Code INT,
Offered_By VARCHAR(100)
);

INSERT INTO student_1 (Name, Reg_NO, Courses, Course_Code, Offered_By)
VALUES
('Ali', 1, 'DIP', 1001, 'Mr. A'),
('Basit', 2, 'DBMS', 1002, 'Mr. X'),
('Akram', 3, 'OS', 1003, 'Mr. Y'),
('Asad', 4, 'DBMS', 1002, 'Mr. X'),
('Zeeshan', 5, 'DIP', 1001, 'Mr. A'),
('Muneer', 6, 'OS', NULL, 'Mr. Y'),
('Shafqat', 7, 'NM', 1004, 'Mr. H'),
('Ahsan', 8, 'OS', 1003, 'Mr. Y'),
('Ikram', 9, NULL, NULL, NULL), 
('Iffi', 10, 'DSA', '1000', 'Mr. Y'); 

----- SELECT Commands -------

SELECT * FROM student_1;

SELECT name,Courses FROM student_1;

SELECT DISTINCT Courses FROM student_1;

SELECT * FROM student_1 WHERE Reg_NO > 5;

SELECT * FROM student_1 WHERE name ="Iffi";

SELECT * FROM student_1 WHERE Reg_NO>5 AND Course_Code=1003;

SELECT * FROM student_1 WHERE Reg_NO>5 OR Course_Code=1003;

SELECT * FROM student_1 WHERE Reg_NO  BETWEEN 3 AND 8 ;

SELECT * FROM student_1 WHERE Course_Code IN (1000,1003);

SELECT * FROM student_1 WHERE Course_Code IN (1000,222);

SELECT * FROM student_1 WHERE Offered_By NOT IN ("Mr. Y");

SELECT * FROM student_1 LIMIT 3;

SELECT * FROM student_1 ORDER BY Reg_NO DESC;

SELECT * FROM student_1 ORDER BY Reg_NO DESC LIMIT 3;

SELECT MAX(Course_code) FROM student_1;

SELECT COUNT(Reg_NO) AS Total_Student FROM student_1;

SELECT Courses,COUNT(Reg_NO) FROM student_1 GROUP BY Courses;

SELECT Courses,name FROM student_1 GROUP BY Courses,Name;




---- Better to see practice3 from here 

SELECT Courses,AVG(Reg_NO) 
FROM student_1 
GROUP BY Courses
ORDER BY Courses DESC;

----- count no of students under each teacher 
SELECT Offered_By,COUNT(Reg_NO) AS Total_students 
FROM student_1 
GROUP BY Offered_By
ORDER BY COUNT(Reg_NO);

--- count no of students in each subject/course having 

SELECT Courses,COUNT(Reg_NO) 
FROM student_1
GROUP BY Courses
HAVING MAX(Course_Code) >1003;





