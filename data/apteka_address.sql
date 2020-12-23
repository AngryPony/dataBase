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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idadress` int NOT NULL AUTO_INCREMENT,
  `city` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `build/house` varchar(10) NOT NULL,
  `zip code` int NOT NULL,
  PRIMARY KEY (`idadress`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Волгоград','Елисеева','10',400120),(2,'Волгоград','пр. имени В.И. Ленина','106',400005),(3,'Волгоград','имени Константина Симонова','30',400137),(4,'Калач на Дону','Пролетарская','85',404507),(5,'Волжский','просп. Ленина','45',404130),(6,'Волжский','Комсомольская','19',404130),(7,'Михайловка','Пирогова','75',403348),(8,'Волжский','19 Партсъезда','34',404130),(9,'Светлый Яр','Спортивная','12',404171),(10,'Михайловка','Гоголя','68',403348),(11,'Волгоград','Николая Отрады','1Б',400033),(12,'Волгоград','95 Гвардейской','6',400006),(14,'Волгоград','Донецкая','3',400131),(15,'Волжский','б-р Профсоюзов','14',404102),(16,'Волгоград','пр. имени В.И. Ленина','37',400005),(17,'Волгоград','Комитетская','32',400120),(18,'Калач на Дону','Островского пер','1',404507),(19,'Калач на Дону','Ким','3',404507),(20,'Волгоград','Ленина','23',400007),(21,'Волгоград','Землячки','19',400607),(22,'Волгоград','Металлургов','16',400407),(23,'Волгоград','Ленина','23',400007),(26,'Волгоград','Ленина','23',400007),(27,'Волгоград','Землячки','19',400607),(28,'Волгоград','Металлургов','16',400407),(29,'Волгоград','Ленина','23',400007),(30,'Волгоград','Землячки','19',400607),(31,'Волгоград','Металлургов','16',400407),(32,'Волгоград','Ленина','23',400007),(33,'Волгоград','Землячки','19',400607),(34,'Волгоград','Металлургов','16',400407);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 17:45:50
