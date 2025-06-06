--1. product id, product name, unit price, category name of all products, ordered by category name and within that, by product name
SELECT P.ProductID, P.ProductName, P.UnitPrice, C.CategoryName
FROM dbo.Products As P
INNER JOIN dbo.Categories AS C ON P.CategoryID = C.CategoryID
ORDER BY C.CategoryName, P.ProductName

--2, product id, product name, unitprice, supplier name of all products over $75, order by product name
SELECT P.ProductID, P.ProductName, P.UnitPrice, S.CompanyName
FROM dbo.Products AS P
INNER JOIN dbo.Suppliers AS S ON P.SupplierID = S.SupplierID
WHERE P.UnitPrice > 75
ORDER BY P.ProductName

--3. Product id, product name, unit price, category name, and supplier name, ordered by product name
SELECT P.ProductID, P.ProductName, P.UnitPrice, C.CategoryName, S.CompanyName
FROM dbo.Products AS P
INNER JOIN dbo.Suppliers AS S ON P.SupplierID = S.SupplierID
INNER JOIN dbo.Categories AS C ON P.CategoryID = C.CategoryID
ORDER BY P.ProductName

--4. Product names and categories of most expensive products
SELECT P.ProductName, C.CategoryName, P.UnitPrice
FROM dbo.Products AS P
INNER JOIN dbo.Categories AS C ON P.CategoryID = C.CategoryID
WHERE UnitPrice > (SELECT MAX(UnitPrice) FROM dbo.Products) - 200

--5. order ID, ship name, ship address, shipping company name of every order shipped to Germany
SELECT O.OrderID, O.ShipName, O.ShipAddress, S.CompanyName
FROM dbo.Orders O 
INNER JOIN dbo.Shippers S ON O.ShipVia = S.ShipperID
WHERE ShipCountry = 'Germany'

--6. order ID, order date, shipName, shipAddress of orders ordering Sasquatch Ale
SELECT O.OrderID, O.ShipName, O.ShipAddress, S.CompanyName, P.ProductName
FROM dbo.Orders O 
INNER JOIN dbo.Shippers S ON O.ShipVia = S.ShipperID
INNER JOIN dbo.[Order Details] OD ON O.OrderID = OD.OrderID
INNER JOIN dbo.Products P ON OD.ProductID = P.ProductID
WHERE P.ProductName = 'Sasquatch Ale'

SELECT *
FROM dbo.Orders


SELECT *
FROM dbo.[Order Details]