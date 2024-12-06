SELECT ProductoNombre, ProductoPrecio
FROM PRODUCTOS
-- WHERE ProductoPrecio > 10;
-- WHERE UsuarioRol = 'Vendedor';
-- WHERE ClienteDireccion LIKE '%Calle%' OR ClienteTelefono LIKE '555%';
-- WHERE ProductoPrecio > 5 AND ProductoPrecio <= 15;
-- WHERE ProductoID BETWEEN 1 AND 3 AND EstadoDeProducto = TRUE;
-- WHERE ProductoID IN (1, 2);
-- WHERE ProveedorCategoria NOT IN ('Ferretería');
-- WHERE (UsuarioID = 1 OR UsuarioID = 2) AND VentaMetodoPago = 'Tarjeta' AND YEAR(VentaFecha) = 2024;
-- SELECT V.CodigoVenta, V.VentaFecha, C.ClienteNombre, U.UsuarioNombre, V.VentaMetodoPago FROM VENTAS V JOIN CLIENTES C ON V.ClienteID = C.ClienteID JOIN USUARIO U ON V.UsuarioID = U.UsuarioID WHERE V.VentaMetodoPago = 'Efectivo'; 







