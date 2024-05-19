-- Crear la base de datos
DROP DATABASE IF EXISTS VENTA_DE_PELICULAS;
CREATE DATABASE IF NOT EXISTS VENTA_DE_PELICULAS;

-- Usar la base de datos recién creada
USE VENTA_DE_PELICULAS;

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

-- CREACIÓN DE LA TABLA EMPLEADOS
CREATE TABLE Empleados (
	id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50),
    fecha_ingreso DATE,
    telefono VARCHAR(15),
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
    id_vendedor INT,
    FOREIGN KEY (id_transaccion) REFERENCES Transacciones(id_transaccion),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_vendedor) REFERENCES Empleados(id_vendedor)
);

-- CREACION DE LA TABLA Proveedores

CREATE TABLE Proveedores (
	id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    rut INT,
    nombre VARCHAR(100),
    telefono VARCHAR(15),
    correo VARCHAR(100) 
    );
    
-- CREAR TABLA COMPRA_PROVEEDORES
CREATE TABLE Compra_Proveedores (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT,
    fecha DATE,
    metodo_pago VARCHAR(50),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

ALTER TABLE Compra_Proveedores
    ADD CONSTRAINT FK_Compra_Proveedores_Proveedores
    FOREIGN KEY (id_proveedor) 
    REFERENCES Proveedores(id_proveedor) 
    ON DELETE SET NULL;
    
SELECT * FROM Compra_Proveedores;

-- Creación de la tabla Detalles_Transaccion

CREATE TABLE Detalles_Compra_Proveedores (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_transaccion INT UNIQUE,
    id_pelicula INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_transaccion) REFERENCES Compra_Proveedores(id_transaccion),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
);




SELECT * FROM detalles_compra_proveedores;





