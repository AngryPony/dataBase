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
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `idDoctor` int NOT NULL AUTO_INCREMENT,
  `FIO` varchar(45) NOT NULL,
  `Place of work` varchar(45) NOT NULL,
  `Phone` varchar(35) DEFAULT NULL,
  `Work address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDoctor`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Врач';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Иванов Ким Вениаминович','Поликлиника №2','22-11-22','Волжский'),(2,'Веселов Лев Рудольфович','ЧК \"Сова\"','+7 (8442) 68-50-07','Волгоград, проспект им. В.И. Ленина, 59Б'),(3,'Куликов Валерий Глебович','Областная Больница','55-00-55',NULL),(4,'Комиссаров Клим Петрович','ЧК \"Сова\"','+7 (8442) 68-50-07','Волгоград, АКАДЕМИЧЕСКАЯ, 6А'),(5,'Копылова Борислава Наумовна','ЧК Панацея','+7 (8442) 59-59-59','Волгоград, ул. Профсоюзная, 15Б'),(6,'Мамонтов Болеслав Аристархович','Поликлиника №2','22-11-22','Волгоград'),(7,'Трофимов Геннадий Денисович','ЧК Панацея','+7 (8442) 59-59-59','Волгоград, пр-т Металлургов, 30А;'),(8,'Жукова Зара Антониновна','Поликлиника №12','33-01-33',NULL),(9,'Соколов Виктор Андреевич','ЧК Панацея','+7 (8442) 59-59-59','Волгоград, ул. Профсоюзная, 15Б'),(10,'Агафонова Северина Егоровна','ЧК Панацея','+7 (8442) 59-59-59',NULL),(11,'Отчет','ЧК Панацея','+7 (8442) 59-52-59','Волгоград, ул. Профсоюзная, 15Б');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 17:45:51
