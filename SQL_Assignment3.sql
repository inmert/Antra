-- Assignment 3 Priyan Rai

USE Northwind

-- Question 1
SELECT Distinct e.City 
FROM Employees e
INNER JOIN Customers c ON e.City = c.City


-- Question 2A With Subquery
SELECT Distinct c.City 
FROM Customers c
WHERE c.City NOT in (SELECT e.City FROM Employees e)


-- Question 2B Without Subquery
SELECT Distinct c.City
FROM Customers c, Employees e
WHERE c.City != e.City


-- Question 3
SELECT p.ProductName , SUM(o.Quantity) AS "Total Quantity" 
FROM Products p ,[Order Details] o
WHERE p.ProductID = o.ProductID
GROUP BY p.ProductName



-- Question 4
SELECT c.City , SUM(p.ProductID) AS "Total Products" 
FROM Products p 
INNER JOIN [Order Details] od ON od.ProductID = p.ProductID 
INNER JOIN Orders o ON o.OrderID = od.OrderID
INNER JOIN Customers c ON c.CustomerID = o.CustomerID 
GROUP BY c.City
ORDER BY c.City


-- Question 5A With Union
SELECT City, COUNT(CustomerID) AS "CustCount"
FROM Customers
GROUP BY City Having COUNT(CustomerID) = 2
UNION
SELECT City, COUNT(CustomerID) AS "CustCount"
FROM Customers
GROUP BY City Having COUNT(CustomerID) > 2
ORDER BY CustCount DESC


-- Question 5B With Subquery/ No Union
SELECT Distinct City
FROM Customers 
WHERE City in 
(
SELECT City 
FROM Customers 
GROUP BY City Having COUNT(CustomerID) >= 2
)


-- Question 6
SELECT c.City , COUNT(Distinct p.ProductID) "Different Products" 
FROM Products p 
INNER JOIN [Order Details] od ON od.ProductID = p.ProductID 
INNER JOIN Orders o ON o.OrderID = od.OrderID
INNER JOIN Customers c ON c.CustomerID = o.CustomerID 
GROUP BY c.City Having COUNT(Distinct p.ProductID) >= 2
ORDER BY c.City


-- Question 7
SELECT Distinct c.ContactName, c.City ,o.ShipCity
FROM Customers c 
INNER JOIN Orders o ON o.CustomerID = c.CustomerID 
WHERE c.City != o.ShipCity;


-- Question 8
SELECT TOP 5  p.ProductName, AVG(p.UnitPrice) "Avg Price", c.City  
FROM Products p 
INNER JOIN [Order Details] od ON od.ProductID = p.ProductID 
INNER JOIN Orders o ON o.OrderID = od.OrderID
INNER JOIN Customers c  ON c.CustomerID = o.CustomerID 
group by p.ProductName, c.City 
order by SUM(od.Quantity) DESC


-- Question 9A With Subquery
SELECT c.City 
FROM Customers c 
WHERE c.City  in 
(
SELECT cc.City  
FROM Customers cc
LEFT JOIN Orders o ON cc.CustomerID = o.CustomerID AND o.EmployeeID in 
(SELECT oo.EmployeeID FROM Orders oo) 
GROUP BY cc.City HAVING COUNT(OrderID) = 0
)

-- Question 9B Without Subquery
SELECT c.City
FROM Customers c 
LEFT JOIN Orders o on c.CustomerID  = o.CustomerID 
LEFT JOIN Employees e on e.EmployeeID = o.EmployeeID  
GROUP BY c.city HAVING COUNT(OrderID) = 0


-- Question 11
-- While there are various ways to delete duplicate records from a table, here is one way using CTEs
WITH CTENAME AS (
  SELECT Col1,Col2, ROW_NUMBER() OVER(PARTITION BY Col1,Col2 ORDER BY Col1) AS RowNUM
  FROM TableName
)
DELETE FROM CTENAME WHERE RowNUM > 1;




