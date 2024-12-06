-- CONCAT: Combina el nombre y el apellido de las personas en la tabla people
SELECT CONCAT(firstName, ' ', lastName) AS fullName
FROM people;

-- LENGTH: Obtiene la longitud del nombre de cada categoría en la tabla categories
SELECT categoryName, LENGTH(categoryName) AS nameLength
FROM categories;

-- UPPER: Convierte los nombres de los métodos de pago a mayúsculas
SELECT methodName, UPPER(methodName) AS methodNameUpperCase
FROM paymentMethods;

-- LOWER: Convierte los nombres de las tiendas a minúsculas
SELECT storeName, LOWER(storeName) AS storeNameLowerCase
FROM stores;

-- SUBSTRING: Extrae los primeros 5 caracteres del nombre de cada producto en la tabla products
SELECT productName, SUBSTRING(productName, 1, 5) AS productShortName
FROM products;

-- SUBSTRING: Devuelve parte de la expresión especificada
-- Extraer los primeros 5 caracteres de los nombres de usuario
SELECT 
    username,
    SUBSTRING(username, 1, 5) AS shortUsername
FROM users;
