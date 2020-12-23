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
-- Temporary view structure for view `patient_orders`
--

DROP TABLE IF EXISTS `patient_orders`;
/*!50001 DROP VIEW IF EXISTS `patient_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patient_orders` AS SELECT 
 1 AS `FIO`,
 1 AS `Sex`,
 1 AS `phone`,
 1 AS `Amount`,
 1 AS `name`,
 1 AS `provider`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `types_prices`
--

DROP TABLE IF EXISTS `types_prices`;
/*!50001 DROP VIEW IF EXISTS `types_prices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `types_prices` AS SELECT 
 1 AS `Highest price`,
 1 AS `Lowest price`,
 1 AS `Average price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cifran_medicine`
--

DROP TABLE IF EXISTS `cifran_medicine`;
/*!50001 DROP VIEW IF EXISTS `cifran_medicine`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cifran_medicine` AS SELECT 
 1 AS `idmedicine`,
 1 AS `Type`,
 1 AS `Way of using`,
 1 AS `Name`,
 1 AS `Provider`,
 1 AS `Dispensing method`,
 1 AS `Price`,
 1 AS `Critikal limits`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sunpraz_medicine`
--

DROP TABLE IF EXISTS `sunpraz_medicine`;
/*!50001 DROP VIEW IF EXISTS `sunpraz_medicine`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sunpraz_medicine` AS SELECT 
 1 AS `idmedicine`,
 1 AS `Type`,
 1 AS `Way of using`,
 1 AS `Name`,
 1 AS `Provider`,
 1 AS `Dispensing method`,
 1 AS `Price`,
 1 AS `Critikal limits`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dazolic_medicine`
--

DROP TABLE IF EXISTS `dazolic_medicine`;
/*!50001 DROP VIEW IF EXISTS `dazolic_medicine`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dazolic_medicine` AS SELECT 
 1 AS `idmedicine`,
 1 AS `Type`,
 1 AS `Way of using`,
 1 AS `Name`,
 1 AS `Provider`,
 1 AS `Dispensing method`,
 1 AS `Price`,
 1 AS `Critikal limits`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `patient_orders`
--

/*!50001 DROP VIEW IF EXISTS `patient_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_orders` AS select `patient`.`FIO` AS `FIO`,`patient`.`Sex` AS `Sex`,`patient`.`Phone` AS `phone`,`order`.`Amount` AS `Amount`,`medicine`.`Name` AS `name`,`medicine`.`Provider` AS `provider` from (((`patient` join `order` on((`patient`.`idPatient` = `order`.`patient_idPatient`))) join `order_has_medicine` on((`order`.`idorder` = `order_has_medicine`.`order_idorder`))) join `medicine` on((`order_has_medicine`.`medicine_idmedicine` = `medicine`.`idmedicine`))) order by `patient`.`FIO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `types_prices`
--

/*!50001 DROP VIEW IF EXISTS `types_prices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `types_prices` AS select max(`medicine`.`Price`) AS `Highest price`,min(`medicine`.`Price`) AS `Lowest price`,avg(`medicine`.`Price`) AS `Average price` from `medicine` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cifran_medicine`
--

/*!50001 DROP VIEW IF EXISTS `cifran_medicine`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cifran_medicine` AS select `medicine`.`idmedicine` AS `idmedicine`,`medicine`.`Type` AS `Type`,`medicine`.`Way of using` AS `Way of using`,`medicine`.`Name` AS `Name`,`medicine`.`Provider` AS `Provider`,`medicine`.`Dispensing method` AS `Dispensing method`,`medicine`.`Price` AS `Price`,`medicine`.`Critikal limits` AS `Critikal limits` from `medicine` where (`medicine`.`Provider` = 'Cifran') order by `medicine`.`Price` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sunpraz_medicine`
--

/*!50001 DROP VIEW IF EXISTS `sunpraz_medicine`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sunpraz_medicine` AS select `medicine`.`idmedicine` AS `idmedicine`,`medicine`.`Type` AS `Type`,`medicine`.`Way of using` AS `Way of using`,`medicine`.`Name` AS `Name`,`medicine`.`Provider` AS `Provider`,`medicine`.`Dispensing method` AS `Dispensing method`,`medicine`.`Price` AS `Price`,`medicine`.`Critikal limits` AS `Critikal limits` from `medicine` where (`medicine`.`Provider` = 'sunpraz') order by `medicine`.`Price` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dazolic_medicine`
--

/*!50001 DROP VIEW IF EXISTS `dazolic_medicine`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dazolic_medicine` AS select `medicine`.`idmedicine` AS `idmedicine`,`medicine`.`Type` AS `Type`,`medicine`.`Way of using` AS `Way of using`,`medicine`.`Name` AS `Name`,`medicine`.`Provider` AS `Provider`,`medicine`.`Dispensing method` AS `Dispensing method`,`medicine`.`Price` AS `Price`,`medicine`.`Critikal limits` AS `Critikal limits` from `medicine` where (`medicine`.`Provider` = 'Dazolic') order by `medicine`.`Price` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'apteka'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_providerPopularity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_providerPopularity`(in p_provider varchar(45), out p_status varchar(45) )
BEGIN
	declare summ int;
    set summ = (select COALESCE (sum(amount)) from patient_orders where patient_orders.provider = p_provider);
    
    if summ > 500 then
		set p_status = 'Very popular provider';
    elseif summ between 100 and 500 then
		set p_status = 'popular provider';
	else
		set p_status = 'unpopular provider';
    END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 17:45:55
