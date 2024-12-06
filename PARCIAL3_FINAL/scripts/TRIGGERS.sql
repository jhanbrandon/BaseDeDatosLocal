-- Trigger para actualizar el campo `createdtedAt` en la tabla invoices
DELIMITER $$
CREATE TRIGGER trg_invoices_created_at
BEFORE UPDATE ON invoices
FOR EACH ROW
BEGIN
    SET NEW.createdAt = CURRENT_TIMESTAMP;
END$$
DELIMITER ;

-- Trigger para validar que el total de invoices se calcula correctamente
DELIMITER $$
CREATE TRIGGER trg_invoices_calculate_total
BEFORE INSERT ON invoiceDetails
FOR EACH ROW
BEGIN
    UPDATE invoices
    SET totalAmount = (
        SELECT SUM(quantity * price)
        FROM invoiceDetails
        WHERE invoiceId = NEW.invoiceId
    )
    WHERE invoiceId = NEW.invoiceId;
END$$
DELIMITER ;

-- Trigger para actualizar `createdAt` en la tabla materialEntries
DELIMITER $$
CREATE TRIGGER trg_materialentries_createdAt
BEFORE UPDATE ON materialEntries
FOR EACH ROW
BEGIN
    SET NEW.createdAt = CURRENT_TIMESTAMP;
END$$
DELIMITER ;

-- Trigger para calcular el total en materialEntries
DELIMITER $$
CREATE TRIGGER trg_materialentries_calculate_total
BEFORE INSERT ON materialEntryDetails
FOR EACH ROW
BEGIN
    UPDATE materialEntries
    SET totalAmount = (
        SELECT SUM(quantity * price)
        FROM materialEntryDetails
        WHERE entryId = NEW.entryId
    )
    WHERE entryId = NEW.entryId;
END$$
DELIMITER ;

-- Trigger para actualizar `updatedAt` en la tabla parameters
DELIMITER $$
CREATE TRIGGER trg_parameters_updated_at
BEFORE UPDATE ON parameters
FOR EACH ROW
BEGIN
    SET NEW.updatedAt = CURRENT_TIMESTAMP;
END$$
DELIMITER ;

-- Trigger para registrar `oldRole` y `newRole` en roleHistory
DELIMITER $$
CREATE TRIGGER trg_rolehistory_roles
BEFORE INSERT ON roleHistory
FOR EACH ROW
BEGIN
    SET NEW.changedAt = CURRENT_TIMESTAMP;
    SET NEW.changedBy = CURRENT_USER;
END$$
DELIMITER ;

-- Trigger para validar que los precios y stock no sean negativos en la tabla products
DELIMITER $$
CREATE TRIGGER trg_products_validate
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF NEW.price < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio no puede ser negativo';
    END IF;

    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El stock no puede ser negativo';
    END IF;
END$$
DELIMITER ;

-- Trigger para actualizar `updatedAt` en la tabla products
DELIMITER $$
CREATE TRIGGER trg_products_updated_at
BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    SET NEW.updatedAt = CURRENT_TIMESTAMP;

    -- Validar que el stock no sea negativo en las actualizaciones
    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El stock no puede ser negativo';
    END IF;
END$$
DELIMITER ;

-- Trigger para actualizar los campos `changedBy` y `changedAt` en productHistory
DELIMITER $$
CREATE TRIGGER trg_producthistory_changed
BEFORE INSERT ON productHistory
FOR EACH ROW
BEGIN
    SET NEW.changedAt = CURRENT_TIMESTAMP;
    SET NEW.changedBy = CURRENT_USER;
END$$
DELIMITER ;

-- Trigger para establecer `createdAt` en la tabla products
DELIMITER $$
CREATE TRIGGER trg_products_created_at
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    SET NEW.createdAt = CURRENT_TIMESTAMP;
END$$
DELIMITER ;

