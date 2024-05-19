CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_pelicula`(
    IN p_titulo VARCHAR(255),
    IN p_genero VARCHAR(100),
    IN p_director VARCHAR(100),
    IN p_año int,
    IN p_precio DECIMAL(10,2)
)
BEGIN
    INSERT INTO Peliculas (titulo, genero, director, año, precio)
    VALUES (p_titulo, p_genero, p_director, p_año, p_precio);
END