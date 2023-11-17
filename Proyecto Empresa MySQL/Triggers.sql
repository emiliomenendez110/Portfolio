DELIMITER $$
CREATE TRIGGER TG_FACTURACION_INSERT 
AFTER INSERT ON items
FOR EACH ROW BEGIN
  CALL sp_triggers;
END $$

DELIMITER $$
CREATE TRIGGER TG_FACTURACION_DELETE
AFTER DELETE ON items
FOR EACH ROW BEGIN
  CALL sp_triggers;
END $$

DELIMITER $$
CREATE TRIGGER TG_FACTURACION_UPDATE
AFTER UPDATE ON items
FOR EACH ROW BEGIN
  CALL sp_triggers;
END $$
