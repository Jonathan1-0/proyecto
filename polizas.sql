-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Polizas
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `cancelacion`
--

DROP TABLE IF EXISTS `cancelacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelacion` (
  `idCancelacion` int(11) NOT NULL AUTO_INCREMENT,
  `idPoliza` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaSolicitud` date NOT NULL,
  `motivo` text NOT NULL,
  `montoDevolucion` decimal(10,2) DEFAULT NULL CHECK (`montoDevolucion` >= 0),
  `estatusDevolucion` varchar(50) NOT NULL,
  PRIMARY KEY (`idCancelacion`),
  UNIQUE KEY `idPoliza` (`idPoliza`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `cancelacion_ibfk_1` FOREIGN KEY (`idPoliza`) REFERENCES `poliza` (`idPoliza`) ON UPDATE CASCADE,
  CONSTRAINT `cancelacion_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancelacion`
--

LOCK TABLES `cancelacion` WRITE;
/*!40000 ALTER TABLE `cancelacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancelacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `rfc` varchar(15) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `medioContacto` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `rfc` (`rfc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobertura`
--

DROP TABLE IF EXISTS `cobertura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobertura` (
  `idCobertura` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`idCobertura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobertura`
--

LOCK TABLES `cobertura` WRITE;
/*!40000 ALTER TABLE `cobertura` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobertura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companiaseguros`
--

DROP TABLE IF EXISTS `companiaseguros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companiaseguros` (
  `idCompania` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `sitioValidacion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`idCompania`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companiaseguros`
--

LOCK TABLES `companiaseguros` WRITE;
/*!40000 ALTER TABLE `companiaseguros` DISABLE KEYS */;
/*!40000 ALTER TABLE `companiaseguros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizacion` (
  `idCotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `idVehiculo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idCompania` int(11) NOT NULL,
  `idTipo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `costo` decimal(10,2) DEFAULT NULL CHECK (`costo` > 0),
  `opcionPago` varchar(50) DEFAULT NULL CHECK (`opcionPago` in ('COMPLETO','PARCIALIDADES')),
  `estatus` varchar(50) NOT NULL,
  PRIMARY KEY (`idCotizacion`),
  KEY `idVehiculo` (`idVehiculo`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idCompania` (`idCompania`),
  KEY `idTipo` (`idTipo`),
  CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON UPDATE CASCADE,
  CONSTRAINT `cotizacion_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE,
  CONSTRAINT `cotizacion_ibfk_3` FOREIGN KEY (`idCompania`) REFERENCES `companiaseguros` (`idCompania`) ON UPDATE CASCADE,
  CONSTRAINT `cotizacion_ibfk_4` FOREIGN KEY (`idTipo`) REFERENCES `tipopoliza` (`idTipo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion`
--

LOCK TABLES `cotizacion` WRITE;
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallecobertura`
--

DROP TABLE IF EXISTS `detallecobertura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallecobertura` (
  `idPoliza` int(11) NOT NULL,
  `idCobertura` int(11) NOT NULL,
  `sumaAsegurada` decimal(12,2) DEFAULT NULL CHECK (`sumaAsegurada` > 0),
  `deducible` decimal(10,2) DEFAULT NULL CHECK (`deducible` >= 0),
  PRIMARY KEY (`idPoliza`,`idCobertura`),
  KEY `idCobertura` (`idCobertura`),
  CONSTRAINT `detallecobertura_ibfk_1` FOREIGN KEY (`idPoliza`) REFERENCES `poliza` (`idPoliza`) ON UPDATE CASCADE,
  CONSTRAINT `detallecobertura_ibfk_2` FOREIGN KEY (`idCobertura`) REFERENCES `cobertura` (`idCobertura`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallecobertura`
--

LOCK TABLES `detallecobertura` WRITE;
/*!40000 ALTER TABLE `detallecobertura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallecobertura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `idDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `fechaRecepcion` date NOT NULL,
  `rutaArchivo` varchar(255) NOT NULL,
  PRIMARY KEY (`idDocumento`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `documento_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMarca` varchar(100) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacion`
--

DROP TABLE IF EXISTS `notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificacion` (
  `idNotificacion` int(11) NOT NULL AUTO_INCREMENT,
  `idPoliza` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `medio` varchar(50) NOT NULL,
  `costoRenovacion` decimal(10,2) DEFAULT NULL CHECK (`costoRenovacion` >= 0),
  `realizada` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`idNotificacion`),
  KEY `idPoliza` (`idPoliza`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`idPoliza`) REFERENCES `poliza` (`idPoliza`) ON UPDATE CASCADE,
  CONSTRAINT `notificacion_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `idPago` int(11) NOT NULL AUTO_INCREMENT,
  `idPoliza` int(11) NOT NULL,
  `numeroParcialidad` int(11) NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL CHECK (`monto` > 0),
  `fechaLimite` date NOT NULL,
  `fechaPago` date DEFAULT NULL,
  `metodoPago` varchar(50) DEFAULT NULL,
  `comprobante` varchar(100) DEFAULT NULL,
  `estatus` varchar(50) NOT NULL,
  PRIMARY KEY (`idPago`),
  KEY `idPoliza` (`idPoliza`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idPoliza`) REFERENCES `poliza` (`idPoliza`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poliza`
--

DROP TABLE IF EXISTS `poliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poliza` (
  `idPoliza` int(11) NOT NULL AUTO_INCREMENT,
  `numeroPoliza` varchar(50) DEFAULT NULL,
  `idCotizacion` int(11) DEFAULT NULL,
  `idVehiculo` int(11) NOT NULL,
  `idCompania` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idTipo` int(11) NOT NULL,
  `idPolizaAnterior` int(11) DEFAULT NULL,
  `fechaEmision` date DEFAULT NULL,
  `fechaInicio` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `primaTotal` decimal(10,2) DEFAULT NULL CHECK (`primaTotal` > 0),
  `estatus` varchar(50) NOT NULL,
  PRIMARY KEY (`idPoliza`),
  UNIQUE KEY `numeroPoliza` (`numeroPoliza`),
  UNIQUE KEY `idCotizacion` (`idCotizacion`),
  KEY `idVehiculo` (`idVehiculo`),
  KEY `idCompania` (`idCompania`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idTipo` (`idTipo`),
  KEY `idPolizaAnterior` (`idPolizaAnterior`),
  CONSTRAINT `poliza_ibfk_1` FOREIGN KEY (`idCotizacion`) REFERENCES `cotizacion` (`idCotizacion`) ON UPDATE CASCADE,
  CONSTRAINT `poliza_ibfk_2` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON UPDATE CASCADE,
  CONSTRAINT `poliza_ibfk_3` FOREIGN KEY (`idCompania`) REFERENCES `companiaseguros` (`idCompania`) ON UPDATE CASCADE,
  CONSTRAINT `poliza_ibfk_4` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE,
  CONSTRAINT `poliza_ibfk_5` FOREIGN KEY (`idTipo`) REFERENCES `tipopoliza` (`idTipo`) ON UPDATE CASCADE,
  CONSTRAINT `poliza_ibfk_6` FOREIGN KEY (`idPolizaAnterior`) REFERENCES `poliza` (`idPoliza`) ON UPDATE CASCADE,
  CONSTRAINT `chk_fechas` CHECK (`fechaVencimiento` >= `fechaInicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poliza`
--

LOCK TABLES `poliza` WRITE;
/*!40000 ALTER TABLE `poliza` DISABLE KEYS */;
/*!40000 ALTER TABLE `poliza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submarca`
--

DROP TABLE IF EXISTS `submarca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submarca` (
  `idSubmarca` int(11) NOT NULL AUTO_INCREMENT,
  `idMarca` int(11) NOT NULL,
  `nombreSubmarca` varchar(100) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`idSubmarca`),
  KEY `idMarca` (`idMarca`),
  CONSTRAINT `submarca_ibfk_1` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submarca`
--

LOCK TABLES `submarca` WRITE;
/*!40000 ALTER TABLE `submarca` DISABLE KEYS */;
/*!40000 ALTER TABLE `submarca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopoliza`
--

DROP TABLE IF EXISTS `tipopoliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipopoliza` (
  `idTipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopoliza`
--

LOCK TABLES `tipopoliza` WRITE;
/*!40000 ALTER TABLE `tipopoliza` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipopoliza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `idVehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idSubmarca` int(11) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `tipoVehiculo` varchar(50) NOT NULL,
  `numeroSerie` varchar(50) NOT NULL,
  `placas` varchar(20) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`idVehiculo`),
  UNIQUE KEY `numeroSerie` (`numeroSerie`),
  KEY `idCliente` (`idCliente`),
  KEY `idSubmarca` (`idSubmarca`),
  CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  CONSTRAINT `vehiculo_ibfk_2` FOREIGN KEY (`idSubmarca`) REFERENCES `submarca` (`idSubmarca`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-17 14:17:06
