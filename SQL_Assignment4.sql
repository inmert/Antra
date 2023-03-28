-- Assignment 4 Priyan Rai

USE Northwind
GO

-- Question 1
CREATE VIEW view_product_order_rai AS 
SELECT p.ProductName, Count(o.Quantity) AS "Total Quantity" 
FROM Products p
INNER JOIN[Order Details] o on o.ProductID = p.ProductID 
GROUP BY p.ProductName;
GO
SELECT * FROM view_product_order_rai


-- Question 2
GO
CREATE PROC sp_product_order_quantity_rai
@product_id int,
@total_quantity int output AS 
BEGIN 
SELECT @product_id = p.productid FROM Products p
INNER JOIN[Order Details] od on p.ProductID = od.ProductID 
WHERE SUM(od.quantity) = @product_id
GROUP BY p.ProductID 
END

DECLARE @total int
EXEC sp_product_order_quantity_rai 1, @total
PRINT @total


-- Question 4
CREATE TABLE people_rai(id int, Name char(24), City int)
CREATE TABLE city_rai(id int, City char(24))

INSERT INTO city_rai(id,City)values(1,'Settle')
INSERT INTO city_rai(id,City)values(2,'Green Bay')
INSERT INTO people_rai(id,Name,City)values(1,'Aaron Rodgers',2)
INSERT INTO people_rai(id,Name,City)values(2,'Russell Wilson',1)
INSERT INTO people_rai(id,Name,City)values(3,'Jody Nelson',2)

GO

CREATE VIEW Packers_rai AS
SELECT pr.id, pr.Name 
FROM dbo.people_rai pr
INNER JOIN city_rai c on pr.City=c.City
WHERE c.city='Green bay'

GO
BEGIN TRAN
ROLLBACK
DROP TABLE city_rai
DROP TABLE people_rai
DROP TABLE Packers_rai


-- Question 5
GO
CREATE PROC sp_birthday_employees_rai AS 
BEGIN 
SELECT EmployeeID , FirstName , LastName , BirthDate
INTO birthday_employees_rai 
FROM Employees 
WHERE Month(BirthDate) = 2 
END 
DROP TABLE birthday_employees_rai


-- Question 6
-- We can use the EXCEPT operator and SELECT * from both tables to return rows that exist in one but not the other to vferify if they have same data
SELECT * FROM Table1
EXCEPT
SELECT * FROM Table2
