CREATE DATABASE Ferreteria;
USE Ferreteria;

-- Tabla de USUARIO
CREATE TABLE USUARIO (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioNombre VARCHAR(100) NOT NULL,
    UsuarioEmail VARCHAR(100) NOT NULL,
    UsuarioRol VARCHAR(50) NOT NULL,
    EstadoDeUsuario BOOLEAN NOT NULL
);

-- Tabla de UNIDADES DE MEDIDA
CREATE TABLE UNIDADES_MEDIDA (
    UnidadMedidaID INT AUTO_INCREMENT PRIMARY KEY,
    UnidadMedidaNombre VARCHAR(50) NOT NULL,
    EstadoDeUnidadMedida BOOLEAN NOT NULL
);

-- Tabla de PRODUCTOS
CREATE TABLE PRODUCTOS (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    ProductoNombre VARCHAR(100) NOT NULL,
    ProductoPrecio DECIMAL(10, 2) NOT NULL,
    ProductoStockMinimo INT NOT NULL,
    ProductoFoto VARCHAR(255),
    UnidadMedidaID INT,
    EstadoDeProducto BOOLEAN NOT NULL,
    FOREIGN KEY (UnidadMedidaID) REFERENCES UNIDADES_MEDIDA(UnidadMedidaID)
);

-- Tabla de PROVEEDORES
CREATE TABLE PROVEEDORES (
    ProveedorID INT AUTO_INCREMENT PRIMARY KEY,
    ProveedorNombre VARCHAR(100) NOT NULL,
    ProveedorCategoria VARCHAR(50),
    ProveedorTelefono VARCHAR(20),
    EstadoDeProveedor BOOLEAN NOT NULL
);

-- Tabla de CLIENTES
CREATE TABLE CLIENTES (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteNombre VARCHAR(100) NOT NULL,
    ClienteDireccion VARCHAR(255),
    ClienteTelefono VARCHAR(20),
    EstadoDeCliente BOOLEAN NOT NULL
);

-- Tabla de VENTAS
CREATE TABLE VENTAS (
    VentaID INT AUTO_INCREMENT PRIMARY KEY,
    CodigoVenta VARCHAR(50) NOT NULL,
    VentaFecha DATE NOT NULL,
    VentaHora TIME NOT NULL,
    ClienteID INT,
    UsuarioID INT,
    VentaMetodoPago VARCHAR(50) NOT NULL,
    EstadoDeVenta BOOLEAN NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES CLIENTES(ClienteID),
    FOREIGN KEY (UsuarioID) REFERENCES USUARIO(UsuarioID)
);

-- Tabla de VENTAS DETALLE
CREATE TABLE VENTASDETALLE (
    VentaDetalleID INT AUTO_INCREMENT PRIMARY KEY,
    VentaID INT,
    ProductoID INT,
    VentaDetalleCantidad INT NOT NULL,
    VentaDetallePrecio DECIMAL(10, 2) NOT NULL,
    VentaDetalleImporte DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (VentaID) REFERENCES VENTAS(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES PRODUCTOS(ProductoID)
);

-- Tabla de ENTRADA DE MATERIAL
CREATE TABLE ENTRADAMATERIAL (
    EntradaMaterialID INT AUTO_INCREMENT PRIMARY KEY,
    CodigoEntradaMaterial VARCHAR(50) NOT NULL,
    EntradaMaterialFecha DATE NOT NULL,
    EntradaMaterialHora TIME NOT NULL,
    UsuarioID INT,
    ProveedorID INT,
    EntradaMaterialFirma VARCHAR(100),
    EstadoDeEntradaMaterial BOOLEAN NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES USUARIO(UsuarioID),
    FOREIGN KEY (ProveedorID) REFERENCES PROVEEDORES(ProveedorID)
);

-- Tabla de ENTRADA DE MATERIAL DETALLE
CREATE TABLE ENTRADAMATERIALDETALLE (
    EntradaMaterialDetalleID INT AUTO_INCREMENT PRIMARY KEY,
    EntradaMaterialID INT,
    ProductoID INT,
    EntradaMaterialCantidad INT NOT NULL,
    EntradaMaterialPrecio DECIMAL(10, 2) NOT NULL,
    EntradaMaterialImporte DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (EntradaMaterialID) REFERENCES ENTRADAMATERIAL(EntradaMaterialID),
    FOREIGN KEY (ProductoID) REFERENCES PRODUCTOS(ProductoID)
);
