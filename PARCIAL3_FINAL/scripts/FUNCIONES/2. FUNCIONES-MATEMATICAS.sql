-- ROUND: Redondea un valor decimal al número especificado de dígitos
-- 1. Redondea los precios de los productos a 0 decimales
SELECT productName, price, ROUND(price, 0) AS roundedPrice
FROM products;

-- ABS: Calcula el valor absoluto de un numero (sin el signo negativo)
-- 2. Calcula el valor absoluto de una diferencia simulada en stock de productos
SELECT productName, stock - 100 AS stockDifference, ABS(stock - 100) AS absoluteStockDifference
FROM products;

