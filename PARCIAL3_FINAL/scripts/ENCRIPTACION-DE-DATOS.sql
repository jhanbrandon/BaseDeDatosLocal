--  Modificar la Columna password para Soportar Datos Cifrados

ALTER TABLE users MODIFY COLUMN `password` CHAR(64);

--  Encriptar la Contraseña de un Usuario

UPDATE users

SET `passwordHash` = SHA2('securepassword', 256)
WHERE `userId` = 1;

-- Verificar la Contraseña Encriptada

SELECT `userId`
FROM users
WHERE `userId` = 1 AND `passwordHash` = SHA2('securepassword', 256);

-- Encriptar los Valores Existentes con SHA2

UPDATE users
SET `password` = SHA2(`password`, 256);

--  Encriptar la Contraseña de todos los Usuario

