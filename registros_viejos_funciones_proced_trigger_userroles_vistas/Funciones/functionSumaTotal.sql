CREATE FUNCTION `CalcularPrecio`(id_transaccion INT) 
RETURNS DECIMAL (10,2)
BEGIN
DECLARE total DECIMAL(10,2);

SELECT SUM(PRECIO)
INTO total
FROM detalle_transaccion
where id_transaccion = id_transaccion;

RETURN total;
END
