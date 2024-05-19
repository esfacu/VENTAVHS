-- tRIGGERS
USE VENTA_DE_PELICULAS;

-- PRIMER trigger Validar que el email sea único:
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


CALL venta_de_peliculas.insertar_cliente('Pedro', 'Segundo', 2, 'aca la vuelta', '11233', 'carlos@example.com');

SELECT * FROM CLIENTES;

SHOW TRIGGERS LIKE 'validar_correo';

-- SEGUNDO trigger registro auditoria por cada insert de peliculas

DELIMITER // 
CREATE TRIGGER  After_Insert_Peliculas
AFTER INSERT ON Peliculas
FOR EACH ROW
BEGIN
	INSERT INTO Auditoria_Peliculas (accion, id_pelicula, titulo_pelicula , genero_pelicula, director_pelicula, año_pelicula, precio_pelicula, fecha_hora)
    VALUES ('Inserción', NEW.id_pelicula, NEW.titulo, NEW.genero, NEW.director, NEW.año, NEW.precio, NOW());
END;
//
DELIMITER ;
CALL venta_de_peliculas.insertar_pelicula('SQL LA PELICULA', 'DOCUSERIE', 'JUAN PELICULON', 2024, '300');
SELECT * FROM Auditoria_Peliculas;
SHOW TRIGGERS LIKE 'After_Insert_Peliculas';
