-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: pruebaprensa
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
  KEY `FK_nombre_prensa` (`nombre_prensa`),
  CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`nombre_prensa`) REFERENCES `medios_de_prensa` (`nombre_prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('http://www.concepcionaldia.com/page/2/','Nacional','null','CONCEPCIÓN AL DÍA'),('http://www.tnpress.com.py/category/deportes/','Deportes','null','TNPRESS'),('http://www.tnpress.com.py/category/editorial/','Editorial','null','TNPRESS'),('http://www.tnpress.com.py/category/entretenimiento/','Entretenimiento','null','TNPRESS'),('http://www.tnpress.com.py/category/internacionales/','Internacional','null','TNPRESS'),('http://www.tnpress.com.py/category/judiciales/','Judicial','null','TNPRESS'),('http://www.tnpress.com.py/category/nacionales/','Nacional','null','TNPRESS'),('http://www.tnpress.com.py/category/policiales/','Policial','null','TNPRESS'),('http://www.tnpress.com.py/category/politica/','Politica','null','TNPRESS'),('http://www.tnpress.com.py/category/regionales/','Regional','null','TNPRESS'),('https://diariolajornada.com.py/category/policiales/','Policial','null','LA JORNADA'),('https://diariolajornada.com.py/category/politica/','Politica','null','LA JORNADA'),('https://diariolajornada.com.py/category/regionales/','Regional','null','LA JORNADA'),('https://digitalmisiones.com.py/category/deportes/page/6/','Deportes','null','DIGITAL MISIONES'),('https://digitalmisiones.com.py/category/mundo/page/2/','Internacional','null','DIGITAL MISIONES'),('https://digitalmisiones.com.py/category/politica/page/3/','Politica','null','DIGITAL MISIONES'),('https://independiente.com.py/actualidad/','Actualidad','null','EL INDEPENDIENTE'),('https://independiente.com.py/internacionales/','Internacional','nuñll','EL INDEPENDIENTE'),('https://independiente.com.py/opinion/','Opinion','null','EL INDEPENDIENTE'),('https://independiente.com.py/politica/','Politica','null','EL INDEPENDIENTE'),('https://itapuanoticias.tv/category/economia-2/page/2/','Economia','null','ITAPÚA EN NOTICIAS'),('https://itapuanoticias.tv/category/educacion/page/7/','Educacion','null','ITAPÚA EN NOTICIAS'),('https://itapuanoticias.tv/category/municipales/page/5/','Campo','null','ITAPÚA EN NOTICIAS'),('https://itapuanoticias.tv/category/nacionales/page/4/','Nacional','null','ITAPÚA EN NOTICIAS'),('https://itapuanoticias.tv/category/noticias/page/3/','Local','null','ITAPÚA EN NOTICIAS'),('https://itapuanoticias.tv/category/policiales/page/2/','Policial','null','ITAPÚA EN NOTICIAS'),('https://itapuanoticias.tv/category/salud/page/5/','Salud','null','ITAPÚA EN NOTICIAS'),('https://prensa5.com/categorias/deportes/page/3/','Deportes','null','Prensa5'),('https://prensa5.com/categorias/destacadas/locales/page/3/','Local','null','Prensa5'),('https://prensa5.com/categorias/entretenimiento/page/7/','Entretenimiento','null','Prensa5'),('https://prensa5.com/categorias/internacionales/page/10/','Internacional','null','Prensa5'),('https://prensa5.com/categorias/nacionales/page/6/','Nacional','null','Prensa5'),('https://prensa5.com/categorias/opinion/page/3/','Opinion','null','Prensa5'),('https://prensa5.com/categorias/politica/page/2/','Politica','null','Prensa5'),('https://prensa5.com/categorias/sociales/page/3/','Social','null','Prensa5'),('https://www.5dias.com.py/analisis-macro','Economia','null','5DIAS'),('https://www.5dias.com.py/editorial','Opinion','null','5DIAS'),('https://www.5dias.com.py/empresas','Negocios','null','5DIAS'),('https://www.abc.com.py/deportes/','Deportes','null','ABC Color'),('https://www.abc.com.py/economia/','Economia','null','ABC Color'),('https://www.abc.com.py/espectaculos/','Espectaculo','null','ABC Color'),('https://www.abc.com.py/internacionales/','Internacional','null','ABC Color'),('https://www.abc.com.py/nacionales/','Nacional','null','ABC Color'),('https://www.abc.com.py/policiales/','Policial','null','ABC Color'),('https://www.abc.com.py/politica/','Politica','null','ABC Color'),('https://www.adndigital.com.py/seccion/deportes/','Deportes','null','ADN Paraguayo'),('https://www.adndigital.com.py/seccion/judiciales/','Judicial','null','ADN Paraguayo'),('https://www.adndigital.com.py/seccion/mundo/','Internacional','null','ADN Paraguayo'),('https://www.adndigital.com.py/seccion/nacionales/','Nacional','null','ADN Paraguayo'),('https://www.adndigital.com.py/seccion/politica/','Politica','null','ADN Paraguayo'),('https://www.cdehot.com.py/noticias/ciudad-del-este?page=6','Local','null','CDHOT'),('https://www.cdehot.com.py/noticias/deportes?page=4','Deportes','null','CDHOT'),('https://www.cdehot.com.py/noticias/mundo?page=7','Internacional','null','CDHOT'),('https://www.cdehot.com.py/noticias/nacionales?page=3','Nacional','null','CDHOT'),('https://www.cdehot.com.py/noticias/policiales-y-judiciales?page=6','Policial','null','CDHOT'),('https://www.cdehot.com.py/noticias/politica?page=8','Politica','null','CDHOT'),('https://www.cronica.com.py/category/actualidad/','Actualidad','null','Cronica'),('https://www.cronica.com.py/category/deportes/','Deportes','null','Cronica'),('https://www.cronica.com.py/category/farandula/','Farandula','desconocida','Cronica'),('https://www.cronica.com.py/category/mundo/','Internacional','null','Cronica'),('https://www.elpoder.com.py/category/artes-espectaculos/page/9/','Espectaculo','null','EL PODER'),('https://www.elpoder.com.py/category/deportes/page/2/','Deportes','null','EL PODER'),('https://www.elpoder.com.py/category/economia/page/7/','Economia','null','EL PODER'),('https://www.elpoder.com.py/category/mundo/page/5/','Internacional','null','EL PODER'),('https://www.elpoder.com.py/category/nacionales/page/3/','Nacional','null','EL PODER'),('https://www.elpoder.com.py/category/opinion-y-analisis/','Opinion','null','EL PODER'),('https://www.elpoder.com.py/category/politica/page/4/','Politica','null','EL PODER'),('https://www.elpoder.com.py/category/tecnologia/','Tecnologia','null','EL PODER'),('https://www.hoy.com.py/deportes','Deportes','null','HOY'),('https://www.hoy.com.py/espectaculos','Espectaculo','null','HOY'),('https://www.hoy.com.py/nacionales','Nacional','null','HOY'),('https://www.hoy.com.py/negocios','Negocios','null','HOY'),('https://www.hoy.com.py/politica','Politica','null','HOY'),('https://www.laclave.com.py/category/altoparana/','Local','null','La clave'),('https://www.laclave.com.py/category/deportes/page/2/','Deportes','null','La clave'),('https://www.laclave.com.py/category/economia/page/5/','Economia','null','La clave'),('https://www.laclave.com.py/category/entretenimiento/page/2/','Entretenimiento','null','La clave'),('https://www.laclave.com.py/category/internacionales/page/2/','Internacional','null','La clave'),('https://www.laclave.com.py/category/paraguay/page/2/','Nacional','null','La clave'),('https://www.laclave.com.py/category/politica/page/4/','Politica','null','La clave'),('https://www.laclave.com.py/category/sucesos/','Sucesos','null','La clave'),('https://www.lanacion.com.py/category/editorial/','Editorial','null','La Nacion'),('https://www.lanacion.com.py/category/estilodevida/','Estilo de vida','null','La Nacion'),('https://www.lanacion.com.py/category/investigacion/','Investigacion','null','La Nacion'),('https://www.lanacion.com.py/category/mundo/','Mundo','null','La Nacion'),('https://www.lanacion.com.py/category/negocios/','Negocios','nuñll','La Nacion'),('https://www.lanacion.com.py/category/pais/','Pais','null','La Nacion'),('https://www.lanacion.com.py/category/politica/','Politica','null','La Nacion'),('https://www.masencarnacion.com/categoria/deportes','Deportes','null','MÁS ENCARNACIÓN'),('https://www.masencarnacion.com/categoria/mundo','Internacional','null','MÁS ENCARNACIÓN'),('https://www.masencarnacion.com/categoria/nacionales','Nacional','null','MÁS ENCARNACIÓN'),('https://www.masencarnacion.com/categoria/regionales','Regional','null','MÁS ENCARNACIÓN'),('https://www.popular.com.py/categoria/covid-19/','Coronavirus','null','Diario Popular'),('https://www.popular.com.py/categoria/deportes/','Deportes','null','Diario Popular'),('https://www.popular.com.py/categoria/el-mundo/','Internacional','null','Diario Popular'),('https://www.popular.com.py/categoria/farandula/','Farandula','null','Diario Popular'),('https://www.popular.com.py/categoria/historias/','Historias','null','Diario Popular'),('https://www.popular.com.py/categoria/noticias/','Noticias','null','Diario Popular'),('https://www.popular.com.py/categoria/politica/','Politica','null','Diario Popular'),('https://www.popular.com.py/categoria/virales/','Virales','null','Diario Popular'),('https://www.ultimahora.com/mundo','Internacional','undefined','ultimahora'),('https://www.ultimahora.com/nacionales','Nacional','undefined','ultimahora');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fundadores`
--

DROP TABLE IF EXISTS `fundadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fundadores` (
  `ID_fundador` varchar(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `nombre_prensa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_fundador`),
  KEY `FK_nombre_prensa` (`nombre_prensa`),
  CONSTRAINT `fundadores_ibfk_1` FOREIGN KEY (`nombre_prensa`) REFERENCES `medios_de_prensa` (`nombre_prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fundadores`
--

LOCK TABLES `fundadores` WRITE;
/*!40000 ALTER TABLE `fundadores` DISABLE KEYS */;
INSERT INTO `fundadores` VALUES ('01d89e49-11cf-466e-ad8f-a5d1ff73dcac','Aldo','Zuccolillo','ADN Paraguayo'),('0cf2ad5e-1e07-4fbc-87bc-f0dffc9e3f9a','Aldo','Zuccolillo','ABC Color'),('1aa1470a-5315-43d8-ba68-9fab09137afb','Isaac','Kostianovsky','ultimahora'),('200bc901-e051-4334-99d5-4bb1d838dda1','Osvaldo','Dominguez','La Nacion'),('236513a8-a1a5-4509-8445-7f4bbdefda00','desconocido','desconocido','HOY'),('4158ed54-b134-4373-ae6b-c2c7c9574bfe','Juan ','Wasmosy','Diario Popular'),('52b9cd24-6a14-49da-bfd0-34b0e2908b69','desconocido','desconocido','Cronica'),('54969e7e-6542-49b9-bbf0-c277a84a579b','desconocido','desconocido','MÁS ENCARNACIÓN'),('596cf56f-41cd-4522-9795-b6f6d4924d30','desconocido','desconocido','Prensa5'),('634e375c-1ca7-4eef-b986-47ae236acc2e','desconocido','desconocido','DIGITAL MISIONES'),('6762002f-b41c-4271-8649-323281458181','desconocido','desconocido','LA JORNADA'),('7a7a59c4-e607-4f32-8d68-5f16527ee164','desconocido','desconocido','CDHOT'),('88ae7edf-0f5c-4e0f-a4d6-a640b837ad5d','desconocido','desconocido','CONCEPCIÓN AL DÍA'),('88d61644-8863-482a-8a9d-813aa7c1a6f5','desconocido','desconocido','TNPRESS'),('946c6140-1cae-432a-960a-d9855807d9b4','desconocido','desconocido','La clave'),('a85c7445-d800-47b0-ab78-6c4cdae30c6d','desconocido','desconocido','EL PODER'),('bd230d7d-e194-4eb8-affd-c1172080e076','José','Espínola','5DIAS'),('d6584799-8bc7-4358-9f4c-464b1ccf6f36','desconocido','desconocido','EL INDEPENDIENTE'),('ec811586-9301-4792-a364-8c5a27d486b1','desconocido','desconocido','ITAPÚA EN NOTICIAS');
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
  `ID_ubicacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nombre_prensa`),
  KEY `FK_ID_ubicacion` (`ID_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios_de_prensa`
--

LOCK TABLES `medios_de_prensa` WRITE;
/*!40000 ALTER TABLE `medios_de_prensa` DISABLE KEYS */;
INSERT INTO `medios_de_prensa` VALUES ('5DIAS',1976,'Nacional,Internacional','https://www.5dias.com.py/','68bfe579-2325-4bc4-9cfc-2d21377b69c9'),('ABC Color',1967,'Nacional,Internacional','https://www.abc.com.py/','f378b8fa-35f9-4839-890f-6f3dc5c6cca7'),('ADN Paraguayo',NULL,'Nacional,Internacional','https://www.adndigital.com.py/','74b8dc1e-06db-4504-878e-f5bca5de399f'),('CDHOT',0,'Nacional,Internacional','https://www.cdehot.com.py/','89dc9b19-f945-46b1-adfd-97436bca8c0a'),('CONCEPCIÓN AL DÍA',NULL,'Nacional,Internacional','http://www.concepcionaldia.com/','49fd55c7-966c-4ac8-8bd8-c89f97d810b7'),('Cronica',NULL,'Nacional,Internacional','https://www.cronica.com.py/','1c965483-fed2-4a36-9f6d-a9cced41fca3'),('Diario Popular',1994,'Nacional,Internacional','https://www.popular.com.py/','13c1bcc7-f010-420c-b1d5-6e39eeb5ee3f'),('DIGITAL MISIONES',NULL,'Nacional,Internacional','https://digitalmisiones.com.py/','a508a1a5-f253-4c6c-bfa1-850eafed4790'),('EL INDEPENDIENTE',0,'Nacional,Internacional','https://independiente.com.py/','26415d56-a304-4c8c-848a-4742bc0e90d3'),('EL PODER',0,'Nacional,Internacional','https://www.elpoder.com.py/','6de844f3-28d2-42e9-977d-161d93e44ef2'),('HOY',1977,'Nacional,Internacional','https://www.hoy.com.py/','b106ef83-8874-482e-a700-49333d43dbd3'),('ITAPÚA EN NOTICIAS',NULL,'Nacional,Internacional','https://itapuanoticias.tv/','1447dec3-350b-428f-b70c-d861a39e7844'),('La clave',0,'Nacional,Internacional','https://www.laclave.com.py/','c7130fda-e00b-44dc-b569-d2924451150a'),('LA JORNADA',NULL,'Nacional,Internacional','https://diariolajornada.com.py/','fc10427a-3b6f-40ef-903a-c18aa53564eb'),('La Nacion',1995,'Nacional,Internacional','https://www.lanacion.com.py/','a4b6af07-5927-4b37-8ff0-5a9b2daff05c'),('MÁS ENCARNACIÓN',NULL,'Nacional,Internacional','https://www.masencarnacion.com/','01ae00a2-8256-4fb2-b798-6fae86c0c5c9'),('Prensa5',NULL,'Nacional,Internacional','https://prensa5.com/','f31dfd45-7f8b-41d9-a334-25dedbd9589b'),('TNPRESS',NULL,'Nacional,Internacional','http://www.tnpress.com.py/','52f81043-3915-4c03-949f-161836fef81d'),('ultimahora',1973,'Nacional,Internacional','https://www.ultimahora.com/','d51fa96b-97fc-4d8c-9b8d-d20b5797eefa');
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
  `nombre_prensa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`url_noticia`),
  KEY `FK_url_categoria` (`url_categoria`),
  KEY `FK_nombre_medioprensa` (`nombre_prensa`),
  CONSTRAINT `noticia_ibfk_1` FOREIGN KEY (`url_categoria`) REFERENCES `categoria` (`url_categoria`),
  CONSTRAINT `noticia_ibfk_2` FOREIGN KEY (`nombre_prensa`) REFERENCES `medios_de_prensa` (`nombre_prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia`
--

LOCK TABLES `noticia` WRITE;
/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
INSERT INTO `noticia` VALUES ('http://www.concepcionaldia.com/aleman-buscaba-asilo-en-la-embajada-de-eeuu/',NULL,NULL,NULL,'http://www.concepcionaldia.com/page/2/','CONCEPCIÓN AL DÍA'),('http://www.tnpress.com.py/2023/04/22/el-3-de-febrero-cae-de-visitante-por-minima-diferencia-en-la-intermedia/','null','null','null','http://www.tnpress.com.py/category/deportes/','TNPRESS'),('https://diariolajornada.com.py/2022/11/25/nuevos-aires-presentara-a-sus-postulantes-para-la-diputacion/','null','null','null','https://diariolajornada.com.py/category/politica/','LA JORNADA'),('https://digitalmisiones.com.py/condenan-por-corrupcion-a-6-anos-de-carcel-a-vicepresidenta-argentina-cristina-kirchner/','null','null','null','https://digitalmisiones.com.py/category/mundo/page/2/','DIGITAL MISIONES'),('https://independiente.com.py/imputan-por-tenencia-de-drogas-a-aleman-que-intento-ingresar-a-la-embajada-de-eeuu/','null','null','null','https://independiente.com.py/actualidad/','EL INDEPENDIENTE'),('https://itapuanoticias.tv/vecinos-los-filmaron-mientras-llevaban-objetos-hurtados-y-uno-termino-preso/','null','null','null','https://itapuanoticias.tv/category/policiales/page/2/','ITAPÚA EN NOTICIAS'),('https://prensa5.com/aprehenden-a-tres-simpatizantes-de-payo-cubas-en-coronel-oviedo/','null','null','null','https://prensa5.com/categorias/destacadas/locales/page/3/','Prensa5'),('https://www.5dias.com.py/analisis-macro/casi-10-mil-cheques-rechazados-en-abril-por-firmantes-inhabilitados','null','null','null','https://www.5dias.com.py/editorial','5DIAS'),('https://www.abc.com.py/internacionales/2023/06/22/rusia-dice-que-ucrania-reagrupa-sus-fuerzas-tras-16-dias-de-contraofensiva/','null',NULL,NULL,'https://www.abc.com.py/internacionales/','ABC Color'),('https://www.adndigital.com.py/la-busqueda-del-sumergible-desaparecido-cerca-del-titanic-entra-en-una-fase-critica/','null','null','null','https://www.adndigital.com.py/seccion/mundo/','ADN Paraguayo'),('https://www.cdehot.com.py/noticia/ciudad-del-este/en-dia-mundial-del-agua-lamentan-que-muchos-no-acceden-al-liquido','null','null','null','https://www.cdehot.com.py/noticias/ciudad-del-este?page=6','CDHOT'),('https://www.cronica.com.py/2023/06/14/un-pez-prehistorico-con-pinta-de-monstruo-fue-atrapado-establecio-record-mundial/','null','null','null','https://www.cronica.com.py/category/mundo/','Cronica'),('https://www.elpoder.com.py/politica/2023/02/18/%f0%9f%97%b3%ef%b8%8f-tsje-no-reporto-renuncias-de-chapas-presidenciales/','null','null','null','https://www.elpoder.com.py/category/politica/page/4/','EL PODER'),('https://www.hoy.com.py/nacionales/congreso-nacional-exhorta-a-eeuu-a-permitir-cirugia-de-napout','null','null','null','https://www.hoy.com.py/nacionales','HOY'),('https://www.laclave.com.py/2023/05/05/comercio-registra-un-repunte-del-15-al-20-pero-es-necesario-mas-incentivos/','null','null','null','https://www.laclave.com.py/category/economia/page/5/','La clave'),('https://www.lanacion.com.py/tendencias/2023/06/22/captan-misteriosa-luz-verde-en-jupiter/',NULL,'null','null','https://www.lanacion.com.py/category/investigacion/','La Nacion'),('https://www.masencarnacion.com/articulo/itapuense-pide-que-partido-inaugural-del-nacional-b-se-juegue-en-encarnacion','null','null','null','https://www.masencarnacion.com/categoria/deportes','MÁS ENCARNACIÓN'),('https://www.popular.com.py/2023/06/21/orgullo-nacional-patinadora-paraguaya-es-la-mejor-del-mundo/','null','null','null','https://www.popular.com.py/categoria/deportes/','Diario Popular'),('https://www.ultimahora.com/fiscalia-imputa-a-abogado-de-tio-rico','undefined','//div//h1','undefined','https://www.ultimahora.com/mundo','ultimahora');
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redes_sociales`
--

DROP TABLE IF EXISTS `redes_sociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redes_sociales` (
  `ID_cuenta` varchar(255) NOT NULL,
  `numero_seguidores` int(11) DEFAULT NULL,
  `aplicacion` varchar(255) DEFAULT NULL,
  `fec_ultima_actualizacion` date DEFAULT NULL,
  `nombre_prensa` varchar(255) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_cuenta`),
  KEY `FK_nombre_prensa` (`nombre_prensa`),
  CONSTRAINT `redes_sociales_ibfk_1` FOREIGN KEY (`nombre_prensa`) REFERENCES `medios_de_prensa` (`nombre_prensa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redes_sociales`
--

LOCK TABLES `redes_sociales` WRITE;
/*!40000 ALTER TABLE `redes_sociales` DISABLE KEYS */;
INSERT INTO `redes_sociales` VALUES ('0b4c919c-a053-4cdd-b27f-bc2c024d89bb',8828,'twitter','2023-06-22','Cronica','OndaCronica'),('10ab1d33-edf5-47df-b59a-ef7071051f0d',162000,'instagram','2023-06-22','Diario Popular','diario.popularpy'),('16dbde74-6ae0-439a-b5c8-d1f3d8deb06c',46000,'facebook','2023-06-22','EL INDEPENDIENTE','elindependientepy'),('16f5388d-ba8b-4e8b-948f-eb36495ffbef',2367,'instagram','2023-06-22','Prensa5','prensa5digital'),('170ff3a4-2a4e-49b4-b1c9-1a29bff272c1',3870,'twitter','2023-06-22','CONCEPCIÓN AL DÍA','concepcionaldia'),('18a39de2-cdd5-4736-b318-f87510b63076',2257,'twitter','2023-06-22','TNPRESS','diariotn'),('1b3c5473-f54d-4e28-aea2-82266211b001',219000,'instagram','2023-06-22','La Nacion','lanacionpy'),('1b7ed434-b069-4706-b736-6f49c3110aee',26000,'facebook','2023-06-22','EL PODER','elpoderpy'),('1f46d8c5-1639-4d6c-9a23-6c48e56c4352',68900,'instagram','2023-06-22','5DIAS','@5diaspy'),('20597de2-279e-4bc7-98d4-56e637708b2a',31600,'twitter','2023-06-22','ADN Paraguayo','adn_paraguayo'),('20ed4fce-bcfd-411e-b3ba-4901c842e1ea',208000,'facebook','2023-06-22','Diario Popular','diariopopularoficial'),('226dfdbc-fdc5-4b38-9c64-234333f79c51',223000,'facebook','2023-06-22','MÁS ENCARNACIÓN','MasEncarnacion'),('231b09ed-5174-465f-bfab-ebd876f739e7',1300000,'twitter','2023-06-22','ABC Color','ABCDigital'),('33780bf9-c50e-41ef-89b7-16c26ec92d57',142000,'instagram','2023-06-22','Cronica','ondacronica'),('445fafda-1d6e-46e8-b79b-67195750acc3',640000,'facebook','2023-06-22','La Nacion','La Nacion'),('4565f637-16b9-4424-bd11-38ee4fc77bc3',1679,'twitter','2023-06-22','EL INDEPENDIENTE','elindepy'),('476c2817-1e64-40b6-bdd4-5f4a2837bfdd',82372,'twitter','2023-06-22','ITAPÚA EN NOTICIAS','ItapuaNoticias'),('629547ec-531f-4202-b10b-fd419f8f98d8',1400000,'facebook','2023-06-22','Cronica','ondacronica'),('632f8659-e804-4da7-9835-e9f8002871c1',170000,'facebook','2023-06-22','Prensa5','prensacinco'),('6c4ac4ce-108e-4726-a79f-1787be538a60',1638,'twitter','2023-06-22','Prensa5','prensacinco'),('6c9b8109-41a0-4e77-a76f-a2c99ca310f9',3720,'twitter','2023-06-22','EL PODER','elpoderpy'),('6e39c4cf-18b2-4581-a9fb-28797a428211',1939,'twitter','2023-06-22','DIGITAL MISIONES','DMisionesPy'),('6fb4c20d-8f8a-4c43-94e1-885c4c3e7360',155000,'facebook','2023-06-22','La clave','diariolaclavepy'),('703d24f4-e930-4af8-9bf5-83a6cb38b08b',973000,'instagram','2023-06-22','ABC Color','abcdigital'),('76582dda-9ad0-4360-a9b5-8625df1ae413',2200000,'facebook','2023-06-22','ABC Color','ABCdigital'),('8111e06e-4603-4e91-aa8f-a85ef3562e1f',70000,'facebook','2023-06-22','ADN Paraguayo','ADN DIGITAL'),('827e2650-bbbf-4ac4-8ea5-3b0b5cddf5aa',737000,'facebook','2023-06-22','CDHOT','cdehot'),('84e1b7f7-b38c-4306-bd47-5d3db3d60bf1',643000,'instagram','2023-06-16','ultimahora','@ultimahorapy'),('87cee2dc-010b-4868-8d1f-841f0d1f6813',2100000,'facebook','2023-06-16','ultimahora','UltimaHoracom'),('8ea442dd-0746-4c36-bece-5643af64e06e',228400,'twitter','2023-06-22','5DIAS','5dias'),('90c14b2e-674c-4c55-b7e3-9ba252a4e818',1371,'instagram','2023-06-22','MÁS ENCARNACIÓN','masencarnacion'),('939a087d-ffd8-448f-9e01-4642954951ca',175000,'facebook','2023-06-22','5DIAS','5dias'),('93a6eb3b-8406-4b78-9e9d-db93acfc3f62',422000,'facebook','2023-06-22','ITAPÚA EN NOTICIAS','itapuaennoticias'),('93d0d944-537e-488e-9a41-9f79a6011314',248000,'facebook','2023-06-22','CONCEPCIÓN AL DÍA','concepcionaldiapy'),('96c9925c-0cf8-45ac-9cf5-2e171f1ceedd',2018,'instagram','2023-06-22','EL PODER','elpoderpy'),('988208c4-f98d-4fac-ab3c-0774e039258a',379,'instagram','2023-06-22','La clave','diariolaclave01'),('a4bae3fb-f041-4437-99d0-802ed213eb1b',586,'twitter','2023-06-22','La clave','diario_LaClave'),('a6a8ec96-8a4b-4309-8c34-296f45a4529d',60600,'twitter','2023-06-22','Diario Popular','popupy'),('aa51c4c3-0a1e-449c-a2f3-03d5d1e30226',216000,'facebook','2023-06-22','LA JORNADA','diariolajornadacde'),('b5ead45f-33da-4f73-86bb-6d08d4c3b197',1200000,'twitter','2023-06-16','ultimahora','@UltimaHoracom'),('ccf07124-d26a-4ba2-8f04-beba588a08e8',6415,'twitter','2023-06-22','MÁS ENCARNACIÓN','masencarnacion'),('cd168ca9-b2f1-4efd-90d0-56bd3ff9100b',2780,'instagram','2023-06-22','LA JORNADA','lajornadadiario'),('d6c2e5e5-4a8c-4e5a-8a0c-b6a1abf5d1f8',119000,'facebook','2023-06-22','DIGITAL MISIONES','digitalmisionespy'),('d77c93f6-ba80-4493-bde9-ac51d0a59029',130000,'instagram','2023-06-22','HOY','hoypy'),('da3b997c-ef26-411a-a7f9-a511a408fd05',22600,'instagram','2023-06-22','EL INDEPENDIENTE','elindependientepy'),('e6fb4469-33d5-4361-9d6a-dc9675abbf96',69000,'facebook','2023-06-22','TNPRESS','diariotn'),('e8a5be8a-c53b-429d-b335-e7c2e262f279',40900,'instagram','2023-06-22','ITAPÚA EN NOTICIAS','itapuaennoticias'),('e9b99b14-9126-4f29-8309-49865e9f5345',392000,'twitter','2023-06-22','HOY','hoypy'),('f59efe26-fd55-45ba-a164-c96f71b4d0b2',1000000,'facebook','2023-06-22','HOY','hoypy'),('f808f87f-33b3-4626-9c77-03981c576aa3',434800,'twitter','2023-06-22','La Nacion','Diario la nacion');
/*!40000 ALTER TABLE `redes_sociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion` (
  `ID_ubicacion` varchar(255) NOT NULL,
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
INSERT INTO `ubicacion` VALUES ('01ae00a2-8256-4fb2-b798-6fae86c0c5c9','Encarnacion','Itapúa','Paraguay','América'),('13c1bcc7-f010-420c-b1d5-6e39eeb5ee3f','Asunción','Region Oriental','Paraguay','América'),('1447dec3-350b-428f-b70c-d861a39e7844','Encarnación','Itapúa','Paraguay','América'),('1c965483-fed2-4a36-9f6d-a9cced41fca3','Fernando de la Mora','Departamento Central','Paraguay','América'),('26415d56-a304-4c8c-848a-4742bc0e90d3','Asunción','DISTRITO CAPITAL','Paraguay','América'),('49fd55c7-966c-4ac8-8bd8-c89f97d810b7',NULL,NULL,'Paraguay','América'),('52f81043-3915-4c03-949f-161836fef81d','Ciudad del Este','Alto Paraná','Paraguay','América'),('5ea1c2e3-8f19-4975-a2dc-f56f42da1fb4','Ciudad del Este','Alto Paraná','Paraguay','América'),('68bfe579-2325-4bc4-9cfc-2d21377b69c9','Asunción','Region Oriental','Paraguay','América'),('6de844f3-28d2-42e9-977d-161d93e44ef2','Asunción','DISTRITO CAPITAL','Paraguay','América'),('74b8dc1e-06db-4504-878e-f5bca5de399f','Ciudad del Este','Alto Paraná','Paraguay','América'),('89dc9b19-f945-46b1-adfd-97436bca8c0a','Ciudad del Este','Alto Paraná','Paraguay','América'),('a4b6af07-5927-4b37-8ff0-5a9b2daff05c','Fernando de la Mora','Departamento Central','Paraguay','América'),('a508a1a5-f253-4c6c-bfa1-850eafed4790','Santa Rosa de Lima','Misiones','Paraguay','América'),('b106ef83-8874-482e-a700-49333d43dbd3','Asunción','DISTRITO CAPITAL','Paraguay','América'),('c7130fda-e00b-44dc-b569-d2924451150a','Ciudad del Este','Alto Paraná','Paraguay','América'),('d51fa96b-97fc-4d8c-9b8d-d20b5797eefa','Asunción','Region oriental','Paraguay','América'),('f31dfd45-7f8b-41d9-a334-25dedbd9589b','Coronel Oviedo','Caaguazú','Paraguay','América'),('f378b8fa-35f9-4839-890f-6f3dc5c6cca7','Asuncion','Region Oriental','Paraguay','América'),('fc10427a-3b6f-40ef-903a-c18aa53564eb','Ciudad del Este','Alto Paraná','Paraguay','América');
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pruebaprensa'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-23 14:15:14
