--1. Table that holds products sold
SELECT *
FROM dbo.Products;

--2. List product id, name, and unit price of all products
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products;

--3. Do number 2, but in Ascending Order by Price
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
ORDER BY UnitPrice ASC;

--4. Products carried priced $7.50 or less
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice < 7.50;

--5. Products with at least 100 units on hand in descending order by price
SELECT ProductID, ProductName, UnitsInStock, UnitPrice
FROM dbo.Products
WHERE UnitsInStock > 100
ORDER BY UnitPrice DESC

--6. at least 100 units on hand, descending order by price, if 2 or more have same price, list in ascending order by name
SELECT ProductID, ProductName, UnitsInStock, UnitPrice
FROM dbo.Products
WHERE UnitsInStock > 100
ORDER BY UnitPrice DESC, ProductName ASC;

--7.no units on hand, but 1 or more units of them on backorder?

SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder
FROM dbo.Products
WHERE UnitsInStock = 0 AND UnitsOnOrder > 0
ORDER BY ProductName ASC;

--8. Categories holds the types of items
--9. List all col and row of categories table, Seafood id is 8
SELECT *
FROM dbo.Categories;

--10.Products table has a Category ID column to identify which type a product is. Query all seafood
SELECT ProductID, ProductName, C.CategoryName
FROM dbo.Products as P
JOIN dbo.Categories as C ON C.CategoryID = P.CategoryID
WHERE C.CategoryID = 8;

--11. first and last names of all employees
SELECT EmployeeID, LastName, FirstName
FROM dbo.Employees;

--12.Employees with manager in title
SELECT EmployeeID, LastName, FirstName, Title
FROM dbo.Employees
WHERE Title LIKE '%manager%';

--13.Distinct job titles
SELECT DISTINCT Title
FROM dbo.Employees;

--14.employees with salary that is between $200 0 and $2500?
SELECT EmployeeID, LastName, FirstName, Title, Salary
FROM dbo.Employees
WHERE Salary BETWEEN 2000 AND 2500;



--15. List all of the information about all of Northwind's suppliers. 
SELECT *
FROM dbo.Suppliers;

--16. List items supplied from 'Tokyo Traders'
SELECT *
FROM dbo.Products as P
JOIN dbo.Suppliers as S ON P.SupplierID = S.SupplierID
WHERE S.CompanyName LIKE 'Tokyo Traders';


SELECT *
FROM dbo.Employees;

SELECT MIN(LastName)
FROM dbo.Employees;

SELECT *
FROM dbo.Products;

SELECT COUNT(*)
FROM dbo.Products;

SELECT *
FROM dbo.Products
WHERE CategoryID = 1;

SELECT CategoryID, COUNT(*)
FROM dbo.Products
GROUP BY CategoryID
ORDER BY CategoryID

SELECT *
FROM dbo.Categories;

--SUM of all products of each category
SELECT C.CategoryName AS [Category Name], SUM(UnitsInStock) as [Units In Stock]
FROM dbo.Products AS P
JOIN dbo.Categories AS C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName
HAVING SUM(UnitsInStock) > 500
ORDER BY C.CategoryName;

SELECT P.CategoryID AS [Category ID], SUM(UnitsInStock) as [Units In Stock]
FROM dbo.Products AS P
JOIN dbo.Categories AS C ON P.CategoryID = C.CategoryID
GROUP BY P.CategoryID
HAVING SUM(UnitsInStock) BETWEEN 300 AND 400
ORDER BY P.CategoryID;


/*ALTER TABLE dbo.Employees
ADD Salary DECIMAL(10,2);

UPDATE dbo.Employees
SET Salary = 2001.00
WHERE EmployeeID = 1;
UPDATE dbo.Employees
SET Salary = 5000.00
WHERE EmployeeID = 2;
UPDATE dbo.Employees
SET Salary = 2002.00
WHERE EmployeeID = 3;
UPDATE dbo.Employees
SET Salary = 2003.00
WHERE EmployeeID = 4;
UPDATE dbo.Employees
SET Salary = 2499.00
WHERE EmployeeID = 5;
UPDATE dbo.Employees
SET Salary = 2500.00
WHERE EmployeeID = 6;
UPDATE dbo.Employees
SET Salary = 2006.00
WHERE EmployeeID = 7;
UPDATE dbo.Employees
SET Salary = 1000.00
WHERE EmployeeID = 8;
UPDATE dbo.Employees
SET Salary = 2009.00
WHERE EmployeeID = 9;*/