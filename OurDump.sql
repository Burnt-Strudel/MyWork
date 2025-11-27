-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ourschema
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id_course` int NOT NULL,
  `course_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'дуа тлоУТАыур лоыру алоыруларыл'),(2,'ылуоар шгыу алгы'),(3,'царлг шыгапшыг пашлыгпаышгп а');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_student_progress`
--

DROP TABLE IF EXISTS `course_student_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_student_progress` (
  `id_student` int NOT NULL,
  `id_course` int NOT NULL,
  `id_progress` int DEFAULT NULL,
  `total_progress` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_student`,`id_course`),
  KEY `FK_progress_course_student_progress_idx` (`id_progress`),
  CONSTRAINT `FK_progress_course_student_progress` FOREIGN KEY (`id_progress`) REFERENCES `progress` (`id_progress`),
  CONSTRAINT `FK_student_courses_cource_student_progress` FOREIGN KEY (`id_student`, `id_course`) REFERENCES `student_courses` (`id_student`, `id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_student_progress`
--

LOCK TABLES `course_student_progress` WRITE;
/*!40000 ALTER TABLE `course_student_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_student_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homework` (
  `id_homework` int NOT NULL,
  `name_homework` varchar(45) DEFAULT NULL,
  `id_lesson` int DEFAULT NULL,
  PRIMARY KEY (`id_homework`),
  KEY `FK_lessons_homework_idx` (`id_lesson`),
  CONSTRAINT `FK_lessons_homework` FOREIGN KEY (`id_lesson`) REFERENCES `lessons` (`id_lesson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id_lesson` int NOT NULL,
  `lesson_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_lesson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_lesson`
--

DROP TABLE IF EXISTS `module_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_lesson` (
  `module_id` int NOT NULL,
  `lesson_id` int NOT NULL,
  PRIMARY KEY (`module_id`,`lesson_id`),
  KEY `FK_lessons_module_lesson_idx` (`lesson_id`),
  CONSTRAINT `FK_lessons_module_lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id_lesson`),
  CONSTRAINT `FK_modules_module_lesson` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_lesson`
--

LOCK TABLES `module_lesson` WRITE;
/*!40000 ALTER TABLE `module_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_progress_status`
--

DROP TABLE IF EXISTS `module_progress_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_progress_status` (
  `id_status` int NOT NULL,
  `status_name` enum('not started','in progress','completed') DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_progress_status`
--

LOCK TABLES `module_progress_status` WRITE;
/*!40000 ALTER TABLE `module_progress_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_progress_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id_module` int NOT NULL,
  `id_course` int DEFAULT NULL,
  `module_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_module`),
  KEY `FK_course_modules_idx` (`id_course`),
  CONSTRAINT `FK_course_modules` FOREIGN KEY (`id_course`) REFERENCES `course` (`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progress` (
  `id_progress` int NOT NULL,
  `progress_name` varchar(45) DEFAULT NULL,
  `progress_description` text,
  PRIMARY KEY (`id_progress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress`
--

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
INSERT INTO `progress` VALUES (1,'законен','оуаилгы пдышгпашг удшаг'),(6,'Не начат ','окр пшукг пдшку гп'),(8,'в процессе','п укфп укфп уф пуф пуфкп');
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sertificate`
--

DROP TABLE IF EXISTS `sertificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sertificate` (
  `id_sertificate` int NOT NULL,
  `id_course` int DEFAULT NULL,
  `id_student` int DEFAULT NULL,
  `name_sertificate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_sertificate`),
  KEY `FK_student_course_sertificate_idx` (`id_course`,`id_student`),
  CONSTRAINT `FK_student_course_sertificate` FOREIGN KEY (`id_course`, `id_student`) REFERENCES `student_courses` (`id_course`, `id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sertificate`
--

LOCK TABLES `sertificate` WRITE;
/*!40000 ALTER TABLE `sertificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `sertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id_student` int NOT NULL,
  `name_student` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Гамбаров Денис Рамилевич'),(2,'Тагай Кирилл Андреевич'),(3,'Бикмухаметов Эмин Маратович');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courses`
--

DROP TABLE IF EXISTS `student_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_courses` (
  `id_student` int NOT NULL,
  `id_course` int NOT NULL,
  PRIMARY KEY (`id_student`,`id_course`),
  KEY `FK_course_student_course_idx` (`id_course`),
  CONSTRAINT `FK_course_student_course` FOREIGN KEY (`id_course`) REFERENCES `course` (`id_course`),
  CONSTRAINT `FK_student_student_course` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courses`
--

LOCK TABLES `student_courses` WRITE;
/*!40000 ALTER TABLE `student_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_module_status`
--

DROP TABLE IF EXISTS `student_module_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_module_status` (
  `id_student` int NOT NULL,
  `id_module` int NOT NULL,
  `id_status` int DEFAULT NULL,
  `progress_percent` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_student`,`id_module`),
  KEY `FK_course_modules_student_module_status_idx` (`id_module`),
  KEY `FK_module_progress_status_student_module_status_idx` (`id_status`),
  CONSTRAINT `FK_course_modules_student_module_status` FOREIGN KEY (`id_module`) REFERENCES `modules` (`id_module`),
  CONSTRAINT `FK_module_progress_status_student_module_status` FOREIGN KEY (`id_status`) REFERENCES `module_progress_status` (`id_status`),
  CONSTRAINT `FK_student_student_module_status` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_module_status`
--

LOCK TABLES `student_module_status` WRITE;
/*!40000 ALTER TABLE `student_module_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_module_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_lessons`
--

DROP TABLE IF EXISTS `teacher_lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_lessons` (
  `teacher_id` int NOT NULL,
  `lesson_id` int NOT NULL,
  PRIMARY KEY (`teacher_id`,`lesson_id`),
  KEY `FK_teachers_lessons_idx` (`lesson_id`),
  CONSTRAINT `FK_teachers_lessons` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id_lesson`),
  CONSTRAINT `FK_teachers_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id_teacher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_lessons`
--

LOCK TABLES `teacher_lessons` WRITE;
/*!40000 ALTER TABLE `teacher_lessons` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id_teacher` int NOT NULL,
  `teacher_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_teacher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-13 11:40:16
