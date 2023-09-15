-- 1. Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT
    Products.ProductName,
    Products.Price AS PriceUSD
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID
ORDER BY Products.Price DESC
    LIMIT 1

-- 2. Вывести два самых дорогих товара из категории Beverages из USA
SELECT *
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE
    Categories.CategoryName='Beverages'
    AND
    Suppliers.Country='USA'
ORDER BY Products.Price DESC
    LIMIT 2

-- 3. Удалить товары с ценой менее 5 EUR
DELETE FROM Products
WHERE
    Price*1.07 < 5 -- Перевожу USD в EUR (предполагаю по умолчанию цена в USD исходя из 1 задачи)

-- 4. Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT
    Suppliers.Country
FROM Products
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
JOIN Categories ON Products.CategoryID=Categories.CategoryID
WHERE
    Categories.CategoryName='Seafood'

-- 5. Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET ContactName=''
WHERE
    NOT Country='China' -- ?? нет клиентов из Китая, все поля очистились ??
