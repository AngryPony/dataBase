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
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `idPatient` int NOT NULL AUTO_INCREMENT,
  `FIO` varchar(45) NOT NULL,
  `Sex` enum('Male','Female','Other') NOT NULL,
  `Date of Birth` date NOT NULL,
  `Phone` varchar(35) NOT NULL,
  `Diagnosis` varchar(64) NOT NULL,
  `address_idadress` int NOT NULL,
  PRIMARY KEY (`idPatient`),
  KEY `fk_patient_address1_idx` (`address_idadress`),
  CONSTRAINT `fk_patient_address1` FOREIGN KEY (`address_idadress`) REFERENCES `address` (`idadress`)
) ENGINE=InnoDB AUTO_INCREMENT=3029 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пациент';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Никифорова Элизабет Валерьяновна','Female','1999-04-05','+7 (970) 223-21-38','Растяжение',12),(2,'Кузнецова Лали Валерьяновна','Female','1986-12-14','+7 (970) 493-32-38','Грипп',11),(3,'Королёв Леонард Антонинович','Male','2001-01-23','+7 (910) 273-92-38','Растяжение',10),(4,'R2D2','Other','2090-01-01','+999(003) 5','Поломка',9),(5,'Ивлеев Арам Владимирович','Male','1970-08-04','+7 (970) 293-22-38','Отравление',8),(6,'Смирнова Раиса Валерьевна','Female','1973-07-22','+7 (956) 936-93-40','Аллергия',7),(7,'Поляков Баратолий Леонидович','Male','2001-03-22','+7 (951) 893-02-10','ОРВИ',6),(8,'Чернышов Анахас Закирович','Male','1986-01-29','+7 (952) 878-77-54','ОРВИ',5),(9,'Максимчук Алоизия Константиновна','Female','1971-04-15','+7 (915) 338-51-60','ОРВИ',4),(10,'Дубровский Ланс Семенович','Male','1971-01-26','+7 (903) 033-29-43','Грипп',3),(11,'Антонова Эшланд Петровна','Female','1980-12-29','+7 (988) 064-32-95','Аллергия',2),(12,'Канаева Ренка Петровна','Female','1994-12-14','+7 (922) 679-54-82','Эпилепсия',1),(13,'Отчет Пациент','Female','1994-02-14','+7 (922) 629-54-82','Аллергия',19),(14,'Отчет Пациент 2','Male','2001-03-22','+7 (911) 679-54-82','ОРВИ',20),(15,'User1','Male','2001-05-22','+7 (911) 679-54-81','Аллергия',2),(2892,'User2','Male','2001-05-22','1','Аллергия',2),(2893,'User3','Female','2001-05-12','2','Грипп',1),(2894,'User4','Female','2001-01-22','+7 (911) 679-5er-82','Кашель',5),(2895,'User2','Male','2001-05-22','+7 (911) 679-5481','Аллергия',2),(2896,'User3','Female','2001-05-12','+7 (911) 679-54-72','Грипп',1),(2897,'User4','Female','2001-01-22','+7 (911)54-82','Кашель',5),(2898,'User2','Male','2001-05-22','+7 (911) 679-54-82d1','Аллергия',2),(2899,'User3','Female','2001-05-12','+7 (911) 67-54-72','Грипп',1),(2900,'User4','Female','2001-01-22','+7 (911) 679-54-81112','Кашель',5),(2901,'User2','Male','2001-05-22','+7 (911) 679-541','Аллергия',2),(2902,'User3','Female','2001-05-12','+7 (911) 679-54-7c42','Грипп',1),(2903,'User4','Female','2001-01-22','+7 (911) 679-4-82','Кашель',5),(2904,'User2','Male','2001-05-22','+7 (911) 679-5r4-81','Аллергия',2),(2905,'User3','Female','2001-05-12','+7 (911) 679254-72','Грипп',1),(2906,'User4','Female','2001-01-22','+7 (911) 679154-82','Кашель',5),(2907,'User2','Male','2001-05-22','+7 (911) 679-5d-81','Аллергия',2),(2908,'User3','Female','2001-05-12','+7 (911) 679x54-72','Грипп',1),(2909,'User4','Female','2001-01-22','+7 (911) 679a54-82','Кашель',5),(2910,'User2','Male','2001-05-22','+7 (911) 679-5v-81','Аллергия',2),(2911,'User3','Female','2001-05-12','+7 (911) 679-n4-72','Грипп',1),(2912,'User4','Female','2001-01-22','+7 (911) 679-542-82','Кашель',5),(2913,'User2','Male','2001-05-22','+7 (911) 679-54-815','Аллергия',2),(2914,'User3','Female','2001-05-12','+7 (911) 679-54-a2','Грипп',1),(2915,'User4','Female','2001-01-22','+7 (911) 679-54s82','Кашель',5),(2916,'User2','Male','2001-05-22','+7 (911) 679-54-f1','Аллергия',2),(2917,'User3','Female','2001-05-12','+7 (911) 679-54ss-72','Грипп',1),(2918,'User4','Female','2001-01-22','+7 (911) 679-54-8a2','Кашель',5),(2919,'User2','Male','2001-05-22','+7 (911) 679-54-8f','Аллергия',2),(2920,'User3','Female','2001-05-12','+7 (911) 679-54-fv72','Грипп',1),(2921,'User4','Female','2001-01-22','+7 (911) 679-54-8a','Кашель',5),(2922,'User2','Male','2001-05-22','+7 (911) 679-54-231','Аллергия',2),(2923,'User3','Female','2001-05-12','+7 (911) 679-54qw72','Грипп',1),(2924,'User4','Female','2001-01-22','+7 (911) 679-54-s2','Кашель',5),(2925,'User2','Male','2001-05-22','+7 (911) 679-54-81cx','Аллергия',2),(2926,'User3','Female','2001-05-12','+7 (911) 679-54-7zxc','Грипп',1),(2927,'User4','Female','2001-01-22','+7 (911) 679-54-8b','Кашель',5),(2928,'User2','Male','2001-05-22','+7 (9 679-w-81','Аллергия',2),(2929,'User3','Female','2001-05-12','+7 (911) 679s54-72','Грипп',1),(2930,'User4','Female','2001-01-22','+7 (911) 679vbb54-82','Кашель',5),(2931,'User2','Male','2001-05-22','+7 (911) 679-54-cx1','Аллергия',2),(2932,'User3','Female','2001-05-12','+7 (911) 679-5asd72','Грипп',1),(2933,'User4','Female','2001-01-22','+7 (911) 679-54-1s2','Кашель',5),(2934,'User2','Male','2001-05-22','+7 (911) 679-s4-81','Аллергия',2),(2935,'User3','Female','2001-05-12','+7 (911) 67v54-72','Грипп',1),(2936,'User4','Female','2001-01-22','+7 (911) 679-54-8fc2','Кашель',5),(2937,'User2','Male','2001-05-22','+7 (911) 679-5xc81','Аллергия',2),(2938,'User3','Female','2001-05-12','+7 (911) 679-542-72','Грипп',1),(2939,'User4','Female','2001-01-22','+7 (911) 679123-82','Кашель',5),(2940,'User2','Male','2001-05-22','+7 (911) 679-54eew1','Аллергия',2),(2941,'User3','Female','2001-05-12','+7 (911) 679-5sda-72','Грипп',1),(2942,'User4','Female','2001-01-22','+7 (911) 679-cxz-82','Кашель',5),(2943,'User2','Male','2001-05-22','+7 (911) 679-53211','Аллергия',2),(2944,'User3','Female','2001-05-12','+7 (911) 679-xcz14-72','Грипп',1),(2945,'User4','Female','2001-01-22','+7 (911) 679-5we82','Кашель',5),(2946,'User2','Male','2001-05-22','+7 (911) 679-5ds131','Аллергия',2),(2947,'User3','Female','2001-05-12','+7 (9ds679-54-72','Грипп',1),(2948,'User4','Female','2001-01-22','+7 (91sxc 679-54-82','Кашель',5),(2949,'User2','Male','2001-05-22','+7 (911679-54-81','Аллергия',2),(2950,'User3','Female','2001-05-12','+7 (9cx 679-54-72','Грипп',1),(2951,'User4','Female','2001-01-22','+7 (91vc679-54-82','Кашель',5),(2952,'User2','Male','2001-05-22','+7 (911) 64xz-54-81','Аллергия',2),(2953,'User3','Female','2001-05-12','+7 (911) 267xcz-54-72','Грипп',1),(2954,'User4','Female','2001-01-22','+7 (911) 6scxz54-82','Кашель',5),(2955,'User2','Male','2001-05-22','+7 (911) 679rxvc-81','Аллергия',2),(2956,'User3','Female','2001-05-12','+7 (911) 6zx54-72','Грипп',1),(2957,'User4','Female','2001-01-22','+7 (911)12-54-82','Кашель',5),(2958,'User2','Male','2001-05-22','+7 (911) 67cx54-81','Аллергия',2),(2959,'User3','Female','2001-05-12','+7 (911) xz54-72','Грипп',1),(2960,'User4','Female','2001-01-22','+7 (911) 6x-54-82','Кашель',5),(2961,'User2','Male','2001-05-22','+7 (911) 679-cvc81','Аллергия',2),(2962,'User3','Female','2001-05-12','+7 (911) zx-54-72','Грипп',1),(2963,'User4','Female','2001-01-22','+7 (911) 6asd9-54-82','Кашель',5),(2964,'User2','Male','2001-05-22','+7 (911) 67cvc224-81','Аллергия',2),(2965,'User3','Female','2001-05-12','+7 (911) 67hj-72','Грипп',1),(2966,'User4','Female','2001-01-22','+7 (911) 67vb4-82','Кашель',5),(2967,'User2','Male','2001-05-22','+7 (911) 679-5xc1','Аллергия',2),(2968,'User3','Female','2001-05-12','+7 (911) 679-mn-72','Грипп',1),(2969,'User4','Female','2001-01-22','+7 (911) 679hf4-82','Кашель',5),(2970,'User2','Male','2001-05-22','+7 (911) 679-5tyb4-72','Грипп',1),(2971,'User4','Female','2001-01-22','+7 (911) 6bvc4-82','Кашель',5),(2972,'User2','Male','2001-05-22','+7 (911) 679-54;;-81','Аллергия',2),(2973,'User3','Female','2001-05-12','+7 (9gfv679-54-72','Грипп',1),(2974,'User4','Female','2001-01-22','+7 (911) 67tr54-82','Кашель',5),(2975,'User2','Male','2001-05-22','+7 (911) 67hg4-81','Аллергия',2),(2976,'User3','Female','2001-05-12','+7 (911) 679-54-71232','Грипп',1),(2977,'User4','Female','2001-01-22','+7 (911) 679-542312382','Кашель',5),(2978,'User2','Male','2001-05-22','+7 (911) 679-54-812321','Аллергия',2),(2979,'User3','Female','2001-05-12','+7 (911) 679-5431-72','Грипп',1),(2980,'User4','Female','2001-01-22','+7 (911) 679-54sdads-82','Кашель',5),(2981,'User2','Male','2001-05-22','+7 (911) 679-54sad-81','Аллергия',2),(2982,'User3','Female','2001-05-12','+7 (911) 679-5412332-72','Грипп',1),(2983,'User4','Female','2001-01-22','+7 (911) 679-54123-82','Кашель',5),(2984,'User2','Male','2001-05-22','+7 (911) 679-54-8asdxcz1','Аллергия',2),(2985,'User3','Female','2001-05-12','+7 (911) 679-54-123dxc72','Грипп',1),(2986,'User4','Female','2001-01-22','+7 (911) 679-54-12382','Кашель',5),(2987,'User2','Male','2001-05-22','+7 (911) 679-54sad81','Аллергия',2),(2988,'User3','Female','2001-05-12','+7 (911) 679-d12e54-72','Грипп',1),(2989,'User4','Female','2001-01-22','+7 (911) 679-5f4eqw4-82','Кашель',5),(2990,'User2','Male','2001-05-22','+7 (911) 679-54ed12-81','Аллергия',2),(2991,'User3','Female','2001-05-12','+7 (911) 679-54213d1-72','Грипп',1),(2992,'User4','Female','2001-01-22','+7 (911) 4-82','Кашель',5),(2993,'User2','Male','2001-05-22','+7 (911) 679dsx2-54-81','Аллергия',2),(2994,'User3','Female','2001-05-12','+7 (911) 679-59994-72','Грипп',1),(2995,'User4','Female','2001-01-22','+7 (911) 679-58884-82','Кашель',5),(2996,'User2','Male','2001-05-22','+7 (911) 679-57774-81','Аллергия',2),(2997,'User3','Female','2001-05-12','+7 (911) 679-56664-72','Грипп',1),(2998,'User4','Female','2001-01-22','+7 (911) 679-55554-82','Кашель',5),(2999,'User2','Male','2001-05-22','+7 (911) 679-54-4481','Аллергия',2),(3000,'User3','Female','2001-05-12','+7 (911) 679-53334-72','Грипп',1),(3001,'User4','Female','2001-01-22','+7 (911) 679-52224-82','Кашель',5),(3002,'User2','Male','2001-05-22','+7 (911) 679-5411-81','Аллергия',2),(3003,'User3','Female','2001-05-12','+7 (911) 679-qqq54-72','Грипп',1),(3004,'User4','Female','2001-01-22','+7 (911) 679-5www4-82','Кашель',5),(3005,'User2','Male','2001-05-22','+7 (911) 679-54-ee81','Аллергия',2),(3006,'User3','Female','2001-05-12','+7 (911) 679-5rrr4-72','Грипп',1),(3007,'User4','Female','2001-01-22','+7 (911) 679-5ttt4-82','Кашель',5),(3008,'User2','Male','2001-05-22','+7 (911) 679-5yyy4-81','Аллергия',2),(3009,'User3','Female','2001-05-12','+7 (911) 679-uuu54-72','Грипп',1),(3010,'User4','Female','2001-01-22','+7 (911) 679-iii54-82','Кашель',5),(3011,'User2','Male','2001-05-22','+7 (911) 679-oo54-81','Аллергия',2),(3012,'User3','Female','2001-05-12','+7 (911) 679ppp-54-72','Грипп',1),(3013,'User4','Female','2001-01-22','+7 (911) 679aaa-54-82','Кашель',5),(3014,'User2','Male','2001-05-22','+7 (911) 679sss-d54-81','Аллергия',2),(3015,'User3','Female','2001-05-12','+7 (911) 679dd-54-72','Грипп',1),(3016,'User4','Female','2001-01-22','+7 (911) 679-5fff4-82','Кашель',5),(3017,'User2','Male','2001-05-22','+7 (911) 679-54-8ggg1','Аллергия',2),(3018,'User3','Female','2001-05-12','+7 (911) 679-54hhh-72','Грипп',1),(3019,'User4','Female','2001-01-22','+7 (911) 679-jjj54-82','Кашель',5),(3020,'User2','Male','2001-05-22','+7 (911) 679-kkk54-81','Аллергия',2),(3021,'User3','Female','2001-05-12','+7 (911) 679-lll54-72','Грипп',1),(3022,'User4','Female','2001-01-22','+7 (911) 67;;;9-54-82','Кашель',5),(3023,'User2','Male','2001-05-22','+7 (911) 679-54..-81','Аллергия',2),(3024,'User3','Female','2001-05-12','+7 (911) 679...-54-72','Грипп',1),(3025,'User4','Female','2001-01-22','+7 (911) 679-,,,54-82','Кашель',5),(3026,'User2','Male','2001-05-22','+7 (911) 679-54mmm-81','Аллергия',2),(3027,'User3','Female','2001-05-12','+7 (911) 679nnn-54-72','Грипп',1),(3028,'User4','Female','2001-01-22','+7 (911) 679bbb-54-82','Кашель',5);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 17:45:48