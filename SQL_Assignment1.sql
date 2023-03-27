--Assignment Day 1 Priyan Rai

Use AdventureWorks2019

--Question 1
Select ProductID, Name, Color, ListPrice
From Production.Product

--Question 2
Select ProductID, Name, Color, ListPrice
From Production.Product
Where ListPrice != 0

--Question 3
Select ProductID, Name, Color, ListPrice
From Production.Product
Where Color is NULL

--Question 4
Select ProductID, Name, Color, ListPrice
From Production.Product
Where Color is NOT NULL

--Question 5
Select ProductID, Name, Color, ListPrice
From Production.Product
Where Color is NOT NULL And ListPrice > 0

--Question 6
Select CONCAT(Name,'/',Color) as 'Name/Color'
From Production.Product
Where Color is NOT NULL

--Question 7
Select CONCAT('NAME: ',Name,' -- COLOR: ',Color) as 'Name and Color'
From Production.Product
Where Color is NOT NULL

--Question 8
Select ProductID, Name
From Production.Product
Where ProductID > 400 And ProductID < 500

--Question 9
Select ProductID, Name, Color
From Production.Product
Where Color = 'Black' Or Color = 'Blue'

--Question 10
Select Name
From Production.Product
Where Name Like 'S%'

--Question 11
Select Name, ListPrice
From Production.Product
Where Name Like 'S%'
ORDER BY Name

--Question 12
Select Name, ListPrice
From Production.Product
Where Name Like '[AS]%'
ORDER BY Name

--Question 13
Select Name
From Production.Product
Where Name Like 'SPO[^K]%'
Order by Name

--Question 14
Select Distinct Color
From Production.Product
ORDER BY Color DESC

--Question 15
Select Distinct ProductSubcategoryID, Color
From Production.Product
Where ProductSubcategoryID is NOT NULL And Color is NOT NULL
