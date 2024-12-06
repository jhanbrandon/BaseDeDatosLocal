DELIMITER $$
CREATE PROCEDURE AddProduct(
    IN p_productName VARCHAR(100),
    IN p_description TEXT,
    IN p_price DECIMAL(10,2),
    IN p_stock INT,
    IN p_categoryId INT
)
BEGIN
    -- Validar que el precio y el stock no sean negativos
    IF p_price < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio no puede ser negativo';
    END IF;

    IF p_stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El stock no puede ser negativo';
    END IF;

    -- Insertar el producto
    INSERT INTO products (productName, description, price, stock, categoryId, createdAt)
    VALUES (p_productName, p_description, p_price, p_stock, p_categoryId, CURRENT_TIMESTAMP);
END$$
DELIMITER ;

-- EJEMPLO COMO USAR EL PROCESO
CALL AddProduct('Taladro', 'Taladro industrial', 180000.95, 50, 1);
