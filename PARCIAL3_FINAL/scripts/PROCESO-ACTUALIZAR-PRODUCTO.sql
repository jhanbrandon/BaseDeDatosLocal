DELIMITER $$
CREATE PROCEDURE UpdateProduct(
    IN p_productId INT,
    IN p_newPrice DECIMAL(10,2),
    IN p_newStock INT
)
BEGIN
    -- Validar que el precio y el stock no sean negativos
    IF p_newPrice < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio no puede ser negativo';
    END IF;

    IF p_newStock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El stock no puede ser negativo';
    END IF;

    -- Actualizar el producto
    UPDATE products
    SET price = p_newPrice, stock = p_newStock, updatedAt = CURRENT_TIMESTAMP
    WHERE productId = p_productId;

    -- Registrar el cambio en productHistory
    INSERT INTO productHistory (productId, oldPrice, newPrice, changedBy, changedAt)
    SELECT productId, price, p_newPrice, CURRENT_USER, CURRENT_TIMESTAMP
    FROM products
    WHERE productId = p_productId;
END$$
DELIMITER ;

-- EJEMPLO COMO USAR PROCESO

CALL AddProduct('Taladro', 'Taladro industrial', 180000.95, 50, 1);

