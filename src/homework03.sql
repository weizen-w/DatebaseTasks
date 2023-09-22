-- 1. Вывести ко-во поставщиков не из UK и не из China
SELECT COUNT(*)
FROM Suppliers
WHERE
    NOT Country IN ('UK', 'China')

-- 2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT
    AVG(Price) AS avg_price,
    MIN(Price) AS min_price,
    MAX(Price) AS max_price
FROM Products
WHERE
    CategoryID IN (3, 5)

-- 3. Вывести общую сумму проданных товаров
SELECT
    SUM(Products.Price * OrderDetails.Quantity) AS total_sold
FROM OrderDetails
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Products ON OrderDetails.ProductID = Products.ProductID

-- 4. Вывести ко-во стран, которые поставляют напитки
SELECT
    COUNT(DISTINCT Suppliers.Country) AS number_countries_beverages
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE
    Categories.CategoryName LIKE 'Beverages'

-- 5. Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT
    SUM(Products.Price * OrderDetails.Quantity) AS total_sold
FROM OrderDetails
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE
    Customers.Country='Germany'
