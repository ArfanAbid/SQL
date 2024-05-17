USE Lab_11;

-- Lab Activities

CREATE TABLE departments1 (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments1 (department_id, department_name)
VALUES 
(1, 'Executive'),
(2, 'HR'),
(3, 'Finance');

CREATE TABLE employees1 (
    employee_id INT PRIMARY KEY,
    last_name VARCHAR(50),
    hire_date DATE,
    department_id INT,
    job_id VARCHAR(50),
    salary INT,
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES departments1(department_id),
    FOREIGN KEY (manager_id) REFERENCES employees1(employee_id)
);

INSERT INTO employees1 (employee_id, last_name, hire_date, department_id, job_id, salary, manager_id)
VALUES 
(101, 'Smith', '2020-01-01', 1, 'Manager', 50000, 201),
(102, 'Johnson', '2019-05-15', 1, 'Assistant Manager', 60000, 201),
(103, 'Williams', '2020-10-20', 2, 'Executive Assistant', 70000, 202),
(104, 'Jones', '2018-07-30', 2, 'Analyst', 55000, 202),
(105, 'Brown', '2021-03-05', 1, 'Secretary', 65000, 203),
(201, 'King', '2015-01-01', NULL, 'CEO', 100000, NULL),
(202, 'Queen', '2016-06-01', 1, 'Executive Director', 90000, 201),
(203, 'Prince', '2017-09-15', 1, 'Financial Controller', 80000, 201);

ALTER TABLE employees1
ADD CONSTRAINT fk_department_id
FOREIGN KEY (department_id) REFERENCES departments1(department_id);

ALTER TABLE employees1
ADD CONSTRAINT fk_manager_id
FOREIGN KEY (manager_id) REFERENCES employees1(employee_id);


-- Queries 1
SELECT last_name, hire_date
FROM employees1
WHERE department_id = (
    SELECT department_id
    FROM employees1
    WHERE last_name = 'Smith'
) AND last_name != 'Smith';

-- 2. Employees earning more than the average salary
SELECT employee_id, last_name, salary
FROM employees1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees1
);

-- 3. Employees in the Executive department
SELECT department_id, last_name, job_id
FROM employees1
WHERE department_id = (
    SELECT department_id
    FROM departments1
    WHERE department_name = 'Executive'
);

-- 4. Employees who report to 'King'
SELECT last_name, salary
FROM employees1
WHERE manager_id = (
    SELECT employee_id
    FROM employees1
    WHERE last_name = 'King'
);


