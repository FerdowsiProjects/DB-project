-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `report_card`
--

DROP TABLE IF EXISTS `report_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_card` (
  `course_number` int NOT NULL,
  `course_rname` varchar(45) DEFAULT NULL,
  `number_of_corse` int DEFAULT NULL,
  `rgrade` int DEFAULT NULL,
  `rGPA` int DEFAULT NULL,
  `student_student_number` int NOT NULL,
  `student_examination_schedule_course_eid` int NOT NULL,
  `student_class_schedule_course_cid` int NOT NULL,
  `supervisor_supervisor_id` int DEFAULT NULL,
  PRIMARY KEY (`course_number`,`student_student_number`,`student_examination_schedule_course_eid`,`student_class_schedule_course_cid`),
  KEY `fk_report_card_student1_idx` (`student_student_number`,`student_examination_schedule_course_eid`,`student_class_schedule_course_cid`),
  KEY `fk_report_card_supervisor1_idx` (`supervisor_supervisor_id`),
  CONSTRAINT `fk_report_card_student1` FOREIGN KEY (`student_student_number`, `student_examination_schedule_course_eid`, `student_class_schedule_course_cid`) REFERENCES `student` (`student_number`, `examination_schedule_course_eid`, `class_schedule_course_cid`),
  CONSTRAINT `fk_report_card_supervisor1` FOREIGN KEY (`supervisor_supervisor_id`) REFERENCES `supervisor` (`supervisor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_card`
--

LOCK TABLES `report_card` WRITE;
/*!40000 ALTER TABLE `report_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_card` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-01 12:35:09
