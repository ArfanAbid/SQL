CREATE DATABASE DBMS;
CREATE DATABASE IF NOT EXISTS DBMS;

USE dbms;

SHOW DATABASES;
SHOW TABLES;

CREATE TABLE student(
 id INT PRIMARY KEY,
 name VARCHAR(50),
 age INT NOT NULL
);

INSERT INTO student  VALUES(1,"Arfan",18);
INSERT INTO student VALUES(2,"Iffi",20);

DROP TABLE student;


------------------------------------------------


CREATE TABLE student(
rollNO INT PRIMARY KEY,
name VARCHAR(50) 
);

SELECT * FROM student;

INSERT INTO student(rollNO,name) 
VALUES
(101,"Arfan"),
(102,"Iffi");

INSERT INTO student VALUES(103,"IFFIONEX");
