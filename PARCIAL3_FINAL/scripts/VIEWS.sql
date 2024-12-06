-- Vista: Productos con Categorías
-- Muestra una lista completa de productos con sus categorías asociadas.
-- Si un producto no tiene categoría asignada, el campo `categoryName` aparecerá como NULL.
CREATE VIEW ProductWithCategories AS
SELECT 
    p.productId,
    p.productName,
    p.description,
    p.price,
    p.stock,
    c.categoryName
FROM 
    products p
LEFT JOIN 
    categories c ON p.categoryId = c.categoryId;

-- Vista: Resumen de Facturas
-- Muestra las facturas con sus totales, el usuario que las creó y la fecha de creación.
-- Esta vista ayuda a revisar el historial de facturas y el responsable de cada una.
CREATE VIEW InvoiceSummary AS
SELECT 
    i.invoiceId,
    i.totalAmount,
    u.username AS createdBy,
    i.createdAt
FROM 
    invoices i
LEFT JOIN 
    users u ON i.userId = u.userId;

-- Vista: Ventas por Categoría
-- Proporciona un resumen de las ventas totales y la cantidad de productos vendidos por categoría.
-- La información se agrupa por categoría y se ordena por las ventas totales de mayor a menor.
CREATE VIEW SalesByCategory AS
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

-- Vista: Inventario Bajo
-- Lista los productos cuyo stock está por debajo de un nivel crítico, definido en este caso como 10.
-- Es útil para monitorear productos que necesitan ser reabastecidos.
CREATE VIEW LowInventory AS
SELECT 
    p.productId,
    p.productName,
    p.stock,
    c.categoryName
FROM 
    products p
LEFT JOIN 
    categories c ON p.categoryId = c.categoryId
WHERE 
    p.stock < 10;

-- Vista: Entradas y Salidas
-- Muestra un resumen combinado de entradas de material (entradas) y ventas (salidas).
-- La información incluye el tipo (entrada o salida), el total de la transacción y la fecha.
CREATE VIEW EntriesAndExits AS
SELECT 
    'Entrada' AS type,
    me.entryId AS transactionId,
    me.totalAmount,
    me.createdAt
FROM 
    materialEntries me

UNION ALL

SELECT 
    'Salida' AS type,
    i.invoiceId AS transactionId,
    i.totalAmount,
    i.createdAt
FROM 
    invoices i
ORDER BY 
    createdAt ASC;
