CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ContactInfo`
--

DROP TABLE IF EXISTS `ContactInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContactInfo` (
  `ContactInfo_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Person_ID` int(11) NOT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ContactInfo_ID`),
  KEY `P_ID_idx` (`Person_ID`),
  CONSTRAINT `P_ID` FOREIGN KEY (`Person_ID`) REFERENCES `Person` (`Person_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactInfo`
--

LOCK TABLES `ContactInfo` WRITE;
/*!40000 ALTER TABLE `ContactInfo` DISABLE KEYS */;
INSERT INTO `ContactInfo` VALUES (5,4,'617-717-9637','patient01@gmail.com'),(6,5,'005-005-0005','patient02@hotmail.com'),(7,6,'006-006-0006','doctor01@163.com'),(8,7,'007-007-0007','doctor02@hosmail.com'),(9,8,'008-008-0008','nurse01@gmail.com'),(10,9,'009-009-0009','nurse02@hotmail.com'),(11,10,'010-010-0010','worker01@163.com'),(12,11,'011-011-0011','worker02@gmail.com');
/*!40000 ALTER TABLE `ContactInfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`ContactInfo_BEFORE_INSERT`
BEFORE INSERT ON `mydb`.`ContactInfo`
FOR EACH ROW
BEGIN
if new.Email not like '%_@%_._%'
then 
signal sqlstate value '40001'
set message_text = 'Email address is not valid';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`ContactInfo_BEFORE_UPDATE`
BEFORE UPDATE ON `mydb`.`ContactInfo`
FOR EACH ROW
BEGIN
if new.Email not like '%_@%_._%'
then 
signal sqlstate value '40002'
set message_text = 'Email address is not valid';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `Department_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Department_Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  PRIMARY KEY (`Department_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'Surgery','B2F3'),(2,'Medicine','B2F2');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Diagnose`
--

DROP TABLE IF EXISTS `Diagnose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Diagnose` (
  `Patient_ID` int(11) NOT NULL,
  `Doctor_ID` int(11) NOT NULL,
  `Diagnosis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`,`Doctor_ID`),
  KEY `Doctor_ID_idx` (`Doctor_ID`),
  KEY `Patient_ID_idx` (`Patient_ID`),
  CONSTRAINT `Doctor_ID_Diagnose` FOREIGN KEY (`Doctor_ID`) REFERENCES `Doctor` (`Doctor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Patient_ID_Diagnose` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Patient_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diagnose`
--

LOCK TABLES `Diagnose` WRITE;
/*!40000 ALTER TABLE `Diagnose` DISABLE KEYS */;
INSERT INTO `Diagnose` VALUES (1,1,'Need surgery'),(2,2,'Diagnosis01');
/*!40000 ALTER TABLE `Diagnose` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Diagnose_BEFORE_INSERT`
BEFORE INSERT ON `mydb`.`Diagnose`
FOR EACH ROW
BEGIN
declare pat_status varchar(45);
declare doc_status varchar(45);
set pat_status = (select Patient.InhospitalOrNot from Patient where Patient.Patient_ID = New.Patient_ID);
set doc_status = (select Doctor.InhospitalOrNot from Doctor where Doctor.Doctor_ID = New.Doctor_ID);
if(pat_status <> doc_status)
then
signal sqlstate value '40011'
set message_text = 'Patient - Doctor does not match on inhospital status!';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Diagnose_BEFORE_UPDATE`
BEFORE UPDATE ON `mydb`.`Diagnose`
FOR EACH ROW
BEGIN
declare pat_status varchar(45);
declare doc_status varchar(45);
set pat_status = (select Patient.InhospitalOrNot from Patient where Patient.Patient_ID = New.Patient_ID);
set doc_status = (select Doctor.InhospitalOrNot from Doctor where Doctor.Doctor_ID = New.Doctor_ID);
if(pat_status <> doc_status)
then
signal sqlstate value '40012'
set message_text = 'Patient - Doctor does not match on inhospital status!';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor` (
  `Doctor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Person_ID` int(11) NOT NULL,
  `ResidentOrNot` varchar(45) NOT NULL DEFAULT 'Not',
  PRIMARY KEY (`Doctor_ID`),
  KEY `Person_ID_idx` (`Person_ID`),
  CONSTRAINT `Person_ID_Doctor` FOREIGN KEY (`Person_ID`) REFERENCES `Person` (`Person_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor` VALUES (1,6,'Inhospital'),(2,7,'Not');
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Doctor_BEFORE_INSERT` BEFORE INSERT ON `Doctor` FOR EACH ROW
BEGIN
if exists (select * from Patient where
new.Person_ID = Patient.Person_ID)
then
signal sqlstate value '40031'
set message_text = 'This person is a patient';
end if;
if exists (select * from Worker where
new.Person_ID = Worker.Person_ID)
then
signal sqlstate value '40032'
set message_text = 'This person is a worker';
end if;
if exists (select * from Nurse where
new.Person_ID = Nurse.Person_ID)
then
signal sqlstate value '40033'
set message_text = 'This person is a nurse';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Doctor_BEFORE_UPDATE` BEFORE UPDATE ON `Doctor` FOR EACH ROW
BEGIN
if exists (select * from Patient where
new.Person_ID = Patient.Person_ID)
then
signal sqlstate value '40035'
set message_text = 'This person is a patient';
end if;
if exists (select * from Worker where
new.Person_ID = Worker.Person_ID)
then
signal sqlstate value '40036'
set message_text = 'This person is a worker';
end if;
if exists (select * from Nurse where
new.Person_ID = Nurse.Person_ID)
then
signal sqlstate value '40037'
set message_text = 'This person is a nurse';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Doctor_In`
--

DROP TABLE IF EXISTS `Doctor_In`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor_In` (
  `Doctor_ID` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  PRIMARY KEY (`Doctor_ID`,`Department_ID`),
  KEY `Dep_ID_idx` (`Department_ID`),
  CONSTRAINT `Dep_ID_DocIn` FOREIGN KEY (`Department_ID`) REFERENCES `Department` (`Department_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Doc_ID_DocIn` FOREIGN KEY (`Doctor_ID`) REFERENCES `Doctor` (`Doctor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor_In`
--

LOCK TABLES `Doctor_In` WRITE;
/*!40000 ALTER TABLE `Doctor_In` DISABLE KEYS */;
INSERT INTO `Doctor_In` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `Doctor_In` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Drugs`
--

DROP TABLE IF EXISTS `Drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drugs` (
  `Drug_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Introduction` varchar(255) NOT NULL,
  `Size` double NOT NULL,
  `Price` double NOT NULL,
  `Producer` varchar(255) NOT NULL,
  `Inventory` mediumtext NOT NULL,
  PRIMARY KEY (`Drug_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drugs`
--

LOCK TABLES `Drugs` WRITE;
/*!40000 ALTER TABLE `Drugs` DISABLE KEYS */;
INSERT INTO `Drugs` VALUES (1,'anesthetic','Anesthe patient during operation',0.5,10.5,'No.2 Drug Company','78'),(2,'penicillin','diminish inflammation',0.25,5.75,'No.2 Drug Company','469'),(3,'plasma type O','plasma for operation',250,25.25,'No.2 Drug Company','0');
/*!40000 ALTER TABLE `Drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImplementedBy`
--

DROP TABLE IF EXISTS `ImplementedBy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImplementedBy` (
  `Operation_ID` int(11) NOT NULL,
  `Doctor_ID` int(11) NOT NULL,
  PRIMARY KEY (`Operation_ID`,`Doctor_ID`),
  KEY `Doc_ID_idx` (`Doctor_ID`),
  CONSTRAINT `Doc_ID_ImpBy` FOREIGN KEY (`Doctor_ID`) REFERENCES `Doctor` (`Doctor_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `OP_ID_ImpBy` FOREIGN KEY (`Operation_ID`) REFERENCES `Operation` (`Operation_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImplementedBy`
--

LOCK TABLES `ImplementedBy` WRITE;
/*!40000 ALTER TABLE `ImplementedBy` DISABLE KEYS */;
INSERT INTO `ImplementedBy` VALUES (1,1);
/*!40000 ALTER TABLE `ImplementedBy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MedicalSupply`
--

DROP TABLE IF EXISTS `MedicalSupply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MedicalSupply` (
  `MedicalSupply_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Usage` varchar(255) NOT NULL,
  `Size` double NOT NULL,
  `Producer` varchar(255) NOT NULL,
  PRIMARY KEY (`MedicalSupply_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedicalSupply`
--

LOCK TABLES `MedicalSupply` WRITE;
/*!40000 ALTER TABLE `MedicalSupply` DISABLE KEYS */;
INSERT INTO `MedicalSupply` VALUES (1,'injector','inject',5,'No.1 Medical Supply'),(2,'scalpel','surgery',25.5,'No.1 Medical Supply');
/*!40000 ALTER TABLE `MedicalSupply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nurse`
--

DROP TABLE IF EXISTS `Nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nurse` (
  `Nurse_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Person_ID` int(11) NOT NULL,
  `ResidentOrNot` varchar(45) NOT NULL DEFAULT 'Not',
  PRIMARY KEY (`Nurse_ID`),
  KEY `Person_ID_idx` (`Person_ID`),
  CONSTRAINT `Person_ID_Nurse` FOREIGN KEY (`Person_ID`) REFERENCES `Person` (`Person_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nurse`
--

LOCK TABLES `Nurse` WRITE;
/*!40000 ALTER TABLE `Nurse` DISABLE KEYS */;
INSERT INTO `Nurse` VALUES (1,8,'Inhospital'),(2,9,'Not');
/*!40000 ALTER TABLE `Nurse` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Nurse_BEFORE_INSERT` BEFORE INSERT ON `Nurse` FOR EACH ROW
BEGIN
if exists (select * from Patient where
new.Person_ID = Patient.Person_ID)
then
signal sqlstate value '40038'
set message_text = 'This person is a patient';
end if;
if exists (select * from Worker where
new.Person_ID = Worker.Person_ID)
then
signal sqlstate value '40039'
set message_text = 'This person is a worker';
end if;
if exists (select * from Doctor where
new.Person_ID = Doctor.Person_ID)
then
signal sqlstate value '40040'
set message_text = 'This person is a doctor';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Nurse_BEFORE_UPDATE` BEFORE UPDATE ON `Nurse` FOR EACH ROW
BEGIN
if exists (select * from Patient where
new.Person_ID = Patient.Person_ID)
then
signal sqlstate value '40041'
set message_text = 'This person is a patient';
end if;
if exists (select * from Worker where
new.Person_ID = Worker.Person_ID)
then
signal sqlstate value '40042'
set message_text = 'This person is a worker';
end if;
if exists (select * from Doctor where
new.Person_ID = Doctor.Person_ID)
then
signal sqlstate value '40043'
set message_text = 'This person is a doctor';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Nurse_In`
--

DROP TABLE IF EXISTS `Nurse_In`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nurse_In` (
  `Nurse_ID` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  PRIMARY KEY (`Nurse_ID`,`Department_ID`),
  KEY `Dep_ID_idx` (`Department_ID`),
  CONSTRAINT `Dep_ID_nurIn` FOREIGN KEY (`Department_ID`) REFERENCES `Department` (`Department_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Nur_ID_nurIn` FOREIGN KEY (`Nurse_ID`) REFERENCES `Nurse` (`Nurse_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nurse_In`
--

LOCK TABLES `Nurse_In` WRITE;
/*!40000 ALTER TABLE `Nurse_In` DISABLE KEYS */;
INSERT INTO `Nurse_In` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `Nurse_In` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nursing`
--

DROP TABLE IF EXISTS `Nursing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nursing` (
  `Nurse_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  PRIMARY KEY (`Nurse_ID`,`Patient_ID`),
  KEY `Nurse_ID_idx` (`Nurse_ID`),
  KEY `Patient_ID_idx` (`Patient_ID`),
  CONSTRAINT `Nurse_ID_Nursing` FOREIGN KEY (`Nurse_ID`) REFERENCES `Nurse` (`Nurse_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Patient_ID_Nursing` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Patient_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nursing`
--

LOCK TABLES `Nursing` WRITE;
/*!40000 ALTER TABLE `Nursing` DISABLE KEYS */;
INSERT INTO `Nursing` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `Nursing` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Nursing_BEFORE_INSERT`
BEFORE INSERT ON `mydb`.`Nursing`
FOR EACH ROW
BEGIN
declare pat_status varchar(45);
declare nur_status varchar(45);
set pat_status = (select Patient.InhospitalOrNot from Patient where Patient.Patient_ID = New.Patient_ID);
set nur_status = (select Nurse.InhospitalOrNot from Nurse where Nurse.Nurse_ID = New.Nurse_ID);
if(pat_status <> nur_status)
then
signal sqlstate value '40009'
set message_text = 'Patient - Nurse does not match on inhospital status!';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Nursing_BEFORE_UPDATE`
BEFORE UPDATE ON `mydb`.`Nursing`
FOR EACH ROW
BEGIN
declare pat_status varchar(45);
declare nur_status varchar(45);
set pat_status = (select Patient.InhospitalOrNot from Patient where Patient.Patient_ID = New.Patient_ID);
set nur_status = (select Nurse.InhospitalOrNot from Nurse where Nurse.Nurse_ID = New.Nurse_ID);
if(pat_status <> nur_status)
then
signal sqlstate value '40010'
set message_text = 'Patient - Nurse does not match on inhospital status!';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `OperatationOn`
--

DROP TABLE IF EXISTS `OperatationOn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OperatationOn` (
  `Operation_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  PRIMARY KEY (`Operation_ID`,`Patient_ID`),
  KEY `Pat_ID_idx` (`Patient_ID`),
  CONSTRAINT `Op_ID_opOn` FOREIGN KEY (`Operation_ID`) REFERENCES `Operation` (`Operation_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Pat_ID_OpOn` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Patient_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OperatationOn`
--

LOCK TABLES `OperatationOn` WRITE;
/*!40000 ALTER TABLE `OperatationOn` DISABLE KEYS */;
INSERT INTO `OperatationOn` VALUES (1,1);
/*!40000 ALTER TABLE `OperatationOn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Operation`
--

DROP TABLE IF EXISTS `Operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Operation` (
  `Operation_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Time` date NOT NULL,
  `Details` varchar(255) NOT NULL,
  PRIMARY KEY (`Operation_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Operation`
--

LOCK TABLES `Operation` WRITE;
/*!40000 ALTER TABLE `Operation` DISABLE KEYS */;
INSERT INTO `Operation` VALUES (1,'2017-01-31','Surgery on patient01');
/*!40000 ALTER TABLE `Operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OperationDrug`
--

DROP TABLE IF EXISTS `OperationDrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OperationDrug` (
  `Operation_ID` int(11) NOT NULL,
  `Drug_ID` int(11) NOT NULL,
  `NumOfUse` mediumtext NOT NULL,
  PRIMARY KEY (`Operation_ID`,`Drug_ID`),
  KEY `Drug_ID_idx` (`Drug_ID`),
  CONSTRAINT `Drug_ID_OpDrug` FOREIGN KEY (`Drug_ID`) REFERENCES `Drugs` (`Drug_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Op_ID_OpDrug` FOREIGN KEY (`Operation_ID`) REFERENCES `Operation` (`Operation_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OperationDrug`
--

LOCK TABLES `OperationDrug` WRITE;
/*!40000 ALTER TABLE `OperationDrug` DISABLE KEYS */;
INSERT INTO `OperationDrug` VALUES (1,1,'2'),(1,2,'1');
/*!40000 ALTER TABLE `OperationDrug` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`OperationDrug_BEFORE_INSERT`
BEFORE INSERT ON `mydb`.`OperationDrug`
FOR EACH ROW
BEGIN
declare inventory_remain long;
set inventory_remain = (select Drugs.Inventory from Drugs where New.Drug_ID = Drugs.Drug_ID);
if(inventory_remain - new.NumOfUse < 0)
then
signal sqlstate value '40007'
set message_text = 'Not valid drug inventory!';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`OperationDrug_AFTER_INSERT`
AFTER INSERT ON `mydb`.`OperationDrug`
FOR EACH ROW
BEGIN
update Drugs
set Drugs.Inventory = (Drugs.Inventory - New.NumOfUse)
where Drugs.Drug_ID = New.Drug_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`OperationDrug_BEFORE_UPDATE`
BEFORE UPDATE ON `mydb`.`OperationDrug`
FOR EACH ROW
BEGIN
declare inventory_remain long;
set inventory_remain = (select Drugs.Inventory from Drugs where New.Drug_ID = Drugs.Drug_ID);
if(inventory_remain - new.NumOfUse < 0)
then
signal sqlstate value '40008'
set message_text = 'Not valid drug inventory!';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`OperationDrug_AFTER_UPDATE`
AFTER UPDATE ON `mydb`.`OperationDrug`
FOR EACH ROW
BEGIN
update Drugs
set Drugs.Inventory = (Drugs.Inventory - New.NumOfUse)
where Drugs.Drug_ID = New.Drug_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `OperationNursery`
--

DROP TABLE IF EXISTS `OperationNursery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OperationNursery` (
  `Operation_ID` int(11) NOT NULL,
  `Nurse_ID` int(11) NOT NULL,
  PRIMARY KEY (`Operation_ID`,`Nurse_ID`),
  KEY `Nur_ID_idx` (`Nurse_ID`),
  CONSTRAINT `Nur_ID_OpNur` FOREIGN KEY (`Nurse_ID`) REFERENCES `Nurse` (`Nurse_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Op_ID_OpNur` FOREIGN KEY (`Operation_ID`) REFERENCES `Operation` (`Operation_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OperationNursery`
--

LOCK TABLES `OperationNursery` WRITE;
/*!40000 ALTER TABLE `OperationNursery` DISABLE KEYS */;
INSERT INTO `OperationNursery` VALUES (1,1);
/*!40000 ALTER TABLE `OperationNursery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OperationSupply`
--

DROP TABLE IF EXISTS `OperationSupply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OperationSupply` (
  `Operation_ID` int(11) NOT NULL,
  `MedicalSupply_ID` int(11) NOT NULL,
  PRIMARY KEY (`Operation_ID`,`MedicalSupply_ID`),
  KEY `Med_ID_idx` (`MedicalSupply_ID`),
  CONSTRAINT `Med_ID_OpSup` FOREIGN KEY (`MedicalSupply_ID`) REFERENCES `medicalsupply` (`MedicalSupply_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Op_ID_OpSup` FOREIGN KEY (`Operation_ID`) REFERENCES `Operation` (`Operation_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OperationSupply`
--

LOCK TABLES `OperationSupply` WRITE;
/*!40000 ALTER TABLE `OperationSupply` DISABLE KEYS */;
INSERT INTO `OperationSupply` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `OperationSupply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `Patient_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Person_ID` int(11) NOT NULL,
  `InhospitalOrNot` varchar(45) NOT NULL DEFAULT 'Not',
  PRIMARY KEY (`Patient_ID`),
  KEY `Person_ID_idx` (`Person_ID`),
  CONSTRAINT `Person_ID_Patient` FOREIGN KEY (`Person_ID`) REFERENCES `Person` (`Person_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (1,4,'Inhospital'),(2,5,'Not');
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `Person_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(45) NOT NULL,
  `Lastname` varchar(45) NOT NULL,
  `Age` int(11) NOT NULL,
  `Gender` varchar(45) NOT NULL DEFAULT 'Male',
  `Street` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `ZIP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Person_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (4,'patient01','surgery',22,'Male','1 Burbank','Boston','MA','02115'),(5,'patient02','outpatient',23,'Female','2 Burbank','Boston','MA','02115'),(6,'doctor01','operational',34,'Male','5 New York','New York City','NY','01010'),(7,'doctor02','outpatient',44,'Male','3 Burbank','Boston','MA','02115'),(8,'Nurse01','surgery_nurse',25,'Female','4 Burbank','Boston','MA','02115'),(9,'Nurse02','outpatient_nurse',33,'Female','5 Burbank','Boston','MA','02115'),(10,'Worker01','phamarcy',45,'Male','360 Huntington','Boston','MA','02115'),(11,'Worker02','department',44,'Female','200 Huntington','Boston','MA','02115'),(12,'patient03','outpatient02',30,'Male','7 Burbank','Boston','MA','2115');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pharmacy`
--

DROP TABLE IF EXISTS `Pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pharmacy` (
  `Pharmacy_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Location` varchar(255) NOT NULL,
  PRIMARY KEY (`Pharmacy_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pharmacy`
--

LOCK TABLES `Pharmacy` WRITE;
/*!40000 ALTER TABLE `Pharmacy` DISABLE KEYS */;
INSERT INTO `Pharmacy` VALUES (1,'B1F2'),(2,'B2F3');
/*!40000 ALTER TABLE `Pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registrate_In`
--

DROP TABLE IF EXISTS `Registrate_In`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Registrate_In` (
  `Patient_ID` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  PRIMARY KEY (`Patient_ID`,`Department_ID`),
  KEY `Dep_ID_idx` (`Department_ID`),
  CONSTRAINT `Dep_ID_RegIn` FOREIGN KEY (`Department_ID`) REFERENCES `Department` (`Department_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Patient_ID_RegIn` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Patient_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registrate_In`
--

LOCK TABLES `Registrate_In` WRITE;
/*!40000 ALTER TABLE `Registrate_In` DISABLE KEYS */;
INSERT INTO `Registrate_In` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `Registrate_In` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storage`
--

DROP TABLE IF EXISTS `Storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Storage` (
  `Pharmacy_ID` int(11) NOT NULL,
  `Drug_ID` int(11) NOT NULL,
  `Inventory` mediumtext NOT NULL,
  PRIMARY KEY (`Pharmacy_ID`,`Drug_ID`),
  KEY `Pharmacy_ID_idx` (`Pharmacy_ID`),
  KEY `Drug_ID_idx` (`Drug_ID`),
  CONSTRAINT `Drug_ID_Storage` FOREIGN KEY (`Drug_ID`) REFERENCES `Drugs` (`Drug_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Pharmacy_ID_Storage` FOREIGN KEY (`Pharmacy_ID`) REFERENCES `Pharmacy` (`Pharmacy_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storage`
--

LOCK TABLES `Storage` WRITE;
/*!40000 ALTER TABLE `Storage` DISABLE KEYS */;
INSERT INTO `Storage` VALUES (1,1,'10'),(1,2,'20'),(2,1,'10'),(2,2,'10');
/*!40000 ALTER TABLE `Storage` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Storage_BEFORE_INSERT` BEFORE INSERT ON `Storage` FOR EACH ROW
BEGIN
declare inventory_remain long;
set inventory_remain = (select Drugs.Inventory from Drugs where New.Drug_ID = Drugs.Drug_ID);
if(inventory_remain - new.Inventory < 0)
then
signal sqlstate value '40017'
set message_text = 'Not valid drug inventory!';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Storage_AFTER_INSERT` AFTER INSERT ON `Storage` FOR EACH ROW
BEGIN
update Drugs
set Drugs.Inventory = (Drugs.Inventory - New.Inventory)
where Drugs.Drug_ID = New.Drug_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Storage_BEFORE_UPDATE` BEFORE UPDATE ON `Storage` FOR EACH ROW
BEGIN
declare inventory_remain long;
set inventory_remain = (select Drugs.Inventory from Drugs where New.Drug_ID = Drugs.Drug_ID);
if(inventory_remain - new.Inventory < 0)
then
signal sqlstate value '40018'
set message_text = 'Not valid drug inventory!';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Storage_AFTER_UPDATE` AFTER UPDATE ON `Storage` FOR EACH ROW
BEGIN
update Drugs
set Drugs.Inventory = (Drugs.Inventory - New.Inventory)
where Drugs.Drug_ID = New.Drug_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `UseByDoc`
--

DROP TABLE IF EXISTS `UseByDoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UseByDoc` (
  `Doctor_ID` int(11) NOT NULL,
  `MedicalSupply_ID` int(11) NOT NULL,
  PRIMARY KEY (`MedicalSupply_ID`,`Doctor_ID`),
  KEY `Med_ID_idx` (`MedicalSupply_ID`),
  KEY `Doc_ID_UseByDoc` (`Doctor_ID`),
  CONSTRAINT `Doc_ID_UseByDoc` FOREIGN KEY (`Doctor_ID`) REFERENCES `Doctor` (`Doctor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Med_ID_UseByDoc` FOREIGN KEY (`MedicalSupply_ID`) REFERENCES `medicalsupply` (`MedicalSupply_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UseByDoc`
--

LOCK TABLES `UseByDoc` WRITE;
/*!40000 ALTER TABLE `UseByDoc` DISABLE KEYS */;
INSERT INTO `UseByDoc` VALUES (2,1),(1,2);
/*!40000 ALTER TABLE `UseByDoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UseByNurse`
--

DROP TABLE IF EXISTS `UseByNurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UseByNurse` (
  `Nurse_ID` int(11) NOT NULL,
  `MedicalSupply_ID` int(11) NOT NULL,
  PRIMARY KEY (`Nurse_ID`,`MedicalSupply_ID`),
  KEY `Medic_ID_idx` (`MedicalSupply_ID`),
  CONSTRAINT `Medic_ID_UseByNurse` FOREIGN KEY (`MedicalSupply_ID`) REFERENCES `medicalsupply` (`MedicalSupply_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Nur_ID_UseByNurese` FOREIGN KEY (`Nurse_ID`) REFERENCES `Nurse` (`Nurse_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UseByNurse`
--

LOCK TABLES `UseByNurse` WRITE;
/*!40000 ALTER TABLE `UseByNurse` DISABLE KEYS */;
INSERT INTO `UseByNurse` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `UseByNurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkInDepartment`
--

DROP TABLE IF EXISTS `WorkInDepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkInDepartment` (
  `Department_ID` int(11) NOT NULL,
  `Worker_ID` int(11) NOT NULL,
  PRIMARY KEY (`Department_ID`,`Worker_ID`),
  KEY `Department_ID_idx` (`Department_ID`),
  KEY `Worker_ID_idx` (`Worker_ID`),
  CONSTRAINT `Department_ID_InDepartment` FOREIGN KEY (`Department_ID`) REFERENCES `Department` (`Department_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Worker_ID_InDepartment` FOREIGN KEY (`Worker_ID`) REFERENCES `Worker` (`Worker_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkInDepartment`
--

LOCK TABLES `WorkInDepartment` WRITE;
/*!40000 ALTER TABLE `WorkInDepartment` DISABLE KEYS */;
INSERT INTO `WorkInDepartment` VALUES (1,1);
/*!40000 ALTER TABLE `WorkInDepartment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`WorkInDepartment_BEFORE_INSERT` BEFORE INSERT ON `WorkInDepartment` FOR EACH ROW
BEGIN
if exists (select * from WorkInPharmacy where
new.Worker_ID = WorkInPharmacy.Worker_ID)
then
signal sqlstate value '40003'
set message_text = 'Worker already work in pharmacy';
end if;
if exists (select * from WorkInDepartment where
new.Worker_ID = WorkInDepartment.Worker_ID)
then
signal sqlstate value '40013'
set message_text = 'Worker already has a position in another department';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`WorkInDepartment_BEFORE_UPDATE` BEFORE UPDATE ON `WorkInDepartment` FOR EACH ROW
BEGIN
if exists (select * from WorkInPharmacy where
new.Worker_ID = WorkInPharmacy.Worker_ID)
then
signal sqlstate value '40004'
set message_text = 'Worker already work in pharmacy';
end if;
if exists (select * from WorkInDepartment where
new.Worker_ID = WorkInDepartment.Worker_ID)
then
signal sqlstate value '40014'
set message_text = 'Worker already has a position in another department';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `WorkInPharmacy`
--

DROP TABLE IF EXISTS `WorkInPharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkInPharmacy` (
  `Pharmacy_ID` int(11) NOT NULL,
  `Worker_ID` int(11) NOT NULL,
  PRIMARY KEY (`Pharmacy_ID`,`Worker_ID`),
  KEY `Pharmacy_ID_idx` (`Pharmacy_ID`),
  KEY `Worker_ID_idx` (`Worker_ID`),
  CONSTRAINT `Pharmacy_ID_InPharmacy` FOREIGN KEY (`Pharmacy_ID`) REFERENCES `Pharmacy` (`Pharmacy_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Worker_ID_InPharmacy` FOREIGN KEY (`Worker_ID`) REFERENCES `Worker` (`Worker_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkInPharmacy`
--

LOCK TABLES `WorkInPharmacy` WRITE;
/*!40000 ALTER TABLE `WorkInPharmacy` DISABLE KEYS */;
INSERT INTO `WorkInPharmacy` VALUES (2,2);
/*!40000 ALTER TABLE `WorkInPharmacy` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`WorkInPharmacy_BEFORE_INSERT` BEFORE INSERT ON `WorkInPharmacy` FOR EACH ROW
BEGIN
if exists (select * from WorkInDepartment where
new.Worker_ID = WorkInDepartment.Worker_ID)
then
signal sqlstate value '40005'
set message_text = 'Worker already work in department';
end if;
if exists (select * from WorkInPharmacy where
new.Worker_ID = WorkInPharmacy.Worker_ID)
then
signal sqlstate value '40015'
set message_text = 'Worker already has a position in another pharmacy';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`WorkInPharmacy_BEFORE_UPDATE` BEFORE UPDATE ON `WorkInPharmacy` FOR EACH ROW
BEGIN
if exists (select * from WorkInDepartment where
new.Worker_ID = WorkInDepartment.Worker_ID)
then
signal sqlstate value '40006'
set message_text = 'Worker already work in department';
end if;
if exists (select * from WorkInPharmacy where
new.Worker_ID = WorkInPharmacy.Worker_ID)
then
signal sqlstate value '40016'
set message_text = 'Worker already has a position in another pharmacy';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Worker`
--

DROP TABLE IF EXISTS `Worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Worker` (
  `Worker_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Person_ID` int(11) NOT NULL,
  PRIMARY KEY (`Worker_ID`),
  KEY `Person_ID_idx` (`Person_ID`),
  CONSTRAINT `Person_ID_Worker` FOREIGN KEY (`Person_ID`) REFERENCES `Person` (`Person_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Worker`
--

LOCK TABLES `Worker` WRITE;
/*!40000 ALTER TABLE `Worker` DISABLE KEYS */;
INSERT INTO `Worker` VALUES (1,10),(2,11);
/*!40000 ALTER TABLE `Worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Worker_BEFORE_INSERT` BEFORE INSERT ON `Worker` FOR EACH ROW
BEGIN
if exists (select * from Patient where
new.Person_ID = Patient.Person_ID)
then
signal sqlstate value '40025'
set message_text = 'This person is a patient';
end if;
if exists (select * from Doctor where
new.Person_ID = Doctor.Person_ID)
then
signal sqlstate value '40026'
set message_text = 'This person is a doctor';
end if;
if exists (select * from Nurse where
new.Person_ID = Nurse.Person_ID)
then
signal sqlstate value '40027'
set message_text = 'This person is a nurse';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`Worker_BEFORE_UPDATE` BEFORE UPDATE ON `Worker` FOR EACH ROW
BEGIN
if exists (select * from Patient where
new.Person_ID = Patient.Person_ID)
then
signal sqlstate value '40028'
set message_text = 'This person is a patient';
end if;
if exists (select * from Doctor where
new.Person_ID = Doctor.Person_ID)
then
signal sqlstate value '40029'
set message_text = 'This person is a doctor';
end if;
if exists (select * from Nurse where
new.Person_ID = Nurse.Person_ID)
then
signal sqlstate value '40030'
set message_text = 'This person is a nurse';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetDoctorDetailswithName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDoctorDetailswithName`(
	in firstname varchar(45),
    in lastname varchar(45)
)
begin
	select b.Firstname, b.Lastname, b.Age, b.Gender, d.Department_Name, d.Location from
    Doctor as a join Person as b on
    a.Person_ID = b.Person_ID
    join Doctor_In as c on
    a.Doctor_ID = c.Doctor_ID
    join Department as d on
    c.Department_ID = d.Department_ID
    where b.Firstname = firstname and b.Lastname = lastname;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetNurseDetailswithName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNurseDetailswithName`(
	in firstname varchar(45),
    in lastname varchar(45)
)
begin
	select b.Firstname, b.Lastname, b.Age, b.Gender, d.Department_Name, d.Location from
    Nurse as a join Person as b on
    a.Person_ID = b.Person_ID
    join Nurse_In as c on
    a.Nurse_ID = c.Nurse_ID
    join Department as d on
    c.Department_ID = d.Department_ID
    where b.Firstname = firstname and b.Lastname = lastname;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOperationDrugswithPatientID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOperationDrugswithPatientID`(
	in patient_id int
)
begin
	select a.Operation_ID, d.Name, c.NumOfUse from
    OperatationOn as a join Operation as b join OperationDrug as c on
    a.Operation_ID = b.Operation_ID = c.Operation_ID
    join Drugs as d on
    c.Drug_ID = d.Drug_ID
    where a.Patient_ID = patient_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPatientHistorywithID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPatientHistorywithID`(
	in check_patient_id int
)
begin
    select a.Patient_ID, c.Firstname, c.Lastname, c.Age, c.Gender, b.Diagnosis from (
    Patient as a join Person as c on
    a.Person_ID = c.Person_ID
    join Diagnose as b on
    a.Patient_ID = b.Patient_ID
    )
    where
    a.Patient_ID = check_patient_id;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPersonDetailswithName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPersonDetailswithName`(
	in firstname varchar(45),
    in lastname varchar(45)
)
begin
	select * from
    Person as a join ContactInfo as b on
    a.Person_ID = b.Person_ID
    where a.Firstname = firstname and a.Lastname = lastname;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPharamacyInventorywithLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPharamacyInventorywithLocation`(
	in location varchar(255)
)
begin
	select a.Location, c.Name, c.Size, c.Price, c.Producer, b.Inventory from
    Pharmacy as a join Storage as b on 
    a.Pharmacy_ID = b.Pharmacy_ID
    join Drugs as c on
    b.Drug_ID = c.Drug_ID
    where a.Location = location;
end ;;
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

-- Dump completed on 2017-04-13 18:38:38
