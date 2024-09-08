-- File: 03_complex_query.sql
USE EcommerceWarehouse;

SELECT 
    c.CategoryName,
    YEAR(o.OrderDate) AS Year,
    MONTH(o.OrderDate) AS Month,
    SUM(oi.Quantity * oi.Price) AS TotalSales
FROM 
    Orders o
JOIN 
    OrderItems oi ON o.OrderID = oi.OrderID
JOIN 
    Products p ON oi.ProductID = p.ProductID
JOIN 
    Categories c ON p.CategoryID = c.CategoryID
GROUP BY 
    c.CategoryName, YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY 
    Year DESC, Month DESC, TotalSales DESC;
