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
-- Table structure for table `order_has_medicine`
--

DROP TABLE IF EXISTS `order_has_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_has_medicine` (
  `order_idorder` int NOT NULL,
  `medicine_idmedicine` int NOT NULL,
  PRIMARY KEY (`order_idorder`,`medicine_idmedicine`),
  KEY `fk_order_has_medicine_medicine1_idx` (`medicine_idmedicine`),
  KEY `fk_order_has_medicine_order1_idx` (`order_idorder`),
  CONSTRAINT `fk_order_has_medicine_medicine1` FOREIGN KEY (`medicine_idmedicine`) REFERENCES `medicine` (`idmedicine`),
  CONSTRAINT `fk_order_has_medicine_order1` FOREIGN KEY (`order_idorder`) REFERENCES `order` (`idorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_has_medicine`
--

LOCK TABLES `order_has_medicine` WRITE;
/*!40000 ALTER TABLE `order_has_medicine` DISABLE KEYS */;
INSERT INTO `order_has_medicine` VALUES (4,1),(1,2),(5,3),(1,4),(2,5),(3,5),(6,6),(7,7),(8,8),(11,10),(20,20),(21,22),(22,23),(23,24),(24,25),(25,26),(26,27),(27,28),(28,29),(30,36),(31,36),(32,36),(33,36),(34,36),(35,36),(36,36),(37,36),(38,36),(39,36),(40,36),(41,36),(42,36),(43,36),(44,36),(45,36),(46,36),(47,36),(48,36);
/*!40000 ALTER TABLE `order_has_medicine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 17:45:49
