mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.4.0, for Linux (x86_64)
--
-- Host: localhost    Database: VENTA_DE_PELICULAS
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'Carlos','GutiÃ©rrez',35,'Calle 123','123456789','carlos@example.com'),(2,'Ana','MartÃ­nez',28,'Avenida 456','987654321','ana@example.com'),(3,'Cliente1','Apellido1',25,'DirecciÃ³n1','123456789','cliente1@example.com'),(4,'Cliente2','Apellido2',30,'DirecciÃ³n2','987654321','cliente2@example.com'),(5,'Cliente3','Apellido3',35,'DirecciÃ³n3','123456789','cliente3@example.com'),(6,'Cliente4','Apellido4',40,'DirecciÃ³n4','987654321','cliente4@example.com'),(7,'Cliente5','Apellido5',45,'DirecciÃ³n5','123456789','cliente5@example.com'),(8,'Cliente6','Apellido6',50,'DirecciÃ³n6','987654321','cliente6@example.com'),(9,'Cliente7','Apellido7',55,'DirecciÃ³n7','123456789','cliente7@example.com'),(10,'Cliente8','Apellido8',60,'DirecciÃ³n8','987654321','cliente8@example.com'),(11,'Cliente9','Apellido9',65,'DirecciÃ³n9','123456789','cliente9@example.com'),(12,'Cliente10','Apellido10',70,'DirecciÃ³n10','987654321','cliente10@example.com'),(13,'Cliente11','Apellido11',75,'DirecciÃ³n11','123456789','cliente11@example.com'),(14,'Cliente12','Apellido12',80,'DirecciÃ³n12','987654321','cliente12@example.com'),(15,'Cliente13','Apellido13',85,'DirecciÃ³n13','123456789','cliente13@example.com'),(16,'Cliente14','Apellido14',90,'DirecciÃ³n14','987654321','cliente14@example.com'),(17,'Cliente15','Apellido15',95,'DirecciÃ³n15','123456789','cliente15@example.com'),(18,'Cliente16','Apellido16',100,'DirecciÃ³n16','987654321','cliente16@example.com'),(19,'Cliente17','Apellido17',105,'DirecciÃ³n17','123456789','cliente17@example.com'),(20,'Cliente18','Apellido18',110,'DirecciÃ³n18','987654321','cliente18@example.com'),(21,'Cliente19','Apellido19',115,'DirecciÃ³n19','123456789','cliente19@example.com'),(22,'Cliente20','Apellido20',120,'DirecciÃ³n20','987654321','cliente20@example.com');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validar_correo` BEFORE INSERT ON `Clientes` FOR EACH ROW BEGIN
  DECLARE correo_existente INT;

  SELECT COUNT(*) INTO correo_existente
  FROM Clientes
  WHERE correo = NEW.correo;

  IF correo_existente > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El email ya está registrado';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Compra_Proveedores`
--

