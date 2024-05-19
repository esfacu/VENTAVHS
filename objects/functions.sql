USE VENTA_DE_PELICULAS;
-- Función anio_pelicula
CREATE DEFINER=`root`@`localhost` FUNCTION `anio_pelicula`(numero INT) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE pelicula VARCHAR(255);

    SELECT titulo INTO pelicula
    FROM Peliculas
    WHERE anio = numero
    LIMIT 1;

    RETURN pelicula;
END;

-- Función CalcularPrecio para detalles_compra_proveedores
CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularPrecio`(numero INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT cantidad * precio_unitario INTO total
    FROM detalles_compra_proveedores
    WHERE id_detalle = numero
    LIMIT 1; -- Limitar la consulta a un solo resultado

    RETURN total;
END;

-- Función CalcularPrecio para detalle_transaccion
CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularPrecioTransaccion`(id_transaccion INT) 
RETURNS DECIMAL (10,2)
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(PRECIO)
    INTO total
    FROM detalle_transaccion
    WHERE id_transaccion = id_transaccion;

    RETURN total;
END;

USE VENTA_DE_PELICULAS;

-- Se ejecuta la función CalcularPrecioTransaccion
SELECT CalcularPrecioTransaccion(3) AS PrecioTotal;
SELECT * FROM detalles_compra_proveedores;

-- Se ejecuta la función anio_pelicula
SELECT anio_pelicula(1985) AS Peliculaanio;
SELECT * FROM peliculas;
