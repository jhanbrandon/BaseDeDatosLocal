DELIMITER $$
CREATE PROCEDURE ReportSalesByCategory()
BEGIN
    SELECT 
        c.categoryName, 
        SUM(id.quantity * id.price) AS totalSales, 
        SUM(id.quantity) AS totalQuantity
    FROM 
        categories c
    JOIN 
        products p ON c.categoryId = p.categoryId
    JOIN 
        invoiceDetails id ON p.productId = id.productId
    GROUP BY 
        c.categoryName
    ORDER BY 
        totalSales DESC;
END$$
DELIMITER ;

-- EJEMPLO USO DE PROCESO
CALL ReportSalesByCategory();
