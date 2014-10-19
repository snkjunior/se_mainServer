-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: space_explorers
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.12.04.2

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
-- Table structure for table `baseship__drons`
--

DROP TABLE IF EXISTS `baseship__drons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseship__drons` (
  `dron_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recharge_start_time` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`dron_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseship__drons`
--

LOCK TABLES `baseship__drons` WRITE;
/*!40000 ALTER TABLE `baseship__drons` DISABLE KEYS */;
INSERT INTO `baseship__drons` VALUES (1,NULL,1),(2,NULL,1),(3,NULL,1);
/*!40000 ALTER TABLE `baseship__drons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseship__drons_equipments`
--

DROP TABLE IF EXISTS `baseship__drons_equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseship__drons_equipments` (
  `dron_id` int(11) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseship__drons_equipments`
--

LOCK TABLES `baseship__drons_equipments` WRITE;
/*!40000 ALTER TABLE `baseship__drons_equipments` DISABLE KEYS */;
INSERT INTO `baseship__drons_equipments` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),(2,1,1),(2,2,2),(2,3,3),(2,6,4),(2,5,5),(3,1,1),(3,2,2);
/*!40000 ALTER TABLE `baseship__drons_equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseship__equipments`
--

DROP TABLE IF EXISTS `baseship__equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseship__equipments` (
  `user_id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseship__equipments`
--

LOCK TABLES `baseship__equipments` WRITE;
/*!40000 ALTER TABLE `baseship__equipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseship__equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseship__info`
--

DROP TABLE IF EXISTS `baseship__info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseship__info` (
  `user_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Название базы',
  `system_id` int(11) NOT NULL COMMENT 'Система, в которой находится корабль',
  `jump_start_time` timestamp NULL DEFAULT NULL COMMENT 'Время начала прыжка в другую систему',
  `jump_end_time` timestamp NULL DEFAULT NULL COMMENT 'Время завершения прыжка в другую систему',
  `jump_system_id` int(11) DEFAULT NULL COMMENT 'Система, в которую корабль совершает прыжок',
  `scientists` int(11) NOT NULL,
  `engineers` int(11) NOT NULL,
  `credits` int(11) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseship__info`
--

LOCK TABLES `baseship__info` WRITE;
/*!40000 ALTER TABLE `baseship__info` DISABLE KEYS */;
INSERT INTO `baseship__info` VALUES (1,'',1,NULL,NULL,NULL,10,10,0);
/*!40000 ALTER TABLE `baseship__info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseship__missions_current`
--

DROP TABLE IF EXISTS `baseship__missions_current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseship__missions_current` (
  `user_id` int(11) NOT NULL,
  `mission_id` int(11) NOT NULL,
  `science_points` int(11) NOT NULL,
  `engineer_points` int(11) NOT NULL,
  `battle_points` int(11) NOT NULL,
  UNIQUE KEY `base_id` (`user_id`,`mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseship__missions_current`
--

LOCK TABLES `baseship__missions_current` WRITE;
/*!40000 ALTER TABLE `baseship__missions_current` DISABLE KEYS */;
INSERT INTO `baseship__missions_current` VALUES (1,1,1,1,1);
/*!40000 ALTER TABLE `baseship__missions_current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseship__missions_done`
--

DROP TABLE IF EXISTS `baseship__missions_done`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseship__missions_done` (
  `user_id` int(11) NOT NULL,
  `mission_id` int(11) NOT NULL,
  UNIQUE KEY `base_id` (`user_id`,`mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseship__missions_done`
--

LOCK TABLES `baseship__missions_done` WRITE;
/*!40000 ALTER TABLE `baseship__missions_done` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseship__missions_done` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseship__modules`
--

DROP TABLE IF EXISTS `baseship__modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseship__modules` (
  `user_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `level` int(11) NOT NULL COMMENT 'Текущий уровень модуля',
  UNIQUE KEY `base_id` (`user_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseship__modules`
--

LOCK TABLES `baseship__modules` WRITE;
/*!40000 ALTER TABLE `baseship__modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseship__modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseship__notifications`
--

DROP TABLE IF EXISTS `baseship__notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseship__notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `info` text NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseship__notifications`
--

LOCK TABLES `baseship__notifications` WRITE;
/*!40000 ALTER TABLE `baseship__notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseship__notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseship__object_researched`
--

DROP TABLE IF EXISTS `baseship__object_researched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseship__object_researched` (
  `user_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  UNIQUE KEY `base_id` (`user_id`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseship__object_researched`
--

LOCK TABLES `baseship__object_researched` WRITE;
/*!40000 ALTER TABLE `baseship__object_researched` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseship__object_researched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseship__production`
--

DROP TABLE IF EXISTS `baseship__production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseship__production` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `engineers` int(11) NOT NULL,
  `last_points` int(11) NOT NULL,
  `change_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseship__production`
--

LOCK TABLES `baseship__production` WRITE;
/*!40000 ALTER TABLE `baseship__production` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseship__production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseship__researches`
--

DROP TABLE IF EXISTS `baseship__researches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseship__researches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `research_id` int(11) NOT NULL,
  `scientists` int(11) NOT NULL,
  `last_point` int(11) NOT NULL,
  `change_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_id` (`user_id`,`research_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseship__researches`
--

LOCK TABLES `baseship__researches` WRITE;
/*!40000 ALTER TABLE `baseship__researches` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseship__researches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseship__researches_learned`
--

DROP TABLE IF EXISTS `baseship__researches_learned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseship__researches_learned` (
  `user_id` int(11) DEFAULT NULL,
  `research_id` int(11) DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`,`research_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseship__researches_learned`
--

LOCK TABLES `baseship__researches_learned` WRITE;
/*!40000 ALTER TABLE `baseship__researches_learned` DISABLE KEYS */;
INSERT INTO `baseship__researches_learned` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `baseship__researches_learned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseship__resources`
--

