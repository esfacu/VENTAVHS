-- tRIGGERS
USE VENTA_DE_PELICULAS;

-- Validar que el email sea único:
DELIMITER //
CREATE TRIGGER validar_correo
BEFORE INSERT ON CLIENTES
FOR EACH ROW
BEGIN
  DECLARE correo_existente INT;

  SELECT COUNT(*) INTO correo_existente
  FROM CLIENTES
  WHERE correo = NEW.correo;

  IF correo_existente > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El email ya está registrado';
  END IF;
END;
//
DELIMITER ;
