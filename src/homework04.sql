-- 1. Найти мин/стоимость товаров для каждой категории
SELECT
    Categories.CategoryName,
    Products.ProductName,
    MIN(Products.Price) AS min_price_of_category
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
-- JOIN Categories USING(CategoryID)
GROUP BY Products.CategoryID

-- 2. Вывести ТОП-3 стран по количеству доставленных заказов
SELECT
    Customers.Country,
    COUNT(*) AS number_orders
FROM Orders
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
-- JOIN Customers USING(CustomerID)
GROUP BY Customers.Country
ORDER BY number_orders DESC
LIMIT 3

-- 3. Вывести названия категорий, в которых более 10 товаров
SELECT
    Categories.CategoryName,
    COUNT(*) AS number_products
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
-- JOIN Categories USING(CategoryID)
GROUP BY Products.CategoryID
HAVING number_products > 10
ORDER BY number_products DESC

-- 4. Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET Phone=''
WHERE Country LIKE 'USA'

-- 5. Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT
    Employees.FirstName,
    Employees.LastName,
    COUNT(*) AS number_orders
FROM Orders
JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
GROUP BY Orders.EmployeeID
HAVING number_orders<15
ORDER BY number_orders DESC

-- 6. Вывести товар, который находится на втором месте по ко-ву заказов
SELECT
    Products.ProductName,
    COUNT(*) AS number_orders
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID
GROUP BY OrderDetails.ProductID
ORDER BY number_orders DESC
LIMIT 1 OFFSET 1
