CREATE DATABASE Lab_11;
------------------------------------
		-- Activity 1
------------------------------------

CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    DEPARTMENT_ID INT,
    SALARY DECIMAL(10, 2)
);

INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY) 
VALUES 
(1, 'John', 'Doe', 80, 50000.00),
(2, 'Jane', 'Smith', 80, 55000.00),
(3, 'Mike', 'Johnson', 80, 60000.00),
(4, 'Emily', 'Brown', 80, 52000.00),
(5, 'David', 'Williams', 90, 48000.00),
(6, 'Sarah', 'Miller', 90, 51000.00),
(7, 'Chris', 'Jones', 90, 53000.00),
(8, 'Amanda', 'Taylor', 90, 59000.00),
(9, 'Ryan', 'Wilson', 100, 62000.00),
(10, 'Laura', 'Davis', 100, 58000.00);

CREATE TABLE DEPARTMENTS (
    DEPARTMENT_ID INT PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR(100),
    MANAGER_ID INT,
    LOCATION_ID INT
);

INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) 
VALUES 
(80, 'Engineering', 3, 1),
(90, 'Marketing', 8, 2),
(100, 'Sales', 9, 3);

CREATE TABLE LOCATIONS (
    LOCATION_ID INT PRIMARY KEY,
    STREET_ADDRESS VARCHAR(100),
    CITY VARCHAR(100),
    STATE_PROVINCE VARCHAR(100)
);

INSERT INTO LOCATIONS (LOCATION_ID, STREET_ADDRESS, CITY, STATE_PROVINCE) 
VALUES 
(1, '123 Main St', 'Anytown', 'CA'),
(2, '456 Elm St', 'Othertown', 'NY'),
(3, '789 Oak St', 'Anothertown', 'TX');

-- Query 1: Find all employees who earn more than the highest earner of department 80
SELECT E.LAST_NAME, E.DEPARTMENT_ID, E.SALARY 
FROM EMPLOYEES E 
WHERE E.SALARY > (SELECT MAX(EM.SALARY) FROM EMPLOYEES EM WHERE EM.DEPARTMENT_ID = 80);

-- Query 2: Find salary manager of each department using subquery
SELECT E.LAST_NAME, E.DEPARTMENT_ID, E.SALARY AS Salary 
FROM EMPLOYEES E 
WHERE E.EMPLOYEE_ID IN (SELECT D.MANAGER_ID FROM DEPARTMENTS D);

-- Query 3: Calculate the average salary for all departments
SELECT E.DEPARTMENT_ID, D.DEPARTMENT_NAME AS Department, AVG(E.SALARY) AS 'Average Salary' 
FROM EMPLOYEES E, DEPARTMENTS D 
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
GROUP BY E.DEPARTMENT_ID, D.DEPARTMENT_NAME 
ORDER BY E.DEPARTMENT_ID;

-- Query 4: Find all locations currently used in the Departments table
SELECT LOCATION_ID, STATE_PROVINCE 
FROM LOCATIONS 
WHERE EXISTS (SELECT LOCATION_ID FROM DEPARTMENTS);



-----------------------------------
		--Activity 2
-----------------------------------

--A)
SELECT E.DEPARTMENT_ID, AVG(E.SALARY) AS AVERAGE_SALARY 
FROM EMPLOYEES E
GROUP BY E.DEPARTMENT_ID 
HAVING AVG(E.SALARY) > (
    SELECT AVG(EM.SALARY)
    FROM EMPLOYEES EM
    WHERE EM.DEPARTMENT_ID = 80
);

--B)
SELECT E.LAST_NAME, E.FIRST_NAME, E.DEPARTMENT_ID, E.SALARY 
FROM EMPLOYEES E
WHERE E.SALARY > ALL (
    SELECT EM.SALARY
    FROM EMPLOYEES EM
    WHERE EM.DEPARTMENT_ID = 110
);

--C)
SELECT E.LAST_NAME, E.FIRST_NAME, E.DEPARTMENT_ID, E.SALARY 
FROM EMPLOYEES E
WHERE E.SALARY > ANY (
    SELECT EM.SALARY
    FROM EMPLOYEES EM
    WHERE EM.DEPARTMENT_ID = 100
);

--D)
SELECT E.LAST_NAME, E.FIRST_NAME, E.DEPARTMENT_ID, E.SALARY 
FROM EMPLOYEES E
WHERE E.SALARY = (
    SELECT AVG(EM.SALARY)
    FROM EMPLOYEES EM
    WHERE EM.DEPARTMENT_ID = E.DEPARTMENT_ID
);



--E)
SELECT L.LOCATION_ID, L.STATE_PROVINCE
FROM LOCATIONS L
WHERE L.LOCATION_ID NOT IN (
    SELECT LOCATION_ID
    FROM DEPARTMENTS
);


