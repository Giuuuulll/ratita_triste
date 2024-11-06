-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `autorid` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `fechnacautor` varchar(45) NOT NULL,
  `nacionalidad_autor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`autorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `categoriaid` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `libros_libroid` int NOT NULL,
  PRIMARY KEY (`categoriaid`),
  KEY `fk_categoria_libros1_idx` (`libros_libroid`),
  CONSTRAINT `fk_categoria_libros1` FOREIGN KEY (`libros_libroid`) REFERENCES `libros` (`libroid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historialprestamo`
--

DROP TABLE IF EXISTS `historialprestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historialprestamo` (
  `historialprestamoid` int NOT NULL,
  `comentario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`historialprestamoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `libroid` int NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `añopublicacion` varchar(45) DEFAULT NULL,
  `autor_autorid` int NOT NULL,
  PRIMARY KEY (`libroid`),
  KEY `fk_libros_autor_idx` (`autor_autorid`),
  CONSTRAINT `fk_libros_autor` FOREIGN KEY (`autor_autorid`) REFERENCES `autor` (`autorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `librosautores`
--

DROP TABLE IF EXISTS `librosautores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librosautores` (
  `libroautroesid` int NOT NULL,
  PRIMARY KEY (`libroautroesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `librosautores_has_libros`
--

DROP TABLE IF EXISTS `librosautores_has_libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librosautores_has_libros` (
  `librosautores_libroautroesid` int NOT NULL,
  `libros_libroid` int NOT NULL,
  PRIMARY KEY (`librosautores_libroautroesid`,`libros_libroid`),
  KEY `fk_librosautores_has_libros_libros1_idx` (`libros_libroid`),
  KEY `fk_librosautores_has_libros_librosautores1_idx` (`librosautores_libroautroesid`),
  CONSTRAINT `fk_librosautores_has_libros_libros1` FOREIGN KEY (`libros_libroid`) REFERENCES `libros` (`libroid`),
  CONSTRAINT `fk_librosautores_has_libros_librosautores1` FOREIGN KEY (`librosautores_libroautroesid`) REFERENCES `librosautores` (`libroautroesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multas`
--

DROP TABLE IF EXISTS `multas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multas` (
  `multasid` int NOT NULL,
  `monto` varchar(45) DEFAULT NULL,
  `motivo` varchar(45) DEFAULT NULL,
  `fechamulta` varchar(45) DEFAULT NULL,
  `pagada` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`multasid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `prestamoid` int NOT NULL,
  `fechaprestamo` varchar(45) DEFAULT NULL,
  `devolver` varchar(45) DEFAULT NULL,
  `historialprestamo_historialprestamoid` int NOT NULL,
  `libros_libroid` int NOT NULL,
  PRIMARY KEY (`prestamoid`),
  KEY `fk_prestamo_historialprestamo1_idx` (`historialprestamo_historialprestamoid`),
  KEY `fk_prestamo_libros1_idx` (`libros_libroid`),
  CONSTRAINT `fk_prestamo_historialprestamo1` FOREIGN KEY (`historialprestamo_historialprestamoid`) REFERENCES `historialprestamo` (`historialprestamoid`),
  CONSTRAINT `fk_prestamo_libros1` FOREIGN KEY (`libros_libroid`) REFERENCES `libros` (`libroid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `reversaid` int NOT NULL,
  `fechareserva` varchar(45) DEFAULT NULL,
  `reservascol` varchar(45) DEFAULT NULL,
  `libros_libroid` int NOT NULL,
  PRIMARY KEY (`reversaid`,`libros_libroid`),
  KEY `fk_reservas_libros1_idx` (`libros_libroid`),
  CONSTRAINT `fk_reservas_libros1` FOREIGN KEY (`libros_libroid`) REFERENCES `libros` (`libroid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuarioid` int NOT NULL,
  `nombreusu` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `prestamo_prestamoid` int NOT NULL,
  `multas_multasid` int NOT NULL,
  `reservas_reversaid` int NOT NULL,
  PRIMARY KEY (`usuarioid`),
  KEY `fk_usuario_prestamo1_idx` (`prestamo_prestamoid`),
  KEY `fk_usuario_multas1_idx` (`multas_multasid`),
  KEY `fk_usuario_reservas1_idx` (`reservas_reversaid`),
  CONSTRAINT `fk_usuario_multas1` FOREIGN KEY (`multas_multasid`) REFERENCES `multas` (`multasid`),
  CONSTRAINT `fk_usuario_prestamo1` FOREIGN KEY (`prestamo_prestamoid`) REFERENCES `prestamo` (`prestamoid`),
  CONSTRAINT `fk_usuario_reservas1` FOREIGN KEY (`reservas_reversaid`) REFERENCES `reservas` (`reversaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-04 12:01:31
