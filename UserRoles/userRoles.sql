-- Crear usuarios
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password_admin';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password_user';
CREATE USER 'facundo.rodriguez@pedidosya.com' IDENTIFIED BY '123456';

-- Asignar privilegios a los usuarios
GRANT SELECT, INSERT, UPDATE, DELETE ON * TO 'facundo.rodriguez@pedidosya.com';
GRANT SELECT, INSERT, UPDATE, DELETE ON * TO 'admin'@'localhost';
GRANT SELECT ON * TO 'user'@'localhost';

