USE VENTA_DE_PELICULAS;

-- TEST PROCEDIMIENTOS:

-- TEST INSERTAR CLIENTE
call venta_de_peliculas.insertar_cliente('Juancito', 'Rodriguez', 27, 'Calle 8', '2224455', 'juan@mail.com');
SELECT * FROM CLIENTES;


-- TEST INSERTAR PELICULA

call venta_de_peliculas.insertar_pelicula('Tintin', 'Terror', 'Juancito', 2025, 10);
SELECT * FROM PELICULAS

