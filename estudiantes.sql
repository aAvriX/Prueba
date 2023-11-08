-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bdestudiantes
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbasignaturas`
--

DROP TABLE IF EXISTS `tbasignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbasignaturas` (
  `idAsignatura` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idAsignatura`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbasignaturas`
--

LOCK TABLES `tbasignaturas` WRITE;
/*!40000 ALTER TABLE `tbasignaturas` DISABLE KEYS */;
INSERT INTO `tbasignaturas` VALUES (1,'Matematica 2'),(2,'Matematica 3'),(3,'Matematica 4'),(4,'lenguaje 1'),(5,'lenguaje 2'),(6,'lenguaje 3');
/*!40000 ALTER TABLE `tbasignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcursos`
--

DROP TABLE IF EXISTS `tbcursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbcursos` (
  `idCurso` int(11) NOT NULL AUTO_INCREMENT,
  `NonmbreCurs` varchar(50) DEFAULT NULL,
  `idProfesor` int(11) DEFAULT NULL,
  `idAsignatura` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCurso`),
  KEY `idProfesor` (`idProfesor`),
  KEY `idAsignatura` (`idAsignatura`),
  CONSTRAINT `tbcursos_ibfk_1` FOREIGN KEY (`idProfesor`) REFERENCES `tbprofesores` (`idProfesor`),
  CONSTRAINT `tbcursos_ibfk_2` FOREIGN KEY (`idAsignatura`) REFERENCES `tbasignaturas` (`idAsignatura`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcursos`
--

LOCK TABLES `tbcursos` WRITE;
/*!40000 ALTER TABLE `tbcursos` DISABLE KEYS */;
INSERT INTO `tbcursos` VALUES (1,'MATEMATICA APLICADA',1,1),(2,'LENGUAJE',2,4),(3,'LENGUAJE',3,6);
/*!40000 ALTER TABLE `tbcursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbestudiantes`
--

DROP TABLE IF EXISTS `tbestudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbestudiantes` (
  `idEstudiante` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbestudiantes`
--

LOCK TABLES `tbestudiantes` WRITE;
/*!40000 ALTER TABLE `tbestudiantes` DISABLE KEYS */;
INSERT INTO `tbestudiantes` VALUES (1,'Nery','Zambrano'),(2,'Yakelin','Cruz'),(3,'Nelson','Poou'),(4,'David','Zambrano');
/*!40000 ALTER TABLE `tbestudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbinscripciones`
--

DROP TABLE IF EXISTS `tbinscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbinscripciones` (
  `idInscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `idEstudiante` int(11) DEFAULT NULL,
  `idCurso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInscripcion`),
  KEY `idEstudiante` (`idEstudiante`),
  KEY `idCurso` (`idCurso`),
  CONSTRAINT `tbinscripciones_ibfk_1` FOREIGN KEY (`idEstudiante`) REFERENCES `tbestudiantes` (`idEstudiante`),
  CONSTRAINT `tbinscripciones_ibfk_2` FOREIGN KEY (`idCurso`) REFERENCES `tbcursos` (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbinscripciones`
--

LOCK TABLES `tbinscripciones` WRITE;
/*!40000 ALTER TABLE `tbinscripciones` DISABLE KEYS */;
INSERT INTO `tbinscripciones` VALUES (1,1,1);
/*!40000 ALTER TABLE `tbinscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbnotas`
--

DROP TABLE IF EXISTS `tbnotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbnotas` (
  `NotaID` int(11) NOT NULL AUTO_INCREMENT,
  `idEstudiante` int(11) DEFAULT NULL,
  `idCurso` int(11) DEFAULT NULL,
  `Nota` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`NotaID`),
  KEY `idEstudiante` (`idEstudiante`),
  KEY `idCurso` (`idCurso`),
  CONSTRAINT `tbnotas_ibfk_1` FOREIGN KEY (`idEstudiante`) REFERENCES `tbestudiantes` (`idEstudiante`),
  CONSTRAINT `tbnotas_ibfk_2` FOREIGN KEY (`idCurso`) REFERENCES `tbcursos` (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbnotas`
--

LOCK TABLES `tbnotas` WRITE;
/*!40000 ALTER TABLE `tbnotas` DISABLE KEYS */;
INSERT INTO `tbnotas` VALUES (1,1,1,9.05),(2,2,2,6.05),(3,3,3,9.05),(4,1,3,10.00);
/*!40000 ALTER TABLE `tbnotas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_validar_nota
BEFORE INSERT ON tbnotas
FOR EACH ROW
BEGIN
    IF NEW.Nota < 0 OR NEW.Nota > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La nota debe estar en el rango de 0 a 10';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbprofesores`
--

DROP TABLE IF EXISTS `tbprofesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbprofesores` (
  `idProfesor` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idProfesor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbprofesores`
--

LOCK TABLES `tbprofesores` WRITE;
/*!40000 ALTER TABLE `tbprofesores` DISABLE KEYS */;
INSERT INTO `tbprofesores` VALUES (1,'Juan','Caballo'),(2,'Armando','Paredez'),(3,'Anacleto','Perez');
/*!40000 ALTER TABLE `tbprofesores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08 14:46:14
