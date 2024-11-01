CREATE DATABASE  IF NOT EXISTS `hrms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hrms`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: hrms
-- ------------------------------------------------------
-- Server version	8.0.37

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
  CONSTRAINT `emergency_contact_ibfk_1` FOREIGN KEY (`emergency_contact_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_contact`
--

LOCK TABLES `emergency_contact` WRITE;
/*!40000 ALTER TABLE `emergency_contact` DISABLE KEYS */;
INSERT INTO `emergency_contact` VALUES ('0ba6900a-c6bd-40ad-bd40-d335fbd42f7a','Ranjith','902345671V','10,borella road,colombo.','0772345678'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7b','Chandana','952876543V','89,ragama road,gampaha.','0778765432'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7c','Ruwan','922765432V','456,kandy road,kadawatha.','0787654321'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7d','Kamal','922765433V','123, colombo road, kandy.','0787654331'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7e','Rohan','922765434V','789, galle road, matara.','0787654341'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7f','Nuwan','922765435V','456, negombo road, chilaw.','0787654351'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7g','Saman','922765436V','123, kurunegala road, kurunegala.','0787654361'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7h','Ranjith','922765437V','456, badulla road, badulla.','0787654371'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7i','Sunil','922765438V','789, trincomalee road, trincomalee.','0787654381'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7j','Kumara','922765439V','123, anuradhapura road, anuradhapura.','0787654391'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7k','Nimal','922765440V','456, batticaloa road, batticaloa.','0787654401'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7l','Ruwan','922765441V','789, jaffna road, jaffna.','0787654411'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f8b','Vibawa','922280690V','400,piliyandala road,pannipitiya.','0711214680'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f8d','Nimal','912345679V','21,maharagama road,nugegoda.','0771234569'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f9c','Saman','922234567V','123,malabe road,kottawa.','0719876543'),('0ca6900a-c6bd-40ad-bd40-d335fbd42f7v','Nimal','922765451V','123, batticaloa road, batticaloa.','0787654511'),('1ba6900a-c6bd-40ad-bd40-d335fbd42f7m','Ruwan','922765442V','123, gampaha road, gampaha.','0787654421'),('1ca6900a-c6bd-40ad-bd40-d335fbd42f7w','Ruwan','922765452V','456, galle road, galle.','0787654521'),('21b63c70-5c83-433b-9ab8-de8899d18854','Namal','912340690V','91,Athurugiriya road,Malabe.','0711234580'),('2ba6900a-c6bd-40ad-bd40-d335fbd42f7n','Kamal','922765443V','456, colombo road, colombo.','0787654431'),('2ca6900a-c6bd-40ad-bd40-d335fbd42f7x','Ranjith','922765453V','789, negombo road, negombo.','0787654531'),('3ba6900a-c6bd-40ad-bd40-d335fbd42f7o','Nimal','922765444V','789, kandy road, kandy.','0787654441'),('3ca6900a-c6bd-40ad-bd40-d335fbd42f7y','Kamal','922765454V','123, kurunegala road, kurunegala.','0787654541'),('4ba6900a-c6bd-40ad-bd40-d335fbd42f7p','Ranjith','922765445V','123, negombo road, negombo.','0787654451'),('4ca6900a-c6bd-40ad-bd40-d335fbd42f7z','Nimal','922765455V','456, colombo road, colombo.','0787654551'),('5ba6900a-c6bd-40ad-bd40-d335fbd42f7q','Saman','922765446V','456, kurunegala road, kurunegala.','0787654461'),('5ca6900a-c6bd-40ad-bd40-d335fbd42f7a','Ranjith','922765456V','789, kandy road, kandy.','0787654561'),('6ba6900a-c6bd-40ad-bd40-d335fbd42f7r','Ruwan','922765447V','789, jaffna road, jaffna.','0787654471'),('7364528d-ce36-4d7f-a0aa-7cd084c077f3','Sahan','992912190V','46,wakanda road,homagama.','0712340123'),('7b163c45-ce7b-422f-93d9-d72abb4af5ae','Kumara','923222222V','489, parakrame road, kottawa.','0718152643'),('7ba6900a-c6bd-40ad-bd40-d335fbd42f7s','Ranjith','922765448V','123, badulla road, badulla.','0787654481'),('8ba6900a-c6bd-40ad-bd40-d335fbd42f7t','Sunil','922765449V','456, trincomalee road, trincomalee.','0787654491'),('8c163c45-ce7b-422f-93d9-d72abb4af5ae','Kumara','923222223V','490, parakrame road, kottawa.','0718152644'),('9ba6900a-c6bd-40ad-bd40-d335fbd42f7u','Kumara','922765450V','789, anuradhapura road, anuradhapura.','0787654501'),('9d163c45-ce7b-422f-93d9-d72abb4af5ae','Kumara','923222224V','491, parakrame road, kottawa.','0718152645'),('ad163c45-ce7b-422f-93d9-d72ab74af5ae','Kumara','923222225V','492, parakrame road, kottawa.','0718152646'),('e10bfb2f-9cb9-4278-ac8c-952ee4428f02','Shiranshi','992919190V','48, samagi road, Maharagema.','0710023452');
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
INSERT INTO `employee` VALUES ('0ba6900a-c6bd-40ad-bd40-d335fbd42f7a','Kamal','Fernando','1980-07-15','954321876V','Male','Single',0,'10,borella road,colombo.','0709876543','kamal.fernando@company.com','Worker',1,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7b','Gayani','Wickramasinghe','1982-03-12','948765432V','Female','Single',0,'89,ragama road,gampaha.','0765432198','gayani.wickramasinghe@company.com','Worker',2,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7c','Lahiru','Senanayake','1986-02-27','907654321V','Male','Married',2,'456,kandy road,kadawatha.','0718765432','lahiru.senanayake@company.com','Worker',4,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7d','Nimal','Perera','1985-03-15','907654322V','Male','Single',0,'123, colombo road, kandy.','0718765433','nimal.perera@company.com','Worker',4,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7e','Sunil','Fernando','1984-04-10','907654323V','Male','Married',1,'789, galle road, matara.','0718765434','sunil.fernando@company.com','Worker',4,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7f','Kumara','Silva','1983-05-05','907654324V','Male','Single',0,'456, negombo road, chilaw.','0718765435','kumara.silva@company.com','Worker',4,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7g','Ruwan','Jayasinghe','1982-06-20','907654325V','Male','Married',3,'123, kurunegala road, kurunegala.','0718765436','ruwan.jayasinghe@company.com','Worker',4,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7h','Chandana','Wijesinghe','1981-07-25','907654326V','Male','Single',0,'456, badulla road, badulla.','0718765437','chandana.wijesinghe@company.com','Worker',4,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7i','Mahesh','Gunasekara','1980-08-30','907654327V','Male','Married',2,'789, trincomalee road, trincomalee.','0718765438','mahesh.gunasekara@company.com','Worker',4,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7j','Suresh','Bandara','1979-09-15','907654328V','Male','Single',0,'123, anuradhapura road, anuradhapura.','0718765439','suresh.bandara@company.com','Worker',4,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7k','Ranjith','Perera','1978-10-10','907654329V','Male','Married',1,'456, batticaloa road, batticaloa.','0718765440','ranjith.perera@company.com','Worker',4,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7l','Gayan','Senarath','1977-11-05','907654330V','Male','Single',0,'789, jaffna road, jaffna.','0718765441','gayan.senarath@company.com','Worker',4,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f8b','Nayana','Jayarathna','1968-01-24','989653329V','Female','Single',0,'400,piliyandala road,pannipitiya.','0751288490','Aayana.jupiter@company.com','Worker',2,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f8d','Saman','Silva','1978-11-20','976543219V','Male','Married',1,'21,maharagama road,nugegoda.','0723456789','saman.silva@company.com','Worker',3,1,NULL),('0ba6900a-c6bd-40ad-bd40-d335fbd42f9c','Amal','Perera','1975-05-16','987654321V','Male','Single',0,'123,malabe road,kottawa.','0711234567','amal.perera@company.com','Worker',2,1,NULL),('0ca6900a-c6bd-40ad-bd40-d335fbd42f7v','Ranjithma','Bandara','1990-05-30','907654340V','Male','Married',1,'123, batticaloa road, batticaloa.','0718765451','ranjith.bandara@company.com','Worker',4,1,NULL),('1ba6900a-c6bd-40ad-bd40-d335fbd42f7m','Kevin','Wijeratne','1981-08-15','907654331V','Male','Single',0,'123, gampaha road, gampaha.','0718765442','kasun.wijeratne@company.com','Worker',4,1,NULL),('1ca6900a-c6bd-40ad-bd40-d335fbd42f7w','Gagani','Senanayake','1991-06-05','907654341V','Male','Single',0,'456, galle road, galle.','0718765452','gayan.senanayake@company.com','Worker',4,1,NULL),('21b63c70-5c83-433b-9ab8-de8899d18854','Upuli','Jayasinghe','1960-01-24','969653320V','Female','Married',6,'91,Athurugiriya road,Malabe.','0752843628','Upuli.jupiter@company.com','Cleaner',2,1,NULL),('2ba6900a-c6bd-40ad-bd40-d335fbd42f7n','Shradha','Perera','1982-09-20','907654332V','Male','Married',1,'456, colombo road, colombo.','0718765443','nuwan.perera@company.com','Worker',4,1,NULL),('2ca6900a-c6bd-40ad-bd40-d335fbd42f7x','Kasungi','Wijesinghe','1992-07-10','907654342V','Male','Married',2,'789, negombo road, negombo.','0718765453','kasun.wijesinghe@company.com','Worker',4,1,NULL),('3ba6900a-c6bd-40ad-bd40-d335fbd42f7o','Ruwantha','Fernando','1983-10-25','907654333V','Male','Single',0,'789, kandy road, kandy.','0718765444','ruwan.fernando@company.com','Worker',4,1,NULL),('3ca6900a-c6bd-40ad-bd40-d335fbd42f7y','Nuwanthika','Perera','1993-08-15','907654343V','Male','Single',0,'123, kurunegala road, kurunegala.','0718765454','nuwani.perera@company.com','Worker',4,1,NULL),('4ba6900a-c6bd-40ad-bd40-d335fbd42f7p','Sunimal','Wijesinghe','1984-11-30','907654334V','Male','Married',2,'123, negombo road, negombo.','0718765445','sunil.wijesinghe@company.com','Worker',4,1,NULL),('4ca6900a-c6bd-40ad-bd40-d335fbd42f7z','Dinekshi','Fernando','1994-09-20','907654344V','Male','Married',1,'456, colombo road, colombo.','0718765455','ruwani.fernando@company.com','Worker',4,1,NULL),('5ba6900a-c6bd-40ad-bd40-d335fbd42f7q','Kumari','Jayasinghe','1985-12-05','907654335V','Male','Single',0,'456, kurunegala road, kurunegala.','0718765446','kumara.jayasinghe@company.com','Worker',4,1,NULL),('5ca6900a-c6bd-40ad-bd40-d335fbd42f7a','Susantha','Wijesinghe','1995-10-25','907654345V','Male','Single',0,'789, kandy road, kandy.','0718765456','sunili.wijesinghe@company.com','Worker',4,1,NULL),('6ba6900a-c6bd-40ad-bd40-d335fbd42f7r','Ranjitham','Senarath','1986-01-10','907654336V','Male','Married',1,'789, jaffna road, jaffna.','0718765447','ranjith.senarath@company.com','Worker',4,1,NULL),('7364528d-ce36-4d7f-a0aa-7cd084c077f3','Umesha','Jayakody','1965-02-24','949654341V','Male','Single',0,'46,wakanda road,homagama.','0741234567','Umesha.jupiter@company.com','HR Manager',1,1,NULL),('7b163c45-ce7b-422f-93d9-d72abb4af5ae','Araliya','Perera','1944-01-27','989654321V','Male','Single',0,'489, parakrame road, kottawa.','0751204567','Araliya.jupiter@company.com','Software enginner',2,1,NULL),('7ba6900a-c6bd-40ad-bd40-d335fbd42f7s','Gayantha','Wijeratne','1987-02-15','907654337V','Male','Single',0,'123, badulla road, badulla.','0718765448','gayan.wijeratne@company.com','Worker',4,1,NULL),('8ba6900a-c6bd-40ad-bd40-d335fbd42f7t','Maheshani','Perera','1988-03-20','907654338V','Male','Married',2,'456, trincomalee road, trincomalee.','0718765449','mahesh.perera@company.com','Worker',4,1,NULL),('8c163c45-ce7b-422f-93d9-d72abb4af5ae','Nimal','Fernando','1965-02-28','989654322V','Male','Single',0,'490, parakrame road, kottawa.','0751204568','Nimal.jupiter@company.com','Software enginner',2,1,NULL),('9ba6900a-c6bd-40ad-bd40-d335fbd42f7u','Sureshan','Fernando','1989-04-25','907654339V','Male','Single',0,'789, anuradhapura road, anuradhapura.','0718765450','suresh.fernando@company.com','Worker',4,1,NULL),('9d163c45-ce7b-422f-93d9-d72abb4af5ae','Sunil','Perera','1966-03-29','989654323V','Male','Single',0,'491, parakrame road, kottawa.','0751204569','Sunil.jupiter@company.com','QA Engineer',4,1,NULL),('ad163c45-ce7b-422f-93d9-d72ab74af5ae','Kamal','Silva','1967-04-30','989654324V','Male','Single',0,'492, parakrame road, kottawa.','0751204570','Kamal.jupiter@company.com','QA Engineer',4,1,NULL),('e10bfb2f-9cb9-4278-ac8c-952ee4428f02','Christopher','Ranasinghe','1963-02-24','929054321V','Male','Married',2,'48, samagi road, Maharagema.','0751234567','Christopher.jupiter@company.com','HR assistent',1,1,NULL);
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
INSERT INTO `employee_of_the_month` VALUES ('7364528d-ce36-4d7f-a0aa-7cd084c077f3','2024','10');
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
INSERT INTO `leave_count_record` VALUES ('0ba6900a-c6bd-40ad-bd40-d335fbd42f7a',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7b',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7c',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7d',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7e',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7f',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7g',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7h',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7i',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7j',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7k',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7l',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f8b',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f8d',2,15,10,0,7),('0ba6900a-c6bd-40ad-bd40-d335fbd42f9c',2,15,10,0,7),('0ca6900a-c6bd-40ad-bd40-d335fbd42f7v',2,15,10,0,7),('1ba6900a-c6bd-40ad-bd40-d335fbd42f7m',2,15,10,0,7),('1ca6900a-c6bd-40ad-bd40-d335fbd42f7w',2,15,10,0,7),('21b63c70-5c83-433b-9ab8-de8899d18854',3,10,5,0,8),('2ba6900a-c6bd-40ad-bd40-d335fbd42f7n',2,15,10,0,7),('2ca6900a-c6bd-40ad-bd40-d335fbd42f7x',2,15,10,0,7),('3ba6900a-c6bd-40ad-bd40-d335fbd42f7o',2,15,10,0,7),('3ca6900a-c6bd-40ad-bd40-d335fbd42f7y',2,15,10,0,7),('4ba6900a-c6bd-40ad-bd40-d335fbd42f7p',2,15,10,0,7),('4ca6900a-c6bd-40ad-bd40-d335fbd42f7z',2,15,10,0,7),('5ba6900a-c6bd-40ad-bd40-d335fbd42f7q',2,15,10,0,7),('5ca6900a-c6bd-40ad-bd40-d335fbd42f7a',2,15,10,0,7),('6ba6900a-c6bd-40ad-bd40-d335fbd42f7r',2,15,10,0,7),('7364528d-ce36-4d7f-a0aa-7cd084c077f3',1,20,10,0,5),('7b163c45-ce7b-422f-93d9-d72abb4af5ae',1,20,10,0,5),('7ba6900a-c6bd-40ad-bd40-d335fbd42f7s',2,15,10,0,7),('8ba6900a-c6bd-40ad-bd40-d335fbd42f7t',2,15,10,0,7),('8c163c45-ce7b-422f-93d9-d72abb4af5ae',1,20,10,0,5),('9ba6900a-c6bd-40ad-bd40-d335fbd42f7u',2,15,10,0,7),('9d163c45-ce7b-422f-93d9-d72abb4af5ae',1,20,10,0,5),('ad163c45-ce7b-422f-93d9-d72ab74af5ae',1,20,10,0,5),('e10bfb2f-9cb9-4278-ac8c-952ee4428f02',1,20,10,0,5);
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
INSERT INTO `leave_limit` VALUES (1,1,20,10,60,5),(2,2,15,10,30,7),(3,3,10,5,20,8);
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
  `reason_for_absence` varchar(40) DEFAULT NULL,
  `type_of_leave` varchar(40) DEFAULT NULL,
  `request_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`leave_request_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `leave_request_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `leave_request_chk_1` CHECK ((`request_status` in (_utf8mb4'P',_utf8mb4'R',_utf8mb4'A'))),
  CONSTRAINT `leave_request_chk_2` CHECK ((`type_of_leave` in (_utf8mb4'annual',_utf8mb4'casual',_utf8mb4'maternity',_utf8mb4'nopay')))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_request`
--

LOCK TABLES `leave_request` WRITE;
/*!40000 ALTER TABLE `leave_request` DISABLE KEYS */;
INSERT INTO `leave_request` VALUES (1,'0ba6900a-c6bd-40ad-bd40-d335fbd42f7c','2024-10-27','2024-10-27',1,'Sick','annual','P'),(2,'0ba6900a-c6bd-40ad-bd40-d335fbd42f8b','2024-10-27','2024-10-28',2,'Medical Leave','casual','A'),(3,'0ba6900a-c6bd-40ad-bd40-d335fbd42f7b','2024-10-28','2024-10-29',3,'Medical Leave','casual','A'),(4,'5ca6900a-c6bd-40ad-bd40-d335fbd42f7a','2024-10-28','2024-10-29',2,'Trip','annual','A'),(5,'4ca6900a-c6bd-40ad-bd40-d335fbd42f7z','2024-10-31','2024-10-29',1,'Trip','annual','P'),(6,'0ca6900a-c6bd-40ad-bd40-d335fbd42f7v','2024-10-31','2024-10-29',3,'Medical Leave','casual','A'),(7,'1ca6900a-c6bd-40ad-bd40-d335fbd42f7w','2024-10-31','2024-10-29',4,'Trip','casual','P'),(8,'7ba6900a-c6bd-40ad-bd40-d335fbd42f7s','2024-10-31','2024-10-30',3,'Trip','casual','R'),(9,'0ba6900a-c6bd-40ad-bd40-d335fbd42f7a','2024-10-31','2024-10-30',1,'Sick','annual','P'),(10,'0ba6900a-c6bd-40ad-bd40-d335fbd42f7f','2024-10-31','2024-10-31',2,'Sick','annual','A'),(11,'5ba6900a-c6bd-40ad-bd40-d335fbd42f7q','2024-10-31','2024-10-31',2,'Medical Leave','casual','A');
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
INSERT INTO `supervisor` VALUES ('0ba6900a-c6bd-40ad-bd40-d335fbd42f7a','7b163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7b','9d163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7c','ad163c45-ce7b-422f-93d9-d72ab74af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7d','8c163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7e','7b163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7f','9d163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7g','ad163c45-ce7b-422f-93d9-d72ab74af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7h','8c163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7i','7b163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7j','9d163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7k','ad163c45-ce7b-422f-93d9-d72ab74af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f7l','8c163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f8b','7b163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f8d','8c163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('0ba6900a-c6bd-40ad-bd40-d335fbd42f9c','ad163c45-ce7b-422f-93d9-d72ab74af5ae','2024-10-31'),('0ca6900a-c6bd-40ad-bd40-d335fbd42f7v','9d163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('1ba6900a-c6bd-40ad-bd40-d335fbd42f7m','7b163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('1ca6900a-c6bd-40ad-bd40-d335fbd42f7w','ad163c45-ce7b-422f-93d9-d72ab74af5ae','2024-10-31'),('21b63c70-5c83-433b-9ab8-de8899d18854','9d163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('2ba6900a-c6bd-40ad-bd40-d335fbd42f7n','9d163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('2ca6900a-c6bd-40ad-bd40-d335fbd42f7x','8c163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('3ba6900a-c6bd-40ad-bd40-d335fbd42f7o','ad163c45-ce7b-422f-93d9-d72ab74af5ae','2024-10-31'),('3ca6900a-c6bd-40ad-bd40-d335fbd42f7y','7b163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('4ba6900a-c6bd-40ad-bd40-d335fbd42f7p','8c163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('4ca6900a-c6bd-40ad-bd40-d335fbd42f7z','9d163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('5ba6900a-c6bd-40ad-bd40-d335fbd42f7q','7b163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('5ca6900a-c6bd-40ad-bd40-d335fbd42f7a','ad163c45-ce7b-422f-93d9-d72ab74af5ae','2024-10-31'),('6ba6900a-c6bd-40ad-bd40-d335fbd42f7r','9d163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('7b163c45-ce7b-422f-93d9-d72abb4af5ae','e10bfb2f-9cb9-4278-ac8c-952ee4428f02','2024-10-31'),('7ba6900a-c6bd-40ad-bd40-d335fbd42f7s','ad163c45-ce7b-422f-93d9-d72ab74af5ae','2024-10-31'),('8ba6900a-c6bd-40ad-bd40-d335fbd42f7t','8c163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('8c163c45-ce7b-422f-93d9-d72abb4af5ae','e10bfb2f-9cb9-4278-ac8c-952ee4428f02','2024-10-31'),('9ba6900a-c6bd-40ad-bd40-d335fbd42f7u','7b163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('9d163c45-ce7b-422f-93d9-d72abb4af5ae','e10bfb2f-9cb9-4278-ac8c-952ee4428f02','2024-10-31'),('ad163c45-ce7b-422f-93d9-d72ab74af5ae','e10bfb2f-9cb9-4278-ac8c-952ee4428f02','2024-10-31');
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
INSERT INTO `user_access` VALUES ('Amal',0,0),('Araliya',0,1),('Chandana',0,0),('Christopher',1,1),('Dinekshi',0,0),('Gagani',0,0),('Gayan',0,0),('Gayani',0,0),('Gayantha',0,0),('Kamal',0,0),('Kamali',0,1),('Kasungi',0,0),('Kevin',0,0),('Kumara',0,0),('Kumari',0,0),('Lahiru',0,0),('Mahesh',0,0),('Maheshani',0,0),('Nayana',0,0),('Nimal',0,0),('Nimali',0,1),('Nuwanthika',0,0),('Ranjith',0,0),('Ranjitham',0,0),('Ranjithma',0,0),('Ruwan',0,0),('Ruwantha',0,0),('Saman',0,0),('Shradha',0,0),('Sunil',0,0),('Sunili',0,1),('Sunimal',0,0),('Suresh',0,0),('Sureshan',0,0),('Susantha',0,0),('Umesha',1,1),('Upuli',0,0);
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
INSERT INTO `users` VALUES ('Amal','$2y$12$6.LbI0B0SRuWqxCTOsz4zuxL1fMmenMarge3u4Vvl.HMsZLw/gjwS','0ba6900a-c6bd-40ad-bd40-d335fbd42f9c','2024-10-31'),('Araliya','$2y$12$1Cq2NctwHnACVdJabWfHoOwHag0jm1gcOxXl2xfw3/bgaVtu8hJ/C','7b163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('Chandana','$2y$12$4/2FTnY.XNkIU3Wnkzc4LebbddMMvdilLKGFAzgqT1al4D1dRW0We','0ba6900a-c6bd-40ad-bd40-d335fbd42f7h','2024-10-31'),('Christopher','$2y$12$ekXVokjVwPDvmkJEQivSXuP0IKma.nc6O2qTQMHV3hkKy08XIoYFK','e10bfb2f-9cb9-4278-ac8c-952ee4428f02','2024-10-31'),('Dinekshi','$2y$12$ArLeMQMFxnDFAz21HV1JwuO62yrmeiRJBHRQszyreRspJ18yTZ7j2','4ca6900a-c6bd-40ad-bd40-d335fbd42f7z','2024-10-31'),('Gagani','$2y$12$QrhdtakX10FbX63Qf52.9OtZGJO3.zrDLLiklZVP3XBsnCxcd0f8K','1ca6900a-c6bd-40ad-bd40-d335fbd42f7w','2024-10-31'),('Gayan','$2y$12$lBxeWq9hL/sGW8CjO5nbFu.7SmrWSmvaIrAIZj3pHwEMf6c68kZkK','0ba6900a-c6bd-40ad-bd40-d335fbd42f7l','2024-10-31'),('Gayani','$2y$12$zxIGlr7opz19kvv6fiKEre0BGvEoAsJfhn.F7QuMxLE.GRkjxFPx.','0ba6900a-c6bd-40ad-bd40-d335fbd42f7b','2024-10-31'),('Gayantha','$2y$12$ypEEUEYyWCND2tSCx3BvY.lKvo/j/fLTT54hLbR2n9Qt0i3Lx121W','7ba6900a-c6bd-40ad-bd40-d335fbd42f7s','2024-10-31'),('Kamal','$2y$12$N96EgkyULlcaBh4AeDcJB.yxYI.5NjvA8E6Is4p9ua3m3pFzl39ny','0ba6900a-c6bd-40ad-bd40-d335fbd42f7a','2024-10-31'),('Kamali','$2y$12$cxIqEO36g7skDOkJU/brhuUU5mJDCiAFYsa78orSj0vM3hE1sDb0e','ad163c45-ce7b-422f-93d9-d72ab74af5ae','2024-10-31'),('Kasungi','$2y$12$db0bxlEOibz8igpPGZ01HuUZajjYc.PFUa4VqF1F5fZxBypTMzuuK','2ca6900a-c6bd-40ad-bd40-d335fbd42f7x','2024-10-31'),('Kevin','$2y$12$O0Z9atOd6u8a0.3khh1.nu9UwKdtev6O5/QhHZ5hfgePi5NJ3Z58i','1ba6900a-c6bd-40ad-bd40-d335fbd42f7m','2024-10-31'),('Kumara','$2y$12$LP2hS6xJzAnK3ADUbvgxzuYBSOyt9ZYUpd2.0jpG4GtH9hrWZ3lTW','0ba6900a-c6bd-40ad-bd40-d335fbd42f7f','2024-10-31'),('Kumari','$2y$12$zWRc1GY3xysLOze5p2J5heJds.ake38pDOZ29X8G6YcklA6OQTPVO','5ba6900a-c6bd-40ad-bd40-d335fbd42f7q','2024-10-31'),('Lahiru','$2y$12$BoDSvXKykwMbCFfQP4f/3.umZoyVL48fvx.UnFgwXuA4r5TCE6amK','0ba6900a-c6bd-40ad-bd40-d335fbd42f7c','2024-10-31'),('Mahesh','$2y$12$2Zi3Wuz48FeCy3nVJafc5OOMa2Cbq85hjzGjSy9HFeJgRy3.wouR2','0ba6900a-c6bd-40ad-bd40-d335fbd42f7i','2024-10-31'),('Maheshani','$2y$12$5RIUz51AAwtX/IqF3/jIqelpjcdVx8i5z4T55OQeindrBns/EfXFm','8ba6900a-c6bd-40ad-bd40-d335fbd42f7t','2024-10-31'),('Nayana','$2y$12$NobAWHAro8uiXZHiuy4wCuBZ2RMuVdJL/0ig7kMPOG5T1LOlohxnG','0ba6900a-c6bd-40ad-bd40-d335fbd42f8b','2024-10-31'),('Nimal','$2y$12$KS6Vn0n6hFYl2BcJ2IU3v.5DcjhdIylLYW.5LePbM/NyyC3jGvS0u','0ba6900a-c6bd-40ad-bd40-d335fbd42f7d','2024-10-31'),('Nimali','$2y$12$37rraq4Mcpk3bdXeKUpuo.Jn.BUoJqIsc3NLGzO.jKuGX9urLsWim','8c163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('Nuwanthika','$2y$12$gNcrrP0ipKQYbTXpOhsiEObSCI7OqT1lgHtkQ8iO46Qn/9kTAtMt.','3ca6900a-c6bd-40ad-bd40-d335fbd42f7y','2024-10-31'),('Ranjith','$2y$12$8lgwk3o0dKFeeJJGWH2pR.e0I20BVldX5kLvST33eX4WlCyyVTfV.','0ba6900a-c6bd-40ad-bd40-d335fbd42f7k','2024-10-31'),('Ranjitham','$2y$12$EWsRM50rRHLAnkAGaXStg.lAbJ4wEe0chRUJrmPiJTyYAzSOxocS2','6ba6900a-c6bd-40ad-bd40-d335fbd42f7r','2024-10-30'),('Ranjithma','$2y$12$UDVyV3UxqoyeV4KHOZInweUTLWxurkfDCPUu9aXM6L9u8ryHzDPQi','0ca6900a-c6bd-40ad-bd40-d335fbd42f7v','2024-10-30'),('Ruwan','$2y$12$tjpic2X/of9CAySWSXFDceBCLB9XB35U6w7WRPltBKtmB4uy0AuMu','0ba6900a-c6bd-40ad-bd40-d335fbd42f7g','2024-10-31'),('Ruwantha','$2y$12$HUIuAUI6HzzEp1ej2wmFn.MhYH2jF/7aQwE8BwPKEO3i58Qkbqlkm','3ba6900a-c6bd-40ad-bd40-d335fbd42f7o','2024-10-31'),('Saman','$2y$12$FOazYq48y55UnHWe2lNvqeJu9V41iwXUYGTKBj6z6LxTz14R1RcJm','0ba6900a-c6bd-40ad-bd40-d335fbd42f8d','2024-10-31'),('Shradha','$2y$12$I0Cfw7NPfYks8OZlEBgepehjMfEb5VeO/vGA7n3/NaCS/OeiBYekK','2ba6900a-c6bd-40ad-bd40-d335fbd42f7n','2024-10-31'),('Sunil','$2y$12$uviWpRC4N7v54qRvT0DfP.FIfJ2qB8vXOssZZJbxGLfEWVU5cj0Ve','0ba6900a-c6bd-40ad-bd40-d335fbd42f7e','2024-10-31'),('Sunili','$2y$12$1d.Vr5qfPaxK89Hdi99oDeRc0E9vS062qC3UlGo5XFJpiSzrAkwBy','9d163c45-ce7b-422f-93d9-d72abb4af5ae','2024-10-31'),('Sunimal','$2y$12$PrEzfHSJ3JI.UjObrt15COCCCjJpTdpil.XCSt4f4/CR8bWTVawoG','4ba6900a-c6bd-40ad-bd40-d335fbd42f7p','2024-10-31'),('Suresh','$2y$12$suZCkBeC4sLR3I6eeNJfVemEgy6j2TEWDTUO/2O1hvKg7a6rh6vKu','0ba6900a-c6bd-40ad-bd40-d335fbd42f7j','2024-10-31'),('Sureshan','$2y$12$2jDapJ0pUKH1DW/itDaJIeYbDG4eUTYxxzmKyJ5ppl7EixEYr9oia','9ba6900a-c6bd-40ad-bd40-d335fbd42f7u','2024-10-31'),('Susantha','$2y$12$aa5cP.65BwvAP9NHCtWPl.ThXEVl2Na8KBNDRC2JkgnrqqRG5BPo.','5ca6900a-c6bd-40ad-bd40-d335fbd42f7a','2024-10-31'),('Umesha','$2y$12$2eJiTmm0vv1BedMkT6TEuuBLOJ7OKJFU4GnECCJ0MgVuZoqZnEu/S','7364528d-ce36-4d7f-a0aa-7cd084c077f3','2024-10-30'),('Upuli','$2y$12$zn/gI8ldOjG/5zdBrw5t1Ok.neqioxNr928Ls2oKElKJmLegJNy.2','21b63c70-5c83-433b-9ab8-de8899d18854','2024-10-30');
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
    and user_access.is_admin = false
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
    in p_business_email varchar(40),
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

    declare exit handler for sqlexception
    begin
        rollback;
        signal sqlstate '45000' set message_text = 'Error inserting employee data';
    end;
    
    start transaction;
    
    if exists (select 1 from employee where employee_nic = nic) then
		select  'Error: Business email must be unique';
        signal sqlstate '45000' set message_text = 'Error: NIC must be unique';
    end if;

    if exists (select 1 from employee where business_email = p_business_email) then
		select  'Error: Business email must be unique';
        signal sqlstate '45000' set message_text = 'Error: Business email must be unique';
    end if;
    
    if timestampdiff(YEAR, birthday, CURDATE()) < 18 then
        select 'Error: Employee must be at least 18 years old';
        signal sqlstate '45000' set message_text = 'Error: Employee must be at least 18 years old';
    end if;

    select department_id into p_department_id from department where department_name = dept_name;
    select branch_id into p_branch_id from branch where branch_name = brch_name;
    select pay_grade into p_pay_grade from employee_position where job_title = p_job_title and employee_status = p_employee_status;
    select annual_leave_count into p_annual_leave_count from leave_limit where pay_grade = p_pay_grade;
    select casual_leave_count into p_casual_leave_count from leave_limit where pay_grade = p_pay_grade;
    select maternity_leave_count into p_maternity_leave_count from leave_limit where pay_grade = p_pay_grade;
    select nopay_leave_count into p_nopay_leave_count from leave_limit where pay_grade = p_pay_grade;
    select leave_type_id into p_leave_type_id from leave_limit where pay_grade = p_pay_grade;

    insert into employee (
        employee_id, first_name, last_name, birthday, employee_nic, gender, marital_status, number_of_dependents,
        address, contact_number, business_email, job_title, department_id, branch_id, profile_photo) 
    values (employee_id, first_name, last_name, birthday, nic, gender, marital_status, number_of_dependents,
		address, contact_number, p_business_email, p_job_title, p_department_id, p_branch_id, p_profile_photo);
        
    insert into emergency_contact (emergency_contact_id, name, nic, address, emergency_contact_number)
	values (employee_id, emergency_contact_name, emergency_contact_nic, emergency_contact_address, emergency_contact_number);
    
    insert into leave_count_record (employee_id, leave_type_id, annual_leave_remaining, casual_leave_remaining,
		maternity_leave_remaining, nopay_leave_remaining)
    values (employee_id, p_leave_type_id, p_annual_leave_count, p_casual_leave_count, p_maternity_leave_count, p_nopay_leave_count);
    
    commit;
    select 'Employee added successfully.';

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
    declare exit handler for sqlexception
    begin
        rollback;
        signal sqlstate '45000' set message_text = 'Error occur in leave request evaluation';
    end;
	select branch_id
    into p_branch_id
    from branch
    where branch_name = p_main_branch;
    
    insert into organization(field,main_branch_id) values(p_field,p_branch_id);
    commit;
    select 'Organization added successfully';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admins`()
begin
    select employee.first_name,employee.last_name,employee.employee_id
	from  users
	join  employee using (employee_id)
	join  user_access using (username)
	where is_admin = true and is_supervisor = true;
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
    declare p_supervisor_id varchar(40);
    declare leave_remaining varchar(40);
    declare existing_request_id varchar(40);
    declare exit handler for sqlexception 
    begin
        rollback;
        select 'An error occurred while creating the leave request';
    end;
    
    start transaction;

    set curr_date = curdate();
    
    select supervisor_id
    into p_supervisor_id
    from supervisor 
    where employee_id = p_employee_id;
    
    if (select count(employee_id) from leave_request where employee_id = p_employee_id)<10 then
		if p_type_of_leave = 'annual' and (select annual_leave_remaining from leave_count_record where employee_id = p_employee_id) >= p_period_of_absence then
			insert into leave_request (employee_id, request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
			values (p_employee_id, curr_date, p_leave_start_date, p_period_of_absence, p_reason_for_absence, p_type_of_leave, 'P');
			select 'Sucessfully create leave request' as message;
		elseif p_type_of_leave = 'casual' and (select casual_leave_remaining from leave_count_record where employee_id = p_employee_id) >= p_period_of_absence then
			insert into leave_request (employee_id, request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
			values (p_employee_id, curr_date, p_leave_start_date, p_period_of_absence, p_reason_for_absence, p_type_of_leave, 'P');
			select 'Sucessfully create leave request' as message;
		elseif p_type_of_leave = 'maternity' and (select maternity_leave_remaining from leave_count_record where employee_id = p_employee_id) >= p_period_of_absence then
			insert into leave_request (employee_id, request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
			values (p_employee_id, curr_date, p_leave_start_date, p_period_of_absence, p_reason_for_absence, p_type_of_leave, 'P');
			select 'Sucessfully create leave request' as message;
		elseif p_type_of_leave = 'nopay' and (select nopay_leave_remaining from leave_count_record where employee_id = p_employee_id) >= p_period_of_absence then
			insert into leave_request (employee_id, request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
			values (p_employee_id, curr_date, p_leave_start_date, p_period_of_absence, p_reason_for_absence, p_type_of_leave, 'P');
			select 'Sucessfully create leave request' as message;
		else
			 select 'Insufficient leave balance for selected category' as message;
		end if;
		 if exists (select 1 from leave_request where employee_id = p_employee_id and (request_status = 'A' or request_status = 'R')
					and  date_add( p_leave_start_date, interval p_period_of_absence day) < current_date() ) then
			select leave_request_id into existing_request_id 
			from leave_request 
			where employee_id = p_employee_id and (request_status = 'A' or request_status = 'R')
			limit 1;
			
			delete from leave_request where leave_request_id = existing_request_id;
		end if;
	else 
		select 'limit exceed try again later' as message;
	end if;
    
    commit;

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
    in p_username varchar(40),
    in password varchar(255),
    in p_employee_id varchar(40),
    in access_level varchar(40)
)
begin
    declare exit handler for sqlexception
    begin
        rollback;
        signal sqlstate '45000' set message_text = 'Error creating user account';
    end;
    
    start transaction;
    
    if exists (select 1 from users where p_username = username) then
		select  'Error: your Username is already taken , try another one';
        signal sqlstate '45000' set message_text = 'Error: Username must be unique try another one';
    end if;
    
    if access_level = 'Admin' then
        insert into users (username, password, employee_id)
		values (p_username, password, p_employee_id);
        insert into user_access (username, is_admin, is_supervisor) values (p_username, true, true);
        
    elseif access_level = 'Supervisor' then
        insert into users (username, password, employee_id)
		values (p_username, password, p_employee_id);
        insert into user_access (username, is_admin, is_supervisor) values (p_username, false, true);
        insert into supervisor(supervisor_id, employee_id, date) 
		values((select employee_id from employee where job_title = 'HR assistent'), p_employee_id, curdate());
        
    else
        insert into users (username, password, employee_id)
		values (p_username, password, p_employee_id);
        insert into user_access (username, is_admin, is_supervisor) values (p_username, false, false);
        insert into supervisor (supervisor_id, employee_id, date)
		values (generate_supervisor(), p_employee_id, curdate());
    end if;
    
    commit;
    select 'User account create successfully';
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
    declare exit handler for sqlexception 
    begin
        rollback;
        select 'An error occurred while adding customize employee record';
    end;

    start transaction;
    
	select organization_id
    into p_organization_id
    from organization
    where field = p_organization;
    
    insert into custom_employee_record(custom_attribute_name) values(p_custom_attribute_name);
    update organization set  custom_employee_record_id = (select custom_employee_record_id from custom_employee_record order by custom_employee_record_id desc limit 1)
    where organization_id =p_organization_id;
    
    commit;
    select 'customize employee record added sucessfully';
    
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
    declare exit handler for sqlexception 
    begin
        rollback;
        select 'An error occurred while deleting the employee';
    end;

    start transaction;
    
    if (select is_admin from user_access where username = (select username from users where employee_id = p_employee_id limit 1)) = true then
        delete from employee where employee_id = d_employee_id;
    end if;

    commit;
    select 'Employee delete successfully';

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
	declare exit handler for sqlexception 
    begin
        rollback;
        select 'An error occurred while deleting leave request';
    end;
    
    start transaction;
	delete from leave_request where leave_request_id =p_leave_id and request_status = 'P';
    commit;
	select 'Leave request delete successfully';
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employees` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employees`()
begin
    select employee.first_name,employee.last_name
	from  users
	join  employee using (employee_id)
	join  user_access using (username)
	where is_admin = false and is_supervisor = false;
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
begin
    select  leave_request.leave_request_id, 
			employee.employee_id,
            employee.first_name,
            employee.last_name,
            leave_request.request_status,
            leave_request.leave_start_date,
            leave_request.period_of_absence,
            leave_request.request_date,
            leave_request.type_of_leave,
            leave_request.reason_for_absence
	from  employee
	join  leave_request using (employee_id)
    order by request_status;
end ;;
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
    
    select employee.first_name,employee.last_name
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
/*!50003 DROP PROCEDURE IF EXISTS `employee_team_for_supervisor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_team_for_supervisor`(
    in p_supervisor_id varchar(40)
)
begin    
    select employee.employee_id,employee.first_name,employee.last_name,employee.gender
    from supervisor
    join employee  using (employee_id)
    where supervisor.supervisor_id =p_supervisor_id;
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
    
    declare exit handler for sqlexception
    begin
        rollback;
        signal sqlstate '45000' set message_text = 'Error occur in leave request evaluation';
    end;
    
    start transaction;
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
    commit;
    select 'Successfully evaluate leave request';
    
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
/*!50003 DROP PROCEDURE IF EXISTS `get_employee_other_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employee_other_details`(
    in p_employee_id varchar(40)
)
begin
    if exists (select 1 from custom_attribute where employee_id = p_employee_id) then
        select custom_attribute.value, custom_employee_record.custom_attribute_name
        from custom_attribute
        join custom_employee_record using (custom_attribute_id)
        where custom_attribute.employee_id = p_employee_id;
    end if;
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
  select count(employee.employee_id) as amount , count(employee.employee_id)/count_of_employee as value
  from employee 
  inner join employee_position using(job_title)
  where employee_position.employee_status = 'full-time';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_leaves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_leaves`(
    in p_leave_request_id varchar(40)
)
begin
	select employee.first_name,employee.last_name,employee.gender,leave_request.request_date,leave_request.leave_start_date,leave_request.period_of_absence,leave_request.reason_for_absence,leave_request.type_of_leave,leave_request.request_status
    from employee
    right join leave_request using(employee_id)
    where leave_request_id =p_leave_request_id;
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
  declare count_of_employee int;
  select count(employee.employee_id) 
  into count_of_employee
  from employee ;
  select count(leave_request_id) as amount ,count(leave_request_id)/count_of_employee as value
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
  select count(employee.employee_id) as amount , count(employee.employee_id)/count_of_employee as value
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
/*!50003 DROP PROCEDURE IF EXISTS `leave_request_Pending_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `leave_request_Pending_list`(
	in p_supervisor_id varchar(40)
    )
begin
    select  
		leave_request.leave_request_id, 
		leave_request.employee_id, 
		leave_request.request_date, 
        leave_request.leave_start_date,  
        leave_request.period_of_absence, 
        leave_request.reason_for_absence,
        leave_request.type_of_leave,
        leave_request.request_status,
        employee.first_name,
        employee.last_name,
        employee.gender
		from  leave_request
		left join  employee using (employee_id)
        left join supervisor using (employee_id)
		where leave_request.request_status = 'P'
        and supervisor.supervisor_id = p_supervisor_id;
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
	declare exit handler for sqlexception 
    begin
        rollback;
        select 'An error occurred while updating login time';
    end;
	update users
    set last_login_date = current_date()
    where username = p_username;
    commit;
    select 'login time update sucessfully';
    
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
/*!50003 DROP PROCEDURE IF EXISTS `searching_employees` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `searching_employees`(
    in p_employee_id varchar(40),
    in p_first_name varchar(40),
    in p_last_name varchar(40),
    in p_gender varchar(40),
    in p_marital_status varchar(40),
    in p_job_title varchar(40),
    in dept_name varchar(40),
    in brch_name varchar(40)
)
begin
	declare p_department_id int;
    declare p_branch_id int;
	select department_id into p_department_id from department where department_name = dept_name;
    select branch_id into p_branch_id from branch where branch_name = brch_name;
    select * 
    from employee
    where (p_employee_id is null or employee_id = p_employee_id)
      and (p_first_name is null or first_name = p_first_name)
      and (p_last_name is null or last_name = p_last_name)
      and (p_gender is null or gender = p_gender)
      and (p_marital_status is null or marital_status = p_marital_status)
      and (p_job_title is null or job_title = p_job_title)
      and (p_department_id is null or department_id = p_department_id)
      and (p_branch_id is null or branch_id = p_branch_id);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_employee_details`(
    in p_employee_id varchar(40)
)
begin
    select
        employee.employee_id,
        employee.first_name,
        employee.last_name,
        employee.birthday,
        employee.employee_nic as nic,
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
        emergency_contact.name as emergency_contact_name,
        emergency_contact.nic as emergency_contact_nic,
        emergency_contact.address as emergency_contact_address,
        emergency_contact.emergency_contact_number as emergency_contact_number,
        leave_count_record.annual_leave_remaining,
        leave_count_record.casual_leave_remaining,
        leave_count_record.maternity_leave_remaining,
        leave_count_record.nopay_leave_remaining
    from employee 
    left join department using(department_id)
    left join branch using (branch_id)
    left join leave_count_record using (employee_id)
    left join emergency_contact on employee.employee_id = emergency_contact.emergency_contact_id
    left join employee_position using (job_title)
    where employee.employee_id = p_employee_id;
end ;;
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
/*!50003 DROP PROCEDURE IF EXISTS `supervisors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `supervisors`()
begin
    select employee.first_name,employee.last_name
	from  users
	join  employee using (employee_id)
	join  user_access using (username)
	where is_admin = false and is_supervisor = true;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `supervisors_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `supervisors_details`()
begin    
	select employee.employee_id,employee.first_name,employee.last_name
	from  users
	join  employee using (employee_id)
	join  user_access using (username)
	where is_admin = false and is_supervisor = true;
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

    declare exit handler for sqlexception 
    begin
        rollback;
        select 'An error occurred while updating the employee';
    end;

    start transaction;

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

    commit;
	select 'Successfully updated employee details';
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

-- Dump completed on 2024-10-31  3:34:43
