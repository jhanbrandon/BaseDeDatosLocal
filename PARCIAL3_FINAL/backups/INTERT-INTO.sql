-- Insertar datos en la tabla roles
INSERT INTO roles (roleName, description)
VALUES 
('Proveedor', 'Rol para proveedores de materiales'),
('Cliente', 'Rol para clientes de la ferretería'),
('Empleado', 'Rol para empleados de las tiendas');

-- Insertar datos en la tabla people
INSERT INTO people (firstName, lastName, phoneNumber, address, email)
VALUES 
('Carlos', 'Pérez', '3111234567', 'Calle 10 #5-20, Putumayo', 'carlos.perez@ejemplo.com'), -- Proveedor 1
('María', 'Gómez', '3129876543', 'Carrera 15 #8-10, Huila', 'maria.gomez@ejemplo.com'),   -- Proveedor 2
('Luis', 'Rojas', '3206549870', 'Calle 23 #12-30, Bogotá', 'luis.rojas@ejemplo.com'),     -- Proveedor 3
('Ana', 'Martínez', '3001122334', 'Calle 12 #9-15, Putumayo', 'ana.martinez@ejemplo.com'), -- Cliente 1
('Pedro', 'Ramírez', '3012233445', 'Carrera 45 #20-12, Huila', 'pedro.ramirez@ejemplo.com'), -- Cliente 2
('Sofía', 'López', '3103344556', 'Calle 98 #45-67, Bogotá', 'sofia.lopez@ejemplo.com'), -- Cliente 3
('Camilo', 'Torres', '3225566778', 'Calle 100 #20-50, Putumayo', 'camilo.torres@ejemplo.com'), -- Empleado 1
('Diana', 'Muñoz', '3107788990', 'Carrera 12 #34-56, Huila', 'diana.munoz@ejemplo.com'), -- Empleado 2
('Miguel', 'Castro', '3114455667', 'Calle 45 #23-12, Bogotá', 'miguel.castro@ejemplo.com'); -- Empleado 3

-- Insertar datos en la tabla users
INSERT INTO users (username, passwordHash, email, personId, status)
VALUES 
('carlosp', 'hashedpass1', 'carlos.perez@ejemplo.com', 1, 'active'),
('mariag', 'hashedpass2', 'maria.gomez@ejemplo.com', 2, 'active'),
('luisr', 'hashedpass3', 'luis.rojas@ejemplo.com', 3, 'active'),
('anam', 'hashedpass4', 'ana.martinez@ejemplo.com', 4, 'active'),
('pedror', 'hashedpass5', 'pedro.ramirez@ejemplo.com', 5, 'active'),
('sofial', 'hashedpass6', 'sofia.lopez@ejemplo.com', 6, 'active'),
('camilot', 'hashedpass7', 'camilo.torres@ejemplo.com', 7, 'active'),
('dianam', 'hashedpass8', 'diana.munoz@ejemplo.com', 8, 'active'),
('miguelc', 'hashedpass9', 'miguel.castro@ejemplo.com', 9, 'active');

-- Insertar datos en la tabla userRoles
INSERT INTO userRoles (userId, roleId, assignedAt, status)
VALUES 
(1, 1, NOW(), 'active'), -- Proveedor
(2, 1, NOW(), 'active'), -- Proveedor
(3, 1, NOW(), 'active'), -- Proveedor
(4, 2, NOW(), 'active'), -- Cliente
(5, 2, NOW(), 'active'), -- Cliente
(6, 2, NOW(), 'active'), -- Cliente
(7, 3, NOW(), 'active'), -- Empleado
(8, 3, NOW(), 'active'), -- Empleado
(9, 3, NOW(), 'active'); -- Empleado

-- Insertar datos en la tabla stores
INSERT INTO stores (storeName, address, phoneNumber)
VALUES 
('Ferretería Putumayo', 'Carrera 10 #5-20, Putumayo', '3111111111'),
('Ferretería Huila', 'Avenida 15 #8-10, Huila', '3222222222');

-- Insertar datos en la tabla locations
INSERT INTO locations (storeId, locationName, address, phoneNumber)
VALUES 
(1, 'Bodega Central', 'Carrera 10 #5-20, Putumayo', '3111111111'),
(2, 'Sucursal Principal', 'Avenida 15 #8-10, Huila', '3222222222');

-- Insertar datos en la tabla categories
INSERT INTO categories (categoryName, description)
VALUES 
('Herramientas', 'Herramientas manuales y eléctricas'),
('Materiales de construcción', 'Cemento, ladrillos, etc.'),
('Pinturas', 'Pinturas y accesorios de pintura');