DROP TABLE IF EXISTS `Compra_Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Compra_Proveedores` (
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `FK_Compra_Proveedores_Proveedores` (`id_proveedor`),
  CONSTRAINT `Compra_Proveedores_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `Proveedores` (`id_proveedor`),
  CONSTRAINT `FK_Compra_Proveedores_Proveedores` FOREIGN KEY (`id_proveedor`) REFERENCES `Proveedores` (`id_proveedor`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compra_Proveedores`
--

LOCK TABLES `Compra_Proveedores` WRITE;
/*!40000 ALTER TABLE `Compra_Proveedores` DISABLE KEYS */;
INSERT INTO `Compra_Proveedores` VALUES (1,1,'2024-03-22','Transferencia'),(2,2,'2024-03-23','Tarjeta');
/*!40000 ALTER TABLE `Compra_Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detalles_Compra_Proveedores`
--

DROP TABLE IF EXISTS `Detalles_Compra_Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Detalles_Compra_Proveedores` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_transaccion` int DEFAULT NULL,
  `id_pelicula` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  UNIQUE KEY `id_transaccion` (`id_transaccion`),
  KEY `id_pelicula` (`id_pelicula`),
  CONSTRAINT `Detalles_Compra_Proveedores_ibfk_1` FOREIGN KEY (`id_transaccion`) REFERENCES `Compra_Proveedores` (`id_transaccion`),
  CONSTRAINT `Detalles_Compra_Proveedores_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `Peliculas` (`id_pelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalles_Compra_Proveedores`
--

LOCK TABLES `Detalles_Compra_Proveedores` WRITE;
/*!40000 ALTER TABLE `Detalles_Compra_Proveedores` DISABLE KEYS */;
INSERT INTO `Detalles_Compra_Proveedores` VALUES (1,1,2,3,2.75),(2,2,1,4,3.00);
/*!40000 ALTER TABLE `Detalles_Compra_Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detalles_Transaccion`
--

DROP TABLE IF EXISTS `Detalles_Transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Detalles_Transaccion` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_transaccion` int DEFAULT NULL,
  `id_pelicula` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `id_vendedor` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_transaccion` (`id_transaccion`),
  KEY `id_pelicula` (`id_pelicula`),
  KEY `id_vendedor` (`id_vendedor`),
  CONSTRAINT `Detalles_Transaccion_ibfk_1` FOREIGN KEY (`id_transaccion`) REFERENCES `Transacciones` (`id_transaccion`),
  CONSTRAINT `Detalles_Transaccion_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `Peliculas` (`id_pelicula`),
  CONSTRAINT `Detalles_Transaccion_ibfk_3` FOREIGN KEY (`id_vendedor`) REFERENCES `Empleados` (`id_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalles_Transaccion`
--

LOCK TABLES `Detalles_Transaccion` WRITE;
/*!40000 ALTER TABLE `Detalles_Transaccion` DISABLE KEYS */;
INSERT INTO `Detalles_Transaccion` VALUES (1,1,1,1,9.99,1),(2,2,2,2,12.99,2),(3,2,3,1,14.99,3);
/*!40000 ALTER TABLE `Detalles_Transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados`
--

DROP TABLE IF EXISTS `Empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados` (
  `id_vendedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados`
--

LOCK TABLES `Empleados` WRITE;
/*!40000 ALTER TABLE `Empleados` DISABLE KEYS */;
INSERT INTO `Empleados` VALUES (1,'Juan','2000-01-01','+59892145','juan@ventas.com'),(2,'Raul','2000-01-01','+59892145','Raul@ventas.com'),(3,'Pedro','2000-01-01','+59892145','Pedro@ventas.com'),(4,'Micaela','2000-01-01','+59892145','Micaela@ventas.com');
/*!40000 ALTER TABLE `Empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Peliculas`
--

DROP TABLE IF EXISTS `Peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Peliculas` (
  `id_pelicula` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `director` varchar(100) DEFAULT NULL,
  `anio` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Peliculas`
--

LOCK TABLES `Peliculas` WRITE;
/*!40000 ALTER TABLE `Peliculas` DISABLE KEYS */;
INSERT INTO `Peliculas` VALUES (1,'Back to the Future','Ciencia ficciÃ³n','Robert Zemeckis',1985,9.00),(2,'The Breakfast Club','Comedia dramÃ¡tica','John Hughes',1985,12.99),(3,'Raiders of the Lost Ark','Aventura','Steven Spielberg',1981,14.99),(4,'Blade Runner','Ciencia ficciÃ³n','Ridley Scott',1982,11.99),(5,'The Terminator','AcciÃ³n y ciencia ficciÃ³n','James Cameron',1984,10.99),(6,'E.T. the Extra-Terrestrial','Ciencia ficciÃ³n','Steven Spielberg',1982,12.99),(7,'Ghostbusters','Comedia de ciencia ficciÃ³n','Ivan Reitman',1984,9.99),(8,'Scarface','Drama criminal','Brian De Palma',1983,13.99),(9,'Pelicula1','GÃ©nero1','Director1',2000,9.99),(10,'Pelicula2','GÃ©nero2','Director2',2001,11.99),(11,'Pelicula3','GÃ©nero3','Director3',2002,13.99),(12,'Pelicula4','GÃ©nero4','Director4',2003,15.99),(13,'Pelicula5','GÃ©nero5','Director5',2004,17.99),(14,'Pelicula6','GÃ©nero6','Director6',2005,19.99),(15,'Pelicula7','GÃ©nero7','Director7',2006,21.99),(16,'Pelicula8','GÃ©nero8','Director8',2007,23.99),(17,'Pelicula9','GÃ©nero9','Director9',2008,25.99),(18,'Pelicula10','GÃ©nero10','Director10',2009,27.99),(19,'Pelicula11','GÃ©nero11','Director11',2010,29.99),(20,'Pelicula12','GÃ©nero12','Director12',2011,31.99),(21,'Pelicula13','GÃ©nero13','Director13',2012,33.99),(22,'Pelicula14','GÃ©nero14','Director14',2013,35.99),(23,'Pelicula15','GÃ©nero15','Director15',2014,37.99),(24,'Pelicula16','GÃ©nero16','Director16',2015,39.99),(25,'Pelicula17','GÃ©nero17','Director17',2016,41.99),(26,'Pelicula18','GÃ©nero18','Director18',2017,43.99),(27,'Pelicula19','GÃ©nero19','Director19',2018,45.99),(28,'Pelicula20','GÃ©nero20','Director20',2019,47.99);
/*!40000 ALTER TABLE `Peliculas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `After_Insert_Peliculas` AFTER INSERT ON `Peliculas` FOR EACH ROW BEGIN
	INSERT INTO Auditoria_Peliculas (accion, id_pelicula, titulo_pelicula , genero_pelicula, director_pelicula, anio_pelicula, precio_pelicula, fecha_hora)
    VALUES ('Inserción', NEW.id_pelicula, NEW.titulo, NEW.genero, NEW.director, NEW.anio, NEW.precio, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `rut` int DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES (1,12345678,'Proveedor Uno','123456789','proveedor1@example.com'),(2,87654321,'Proveedor Dos','987654321','proveedor2@example.com');
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transacciones`
--

DROP TABLE IF EXISTS `Transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transacciones` (
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `estadotransacciones` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `Transacciones_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transacciones`
--

LOCK TABLES `Transacciones` WRITE;
/*!40000 ALTER TABLE `Transacciones` DISABLE KEYS */;
INSERT INTO `Transacciones` VALUES (1,1,'2024-03-22','Tarjeta de crÃ©dito',1),(2,2,'2024-03-21','Efectivo',1);
/*!40000 ALTER TABLE `Transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `catalogo_peliculas`
--

DROP TABLE IF EXISTS `catalogo_peliculas`;
/*!50001 DROP VIEW IF EXISTS `catalogo_peliculas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `catalogo_peliculas` AS SELECT 
 1 AS `titulo`,
 1 AS `anio`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `compras_por_proveedor_y_pelicula`
--

DROP TABLE IF EXISTS `compras_por_proveedor_y_pelicula`;
/*!50001 DROP VIEW IF EXISTS `compras_por_proveedor_y_pelicula`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `compras_por_proveedor_y_pelicula` AS SELECT 
 1 AS `nombre_proveedor`,
 1 AS `titulo`,
 1 AS `cantidad`,
 1 AS `precio_unitario`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `detalles_compras_proveedores`
--

DROP TABLE IF EXISTS `detalles_compras_proveedores`;
/*!50001 DROP VIEW IF EXISTS `detalles_compras_proveedores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detalles_compras_proveedores` AS SELECT 
 1 AS `fecha`,
 1 AS `metodo_pago`,
 1 AS `nombre_proveedor`,
 1 AS `titulo`,
 1 AS `cantidad`,
 1 AS `precio_unitario`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `info_clientes`
--

DROP TABLE IF EXISTS `info_clientes`;
/*!50001 DROP VIEW IF EXISTS `info_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_clientes` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `direccion`,
 1 AS `celular`,
 1 AS `correo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ventas_por_cliente_y_pelicula`
--

DROP TABLE IF EXISTS `ventas_por_cliente_y_pelicula`;
/*!50001 DROP VIEW IF EXISTS `ventas_por_cliente_y_pelicula`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_por_cliente_y_pelicula` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `titulo`,
 1 AS `cantidad`,
 1 AS `precio_unitario`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ventas_por_vendedor`
--

DROP TABLE IF EXISTS `ventas_por_vendedor`;
/*!50001 DROP VIEW IF EXISTS `ventas_por_vendedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_por_vendedor` AS SELECT 
 1 AS `nombre_vendedor`,
 1 AS `titulo`,
 1 AS `precio_unitario`,
 1 AS `total`,
 1 AS `cantidad_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `catalogo_peliculas`
--

/*!50001 DROP VIEW IF EXISTS `catalogo_peliculas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `catalogo_peliculas` AS select `Peliculas`.`titulo` AS `titulo`,`Peliculas`.`anio` AS `anio`,`Peliculas`.`precio` AS `precio` from `Peliculas` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `compras_por_proveedor_y_pelicula`
--

/*!50001 DROP VIEW IF EXISTS `compras_por_proveedor_y_pelicula`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `compras_por_proveedor_y_pelicula` AS select `pr`.`nombre` AS `nombre_proveedor`,`p`.`titulo` AS `titulo`,`dcp`.`cantidad` AS `cantidad`,`dcp`.`precio_unitario` AS `precio_unitario`,(`dcp`.`cantidad` * `dcp`.`precio_unitario`) AS `total` from (((`Proveedores` `pr` join `Compra_Proveedores` `cp` on((`pr`.`id_proveedor` = `cp`.`id_proveedor`))) join `Detalles_Compra_Proveedores` `dcp` on((`cp`.`id_transaccion` = `dcp`.`id_transaccion`))) join `Peliculas` `p` on((`dcp`.`id_pelicula` = `p`.`id_pelicula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `detalles_compras_proveedores`
--

/*!50001 DROP VIEW IF EXISTS `detalles_compras_proveedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detalles_compras_proveedores` AS select `cp`.`fecha` AS `fecha`,`cp`.`metodo_pago` AS `metodo_pago`,`pr`.`nombre` AS `nombre_proveedor`,`pel`.`titulo` AS `titulo`,`dcp`.`cantidad` AS `cantidad`,`dcp`.`precio_unitario` AS `precio_unitario`,(`dcp`.`cantidad` * `dcp`.`precio_unitario`) AS `total` from (((`Compra_Proveedores` `cp` join `Proveedores` `pr` on((`cp`.`id_proveedor` = `pr`.`id_proveedor`))) join `Detalles_Compra_Proveedores` `dcp` on((`cp`.`id_transaccion` = `dcp`.`id_transaccion`))) join `Peliculas` `pel` on((`dcp`.`id_pelicula` = `pel`.`id_pelicula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_clientes`
--

/*!50001 DROP VIEW IF EXISTS `info_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_clientes` AS select `Clientes`.`nombre` AS `nombre`,`Clientes`.`apellido` AS `apellido`,`Clientes`.`direccion` AS `direccion`,`Clientes`.`celular` AS `celular`,`Clientes`.`correo` AS `correo` from `Clientes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventas_por_cliente_y_pelicula`
--

/*!50001 DROP VIEW IF EXISTS `ventas_por_cliente_y_pelicula`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_por_cliente_y_pelicula` AS select `c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`p`.`titulo` AS `titulo`,`dt`.`cantidad` AS `cantidad`,`dt`.`precio_unitario` AS `precio_unitario`,(`dt`.`cantidad` * `dt`.`precio_unitario`) AS `total` from (((`Clientes` `c` join `Transacciones` `t` on((`c`.`id_cliente` = `t`.`id_cliente`))) join `Detalles_Transaccion` `dt` on((`t`.`id_transaccion` = `dt`.`id_transaccion`))) join `Peliculas` `p` on((`dt`.`id_pelicula` = `p`.`id_pelicula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventas_por_vendedor`
--

/*!50001 DROP VIEW IF EXISTS `ventas_por_vendedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_por_vendedor` AS select `emp`.`nombre` AS `nombre_vendedor`,`p`.`titulo` AS `titulo`,`dt`.`precio_unitario` AS `precio_unitario`,(`dt`.`cantidad` * `dt`.`precio_unitario`) AS `total`,(select count(0) from `Detalles_Transaccion` `dt2` where (`dt2`.`id_vendedor` = `emp`.`id_vendedor`)) AS `cantidad_ventas` from ((`Empleados` `emp` join `Detalles_Transaccion` `dt` on((`emp`.`id_vendedor` = `dt`.`id_vendedor`))) join `Peliculas` `p` on((`dt`.`id_pelicula` = `p`.`id_pelicula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 23:49:56
