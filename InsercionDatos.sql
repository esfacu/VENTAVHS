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



-- Muestra la tabla finalizada
SELECT * FROM Peliculas
