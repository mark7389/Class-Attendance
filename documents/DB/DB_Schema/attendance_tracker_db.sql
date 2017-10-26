-- MySQL dump 10.13  Distrib 5.6.35, for osx10.9 (x86_64)
--
-- Host: localhost    Database: ATTENDANCE_TRACKER
-- ------------------------------------------------------
-- Server version	5.6.35

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
-- Table structure for table `Attendance`
--

DROP TABLE IF EXISTS `Attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Attendance` (
  `Student_Id` int(11) NOT NULL DEFAULT '0',
  `Date` date NOT NULL DEFAULT '0000-00-00',
  `Class_Id` int(11) NOT NULL DEFAULT '0',
  `Present` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Student_Id`,`Date`,`Class_Id`),
  KEY `fk_class_id` (`Class_Id`),
  CONSTRAINT `fk_class_id` FOREIGN KEY (`Class_Id`) REFERENCES `Class` (`Class_Id`),
  CONSTRAINT `fk_student_id` FOREIGN KEY (`Student_Id`) REFERENCES `Student` (`Student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendance`
--

LOCK TABLES `Attendance` WRITE;
/*!40000 ALTER TABLE `Attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Class`
--

DROP TABLE IF EXISTS `Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Class` (
  `Class_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Class_Name` varchar(50) DEFAULT NULL,
  `Class_Type_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Class_Id`),
  KEY `fk_class_type` (`Class_Type_Id`),
  CONSTRAINT `fk_class_type` FOREIGN KEY (`Class_Type_Id`) REFERENCES `Class_Type` (`Class_Type_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class`
--

LOCK TABLES `Class` WRITE;
/*!40000 ALTER TABLE `Class` DISABLE KEYS */;
/*!40000 ALTER TABLE `Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Class_Type`
--

DROP TABLE IF EXISTS `Class_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Class_Type` (
  `Class_Type_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Class_Category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Class_Type_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class_Type`
--

LOCK TABLES `Class_Type` WRITE;
/*!40000 ALTER TABLE `Class_Type` DISABLE KEYS */;
/*!40000 ALTER TABLE `Class_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flag_Configuration`
--

DROP TABLE IF EXISTS `Flag_Configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flag_Configuration` (
  `Class_Id` int(11) NOT NULL DEFAULT '0',
  `Number_Of_Weeks` int(11) DEFAULT NULL,
  PRIMARY KEY (`Class_Id`),
  CONSTRAINT `fk_class_id4` FOREIGN KEY (`Class_Id`) REFERENCES `Class` (`Class_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flag_Configuration`
--

LOCK TABLES `Flag_Configuration` WRITE;
/*!40000 ALTER TABLE `Flag_Configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `Flag_Configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flagged_Student`
--

DROP TABLE IF EXISTS `Flagged_Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flagged_Student` (
  `Student_Id` int(11) NOT NULL DEFAULT '0',
  `Class_Id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Student_Id`,`Class_Id`),
  KEY `fk_class_id3` (`Class_Id`),
  CONSTRAINT `fk_class_id3` FOREIGN KEY (`Class_Id`) REFERENCES `Class` (`Class_Id`),
  CONSTRAINT `fk_student_id3` FOREIGN KEY (`Student_Id`) REFERENCES `Student` (`Student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flagged_Student`
--

LOCK TABLES `Flagged_Student` WRITE;
/*!40000 ALTER TABLE `Flagged_Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Flagged_Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `Student_id` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `Email_Address` varchar(50) DEFAULT NULL,
  `Phone_Number` decimal(10,0) DEFAULT NULL,
  `Birth_Date` date DEFAULT NULL,
  PRIMARY KEY (`Student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_Class`
--

DROP TABLE IF EXISTS `Student_Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_Class` (
  `Student_Id` int(11) NOT NULL DEFAULT '0',
  `Class_Id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Student_Id`,`Class_Id`),
  KEY `fk_class_id2` (`Class_Id`),
  CONSTRAINT `fk_class_id2` FOREIGN KEY (`Class_Id`) REFERENCES `Class` (`Class_Id`),
  CONSTRAINT `fk_student_id2` FOREIGN KEY (`Student_Id`) REFERENCES `Student` (`Student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_Class`
--

LOCK TABLES `Student_Class` WRITE;
/*!40000 ALTER TABLE `Student_Class` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student_Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teacher`
--

DROP TABLE IF EXISTS `Teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teacher` (
  `Teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `Email_Address` varchar(50) DEFAULT NULL,
  `Phone_Number` decimal(10,0) DEFAULT NULL,
  `Birth_Date` date DEFAULT NULL,
  PRIMARY KEY (`Teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teacher`
--

LOCK TABLES `Teacher` WRITE;
/*!40000 ALTER TABLE `Teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `Teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teacher_Class`
--

DROP TABLE IF EXISTS `Teacher_Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teacher_Class` (
  `Teacher_Id` int(11) NOT NULL DEFAULT '0',
  `Class_Id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Teacher_Id`,`Class_Id`),
  KEY `fk_class_id1` (`Class_Id`),
  CONSTRAINT `fk_class_id1` FOREIGN KEY (`Class_Id`) REFERENCES `Class` (`Class_Id`),
  CONSTRAINT `fk_teacher_id1` FOREIGN KEY (`Teacher_Id`) REFERENCES `Teacher` (`Teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teacher_Class`
--

LOCK TABLES `Teacher_Class` WRITE;
/*!40000 ALTER TABLE `Teacher_Class` DISABLE KEYS */;
/*!40000 ALTER TABLE `Teacher_Class` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-24 21:18:43
