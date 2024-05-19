USE VENTA_DE_PELICULAS;

-- VISTAS 

-- PRIMER VISTA TRAE DATOS CLIENTES

CREATE VIEW `info_clientes` AS
SELECT nombre, apellido, direccion, celular, correo
FROM Clientes;

SELECT * FROM info_clientes;

-- SEGUNDA TRAE DETALLES COMPRA PROVEEDORES 
CREATE VIEW `detalles_compras_proveedores` AS
SELECT cp.fecha, cp.metodo_pago, pr.nombre AS nombre_proveedor, pel.titulo, dcp.cantidad, dcp.precio_unitario, (dcp.cantidad * dcp.precio_unitario) AS total
FROM Compra_Proveedores cp
JOIN Proveedores pr ON cp.id_proveedor = pr.id_proveedor
JOIN Detalles_Compra_Proveedores dcp ON cp.id_transaccion = dcp.id_transaccion
JOIN Peliculas pel ON dcp.id_pelicula = pel.id_pelicula;

SELECT * FROM detalles_compras_proveedores;

-- TERCERA TRAE CATALOGO
CREATE VIEW `catalogo_peliculas` AS
SELECT titulo, año, precio
FROM Peliculas;

SELECT * FROM catalogo_peliculas;

-- CUARTA TRAE VENTA POR CLIENTE 
CREATE VIEW `ventas_por_cliente_y_pelicula` AS
SELECT c.nombre, c.apellido, p.titulo, dt.cantidad, dt.precio_unitario, (dt.cantidad * dt.precio_unitario) AS total
FROM Clientes c
JOIN Transacciones t ON c.id_cliente = t.id_cliente
JOIN Detalles_Transaccion dt ON t.id_transaccion = dt.id_transaccion
JOIN Peliculas p ON dt.id_pelicula = p.id_pelicula;

SELECT * FROM ventas_por_cliente_y_pelicula;

--  QUINTA TRAE COMPRA CON PROVEEDOR + PELICULA
CREATE VIEW `compras_por_proveedor_y_pelicula` AS
SELECT pr.nombre AS nombre_proveedor, p.titulo, dcp.cantidad, dcp.precio_unitario, (dcp.cantidad * dcp.precio_unitario) AS total
FROM Proveedores pr
JOIN Compra_Proveedores cp ON pr.id_proveedor = cp.id_proveedor
JOIN Detalles_Compra_Proveedores dcp ON cp.id_transaccion = dcp.id_transaccion
JOIN Peliculas p ON dcp.id_pelicula = p.id_pelicula;

SELECT * FROM compras_por_proveedor_y_pelicula;

-- SEXTA VISTA VENTAS POR VENDEDOR + CANTIDAD DE VENTAS
DROP VIEW IF EXISTS ventas_por_vendedor;
CREATE VIEW `ventas_por_vendedor` AS
SELECT 
    emp.nombre AS nombre_vendedor, 
    p.titulo, 
    dt.precio_unitario, 
    (dt.cantidad * dt.precio_unitario) AS total,
    (SELECT COUNT(*)
     FROM Detalles_Transaccion dt2
     WHERE dt2.id_vendedor = emp.id_vendedor) AS cantidad_ventas
FROM Empleados emp
JOIN Detalles_Transaccion dt ON emp.id_vendedor = dt.id_vendedor
JOIN Peliculas p ON dt.id_pelicula = p.id_pelicula;

select * from ventas_por_vendedor;


