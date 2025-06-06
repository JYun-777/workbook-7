--1 Most Expensive Product
SELECT *
FROM dbo.Products
WHERE UnitPrice BETWEEN (SELECT MAX(UnitPrice) FROM dbo.Products)-00 AND (SELECT MAX(UnitPrice) FROM dbo.Products)

--2 order id, shipping name, shipping address of all orders shipped via "Federal Shipping"
SELECT OrderID, ShipName, ShipAddress
FROM dbo.Orders
WHERE ShipVia = (SELECT ShipperID FROM dbo.Shippers WHERE CompanyName = 'Federal Shipping')


SELECT *
FROM dbo.Employees

--3 order id of orders that bought sasquatch ale
SELECT *
FROM dbo.[Order Details]
WHERE ProductID = (SELECT ProductID FROM dbo.Products WHERE ProductName = 'Sasquatch Ale')

--4 employee that sold 10266
SELECT EmployeeID, FirstName, LastName
FROM dbo.Employees
WHERE EmployeeID = (SELECT EmployeeID FROM dbo.Orders WHERE OrderID = 10266)

--5 customer that bought 10266
SELECT *
FROM dbo.Customers
WHERE CustomerID = (SELECT CustomerID FROM dbo.Orders WHERE OrderID = 10266)