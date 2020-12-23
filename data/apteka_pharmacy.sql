-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: apteka
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy` (
  `idpharmacy` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `address_idadress` int NOT NULL,
  PRIMARY KEY (`idpharmacy`),
  KEY `fk_pharmacy_address1_idx` (`address_idadress`),
  CONSTRAINT `fk_pharmacy_address1` FOREIGN KEY (`address_idadress`) REFERENCES `address` (`idadress`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy`
--

LOCK TABLES `pharmacy` WRITE;
/*!40000 ALTER TABLE `pharmacy` DISABLE KEYS */;
INSERT INTO `pharmacy` VALUES (1,'Вита','+78007550003',14),(2,'Волгофарм','+78442384837',15),(3,'Вита','+78007550003',16),(4,'Калинка','+78442380056',17),(5,'Волгофарм','+78442943538',18),(6,'Вита','+78007550003',19),(7,'Rigla','8(909)398-21-23',3),(8,'Rigla','8(909)398-21-23',20),(9,'Волгофарм','8(909)400-40-30',21),(10,'Аптека №12','8(8442)98-21-03',22),(11,'Rigla','8(909)398-21-23',3),(12,'Rigla','8(909)398-21-23',20),(13,'Волгофарм','8(909)400-40-30',21),(14,'Аптека №12','8(8442)98-21-03',22),(15,'Гуливер','+78442654338',21),(16,'Rigla','8(909)398-21-23',3),(17,'Rigla','8(909)398-21-23',20),(18,'Волгофарм','8(909)400-40-30',21),(19,'Аптека №12','8(8442)98-21-03',22),(20,'Rigla','8(909)398-21-23',3),(21,'Rigla','8(909)398-21-23',20),(22,'Волгофарм','8(909)400-40-30',21),(23,'Аптека №12','8(8442)98-21-03',22),(24,'Rigla','8(909)398-21-23',3),(25,'Rigla','8(909)398-21-23',20),(26,'Волгофарм','8(909)400-40-30',21),(27,'Аптека №12','8(8442)98-21-03',22);
/*!40000 ALTER TABLE `pharmacy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 17:45:52
