-- COUNT: Cuenta cuántos productos hay en cada categoría
SELECT 
    categoryId, 
    COUNT(*) AS totalProducts
FROM products
GROUP BY categoryId;

-- SUM: Suma el stock total de productos en cada categoría
SELECT 
    categoryId, 
    SUM(stock) AS totalStock
FROM products
GROUP BY categoryId;

-- AVG: Calcula el precio promedio de los productos en cada categoría
SELECT 
    categoryId, 
    AVG(price) AS averagePrice
FROM products
GROUP BY categoryId;

-- MIN: Encuentra el precio más bajo de los productos en cada categoría
SELECT 
    categoryId, 
    MIN(price) AS lowestPrice
FROM products
GROUP BY categoryId;

-- MAX: Encuentra el precio más alto de los productos en cada categoría
SELECT 
    categoryId, 
    MAX(price) AS highestPrice
FROM products
GROUP BY categoryId;
