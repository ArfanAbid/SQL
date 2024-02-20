--- Foreign Key

CREATE TABLE courses(
id INT PRIMARY KEY,
name VARCHAR(50)

);

INSERT INTO courses
VALUES
(101,"DSA"),
(102,"DBMS");

SELECT * FROM courses;

CREATE TABLE teacher(
id INT PRIMARY KEY,
name VARCHAR(50),
course_id INT,
FOREIGN KEY (course_id) REFERENCES courses(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO teacher
VALUES
(01,"Arfan",101),
(02,"Iffi",102);

SELECT * FROM teacher;

-----  CASCADE  UPDATING, see Result:

--- we can UPDATE and DELETE in parent then changes reflect in child
UPDATE courses
SET id=111
WHERE id=102;

----- but when UPDATE and DELETE in child, it  does not change reflect in parent error 1452
UPDATE teacher
SET course_id=222
WHERE name="Iffi";
