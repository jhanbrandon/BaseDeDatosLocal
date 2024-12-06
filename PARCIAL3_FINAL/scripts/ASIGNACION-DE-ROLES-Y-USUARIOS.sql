-- Crear el rol Lector con privilegios de solo lectura (SELECT)
CREATE ROLE 'Lector';

-- Crear el rol Admin con privilegios completos (SELECT, INSERT, UPDATE, DELETE)
CREATE ROLE 'Admin';

-- Asignar privilegios al rol Lector (solo lectura)
GRANT SELECT ON hardwareshop.* TO 'Lector';

-- Asignar privilegios al rol Admin (todos los privilegios)
GRANT SELECT, INSERT, UPDATE, DELETE ON hardwareshop.* TO 'Admin';

-- Crear el usuario JhanLector
CREATE USER 'JhanLector'@'localhost' IDENTIFIED BY '123456';

-- Crear el usuario JhanAdmin
CREATE USER 'JhanAdmin'@'localhost' IDENTIFIED BY '123456';

-- Asignar permisos completos (SELECT, INSERT, UPDATE, DELETE) al rol Admin
GRANT SELECT, INSERT, UPDATE, DELETE ON hardwareshop.* TO 'Admin';

-- NOTA TAMBIEN SE PUEDE Asignar permisos completos (SELECT, INSERT, UPDATE, DELETE) al rol Admin
GRANT SELECT ON hardwareshop.products TO 'Lector';
GRANT SELECT, INSERT, UPDATE ON hardwareshop.invoices TO 'Admin';

-- NOTA TAMBIEN SE PUEDE asignar permisos de solo lectura al usuario JhanLector
GRANT SELECT ON hardwareshop.* TO 'JhanLector'@'localhost';

-- Asignar permisos completos al usuario JhanAdmin
GRANT SELECT, INSERT, UPDATE, DELETE ON hardwareshop.* TO 'JhanAdmin'@'localhost';


-- Asignar el rol Lector al usuario JhanLector
GRANT 'Lector' TO 'JhanLector'@'localhost';

-- Asignar el rol Admin al usuario JhanAdmin
GRANT 'Admin' TO 'JhanAdmin'@'localhost';

-- Verificar los privilegios del rol Lector
SHOW GRANTS FOR 'Lector';

-- Verificar los privilegios del rol Admin
SHOW GRANTS FOR 'Admin';

-- Verificar los privilegios del usuario JhanLector
SHOW GRANTS FOR 'JhanLector'@'localhost';

-- Verificar los privilegios del usuario JhanAdmin
SHOW GRANTS FOR 'JhanAdmin'@'localhost';



-- Establecer una politica de contraseñas
ALTER USER 'JhanLector'@'localhost' PASSWORD EXPIRE INTERVAL 90 DAY;
ALTER USER 'JhanAdmin'@'localhost' PASSWORD EXPIRE INTERVAL 90 DAY;
