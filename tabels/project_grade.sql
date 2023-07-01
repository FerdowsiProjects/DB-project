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
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `grade_id` int NOT NULL,
  `course_name` varchar(45) DEFAULT NULL,
  `prof_name` varchar(45) DEFAULT NULL,
  `student_name` varchar(45) DEFAULT NULL,
  `professor_professor_id` int NOT NULL,
  `student_student_number` int NOT NULL,
  `student_examination_schedule_course_eid` int NOT NULL,
  `student_class_schedule_course_cid` int NOT NULL,
  `student_educational_records_educational_records_id` int NOT NULL,
  `select_unit_course_sgroup` int DEFAULT NULL,
  PRIMARY KEY (`grade_id`,`professor_professor_id`,`student_student_number`,`student_examination_schedule_course_eid`,`student_class_schedule_course_cid`,`student_educational_records_educational_records_id`),
  KEY `fk_grade_student1_idx` (`student_student_number`,`student_examination_schedule_course_eid`,`student_class_schedule_course_cid`,`student_educational_records_educational_records_id`),
  KEY `fk_grade_select_unit1_idx` (`select_unit_course_sgroup`),
  CONSTRAINT `fk_grade_select_unit1` FOREIGN KEY (`select_unit_course_sgroup`) REFERENCES `select_unit` (`course_sgroup`),
  CONSTRAINT `fk_grade_student1` FOREIGN KEY (`student_student_number`, `student_examination_schedule_course_eid`, `student_class_schedule_course_cid`, `student_educational_records_educational_records_id`) REFERENCES `student` (`student_number`, `examination_schedule_course_eid`, `class_schedule_course_cid`, `educational_records_educational_records_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-01 12:35:10
