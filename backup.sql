-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: quiz_app
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES (1,'First Quiz','Complete your first quiz','firstquiz.png'),(2,'Bronze Champion','Score more than 25 points in a quiz','bronzechampion.png'),(3,'High score','Score more than 50 points in a quiz','highscore.png'),(4,'Gold Master','Score more than 100 points in a quiz','gold.png');
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenger_id` int(11) NOT NULL,
  `challenged_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `status` enum('pending','accepted','rejected','completed') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `challenger_id` (`challenger_id`),
  KEY `challenged_id` (`challenged_id`),
  KEY `quiz_id` (`quiz_id`),
  CONSTRAINT `challenges_ibfk_1` FOREIGN KEY (`challenger_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `challenges_ibfk_2` FOREIGN KEY (`challenged_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `challenges_ibfk_3` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES (4,3,2,1,'accepted'),(5,3,2,1,'accepted'),(6,3,2,1,'accepted'),(7,3,2,1,'accepted'),(8,3,2,1,'accepted'),(9,3,2,1,'accepted'),(10,3,2,1,'accepted'),(11,3,2,1,'accepted'),(12,3,2,1,'accepted'),(13,3,2,1,'accepted'),(14,3,2,1,'accepted'),(15,3,2,1,'accepted'),(16,3,2,1,'accepted'),(17,2,3,1,'accepted'),(18,3,2,1,'accepted'),(19,3,2,1,'accepted'),(20,3,2,1,'accepted'),(21,3,2,1,'accepted');
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `friend_id` (`friend_id`),
  CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (27,1,3,'pending'),(28,2,3,'accepted');
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaderboard`
--

DROP TABLE IF EXISTS `leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leaderboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `leaderboard_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaderboard`
--

LOCK TABLES `leaderboard` WRITE;
/*!40000 ALTER TABLE `leaderboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,2,3,'kako si mirkec','2024-12-19 15:02:24',1),(2,2,3,'da','2024-12-19 15:03:06',1),(3,2,3,'dada','2024-12-19 15:09:00',1),(4,2,3,'','2024-12-19 15:12:40',1),(5,2,3,'tastastastas','2024-12-19 15:13:08',1),(6,2,3,'tatataarata','2024-12-19 15:16:47',1),(7,2,3,'type','2024-12-19 15:23:59',1),(8,2,3,'da da ','2024-12-19 15:25:03',1),(9,2,3,'tiri','2024-12-19 15:27:41',1),(10,2,3,'taradataradataradadsaatadas','2024-12-19 15:28:14',1),(11,2,3,'bok','2024-12-19 15:31:39',1),(12,3,2,'sta ima \n','2024-12-19 15:32:20',1),(13,3,2,'tarada','2024-12-19 15:35:47',1),(14,3,2,'tara','2024-12-19 15:45:31',1),(15,3,2,'rata','2024-12-19 15:51:32',1),(16,2,3,'mata','2024-12-19 15:51:44',1),(17,3,2,'dobro sam kako si ti','2024-12-19 15:53:14',1),(18,3,2,'sta ima ','2024-12-19 15:56:25',1),(19,3,2,'daa','2024-12-19 15:56:51',1),(20,3,1,'da','2024-12-19 16:53:18',0),(21,3,2,'kako si brate moj kakav si mi ovaj dana sta radis kako sve ostalo jesi dobar ovo ofono kako si brate moj kakav si mi ovaj dana sta radis kako sve ostalo jesi dobar ovo ofono kako si brate moj kakav si mi ovaj dana sta radis kako sve ostalo jesi dobar ovo ofono kako si brate moj kakav si mi ovaj dana sta radis kako sve ostalo jesi dobar ovo ofono ','2024-12-19 16:53:39',1),(22,2,3,'','2024-12-19 17:00:47',1),(23,3,2,'disi sta ima\n','2025-01-01 15:57:21',0),(24,3,2,'bok kako si\n','2025-01-02 21:25:28',0),(25,2,3,'dobro sam kako si mi ti','2025-01-02 21:25:39',0);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (1,'Sample Quiz','This is a sample quiz.','2024-12-08 15:27:18');
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_achievements`
--

DROP TABLE IF EXISTS `user_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_achievements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `achievement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_achievement` (`user_id`,`achievement_id`),
  KEY `achievement_id` (`achievement_id`),
  CONSTRAINT `user_achievements_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_achievements_ibfk_2` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_achievements`
--

LOCK TABLES `user_achievements` WRITE;
/*!40000 ALTER TABLE `user_achievements` DISABLE KEYS */;
INSERT INTO `user_achievements` VALUES (1,1,1),(2,1,2),(3,2,1),(58,2,2),(4,3,1),(52,3,2),(56,3,3),(16,4,1),(10,8,1),(30,9,1);
/*!40000 ALTER TABLE `user_achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_answers`
--

DROP TABLE IF EXISTS `user_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `room_id` varchar(255) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_answers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_answers`
--

LOCK TABLES `user_answers` WRITE;
/*!40000 ALTER TABLE `user_answers` DISABLE KEYS */;
INSERT INTO `user_answers` VALUES (1,2,'room1',NULL,'',0,'2024-12-06 14:39:44'),(2,2,'room1',NULL,'',0,'2024-12-06 14:39:44'),(3,3,'room1',NULL,'',0,'2024-12-06 14:39:44'),(4,3,'room1',NULL,'',0,'2024-12-06 14:39:44'),(5,2,'room1',NULL,'',0,'2024-12-06 14:42:55'),(6,2,'room1',NULL,'',0,'2024-12-06 14:42:55'),(7,3,'room1',NULL,'',0,'2024-12-06 14:42:55'),(8,3,'room1',NULL,'',0,'2024-12-06 14:42:55'),(9,3,'room1',NULL,'Sahara',1,'2024-12-06 14:49:44'),(10,3,'room1',NULL,'Sahara',1,'2024-12-06 14:49:44'),(11,2,'room1',NULL,'Sahara',1,'2024-12-06 14:49:44'),(12,2,'room1',NULL,'Sahara',1,'2024-12-06 14:49:44'),(13,3,'room1',NULL,'dara',0,'2024-12-06 14:54:24'),(14,3,'room1',NULL,'Sahara',1,'2024-12-06 14:54:24'),(15,8,'room1',NULL,'dara',0,'2024-12-06 14:54:24'),(16,8,'room1',NULL,'Sahara',1,'2024-12-06 14:54:24'),(17,2,'room1',NULL,'Canberra',1,'2024-12-07 11:28:28'),(18,2,'room1',NULL,'',0,'2024-12-07 11:28:28'),(19,3,'room1',NULL,'Canberra',1,'2024-12-07 11:28:28'),(20,3,'room1',NULL,'',0,'2024-12-07 11:28:28'),(21,3,'room1',NULL,'Paris',1,'2024-12-07 11:37:36'),(22,3,'room1',NULL,'',0,'2024-12-07 11:37:36'),(23,2,'room1',NULL,'Paris',1,'2024-12-07 11:37:36'),(24,2,'room1',NULL,'',0,'2024-12-07 11:37:36'),(25,3,'room1',NULL,'206',1,'2024-12-07 11:45:12'),(26,3,'room1',NULL,'206',1,'2024-12-07 11:45:12'),(27,4,'room1',NULL,'206',1,'2024-12-07 11:45:12'),(28,4,'room1',NULL,'206',1,'2024-12-07 11:45:12'),(29,4,'room1',NULL,'Au',1,'2024-12-07 12:01:44'),(30,4,'room1',NULL,'',0,'2024-12-07 12:01:44'),(31,3,'room1',NULL,'Au',1,'2024-12-07 12:01:44'),(32,3,'room1',NULL,'',0,'2024-12-07 12:01:44'),(33,4,'room1',NULL,'Paris',1,'2024-12-07 12:04:42'),(34,4,'room1',NULL,'Paris',1,'2024-12-07 12:04:42'),(35,3,'room1',NULL,'Paris',1,'2024-12-07 12:04:42'),(36,3,'room1',NULL,'Paris',1,'2024-12-07 12:04:42'),(37,3,'room1',NULL,'Albert Einstein',1,'2024-12-07 12:08:35'),(38,3,'room1',NULL,'Albert Einstein',1,'2024-12-07 12:08:35'),(39,2,'room1',NULL,'Albert Einstein',1,'2024-12-07 12:08:35'),(40,2,'room1',NULL,'Albert Einstein',1,'2024-12-07 12:08:35'),(41,2,'room1',NULL,'1969',1,'2024-12-07 12:11:56'),(42,2,'room1',NULL,'1969',1,'2024-12-07 12:11:56'),(43,3,'room1',NULL,'1969',1,'2024-12-07 12:11:56'),(44,3,'room1',NULL,'1969',1,'2024-12-07 12:11:56'),(45,3,'room1',NULL,'Great wall of China',0,'2024-12-08 15:49:42'),(46,3,'room1',NULL,'',0,'2024-12-08 15:49:42'),(47,2,'room1',NULL,'Great wall of China',0,'2024-12-08 15:49:42'),(48,2,'room1',NULL,'',0,'2024-12-08 15:49:42'),(49,3,'room1',NULL,'da',0,'2024-12-08 17:05:29'),(50,3,'room1',NULL,'Au',1,'2024-12-08 17:05:29'),(51,2,'room1',NULL,'da',0,'2024-12-08 17:05:29'),(52,2,'room1',NULL,'Au',1,'2024-12-08 17:05:29'),(53,3,'room1',NULL,'Au',1,'2024-12-09 14:58:41'),(54,3,'room1',NULL,'d',0,'2024-12-09 14:58:41'),(55,9,'room1',NULL,'Au',1,'2024-12-09 14:58:41'),(56,9,'room1',NULL,'d',0,'2024-12-09 14:58:41'),(57,3,'staima',NULL,'da',0,'2024-12-09 16:14:56'),(58,3,'staima',NULL,'da',0,'2024-12-09 16:14:56'),(59,2,'staima',NULL,'da',0,'2024-12-09 16:14:56'),(60,2,'staima',NULL,'da',0,'2024-12-09 16:14:56'),(61,3,'room1',NULL,'da',0,'2024-12-09 17:02:16'),(62,3,'room1',NULL,'Mount Everest',1,'2024-12-09 17:02:16'),(63,2,'room1',NULL,'da',0,'2024-12-09 17:02:16'),(64,2,'room1',NULL,'Mount Everest',1,'2024-12-09 17:02:16'),(65,2,'room1',NULL,'ra',0,'2024-12-10 13:00:52'),(66,2,'room1',NULL,'da',0,'2024-12-10 13:00:52'),(67,3,'room1',NULL,'ra',0,'2024-12-10 13:00:52'),(68,3,'room1',NULL,'da',0,'2024-12-10 13:00:52'),(69,3,'room1',NULL,'206',1,'2024-12-10 15:18:45'),(70,3,'room1',NULL,'',0,'2024-12-10 15:18:45'),(71,2,'room1',NULL,'206',1,'2024-12-10 15:18:45'),(72,2,'room1',NULL,'',0,'2024-12-10 15:18:45'),(73,3,'room1',NULL,'',0,'2024-12-10 15:29:33'),(74,3,'room1',NULL,'',0,'2024-12-10 15:29:33'),(75,2,'room1',NULL,'',0,'2024-12-10 15:29:33'),(76,2,'room1',NULL,'',0,'2024-12-10 15:29:33'),(77,2,'room1',NULL,'Nile',1,'2024-12-10 15:33:45'),(78,2,'room1',NULL,'Nile',1,'2024-12-10 15:33:45'),(79,3,'room1',NULL,'Nile',1,'2024-12-10 15:33:45'),(80,3,'room1',NULL,'Nile',1,'2024-12-10 15:33:45'),(81,3,'room1',NULL,'',0,'2024-12-10 15:37:02'),(82,3,'room1',NULL,'',0,'2024-12-10 15:37:02'),(83,2,'room1',NULL,'',0,'2024-12-10 15:37:02'),(84,2,'room1',NULL,'',0,'2024-12-10 15:37:02'),(85,2,'room1',NULL,'',0,'2024-12-10 15:39:19'),(86,2,'room1',NULL,'',0,'2024-12-10 15:39:19'),(87,3,'room1',NULL,'',0,'2024-12-10 15:39:19'),(88,3,'room1',NULL,'',0,'2024-12-10 15:39:19'),(89,3,'room1',NULL,'100',1,'2024-12-10 17:05:04'),(90,3,'room1',NULL,'100',1,'2024-12-10 17:05:04'),(91,2,'room1',NULL,'100',1,'2024-12-10 17:05:04'),(92,2,'room1',NULL,'100',1,'2024-12-10 17:05:04'),(93,2,'room1',NULL,'da',0,'2024-12-10 17:35:35'),(94,2,'room1',NULL,'da',0,'2024-12-10 17:35:35'),(95,3,'room1',NULL,'da',0,'2024-12-10 17:35:35'),(96,3,'room1',NULL,'da',0,'2024-12-10 17:35:35'),(97,3,'room1',NULL,'100',1,'2024-12-10 21:06:42'),(98,3,'room1',NULL,'100',1,'2024-12-10 21:06:42'),(99,2,'room1',NULL,'100',1,'2024-12-10 21:06:42'),(100,2,'room1',NULL,'100',1,'2024-12-10 21:06:42'),(101,3,'room1',NULL,'',0,'2024-12-10 21:22:36'),(102,3,'room1',NULL,'',0,'2024-12-10 21:22:36'),(103,2,'room1',NULL,'',0,'2024-12-10 21:22:36'),(104,2,'room1',NULL,'',0,'2024-12-10 21:22:36'),(105,2,'room1',NULL,'ne',0,'2024-12-10 22:33:45'),(106,2,'room1',NULL,'da',0,'2024-12-10 22:33:45'),(107,3,'room1',NULL,'ne',0,'2024-12-10 22:33:45'),(108,3,'room1',NULL,'da',0,'2024-12-10 22:33:45'),(109,2,'room-uxbQLrIzHgBvf1ZqAAAP-XOB5p3fm9yn_yylDAAAS',NULL,'',0,'2024-12-11 10:44:01'),(110,2,'room-uxbQLrIzHgBvf1ZqAAAP-XOB5p3fm9yn_yylDAAAS',NULL,'',0,'2024-12-11 10:44:01'),(111,3,'room-uxbQLrIzHgBvf1ZqAAAP-XOB5p3fm9yn_yylDAAAS',NULL,'',0,'2024-12-11 10:44:01'),(112,3,'room-uxbQLrIzHgBvf1ZqAAAP-XOB5p3fm9yn_yylDAAAS',NULL,'',0,'2024-12-11 10:44:01'),(113,3,'room_1',NULL,'Au',1,'2024-12-11 12:01:26'),(114,3,'room_1',NULL,'ta',0,'2024-12-11 12:01:26'),(115,2,'room_1',NULL,'Au',1,'2024-12-11 12:01:26'),(116,2,'room_1',NULL,'ta',0,'2024-12-11 12:01:26'),(117,3,'room1',NULL,'au',0,'2024-12-11 22:19:21'),(118,3,'room1',NULL,'da',0,'2024-12-11 22:19:21'),(119,2,'room1',NULL,'au',0,'2024-12-11 22:19:21'),(120,2,'room1',NULL,'da',0,'2024-12-11 22:19:21'),(121,2,'room_3',NULL,'canberra',0,'2024-12-19 17:16:14'),(122,2,'room_3',NULL,'Canberra',1,'2024-12-19 17:16:14'),(123,3,'room_3',NULL,'canberra',0,'2024-12-19 17:16:14'),(124,3,'room_3',NULL,'Canberra',1,'2024-12-19 17:16:14'),(125,2,'room_4',NULL,'ag',0,'2025-01-01 15:27:54'),(126,2,'room_4',NULL,'ag',0,'2025-01-01 15:27:54'),(127,2,'room_4',NULL,'Au',1,'2025-01-01 15:27:54'),(128,2,'room_4',NULL,'Au',1,'2025-01-01 15:27:54'),(129,3,'room_4',NULL,'ag',0,'2025-01-01 15:27:54'),(130,3,'room_4',NULL,'ag',0,'2025-01-01 15:27:54'),(131,3,'room_4',NULL,'Au',1,'2025-01-01 15:27:54'),(132,3,'room_4',NULL,'Au',1,'2025-01-01 15:27:54'),(133,2,'room1',NULL,'',0,'2025-01-01 15:30:17'),(134,2,'room1',NULL,'',0,'2025-01-01 15:30:17'),(135,2,'room1',NULL,'',0,'2025-01-01 15:30:17'),(136,2,'room1',NULL,'',0,'2025-01-01 15:30:17'),(137,3,'room1',NULL,'',0,'2025-01-01 15:30:17'),(138,3,'room1',NULL,'',0,'2025-01-01 15:30:17'),(139,3,'room1',NULL,'',0,'2025-01-01 15:30:17'),(140,3,'room1',NULL,'',0,'2025-01-01 15:30:17'),(141,2,'room1',NULL,'',0,'2025-01-01 15:43:37'),(142,2,'room1',NULL,'',0,'2025-01-01 15:43:37'),(143,2,'room1',NULL,'Paris',1,'2025-01-01 15:43:37'),(144,2,'room1',NULL,'Paris',1,'2025-01-01 15:43:37'),(145,3,'room1',NULL,'',0,'2025-01-01 15:43:37'),(146,3,'room1',NULL,'',0,'2025-01-01 15:43:37'),(147,3,'room1',NULL,'Paris',1,'2025-01-01 15:43:37'),(148,3,'room1',NULL,'Paris',1,'2025-01-01 15:43:37'),(149,1,'room1',NULL,'86 billion',1,'2025-01-02 12:45:38'),(150,1,'room1',NULL,'',0,'2025-01-02 12:45:38'),(151,3,'room1',NULL,'86 billion',1,'2025-01-02 12:45:38'),(152,3,'room1',NULL,'',0,'2025-01-02 12:45:38'),(153,1,'room1',NULL,'Wright brothers',1,'2025-01-02 12:51:33'),(154,1,'room1',NULL,'',0,'2025-01-02 12:51:33'),(155,3,'room1',NULL,'Wright brothers',1,'2025-01-02 12:51:33'),(156,3,'room1',NULL,'',0,'2025-01-02 12:51:33'),(157,3,'room1',NULL,'299,792',1,'2025-01-02 21:28:57'),(158,3,'room1',NULL,'',0,'2025-01-02 21:28:57'),(159,2,'room1',NULL,'299,792',1,'2025-01-02 21:28:57'),(160,2,'room1',NULL,'',0,'2025-01-02 21:28:57'),(161,2,'room1',NULL,'100',1,'2025-01-03 13:45:00'),(162,2,'room1',NULL,'',0,'2025-01-03 13:45:00'),(163,2,'room1',NULL,'',0,'2025-01-03 13:45:00'),(164,3,'room1',NULL,'100',1,'2025-01-03 13:45:01'),(165,3,'room1',NULL,'',0,'2025-01-03 13:45:01'),(166,3,'room1',NULL,'',0,'2025-01-03 13:45:01'),(167,3,'room1',NULL,'Rome',0,'2025-01-04 20:18:00'),(168,3,'room1',NULL,'Paris',1,'2025-01-04 20:18:00'),(169,2,'room1',NULL,'Rome',0,'2025-01-04 20:18:00'),(170,2,'room1',NULL,'Paris',1,'2025-01-04 20:18:00'),(171,2,'room1',NULL,'Nil',0,'2025-01-06 19:45:40'),(172,2,'room1',NULL,'Amazon',1,'2025-01-06 19:45:40'),(173,3,'room1',NULL,'Nil',0,'2025-01-06 19:45:40'),(174,3,'room1',NULL,'Amazon',1,'2025-01-06 19:45:40'),(175,3,'room1',NULL,'206',1,'2025-01-07 11:00:25'),(176,3,'room1',NULL,'206',1,'2025-01-07 11:00:25'),(177,2,'room1',NULL,'206',1,'2025-01-07 11:00:25'),(178,2,'room1',NULL,'206',1,'2025-01-07 11:00:25'),(179,2,'room1',NULL,'aa',0,'2025-01-27 18:09:14'),(180,2,'room1',NULL,'Au',1,'2025-01-27 18:09:14'),(181,3,'room1',NULL,'aa',0,'2025-01-27 18:09:14'),(182,3,'room1',NULL,'Au',1,'2025-01-27 18:09:14'),(183,3,'room1',NULL,'Skin',0,'2025-01-27 19:16:11'),(184,3,'room1',NULL,'86 b',0,'2025-01-27 19:16:11'),(185,2,'room1',NULL,'Skin',0,'2025-01-27 19:16:11'),(186,2,'room1',NULL,'86 b',0,'2025-01-27 19:16:11'),(187,3,'room1',NULL,'',0,'2025-01-29 09:56:52'),(188,3,'room1',NULL,'',0,'2025-01-29 09:56:52'),(189,3,'room1',NULL,'',0,'2025-01-29 09:56:52'),(190,3,'room1',NULL,'',0,'2025-01-29 09:56:52'),(191,2,'room1',NULL,'',0,'2025-01-29 09:56:52'),(192,2,'room1',NULL,'',0,'2025-01-29 09:56:52'),(193,2,'room1',NULL,'',0,'2025-01-29 09:56:52'),(194,2,'room1',NULL,'',0,'2025-01-29 09:56:52'),(195,2,'room1',NULL,'Hamlet',1,'2025-01-29 15:29:09'),(196,2,'room1',NULL,'Dadlet',0,'2025-01-29 15:29:09'),(197,3,'room1',NULL,'Hamlet',1,'2025-01-29 15:29:09'),(198,3,'room1',NULL,'Dadlet',0,'2025-01-29 15:29:09');
/*!40000 ALTER TABLE `user_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_performance`
--

DROP TABLE IF EXISTS `user_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_performance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `correct_answers` int(11) NOT NULL,
  `incorrect_answers` int(11) NOT NULL,
  `average_time` float NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `group` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_performance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_performance`
--

LOCK TABLES `user_performance` WRITE;
/*!40000 ALTER TABLE `user_performance` DISABLE KEYS */;
INSERT INTO `user_performance` VALUES (1,3,'animals',1,1,4,2.26,'2025-01-29 21:07:03',NULL),(2,3,'science',3,4,1,5.01,'2025-01-29 21:08:15',NULL),(3,3,'animals',1,1,4,1.65,'2025-01-30 17:14:25',3),(4,3,'animals',1,2,3,0.84,'2025-01-30 18:16:09',1),(5,3,'animals',2,1,4,3.99,'2025-01-30 18:27:18',1),(6,3,'animals',2,2,3,3.54,'2025-01-30 18:28:57',1),(7,3,'animals',2,0,5,1.68,'2025-01-30 18:30:32',1),(8,3,'animals',2,2,3,4.01,'2025-01-30 18:31:15',1),(9,3,'animals',2,2,3,3.67,'2025-01-30 18:31:58',1),(10,3,'animals',2,2,3,3.42,'2025-01-30 18:32:37',1),(11,3,'animals',2,4,1,4.83,'2025-01-30 18:33:24',3),(12,3,'movies',1,2,3,0.74,'2025-01-30 18:36:16',5),(13,3,'animals',1,2,3,0.8,'2025-01-31 09:20:36',1),(14,3,'animals',1,1,4,1.81,'2025-01-31 09:23:37',1),(15,3,'movies',1,1,4,3.32,'2025-01-31 09:42:07',1),(16,3,'animals',1,2,3,3.38,'2025-02-01 09:39:21',1),(17,3,'animals',1,1,4,0.63,'2025-02-01 09:44:33',1),(18,3,'animals',1,2,3,0.79,'2025-02-01 09:49:20',1),(19,2,'animals',2,3,2,4.53,'2025-02-01 12:06:59',3),(20,2,'animals',3,1,4,3.59,'2025-02-01 12:09:53',1),(21,3,'animals',1,3,2,0.58,'2025-02-01 12:57:34',2),(22,3,'animals',1,1,4,0.58,'2025-02-01 12:59:05',1),(23,3,'animals',1,2,3,0.49,'2025-02-01 12:59:52',1),(24,3,'animals',1,3,2,0.62,'2025-02-01 13:00:33',2),(25,3,'animals',1,3,2,0.8,'2025-02-01 13:02:55',2),(26,3,'movies',1,1,4,12.54,'2025-02-02 15:27:54',1),(27,3,'animals',1,2,3,11.94,'2025-02-02 15:37:42',1);
/*!40000 ALTER TABLE `user_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `points` int(11) DEFAULT 0,
  `profile_picture` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT 1,
  `role` enum('user','admin') DEFAULT 'user',
  `coins` int(11) DEFAULT 0,
  `hints` int(11) DEFAULT 0,
  `animals_group` int(11) DEFAULT 1,
  `movies_group` int(11) DEFAULT 1,
  `science_group` int(11) DEFAULT 1,
  `history_group` int(11) DEFAULT 1,
  `geography_group` int(11) DEFAULT 1,
  `general_group` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Luka','proba@gmail.com','$2a$10$K9bEMrHMgd.Hz21YCLfekehdLm2tHqsckhsW7VNs6U7FOfooGeD8a',5,NULL,1,'user',1970,259,1,1,1,1,1,1),(2,'Lukaa','staima@gmail.com','$2a$10$5ZHVcaJWYWiB.fNNDVKf1OUrOq2EnVVSacNpmIkd2WbO.MQnhNBXW',59,'/uploads/2-1733836051162.jpg',1,'user',0,253,1,1,1,1,1,1),(3,'mirko','mirko@s','$2a$10$IOIYaH6nWx7VcBfyYVBrcedh5o/cbZZWZ3v7203H0wQd6AvXeYTG2',71,'/uploads/3-1733839542508.jpg',1,'user',10,887,1,3,5,1,1,1),(4,'Mikic','nitko@gmail.com','$2a$10$Mn5pjx0GKeccIXVbmCHtcOFpU6Su2tKD3ZDRA4DJIxfmbIoOMuU/K',6,NULL,1,'user',0,0,1,1,1,1,1,1),(5,'sadaa','rata@sa','$2a$10$iXUfBnksb3I78sZhFr2ywe1YcMIYR1SmaCSIlQGGAWRWJ5A55AebC',0,NULL,1,'user',0,0,1,1,1,1,1,1),(6,'pike','pike@s','$2a$10$IyFkvZIAwnjr6Jwd9j6dhuPcoO0ykWZuTCoQrEs4nC2BTMa0A/7q.',0,NULL,1,'user',0,0,1,1,1,1,1,1),(7,'kakosi@s','kakosi@s','$2a$10$WjXmKYGwFIngPNCW83b7nuFqfPWIpqEYPenAs/vQAaXkkDUdDEOnm',0,NULL,1,'user',0,0,1,1,1,1,1,1),(8,'neznam','neznam@gmail.com','$2a$10$8Cx4YOF30QvA/vP6MFCmWe5Jc/yDDtucPcJ2h9/4JHfwHGUH80zTa',1,NULL,1,'user',0,10,1,1,1,1,1,1),(9,'marko sopta','mss@gmail.com','$2a$10$N9yx7.jPLbfLiHNy5mvBgeN0l.aviT/Ialyp2qooRjTqhpRDRPHla',0,NULL,1,'user',10,210,1,1,1,1,1,1),(10,'admin','admin@gmail.com','$2a$10$Ep.cUQyri3SM8mcUt/Y3oOWnAl43cI.GZ2ONjk20X0.FLD1PssWBu',0,NULL,1,'admin',0,0,1,1,1,1,1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-27 20:34:44
