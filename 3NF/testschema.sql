-- MySQL dump 10.13  Distrib 5.6.16, for Win32 (x86)
--
-- Host: localhost    Database: test_schema
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `author_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bands`
--

DROP TABLE IF EXISTS `bands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bands` (
  `band_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `band_name` varchar(128) NOT NULL,
  `year_formed` smallint(6) NOT NULL,
  `members` smallint(6) NOT NULL,
  `genre` varchar(75) NOT NULL,
  `year_realased` smallint(6) NOT NULL,
  `singer_id` int(10) unsigned NOT NULL,
  `album_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`band_id`),
  KEY `Band_Singer_idx` (`singer_id`),
  CONSTRAINT `Band_Singer` FOREIGN KEY (`singer_id`) REFERENCES `lead_singer` (`singer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `book_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publisher` varchar(128) NOT NULL,
  `yaer_released` smallint(6) NOT NULL,
  `title` varchar(128) NOT NULL,
  `genre` varchar(75) NOT NULL,
  `ISBN` int(13) NOT NULL,
  `media_format` varchar(20) NOT NULL,
  `purchase_date` date NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `Books` (`author_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `furniture`
--

DROP TABLE IF EXISTS `furniture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `furniture` (
  `furniture_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model` varchar(40) NOT NULL,
  `color` varchar(40) NOT NULL,
  `purchase_date` date NOT NULL,
  `furniture_cost` decimal(10,2) NOT NULL,
  `furniture_purchase_year` smallint(6) NOT NULL,
  `vendor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`furniture_id`),
  KEY `Furniture` (`vendor_id`),
  CONSTRAINT `furniture_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genre_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(75) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lead_singer`
--

DROP TABLE IF EXISTS `lead_singer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_singer` (
  `singer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `singer_first_name` varchar(20) NOT NULL,
  `singer_last_name` varchar(40) NOT NULL,
  `band_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`singer_id`),
  KEY `Lead_Singer_Band_idx` (`band_id`),
  CONSTRAINT `Lead_Singer_Band` FOREIGN KEY (`band_id`) REFERENCES `bands` (`band_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_format`
--

DROP TABLE IF EXISTS `media_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_format` (
  `media_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_format_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`media_format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `studio` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `rating` varchar(8) NOT NULL,
  `genre` varchar(75) NOT NULL,
  `year_realeased` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music` (
  `album_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_name` varchar(75) NOT NULL,
  `year_released` smallint(6) NOT NULL,
  `media_format` varchar(20) NOT NULL,
  `genre` varchar(75) NOT NULL,
  `purchase_date` date NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `band_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `Music_Stores` (`store_id`),
  KEY `Music_Vendors` (`band_id`),
  CONSTRAINT `music_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  CONSTRAINT `music_ibfk_2` FOREIGN KEY (`band_id`) REFERENCES `bands` (`band_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `store_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_name` varchar(128) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(40) NOT NULL,
  `state` char(2) NOT NULL,
  `zip` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tools`
--

DROP TABLE IF EXISTS `tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(80) NOT NULL,
  `model` varchar(40) NOT NULL,
  `purchase_date` date NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `vendor_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tool_id`),
  KEY `Tools_Store` (`store_id`),
  KEY `Tools_Vendors` (`vendor_id`),
  CONSTRAINT `tools_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  CONSTRAINT `tools_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `car_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model` varchar(80) NOT NULL,
  `color` varchar(40) NOT NULL,
  `car_year` smallint(6) NOT NULL,
  `car_purchase_date` date NOT NULL,
  `car_cost` decimal(10,2) unsigned NOT NULL,
  `vendor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`car_id`),
  KEY `Vehicles` (`vendor_id`),
  CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors` (
  `vendor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(128) NOT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_games`
--

DROP TABLE IF EXISTS `video_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_games` (
  `game_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `game_title` varchar(128) NOT NULL,
  `rating` varchar(128) NOT NULL,
  `genre` varchar(75) NOT NULL,
  `players` int(4) NOT NULL,
  `purchase_date` date NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `vendor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`game_id`),
  KEY `Video_Games` (`vendor_id`),
  CONSTRAINT `video_games_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-31 15:09:42
