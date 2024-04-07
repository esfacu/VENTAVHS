USE VENTA_DE_PELICULAS;

-- Inserción de datos en la tabla Peliculas
INSERT INTO Peliculas (titulo, genero, director, año, precio) VALUES
('Back to the Future', 'Ciencia ficción', 'Robert Zemeckis', 1985, 9.99),
('The Breakfast Club', 'Comedia dramática', 'John Hughes', 1985, 12.99),
('Raiders of the Lost Ark', 'Aventura', 'Steven Spielberg', 1981, 14.99),
('Blade Runner', 'Ciencia ficción', 'Ridley Scott', 1982, 11.99),
('The Terminator', 'Acción y ciencia ficción', 'James Cameron', 1984, 10.99),
('E.T. the Extra-Terrestrial', 'Ciencia ficción', 'Steven Spielberg', 1982, 12.99),
('Ghostbusters', 'Comedia de ciencia ficción', 'Ivan Reitman', 1984, 9.99),
('Scarface', 'Drama criminal', 'Brian De Palma', 1983, 13.99);

-- Inserción de datos en la tabla Clientes
INSERT INTO Clientes (nombre, apellido, edad, direccion, celular, correo) VALUES
('Carlos', 'Gutiérrez', 35, 'Calle 123', '123456789', 'carlos@example.com'),
('Ana', 'Martínez', 28, 'Avenida 456', '987654321', 'ana@example.com');

-- Inserción de datos en la tabla Transacciones
INSERT INTO Transacciones (id_cliente, fecha, metodo_pago) VALUES
(1, '2024-03-22', 'Tarjeta de crédito'),
(2, '2024-03-21', 'Efectivo');

-- Inserción de datos en la tabla Detalles_Transaccion
INSERT INTO Detalles_Transaccion (id_transaccion, id_pelicula, cantidad, precio_unitario) VALUES
(1, 1, 1, 9.99),
(2, 2, 2, 12.99),
(2, 3, 1, 14.99);


-- Inserciones para la tabla Proveedores
INSERT INTO Proveedores (rut, nombre, telefono, correo) VALUES
(12345678, 'Proveedor Uno', '123456789', 'proveedor1@example.com'),
(87654321, 'Proveedor Dos', '987654321', 'proveedor2@example.com');

-- Inserciones para la tabla Compra_Proveedores
INSERT INTO Compra_Proveedores (id_proveedor, fecha, metodo_pago) VALUES
(1, '2024-03-22', 'Transferencia'),
(2, '2024-03-23', 'Tarjeta');

-- Inserciones para la tabla Detalles_Compra_Proveedores
INSERT INTO Detalles_Compra_Proveedores (id_transaccion, id_pelicula, cantidad, precio_unitario) VALUES
(1, 1, 5, 2.50),
(1, 2, 3, 2.75),
(2, 3, 2, 2.25),
(2, 1, 4, 3.00);


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