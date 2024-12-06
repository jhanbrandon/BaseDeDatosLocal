-- INNER JOIN: Lista las facturas junto con los detalles de las facturas
-- Combina las tablas invoices e invoiceDetails, mostrando solo las coincidencias.
-- Cada factura se enlaza con sus detalles usando la clave foránea invoiceId.
SELECT 
    i.invoiceId, 
    i.totalAmount, 
    id.productId, 
    id.quantity, 
    id.price 
FROM 
    invoices i
INNER JOIN 
    invoiceDetails id 
ON 
    i.invoiceId = id.invoiceId;

-- INNER JOIN: Lista los productos vendidos en cada factura, junto con el nombre de la categoría
-- Combina cuatro tablas (invoices, invoiceDetails, products y categories).
-- Muestra las facturas, los productos vendidos, y la categoría a la que pertenecen.
SELECT 
    i.invoiceId, 
    p.productName, 
    c.categoryName, 
    id.quantity, 
    id.price 
FROM 
    invoices i
INNER JOIN 
    invoiceDetails id 
ON 
    i.invoiceId = id.invoiceId
INNER JOIN 
    products p 
ON 
    id.productId = p.productId
INNER JOIN 
    categories c 
ON 
    p.categoryId = c.categoryId;

-- LEFT JOIN: Lista todos los productos junto con sus categorías
-- Incluye todos los productos, incluso aquellos que no tienen categoría asignada.
-- Los productos sin categoría tendrán valores NULL en las columnas de la tabla categories.
SELECT 
    p.productName, 
    c.categoryName 
FROM 
    products p
LEFT JOIN 
    categories c 
ON 
    p.categoryId = c.categoryId;

-- LEFT JOIN: Lista todos los usuarios junto con sus roles
-- Incluye todos los usuarios, incluso aquellos que no tienen roles asignados.
SELECT 
    u.username, 
    r.roleName 
FROM 
    users u
LEFT JOIN 
    userRoles ur 
ON 
    u.userId = ur.userId
LEFT JOIN 
    roles r 
ON 
    ur.roleId = r.roleId;

-- RIGHT JOIN: Lista todas las categorías junto con sus productos
-- Incluye todas las categorías, incluso aquellas que no tienen productos asignados.
-- Las categorías sin productos tendrán valores NULL en las columnas de la tabla products.
SELECT 
    c.categoryName, 
    p.productName 
FROM 
    categories c
RIGHT JOIN 
    products p 
ON 
    p.categoryId = c.categoryId;

-- RIGHT JOIN: Lista todos los métodos de pago junto con sus pasarelas
-- Incluye todos los métodos de pago, incluso aquellos que no están asociados a una pasarela.
SELECT 
    pm.methodName, 
    pg.gatewayName 
FROM 
    paymentMethods pm
RIGHT JOIN 
    paymentGateways pg 
ON 
    pm.gatewayId = pg.gatewayId;
