DELIMITER $$
CREATE PROCEDURE DeleteProduct(
    IN p_productId INT
)
BEGIN
    -- Marcar el producto como inactivo en lugar de eliminarlo físicamente
    UPDATE products
    SET stock = 0, updatedAt = CURRENT_TIMESTAMP
    WHERE productId = p_productId;
END$$
DELIMITER ;

-- EJEMPLO USO DE PROCESO 
CALL DeleteProduct(1);
