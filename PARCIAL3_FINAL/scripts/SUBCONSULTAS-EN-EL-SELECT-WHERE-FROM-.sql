-- Subconsulta en el WHERE: Productos en una categoría específica
-- La subconsulta busca el ID de la categoría con el nombre 'Herramientas'.
-- Luego, la consulta principal selecciona los productos pertenecientes a esa categoría.
SELECT productName, price
FROM products
WHERE categoryId = (
    SELECT categoryId
    FROM categories
    WHERE categoryName = 'Herramientas'
);

-- Subconsulta en el WHERE: Facturas con un monto total mayor que el promedio de todas las facturas
-- La subconsulta calcula el promedio de los montos totales en la tabla invoices.
-- La consulta principal selecciona las facturas cuyo total supera ese promedio.
SELECT invoiceId, totalAmount
FROM invoices
WHERE totalAmount > (
    SELECT AVG(totalAmount)
    FROM invoices
);

-- Subconsulta en el WHERE: Usuarios con roles específicos
-- La subconsulta encuentra el ID del rol llamado 'Empleado'.
-- Otra subconsulta selecciona los IDs de usuarios que tienen ese rol.
-- La consulta principal selecciona los nombres de usuario correspondientes.
SELECT username
FROM users
WHERE userId IN (
    SELECT userId
    FROM userRoles
    WHERE roleId = (
        SELECT roleId
        FROM roles
        WHERE roleName = 'Empleado'
    )
);

-- Subconsulta en el FROM: Precio promedio por categoría
-- La subconsulta selecciona las categorías y los precios de los productos.
-- Luego, la consulta principal calcula el precio promedio por categoría.
SELECT categoryId, AVG(price) AS averagePrice
FROM (
    SELECT categoryId, price
    FROM products
) AS subquery
GROUP BY categoryId;

-- Subconsulta en el FROM: Facturas con el total de productos vendidos
-- La subconsulta suma las cantidades de productos vendidos por factura.
-- Luego, la consulta principal combina estos datos con las facturas.
SELECT i.invoiceId, i.totalAmount, subquery.totalProducts
FROM invoices i
JOIN (
    SELECT invoiceId, SUM(quantity) AS totalProducts
    FROM invoiceDetails
    GROUP BY invoiceId
) AS subquery
ON i.invoiceId = subquery.invoiceId;

-- Subconsulta en el FROM: Categorías con más de 2 productos
-- La subconsulta cuenta cuántos productos hay en cada categoría.
-- Luego, la consulta principal filtra las categorías con más de 2 productos.
SELECT categoryName, productCount
FROM (
    SELECT c.categoryName, COUNT(p.productId) AS productCount
    FROM categories c
    LEFT JOIN products p ON c.categoryId = p.categoryId
    GROUP BY c.categoryName
) AS subquery
WHERE productCount > 2;

-- Subconsulta en el SELECT: Mostrar el precio promedio de la categoría de cada producto
-- La subconsulta calcula el precio promedio de la categoría a la que pertenece cada producto.
-- La consulta principal muestra los datos del producto junto con ese promedio.
SELECT 
    productName, 
    price, 
    (SELECT AVG(price) 
     FROM products 
     WHERE categoryId = p.categoryId) AS categoryAveragePrice
FROM products p;

-- Subconsulta en el SELECT: Mostrar el nombre del rol para cada usuario
-- La subconsulta encuentra el nombre del rol asociado a cada usuario.
-- La consulta principal combina los nombres de usuario con sus roles.
SELECT 
    username, 
    (SELECT roleName 
     FROM roles r 
     JOIN userRoles ur ON r.roleId = ur.roleId 
     WHERE ur.userId = u.userId LIMIT 1) AS roleName
FROM users u;

-- Subconsulta en el SELECT: Mostrar el total de productos vendidos por factura
-- La subconsulta suma las cantidades de productos vendidos en cada factura.
-- La consulta principal muestra los datos de las facturas junto con ese total.
SELECT 
    invoiceId, 
    totalAmount, 
    (SELECT SUM(quantity) 
     FROM invoiceDetails 
     WHERE invoiceId = i.invoiceId) AS totalProducts
FROM invoices i;
