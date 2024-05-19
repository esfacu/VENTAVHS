USE VENTA_DE_PELICULAS;

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_cliente`(
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
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_pelicula`(
    IN p_titulo VARCHAR(255),
    IN p_genero VARCHAR(100),
    IN p_director VARCHAR(100),
    IN p_anio int,
    IN p_precio DECIMAL(10,2)
)
BEGIN
    INSERT INTO Peliculas (titulo, genero, director, anio, precio)
    VALUES (p_titulo, p_genero, p_director, p_anio, p_precio);
END

USE VENTA_DE_PELICULAS;

-- TEST PROCEDIMIENTOS:

-- TEST INSERTAR CLIENTE
call venta_de_peliculas.insertar_cliente('Juancito', 'Rodriguez', 27, 'Calle 8', '2224455', 'juan@mail.com');
SELECT * FROM CLIENTES;


-- TEST INSERTAR PELICULA

call venta_de_peliculas.insertar_pelicula('Tintin', 'Terror', 'Juancito', 2025, 10);
SELECT * FROM PELICULAS

