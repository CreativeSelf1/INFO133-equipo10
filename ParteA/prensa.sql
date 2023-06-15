-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: medios_prensa
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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `url_categoria` varchar(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `XPATH` varchar(255) DEFAULT NULL,
  `nombre_prensa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`url_categoria`),
  KEY `FK_nombre_medioprensa` (`nombre_prensa`),
  CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`nombre_prensa`) REFERENCES `medios_de_prensa` (`nombre_prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fundadores`
--

DROP TABLE IF EXISTS `fundadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fundadores` (
  `ID_fundador` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `nombre_prensa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_fundador`),
  KEY `FK_nombre_medioprensa` (`nombre_prensa`),
  CONSTRAINT `fundadores_ibfk_1` FOREIGN KEY (`nombre_prensa`) REFERENCES `medios_de_prensa` (`nombre_prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fundadores`
--

LOCK TABLES `fundadores` WRITE;
/*!40000 ALTER TABLE `fundadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `fundadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medios_de_prensa`
--

DROP TABLE IF EXISTS `medios_de_prensa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medios_de_prensa` (
  `nombre_prensa` varchar(255) NOT NULL,
  `año_fundacion` int(11) DEFAULT NULL,
  `cobertura` varchar(255) DEFAULT NULL,
  `url_principal` varchar(255) DEFAULT NULL,
  `ID_ubicacion` int(11) DEFAULT NULL,
  `url_noticia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nombre_prensa`),
  KEY `FK_ID_ubicacion` (`ID_ubicacion`),
  KEY `FK_url_noticia` (`url_noticia`),
  CONSTRAINT `medios_de_prensa_ibfk_1` FOREIGN KEY (`ID_ubicacion`) REFERENCES `ubicacion` (`ID_ubicacion`),
  CONSTRAINT `medios_de_prensa_ibfk_2` FOREIGN KEY (`url_noticia`) REFERENCES `noticia` (`url_noticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios_de_prensa`
--

LOCK TABLES `medios_de_prensa` WRITE;
/*!40000 ALTER TABLE `medios_de_prensa` DISABLE KEYS */;
INSERT INTO `medios_de_prensa` VALUES ('austral',1990,'nacional','',NULL,NULL),('jupoter',1990,'nacional','https://www.youtube.com/',NULL,NULL),('merc',19090,'nacional','https://www.youtube.com/watch?v=95Qu2xavAsA',NULL,NULL),('mercurio',1990,'nacional','https://www.instagram.com/',NULL,NULL);
/*!40000 ALTER TABLE `medios_de_prensa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticia`
--

DROP TABLE IF EXISTS `noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticia` (
  `url_noticia` varchar(255) NOT NULL,
  `XPATH_fecha` varchar(255) DEFAULT NULL,
  `XPATH_titulo` varchar(255) DEFAULT NULL,
  `XPATH_contenido` varchar(255) DEFAULT NULL,
  `url_categoria` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`url_noticia`),
  KEY `FK_url_categoria` (`url_categoria`),
  CONSTRAINT `noticia_ibfk_1` FOREIGN KEY (`url_categoria`) REFERENCES `categoria` (`url_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia`
--

LOCK TABLES `noticia` WRITE;
/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redes_sociales`
--

DROP TABLE IF EXISTS `redes_sociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redes_sociales` (
  `cuenta` varchar(255) NOT NULL,
  `numero_seguidores` int(11) DEFAULT NULL,
  `fec_ultima_actualizacion` date DEFAULT NULL,
  `nombre_prensa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cuenta`),
  KEY `FK_nombre_medioprensa` (`nombre_prensa`),
  CONSTRAINT `redes_sociales_ibfk_1` FOREIGN KEY (`nombre_prensa`) REFERENCES `medios_de_prensa` (`nombre_prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redes_sociales`
--

LOCK TABLES `redes_sociales` WRITE;
/*!40000 ALTER TABLE `redes_sociales` DISABLE KEYS */;
/*!40000 ALTER TABLE `redes_sociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion` (
  `ID_ubicacion` int(11) NOT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `continente` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion`
--

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'medios_prensa'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-15 10:26:57
