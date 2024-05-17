CREATE PROCEDURE GetEmployees 
 @LastName NVARCHAR(50), 
 @FirstName NVARCHAR(50) 
AS 
 SELECT FirstName, LastName, JobTitle, Department 
 FROM HR.Employees 
 WHERE FirstName = @FirstName AND LastName = @LastName; 
GO


EXEC GetEmployees @FirstName = 'Steven', @LastName = 'King'
;