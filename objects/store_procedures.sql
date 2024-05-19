USE VENTA_DE_PELICULAS;

DELIMITER //

CREATE PROCEDURE `insertar_cliente`(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_edad INT,
    IN p_direccion VARCHAR(255),
    IN p_celular VARCHAR(15),
    IN p_correo VARCHAR(100)
)
BEGIN
    INSERT INTO Clientes (nombre, apellido, edad, direccion, celular, correo)
    VALUES (p_nombre, p_apellido, p_edad, p_direccion, p_celular, p_correo);
END //

CREATE PROCEDURE `insertar_pelicula`(
    IN p_titulo VARCHAR(255),
    IN p_genero VARCHAR(100),
    IN p_director VARCHAR(100),
    IN p_anio INT,
    IN p_precio DECIMAL(10,2)
)
BEGIN
    INSERT INTO Peliculas (titulo, genero, director, anio, precio)
    VALUES (p_titulo, p_genero, p_director, p_anio, p_precio);
END //

DELIMITER ;
