USE ferreteria;

INSERT INTO USUARIO (UsuarioNombre, UsuarioEmail, UsuarioRol, EstadoDeUsuario)
VALUES 
('Juan Pérez', 'juan.perez@example.com', 'Administrador', TRUE),
('María López', 'maria.lopez@example.com', 'Vendedor', TRUE),
('Carlos Gómez', 'carlos.gomez@example.com', 'Cajero', TRUE);

-- Inserción registros en la tabla UNIDADES_MEDIDA
INSERT INTO UNIDADES_MEDIDA (UnidadMedidaNombre, EstadoDeUnidadMedida)
VALUES 
('Kilogramo', TRUE),
('Litro', TRUE),
('Unidad', TRUE);

-- Inserción registros en la tabla PRODUCTOS
INSERT INTO PRODUCTOS (ProductoNombre, ProductoPrecio, ProductoStockMinimo, UnidadMedidaID, EstadoDeProducto)
VALUES 
('Cemento', 12.50, 100, 1, TRUE),
('Pintura', 8.90, 50, 2, TRUE),
('Tornillo', 0.10, 500, 3, TRUE),
('Madera', 20.00, 20, 1, TRUE),
('Pegamento', 3.50, 200, 2, TRUE),
('Clavo', 0.05, 1000, 3, TRUE);

-- Inserción registros en la tabla PROVEEDORES
INSERT INTO PROVEEDORES (ProveedorNombre, ProveedorCategoria, ProveedorTelefono, EstadoDeProveedor)
VALUES 
('Proveedores del Norte', 'Construcción', '123456789', TRUE),
('Suministros y Más', 'Pintura', '987654321', TRUE),
('Materiales Global', 'Ferretería', '555666777', TRUE);

-- Inserción registros en la tabla CLIENTES
INSERT INTO CLIENTES (ClienteNombre, ClienteDireccion, ClienteTelefono, EstadoDeCliente)
VALUES 
('José Torres', 'Calle 123', '111222333', TRUE),
('Ana Rodríguez', 'Avenida 456', '444555666', TRUE),
('Luis Sánchez', 'Carrera 789', '777888999', TRUE),
('Claudia Ramírez', 'Pasaje 321', '222333444', TRUE),
('Miguel Fernández', 'Callejón 654', '555444333', TRUE);

-- Inserción registros en la tabla VENTAS
INSERT INTO VENTAS (CodigoVenta, VentaFecha, VentaHora, ClienteID, UsuarioID, VentaMetodoPago, EstadoDeVenta)
VALUES 
('V-2024-001', '2024-09-08', '10:30:00', 1, 2, 'Tarjeta', TRUE),
('V-2024-002', '2024-09-08', '14:45:00', 2, 3, 'Efectivo', TRUE);

-- Inserción de registros en la tabla VENTASDETALLE para cada venta
INSERT INTO VENTASDETALLE (VentaID, ProductoID, VentaDetalleCantidad, VentaDetallePrecio, VentaDetalleImporte)
VALUES 
(1, 1, 2, 12.50, 25.00),  -- Venta 1, Producto 1
(1, 2, 5, 8.90, 44.50),   -- Venta 1, Producto 2
(1, 3, 10, 0.10, 1.00),   -- Venta 1, Producto 3
(2, 4, 1, 20.00, 20.00),  -- Venta 2, Producto 4
(2, 5, 3, 3.50, 10.50),   -- Venta 2, Producto 5
(2, 6, 50, 0.05, 2.50);   -- Venta 2, Producto 6

-- Inserción de registros en la tabla ENTRADAMATERIAL
INSERT INTO ENTRADAMATERIAL (CodigoEntradaMaterial, EntradaMaterialFecha, EntradaMaterialHora, UsuarioID, ProveedorID, EntradaMaterialFirma, EstadoDeEntradaMaterial)
VALUES 
('EM-2024-001', '2024-09-07', '09:00:00', 1, 1, 'Firma1', TRUE),
('EM-2024-002', '2024-09-07', '16:30:00', 2, 2, 'Firma2', TRUE);

-- Inserción de registros en la tabla ENTRADAMATERIALDETALLE para cada entrada
INSERT INTO ENTRADAMATERIALDETALLE (EntradaMaterialID, ProductoID, EntradaMaterialCantidad, EntradaMaterialPrecio, EntradaMaterialImporte)
VALUES 
(1, 1, 100, 12.50, 1250.00),  -- Entrada 1, Producto 1
(1, 2, 50, 8.90, 445.00),     -- Entrada 1, Producto 2
(1, 3, 200, 0.10, 20.00),     -- Entrada 1, Producto 3
(2, 4, 20, 20.00, 400.00),    -- Entrada 2, Producto 4
(2, 5, 100, 3.50, 350.00),    -- Entrada 2, Producto 5
(2, 6, 1000, 0.05, 50.00);    -- Entrada 2, Producto 6
