DELIMITER $$
CREATE PROCEDURE ReportEntriesAndExits(
    IN p_startDate DATE,
    IN p_endDate DATE
)
BEGIN
    -- Reporte de Entradas
    SELECT 
        'Entrada' AS type, 
        me.entryId, 
        me.totalAmount, 
        me.createdAt
    FROM 
        materialEntries me
    WHERE 
        me.createdAt BETWEEN p_startDate AND p_endDate

    UNION ALL

    -- Reporte de Salidas (Ventas)
    SELECT 
        'Salida' AS type, 
        i.invoiceId, 
        i.totalAmount, 
        i.createdAt
    FROM 
        invoices i
    WHERE 
        i.createdAt BETWEEN p_startDate AND p_endDate
    ORDER BY 
        createdAt ASC;
END$$
DELIMITER ;


-- EJEMPLO USO PROCESO
CALL ReportEntriesAndExits('2024-01-01', '2024-12-31');
