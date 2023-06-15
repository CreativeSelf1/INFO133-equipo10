-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: informacion_territorial
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.12-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `comuna`
--

DROP TABLE IF EXISTS `comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comuna` (
  `nombre_comuna` varchar(100) NOT NULL,
  `num_habitantes` int(11) DEFAULT NULL,
  `superficie` decimal(10,2) DEFAULT NULL,
  `alcalde` varchar(100) DEFAULT NULL,
  `nombre_region` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nombre_comuna`),
  KEY `FK_nombre_region` (`nombre_region`),
  CONSTRAINT `comuna_ibfk_1` FOREIGN KEY (`nombre_region`) REFERENCES `region` (`nombre_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comuna`
--

LOCK TABLES `comuna` WRITE;
/*!40000 ALTER TABLE `comuna` DISABLE KEYS */;
/*!40000 ALTER TABLE `comuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educacion`
--

DROP TABLE IF EXISTS `educacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educacion` (
  `ID_educacion` int(11) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `estudiantes` int(11) DEFAULT NULL,
  `nombre_comuna` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_educacion`),
  KEY `FK_ID_comuna` (`nombre_comuna`),
  CONSTRAINT `educacion_ibfk_1` FOREIGN KEY (`nombre_comuna`) REFERENCES `comuna` (`nombre_comuna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educacion`
--

LOCK TABLES `educacion` WRITE;
/*!40000 ALTER TABLE `educacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `educacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entretencion`
--

DROP TABLE IF EXISTS `entretencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entretencion` (
  `ID_entretencion` int(11) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `nombre_comuna` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_entretencion`),
  KEY `FK_ID_comuna` (`nombre_comuna`),
  CONSTRAINT `entretencion_ibfk_1` FOREIGN KEY (`nombre_comuna`) REFERENCES `comuna` (`nombre_comuna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entretencion`
--

LOCK TABLES `entretencion` WRITE;
/*!40000 ALTER TABLE `entretencion` DISABLE KEYS */;
/*!40000 ALTER TABLE `entretencion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `nombre_pais` varchar(100) NOT NULL,
  `presidente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nombre_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `nombre_region` varchar(100) NOT NULL,
  `poblacion_regional` int(11) DEFAULT NULL,
  `gobernador` varchar(100) DEFAULT NULL,
  `nombre_pais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nombre_region`),
  KEY `FK_nombre_pais` (`nombre_pais`),
  CONSTRAINT `region_ibfk_1` FOREIGN KEY (`nombre_pais`) REFERENCES `pais` (`nombre_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajo`
--

DROP TABLE IF EXISTS `trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajo` (
  `ID_trabajo` int(11) NOT NULL,
  `personas_en_edad_trabajar` int(11) DEFAULT NULL,
  `hombres_edad_trabajar` int(11) DEFAULT NULL,
  `muejeres_edad_trabajar` int(11) DEFAULT NULL,
  `nombre_comuna` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_trabajo`),
  KEY `FK_ID_comuna` (`nombre_comuna`),
  CONSTRAINT `trabajo_ibfk_1` FOREIGN KEY (`nombre_comuna`) REFERENCES `comuna` (`nombre_comuna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajo`
--

LOCK TABLES `trabajo` WRITE;
/*!40000 ALTER TABLE `trabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporte`
--

DROP TABLE IF EXISTS `transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporte` (
  `ID_transporte` int(11) NOT NULL,
  `viajes_diarios` int(11) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `nombre_comuna` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_transporte`),
  KEY `FK_ID_comuna` (`nombre_comuna`),
  CONSTRAINT `transporte_ibfk_1` FOREIGN KEY (`nombre_comuna`) REFERENCES `comuna` (`nombre_comuna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporte`
--

LOCK TABLES `transporte` WRITE;
/*!40000 ALTER TABLE `transporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'informacion_territorial'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-15 18:17:14