DROP TABLE IF EXISTS `baseship__resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseship__resources` (
  `user_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  UNIQUE KEY `base_id` (`user_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseship__resources`
--

LOCK TABLES `baseship__resources` WRITE;
/*!40000 ALTER TABLE `baseship__resources` DISABLE KEYS */;
INSERT INTO `baseship__resources` VALUES (1,1,1),(1,2,4);
/*!40000 ALTER TABLE `baseship__resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battles__info`
--

DROP TABLE IF EXISTS `battles__info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battles__info` (
  `battle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mission_id` int(11) DEFAULT NULL,
  `current_side_id` int(11) DEFAULT NULL,
  `turn_start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`battle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battles__info`
--

LOCK TABLES `battles__info` WRITE;
/*!40000 ALTER TABLE `battles__info` DISABLE KEYS */;
/*!40000 ALTER TABLE `battles__info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battles__turns_players`
--

DROP TABLE IF EXISTS `battles__turns_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battles__turns_players` (
  `turn_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `battle_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `turn_number` int(2) DEFAULT NULL,
  PRIMARY KEY (`turn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battles__turns_players`
--

LOCK TABLES `battles__turns_players` WRITE;
/*!40000 ALTER TABLE `battles__turns_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `battles__turns_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battles__units`
--

DROP TABLE IF EXISTS `battles__units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battles__units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `battle_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `is_npc` tinyint(1) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `current_hp` int(11) DEFAULT NULL,
  `w1_shoots` int(11) DEFAULT NULL,
  `w2_shoots` int(11) DEFAULT NULL,
  `e1_charges` int(11) DEFAULT NULL,
  `e2_charges` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battles__units`
--

LOCK TABLES `battles__units` WRITE;
/*!40000 ALTER TABLE `battles__units` DISABLE KEYS */;
/*!40000 ALTER TABLE `battles__units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dron_equipments`
--

DROP TABLE IF EXISTS `dron_equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dron_equipments` (
  `equipment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'LANG. Название снаряжения',
  `description` varchar(64) DEFAULT NULL COMMENT 'LANG. Описание снаряжения',
  `type` set('reactor','computer','equipment') NOT NULL,
  `science_bonus` int(11) NOT NULL DEFAULT '0',
  `engineer_bonus` int(11) NOT NULL DEFAULT '0',
  `battle_bonus` int(11) NOT NULL DEFAULT '0',
  `recharge_bonus` int(11) NOT NULL DEFAULT '0',
  `power` int(11) NOT NULL DEFAULT '0',
  `volume` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dron_equipments`
--

LOCK TABLES `dron_equipments` WRITE;
/*!40000 ALTER TABLE `dron_equipments` DISABLE KEYS */;
INSERT INTO `dron_equipments` VALUES (1,'Простой генератор',NULL,'reactor',0,0,0,100,0,1),(2,'Простой компьютер',NULL,'computer',1,1,1,0,10000,1),(3,'Простой микроскоп',NULL,'equipment',1,0,0,0,4000,1),(4,'Ремонтный набор',NULL,'equipment',0,1,0,0,4000,1),(5,'Лазерная пушка',NULL,'equipment',0,0,1,0,4000,1),(6,'Мощный лазер',NULL,'equipment',0,0,3,0,12000,1);
/*!40000 ALTER TABLE `dron_equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment__extra_effects`
--

DROP TABLE IF EXISTS `equipment__extra_effects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment__extra_effects` (
  `equipment_id` int(11) DEFAULT NULL,
  `effect` varchar(16) DEFAULT NULL,
  `power` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment__extra_effects`
--

LOCK TABLES `equipment__extra_effects` WRITE;
/*!40000 ALTER TABLE `equipment__extra_effects` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment__extra_effects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment__info`
--

DROP TABLE IF EXISTS `equipment__info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment__info` (
  `equipment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` set('armor','weapon','kit') DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment__info`
--

LOCK TABLES `equipment__info` WRITE;
/*!40000 ALTER TABLE `equipment__info` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment__info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment__info_armors`
--

DROP TABLE IF EXISTS `equipment__info_armors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment__info_armors` (
  `equipment_id` int(11) DEFAULT NULL,
  `armor_bonus` int(11) DEFAULT NULL,
  `defence` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment__info_armors`
--

LOCK TABLES `equipment__info_armors` WRITE;
/*!40000 ALTER TABLE `equipment__info_armors` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment__info_armors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment__weapon_info`
--

DROP TABLE IF EXISTS `equipment__weapon_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment__weapon_info` (
  `equipment_id` int(11) DEFAULT NULL,
  `min_damage` int(11) DEFAULT NULL,
  `max_damage` int(11) DEFAULT NULL,
  `min_distance` int(11) DEFAULT NULL,
  `max_distance` int(11) DEFAULT NULL,
  `accuracy` int(11) DEFAULT NULL,
  `shoots` int(11) DEFAULT NULL,
  `bullets_per_shoot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment__weapon_info`
--

LOCK TABLES `equipment__weapon_info` WRITE;
/*!40000 ALTER TABLE `equipment__weapon_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment__weapon_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lang__info`
--

DROP TABLE IF EXISTS `lang__info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lang__info` (
  `lang_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lang__info`
--

LOCK TABLES `lang__info` WRITE;
/*!40000 ALTER TABLE `lang__info` DISABLE KEYS */;
/*!40000 ALTER TABLE `lang__info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lang__translates`
--

DROP TABLE IF EXISTS `lang__translates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lang__translates` (
  `lang_id` int(11) NOT NULL,
  `language` set('ru','en') NOT NULL DEFAULT 'ru',
  `translation` text,
  UNIQUE KEY `lang_id` (`lang_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lang__translates`
--

LOCK TABLES `lang__translates` WRITE;
/*!40000 ALTER TABLE `lang__translates` DISABLE KEYS */;
/*!40000 ALTER TABLE `lang__translates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missions__info`
--

DROP TABLE IF EXISTS `missions__info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `missions__info` (
  `mission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missions__info`
--

LOCK TABLES `missions__info` WRITE;
/*!40000 ALTER TABLE `missions__info` DISABLE KEYS */;
/*!40000 ALTER TABLE `missions__info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missions__maps`
--

DROP TABLE IF EXISTS `missions__maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `missions__maps` (
  `map_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missions__maps`
--

LOCK TABLES `missions__maps` WRITE;
/*!40000 ALTER TABLE `missions__maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `missions__maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missions__maps_cells`
--

DROP TABLE IF EXISTS `missions__maps_cells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `missions__maps_cells` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cell_id` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missions__maps_cells`
--

LOCK TABLES `missions__maps_cells` WRITE;
/*!40000 ALTER TABLE `missions__maps_cells` DISABLE KEYS */;
/*!40000 ALTER TABLE `missions__maps_cells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missions__npc_units`
--

DROP TABLE IF EXISTS `missions__npc_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `missions__npc_units` (
  `npc_unit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  PRIMARY KEY (`npc_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missions__npc_units`
--

LOCK TABLES `missions__npc_units` WRITE;
/*!40000 ALTER TABLE `missions__npc_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `missions__npc_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules__info`
--

DROP TABLE IF EXISTS `modules__info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules__info` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET cp1251 NOT NULL COMMENT 'LANG. Название модуля',
  `description` varchar(32) CHARACTER SET cp1251 DEFAULT NULL COMMENT 'LANG. Описание модуля',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules__info`
--

LOCK TABLES `modules__info` WRITE;
/*!40000 ALTER TABLE `modules__info` DISABLE KEYS */;
INSERT INTO `modules__info` VALUES (1,'module_engineer_name','module_engineer_description'),(2,'module_laboratory_name','module_laboratory_description'),(3,'module_hangar_name','module_hangar_description'),(4,'module_generator_name','module_generator_description'),(5,'module_storage_name','module_storage_description'),(6,'module_residential_name','module_residential_description'),(7,'module_engine_name','module_engine_description');
/*!40000 ALTER TABLE `modules__info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules__levels`
--

DROP TABLE IF EXISTS `modules__levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules__levels` (
  `module_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `bonuses` text CHARACTER SET cp1251 NOT NULL COMMENT 'JSON',
  `engineer_points` int(11) NOT NULL COMMENT 'Количество очков инженерии, которое нужно для улучшения модуля',
  UNIQUE KEY `module_id` (`module_id`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules__levels`
--

LOCK TABLES `modules__levels` WRITE;
/*!40000 ALTER TABLE `modules__levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules__levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules__resources`
--

DROP TABLE IF EXISTS `modules__resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules__resources` (
  `module_id` int(11) NOT NULL COMMENT 'Улучшаемый модуль',
  `level` int(11) NOT NULL COMMENT 'Уровень модуля, до которого собираемся улучшить',
  `item_id` int(11) NOT NULL COMMENT 'Предмет, который нужно будет использовать для улучшения',
  `count` int(11) NOT NULL COMMENT 'Количество предметов, которое нужно для улучшения',
  UNIQUE KEY `module_id` (`module_id`,`level`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules__resources`
--

LOCK TABLES `modules__resources` WRITE;
/*!40000 ALTER TABLE `modules__resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules__resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production__info`
--

DROP TABLE IF EXISTS `production__info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production__info` (
  `production_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(32) DEFAULT NULL,
  `type` set('module_upgrade','resource','dron_equipment') NOT NULL,
  `engineer_points` int(11) DEFAULT NULL,
  PRIMARY KEY (`production_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production__info`
--

LOCK TABLES `production__info` WRITE;
/*!40000 ALTER TABLE `production__info` DISABLE KEYS */;
/*!40000 ALTER TABLE `production__info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production__requirement_researches`
--

DROP TABLE IF EXISTS `production__requirement_researches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production__requirement_researches` (
  `production_id` int(11) DEFAULT NULL,
  `research_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production__requirement_researches`
--

LOCK TABLES `production__requirement_researches` WRITE;
/*!40000 ALTER TABLE `production__requirement_researches` DISABLE KEYS */;
/*!40000 ALTER TABLE `production__requirement_researches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production__requirement_resources`
--

DROP TABLE IF EXISTS `production__requirement_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production__requirement_resources` (
  `production_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production__requirement_resources`
--

LOCK TABLES `production__requirement_resources` WRITE;
/*!40000 ALTER TABLE `production__requirement_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `production__requirement_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `researches__info`
--

DROP TABLE IF EXISTS `researches__info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `researches__info` (
  `research_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `research_points` int(11) NOT NULL,
  `laboratory_level` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`research_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `researches__info`
--

LOCK TABLES `researches__info` WRITE;
/*!40000 ALTER TABLE `researches__info` DISABLE KEYS */;
INSERT INTO `researches__info` VALUES (1,'Металл','Мы нашли руду неопосзнанного происхождения. Свиду это прочный материал коричневатого оттенка.',100,1),(2,'Литий','Этот ресурс похож на предыдущий, но имеет более сложную структуру. Этот ресурс относится к металам и имеет красноватый оттенок.',100,1),(3,'Микроплата','Микроплата на основе нового металла и лития',300,1),(4,'Литийник','Какое-то исследование на основе лития',300,1);
/*!40000 ALTER TABLE `researches__info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `researches__requirement_researches`
--

DROP TABLE IF EXISTS `researches__requirement_researches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `researches__requirement_researches` (
  `research_id` int(11) DEFAULT NULL,
  `requirement_research_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `researches__requirement_researches`
--

LOCK TABLES `researches__requirement_researches` WRITE;
/*!40000 ALTER TABLE `researches__requirement_researches` DISABLE KEYS */;
INSERT INTO `researches__requirement_researches` VALUES (3,1),(3,2),(4,2);
/*!40000 ALTER TABLE `researches__requirement_researches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `researches__requirement_resources`
--

DROP TABLE IF EXISTS `researches__requirement_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `researches__requirement_resources` (
  `research_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `researches__requirement_resources`
--

LOCK TABLES `researches__requirement_resources` WRITE;
/*!40000 ALTER TABLE `researches__requirement_resources` DISABLE KEYS */;
INSERT INTO `researches__requirement_resources` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `researches__requirement_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `resource_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  `volume` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'Металл',NULL,1);
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `unit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_bot` tinyint(1) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `armor` int(11) DEFAULT NULL,
  `accuracy` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `visibility` int(11) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units_equipments`
--

DROP TABLE IF EXISTS `units_equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units_equipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units_equipments`
--

LOCK TABLES `units_equipments` WRITE;
/*!40000 ALTER TABLE `units_equipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `units_equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(32) CHARACTER SET cp1251 NOT NULL,
  `password` varchar(32) CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'snkjunior','b0d16c07aa462bd4ce68cfce4762a079'),(3,'asd','7815696ecbf1c96e6894b779456d330e'),(20,'test','098f6bcd4621d373cade4e832627b4f6'),(21,'asdz','c79bc6d75bfe3699b085ccb0ba55a0df'),(22,'fhg','ad3321bbfbd6af8abcf0f0576a5c893f'),(25,'asdzzxc','7815696ecbf1c96e6894b779456d330e'),(26,'xcvvnasd','eced110fa1737081f2ea67d875118c62');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `world__rewards`
--

DROP TABLE IF EXISTS `world__rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `world__rewards` (
  `reward_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` set('mission','sector','object') DEFAULT NULL,
  `credits` int(11) NOT NULL,
  PRIMARY KEY (`reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `world__rewards`
--

LOCK TABLES `world__rewards` WRITE;
/*!40000 ALTER TABLE `world__rewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `world__rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `world__rewards_resources`
--

DROP TABLE IF EXISTS `world__rewards_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `world__rewards_resources` (
  `reward_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `world__rewards_resources`
--

LOCK TABLES `world__rewards_resources` WRITE;
/*!40000 ALTER TABLE `world__rewards_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `world__rewards_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `world__settings`
--

DROP TABLE IF EXISTS `world__settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `world__settings` (
  `parameter` varchar(64) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `world__settings`
--

LOCK TABLES `world__settings` WRITE;
/*!40000 ALTER TABLE `world__settings` DISABLE KEYS */;
INSERT INTO `world__settings` VALUES ('scientist_pay','5'),('engineer_pay','5');
/*!40000 ALTER TABLE `world__settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `world__systems`
--

DROP TABLE IF EXISTS `world__systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `world__systems` (
  `system_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT 'LANG. Название системы',
  `x` int(11) NOT NULL COMMENT 'Координата Х системы',
  `y` int(11) NOT NULL COMMENT 'Координата У системы',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `world__systems`
--

LOCK TABLES `world__systems` WRITE;
/*!40000 ALTER TABLE `world__systems` DISABLE KEYS */;
INSERT INTO `world__systems` VALUES (1,'Пегас',50,50);
/*!40000 ALTER TABLE `world__systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `world__systems_objects`
--

DROP TABLE IF EXISTS `world__systems_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `world__systems_objects` (
  `object_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system_id` int(11) NOT NULL COMMENT 'Система, в которой находится объект',
  `name` varchar(32) CHARACTER SET cp1251 NOT NULL COMMENT 'LANG. Наименование объекта',
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `img` varchar(64) CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `world__systems_objects`
--

LOCK TABLES `world__systems_objects` WRITE;
/*!40000 ALTER TABLE `world__systems_objects` DISABLE KEYS */;
INSERT INTO `world__systems_objects` VALUES (1,1,'Пегас-1',200,200,'planet.png'),(2,1,'Астероид',650,300,'asteroid.png');
/*!40000 ALTER TABLE `world__systems_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `world__systems_objects_missions`
--

DROP TABLE IF EXISTS `world__systems_objects_missions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `world__systems_objects_missions` (
  `mission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL COMMENT 'Сектор, в котором находится задание',
  `name` varchar(32) CHARACTER SET cp1251 NOT NULL COMMENT 'LANG. Название задания',
  `description` varchar(32) CHARACTER SET cp1251 DEFAULT NULL COMMENT 'LANG. Опиание задания',
  `science_points` int(11) NOT NULL DEFAULT '0' COMMENT 'Количетсво очков исследования, которое нужно для выполнения задания',
  `engineer_points` int(11) NOT NULL DEFAULT '0' COMMENT 'Количество очков инженерии, которое нужно для выполнения задания',
  `battle_points` int(11) NOT NULL DEFAULT '0' COMMENT 'Количество военных очков, которое нужно для выполнение миссии',
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=cp1250;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `world__systems_objects_missions`
--

LOCK TABLES `world__systems_objects_missions` WRITE;
/*!40000 ALTER TABLE `world__systems_objects_missions` DISABLE KEYS */;
INSERT INTO `world__systems_objects_missions` VALUES (1,1,'Геологическое исследование',NULL,5,5,0,100,100),(2,1,'Остывший вулкан',NULL,5,6,0,650,360),(3,1,'Неизвестные дикий животные',NULL,5,0,4,300,340),(4,2,'Горная порода',NULL,5,10,0,430,400),(5,2,'Враждебная фауна',NULL,0,0,10,460,150),(6,3,'Изучение местной воды',NULL,10,0,0,0,0),(7,3,'Обитатели океана',NULL,4,5,4,0,0);
/*!40000 ALTER TABLE `world__systems_objects_missions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-19 20:08:50
