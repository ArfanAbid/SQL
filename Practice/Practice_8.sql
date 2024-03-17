-- PK and FK Relationship

CREATE TABLE Supplier1(
SupplierId INT PRIMARY KEY ,
SupplierName VARCHAR(50)
);


INSERT INTO Supplier1 (SupplierID, SupplierName)
VALUES
(1, 'Supplier A'),
(2, 'Supplier B'),
(3, 'Supplier C'),
(4, 'Supplier D'),
(5, 'Supplier E');

SELECT * FROM Supplier1;

CREATE TABLE Product2 (
ProductID INT,
ProductName VARCHAR(50),
SupplierID INT,
CategoryID INT,
Unit VARCHAR(50),
Price FLOAT, 
FOREIGN KEY (SupplierID) REFERENCES Supplier1(SupplierId)
);

SELECT * FROM Product2;

INSERT INTO Product2 (ProductID, ProductName, SupplierID, CategoryID, Unit, Price)
VALUES
(1,'Chais',1,1,'10 boxes x 20 bags',18),
(2,'Chang',2,1,'24 - 12 oz bottles',19),
(3,'Aniseed Syrup',3,2,'12 - 550 ml bottles',10),
(4,'Chef Antons Cajun Seasoning',4,2,'48 - 6 oz jars',22),
(5,'Chef Antons Gumbo Mix',5,2,'36 boxes',21.35);


DELETE FROM Supplier1
WHERE SupplierId =1;

DELETE FROM Product2
WHERE SupplierId =2;

