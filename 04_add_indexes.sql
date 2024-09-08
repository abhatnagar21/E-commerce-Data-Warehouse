-- File: 04_add_indexes.sql
USE EcommerceWarehouse;

CREATE INDEX idx_orders_customerid ON Orders(CustomerID);
CREATE INDEX idx_orderitems_orderid ON OrderItems(OrderID);
CREATE INDEX idx_products_categoryid ON Products(CategoryID);
CREATE INDEX idx_payments_orderid ON Payments(OrderID);
