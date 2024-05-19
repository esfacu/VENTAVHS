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