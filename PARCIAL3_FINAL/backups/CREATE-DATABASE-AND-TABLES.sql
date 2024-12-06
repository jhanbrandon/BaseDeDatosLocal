-- Crear la base de datos
CREATE DATABASE hardwareshop;
USE hardwareshop;

-- 1. Tablas independientes
CREATE TABLE people (
    personId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(15),
    address VARCHAR(255),
    email VARCHAR(100) UNIQUE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE roles (
    roleId INT AUTO_INCREMENT PRIMARY KEY,
    roleName VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE stores (
    storeId INT AUTO_INCREMENT PRIMARY KEY,
    storeName VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phoneNumber VARCHAR(15),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE paymentGateways (
    gatewayId INT AUTO_INCREMENT PRIMARY KEY,
    gatewayName VARCHAR(100) NOT NULL,
    status VARCHAR(20) DEFAULT 'active',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE parameters (
    parameterId INT AUTO_INCREMENT PRIMARY KEY,
    parameterKey VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 2. Tablas dependientes directas
CREATE TABLE users (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    passwordHash VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    personId INT,
    status VARCHAR(20) DEFAULT 'active',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (personId) REFERENCES people(personId)
);

CREATE TABLE locations (
    locationId INT AUTO_INCREMENT PRIMARY KEY,
    storeId INT NOT NULL,
    locationName VARCHAR(100),
    address VARCHAR(255),
    phoneNumber VARCHAR(15),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (storeId) REFERENCES stores(storeId)
);

CREATE TABLE products (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    categoryId INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (categoryId) REFERENCES categories(categoryId)
);

-- 3. Relaciones muchos a muchos y tablas de detalles
CREATE TABLE userRoles (
    userRoleId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    roleId INT NOT NULL,
    assignedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'active',
    FOREIGN KEY (userId) REFERENCES users(userId),
    FOREIGN KEY (roleId) REFERENCES roles(roleId)
);

CREATE TABLE productCategories (
    productCategoryId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    categoryId INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (productId) REFERENCES products(productId),
    FOREIGN KEY (categoryId) REFERENCES categories(categoryId)
);

CREATE TABLE locationProducts (
    locationProductId INT AUTO_INCREMENT PRIMARY KEY,
    locationId INT NOT NULL,
    productId INT NOT NULL,
    stock INT DEFAULT 0,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (locationId) REFERENCES locations(locationId),
    FOREIGN KEY (productId) REFERENCES products(productId)
);

-- 4. Historiales
CREATE TABLE productHistory (
    historyId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    oldPrice DECIMAL(10,2),
    newPrice DECIMAL(10,2) NOT NULL,
    changedBy INT NOT NULL,
    changedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (productId) REFERENCES products(productId),
    FOREIGN KEY (changedBy) REFERENCES users(userId)
);

CREATE TABLE roleHistory (
    roleHistoryId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    oldRoleId INT NOT NULL,
    newRoleId INT NOT NULL,
    changedBy INT NOT NULL,
    changedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES users(userId),
    FOREIGN KEY (oldRoleId) REFERENCES roles(roleId),
    FOREIGN KEY (newRoleId) REFERENCES roles(roleId),
    FOREIGN KEY (changedBy) REFERENCES users(userId)
);

-- 5. Facturas y detalles
CREATE TABLE invoices (
    invoiceId INT AUTO_INCREMENT PRIMARY KEY,
    storeId INT NOT NULL,
    userId INT NOT NULL,
    totalAmount DECIMAL(10,2),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (storeId) REFERENCES stores(storeId),
    FOREIGN KEY (userId) REFERENCES users(userId)
);

CREATE TABLE invoiceDetails (
    invoiceDetailId INT AUTO_INCREMENT PRIMARY KEY,
    invoiceId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (invoiceId) REFERENCES invoices(invoiceId),
    FOREIGN KEY (productId) REFERENCES products(productId)
);

-- 6. Entradas de materiales y detalles
CREATE TABLE materialEntries (
    entryId INT AUTO_INCREMENT PRIMARY KEY,
    storeId INT NOT NULL,
    userId INT NOT NULL,
    totalAmount DECIMAL(10,2),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (storeId) REFERENCES stores(storeId),
    FOREIGN KEY (userId) REFERENCES users(userId)
);

CREATE TABLE materialEntryDetails (
    entryDetailId INT AUTO_INCREMENT PRIMARY KEY,
    entryId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (entryId) REFERENCES materialEntries(entryId),
    FOREIGN KEY (productId) REFERENCES products(productId)
);

-- 7. Métodos de pago
CREATE TABLE paymentMethods (
    methodId INT AUTO_INCREMENT PRIMARY KEY,
    methodName VARCHAR(100) NOT NULL,
    gatewayId INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (gatewayId) REFERENCES paymentGateways(gatewayId)
);

CREATE TABLE payments (
    paymentId INT AUTO_INCREMENT PRIMARY KEY,
    invoiceId INT NOT NULL,
    amount DECIMAL(10,2),
    methodId INT NOT NULL,
    paymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'completed',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (invoiceId) REFERENCES invoices(invoiceId),
    FOREIGN KEY (methodId) REFERENCES paymentMethods(methodId)
);

CREATE TABLE paymentsGatewayLocations (
    gatewayLocationId INT AUTO_INCREMENT PRIMARY KEY,
    gatewayId INT NOT NULL,
    locationId INT NOT NULL,
    status VARCHAR(20) DEFAULT 'active',
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (gatewayId) REFERENCES paymentGateways(gatewayId),
    FOREIGN KEY (locationId) REFERENCES locations(locationId)
);

CREATE TABLE paymentsGatewayLocationParameters (
    gatewayLocationParameterId INT AUTO_INCREMENT PRIMARY KEY,
    gatewayLocationId INT NOT NULL,
    parameterId INT NOT NULL,
    parameterValue VARCHAR(255),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (gatewayLocationId) REFERENCES paymentsGatewayLocations(gatewayLocationId),
    FOREIGN KEY (parameterId) REFERENCES parameters(parameterId)
);
