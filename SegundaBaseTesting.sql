-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS VENTA_DE_PELICULAS_TEST;

-- Usar la base de datos recién creada
USE VENTA_DE_PELICULAS_TEST;

-- Creación de la tabla Películas
CREATE TABLE Peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    genero VARCHAR(100),
    director VARCHAR(100),
    año INT,
    precio DECIMAL(10, 2)
);

-- Creación de la tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    edad INT,
    direccion VARCHAR(255),
    celular VARCHAR(15),
    correo VARCHAR(100)
);
-- Creación de la tabla Transacciones
CREATE TABLE Transacciones (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    metodo_pago VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Creación de la tabla Detalles_Transaccion
CREATE TABLE Detalles_Transaccion (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_transaccion INT,
    id_pelicula INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_transaccion) REFERENCES Transacciones(id_transaccion),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
);


USE VENTA_DE_PELICULAS_TEST;

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

-- Muestra la tabla finalizada
SELECT * FROM Peliculas;


- VISTAS 

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


