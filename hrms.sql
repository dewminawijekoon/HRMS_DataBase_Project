CREATE DATABASE  IF NOT EXISTS `hrms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hrms`;
-- MYSQL DataBase for Jupiter HRMS Group Project
--
-- Host: 127.0.0.1    Database: hrms
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(40) NOT NULL,
  `branch_address` varchar(40) NOT NULL,
  `organization_id` int DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Headquarters','123 Main St',NULL),(2,'Branch A','456 Elm St',NULL),(3,'Branch B','789 Oak St',NULL);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_attribute`
--

DROP TABLE IF EXISTS `custom_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_attribute` (
  `custom_attribute_id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(40) DEFAULT NULL,
  `employee_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`custom_attribute_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `custom_attribute_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_attribute`
--

LOCK TABLES `custom_attribute` WRITE;
/*!40000 ALTER TABLE `custom_attribute` DISABLE KEYS */;
INSERT INTO `custom_attribute` VALUES (1,'Sri Lankan','7b163c45-ce7b-422f-93d9-d72abb4af5ae');
/*!40000 ALTER TABLE `custom_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_employee_record`
--

DROP TABLE IF EXISTS `custom_employee_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_employee_record` (
  `custom_employee_record_id` int NOT NULL AUTO_INCREMENT,
  `custom_attribute_id` int DEFAULT NULL,
  `custom_attribute_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`custom_employee_record_id`),
  KEY `custom_attribute_id` (`custom_attribute_id`),
  CONSTRAINT `custom_employee_record_ibfk_1` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attribute` (`custom_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_employee_record`
--

LOCK TABLES `custom_employee_record` WRITE;
/*!40000 ALTER TABLE `custom_employee_record` DISABLE KEYS */;
INSERT INTO `custom_employee_record` VALUES (1,1,'nationality');
/*!40000 ALTER TABLE `custom_employee_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(40) NOT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `department_head_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  KEY `department_head_id` (`department_head_id`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`department_head_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'HR',500000.00,NULL),(2,'IT',1000000.00,NULL),(3,'Finance',750000.00,NULL),(4,'Main',1000000.00,NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_contact`
--

DROP TABLE IF EXISTS `emergency_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_contact` (
  `emergency_contact_id` varchar(40) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `nic` varchar(40) NOT NULL,
  `address` varchar(40) DEFAULT NULL,
  `emergency_contact_number` varchar(40) NOT NULL,
  PRIMARY KEY (`emergency_contact_id`),
  UNIQUE KEY `nic` (`nic`),
  UNIQUE KEY `emergency_contact_number` (`emergency_contact_number`),
  CONSTRAINT `emergency_contact_ibfk_1` FOREIGN KEY (`emergency_contact_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_contact`
--

LOCK TABLES `emergency_contact` WRITE;
/*!40000 ALTER TABLE `emergency_contact` DISABLE KEYS */;
INSERT INTO `emergency_contact` VALUES ('0ba6900a-c6bd-40ad-bd40-d335fbd42f7a','Ranjith','902345671V','10,borella road,colombo.','0772345678'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7b','Chandana','952876543V','89,ragama road,gampaha.','0778765432'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7c','Ruwan','922765432V','456,kandy road,kadawatha.','0787654321'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f8d','Nimal','912345679V','21,maharagama road,nugegoda.','0771234569'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f9c','Saman','922234567V','123,malabe road,kottawa.','0719876543'),('21b63c70-5c83-433b-9ab8-de8899d18854','Namal','912340690V','91,Athurugiriya road,Malabe.','0711234580'),('7364528d-ce36-4d7f-a0aa-7cd084c077f3','Sahan','992912190V','46,wakanda road,homagama.','0712340123'),('7b163c45-ce7b-422f-93d9-d72abb4af5ae','Kumara','923222222V','489, parakrame road, kottawa.','0718152643'),('e10bfb2f-9cb9-4278-ac8c-952ee4428f02','Shiranshi','992919190V','48, samagi road, Maharagema.','0710023452');
/*!40000 ALTER TABLE `emergency_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` varchar(40) NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `employee_nic` varchar(40) NOT NULL,
  `gender` varchar(40) DEFAULT NULL,
  `marital_status` varchar(40) DEFAULT NULL,
  `number_of_dependents` int DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `contact_number` varchar(40) NOT NULL,
  `business_email` varchar(40) DEFAULT NULL,
  `job_title` varchar(40) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `profile_photo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_nic` (`employee_nic`),
  UNIQUE KEY `contact_number` (`contact_number`),
  KEY `job_title` (`job_title`),
  KEY `department_id` (`department_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`job_title`) REFERENCES `employee_position` (`job_title`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `employee_chk_1` CHECK ((`marital_status` in (_utf8mb4'Married',_utf8mb4'Single')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('0ba6900a-c6bd-40ad-bd40-d335fbd42f7a','Kamal','Fernando','1980-07-15','954321876V','Male','Single',0,'10,borella road,colombo.','0709876543','kamal.fernando@company.com','Worker',1,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7b','Gayani','Wickramasinghe','1982-03-12','948765432V','Female','Single',0,'89,ragama road,gampaha.','0765432198','gayani.wickramasinghe@company.com','Worker',2,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7c','Lahiru','Senanayake','1986-02-27','907654321V','Male','Married',2,'456,kandy road,kadawatha.','0718765432','lahiru.senanayake@company.com','Worker',4,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f8d','Saman','Silva','1978-11-20','976543219V','Male','Married',1,'21,maharagama road,nugegoda.','0723456789','saman.silva@company.com','Worker',3,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f9c','Amal','Perera','1975-05-16','987654321V','Male','Single',0,'123,malabe road,kottawa.','0711234567','amal.perera@company.com','Worker',2,1,NULL),('21b63c70-5c83-433b-9ab8-de8899d18854','Upuli','Jayasinghe','1960-01-24','969653320V','Female','Married',6,'91,Athurugiriya road,Malabe.','0752843628','Upuli.jupiter@company.com','Cleaner',2,1,NULL),('7364528d-ce36-4d7f-a0aa-7cd084c077f3','Umesha','Jayakody','1965-02-24','949654341V','Male','Single',0,'46,wakanda road,homagama.','0741234567','Umesha.jupiter@company.com','HR Manager',1,1,NULL),('7b163c45-ce7b-422f-93d9-d72abb4af5ae','Araliya','Perera','1964-01-27','989654321V','Male','Single',0,'489, parakrame road, kottawa.','0751204567','Araliya.jupiter@company.com','Software enginner',2,1,NULL),('e10bfb2f-9cb9-4278-ac8c-952ee4428f02','Christopher','Ranasinghe','1963-02-24','929054321V','Male','Married',2,'48, samagi road, Maharagema.','0751234567','Christopher.jupiter@company.com','HR assistent',1,1,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_of_the_month`
--

DROP TABLE IF EXISTS `employee_of_the_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_of_the_month` (
  `employee_id` varchar(40) DEFAULT NULL,
  `year` varchar(40) NOT NULL,
  `month` varchar(40) NOT NULL,
  PRIMARY KEY (`year`,`month`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_of_the_month_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_of_the_month`
--

LOCK TABLES `employee_of_the_month` WRITE;
/*!40000 ALTER TABLE `employee_of_the_month` DISABLE KEYS */;
INSERT INTO `employee_of_the_month` VALUES ('0ba6900a-c6bd-40ad-bd40-d335fbd42f7a','2024','10');
/*!40000 ALTER TABLE `employee_of_the_month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_position`
--

DROP TABLE IF EXISTS `employee_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_position` (
  `job_title` varchar(40) NOT NULL,
  `employee_status` varchar(40) NOT NULL,
  `pay_grade` int DEFAULT NULL,
  `basic_salary` decimal(6,2) NOT NULL,
  PRIMARY KEY (`job_title`,`employee_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_position`
--

LOCK TABLES `employee_position` WRITE;
/*!40000 ALTER TABLE `employee_position` DISABLE KEYS */;
INSERT INTO `employee_position` VALUES ('Accountant','Full-time',1,3000.00),('Cleaner','Part-time',3,3000.00),('HR assistent','Full-time',1,1500.00),('HR Manager','Full-time',1,5000.00),('QA Engineer','Full-time',1,3000.00),('Software enginner','Full-time',1,3000.00),('Worker','Full-time',2,3000.00);
/*!40000 ALTER TABLE `employee_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_count_record`
--

DROP TABLE IF EXISTS `leave_count_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_count_record` (
  `employee_id` varchar(40) NOT NULL,
  `leave_type_id` int DEFAULT NULL,
  `annual_leave_remaining` int DEFAULT NULL,
  `casual_leave_remaining` int DEFAULT NULL,
  `maternity_leave_remaining` int DEFAULT NULL,
  `nopay_leave_remaining` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `leave_type_id` (`leave_type_id`),
  CONSTRAINT `leave_count_record_ibfk_1` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_limit` (`leave_type_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `leave_count_record_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_count_record`
--

LOCK TABLES `leave_count_record` WRITE;
/*!40000 ALTER TABLE `leave_count_record` DISABLE KEYS */;
INSERT INTO `leave_count_record` VALUES ('0ba6900a-c6bd-40ad-bd40-d335fbd42f7a',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7b',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7c',2,15,5,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f8d',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f9c',2,15,10,0,7),('21b63c70-5c83-433b-9ab8-de8899d18854',3,10,5,0,8),('7364528d-ce36-4d7f-a0aa-7cd084c077f3',1,20,10,0,5),('7b163c45-ce7b-422f-93d9-d72abb4af5ae',1,20,10,0,5),('e10bfb2f-9cb9-4278-ac8c-952ee4428f02',1,20,10,0,5);
/*!40000 ALTER TABLE `leave_count_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_limit`
--

DROP TABLE IF EXISTS `leave_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_limit` (
  `leave_type_id` int NOT NULL AUTO_INCREMENT,
  `pay_grade` int NOT NULL,
  `annual_leave_count` int NOT NULL,
  `casual_leave_count` int NOT NULL,
  `maternity_leave_count` int NOT NULL,
  `nopay_leave_count` int NOT NULL,
  PRIMARY KEY (`leave_type_id`),
  UNIQUE KEY `pay_grade` (`pay_grade`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_limit`
--

LOCK TABLES `leave_limit` WRITE;
/*!40000 ALTER TABLE `leave_limit` DISABLE KEYS */;
INSERT INTO `leave_limit` VALUES (1,1,20,10,0,5),(2,2,15,10,0,7),(3,3,10,5,0,8);
/*!40000 ALTER TABLE `leave_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_request`
--

DROP TABLE IF EXISTS `leave_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_request` (
  `leave_request_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(40) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `leave_start_date` date DEFAULT NULL,
  `period_of_absence` int DEFAULT NULL,
  `reason_for_absence` varchar(1000) DEFAULT NULL,
  `type_of_leave` varchar(40) DEFAULT NULL,
  `request_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`leave_request_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `leave_request_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `leave_request_chk_1` CHECK ((`request_status` in (_utf8mb4'P',_utf8mb4'R',_utf8mb4'A'))),
  CONSTRAINT `leave_request_chk_2` CHECK ((`type_of_leave` in (_utf8mb4'annual',_utf8mb4'casual',_utf8mb4'maternity',_utf8mb4'nopay')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_request`
--

LOCK TABLES `leave_request` WRITE;
/*!40000 ALTER TABLE `leave_request` DISABLE KEYS */;
INSERT INTO `leave_request` VALUES (1,'0ba6900a-c6bd-40ad-bd40-d335fbd42f7c','2024-10-27','2024-10-09',5,'Medical Leave','casual','A');
/*!40000 ALTER TABLE `leave_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `organization_id` int NOT NULL AUTO_INCREMENT,
  `custom_employee_record_id` int DEFAULT NULL,
  `field` varchar(40) DEFAULT NULL,
  `main_branch_id` int DEFAULT NULL,
  PRIMARY KEY (`organization_id`),
  KEY `main_branch_id` (`main_branch_id`),
  KEY `custom_employee_record_id` (`custom_employee_record_id`),
  CONSTRAINT `organization_ibfk_1` FOREIGN KEY (`main_branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `organization_ibfk_2` FOREIGN KEY (`custom_employee_record_id`) REFERENCES `custom_employee_record` (`custom_employee_record_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,1,'organization_1',2);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `show_branchs`
--

DROP TABLE IF EXISTS `show_branchs`;
/*!50001 DROP VIEW IF EXISTS `show_branchs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `show_branchs` AS SELECT 
 1 AS `branch_id`,
 1 AS `branch_name`,
 1 AS `branch_address`,
 1 AS `organization_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `show_departments`
--

DROP TABLE IF EXISTS `show_departments`;
/*!50001 DROP VIEW IF EXISTS `show_departments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `show_departments` AS SELECT 
 1 AS `department_id`,
 1 AS `department_name`,
 1 AS `budget`,
 1 AS `department_head_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `show_emergency_contact`
--

DROP TABLE IF EXISTS `show_emergency_contact`;
/*!50001 DROP VIEW IF EXISTS `show_emergency_contact`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `show_emergency_contact` AS SELECT 
 1 AS `emergency_contact_id`,
 1 AS `name`,
 1 AS `nic`,
 1 AS `address`,
 1 AS `emergency_contact_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `show_employee`
--

DROP TABLE IF EXISTS `show_employee`;
/*!50001 DROP VIEW IF EXISTS `show_employee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `show_employee` AS SELECT 
 1 AS `employee_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `birthday`,
 1 AS `employee_nic`,
 1 AS `gender`,
 1 AS `marital_status`,
 1 AS `number_of_dependents`,
 1 AS `address`,
 1 AS `contact_number`,
 1 AS `business_email`,
 1 AS `job_title`,
 1 AS `department_id`,
 1 AS `branch_id`,
 1 AS `profile_photo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `show_employee_position`
--

DROP TABLE IF EXISTS `show_employee_position`;
/*!50001 DROP VIEW IF EXISTS `show_employee_position`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `show_employee_position` AS SELECT 
 1 AS `job_title`,
 1 AS `employee_status`,
 1 AS `pay_grade`,
 1 AS `basic_salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `show_leave_limit`
--

DROP TABLE IF EXISTS `show_leave_limit`;
/*!50001 DROP VIEW IF EXISTS `show_leave_limit`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `show_leave_limit` AS SELECT 
 1 AS `leave_type_id`,
 1 AS `pay_grade`,
 1 AS `annual_leave_count`,
 1 AS `casual_leave_count`,
 1 AS `maternity_leave_count`,
 1 AS `nopay_leave_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `show_organization`
--

DROP TABLE IF EXISTS `show_organization`;
/*!50001 DROP VIEW IF EXISTS `show_organization`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `show_organization` AS SELECT 
 1 AS `organization_id`,
 1 AS `custom_employee_record_id`,
 1 AS `field`,
 1 AS `main_branch_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `show_supervisors`
--

DROP TABLE IF EXISTS `show_supervisors`;
/*!50001 DROP VIEW IF EXISTS `show_supervisors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `show_supervisors` AS SELECT 
 1 AS `supervisor_id`,
 1 AS `first_name`,
 1 AS `last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisor` (
  `employee_id` varchar(40) NOT NULL,
  `supervisor_id` varchar(40) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`employee_id`,`supervisor_id`),
  CONSTRAINT `supervisor_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` VALUES ('0ba6900a-c6bd-40ad-bd40-d335fbd42f7a','e10bfb2f-9cb9-4278-ac8c-952ee4428f02','2024-10-27'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7b','7b163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-27'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7c','7364528d-ce36-4d7f-a0aa-7cd084c077f3','2024-10-27'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f8d','7364528d-ce36-4d7f-a0aa-7cd084c077f3','2024-10-27'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f9c','7b163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-27'),('21b63c70-5c83-433b-9ab8-de8899d18854','7364528d-ce36-4d7f-a0aa-7cd084c077f3','2024-10-27'),('7b163c45-ce7b-422f-93d9-d72abb4af5ae','e10bfb2f-9cb9-4278-ac8c-952ee4428f02','2024-10-27');
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_access`
--

DROP TABLE IF EXISTS `user_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_access` (
  `username` varchar(40) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_supervisor` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `user_access_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_access_chk_1` CHECK ((`is_admin` in (true,false))),
  CONSTRAINT `user_access_chk_2` CHECK ((`is_supervisor` in (true,false)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access`
--

LOCK TABLES `user_access` WRITE;
/*!40000 ALTER TABLE `user_access` DISABLE KEYS */;
INSERT INTO `user_access` VALUES ('Amal',0,0),('Araliya',0,1),('Christopher',1,1),('Gayani',0,0),('Kamal',0,0),('Lahiru',0,0),('Saman',0,0),('Umesha',1,1),('Upuli',0,0);
/*!40000 ALTER TABLE `user_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `employee_id` varchar(40) DEFAULT NULL,
  `last_login_date` date DEFAULT NULL,
  PRIMARY KEY (`username`,`password`),
  UNIQUE KEY `employee_id` (`employee_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Amal','$2a$12$xazBvGFK56iB5nJJ8K/FvO8uScRbaf4eSLTMD09f2h.fOxQR5M9q2','0ba6900a-c6bd-40ad-bd40-d335fbd42f9c','2024-10-28'),('Araliya','Araliya','7b163c45-ce7b-422f-93d9-d72abb4af5ae',NULL),('Christopher','Christopher','e10bfb2f-9cb9-4278-ac8c-952ee4428f02',NULL),('Gayani','Gayani','0ba6900a-c6bd-40ad-bd40-d335fbd42f7b',NULL),('Kamal','Kamal','0ba6900a-c6bd-40ad-bd40-d335fbd42f7a',NULL),('Lahiru','Lahiru','0ba6900a-c6bd-40ad-bd40-d335fbd42f7c',NULL),('Saman','Saman','0ba6900a-c6bd-40ad-bd40-d335fbd42f8d',NULL),('Umesha','$2a$12$C63JIvPI4QUY6rw33cS9wuqo9QOSCp9.XWvhRdRuow8hOqTLZzt5a','7364528d-ce36-4d7f-a0aa-7cd084c077f3','2024-10-29'),('Upuli','Upuli','21b63c70-5c83-433b-9ab8-de8899d18854',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hrms'
--
/*!50003 DROP FUNCTION IF EXISTS `generate_employee_of_the_month` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generate_employee_of_the_month`() RETURNS varchar(40) CHARSET utf8mb4
    DETERMINISTIC
begin
    declare employee_of_the_month varchar(40);

	select employee_id
    into employee_of_the_month
	from leave_count_record
    where employee_id not in (select supervisor_id from supervisor )
	order by (annual_leave_remaining + casual_leave_remaining + maternity_leave_remaining + nopay_leave_remaining) desc
	limit 1;
	
    return employee_of_the_month;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `generate_supervisor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generate_supervisor`() RETURNS varchar(40) CHARSET utf8mb4
    DETERMINISTIC
begin
    declare p_supervisor_id varchar(40);

	select users.employee_id
    into p_supervisor_id
	from users
	join user_access using(username)
	left join supervisor on (users.employee_id = supervisor.supervisor_id)
	where user_access.is_supervisor = true
	group by users.employee_id
	order by count(supervisor.employee_id) asc
	limit 1;

    return p_supervisor_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_employee`(
    in employee_id varchar(40),
    in first_name varchar(40),
    in last_name varchar(40),
    in birthday date,
    in nic varchar(40),
    in gender varchar(40),
    in marital_status varchar(40),
    in number_of_dependents int,
    in address varchar(40),
    in contact_number varchar(40),
    in business_email varchar(40),
    in p_job_title varchar(40),
	in p_employee_status varchar(40),
    in dept_name varchar(40),
    in brch_name varchar(40),
    in p_profile_photo varchar(40),
	in emergency_contact_name varchar(40),
	in emergency_contact_nic varchar(40),
	in emergency_contact_address varchar(40),
    in emergency_contact_number varchar(40)
)
begin
    declare p_position_id int;
    declare p_department_id int;
    declare p_branch_id int;
	declare p_pay_grade int;
    declare p_annual_leave_count int;
    declare p_casual_leave_count int;
    declare p_maternity_leave_count int;
    declare p_nopay_leave_count int;
    declare p_leave_type_id int;
    
    select department_id
    into p_department_id
    from department
    where department_name = dept_name;

    select branch_id
    into p_branch_id
    from branch
    where branch_name = brch_name;
    
    select pay_grade
    into p_pay_grade
    from employee_position
    where job_title = p_job_title
    and employee_status = p_employee_status ;
	
    select annual_leave_count
    into p_annual_leave_count
    from leave_limit
    where pay_grade = p_pay_grade;
    
    select casual_leave_count
    into p_casual_leave_count
    from leave_limit
    where pay_grade = p_pay_grade;
    
    select maternity_leave_count
    into p_maternity_leave_count
    from leave_limit
    where pay_grade = p_pay_grade;
    
    select nopay_leave_count
    into p_nopay_leave_count
    from leave_limit
    where pay_grade = p_pay_grade;
    
    select leave_type_id
    into p_leave_type_id
    from leave_limit
    where pay_grade = p_pay_grade;
    
    insert into employee (
        employee_id, first_name,last_name, birthday, employee_nic, gender, marital_status, number_of_dependents,
        address, contact_number,business_email,job_title,department_id, branch_id, profile_photo
    ) 
    values (
        employee_id,first_name,last_name, birthday, nic, gender, marital_status, number_of_dependents,
        address, contact_number,business_email, p_job_title,p_department_id, p_branch_id,p_profile_photo
    );
    insert into emergency_contact (emergency_contact_id,name, nic, address, emergency_contact_number)
    values (employee_id,emergency_contact_name,emergency_contact_nic,emergency_contact_address, emergency_contact_number);
    
    insert into leave_count_record (employee_id, leave_type_id, annual_leave_remaining, casual_leave_remaining, maternity_leave_remaining, nopay_leave_remaining)
	values(employee_id, p_leave_type_id, p_annual_leave_count, p_casual_leave_count, p_maternity_leave_count, p_nopay_leave_count);
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_organization` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_organization`(
    in p_field varchar(40),
    in p_main_branch varchar(40)
)
begin    
	declare p_branch_id  varchar(40);
    
	select branch_id
    into p_branch_id
    from branch
    where branch_name = p_main_branch;
    
    insert into organization(field,main_branch_id) values(p_field,p_branch_id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `birthday_employees_today` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `birthday_employees_today`()
begin
    select first_name,last_name
    from employee 
    where day(birthday) = day(curdate())
    and month(birthday) = month(curdate());
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_leave_request` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_leave_request`(
    in p_employee_id varchar(40),
    in p_leave_start_date date,
    in p_period_of_absence varchar(40),
    in p_reason_for_absence varchar(40),
    in p_type_of_leave varchar(40)
)
begin
	declare curr_date date;
    declare  p_supervisor_id varchar(40);
    declare leave_remaining varchar(40);
    
	SET curr_date = CURDATE();
    
    select supervisor_id
    into  p_supervisor_id
    from supervisor 
    where employee_id = p_employee_id;
    
    
    if p_type_of_leave = 'anuual' and (select annual_leave_remaining from leave_count_record where employee_id = p_employee_id)>p_period_of_absence then
		    insert into leave_request (employee_id,request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
			values(p_employee_id,curr_date, p_leave_start_date , p_period_of_absence, p_reason_for_absence,p_type_of_leave, 'P');
    elseif p_type_of_leave = 'casual' and (select casual_leave_remaining from leave_count_record where employee_id = p_employee_id)>p_period_of_absence then
			insert into leave_request (employee_id,request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
			values(p_employee_id,curr_date, p_leave_start_date , p_period_of_absence, p_reason_for_absence,p_type_of_leave, 'P');
    elseif p_type_of_leave = 'maternity' and (select maternity_leave_remaining from leave_count_record where employee_id = p_employee_id)>p_period_of_absence then
			insert into leave_request (employee_id,request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
			values(p_employee_id,curr_date, p_leave_start_date , p_period_of_absence, p_reason_for_absence,p_type_of_leave, 'P');
	elseif p_type_of_leave = 'nopay' and (select nopay_leave_remaining from leave_count_record where employee_id = p_employee_id)>p_period_of_absence then
			insert into leave_request (employee_id, request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
			values(p_employee_id,curr_date, p_leave_start_date , p_period_of_absence, p_reason_for_absence,p_type_of_leave, 'P');
    end if;
	

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_user_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_user_account`(
    in username varchar(40),
    in password varchar(255),
    in p_employee_id varchar(40),
    in access_level varchar(40)
)
begin
    if access_level = 'Admin' then
        insert into users (username, password, employee_id)
		values (username, password, p_employee_id);
        insert into user_access (username, is_admin,is_supervisor)values (username, true,true);
    elseif access_level = 'Supervisor' then
		insert into users (username, password, employee_id)
		values (username, password, p_employee_id);
        insert into user_access (username, is_admin,is_supervisor)values (username, false,true);
        insert into supervisor(supervisor_id,employee_id,date) values((select employee_id from employee where job_title = 'HR assistent'), p_employee_id,curdate());
    else
        insert into users (username, password, employee_id)
		values (username, password, p_employee_id);
        insert into user_access (username, is_admin,is_supervisor)values (username,false,false);
        insert into supervisor (supervisor_id,employee_id,date)values(generate_supervisor(),p_employee_id,curdate());
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customize_employee_attribute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customize_employee_attribute`(
    in p_employee_id varchar(40),
    in p_custom_attribute_name varchar(40),
    in p_value varchar(40)
)
begin    
	declare p_custom_attribute_id  varchar(40);
    
	select custom_employee_record_id
    into p_custom_attribute_id
    from custom_employee_record
    where custom_attribute_name = p_custom_attribute_name;
    
    insert into custom_attribute(value,employee_id) values(p_value,p_employee_id);
    update custom_employee_record set custom_attribute_id = (select custom_attribute_id from custom_attribute order by custom_attribute_id desc limit 1)
    where custom_employee_record_id = p_custom_attribute_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customize_employee_record` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customize_employee_record`(
    in p_organization varchar(40),
    in p_custom_attribute_name varchar(40)
)
begin    
	declare p_organization_id  varchar(40);
    
	select organization_id
    into p_organization_id
    from organization
    where field = p_organization;
    
    insert into custom_employee_record(custom_attribute_name) values(p_custom_attribute_name);
    update organization set  custom_employee_record_id = (select custom_employee_record_id from custom_employee_record order by custom_employee_record_id desc limit 1)
    where organization_id =p_organization_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_employee`(
    in p_employee_id varchar(40),
    in d_employee_id varchar(40)
)
begin
	if (select is_admin from user_access where username = (select username from users where employee_id= p_employee_id limit 1)) = true then
		delete from employee where employee_id = d_employee_id;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_request` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_request`(
    in p_leave_id varchar(40)
)
begin    
	delete from leave_request where leave_request_id =p_leave_id and request_status = 'P';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employees_by_gender_presentages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employees_by_gender_presentages`()
begin
    declare count_of_employee int;
	select count(employee.employee_id) 
	into count_of_employee
	from employee ;
    select gender,count(employee.employee_id)/count_of_employee as presentage_by_gender
    from employee 
    group by gender;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employees_by_pay_grade_presentages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employees_by_pay_grade_presentages`()
begin
	declare count_of_employee int;
	select count(employee.employee_id) 
	into count_of_employee
	from employee ;
    select employee_position.pay_grade,count(employee.employee_id)/count_of_employee as presentage_by_pay_grade
    from employee 
    join employee_position using(job_title)
    group by employee_position.pay_grade;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employees_by_role_presentages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employees_by_role_presentages`()
begin
	declare count_of_employee int;
	select count(employee.employee_id) 
	into count_of_employee
	from employee ;
    select employee_position.job_title,count(employee.employee_id)/count_of_employee as presentage_by_role
    from employee 
    join employee_position using (job_title)
    group by employee_position.job_title;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employee_by_department_presentages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_by_department_presentages`()
begin
	declare count_of_employee int;
	select count(employee.employee_id) 
	into count_of_employee
	from employee ;
    select department.department_name , count(employee.employee_id)/count_of_employee as presentage_by_department
    from employee 
    join department using (department_id)
    group  by department.department_name;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employee_leave_details_for_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_leave_details_for_admin`()
BEGIN
    SELECT 
        leave_request.leave_request_id,
        employee.employee_id,
        employee.first_name,
        employee.last_name,
        employee.gender,
        leave_request.request_status,
        leave_request.leave_start_date,
        leave_request.period_of_absence,
        leave_request.request_date,
        leave_request.type_of_leave,
        leave_request.reason_for_absence
    FROM 
        employee
    JOIN 
        leave_request USING (employee_id)
    ORDER BY 
        request_status;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employee_of_the_month` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_of_the_month`()
begin
    if not exists (
        select 1 
        from employee_of_the_month 
        where year = year(curdate()) 
        and month = month(curdate())
    ) then
        insert into employee_of_the_month(employee_id, year, month)
        values (generate_employee_of_the_month(), year(curdate()), month(curdate()));
    end if;
    
    select employee.first_name, employee.last_name, employee_of_the_month.year, employee_of_the_month.month
    from employee_of_the_month
    left join employee using (employee_id)
    where employee_of_the_month.year = year(curdate()) 
    and employee_of_the_month.month = month(curdate());
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employee_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_team`(
    in p_supervisor_id varchar(40)
)
begin    
	select employee_id,first_name,last_name
    from supervisor
    join employee  using (employee_id)
    where supervisor_id =p_supervisor_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `evaluate_leave_request` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `evaluate_leave_request`(
    in p_leave_id varchar(40),
    in supervisor_replay varchar(40)
)
begin    
	declare p_type_of_leave varchar(40);
    declare no_of_days int;
    declare p_employee_id varchar(40);
    
	select employee_id
    into p_employee_id
    from leave_request
    where leave_request_id = p_leave_id;
    
    select type_of_leave
    into p_type_of_leave
    from leave_request
    where leave_request_id = p_leave_id;
    
    select period_of_absence
    into no_of_days
    from leave_request
    where leave_request_id = p_leave_id;
    
    update leave_request
    set request_status = supervisor_replay
    where employee_id = p_employee_id;
    
     if p_type_of_leave = 'anuual' and supervisor_replay = 'A' then
		update leave_count_record
        set annual_leave_remaining = annual_leave_remaining - no_of_days
        where employee_id = p_employee_id;
        
    elseif p_type_of_leave = 'casual' and supervisor_replay = 'A' then
		update leave_count_record
        set casual_leave_remaining = casual_leave_remaining - no_of_days
        where employee_id = p_employee_id;
    
    elseif p_type_of_leave = 'maternity' and supervisor_replay = 'A' then
		update leave_count_record
        set maternity_leave_remaining = maternity_leave_remaining - no_of_days
        where employee_id = p_employee_id;
    
	elseif p_type_of_leave = 'nopay' and supervisor_replay = 'A' then
    update leave_count_record
        set nopay_leave_remaining = nopay_leave_remaining - no_of_days
        where employee_id = p_employee_id;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_employee_id_by_username` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employee_id_by_username`(
    in p_username varchar(40)
)
begin    
    select employee_id
	from users
    where username = p_username;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_fulltime_employee_count_presentage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_fulltime_employee_count_presentage`()
begin
  declare count_of_employee int;
  select count(employee.employee_id) 
  into count_of_employee
  from employee ;
  select count(employee.employee_id) as full_time_employee_count , count(employee.employee_id)/count_of_employee as full_time_employee_presentage
  from employee 
  inner join employee_position using(job_title)
  where employee_position.employee_status = 'full-time';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_leave_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_leave_count`()
begin
  select count(leave_request_id)
  from leave_request 
  where request_status = 'A'  
  and (leave_start_date <= current_date())
  and (date_add(leave_start_date, interval period_of_absence day) > current_date());
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_parttime_employee_count_presentage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_parttime_employee_count_presentage`()
begin
  declare count_of_employee int;
  select count(employee.employee_id) 
  into count_of_employee
  from employee ;
  select count(employee.employee_id) as part_time_employee_count , count(employee.employee_id)/count_of_employee as part_time_employee_presentage
  from employee 
  inner join employee_position using(job_title)
  where employee_position.employee_status = 'part-time';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `is_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `is_admin`(
    in p_username varchar(40)
)
begin    
	select is_admin
    from user_access
    where username = p_username;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `is_supervisor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `is_supervisor`(IN p_username VARCHAR(40))
BEGIN
    SELECT is_supervisor
    FROM user_access
    WHERE username = p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `last_month_leave_presentage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `last_month_leave_presentage`()
begin
	declare count_of_employee int;
	select count(employee.employee_id) 
	into count_of_employee
	from employee ;
    select leave_request.leave_start_date,count(employee.employee_id)/count_of_employee as presentage_by_date_of_leave_request
    from employee 
    join leave_request using(employee_id)
    where leave_request.request_status = 'A' 
    and leave_request.leave_start_date >= curdate() - interval 1 month
    group by leave_request.leave_start_date;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login_update`(
    in p_username varchar(40)
)
begin    
	update users
    set last_login_date = current_date()
    where username = p_username;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `role_checker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `role_checker`(
    in p_username varchar(40) 
)
begin
    select 
        case 
            when is_admin = 1 and is_supervisor = 1 then 'admin'
            when is_admin = 0 and is_supervisor = 1 then 'supervisor'
            when is_admin = 0 and is_supervisor = 0 then 'employee'
            else 'unknown'
        end as user_role
    from 
        user_access
    where 
        username = p_username;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_employee_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_employee_details`(IN p_employee_id VARCHAR(40))
BEGIN
    SELECT
        employee.employee_id,
        employee.first_name,
        employee.last_name,
        employee.birthday,
        employee.employee_nic AS 'nic',
        employee.gender,
        employee.marital_status,
        employee.number_of_dependents,
        employee.address,
        employee.contact_number,
        employee.business_email,
        employee.job_title,
        employee_position.employee_status,
        department.department_name,
        branch.branch_name,
        employee.profile_photo,
        emergency_contact.name AS 'emergency_contact_name',
        emergency_contact.nic AS 'emergency_contact_nic',
        emergency_contact.address AS 'emergency_contact_address',
        emergency_contact.emergency_contact_number,
        leave_count_record.annual_leave_remaining,
        leave_count_record.casual_leave_remaining,
        leave_count_record.maternity_leave_remaining,
        leave_count_record.nopay_leave_remaining
    FROM
        employee
    LEFT JOIN
        department USING (department_id)
    LEFT JOIN
        branch USING (branch_id)
    LEFT JOIN
        leave_count_record USING (employee_id)
    LEFT JOIN
        emergency_contact ON employee.employee_id = emergency_contact.emergency_contact_id
    LEFT JOIN
        employee_position USING (job_title)
    WHERE
        employee.employee_id = p_employee_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_leave_request` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_leave_request`(
    in p_supervisor_id varchar(40)
)
begin    
    select *
	from leave_request
    left join supervisor using (employee_id)
    where supervisor.supervisor_id = p_supervisor_id
	and leave_request.request_status = 'P';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_employee`(
    in p_employee_id varchar(40),
    in p_first_name varchar(40),
    in p_last_name varchar(40),
    in p_birthday date,
    in p_nic varchar(40),
    in p_gender varchar(40),
    in p_marital_status varchar(40),
    in p_number_of_dependents int,
    in p_address varchar(40),
    in p_contact_number varchar(40),
    in p_business_email varchar(40),
    in p_job_title varchar(40),
    in p_employee_status varchar(40),
    in p_dept_name varchar(40),
    in p_brch_name varchar(40),
    in p_profile_photo varchar(40),
    in p_emergency_contact_name varchar(40),
    in p_emergency_contact_nic varchar(40),
    in p_emergency_contact_address varchar(40),
    in p_emergency_contact_number varchar(40)
)
begin
    declare p_department_id int;
    declare p_branch_id int;
    declare p_pay_grade int;
    declare p_leave_type_id int;

    select department_id
    into p_department_id
    from department
    where department_name = p_dept_name;

    select branch_id
    into p_branch_id
    from branch
    where branch_name = p_brch_name;

    select pay_grade
    into p_pay_grade
    from employee_position
    where job_title = p_job_title
    and employee_status = p_employee_status;

    select leave_type_id
    into p_leave_type_id
    from leave_limit
    where pay_grade = p_pay_grade;

    update employee
    set
        first_name = p_first_name,
        last_name = p_last_name,
        birthday = p_birthday,
        employee_nic = p_nic,
        gender = p_gender,
        marital_status = p_marital_status,
        number_of_dependents = p_number_of_dependents,
        address = p_address,
        contact_number = p_contact_number,
        business_email = p_business_email,
        job_title = p_job_title,
        department_id = p_department_id,
        branch_id = p_branch_id,
        profile_photo = p_profile_photo
    where employee_id = p_employee_id;

    update emergency_contact
    set
        name = p_emergency_contact_name,
        nic = p_emergency_contact_nic,
        address = p_emergency_contact_address,
        emergency_contact_number = p_emergency_contact_number
    where emergency_contact_id = p_employee_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `show_branchs`
--

/*!50001 DROP VIEW IF EXISTS `show_branchs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_branchs` AS select `branch`.`branch_id` AS `branch_id`,`branch`.`branch_name` AS `branch_name`,`branch`.`branch_address` AS `branch_address`,`branch`.`organization_id` AS `organization_id` from `branch` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_departments`
--

/*!50001 DROP VIEW IF EXISTS `show_departments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_departments` AS select `department`.`department_id` AS `department_id`,`department`.`department_name` AS `department_name`,`department`.`budget` AS `budget`,`department`.`department_head_id` AS `department_head_id` from `department` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_emergency_contact`
--

/*!50001 DROP VIEW IF EXISTS `show_emergency_contact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_emergency_contact` AS select `emergency_contact`.`emergency_contact_id` AS `emergency_contact_id`,`emergency_contact`.`name` AS `name`,`emergency_contact`.`nic` AS `nic`,`emergency_contact`.`address` AS `address`,`emergency_contact`.`emergency_contact_number` AS `emergency_contact_number` from `emergency_contact` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_employee`
--

/*!50001 DROP VIEW IF EXISTS `show_employee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_employee` AS select `employee`.`employee_id` AS `employee_id`,`employee`.`first_name` AS `first_name`,`employee`.`last_name` AS `last_name`,`employee`.`birthday` AS `birthday`,`employee`.`employee_nic` AS `employee_nic`,`employee`.`gender` AS `gender`,`employee`.`marital_status` AS `marital_status`,`employee`.`number_of_dependents` AS `number_of_dependents`,`employee`.`address` AS `address`,`employee`.`contact_number` AS `contact_number`,`employee`.`business_email` AS `business_email`,`employee`.`job_title` AS `job_title`,`employee`.`department_id` AS `department_id`,`employee`.`branch_id` AS `branch_id`,`employee`.`profile_photo` AS `profile_photo` from `employee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_employee_position`
--

/*!50001 DROP VIEW IF EXISTS `show_employee_position`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_employee_position` AS select `employee_position`.`job_title` AS `job_title`,`employee_position`.`employee_status` AS `employee_status`,`employee_position`.`pay_grade` AS `pay_grade`,`employee_position`.`basic_salary` AS `basic_salary` from `employee_position` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_leave_limit`
--

/*!50001 DROP VIEW IF EXISTS `show_leave_limit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_leave_limit` AS select `leave_limit`.`leave_type_id` AS `leave_type_id`,`leave_limit`.`pay_grade` AS `pay_grade`,`leave_limit`.`annual_leave_count` AS `annual_leave_count`,`leave_limit`.`casual_leave_count` AS `casual_leave_count`,`leave_limit`.`maternity_leave_count` AS `maternity_leave_count`,`leave_limit`.`nopay_leave_count` AS `nopay_leave_count` from `leave_limit` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_organization`
--

/*!50001 DROP VIEW IF EXISTS `show_organization`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_organization` AS select `organization`.`organization_id` AS `organization_id`,`organization`.`custom_employee_record_id` AS `custom_employee_record_id`,`organization`.`field` AS `field`,`organization`.`main_branch_id` AS `main_branch_id` from `organization` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_supervisors`
--

/*!50001 DROP VIEW IF EXISTS `show_supervisors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_supervisors` AS select distinct `supervisor`.`supervisor_id` AS `supervisor_id`,`employee`.`first_name` AS `first_name`,`employee`.`last_name` AS `last_name` from (`supervisor` left join `employee` on((`supervisor`.`supervisor_id` = `employee`.`employee_id`))) */;
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

-- Dump completed on 2024-10-29 17:18:42
