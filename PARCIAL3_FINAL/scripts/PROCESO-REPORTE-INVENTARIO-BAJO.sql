DELIMITER $$
CREATE PROCEDURE ReportLowInventory(
    IN p_minimumStock INT
)
BEGIN
    SELECT 
        productName, 
        stock 
    FROM 
        products
    WHERE 
        stock < p_minimumStock
    ORDER BY 
        stock ASC;
END$$
DELIMITER ;

-- EJEMPLO USO DE PROCESO
CALL ReportLowInventory(10);
