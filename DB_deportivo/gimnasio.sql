-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: gimnasio
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actividad` (
  `idACTIVIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `duracion` varchar(45) NOT NULL,
  `hora de inicio` varchar(45) NOT NULL,
  `hora de termino` varchar(45) NOT NULL,
  `dia` date NOT NULL,
  `nivel` varchar(45) NOT NULL,
  PRIMARY KEY (`idACTIVIDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `idADMINISTRADOR` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `SUCURSAL_idSUCURSAL` int(11) NOT NULL,
  `direc` varchar(100) NOT NULL,
  PRIMARY KEY (`idADMINISTRADOR`,`SUCURSAL_idSUCURSAL`),
  KEY `fk_ADMINISTRADOR_SUCURSAL1_idx` (`SUCURSAL_idSUCURSAL`),
  CONSTRAINT `fk_ADMINISTRADOR_SUCURSAL1` FOREIGN KEY (`SUCURSAL_idSUCURSAL`) REFERENCES `sucursal` (`idSUCURSAL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `idAREA` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ancho` varchar(45) NOT NULL,
  `largo` varchar(45) NOT NULL,
  `alto` varchar(45) NOT NULL,
  PRIMARY KEY (`idAREA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'hujnknki','que pedo we','nikubn','ihbh','ibhibi'),(2,'hujnknki','que pedo we','nikubn','ihbh','ibhibi');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_has_actividad`
--

DROP TABLE IF EXISTS `area_has_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_has_actividad` (
  `AREA_idAREA` int(11) NOT NULL,
  `ACTIVIDAD_idACTIVIDAD` int(11) NOT NULL,
  PRIMARY KEY (`AREA_idAREA`,`ACTIVIDAD_idACTIVIDAD`),
  KEY `fk_AREA_has_ACTIVIDAD_ACTIVIDAD1_idx` (`ACTIVIDAD_idACTIVIDAD`),
  KEY `fk_AREA_has_ACTIVIDAD_AREA1_idx` (`AREA_idAREA`),
  CONSTRAINT `fk_AREA_has_ACTIVIDAD_ACTIVIDAD1` FOREIGN KEY (`ACTIVIDAD_idACTIVIDAD`) REFERENCES `actividad` (`idACTIVIDAD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_AREA_has_ACTIVIDAD_AREA1` FOREIGN KEY (`AREA_idAREA`) REFERENCES `area` (`idAREA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_has_actividad`
--

LOCK TABLES `area_has_actividad` WRITE;
/*!40000 ALTER TABLE `area_has_actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_has_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_has_curso`
--

DROP TABLE IF EXISTS `area_has_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_has_curso` (
  `AREA_idAREA` int(11) NOT NULL,
  `CURSO_idCURSO` int(11) NOT NULL,
  PRIMARY KEY (`AREA_idAREA`,`CURSO_idCURSO`),
  KEY `fk_AREA_has_CURSO_CURSO1_idx` (`CURSO_idCURSO`),
  KEY `fk_AREA_has_CURSO_AREA1_idx` (`AREA_idAREA`),
  CONSTRAINT `fk_AREA_has_CURSO_AREA1` FOREIGN KEY (`AREA_idAREA`) REFERENCES `area` (`idAREA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_AREA_has_CURSO_CURSO1` FOREIGN KEY (`CURSO_idCURSO`) REFERENCES `curso` (`idCURSO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_has_curso`
--

LOCK TABLES `area_has_curso` WRITE;
/*!40000 ALTER TABLE `area_has_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_has_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `curp` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `USUARIO_FINAL_idUSUARIO_FINAL` int(11) NOT NULL,
  `MEMBRESIA_idMEMBRESIA` int(11) NOT NULL,
  PRIMARY KEY (`idCLIENTE`,`USUARIO_FINAL_idUSUARIO_FINAL`,`MEMBRESIA_idMEMBRESIA`),
  KEY `fk_CLIENTE_USUARIO_FINAL1_idx` (`USUARIO_FINAL_idUSUARIO_FINAL`),
  KEY `fk_CLIENTE_MEMBRESIA1_idx` (`MEMBRESIA_idMEMBRESIA`),
  CONSTRAINT `fk_CLIENTE_MEMBRESIA1` FOREIGN KEY (`MEMBRESIA_idMEMBRESIA`) REFERENCES `membresia` (`idMEMBRESIA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENTE_USUARIO_FINAL1` FOREIGN KEY (`USUARIO_FINAL_idUSUARIO_FINAL`) REFERENCES `usuario_final` (`idUSUARIO_FINAL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'jijiji','Persona FÃ­sica','nininin','inini@huj.ki',NULL,1,2);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `idCURSO` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `duracion` varchar(45) NOT NULL,
  `inicio` date NOT NULL,
  `termino` date NOT NULL,
  `nivel` varchar(45) NOT NULL,
  PRIMARY KEY (`idCURSO`),
  UNIQUE KEY `idCURSO_UNIQUE` (`idCURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `idINSTRUCTOR` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `disiplina` varchar(45) NOT NULL,
  `curp` varchar(45) NOT NULL,
  `nss` varchar(45) NOT NULL,
  PRIMARY KEY (`idINSTRUCTOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_has_actividad`
--

DROP TABLE IF EXISTS `instructor_has_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_has_actividad` (
  `INSTRUCTOR_idINSTRUCTOR` int(11) NOT NULL,
  `ACTIVIDAD_idACTIVIDAD` int(11) NOT NULL,
  PRIMARY KEY (`INSTRUCTOR_idINSTRUCTOR`,`ACTIVIDAD_idACTIVIDAD`),
  KEY `fk_INSTRUCTOR_has_ACTIVIDAD_ACTIVIDAD1_idx` (`ACTIVIDAD_idACTIVIDAD`),
  KEY `fk_INSTRUCTOR_has_ACTIVIDAD_INSTRUCTOR1_idx` (`INSTRUCTOR_idINSTRUCTOR`),
  CONSTRAINT `fk_INSTRUCTOR_has_ACTIVIDAD_ACTIVIDAD1` FOREIGN KEY (`ACTIVIDAD_idACTIVIDAD`) REFERENCES `actividad` (`idACTIVIDAD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_INSTRUCTOR_has_ACTIVIDAD_INSTRUCTOR1` FOREIGN KEY (`INSTRUCTOR_idINSTRUCTOR`) REFERENCES `instructor` (`idINSTRUCTOR`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_has_actividad`
--

LOCK TABLES `instructor_has_actividad` WRITE;
/*!40000 ALTER TABLE `instructor_has_actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor_has_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_has_curso`
--

DROP TABLE IF EXISTS `instructor_has_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_has_curso` (
  `INSTRUCTOR_idINSTRUCTOR` int(11) NOT NULL,
  `CURSO_idCURSO` int(11) NOT NULL,
  PRIMARY KEY (`INSTRUCTOR_idINSTRUCTOR`,`CURSO_idCURSO`),
  KEY `fk_INSTRUCTOR_has_CURSO_CURSO1_idx` (`CURSO_idCURSO`),
  KEY `fk_INSTRUCTOR_has_CURSO_INSTRUCTOR1_idx` (`INSTRUCTOR_idINSTRUCTOR`),
  CONSTRAINT `fk_INSTRUCTOR_has_CURSO_CURSO1` FOREIGN KEY (`CURSO_idCURSO`) REFERENCES `curso` (`idCURSO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_INSTRUCTOR_has_CURSO_INSTRUCTOR1` FOREIGN KEY (`INSTRUCTOR_idINSTRUCTOR`) REFERENCES `instructor` (`idINSTRUCTOR`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_has_curso`
--

LOCK TABLES `instructor_has_curso` WRITE;
/*!40000 ALTER TABLE `instructor_has_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor_has_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membresia`
--

DROP TABLE IF EXISTS `membresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membresia` (
  `idMEMBRESIA` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_registro` date DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `servicios` varchar(45) DEFAULT NULL,
  `caducidad` date DEFAULT NULL,
  PRIMARY KEY (`idMEMBRESIA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membresia`
--

LOCK TABLES `membresia` WRITE;
/*!40000 ALTER TABLE `membresia` DISABLE KEYS */;
INSERT INTO `membresia` VALUES (2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `membresia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membresia_has_servicio`
--

DROP TABLE IF EXISTS `membresia_has_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membresia_has_servicio` (
  `MEMBRESIA_idMEMBRESIA` int(11) NOT NULL,
  `SERVICIO_idSERVICIO` int(11) NOT NULL,
  PRIMARY KEY (`MEMBRESIA_idMEMBRESIA`,`SERVICIO_idSERVICIO`),
  KEY `fk_MEMBRESIA_has_SERVICIO_SERVICIO1_idx` (`SERVICIO_idSERVICIO`),
  KEY `fk_MEMBRESIA_has_SERVICIO_MEMBRESIA1_idx` (`MEMBRESIA_idMEMBRESIA`),
  CONSTRAINT `fk_MEMBRESIA_has_SERVICIO_MEMBRESIA1` FOREIGN KEY (`MEMBRESIA_idMEMBRESIA`) REFERENCES `membresia` (`idMEMBRESIA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MEMBRESIA_has_SERVICIO_SERVICIO1` FOREIGN KEY (`SERVICIO_idSERVICIO`) REFERENCES `servicio` (`idSERVICIO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membresia_has_servicio`
--

LOCK TABLES `membresia_has_servicio` WRITE;
/*!40000 ALTER TABLE `membresia_has_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `membresia_has_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `idSERVICIO` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idSERVICIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal` (
  `idSUCURSAL` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `SUCURSALcol` varchar(10) DEFAULT NULL,
  `calle` varchar(60) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `Delegacion` varchar(50) NOT NULL,
  `CodePos` int(6) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `mail` varchar(80) NOT NULL,
  PRIMARY KEY (`idSUCURSAL`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'On The Run',NULL,'Av siempre viva','A momentary lapse of reason','Ciudadano del mundo',1984,'Ciudad de Mexico','10 800 9000','nile@song.com'),(5,'Kilamangiro',NULL,'Lokos por  el ritmo','Shine on your crazy diamond','qwerty',8172,'Aguascalientes','18161','jiuh@mosm.com'),(6,'Orgasmatron',NULL,'Sepultura','Refuse','Satanico',19872,'Colima','190178178','dead@sec.com'),(8,'Velvet underground',NULL,'Niko','lou reed','warhol',9080,'Aguascalientes','987','kikiki@ko.mon'),(10,'LOKO',NULL,'koki','kij','ionoiu',8989,'Aguascalientes','7678678','uhuh@mikm.lo'),(11,'JUSTINO BITLE',NULL,'zrxdtfcygvbhjnkm','tcymbhujnoko','tcyvgbuiojimkp',6876,'Aguascalientes','5675756','gygt@lol.ko');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal_has_area`
--

DROP TABLE IF EXISTS `sucursal_has_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal_has_area` (
  `SUCURSAL_idSUCURSAL` int(11) NOT NULL,
  `AREA_idAREA` int(11) NOT NULL,
  PRIMARY KEY (`SUCURSAL_idSUCURSAL`,`AREA_idAREA`),
  KEY `fk_SUCURSAL_has_AREA_AREA1_idx` (`AREA_idAREA`),
  KEY `fk_SUCURSAL_has_AREA_SUCURSAL_idx` (`SUCURSAL_idSUCURSAL`),
  CONSTRAINT `fk_SUCURSAL_has_AREA_AREA1` FOREIGN KEY (`AREA_idAREA`) REFERENCES `area` (`idAREA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SUCURSAL_has_AREA_SUCURSAL` FOREIGN KEY (`SUCURSAL_idSUCURSAL`) REFERENCES `sucursal` (`idSUCURSAL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal_has_area`
--

LOCK TABLES `sucursal_has_area` WRITE;
/*!40000 ALTER TABLE `sucursal_has_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursal_has_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal_has_cliente`
--

DROP TABLE IF EXISTS `sucursal_has_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal_has_cliente` (
  `SUCURSAL_idSUCURSAL` int(11) NOT NULL,
  `CLIENTE_idCLIENTE` int(11) NOT NULL,
  PRIMARY KEY (`SUCURSAL_idSUCURSAL`,`CLIENTE_idCLIENTE`),
  KEY `fk_SUCURSAL_has_CLIENTE_CLIENTE1_idx` (`CLIENTE_idCLIENTE`),
  KEY `fk_SUCURSAL_has_CLIENTE_SUCURSAL1_idx` (`SUCURSAL_idSUCURSAL`),
  CONSTRAINT `fk_SUCURSAL_has_CLIENTE_CLIENTE1` FOREIGN KEY (`CLIENTE_idCLIENTE`) REFERENCES `cliente` (`idCLIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SUCURSAL_has_CLIENTE_SUCURSAL1` FOREIGN KEY (`SUCURSAL_idSUCURSAL`) REFERENCES `sucursal` (`idSUCURSAL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal_has_cliente`
--

LOCK TABLES `sucursal_has_cliente` WRITE;
/*!40000 ALTER TABLE `sucursal_has_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursal_has_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal_has_instructor`
--

DROP TABLE IF EXISTS `sucursal_has_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal_has_instructor` (
  `SUCURSAL_idSUCURSAL` int(11) NOT NULL,
  `INSTRUCTOR_idINSTRUCTOR` int(11) NOT NULL,
  PRIMARY KEY (`SUCURSAL_idSUCURSAL`,`INSTRUCTOR_idINSTRUCTOR`),
  KEY `fk_SUCURSAL_has_INSTRUCTOR_INSTRUCTOR1_idx` (`INSTRUCTOR_idINSTRUCTOR`),
  KEY `fk_SUCURSAL_has_INSTRUCTOR_SUCURSAL1_idx` (`SUCURSAL_idSUCURSAL`),
  CONSTRAINT `fk_SUCURSAL_has_INSTRUCTOR_INSTRUCTOR1` FOREIGN KEY (`INSTRUCTOR_idINSTRUCTOR`) REFERENCES `instructor` (`idINSTRUCTOR`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SUCURSAL_has_INSTRUCTOR_SUCURSAL1` FOREIGN KEY (`SUCURSAL_idSUCURSAL`) REFERENCES `sucursal` (`idSUCURSAL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal_has_instructor`
--

LOCK TABLES `sucursal_has_instructor` WRITE;
/*!40000 ALTER TABLE `sucursal_has_instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursal_has_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_final`
--

DROP TABLE IF EXISTS `usuario_final`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_final` (
  `idUSUARIO_FINAL` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  PRIMARY KEY (`idUSUARIO_FINAL`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_final`
--

LOCK TABLES `usuario_final` WRITE;
/*!40000 ALTER TABLE `usuario_final` DISABLE KEYS */;
INSERT INTO `usuario_final` VALUES (1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuario_final` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-21  1:09:16
