-- HAVING: Filtra grupos despues de la agrupación GROUP BY

-- SUM: Suma el stock total de productos en cada categoría y muestra solo las categorías con un stock total mayor a 200
SELECT 
    categoryId, 
    SUM(stock) AS totalStock
FROM products
GROUP BY categoryId
HAVING SUM(stock) > 200;

-- COUNT: Cuenta cuántos productos hay en cada categoría y muestra solo las categorías con más de 2 productos
SELECT 
    categoryId, 
    COUNT(*) AS totalProducts
FROM products
GROUP BY categoryId
HAVING COUNT(*) > 1;

-- AVG: Calcula el precio promedio de los productos en cada categoría y muestra solo las categorías con un precio promedio mayor a 50,000
SELECT 
    categoryId, 
    AVG(price) AS averagePrice
FROM products
GROUP BY categoryId
HAVING AVG(price) > 50000;

-- MIN: Encuentra el precio más bajo de los productos en cada categoría y muestra solo las categorías donde el precio mínimo es menor a 500
SELECT 
    categoryId, 
    MIN(price) AS lowestPrice
FROM products
GROUP BY categoryId
HAVING MIN(price) < 50000;

-- MAX: Encuentra el precio más alto de los productos en cada categoría y muestra solo las categorías donde el precio máximo es mayor a 100,000
SELECT 
    categoryId, 
    MAX(price) AS highestPrice
FROM products
GROUP BY categoryId
HAVING MAX(price) > 100000;
