CREATE DEFINER=`root`@`localhost` FUNCTION `anio_pelicula`(numero INT) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE pelicula VARCHAR(255);

    SELECT titulo INTO pelicula
    FROM Peliculas
    WHERE año = numero
    LIMIT 1;

    RETURN pelicula;
END