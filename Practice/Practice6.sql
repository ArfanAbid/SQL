------------- Joins in SQL


USE dbms;

CREATE TABLE student_4(
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO student_4(id,name)
VALUES
(101,'Arfan'),
(102,'Iffi'),
(103,'hadi');

CREATE TABLE courses_04(
id INT PRIMARY KEY,
courses VARCHAR(50) 
);

INSERT INTO courses_04(id,courses)
VALUES
(102,'OS'),
(105,'CA'),
(103,'DSA'),
(107,'DBMS');

SELECT * FROM student_4;

--- alias -> alternate name like student as s


--- Inner Join

SELECT *
FROM student_4 
INNER JOIN courses_04 
ON student_4.id=courses_04.id;
 
SELECT *
FROM student_4 AS s 
INNER JOIN courses_04  AS c
ON s.id=c.id;

--- LEFT JOIN

SELECT *
FROM student_4 as s
LEFT JOIN courses_04 c
ON s.id=c.id;

--- RIGHT JOIN

SELECT *
FROM student_4 as s
RIGHT JOIN courses_04 c
ON s.id=c.id;

 --- FULL JOIN
 
SELECT *
FROM student_4 as s
LEFT JOIN courses_04 c
ON s.id=c.id
UNION
SELECT *
FROM student_4 as s
RIGHT JOIN courses_04 c
ON s.id=c.id;

--- Left Exclusive JOIN

SELECT *
FROM student_4 as s
LEFT JOIN courses_04 c
ON s.id=c.id
WHERE c.id IS NULL;

--- Right Exclusive JOIN

SELECT *
FROM student_4 as s
RIGHT JOIN courses_04 c
ON s.id=c.id
WHERE s.id IS NULL;

--- self JOIN learn it 
 
 
 

