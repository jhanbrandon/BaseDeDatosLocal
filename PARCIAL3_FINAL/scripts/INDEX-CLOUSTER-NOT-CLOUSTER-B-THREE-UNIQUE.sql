-- Índices agrupados (Clustered Index)
-- Ejemplo: Consultar un producto por su ID (utiliza el índice agrupado)
SELECT productName, price 
FROM products 
WHERE productId = 2;
-- Ejemplo: Consultar una categoría por su ID (utiliza el índice agrupado)
SELECT categoryName 
FROM categories 
WHERE categoryId = 1;

-- Ejemplo: Consultar una factura por su ID (utiliza el índice agrupado)
SELECT invoiceId, totalAmount 
FROM invoices 
WHERE invoiceId = 1;
-- Ejemplo: Consultar un usuario por su ID (utiliza el índice agrupado)
SELECT username 
FROM users 
WHERE userId = 1;

-- Índices no agrupados (Non-clustered Index)
-- Índice no agrupado en el campo `price` de la tabla `products`
CREATE INDEX idx_product_price ON products(price);
-- Ejemplo: Consultar productos con un precio mayor a 20,000 (utiliza el índice no agrupado)
SELECT productName, price 
FROM products 
WHERE price > 20000;

-- Índice no agrupado en el campo `stock` de la tabla `products`
CREATE INDEX idx_product_stock ON products(stock);
-- Ejemplo: Consultar productos con stock menor a 50 (utiliza el índice no agrupado)
SELECT productName, stock 
FROM products 
WHERE stock < 50;

-- Índice no agrupado en el campo `categoryName` de la tabla `categories`
CREATE INDEX idx_category_name ON categories(categoryName);
-- Ejemplo: Consultar una categoría por su nombre (utiliza el índice no agrupado)
SELECT categoryId, categoryName 
FROM categories 
WHERE categoryName = 'Herramientas';

-- Índice no agrupado en el campo `totalAmount` de la tabla `invoices`
CREATE INDEX idx_invoice_total ON invoices(totalAmount);
-- Ejemplo: Consultar facturas con total mayor a 100,000 (utiliza el índice no agrupado)
SELECT invoiceId, totalAmount 
FROM invoices 
WHERE totalAmount > 100000;

-- Índices únicos (Unique Index)
-- Índice único en el campo `email` de la tabla `users`
CREATE UNIQUE INDEX idx_unique_user_email ON users(email);
-- Ejemplo: Intentar insertar un usuario con un correo existente (genera error si se duplica)
INSERT INTO users (username, email) VALUES ('nuevoUsuario', 'existingemail@example.com');

-- Índice único en el campo `categoryName` de la tabla `categories`
CREATE UNIQUE INDEX idx_unique_category_name ON categories(categoryName);
-- Ejemplo: Intentar insertar una categoría con un nombre existente (genera error si se duplica)
INSERT INTO categories (categoryName) VALUES ('Herramientas');

-- Índice único en el campo `productName` de la tabla `products`
CREATE UNIQUE INDEX idx_unique_product_name ON products(productName);
-- Ejemplo: Intentar insertar un producto con un nombre existente (genera error si se duplica)
INSERT INTO products (productName, price) VALUES ('Martillo', 15000);

-- Índice único en el campo `username` de la tabla `users`
CREATE UNIQUE INDEX idx_unique_user_username ON users(username);
-- Ejemplo: Intentar insertar un usuario con un nombre de usuario existente (genera error si se duplica)
INSERT INTO users (username, email) VALUES ('carlosp', 'nuevoemail@example.com');

-- Índice B-TREE en la columna `price` de la tabla `products`
-- Este índice optimiza las búsquedas y rangos basados en el precio.
CREATE INDEX idx_btree_product_price ON products(price) USING BTREE;
-- Ejemplo: Consultar productos cuyo precio sea mayor a 50,000 (utiliza el índice B-TREE)
SELECT productName, price
FROM products
WHERE price > 50000;

-- Índice B-TREE en la columna `createdAt` de la tabla `invoices`
-- Este índice optimiza las búsquedas por fecha de creación.
CREATE INDEX idx_btree_invoice_createdAt ON invoices(createdAt) USING BTREE;
-- Ejemplo: Consultar facturas creadas después de una fecha específica (utiliza el índice B-TREE)
SELECT invoiceId, totalAmount, createdAt
FROM invoices
WHERE createdAt > '2024-01-01';

-- Índice B-TREE en la columna `stock` de la tabla `products`
-- Este índice optimiza las búsquedas de productos por cantidad en stock.
CREATE INDEX idx_btree_product_stock ON products(stock) USING BTREE;
-- Ejemplo: Consultar productos con stock menor a 20 (utiliza el índice B-TREE)
SELECT productName, stock
FROM products
WHERE stock < 20;

-- Índices compuestos (Composite Index)
-- Índice compuesto en los campos `productName` y `price` de la tabla `products`
CREATE INDEX idx_composite_product_name_price ON products(productName, price);
-- Ejemplo: Consultar productos por nombre y rango de precio (utiliza el índice compuesto)
SELECT productName, price 
FROM products 
WHERE productName LIKE 'Mart%' AND price > 20000;

-- Índice compuesto en los campos `categoryName` y `categoryId` de la tabla `categories`
CREATE INDEX idx_composite_category_name_id ON categories(categoryName, categoryId);
-- Ejemplo: Consultar categorías por nombre exacto e ID (utiliza el índice compuesto)
SELECT categoryName, categoryId 
FROM categories 
WHERE categoryName = 'Herramientas' AND categoryId = 1;

-- Índice compuesto en los campos `username` y `email` de la tabla `users`
CREATE INDEX idx_composite_user_username_email ON users(username, email);
-- Ejemplo: Consultar usuarios por nombre de usuario y correo electrónico (utiliza el índice compuesto)
SELECT username, email 
FROM users 
WHERE username = 'carlosp' AND email = 'carlos.perez@ejemplo.com';

-- Índice compuesto en los campos `invoiceId` y `totalAmount` de la tabla `invoices`
CREATE INDEX idx_composite_invoice_id_total ON invoices(invoiceId, totalAmount);
-- Ejemplo: Consultar facturas por ID y total mayor a un valor específico (utiliza el índice compuesto)
SELECT invoiceId, totalAmount 
FROM invoices 
WHERE invoiceId = 1 AND totalAmount > 100000;