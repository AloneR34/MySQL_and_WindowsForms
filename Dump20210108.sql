CREATE DATABASE  IF NOT EXISTS `gibdd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gibdd`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: gibdd
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
-- Table structure for table `accidents`
--

DROP TABLE IF EXISTS `accidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accidents` (
  `Id_a` int NOT NULL AUTO_INCREMENT,
  `place` varchar(100) NOT NULL,
  `number_of_participants` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`Id_a`),
  KEY `data` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accidents`
--

LOCK TABLES `accidents` WRITE;
/*!40000 ALTER TABLE `accidents` DISABLE KEYS */;
INSERT INTO `accidents` VALUES (1,'трасса',2,'2000-01-05'),(2,'перекресток',3,'2010-07-29'),(3,'перекресток',3,'2010-07-29'),(4,'столб',4,'0000-00-00'),(5,'грунтовая дорога',2,'0000-00-00'),(6,'проспект',4,'0000-00-00'),(7,'вокзал',3,'2010-07-28'),(8,'улица Барьера',4,'2020-12-11'),(9,'перекресток',3,'0000-00-00'),(10,'кольцевая',2,'2010-10-10');
/*!40000 ALTER TABLE `accidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Model` varchar(30) NOT NULL,
  `stamp` varchar(30) NOT NULL,
  `Year` year NOT NULL,
  `Color` varchar(30) NOT NULL,
  `the_serial_number_of_the_passport_fk` int DEFAULT NULL,
  `probeg` int NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Model` (`Model`),
  KEY `TSN_C_fk_idx` (`the_serial_number_of_the_passport_fk`),
  CONSTRAINT `TSN_C_fk` FOREIGN KEY (`the_serial_number_of_the_passport_fk`) REFERENCES `driver_in_city` (`the_serial_number_of_the_passport`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'Nissan','X-trail',2000,'зеленый',1,12000,'Япония'),(2,'Renault','Logan',2000,'белый',2,30000,'Франция'),(3,'Volkswagen','Tiguan',2011,'белый',3,70000,'Германия'),(4,'Lada','Granta',2005,'серый',4,50000,'Россия'),(5,'Volkswagen','Polo',2006,'белый',5,42000,'Германия'),(6,'Lada','Vesta',2010,'голубой',6,53621,'Россия'),(7,'Renault','Sandero',2000,'белый',7,4000,'Франция'),(8,'Nissan','Almero',2009,'серый',8,162000,'Япония'),(9,'Land Rover','Freelander',2008,'красный',9,182964,'Великобритания'),(10,'Kia','ceed',2017,'синий',10,18000,'Корея'),(11,'jhd','kjfk',2020,'khdk',NULL,7664,'jfkuru'),(12,'hgck','jfl',2020,'hfik',NULL,87648,'ghfk'),(13,'gfj','k,f',2020,'hdgjk',NULL,498089,'hgk'),(17,'папр','вар',2020,'вр',NULL,2577,'птап');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars_to_accidents`
--

DROP TABLE IF EXISTS `cars_to_accidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars_to_accidents` (
  `id_c_a` int NOT NULL AUTO_INCREMENT,
  `ID_fk` int NOT NULL,
  `Id_a_fk` int NOT NULL,
  PRIMARY KEY (`id_c_a`),
  KEY `ID_C_fk_idx` (`ID_fk`),
  KEY `Id_a_A_fk_idx` (`Id_a_fk`),
  CONSTRAINT `Id_a_A_fk` FOREIGN KEY (`Id_a_fk`) REFERENCES `accidents` (`Id_a`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ID_C_fk` FOREIGN KEY (`ID_fk`) REFERENCES `cars` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars_to_accidents`
--

LOCK TABLES `cars_to_accidents` WRITE;
/*!40000 ALTER TABLE `cars_to_accidents` DISABLE KEYS */;
INSERT INTO `cars_to_accidents` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `cars_to_accidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carsharing`
--

DROP TABLE IF EXISTS `carsharing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carsharing` (
  `Id_cs` int NOT NULL AUTO_INCREMENT,
  `Start_the_usage` date NOT NULL,
  `Stop_the_usage` date NOT NULL,
  `ID_fk` int NOT NULL,
  PRIMARY KEY (`Id_cs`),
  KEY `ID_CS_fk_idx` (`ID_fk`),
  CONSTRAINT `ID_CS_fk` FOREIGN KEY (`ID_fk`) REFERENCES `cars` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carsharing`
--

