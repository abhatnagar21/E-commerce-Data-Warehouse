-- File: 02_create_procedure.sql
USE EcommerceWarehouse;

DELIMITER //

CREATE PROCEDURE AddOrder(
    IN p_CustomerID INT,
    IN p_ProductID INT,
    IN p_Quantity INT,
    IN p_PaymentMethod VARCHAR(50),
    IN p_ShippingAddress VARCHAR(255)
)
BEGIN
    DECLARE v_TotalAmount DECIMAL(10,2);
    DECLARE v_ProductPrice DECIMAL(10,2);
    DECLARE v_OrderID INT;

    -- Get the product price
    SELECT Price INTO v_ProductPrice FROM Products WHERE ProductID = p_ProductID;

    -- Calculate the total amount
    SET v_TotalAmount = v_ProductPrice * p_Quantity;

    -- Insert the order
    INSERT INTO Orders (CustomerID, TotalAmount, Status, ShippingAddress)
    VALUES (p_CustomerID, v_TotalAmount, 'Pending', p_ShippingAddress);

    -- Get the last inserted OrderID
    SET v_OrderID = LAST_INSERT_ID();

    -- Insert the order item
    INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price)
    VALUES (v_OrderID, p_ProductID, p_Quantity, v_ProductPrice);

    -- Insert the payment
    INSERT INTO Payments (OrderID, PaymentMethod, Amount)
    VALUES (v_OrderID, p_PaymentMethod, v_TotalAmount);

    -- Update the product stock
    UPDATE Products SET StockQuantity = StockQuantity - p_Quantity WHERE ProductID = p_ProductID;

    COMMIT;
END //

DELIMITER ;
