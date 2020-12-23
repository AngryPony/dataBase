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
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `idprescription` int NOT NULL AUTO_INCREMENT,
  `Discharge date` date NOT NULL COMMENT 'Дата выписки рецепта',
  `Expiration date` date NOT NULL COMMENT 'Дата окончания действия рецепта',
  `doctor_idDoctor` int NOT NULL,
  `patient_idPatient` int NOT NULL,
  `medicine_idmedicine1` int NOT NULL,
  PRIMARY KEY (`idprescription`),
  KEY `fk_prescription_doctor1_idx` (`doctor_idDoctor`),
  KEY `fk_prescription_patient1_idx` (`patient_idPatient`),
  KEY `fk_prescription_medicine2_idx` (`medicine_idmedicine1`),
  CONSTRAINT `fk_prescription_doctor1` FOREIGN KEY (`doctor_idDoctor`) REFERENCES `doctor` (`idDoctor`),
  CONSTRAINT `fk_prescription_medicine2` FOREIGN KEY (`medicine_idmedicine1`) REFERENCES `medicine` (`idmedicine`),
  CONSTRAINT `fk_prescription_patient1` FOREIGN KEY (`patient_idPatient`) REFERENCES `patient` (`idPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Рецепт на лекарство ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,'2020-06-21','2020-12-21',1,1,6),(2,'2020-09-03','2020-11-03',2,2,6),(3,'2020-06-21','2020-12-21',3,3,2),(4,'2020-05-04','2020-12-04',4,4,1),(5,'2020-05-01','2020-08-01',5,5,2),(6,'2020-07-12','2021-02-12',6,6,7),(7,'2020-08-21','2020-12-21',1,7,8),(8,'2020-08-18','2020-12-18',1,8,9),(9,'2020-03-14','2020-12-14',2,9,10),(10,'2020-09-19','2021-09-19',3,10,11),(11,'2020-09-29','2020-12-29',9,11,12),(12,'2020-06-02','2020-09-02',11,12,4),(13,'2020-06-02','2020-09-02',11,13,1),(14,'2020-08-18','2020-12-14',11,14,2);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
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
