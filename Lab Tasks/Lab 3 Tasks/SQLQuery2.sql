

CREATE TABLE record(
O_ID INT PRIMARY KEY,
Order_Price INT,
Customer VARCHAR(50)
);

INSERT INTO record (O_Id, Order_Price, Customer)
VALUES
(1, 1000, 'Hansen'),
(2, 1600, 'Nilsen'),
(3, 700, 'Hansen'),
(4, 300, 'Hansen'),
(5, 2000, 'Jensen'),
(6, 100, 'Nilsen');

-- Task 7:

SELECT Customer, SUM(Order_Price) AS TotalOrder FROM record WHERE Customer IN ('Hansen', 'Nilsen') GROUP BY Customer HAVING SUM(Order_Price) < 2100;


SELECT Customer
FROM record
GROUP BY Customer
HAVING SUM(Order_Price) > 1800;
