SELECT *
FROM Cookies.Cookie

SELECT *
FROM Cookies.Sales S

SELECT *
FROM Cookies.Customer




SELECT *
FROM Cookies.Sales S
JOIN Cookies.Cookie cook ON cook.id = S.cookie
JOIN Cookies.Customer cust ON cust.id = S.customerId

SELECT cust.CustomerName, cook.name
FROM Cookies.Sales S
JOIN Cookies.Cookie cook ON cook.id = S.cookie
JOIN Cookies.Customer cust ON cust.id = S.customerId

SELECT cust.CustomerName, COUNT(*) AS NumOfCookies
FROM Cookies.Sales S
JOIN Cookies.Cookie cook ON cook.id = S.cookie
JOIN Cookies.Customer cust ON cust.id = S.customerId
GROUP BY cust.CustomerName

SELECT cook.name AS CookieName, cook.Flavor, COUNT(*) AS NumOfCookies
FROM Cookies.Sales S
JOIN Cookies.Cookie cook ON cook.id = S.cookie
JOIN Cookies.Customer cust ON cust.id = S.customerId
GROUP BY cook.Flavor, cook.name


SELECT COUNT(*) AS [Total Cookies Sold]
FROM Cookies.Sales S


SELECT 
    C.id AS CustomerID,             -- Unique ID of the customer
    C.CustomerName,                 -- Name of the customer
    C.NewColumn,                    -- Extra column (could represent loyalty points, tier, etc.)
    S.id AS SaleID,                 -- Unique ID of the sale
    CK.name AS CookieName,          -- Name of the cookie sold
    CK.flavor                       -- Flavor of the cookie sold
FROM [Cookies].[Customer] AS C
JOIN [Cookies].[Sales] AS S ON C.id = S.customerId        -- Match customers with their sales
JOIN [Cookies].[Cookie] AS CK ON S.cookie = CK.id         -- Match sales with the specific cookie sold

-- Count how many cookies each customer has bought (total number of sales per customer)
SELECT 
    C.CustomerName,                -- Name of the customer
    COUNT(S.id) AS TotalCookiesBought  -- Total number of cookies purchased
FROM [Cookies].[Sales] AS S
JOIN [Cookies].[Customer] AS C ON S.customerId = C.id     -- Link each sale to a customer
GROUP BY C.CustomerName           -- Group by customer to count sales per person
ORDER BY TotalCookiesBought DESC  -- Show the top buyers first

-- How many customers are there by city
SELECT City,  COUNT(CustomerID) as [Amount of Customers]
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) > 3 
Order BY [Amount of Customers] DESC

SELECT *
FROM [Cookies].Customer as CC LEFT JOIN [Cookies].YN_orders AS co 
ON CC.id = co.user_id