USE VENTA_DE_PELICULAS;

-- Crear usuarios si no existen
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'password_admin';
CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY 'password_user';
CREATE USER IF NOT EXISTS 'facundo.rodriguez@pedidosya.com' IDENTIFIED BY '123456';

-- Asignar privilegios a los usuarios
GRANT SELECT, INSERT, UPDATE, DELETE ON * TO 'facundo.rodriguez@pedidosya.com';
GRANT SELECT, INSERT, UPDATE, DELETE ON * TO 'admin'@'localhost';
GRANT SELECT ON * TO 'user'@'localhost';