-- Insertar datos en la tabla products
INSERT INTO products (productName, description, price, stock, categoryId)
VALUES 
('Martillo', 'Martillo de acero inoxidable', 25000.00, 100, 1),
('Taladro', 'Taladro industrial con accesorios', 180000.00, 50, 1),
('Cemento Gris', 'Bolsa de 50kg de cemento gris', 28000.00, 200, 2),
('Ladrillo', 'Ladrillo de construcción estándar', 400.00, 500, 2),
('Pintura Blanca', 'Galón de pintura blanca', 45000.00, 80, 3),
('Rodillo', 'Rodillo para pintura de paredes', 15000.00, 150, 3);

-- Insertar datos en la tabla productCategories
INSERT INTO productCategories (productId, categoryId)
VALUES 
(1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (6, 3);

-- Insertar datos en la tabla productHistory
INSERT INTO productHistory (productId, oldPrice, newPrice, changedBy, changedAt)
VALUES 
(1, 24000.00, 25000.00, 7, NOW()),
(2, 175000.00, 180000.00, 7, NOW()),
(3, 27000.00, 28000.00, 8, NOW()),
(4, 380.00, 400.00, 8, NOW()),
(5, 44000.00, 45000.00, 9, NOW());

-- Insertar datos en la tabla invoices
INSERT INTO invoices (storeId, userId, totalAmount)
VALUES 
(1, 4, 60000.00),
(1, 5, 100000.00),
(1, 6, 150000.00),
(2, 4, 200000.00),
(2, 5, 120000.00),
(2, 6, 180000.00),
(1, 4, 70000.00),
(1, 5, 80000.00),
(2, 6, 90000.00),
(2, 4, 300000.00);

-- Insertar datos en la tabla invoiceDetails
INSERT INTO invoiceDetails (invoiceId, productId, quantity, price)
VALUES 
(1, 1, 2, 25000.00), (1, 3, 1, 28000.00), (1, 5, 1, 45000.00),
(2, 2, 1, 180000.00), (2, 4, 50, 400.00), (2, 6, 1, 15000.00),
(3, 3, 5, 28000.00), (3, 5, 2, 45000.00), (3, 6, 3, 15000.00),
(4, 1, 3, 25000.00), (4, 3, 10, 28000.00), (4, 5, 5, 45000.00),
(5, 2, 2, 180000.00), (5, 4, 20, 400.00), (5, 6, 4, 15000.00);

-- Insertar datos en la tabla materialEntries
INSERT INTO materialEntries (storeId, userId, totalAmount)
VALUES 
(1, 7, 200000.00), (1, 7, 500000.00), (1, 7, 300000.00),
(2, 8, 600000.00), (2, 8, 100000.00), (2, 8, 150000.00);

-- Insertar datos en la tabla materialEntryDetails
INSERT INTO materialEntryDetails (entryId, productId, quantity, price)
VALUES 
(1, 1, 10, 20000.00), (1, 3, 20, 25000.00), (1, 5, 5, 40000.00),
(2, 2, 5, 150000.00), (2, 4, 100, 350.00), (2, 6, 10, 12000.00),
(3, 1, 50, 19000.00), (3, 3, 10, 24000.00), (3, 5, 10, 43000.00);

-- Insertar datos en la tabla paymentGateways
INSERT INTO paymentGateways (gatewayName, status)
VALUES 
('PSE', 'active'),
('Nequi', 'active'),
('Daviplata', 'active');

-- Insertar datos en la tabla paymentMethods
INSERT INTO paymentMethods (methodName, gatewayId)
VALUES 
('Transferencia Bancaria', 1),
('Pago con Nequi', 2),
('Pago con Daviplata', 3);

-- Insertar datos en la tabla payments
INSERT INTO payments (invoiceId, amount, methodId, paymentDate, status)
VALUES 
(1, 60000.00, 1, NOW(), 'completed'),
(2, 100000.00, 2, NOW(), 'completed'),
(3, 150000.00, 3, NOW(), 'completed');

-- Insertar datos en la tabla parameters
INSERT INTO parameters (parameterKey, description)
VALUES 
('IVA', 'Impuesto al Valor Agregado'),
('DESCUENTO', 'Descuento por volumen'),
('ENVIO', 'Costo de envío adicional');

-- Insertar datos en la tabla roleHistory
INSERT INTO roleHistory (userId, oldRoleId, newRoleId, changedBy, changedAt)
VALUES 
(7, 3, 1, 1, NOW()),
(8, 3, 1, 1, NOW()),
(9, 3, 2, 1, NOW()),
(4, 2, 3, 2, NOW());