LOCK TABLES `carsharing` WRITE;
/*!40000 ALTER TABLE `carsharing` DISABLE KEYS */;
INSERT INTO `carsharing` VALUES (1,'2010-09-08','2011-08-09',1),(2,'2010-09-08','2011-08-09',2),(3,'2010-09-08','2011-08-09',3),(4,'2010-09-08','2011-08-09',4),(5,'2010-09-08','2011-08-09',5),(6,'2010-09-08','2011-08-09',6),(7,'2010-09-08','2011-08-09',7),(8,'2010-09-08','2011-08-09',8),(9,'2010-09-08','2011-08-09',9),(10,'2010-09-08','2011-08-09',10);
/*!40000 ALTER TABLE `carsharing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_in_city`
--

DROP TABLE IF EXISTS `driver_in_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_in_city` (
  `the_serial_number_of_the_passport` int NOT NULL AUTO_INCREMENT,
  `FIO` varchar(50) NOT NULL,
  `driving_experience` int NOT NULL,
  `name_of_the_city` varchar(50) NOT NULL,
  PRIMARY KEY (`the_serial_number_of_the_passport`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_in_city`
--

LOCK TABLES `driver_in_city` WRITE;
/*!40000 ALTER TABLE `driver_in_city` DISABLE KEYS */;
INSERT INTO `driver_in_city` VALUES (1,'Иванов иван Иванович',2,'Волгоград'),(2,'Сергеев Сергей Сергеевич',23,'Белгород'),(3,'Матвеев Матвей Матвеевич',12,'Самара'),(4,'Артемьев Артём Артемович',13,'Сочи'),(5,'Данильев Данил Данилович',12,'Краснодар'),(6,'Алексеев Алексей Алексеевич ',14,'Калининград'),(7,'Алесандриев Александр Александович',18,'Урюпинск'),(8,'Викторьев Виктор Викторович',36,'Москва'),(9,'Алексеев Алексей Алексеевич ',20,'Тюмень'),(10,'Алесандриев Александр Александович',25,'Астрахань'),(12,'X X X',2,'Xxx'),(13,'X X X',2,'Xxx'),(14,'X X X',2,'Xx'),(15,' Д Д Д',3,'Дорога'),(16,'ВВВ',2,'Волггрд'),(17,'ВВВ',2,'Волггрд');
/*!40000 ALTER TABLE `driver_in_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `Id_i` int NOT NULL AUTO_INCREMENT,
  `Begin` date NOT NULL,
  `End` date NOT NULL,
  `ID_fk` int NOT NULL,
  PRIMARY KEY (`Id_i`),
  KEY `ID_I_fk_idx` (`ID_fk`),
  CONSTRAINT `ID_I_fk` FOREIGN KEY (`ID_fk`) REFERENCES `cars` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,'2000-01-20','2003-09-08',1),(2,'2000-01-20','2003-09-08',2),(3,'2000-01-20','2003-09-08',3),(4,'2000-01-20','2003-09-08',4),(5,'2000-01-20','2003-09-08',5),(6,'2000-01-20','2003-09-08',6),(7,'2000-01-20','2003-09-08',7),(8,'2000-01-20','2003-09-08',8),(9,'2000-01-20','2003-09-08',9),(10,'2000-01-20','2003-09-08',10);
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal_restriction`
--

DROP TABLE IF EXISTS `legal_restriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legal_restriction` (
  `Id_l` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `ID_fk` int NOT NULL,
  PRIMARY KEY (`Id_l`),
  KEY `ID_LR_fk_idx` (`ID_fk`),
  CONSTRAINT `ID_LR_fk` FOREIGN KEY (`ID_fk`) REFERENCES `cars` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_restriction`
--

LOCK TABLES `legal_restriction` WRITE;
/*!40000 ALTER TABLE `legal_restriction` DISABLE KEYS */;
INSERT INTO `legal_restriction` VALUES (1,'банкротство',1),(2,'долги',2),(3,'банкротсто',3),(4,'признание недееспособным',4),(5,'долги',5),(6,'банкроство',6),(7,'признание недеяспособным',7),(8,'долги',8),(9,'банктротство',9),(10,'банкротство',10);
/*!40000 ALTER TABLE `legal_restriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty`
--

DROP TABLE IF EXISTS `penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penalty` (
  `Id_p` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `summa` int NOT NULL,
  `deadline` timestamp(6) NOT NULL,
  `ID_fk` int NOT NULL,
  PRIMARY KEY (`Id_p`),
  KEY `ID_P_fk_idx` (`ID_fk`),
  CONSTRAINT `ID_P_fk` FOREIGN KEY (`ID_fk`) REFERENCES `cars` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty`
--

LOCK TABLES `penalty` WRITE;
/*!40000 ALTER TABLE `penalty` DISABLE KEYS */;
INSERT INTO `penalty` VALUES (1,'превышение скорости',100,'2009-03-04 21:00:00.000000',1),(2,'заезд на стоп-лини',150,'2021-03-04 21:00:00.000000',2),(3,'превышение скорости',100,'2020-12-19 21:00:00.000000',3),(4,'паковка в зеленой зоне',1500,'2021-01-04 21:00:00.000000',4),(5,'пересечение сплошной ',2000,'2020-12-04 21:00:00.000000',5),(6,'проезд на красный',500,'2009-03-04 21:00:00.000000',6),(7,'парковка в зеленой зоне',1000,'2019-03-04 21:00:00.000000',7),(8,'превышение скорости',2000,'2001-03-04 21:00:00.000000',8),(9,'проезд на красный',1500,'2009-03-04 21:00:00.000000',9),(10,'заезд на стоп-линию',500,'2009-03-04 21:00:00.000000',10);
/*!40000 ALTER TABLE `penalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `prbg`
--

DROP TABLE IF EXISTS `prbg`;
/*!50001 DROP VIEW IF EXISTS `prbg`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prbg` AS SELECT 
 1 AS `Model`,
 1 AS `stamp`,
 1 AS `Year`,
 1 AS `Color`,
 1 AS `country`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `repair_work`
--

DROP TABLE IF EXISTS `repair_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_work` (
  `Id_r` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `ID_fk` int NOT NULL,
  PRIMARY KEY (`Id_r`),
  KEY `ID_RW_fk_idx` (`ID_fk`),
  CONSTRAINT `ID_RW_fk` FOREIGN KEY (`ID_fk`) REFERENCES `cars` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_work`
--

LOCK TABLES `repair_work` WRITE;
/*!40000 ALTER TABLE `repair_work` DISABLE KEYS */;
INSERT INTO `repair_work` VALUES (1,'ТО',1),(2,'Змена картера',2),(3,'Замена прокладки масляного фильтра',3),(4,'Замена ремня ГРМ',4),(5,'Замена свечей',5),(6,'Замена бампеа',6),(7,'Удаление катализатора',7),(8,'Ремонт ДСГ',8),(9,'Ремонт АКПП ',9),(10,'Ремонт ТНВД',10);
/*!40000 ALTER TABLE `repair_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi`
--

DROP TABLE IF EXISTS `taxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxi` (
  `Id_t` int NOT NULL AUTO_INCREMENT,
  `start_the_usage` date NOT NULL,
  `stop_the_usage` date NOT NULL,
  `ID_fk` int NOT NULL,
  PRIMARY KEY (`Id_t`),
  KEY `ID_T_fk_idx` (`ID_fk`),
  CONSTRAINT `ID_T_fk` FOREIGN KEY (`ID_fk`) REFERENCES `cars` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi`
--

LOCK TABLES `taxi` WRITE;
/*!40000 ALTER TABLE `taxi` DISABLE KEYS */;
INSERT INTO `taxi` VALUES (1,'2000-01-01','2001-01-01',1),(2,'2010-07-28','2010-10-09',2),(3,'2010-07-28','2010-10-09',3),(4,'2010-07-28','2000-01-01',4),(5,'2010-07-28','2010-07-28',5),(6,'2010-10-09','2001-01-01',6),(7,'2010-07-28','2000-01-01',7),(8,'2000-01-01','2010-10-09',8),(9,'2000-01-01','2000-01-01',9),(10,'2010-10-09','2010-07-28',10);
/*!40000 ALTER TABLE `taxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testtable`
--

DROP TABLE IF EXISTS `testtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testtable` (
  `Id_r` int NOT NULL,
  `name` char(100) NOT NULL,
  `ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtable`
--

LOCK TABLES `testtable` WRITE;
/*!40000 ALTER TABLE `testtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `testtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `prbg`
--

/*!50001 DROP VIEW IF EXISTS `prbg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prbg` AS select `cars`.`Model` AS `Model`,`cars`.`stamp` AS `stamp`,`cars`.`Year` AS `Year`,`cars`.`Color` AS `Color`,`cars`.`country` AS `country` from `cars` where (`cars`.`probeg` < 100000) order by `cars`.`probeg` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-08 13:38:19
