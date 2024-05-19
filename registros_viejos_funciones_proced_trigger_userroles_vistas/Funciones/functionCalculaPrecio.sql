CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularPrecio`(numero INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT cantidad * precio_unitario INTO total
    FROM detalles_compra_proveedores
    WHERE numero = id_detalle
    LIMIT 1; -- Limitar la consulta a un solo resultado

    RETURN total;
END