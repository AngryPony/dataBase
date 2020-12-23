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
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `idstock` int NOT NULL AUTO_INCREMENT,
  `Amount` int NOT NULL,
  `Update date` date DEFAULT NULL,
  `pharmacy_idpharmacy` int DEFAULT NULL,
  `storehouse_idstorehouse` int DEFAULT NULL,
  `medicine_idmedicine` int NOT NULL,
  PRIMARY KEY (`idstock`),
  KEY `fk_stock_pharmacy1_idx` (`pharmacy_idpharmacy`),
  KEY `fk_stock_storehouse1_idx` (`storehouse_idstorehouse`),
  KEY `fk_stock_medicine1_idx` (`medicine_idmedicine`),
  CONSTRAINT `fk_stock_medicine1` FOREIGN KEY (`medicine_idmedicine`) REFERENCES `medicine` (`idmedicine`),
  CONSTRAINT `fk_stock_pharmacy1` FOREIGN KEY (`pharmacy_idpharmacy`) REFERENCES `pharmacy` (`idpharmacy`),
  CONSTRAINT `fk_stock_storehouse1` FOREIGN KEY (`storehouse_idstorehouse`) REFERENCES `storehouse` (`idstorehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Запас препаратов на складе и в аптеке';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,100,'2020-02-22',1,NULL,12),(2,1200,'2020-01-25',NULL,1,12),(3,240,'2020-06-23',2,NULL,10),(4,3000,'2020-01-12',NULL,3,9),(5,510,'2020-03-09',3,NULL,11),(6,230,'2020-01-27',4,NULL,8),(7,200,'2020-01-30',5,NULL,7),(8,110,'2020-05-21',6,NULL,6),(9,110,'2020-05-17',2,NULL,5),(10,100,'2020-01-23',1,NULL,4),(11,100,'2020-07-23',3,NULL,3),(12,700,'2020-07-23',NULL,6,2),(13,150,'2020-10-23',NULL,4,1),(14,110,'2020-10-23',NULL,2,15),(15,100,'2020-03-25',7,NULL,12),(16,200,'2020-11-15',NULL,3,7),(17,106,'2020-09-21',2,NULL,2),(18,100,'2020-03-25',7,NULL,12),(19,200,'2020-11-15',NULL,3,7),(20,106,'2020-09-21',2,NULL,2),(21,100,'2020-03-25',7,NULL,12),(22,200,'2020-11-15',NULL,3,4),(23,106,'2020-09-21',2,NULL,2),(24,1100,'2020-09-21',NULL,2,1),(25,2500,'2020-09-21',NULL,4,2);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 17:45:54
