--- SQL sub Queries:  and VIEWS

USE dbms;

SELECT * FROM student_2;
 
 --- Q. Get the names/marks of all students who secured more than class average 
 
SELECT AVG(marks) AS Average
FROM student_2;

SELECT name,marks
FROM student_2
WHERE marks > 84.6;
---- this is static approach so by using subqueries we can  implement it dynamically :

SELECT name,marks
FROM student_2
WHERE marks > (SELECT AVG(marks)  FROM student_2);

--- Q. Find the names of all the students with even numbers.

SELECT name,rollno
FROM student_2
WHERE rollno IN (
SELECT rollno 
FROM student_2 
WHERE rollno % 2 =0);

--- Q.   find max marks from the students of New York. Example of FROM

SELECT MAX(marks)
FROM (SELECT * FROM student_2 WHERE city='New York') AS MAx_MArks;
 
 --- Easy way
 
 SELECT MAX(marks)
 FROM student_2
 WHERE city='New York';
 
 
 --- VIEWS 
 
 CREATE VIEW view1 AS
 SELECT rollno,name,marks FROM student_2;
 
 SELECT * FROM view1;
 
 DROP VIEW view1;



