-- COUNT: Cuenta la cantidad de productos en la tabla products
SELECT COUNT(*) AS totalProducts
FROM products;

-- SUM: Suma los precios de todos los productos en la tabla products
SELECT SUM(price) AS totalPrice
FROM products;

-- AVG: Calcula el precio promedio de los productos en la tabla products
SELECT AVG(price) AS averagePrice
FROM products;

-- MIN: Obtiene el precio más bajo entre los productos en la tabla products
SELECT MIN(price) AS lowestPrice
FROM products;

-- MAX: Obtiene el precio más alto entre los productos en la tabla products
SELECT MAX(price) AS highestPrice
FROM products;
