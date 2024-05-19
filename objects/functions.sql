USE VENTA_DE_PELICULAS;

-- Función anio_pelicula
DROP FUNCTION IF EXISTS anio_pelicula;
DELIMITER //
CREATE FUNCTION anio_pelicula(numero INT) RETURNS VARCHAR(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE pelicula VARCHAR(255);

    SELECT titulo INTO pelicula
    FROM Peliculas
    WHERE anio = numero
    LIMIT 1;

    RETURN pelicula;
END //
DELIMITER ;

-- Función CalcularPrecio para detalles_compra_proveedores
DROP FUNCTION IF EXISTS CalcularPrecio;
DELIMITER //
CREATE FUNCTION CalcularPrecio(numero INT) RETURNS DECIMAL(10,2)
    READS SQL DATA
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT cantidad * precio_unitario INTO total
    FROM detalles_compra_proveedores
    WHERE id_detalle = numero
    LIMIT 1; -- Limitar la consulta a un solo resultado

    RETURN total;
END //
DELIMITER ;
