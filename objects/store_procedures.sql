USE VENTA_DE_PELICULAS;

DELIMITER //

CREATE PROCEDURE `insertar_cliente`(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_edad INT,
    IN p_direccion VARCHAR(255),
    IN p_celular VARCHAR(15),
    IN p_correo VARCHAR(100)
)
BEGIN
    INSERT INTO Clientes (nombre, apellido, edad, direccion, celular, correo)
    VALUES (p_nombre, p_apellido, p_edad, p_direccion, p_celular, p_correo);
END //

CREATE PROCEDURE `insertar_pelicula`(
    IN p_titulo VARCHAR(255),
    IN p_genero VARCHAR(100),
    IN p_director VARCHAR(100),
    IN p_anio INT,
    IN p_precio DECIMAL(10,2)
)
BEGIN
    INSERT INTO Peliculas (titulo, genero, director, anio, precio)
    VALUES (p_titulo, p_genero, p_director, p_anio, p_precio);
END //

DELIMITER ;


CALL insertar_cliente('Cliente1', 'Apellido1', 25, 'Dirección1', '123456789', 'cliente1@example.com');
CALL insertar_cliente('Cliente2', 'Apellido2', 30, 'Dirección2', '987654321', 'cliente2@example.com');
CALL insertar_cliente('Cliente3', 'Apellido3', 35, 'Dirección3', '123456789', 'cliente3@example.com');
CALL insertar_cliente('Cliente4', 'Apellido4', 40, 'Dirección4', '987654321', 'cliente4@example.com');
CALL insertar_cliente('Cliente5', 'Apellido5', 45, 'Dirección5', '123456789', 'cliente5@example.com');
CALL insertar_cliente('Cliente6', 'Apellido6', 50, 'Dirección6', '987654321', 'cliente6@example.com');
CALL insertar_cliente('Cliente7', 'Apellido7', 55, 'Dirección7', '123456789', 'cliente7@example.com');
CALL insertar_cliente('Cliente8', 'Apellido8', 60, 'Dirección8', '987654321', 'cliente8@example.com');
CALL insertar_cliente('Cliente9', 'Apellido9', 65, 'Dirección9', '123456789', 'cliente9@example.com');
CALL insertar_cliente('Cliente10', 'Apellido10', 70, 'Dirección10', '987654321', 'cliente10@example.com');
CALL insertar_cliente('Cliente11', 'Apellido11', 75, 'Dirección11', '123456789', 'cliente11@example.com');
CALL insertar_cliente('Cliente12', 'Apellido12', 80, 'Dirección12', '987654321', 'cliente12@example.com');
CALL insertar_cliente('Cliente13', 'Apellido13', 85, 'Dirección13', '123456789', 'cliente13@example.com');
CALL insertar_cliente('Cliente14', 'Apellido14', 90, 'Dirección14', '987654321', 'cliente14@example.com');
CALL insertar_cliente('Cliente15', 'Apellido15', 95, 'Dirección15', '123456789', 'cliente15@example.com');
CALL insertar_cliente('Cliente16', 'Apellido16', 100, 'Dirección16', '987654321', 'cliente16@example.com');
CALL insertar_cliente('Cliente17', 'Apellido17', 105, 'Dirección17', '123456789', 'cliente17@example.com');
CALL insertar_cliente('Cliente18', 'Apellido18', 110, 'Dirección18', '987654321', 'cliente18@example.com');
CALL insertar_cliente('Cliente19', 'Apellido19', 115, 'Dirección19', '123456789', 'cliente19@example.com');
CALL insertar_cliente('Cliente20', 'Apellido20', 120, 'Dirección20', '987654321', 'cliente20@example.com');

CALL insertar_pelicula('Pelicula1', 'Género1', 'Director1', 2000, 9.99);
CALL insertar_pelicula('Pelicula2', 'Género2', 'Director2', 2001, 11.99);
CALL insertar_pelicula('Pelicula3', 'Género3', 'Director3', 2002, 13.99);
CALL insertar_pelicula('Pelicula4', 'Género4', 'Director4', 2003, 15.99);
CALL insertar_pelicula('Pelicula5', 'Género5', 'Director5', 2004, 17.99);
CALL insertar_pelicula('Pelicula6', 'Género6', 'Director6', 2005, 19.99);
CALL insertar_pelicula('Pelicula7', 'Género7', 'Director7', 2006, 21.99);
CALL insertar_pelicula('Pelicula8', 'Género8', 'Director8', 2007, 23.99);
CALL insertar_pelicula('Pelicula9', 'Género9', 'Director9', 2008, 25.99);
CALL insertar_pelicula('Pelicula10', 'Género10', 'Director10', 2009, 27.99);
CALL insertar_pelicula('Pelicula11', 'Género11', 'Director11', 2010, 29.99);
CALL insertar_pelicula('Pelicula12', 'Género12', 'Director12', 2011, 31.99);
CALL insertar_pelicula('Pelicula13', 'Género13', 'Director13', 2012, 33.99);
CALL insertar_pelicula('Pelicula14', 'Género14', 'Director14', 2013, 35.99);
CALL insertar_pelicula('Pelicula15', 'Género15', 'Director15', 2014, 37.99);
CALL insertar_pelicula('Pelicula16', 'Género16', 'Director16', 2015, 39.99);
CALL insertar_pelicula('Pelicula17', 'Género17', 'Director17', 2016, 41.99);
CALL insertar_pelicula('Pelicula18', 'Género18', 'Director18', 2017, 43.99);
CALL insertar_pelicula('Pelicula19', 'Género19', 'Director19', 2018, 45.99);
CALL insertar_pelicula('Pelicula20', 'Género20', 'Director20', 2019, 47.99);


