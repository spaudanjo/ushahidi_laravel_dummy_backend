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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_08_31_095459_create_users_table',1),('2013_07_24_132419_create_oauth_clients_table',2),('2013_07_24_133032_create_oauth_client_endpoints_table',2),('2013_07_24_133359_create_oauth_sessions_table',2),('2013_07_24_133833_create_oauth_session_access_tokens_table',2),('2013_07_24_134209_create_oauth_session_authcodes_table',2),('2013_07_24_134437_create_oauth_session_redirects_table',2),('2013_07_24_134700_create_oauth_session_refresh_tokens_table',2),('2013_07_24_135036_create_oauth_scopes_table',2),('2013_07_24_135250_create_oauth_session_token_scopes_table',2),('2013_07_24_135634_create_oauth_session_authcode_scopes_table',2),('2013_08_07_112010_create_oauth_grants_table',2),('2013_08_07_112252_create_oauth_client_grants_table',2),('2013_08_07_183251_create_oauth_client_scopes_table',2),('2013_08_07_183635_create_oauth_grant_scopes_table',2),('2013_08_07_183636_create_oauth_client_metadata_table',2),('2014_09_05_201439_create_posts_table',3),('2014_09_07_094418_add_image_path_to_posts_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_endpoints`
--

DROP TABLE IF EXISTS `oauth_client_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_endpoints` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_client_endpoints_client_id_foreign` (`client_id`),
  CONSTRAINT `oauth_client_endpoints_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_endpoints`
--

LOCK TABLES `oauth_client_endpoints` WRITE;
/*!40000 ALTER TABLE `oauth_client_endpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_endpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_grants`
--

DROP TABLE IF EXISTS `oauth_client_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_grants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `grant_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_client_grants_client_id_foreign` (`client_id`),
  KEY `oauth_client_grants_grant_id_foreign` (`grant_id`),
  CONSTRAINT `oauth_client_grants_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_client_grants_grant_id_foreign` FOREIGN KEY (`grant_id`) REFERENCES `oauth_grants` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_grants`
--

LOCK TABLES `oauth_client_grants` WRITE;
/*!40000 ALTER TABLE `oauth_client_grants` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_metadata`
--

DROP TABLE IF EXISTS `oauth_client_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_metadata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_client_metadata_cid_key_unique` (`client_id`,`key`),
  KEY `oauth_client_metadata_client_id_index` (`client_id`),
  CONSTRAINT `oauth_client_metadata_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_metadata`
--

LOCK TABLES `oauth_client_metadata` WRITE;
/*!40000 ALTER TABLE `oauth_client_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_scopes`
--

DROP TABLE IF EXISTS `oauth_client_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_client_scopes_client_id_foreign` (`client_id`),
  KEY `oauth_client_scopes_scope_id_foreign` (`scope_id`),
  CONSTRAINT `oauth_client_scopes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_client_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_scopes`
--

LOCK TABLES `oauth_client_scopes` WRITE;
/*!40000 ALTER TABLE `oauth_client_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `oauth_clients_id_unique` (`id`),
  UNIQUE KEY `oauth_clients_id_secret_unique` (`id`,`secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES ('test_id','test_secret','','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_grant_scopes`
--

DROP TABLE IF EXISTS `oauth_grant_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_grant_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grant_id` int(10) unsigned NOT NULL,
  `scope_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_grant_scopes_grant_id_foreign` (`grant_id`),
  KEY `oauth_grant_scopes_scope_id_foreign` (`scope_id`),
  CONSTRAINT `oauth_grant_scopes_grant_id_foreign` FOREIGN KEY (`grant_id`) REFERENCES `oauth_grants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_grant_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_grant_scopes`
--

LOCK TABLES `oauth_grant_scopes` WRITE;
/*!40000 ALTER TABLE `oauth_grant_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_grant_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_grants`
--

DROP TABLE IF EXISTS `oauth_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_grants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grant` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_grants_grant_unique` (`grant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_grants`
--

LOCK TABLES `oauth_grants` WRITE;
/*!40000 ALTER TABLE `oauth_grants` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_scopes`
--

DROP TABLE IF EXISTS `oauth_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scope` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_scopes_scope_unique` (`scope`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_scopes`
--

LOCK TABLES `oauth_scopes` WRITE;
/*!40000 ALTER TABLE `oauth_scopes` DISABLE KEYS */;
INSERT INTO `oauth_scopes` VALUES (1,'basic','basic_name','basic_description','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `oauth_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_session_access_tokens`
--

DROP TABLE IF EXISTS `oauth_session_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_session_access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(10) unsigned NOT NULL,
  `access_token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_expires` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_session_access_tokens_access_token_session_id_unique` (`access_token`,`session_id`),
  KEY `oauth_session_access_tokens_session_id_index` (`session_id`),
  CONSTRAINT `oauth_session_access_tokens_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_session_access_tokens`
--

LOCK TABLES `oauth_session_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_session_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_session_access_tokens` VALUES (1,1,'6PF67DH6lFUiJ4H4F6kKSbM2g563VrPGHgpSDxAD',1410102239,'2014-08-31 13:03:59','2014-08-31 13:03:59'),(2,2,'ecVTqsI9xB4WlfvIjiDbnuCWPThMRuR0xJy3pExI',1410103073,'2014-08-31 13:17:53','2014-08-31 13:17:53'),(3,3,'zLJUHtN6FZLvDCpqJY7mqmupKowP8jl9hcu17zhL',1410103186,'2014-08-31 13:19:46','2014-08-31 13:19:46'),(4,4,'rNUEbwNqoPUoYYDf7GL9JmHFjpn9nDOn5xx7IWEI',1410115491,'2014-08-31 16:44:51','2014-08-31 16:44:51'),(5,5,'PsK9b8WtClm2ta7g27oQro0nw7Bz8AhBNVHB5Wp2',1410115558,'2014-08-31 16:45:58','2014-08-31 16:45:58'),(6,6,'puHn2x6jEPmUAUO1USUldrRN0tIoEyWrkVShBx0a',1410115564,'2014-08-31 16:46:04','2014-08-31 16:46:04'),(7,7,'WDq2rm2XhHKlMTjbvHmzwjtOGSyAjZAP1l49CA2N',1410115570,'2014-08-31 16:46:10','2014-08-31 16:46:10'),(8,8,'FVlIyceOVJ8LBQk4wbqCYgdDctM56hCISmfaMnWo',1410115679,'2014-08-31 16:47:59','2014-08-31 16:47:59'),(9,9,'p31G8D1995mMpeivjdoAcqm2kxQ7eTmdHRDI80Gc',1410115743,'2014-08-31 16:49:03','2014-08-31 16:49:03'),(10,10,'T33G9Ry584HlzFXNvbXWA0n4sv4xXiCuiIiIyYNW',1410115743,'2014-08-31 16:49:03','2014-08-31 16:49:03'),(11,11,'FJo0smQebqm1tziNvSkseNwteuIKehpmZoHN3YDD',1410115744,'2014-08-31 16:49:04','2014-08-31 16:49:04'),(12,12,'kHOiGnf031PRDVHsiOIZzxczTsaJ8PDwbP2r3abU',1410115744,'2014-08-31 16:49:04','2014-08-31 16:49:04'),(13,13,'y2KHKJ6WCZGZv37s1TFoc9p8eVmKWiuyUuiWgw9S',1410115745,'2014-08-31 16:49:05','2014-08-31 16:49:05'),(14,14,'UXA1a6NgMSzau0K7dglP7zuTcL9ljJF9852QH3gk',1410157431,'2014-09-01 04:23:51','2014-09-01 04:23:51'),(15,15,'0guXmes7G0TqYvuCYdtNZgmPaGOApgvK2FSZPPVJ',1410158331,'2014-09-01 04:38:51','2014-09-01 04:38:51'),(16,16,'B1KHq0Rvw0yJn9NIBys8j85T9Kh9xCHboO2VPJL1',1410158341,'2014-09-01 04:39:01','2014-09-01 04:39:01'),(17,17,'atOzJQUi9i6i1Zkeivc4wPeGO6xOXftMy5uwERUq',1410158349,'2014-09-01 04:39:09','2014-09-01 04:39:09'),(18,18,'GrfcZ1pZjsgPq0Ml1OyfnbIdIBimAR8KBHl2Pu6B',1410158377,'2014-09-01 04:39:37','2014-09-01 04:39:37'),(19,19,'5gZajtWZg6zEHaGv5a8sOvS6L3p7kBzWyO9LKY05',1410158386,'2014-09-01 04:39:46','2014-09-01 04:39:46'),(20,20,'O4v6tK8JkLo4D5O05aYrXIJk41GhZZruGvpjEKfK',1410158414,'2014-09-01 04:40:14','2014-09-01 04:40:14'),(21,21,'8yKnVlEjhiqesJ2XrGyJLUTdU24dr6NCkhX6N1Xe',1410158422,'2014-09-01 04:40:22','2014-09-01 04:40:22'),(22,22,'S9GZM3uGrV86qzHWGCMtiEewmVQo6kCrrGUrkzkQ',1410199593,'2014-09-01 16:06:33','2014-09-01 16:06:33'),(23,23,'bdu3JSXCveJLtzNzLqMByUx8kwF41tfnPZNkX1QI',1410199888,'2014-09-01 16:11:28','2014-09-01 16:11:28'),(24,24,'0ZTjtdV5i3suGoBuywivB3KvJNZ72ZLyipGqUOSX',1410199896,'2014-09-01 16:11:36','2014-09-01 16:11:36'),(25,25,'kh4qqB9HbB8KuhJNSJbkWxmOsJUfsjhhRL7ULvq6',1410340167,'2014-09-03 07:09:27','2014-09-03 07:09:27'),(26,26,'uhNeJcLQTPpdUq1eh5MYdRgaRzfHa7pTkGrRddFj',1410340846,'2014-09-03 07:20:46','2014-09-03 07:20:46'),(27,27,'S4ZisbbstoveHbu7KJsT4Bmn0Qo5J0921dpyOCl9',1410340852,'2014-09-03 07:20:52','2014-09-03 07:20:52'),(28,28,'Lu8BQD9RJWPJZNbheTpIIZQ9DOnvBCqXIli4lA8h',1410340914,'2014-09-03 07:21:54','2014-09-03 07:21:54'),(29,29,'1d7UTgTlvLVXj1RMV7bRaljoGPMC3PdExWiYfjjw',1410340979,'2014-09-03 07:22:59','2014-09-03 07:22:59'),(30,30,'TEBy9AixVlXv6WjMIHVXzs0zdWsRMVu2seiebqfH',1410340988,'2014-09-03 07:23:08','2014-09-03 07:23:08'),(31,31,'gjzv4gYbfKlcm3xUqWRwULnarB1JtOsIC7OkHQau',1410341355,'2014-09-03 07:29:15','2014-09-03 07:29:15'),(32,32,'hp0Lr5LM630ya9UKQ73d17EgFXKfjCgLlG4i5WfV',1410441724,'2014-09-04 11:22:04','2014-09-04 11:22:04'),(33,33,'yfrK0vEAiV3BjfgMkrRnyIHyhcEED3ftWhuKEhLJ',1410441727,'2014-09-04 11:22:07','2014-09-04 11:22:07'),(34,34,'rumLtGR5nYxG7F6xnniM5oFZSJkZv3MfM2TVcEIF',1410450106,'2014-09-04 13:41:46','2014-09-04 13:41:46'),(35,35,'4sqtRQe3p4c3N1uES5VywWGyawAZtVuF1dmM6meu',1410450848,'2014-09-04 13:54:08','2014-09-04 13:54:08'),(36,36,'W2NfCU1DLcCco8YNkVygTgqNMsX6Nj9uNFYKbI8w',1410451915,'2014-09-04 14:11:55','2014-09-04 14:11:55'),(37,37,'pqDsaVW4q9AdsONuC7Jj7PmRuATPjmd5kj7bCD2i',1410518606,'2014-09-05 08:43:26','2014-09-05 08:43:26'),(38,38,'w4T3tR36KtTLz3qpuBvpfFAz5LmTmC1JTB9JnvEo',1410519575,'2014-09-05 08:59:35','2014-09-05 08:59:35'),(39,39,'TvC0ajCI54MRYmHwEyzbobHsV4s7BIHs2gTibVuW',1410519594,'2014-09-05 08:59:54','2014-09-05 08:59:54'),(40,40,'isDrOvs6IfAAHLvUhkBbUvrPVPxx16zIYpIZ41zf',1410519731,'2014-09-05 09:02:11','2014-09-05 09:02:11'),(41,41,'WKVOUWqEnXvP9aDCisS8IOYwZew9O7ZqwourHupa',1410519916,'2014-09-05 09:05:16','2014-09-05 09:05:16'),(42,42,'UKzfKxQryaGLQXAimqbNTrssu40wluUayro1lOMm',1410519953,'2014-09-05 09:05:53','2014-09-05 09:05:53'),(43,43,'w5Qoyb2ExxV9tuenDBXnC3Pn0bLTRoqwRfFTnck6',1410527666,'2014-09-05 11:14:26','2014-09-05 11:14:26'),(44,44,'hyhbuCG7zKtsysuNbnv9Z4g8cAWctTIcY2cDku5a',1410529013,'2014-09-05 11:36:53','2014-09-05 11:36:53'),(45,45,'LDmmZPlo54bF54XpfmJo8aQPRmTGh4NGSBtEO18P',1410529062,'2014-09-05 11:37:42','2014-09-05 11:37:42'),(46,46,'YbevAJ3qfAXZnr4zjOTfNc2bks73RCtSTbQgbVAl',1410529098,'2014-09-05 11:38:18','2014-09-05 11:38:18'),(47,47,'vRK0zLvBEz7aQ084j52VeEUXna4u9oguJyRcEl4Z',1410530812,'2014-09-05 12:06:52','2014-09-05 12:06:52'),(48,48,'WiOXMlIvInzaTF6s24D7JhUyZWCwOmD47z5oWIdR',1410531161,'2014-09-05 12:12:41','2014-09-05 12:12:41'),(49,49,'qXHZBQ0ek4qTGwoorp4sUjRpk4QJvcBff7Q5i0KC',1410532384,'2014-09-05 12:33:04','2014-09-05 12:33:04'),(50,50,'7CBZNXRoSKXTEGo46aEYuhT1UiO1n2MURs7Ut1io',1410534543,'2014-09-05 13:09:03','2014-09-05 13:09:03'),(51,51,'Kq6ub4FxSMduaTeHhVv8KH9spMTRJKiwxbeYRt6A',1410544989,'2014-09-05 16:03:09','2014-09-05 16:03:09'),(52,52,'4ah49FAbn5JjyMQwCQEZ0D78uBwe5ZlS3HkzDJAD',1410544993,'2014-09-05 16:03:13','2014-09-05 16:03:13'),(53,53,'a2uSq2RhcqbSn30rfUPsiClckWvJEcUc8frcWigu',1410545144,'2014-09-05 16:05:44','2014-09-05 16:05:44'),(54,54,'wUp5nSoZ4sBRLC843eV6Xp8grLYewTPToQjC0juk',1410546240,'2014-09-05 16:24:00','2014-09-05 16:24:00'),(55,55,'KvYh9qfZFXObdzvQNnJyPOyvw7BtTDHrVsOdxUF2',1410546305,'2014-09-05 16:25:05','2014-09-05 16:25:05'),(56,56,'yWEXzjyVB9qzMvKfmaIXJhiVGRzHjSfUUs6TVMyw',1410546308,'2014-09-05 16:25:08','2014-09-05 16:25:08'),(57,57,'YhbKDTbeCRX1MaNofgUFpaEvCAN1d6kgl7qoJy3M',1410546312,'2014-09-05 16:25:12','2014-09-05 16:25:12'),(58,58,'csz01slXuph6YnrE9l9HZFltDjuP5ewCOPaPOJ57',1410546336,'2014-09-05 16:25:37','2014-09-05 16:25:37'),(59,59,'DVK2X1Tk3wC8O2dH23GVVzrWC4r07B15c0lJXDWf',1410546346,'2014-09-05 16:25:46','2014-09-05 16:25:46'),(60,60,'OmWAUiV7nklrRu31YS7rrRQFDzw8W21EKUDlaRq8',1410546347,'2014-09-05 16:25:47','2014-09-05 16:25:47'),(61,61,'mfJflBFer4ScpS92WkzDsdGFZR2hT9rQpIbM1JrW',1410546349,'2014-09-05 16:25:49','2014-09-05 16:25:49'),(62,62,'k0T1I2l6miZxh2Y3XzygcZ9xgHj8Ky7x8T7doslf',1410546353,'2014-09-05 16:25:53','2014-09-05 16:25:53'),(63,63,'IRL24sI08WM26BSVjs6ji1EzoT1oZ0mxLr9XRYNX',1410546356,'2014-09-05 16:25:56','2014-09-05 16:25:56'),(64,64,'Ut07z0ETSg9P4puDRx75K1Uk6044TM6ox8JMkRNf',1410546365,'2014-09-05 16:26:05','2014-09-05 16:26:05'),(65,65,'pSKV8PXVQno28woxtxnz3aL5zIGRGShorryMvQj4',1410546372,'2014-09-05 16:26:12','2014-09-05 16:26:12'),(66,66,'9uGidNxKxmE7q3oJkujY4BZOYVB0NJZZaoAJa0H2',1410546380,'2014-09-05 16:26:20','2014-09-05 16:26:20'),(67,67,'CIzRrUjxanvyun8Xz0yJ1rCtHXL4BRrWcU2rss9W',1410546418,'2014-09-05 16:26:58','2014-09-05 16:26:58'),(68,68,'ZCvVlM0RycGv3M7soYRQyGlPlg6ek8zMGK8ZmBxc',1410547203,'2014-09-05 16:40:03','2014-09-05 16:40:03'),(69,69,'h8cyB5a5B1wDjx1KFk8XDMAwxjBvLxoxVDK5sumu',1410547852,'2014-09-05 16:50:52','2014-09-05 16:50:52'),(70,70,'VQTyO1yYhtkyvEjep6nqEp5DEl26NLWaXPgeIMQ6',1410547907,'2014-09-05 16:51:47','2014-09-05 16:51:47'),(71,71,'vqo3xjQAvhHSzmIQD98Fs4b5ECvbG7NFMk8pGpFG',1410547918,'2014-09-05 16:51:58','2014-09-05 16:51:58'),(72,72,'RRdB31g6TgzaVCsni2S5We7whnTivPOivsK0vas2',1410548911,'2014-09-05 17:08:31','2014-09-05 17:08:31'),(73,73,'0IqoEwrYbkm6TpGytlUuFwbUI99EJ5xPzDZpJOCG',1410548970,'2014-09-05 17:09:30','2014-09-05 17:09:30'),(74,74,'eCOsZRa5BoV8wV9da8Mdwqbp6yRa2g3YcwqzXxH3',1410548974,'2014-09-05 17:09:34','2014-09-05 17:09:34'),(75,75,'vaE5aZc2daz6sUdG3euaexSRovvBgwrEfqW7UT3e',1410548984,'2014-09-05 17:09:44','2014-09-05 17:09:44'),(76,76,'WDayhQpbjKtknzTQb4GJux8oSSFWAQ5jFOocUoZV',1410549636,'2014-09-05 17:20:36','2014-09-05 17:20:36'),(77,77,'WcXvcvYv6IgrS8sIYTKLFASamekvx1TewCHjcHuS',1410549647,'2014-09-05 17:20:47','2014-09-05 17:20:47'),(78,78,'UoHhZgsLh2SSqVfSABLj6oPecbRBeAtI25kO1Eyc',1410550112,'2014-09-05 17:28:32','2014-09-05 17:28:32'),(79,79,'Lfci0OX9VGovzuVVPMvA5O8cf4S4ymr1S7N0wVT1',1410684429,'2014-09-07 06:47:09','2014-09-07 06:47:09'),(80,80,'700rKlJzOLIBkXCufwhtmI57bZdR4lFWdZCZvoRZ',1410689446,'2014-09-07 08:10:46','2014-09-07 08:10:46'),(81,81,'gRE2W7yYU0f8SQt3PvPuTYfmWXuLf1OERFu3IaPP',1410689510,'2014-09-07 08:11:50','2014-09-07 08:11:50'),(82,82,'8bCvOtxNPjxsCrs0dXHtHPm6BoJgvNLIU4NDmTcN',1410690505,'2014-09-07 08:28:25','2014-09-07 08:28:25'),(83,83,'0QLAO7yGBsG7v8YmpXorlrHAL4O7ur5PbBOzmGKP',1410690513,'2014-09-07 08:28:33','2014-09-07 08:28:33'),(84,84,'hARKFFdTvA2ilqbzIbj5rQJciECZqs9GMDkLgV6X',1410690524,'2014-09-07 08:28:44','2014-09-07 08:28:44'),(85,85,'qzPprwp7YTa3qyca69hFzED9xJRfxlylPjD12HBd',1410690751,'2014-09-07 08:32:31','2014-09-07 08:32:31'),(86,86,'J2KGP8ZP2itewdX5P2yb1MGH4BknyTkRfVwwW7PM',1410690919,'2014-09-07 08:35:19','2014-09-07 08:35:19'),(87,87,'fa7blXsLL6H3hPN63MrtyxAJ2GNLhndsSkOISr12',1410690924,'2014-09-07 08:35:24','2014-09-07 08:35:24'),(88,88,'0gUxETGHpf8H4Nws5gyVOOyqloiPc7YYxv6rnoDY',1410690928,'2014-09-07 08:35:28','2014-09-07 08:35:28'),(89,89,'gpddA1peA9ro1QEli5zuCUjj509IbecpSZTNmVDC',1410690950,'2014-09-07 08:35:50','2014-09-07 08:35:50'),(90,90,'neE9Y6Gvzaerg0Bd6jpm4aP4iDSLOSBWf18zDqOL',1410690954,'2014-09-07 08:35:54','2014-09-07 08:35:54'),(91,91,'YLdwW5p7BlNCYDhia8GgJtqZfdKcNfccSLHzVjew',1410690963,'2014-09-07 08:36:03','2014-09-07 08:36:03'),(92,92,'ioXo9L6NPLmx9HNKFQQQeyvvzPhtJyp6mkmAdQZi',1410690966,'2014-09-07 08:36:06','2014-09-07 08:36:06'),(93,93,'YpoUXoC3C5lB2W8NtSAZpbrIROssUJLzfLMNXrw0',1410690972,'2014-09-07 08:36:12','2014-09-07 08:36:12'),(94,94,'rzw2U9sDgFlfL3YnsTrIanPsrZ6Xq9rf0DFbwduN',1410690979,'2014-09-07 08:36:19','2014-09-07 08:36:19'),(95,95,'TeK3EayC7SD4hTWmxKOAdsO11KjPNv2CV43tGcqD',1410690984,'2014-09-07 08:36:24','2014-09-07 08:36:24'),(96,96,'03fgzhxTwOwouklDhBdC3WrPFyX5aBLMCcDVcFrH',1410690990,'2014-09-07 08:36:30','2014-09-07 08:36:30'),(97,97,'I9OCAgI96m2rvHFFlwdhGPBLC08uuHfNYaFnxDve',1410690997,'2014-09-07 08:36:37','2014-09-07 08:36:37'),(98,98,'ZqJZdP2Mc8HzD18Rfk2qtTlnVllsiRlPXU7ruCEt',1410691001,'2014-09-07 08:36:41','2014-09-07 08:36:41'),(99,99,'8FUlMRysyAPfx8BlfLy9KmQ8eGTwJj0M5LJs2uA4',1410691004,'2014-09-07 08:36:44','2014-09-07 08:36:44'),(100,100,'M5T95f3YPAD9i7pfBgyXLBq8DmSBaqd7olpmxv7j',1410691159,'2014-09-07 08:39:19','2014-09-07 08:39:19'),(101,101,'8FOPkCkcvUNI3PWeYGZeVQWWYtlTBxPsRgUJPRSC',1410691329,'2014-09-07 08:42:09','2014-09-07 08:42:09'),(102,102,'HrnKOMkgX4PQ9fMT1JmLOMp0Gu6Q0jDAkKTLuNOi',1410691343,'2014-09-07 08:42:23','2014-09-07 08:42:23'),(103,103,'piMkccrSvfQeM2Ul0LJxT250SfryapHAHh7A9bhK',1410691346,'2014-09-07 08:42:26','2014-09-07 08:42:26'),(104,104,'cAknkzIxjGLwS1lZ57oCsmSFhyaK8DlfjRTpV1w5',1410691348,'2014-09-07 08:42:28','2014-09-07 08:42:28'),(105,105,'i0YKNGQri7sjvmWjOgtDi9pgBnI8zn4WQl0TpwO9',1410691349,'2014-09-07 08:42:29','2014-09-07 08:42:29'),(106,106,'KTxDYIEst2487I2G452q4tDJjvTMI3ebzDfFBLjQ',1410691368,'2014-09-07 08:42:48','2014-09-07 08:42:48'),(107,107,'feXFn0lj2svkeIwq023tT1336Btnz3PxX11Qx5X0',1410691478,'2014-09-07 08:44:38','2014-09-07 08:44:38'),(108,108,'UJDrIuoWdPlHHOFKmjDJhUqYxhkx3TkeEgsxoDdJ',1410691514,'2014-09-07 08:45:14','2014-09-07 08:45:14'),(109,109,'0o3ik0zBmi11ndJleHLLIujaVuXHBSp2YnSrLP5B',1410694571,'2014-09-07 09:36:11','2014-09-07 09:36:11'),(110,110,'PBXgyKzeo3eA3gn1sD5pXaCrcMAJXg9X9dbBnDd2',1410694608,'2014-09-07 09:36:48','2014-09-07 09:36:48'),(111,111,'u5X25YS2IJ4XloFTW5QDVpQxCwhKoegePtW4npoX',1410694722,'2014-09-07 09:38:42','2014-09-07 09:38:42'),(112,112,'TRxXEtdnbvFXZDu5ykOua0v9z1CHbcu05dGJTCKH',1410694775,'2014-09-07 09:39:35','2014-09-07 09:39:35'),(113,113,'alIJUEC3wJPEO7jKQT2TzqgHSL9igwOrcnNA0SMT',1410694803,'2014-09-07 09:40:03','2014-09-07 09:40:03'),(114,114,'sXLD2n2M6xEFsniWY11GyGBuqgl80u6Vu1zbblmq',1410696114,'2014-09-07 10:01:54','2014-09-07 10:01:54'),(115,115,'unzZsih8efo0XOsjlb8MWq7BBRoFstT69O7POZcw',1410696124,'2014-09-07 10:02:04','2014-09-07 10:02:04'),(116,116,'XXZRQ2EF4KIk39hTvubwBX4ZJya4qEDnPMQqzGLg',1410696184,'2014-09-07 10:03:04','2014-09-07 10:03:04'),(117,117,'7SeXcYAXehAgb3Tbxsa7NuSSS99E6lvjhJ8S5KgU',1410696262,'2014-09-07 10:04:22','2014-09-07 10:04:22'),(118,118,'kwKAYhWTOhE8LbxKESOTeOdNtDNCwu7sGR2NcbFk',1410698522,'2014-09-07 10:42:02','2014-09-07 10:42:02'),(119,119,'JfV8EIsMUFOsb8h1D2FPJE0pNguAG9R2HlUoMRX2',1410698925,'2014-09-07 10:48:45','2014-09-07 10:48:45'),(120,120,'zTqabRuBK0SIsHddQfsDJaRVtadpx5Z0kwkOUbuw',1410699436,'2014-09-07 10:57:16','2014-09-07 10:57:16'),(121,121,'alm6qLoIXJLaaNgLMASQnBkruoO0J3omhtk5gZVz',1410704831,'2014-09-07 12:27:11','2014-09-07 12:27:11'),(122,122,'xs3Bisu836ilvSrXp9N16oDxm3jrZI1AB0dW9ESG',1410704871,'2014-09-07 12:27:51','2014-09-07 12:27:51'),(123,123,'9LLkJnHXCCv2SMj1K1QrDMLuyZOtPjLPfpftaRIf',1410704906,'2014-09-07 12:28:26','2014-09-07 12:28:26'),(124,124,'o3ohUMzvLi9btmYiKki3fuWX41DyPQrTqZXPe8xF',1410705248,'2014-09-07 12:34:09','2014-09-07 12:34:09'),(125,125,'t8bX6n3NsRBo2EbYSOJsFJEUyHWi0uUVxpCZTtR3',1410705432,'2014-09-07 12:37:12','2014-09-07 12:37:12'),(126,126,'UCrcZVfwe5IZ1PoY93UKzLWZr7Hz6s3U269OKLy2',1410705558,'2014-09-07 12:39:18','2014-09-07 12:39:18'),(127,127,'uxnYF9raN07uSNpGYeg10HZNAIbmlGZ91P9xVP7H',1410705606,'2014-09-07 12:40:06','2014-09-07 12:40:06'),(128,128,'pniy0d1i6bX6Kb83mtDAeR6s8vWwloMbdfWlm14K',1410705642,'2014-09-07 12:40:42','2014-09-07 12:40:42'),(129,129,'3WWQ1q0N8fkrhncexyG0z5AnfJDjhZoi7KIU3vbX',1410705678,'2014-09-07 12:41:18','2014-09-07 12:41:18'),(130,130,'iHt5sFs1tQXzyD9oRSTlGW4G3S9fc22WbMJqVYTC',1410706109,'2014-09-07 12:48:29','2014-09-07 12:48:29'),(131,131,'CercvXhy7FxE3wiDDTu9m5bFSaX29rsBmc1xrb7D',1410706420,'2014-09-07 12:53:40','2014-09-07 12:53:40'),(132,132,'6O6yov2dOoRnBylvIVbZi0jwqPhfOmuD2JsoIbko',1410706495,'2014-09-07 12:54:55','2014-09-07 12:54:55'),(133,133,'WgCuDYoc5wrTeK2wUwtSEMhowbCuggiqyP9meWLn',1410706500,'2014-09-07 12:55:00','2014-09-07 12:55:00'),(134,134,'cIYRqzao9uDlIEK84anBl2aATY3OBiyX307ttpXx',1410706504,'2014-09-07 12:55:04','2014-09-07 12:55:04'),(135,135,'bNfIVz2HMokzRgGn5eE59vLv0rRFLyfgTcyn1a8c',1410706554,'2014-09-07 12:55:54','2014-09-07 12:55:54'),(136,136,'npLNDMxEdg39o7CmNjTazZSYzTvUMTIc43xkOqh2',1410706803,'2014-09-07 13:00:03','2014-09-07 13:00:03'),(137,137,'UMjNlmJzQmjM0AqSUdhxHEimLriRE5DecBRynwmQ',1410706812,'2014-09-07 13:00:12','2014-09-07 13:00:12'),(138,138,'HLZAWEieE6GIIrwDkby7aH959igWmc4CoajNvfWM',1410706819,'2014-09-07 13:00:19','2014-09-07 13:00:19'),(139,139,'NFmwznTdy5X0TioG7XikmB6q5Y6fZD7g8QTnyYWS',1410707072,'2014-09-07 13:04:32','2014-09-07 13:04:32'),(140,140,'Y0jpxKKP5Axbc29zUnQzJqWjn37IJxVLLHmiKBg8',1410707309,'2014-09-07 13:08:29','2014-09-07 13:08:29'),(141,141,'RPUfMePkpbYWHZocvvBNyYjUdQSmzLqNnIfT3Eoa',1410707314,'2014-09-07 13:08:34','2014-09-07 13:08:34'),(142,142,'xp9JvYyxiiNjHtk0rKD7gvDosrGLEzuom453MKc5',1410707335,'2014-09-07 13:08:55','2014-09-07 13:08:55'),(143,143,'RLvxrOGWshWg1hsg9HOI7nEeQeaoesZaHL285fLn',1410707339,'2014-09-07 13:08:59','2014-09-07 13:08:59'),(144,144,'N3Yd9ZJu2OTelScaEugU8k8DL1RTwLTq81KpFYNZ',1410707357,'2014-09-07 13:09:17','2014-09-07 13:09:17'),(145,145,'i6ljLsk6kYCNI2mCUqks7PBnxFCjtgTfwpHEA0xt',1410707490,'2014-09-07 13:11:30','2014-09-07 13:11:30'),(146,146,'cv7NoZhzirgzBfDsJkRpk32TLULxYUU048nWZjTw',1410707907,'2014-09-07 13:18:27','2014-09-07 13:18:27'),(147,147,'axLAa73ez3uh5yGYv7XIhtKQxkayStPUb7dB5UlY',1410707916,'2014-09-07 13:18:36','2014-09-07 13:18:36'),(148,148,'wBMNsXjzclCDlzXGJv1YASs7pNF5uueDlYFb2WS8',1410708021,'2014-09-07 13:20:21','2014-09-07 13:20:21'),(149,149,'0qYWVTqm9QNvMyws7LA9x6gViWo7sdw2707HJCLv',1410709559,'2014-09-07 13:45:59','2014-09-07 13:45:59'),(150,150,'l9EMKWBkXWxsqjCcRApjcF8QblcPf3aMwzc6yV1Z',1410709789,'2014-09-07 13:49:49','2014-09-07 13:49:49'),(151,151,'6eEgjhRaZ94B4LvLPcG5CD4g5wjYNga9PPbFjrWC',1410709875,'2014-09-07 13:51:15','2014-09-07 13:51:15'),(152,152,'HLVdF7DSC4WISnCMEBBVvk2HxHbuefFDaHOFcU9S',1410709887,'2014-09-07 13:51:27','2014-09-07 13:51:27'),(153,153,'E0RgdTI7CBfPz14HlllmWYGR3plyPbGspsMz0rAr',1410709894,'2014-09-07 13:51:34','2014-09-07 13:51:34'),(154,154,'ZnhfOtV8HetqXDr7n34W3sBnyasw85pagOzNOydY',1410709899,'2014-09-07 13:51:39','2014-09-07 13:51:39'),(155,155,'36jBDe07LkX9x5pweYIq5QmBFVkDHvCdxbrfAPeg',1410766086,'2014-09-08 05:28:06','2014-09-08 05:28:06'),(156,156,'j2fBSYHDNzWPlYIQ99zEBltoiABGN421h4E05fcx',1410767003,'2014-09-08 05:43:23','2014-09-08 05:43:23'),(157,157,'TJhflyGbJQd1EcpUln9CqIveAV007ZYgfQVKSaTY',1410767852,'2014-09-08 05:57:32','2014-09-08 05:57:32'),(158,158,'Xq3DZ8CUWBsdfrjMIKJrzQDaTkPAKvivT9YVSqiJ',1410767868,'2014-09-08 05:57:48','2014-09-08 05:57:48'),(159,159,'L1jHe9pJcLQlubzK6HwNRvLFzqrQUpfQyg32MVqm',1410856339,'2014-09-09 06:32:19','2014-09-09 06:32:19'),(160,160,'4AbQmlBKyUuOG0rYs7dWEk7bOnr4106yB4hJc9GH',1410857991,'2014-09-09 06:59:51','2014-09-09 06:59:51'),(161,161,'FW3IzjmqzEy2wEfH3BWN17XfP9bzwkEfijdAjtbX',1410857998,'2014-09-09 06:59:58','2014-09-09 06:59:58'),(162,162,'VLKKX1ATdw8P89jKsmpuSEu0EwuHc022mb4NytIk',1410985702,'2014-09-10 18:28:22','2014-09-10 18:28:22'),(163,163,'mmi8hIUAJsf4ABxpIp8gfzHOerl6VD7ZnH9TMtB0',1410985828,'2014-09-10 18:30:28','2014-09-10 18:30:28'),(164,164,'GBEBevxo6O9Q14YfW7PHdDXltk8QUmKnteiEM2rG',1410985899,'2014-09-10 18:31:39','2014-09-10 18:31:39'),(165,165,'66t5ikpzmgxjlvxGAKhGpHHw8X4q6o2MU0oHC6bR',1410985918,'2014-09-10 18:31:58','2014-09-10 18:31:58'),(166,166,'qPct119X6nLNgOFNJNB38DkhlsqkQaxHCdpaAN0p',1411031014,'2014-09-11 07:03:34','2014-09-11 07:03:34'),(167,167,'eAvJAqUVM8sLBFy907y5M0KeTQMk9tv7zUwb8Sem',1411055784,'2014-09-11 13:56:24','2014-09-11 13:56:24'),(168,168,'ryr7xZsgT16Lg83OWWoQx3O3iBcyGkaFKYW5cn8q',1411063266,'2014-09-11 16:01:06','2014-09-11 16:01:06'),(169,169,'MJsq12QpXd89H3aWOKQEipeYvvgy0Bm0TbCwdDWI',1411064262,'2014-09-11 16:17:42','2014-09-11 16:17:42'),(170,170,'DxcZbuXmt10GXrSOvVsdJfub8KfZBgVZln48NiDe',1411319595,'2014-09-14 15:13:15','2014-09-14 15:13:15'),(171,171,'haGALSjNT44xj4AsZAPU7nb0a4DcFR0lw7e6B68L',1411319621,'2014-09-14 15:13:41','2014-09-14 15:13:41'),(172,172,'0Uzcfuq7hVKnox110Oce0oZjgFt1WqfxTrTHkDaQ',1411319664,'2014-09-14 15:14:24','2014-09-14 15:14:24'),(173,173,'73W0bL9o1oDyiihu04tfMPirqva5nH2oeeH27BNF',1411319726,'2014-09-14 15:15:26','2014-09-14 15:15:26'),(174,174,'Je83PslBk7nDjF3qHG4rDnQhyywixDdMuIi7DPrP',1411333116,'2014-09-14 18:58:36','2014-09-14 18:58:36'),(175,175,'YuJMfvPwMFffZJ9tZc8D1J19zI2l6bNrRQZVWB84',1411333212,'2014-09-14 19:00:12','2014-09-14 19:00:12'),(176,176,'JM7HXvO4Jf7mmGTHuXU7W6496QrwsroLrD0kIQnd',1411334182,'2014-09-14 19:16:22','2014-09-14 19:16:22'),(177,177,'VSGqensdxz7jqO4372PL7KlbW89O4tQZbNaSXq5n',1411334185,'2014-09-14 19:16:25','2014-09-14 19:16:25'),(178,178,'sZpUDTmWbxDDpOWePCO3o2nYxOadWPk4Ni2xDeVc',1411334202,'2014-09-14 19:16:42','2014-09-14 19:16:42'),(179,179,'JCWWCu7oO2xvowqNMzbadCFoqPTnou9daujrv3bF',1411334286,'2014-09-14 19:18:06','2014-09-14 19:18:06'),(180,180,'ebIXZAMQDPwD0A2JIbLSFtgcBxIi8cX0638MQkug',1411334288,'2014-09-14 19:18:08','2014-09-14 19:18:08'),(181,181,'Vgz12nOzUG74YULXtZYOOaQYCyIsPsFZln42wtiN',1411399864,'2014-09-15 13:31:04','2014-09-15 13:31:04'),(182,182,'UFpPPakg5RTvsw2IzWBHbodZ1sgAiDTGrtNAcVe3',1411402455,'2014-09-15 14:14:15','2014-09-15 14:14:15'),(183,183,'X5cWZNztRnQPNjhqzQ9bIgZQmR1BGc36Cv0zjX8F',1411402571,'2014-09-15 14:16:11','2014-09-15 14:16:11'),(184,184,'Sm2vYO5wzE2D9SOgsSqja49NgC3xbn3FnnTGwDze',1411402735,'2014-09-15 14:18:55','2014-09-15 14:18:55'),(185,185,'wtgehM1zC338q1ImqW5VTl8Is82nzyqH0YwqYhNE',1411403112,'2014-09-15 14:25:12','2014-09-15 14:25:12');
/*!40000 ALTER TABLE `oauth_session_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_session_authcode_scopes`
--

DROP TABLE IF EXISTS `oauth_session_authcode_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_session_authcode_scopes` (
  `oauth_session_authcode_id` int(10) unsigned NOT NULL,
  `scope_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `oauth_session_authcode_scopes_oauth_session_authcode_id_index` (`oauth_session_authcode_id`),
  KEY `oauth_session_authcode_scopes_scope_id_index` (`scope_id`),
  CONSTRAINT `oauth_session_authcode_scopes_oauth_session_authcode_id_foreign` FOREIGN KEY (`oauth_session_authcode_id`) REFERENCES `oauth_session_authcodes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_session_authcode_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_session_authcode_scopes`
--

LOCK TABLES `oauth_session_authcode_scopes` WRITE;
/*!40000 ALTER TABLE `oauth_session_authcode_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_session_authcode_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_session_authcodes`
--

DROP TABLE IF EXISTS `oauth_session_authcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_session_authcodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(10) unsigned NOT NULL,
  `auth_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `auth_code_expires` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_session_authcodes_session_id_index` (`session_id`),
  CONSTRAINT `oauth_session_authcodes_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_session_authcodes`
--

LOCK TABLES `oauth_session_authcodes` WRITE;
/*!40000 ALTER TABLE `oauth_session_authcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_session_authcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_session_redirects`
--

DROP TABLE IF EXISTS `oauth_session_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_session_redirects` (
  `session_id` int(10) unsigned NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`session_id`),
  CONSTRAINT `oauth_session_redirects_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_session_redirects`
--

LOCK TABLES `oauth_session_redirects` WRITE;
/*!40000 ALTER TABLE `oauth_session_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_session_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_session_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_session_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_session_refresh_tokens` (
  `session_access_token_id` int(10) unsigned NOT NULL,
  `refresh_token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `refresh_token_expires` int(11) NOT NULL,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`session_access_token_id`),
  KEY `oauth_session_refresh_tokens_client_id_index` (`client_id`),
  CONSTRAINT `oauth_session_refresh_tokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_session_refresh_tokens_session_access_token_id_foreign` FOREIGN KEY (`session_access_token_id`) REFERENCES `oauth_session_access_tokens` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_session_refresh_tokens`
--

LOCK TABLES `oauth_session_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_session_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_session_refresh_tokens` VALUES (1,'Sjuep4jWUzvoaSvWqK6yB8vkbta2vwc283RcbR0T',1410102239,'test_id','2014-08-31 13:03:59','2014-08-31 13:03:59'),(2,'5uKBn6TRubAjlvTAcxuMX0GKfYlEhfG7AqEXfPs6',1410103073,'test_id','2014-08-31 13:17:53','2014-08-31 13:17:53'),(3,'KdpO0MYawwgEdndILXpm7eOwlpnZI51eXFE1dbIy',1410103186,'test_id','2014-08-31 13:19:46','2014-08-31 13:19:46'),(4,'xbo4dwS8fnyeNVUn9fLsqyKSQjYt2KBlN9SoPn0b',1410115491,'test_id','2014-08-31 16:44:51','2014-08-31 16:44:51'),(5,'OE1eOWnIpbjAUd2K9HOOPuL5QCtNLxtYUn0SfakE',1410115558,'test_id','2014-08-31 16:45:58','2014-08-31 16:45:58'),(6,'UZzRb4xQpGAd32xiUurmRHztAiQwLPjklSZEXNVi',1410115564,'test_id','2014-08-31 16:46:04','2014-08-31 16:46:04'),(7,'JAO3H28D18Ma0acEyJDvRXDS19uWAtV0qdnMoOTw',1410115570,'test_id','2014-08-31 16:46:10','2014-08-31 16:46:10'),(8,'qgL4E87PkZwsB3BX3xXMmZtUGr9Iyvfq7WjWJMtV',1410115679,'test_id','2014-08-31 16:47:59','2014-08-31 16:47:59'),(9,'kiw2S6c6s1yCWbJ9VjJQFE7PLawegvT8SDO8aZ8V',1410115743,'test_id','2014-08-31 16:49:03','2014-08-31 16:49:03'),(10,'gMx2ZSAZMapKVRwX7lhmUdPY1mRhAeI1rRDPJPGM',1410115743,'test_id','2014-08-31 16:49:03','2014-08-31 16:49:03'),(11,'Pbpm1XpvUsEIy5ymvzDu8144XMdC7EkxKGghSTcP',1410115744,'test_id','2014-08-31 16:49:04','2014-08-31 16:49:04'),(12,'tu0uWydIr4dy19kSY4W2dN5zVCZq4ARMR25pdH6I',1410115744,'test_id','2014-08-31 16:49:04','2014-08-31 16:49:04'),(13,'h71urpNQSUJNZ5NwcYVHqGaQoVvWNtq7TIn2m338',1410115745,'test_id','2014-08-31 16:49:05','2014-08-31 16:49:05'),(14,'kXeejoj7PMhWHyQhBaJouc27wutGMnYZ2DprUheO',1410157431,'test_id','2014-09-01 04:23:51','2014-09-01 04:23:51'),(15,'j0w24DEY4Iwe8UiFbkVpQLLMTa27SB6rxF7rU7Ra',1410158331,'test_id','2014-09-01 04:38:51','2014-09-01 04:38:51'),(16,'C5HUurAhSfEqzABLxDnbmUy7aCgsU1b0Okx8sPU8',1410158341,'test_id','2014-09-01 04:39:01','2014-09-01 04:39:01'),(17,'4Shy6ZdIs4wqRjVs9MXvgJprUAKqK3XK0ruwxIoc',1410158349,'test_id','2014-09-01 04:39:09','2014-09-01 04:39:09'),(18,'r1YDGFau48QdcndbWyxAvnvyCKjxm1DsQ7h6Zf4v',1410158377,'test_id','2014-09-01 04:39:37','2014-09-01 04:39:37'),(19,'sgIG9MgJHS8cNU3rDnRKxnl91pgvCeK84lr9LhE8',1410158386,'test_id','2014-09-01 04:39:46','2014-09-01 04:39:46'),(20,'Ab2Gfbp3bd0A88iW5eJ2PAyrCRAtfVrRlgPneucj',1410158414,'test_id','2014-09-01 04:40:14','2014-09-01 04:40:14'),(21,'R74mBP9woqdH29LfgN8fy8Yg0JF9KxRbVF5XHZOD',1410158422,'test_id','2014-09-01 04:40:22','2014-09-01 04:40:22'),(22,'XfqKhA43cYoemr9VSrs81EA8wFZ4Eq4kAMc39KnZ',1410199593,'test_id','2014-09-01 16:06:33','2014-09-01 16:06:33'),(23,'ZT0pJyaNzLFeay7pDWeWkOxcsHokH6jHXblsWUBi',1410199888,'test_id','2014-09-01 16:11:28','2014-09-01 16:11:28'),(24,'UQ72BusWaTSg6o9qY60mbpMhsnVpIeXUqTYfqV6c',1410199896,'test_id','2014-09-01 16:11:36','2014-09-01 16:11:36'),(25,'rHfUXUj0nTibe1Ll4yLvNg6D6xY8toSQ4Tidwdhn',1410340167,'test_id','2014-09-03 07:09:27','2014-09-03 07:09:27'),(26,'JxNUW0CNHnNmOqGvGaJF3sFilpwAq8TOxHd1IgSF',1410340846,'test_id','2014-09-03 07:20:46','2014-09-03 07:20:46'),(27,'2MgBRZBJczsiA3KdRWdIeE8zJYx8FeJeAE0ylkzq',1410340852,'test_id','2014-09-03 07:20:52','2014-09-03 07:20:52'),(28,'MtHCedKGW5dMLx1nkVxH0GjygvqbCGkJtcaJ9tlI',1410340915,'test_id','2014-09-03 07:21:55','2014-09-03 07:21:55'),(29,'n2iSxByRNpC8kJZ2EGXS8M0mVFg95WdayxBNRRKd',1410340979,'test_id','2014-09-03 07:22:59','2014-09-03 07:22:59'),(30,'pd5KiqCBaDS2NWeuHIRnBJ6GvYZP7583WQ0UU5AP',1410340988,'test_id','2014-09-03 07:23:08','2014-09-03 07:23:08'),(31,'cP0RMlvu9AQjXSFOpTXFqGWUbkmdlMUR44kOZc5h',1410341355,'test_id','2014-09-03 07:29:15','2014-09-03 07:29:15'),(32,'WknBzqCn0BromasC39jMuqYiuTTMLZEERZqbayZs',1410441724,'test_id','2014-09-04 11:22:04','2014-09-04 11:22:04'),(33,'bwQ7f9JTYnXwNKZSiOzt3ye0I2bs9ZMn9evNoeOh',1410441727,'test_id','2014-09-04 11:22:07','2014-09-04 11:22:07'),(34,'n6CKaOvP6b2tbcQitiGPiSV0K2WdCngtJllZ1kPb',1410450106,'test_id','2014-09-04 13:41:46','2014-09-04 13:41:46'),(35,'V8jCeIxfXiuXwPS48WyGjJh4azx2upEywQiTjwuR',1410450848,'test_id','2014-09-04 13:54:08','2014-09-04 13:54:08'),(36,'5Wx9Tn6TzG4ZeLvHgYrcAmVL6wLGyYHv4fYNwAFY',1410451915,'test_id','2014-09-04 14:11:55','2014-09-04 14:11:55'),(37,'sUrKRZxczIpWi0cD9zSKyeA9Xdu0PHNWU6rdcPZm',1410518606,'test_id','2014-09-05 08:43:26','2014-09-05 08:43:26'),(38,'4r7qvIaDWq6mn3RVCqdwxKWH5sBzqeD0RMeBmpDf',1410519575,'test_id','2014-09-05 08:59:35','2014-09-05 08:59:35'),(39,'z6nlCwDBgq0Kw1twbBItig0FUYLQTwxph5Kkx6dl',1410519595,'test_id','2014-09-05 08:59:55','2014-09-05 08:59:55'),(40,'ZBi8uPHHRIm2tugCHMKOMDjCw0nCWYwFMKtCSxcL',1410519731,'test_id','2014-09-05 09:02:11','2014-09-05 09:02:11'),(41,'tSzY9tWiwUGULUh8h4MF1zMPu3BvFfB80HyYM6vS',1410519916,'test_id','2014-09-05 09:05:16','2014-09-05 09:05:16'),(42,'FLDdHuqtcbztgw4X6qEbPuThMHW9gepBAkurneBD',1410519953,'test_id','2014-09-05 09:05:53','2014-09-05 09:05:53'),(43,'BobnMPYWbK1ikzNd4sTLPvkcn0DXG8DlbsKvtAYa',1410527666,'test_id','2014-09-05 11:14:26','2014-09-05 11:14:26'),(44,'lXt4IcJ0SqO8BQ7jRXc51vIKouTZxSYGd8l3HIEC',1410529013,'test_id','2014-09-05 11:36:53','2014-09-05 11:36:53'),(45,'nXFreODFoF41yle1rBV3HzO1bItUBH3JjDEURdG2',1410529062,'test_id','2014-09-05 11:37:42','2014-09-05 11:37:42'),(46,'RFU5PMBDAFRn5V5iRitBiEEV1lbYf1V2Bxmi8L1L',1410529098,'test_id','2014-09-05 11:38:18','2014-09-05 11:38:18'),(47,'8LZUV1Bt57D9pT0lq15TlGhldXsUk2BtRh2TEnqd',1410530812,'test_id','2014-09-05 12:06:52','2014-09-05 12:06:52'),(48,'UtrMSAPyJQbOKjJ2CGZbfcdkZCAv7oiFe7uQQNtH',1410531161,'test_id','2014-09-05 12:12:41','2014-09-05 12:12:41'),(49,'r3LjO8vfTIVwPJfazVZcttkKj9ceB9jLACX6Sdky',1410532384,'test_id','2014-09-05 12:33:04','2014-09-05 12:33:04'),(50,'gP35DLF6W8ruGoWWsw2cfVut1Hw9BJa1WX3PaYjJ',1410534543,'test_id','2014-09-05 13:09:03','2014-09-05 13:09:03'),(51,'7UkBTi64qkfjCN9hz58vN9gy4SReABvS1uq9gPDr',1410544989,'test_id','2014-09-05 16:03:09','2014-09-05 16:03:09'),(52,'DhiNmuzfnoswCx9x8unrdY55OXz0nHrRu9kguBXC',1410544993,'test_id','2014-09-05 16:03:13','2014-09-05 16:03:13'),(53,'uUV505lEujpTo7bznNEAMtcatrJKkhyXOZUsgwQV',1410545144,'test_id','2014-09-05 16:05:44','2014-09-05 16:05:44'),(54,'AkFHDTmL68NLIjJRF3BqdhJfc42qnDTeyWquPcUO',1410546240,'test_id','2014-09-05 16:24:00','2014-09-05 16:24:00'),(55,'p1Im7Hr5aaEQDQQFucLHefIMtjlxFjTaVrQOMces',1410546306,'test_id','2014-09-05 16:25:06','2014-09-05 16:25:06'),(56,'gDh9wegzHegZKtlSg7jAHBWt5wVKQlD2heiDzenq',1410546308,'test_id','2014-09-05 16:25:08','2014-09-05 16:25:08'),(57,'zfMMbdl9VZHRERLyFfsaa7IZsYWp17yAE3Nk0CGj',1410546312,'test_id','2014-09-05 16:25:12','2014-09-05 16:25:12'),(58,'FxdvlJQyaJ4rkqMnT3uZrvcrbnQEqk5bu3xQqY1Z',1410546337,'test_id','2014-09-05 16:25:37','2014-09-05 16:25:37'),(59,'6qTP46F0ONHiDFvAV4qvcYAn45f5F2PoBqTsfx8c',1410546346,'test_id','2014-09-05 16:25:46','2014-09-05 16:25:46'),(60,'RH5onc9TUUOFDkn5UI2PRIc0jtvwSCA59aJZiSXB',1410546347,'test_id','2014-09-05 16:25:47','2014-09-05 16:25:47'),(61,'ba8sq2U1ynXtNfkzEvJZqdBE5qwLeT0tPxRhpyED',1410546349,'test_id','2014-09-05 16:25:49','2014-09-05 16:25:49'),(62,'3k3naKs9aPaXkG3OZLxgXexSB2U7x9SjMk9PCqdg',1410546353,'test_id','2014-09-05 16:25:53','2014-09-05 16:25:53'),(63,'yAkemC0qFcIZbNKeCwPODaKYuQbH4I1dRfFfS5lQ',1410546356,'test_id','2014-09-05 16:25:56','2014-09-05 16:25:56'),(64,'TBtWhxPpA5yt3sxzSd3oosNpzJ6Tkb092YJX4Skz',1410546365,'test_id','2014-09-05 16:26:05','2014-09-05 16:26:05'),(65,'XX1axK3mi5Fu5FAZkcR79dyUNOlTepLKRljio5ra',1410546372,'test_id','2014-09-05 16:26:12','2014-09-05 16:26:12'),(66,'orpsOJqfv5Zzg6FyEl5ylGgcCfj5WDvaODKR1qwt',1410546380,'test_id','2014-09-05 16:26:20','2014-09-05 16:26:20'),(67,'WVVpiceTaQVh4dhnwh3nlyDU3uDMaKCPVEjC4Fag',1410546418,'test_id','2014-09-05 16:26:58','2014-09-05 16:26:58'),(68,'5Zx0AEaowcm1Kaf38JetFbmo53jlwB9MvXwl4NsC',1410547203,'test_id','2014-09-05 16:40:03','2014-09-05 16:40:03'),(69,'lDDCtVMaeNbBKxI9TVwQjveJvjsAPGGSnRf1JKQj',1410547852,'test_id','2014-09-05 16:50:52','2014-09-05 16:50:52'),(70,'Lvx5oF3els9OdjjYUTJnjqklF1vEPbSnqbzPRcmb',1410547907,'test_id','2014-09-05 16:51:47','2014-09-05 16:51:47'),(71,'clfMix5iG62PSWJz0bMKEW6LTrrzECGMD3bz5DV0',1410547918,'test_id','2014-09-05 16:51:58','2014-09-05 16:51:58'),(72,'T53UXrDWpBLc7jsQ08idlPYBC6Dax5mK8eCAfwxT',1410548911,'test_id','2014-09-05 17:08:31','2014-09-05 17:08:31'),(73,'v5Rsv4NTAQHYj2EsjeR8V1N6vMt7t4KGX6oFpoi7',1410548970,'test_id','2014-09-05 17:09:30','2014-09-05 17:09:30'),(74,'ManabE1okplBqO5pIINtMuq3tdpnqVOWV9DodmwZ',1410548974,'test_id','2014-09-05 17:09:34','2014-09-05 17:09:34'),(75,'JmcebaP0hc0ajQaXk7QXn6uM0gC0OVOIMKDdZK9h',1410548984,'test_id','2014-09-05 17:09:44','2014-09-05 17:09:44'),(76,'gWNQ86aMaRZV76XAFPhS5DDOrJgnVLKYqL7Yz1vH',1410549636,'test_id','2014-09-05 17:20:36','2014-09-05 17:20:36'),(77,'dMZTrqsJzfKjj9qnKkvZoQ6jdCR05wEED8cLBg19',1410549647,'test_id','2014-09-05 17:20:47','2014-09-05 17:20:47'),(78,'yzJBq2OUo3SOA1qkKpqWwQWce3dCyRxAjO6nEmiB',1410550112,'test_id','2014-09-05 17:28:32','2014-09-05 17:28:32'),(79,'0a5Nd0lEc3KVEQp6OkjuyTEYLuexKK4anKgzpeC7',1410684429,'test_id','2014-09-07 06:47:09','2014-09-07 06:47:09'),(80,'IpFgtGPOibJDYFI3UuIBNHOPnLlkh1QaQcE26TXT',1410689446,'test_id','2014-09-07 08:10:46','2014-09-07 08:10:46'),(81,'Dqi0N6w1dvvkHfJ6Q49nL0Ynd2CbipWnL2yZTg83',1410689510,'test_id','2014-09-07 08:11:50','2014-09-07 08:11:50'),(82,'6vvBYliNTppCQnb48CCDKbWXRnNXwrDy6y4elWYm',1410690505,'test_id','2014-09-07 08:28:25','2014-09-07 08:28:25'),(83,'8xosXNt3C8UYMlUGVYM8GS6YlTybtnJGmpXS2uNQ',1410690513,'test_id','2014-09-07 08:28:33','2014-09-07 08:28:33'),(84,'ik89Kw3GRD9BFjEHo5uvYsBNtKDUpky8aNGWLapm',1410690524,'test_id','2014-09-07 08:28:44','2014-09-07 08:28:44'),(85,'IVs2mdxm5trJpwjm4qAWWJJ9MQ9ChN2vfXVXohO6',1410690751,'test_id','2014-09-07 08:32:31','2014-09-07 08:32:31'),(86,'WnOWNsnxq5PZQiKmH6m8U4yPxkCK9L0DtyRUf2gi',1410690919,'test_id','2014-09-07 08:35:19','2014-09-07 08:35:19'),(87,'wz8NrwaRKCdksEsTi9T4JcrjVRm3T4k7UW8BCZB7',1410690924,'test_id','2014-09-07 08:35:24','2014-09-07 08:35:24'),(88,'BHJOZGMrIHEKzp0F6cshPGpE6lr8D5f4yRygK3G2',1410690928,'test_id','2014-09-07 08:35:28','2014-09-07 08:35:28'),(89,'3NMfE2K3U9McYSzhL2Cyjgr0zfNKvn14cAcYMraJ',1410690950,'test_id','2014-09-07 08:35:50','2014-09-07 08:35:50'),(90,'4CnTDXGE5J3pMzraDx1eMBNbeNSG78ntvTlJ2NUr',1410690954,'test_id','2014-09-07 08:35:54','2014-09-07 08:35:54'),(91,'6NBVKlRkjxQHTP5ToJ13Kl9Aoi03vrVIYTW5v1xY',1410690963,'test_id','2014-09-07 08:36:03','2014-09-07 08:36:03'),(92,'BzqmGd3l7YiGld5RlFCHYeEZSf1cJTimbuNSOBVB',1410690966,'test_id','2014-09-07 08:36:06','2014-09-07 08:36:06'),(93,'BaY50QkqQD6Bw5bCgMjp15UvjLEt04Qe114FBZnV',1410690972,'test_id','2014-09-07 08:36:12','2014-09-07 08:36:12'),(94,'DaEBDpCDOlBAl5L4CpK6ejtxbBUbxw4ruQm2KS38',1410690979,'test_id','2014-09-07 08:36:19','2014-09-07 08:36:19'),(95,'sAjgThQAPDUfTnqwi1rgGoNJg0EBwMcTiPdhhd1v',1410690984,'test_id','2014-09-07 08:36:24','2014-09-07 08:36:24'),(96,'Ros4JJcrc9SKQjHbVR18GY4Yj5aI7PR0FDjS7VBJ',1410690990,'test_id','2014-09-07 08:36:30','2014-09-07 08:36:30'),(97,'tw7maHEZQP1F5bOAsMroimTHGJE0IYuYr7VifxJZ',1410690997,'test_id','2014-09-07 08:36:37','2014-09-07 08:36:37'),(98,'y9KrA3SqX9CHUt6L3MoyWHsMua2PGRcP5VvhCFmi',1410691001,'test_id','2014-09-07 08:36:41','2014-09-07 08:36:41'),(99,'C8r0y9VNCICSXy0xEWH7geIOAE4AJVtgPkmykVBk',1410691004,'test_id','2014-09-07 08:36:44','2014-09-07 08:36:44'),(100,'LJ2Lwm2mlmPRx205fjVSZ4nQlyHR9z6giTHudFWq',1410691159,'test_id','2014-09-07 08:39:19','2014-09-07 08:39:19'),(101,'7xPQOxACK6SfgHxm6nKQeLYYIvC428eZXr9EICQQ',1410691329,'test_id','2014-09-07 08:42:09','2014-09-07 08:42:09'),(102,'L1gWXnL42tMQSWQj9ejpEcRSZbPaRJFqcUQE6Ko8',1410691343,'test_id','2014-09-07 08:42:23','2014-09-07 08:42:23'),(103,'qQBM2KLlQExJT3XXyCloBizyzRQl07WwfHd9gMMF',1410691346,'test_id','2014-09-07 08:42:26','2014-09-07 08:42:26'),(104,'SGfuqcQ9S7xGwuiMcfGzEBYOqEQZT3KYvR3luhcv',1410691348,'test_id','2014-09-07 08:42:28','2014-09-07 08:42:28'),(105,'I7jakpwBTeEapDpWvsPMURxckQK0tuTRJbcVfdn9',1410691349,'test_id','2014-09-07 08:42:29','2014-09-07 08:42:29'),(106,'Puo68MtYqnwyGFxtBg0RIvk59yVozgkgGA0nP2g0',1410691368,'test_id','2014-09-07 08:42:48','2014-09-07 08:42:48'),(107,'3D4JLpT72liagQQNrNKsZNeZ2q7C6kGwDHjr06P4',1410691478,'test_id','2014-09-07 08:44:38','2014-09-07 08:44:38'),(108,'47farGIDudi80CCvTJIWZrA6VMwAg3Vek2fz144J',1410691514,'test_id','2014-09-07 08:45:14','2014-09-07 08:45:14'),(109,'IFW34BjGcvqiq8znsB5ysvwAVlQdBxlEmTxtpBLc',1410694571,'test_id','2014-09-07 09:36:11','2014-09-07 09:36:11'),(110,'6yRyLj0AdrnbGQUAk4ODacZKLxjk1K7yzQ7IPXjc',1410694608,'test_id','2014-09-07 09:36:48','2014-09-07 09:36:48'),(111,'Mqmux5jekY7GzpDI62yeccmj7ckD0HwgIqwW1TEF',1410694722,'test_id','2014-09-07 09:38:42','2014-09-07 09:38:42'),(112,'IUaMIi4OiDl4TSORrlyIVynwWtn1tNTooIjyR0JC',1410694775,'test_id','2014-09-07 09:39:35','2014-09-07 09:39:35'),(113,'u5j9wr4TMObWYfEjKZ7KI0Ar4JJCLOzQA7K7Co9Q',1410694803,'test_id','2014-09-07 09:40:03','2014-09-07 09:40:03'),(114,'0R7cjeSSvR5sQn1jHBADi28h4WZjTJbq28Od7ynM',1410696114,'test_id','2014-09-07 10:01:54','2014-09-07 10:01:54'),(115,'lHhPqEotoM9hmH9lrQ1cSuFe6ML9HepGiBL2aFRM',1410696124,'test_id','2014-09-07 10:02:04','2014-09-07 10:02:04'),(116,'7pPOZOqnxODNtz41EXOE2McQOKIMXjBNECFlBnjl',1410696184,'test_id','2014-09-07 10:03:04','2014-09-07 10:03:04'),(117,'BWmJbk7ZViAIr1IJcfMMFIE45J2YMouqVeB2vRtw',1410696262,'test_id','2014-09-07 10:04:22','2014-09-07 10:04:22'),(118,'MhMMiTj4cUfDp9O32v335cJnLABwxGf4SzNXnxeg',1410698522,'test_id','2014-09-07 10:42:02','2014-09-07 10:42:02'),(119,'UKGane9KXBbXx8DnEn1IKKpupUT3btvxXhcshXXe',1410698925,'test_id','2014-09-07 10:48:45','2014-09-07 10:48:45'),(120,'3oY6FwTvBNlVGi0mkLNb6pBh6Fw2Iy16BEQA1b8g',1410699436,'test_id','2014-09-07 10:57:16','2014-09-07 10:57:16'),(121,'z3r4OiKa8dWLViHGEufegWHmRYYONZD3gluP8ewk',1410704831,'test_id','2014-09-07 12:27:11','2014-09-07 12:27:11'),(122,'kPLOU4gHeS6csJqw1f1NqeU8byWJcWVsl8kW6rlF',1410704871,'test_id','2014-09-07 12:27:51','2014-09-07 12:27:51'),(123,'TZNX8IMFRRaYtTX6kBey8iiwYzGQN82NAedCXtXy',1410704906,'test_id','2014-09-07 12:28:26','2014-09-07 12:28:26'),(124,'6BBiMaLiCBScrdYsSSCLtPivCP30tyir9f1F5ebJ',1410705249,'test_id','2014-09-07 12:34:09','2014-09-07 12:34:09'),(125,'AUItGMimbwdXRkIoA0JpcPcoeW9iBq4K3E8J0gDt',1410705432,'test_id','2014-09-07 12:37:12','2014-09-07 12:37:12'),(126,'tCaMBqmL1uoJIZsZWgk4tzX2qmTIeySbGQVTYExJ',1410705558,'test_id','2014-09-07 12:39:18','2014-09-07 12:39:18'),(127,'GDzPuNYFNBlnZRUh5kC1t0qNIn6cdVKHL4dsQDnW',1410705606,'test_id','2014-09-07 12:40:06','2014-09-07 12:40:06'),(128,'QMs0rWkcsDUMmKD00pRUX70izdKoTWexh9MRDFXn',1410705643,'test_id','2014-09-07 12:40:43','2014-09-07 12:40:43'),(129,'LksCnAWBsfyKK7PcAJkJXOe6A4QBNLnxzSqEg0mE',1410705678,'test_id','2014-09-07 12:41:18','2014-09-07 12:41:18'),(130,'P4MqI3gp1sXH5faO46ZVUYxF2BKmu6BKqcbmCHpA',1410706110,'test_id','2014-09-07 12:48:30','2014-09-07 12:48:30'),(131,'WOIYjsRDQluebDQWUSLym95RSbLFHakuVJ7yUE9Y',1410706420,'test_id','2014-09-07 12:53:40','2014-09-07 12:53:40'),(132,'cNcts473IzevaxYim5ybahaizfjeKFTEj3wSEINR',1410706495,'test_id','2014-09-07 12:54:55','2014-09-07 12:54:55'),(133,'wXVtjfwcc3RcOD7Vxho7rCrwJ4YfP3a6GcbkqF9r',1410706500,'test_id','2014-09-07 12:55:00','2014-09-07 12:55:00'),(134,'vKSU9XPqy6vD3aWZL9Tz2AiTWK4mq9AeuHBAFqYA',1410706504,'test_id','2014-09-07 12:55:04','2014-09-07 12:55:04'),(135,'98x0ScyxyjH1xAg3ewfOmXX6arh2vx6ToBsFMamO',1410706554,'test_id','2014-09-07 12:55:54','2014-09-07 12:55:54'),(136,'xryF7ZpPOgAndYAz9BEuX4tbVUI4bOQQb0CVSvEf',1410706803,'test_id','2014-09-07 13:00:03','2014-09-07 13:00:03'),(137,'SwSmSjvnewkrdbzGSbQwmO0QAUva2ob6zdPieHIy',1410706812,'test_id','2014-09-07 13:00:12','2014-09-07 13:00:12'),(138,'Hy2VUo7WWUmiarH80kGpxakaIPrAzqREGxF2iI9R',1410706819,'test_id','2014-09-07 13:00:19','2014-09-07 13:00:19'),(139,'dM35zlfOBGn7WM2xIs7Eu2KzIOIsD6stKGKnrTze',1410707072,'test_id','2014-09-07 13:04:32','2014-09-07 13:04:32'),(140,'GsxzrW6OMdQQUIKBs4UhgXdHlrkcMn9vTZiQAvj4',1410707309,'test_id','2014-09-07 13:08:29','2014-09-07 13:08:29'),(141,'QMKwfGmeQ4B6D8t9ltMaPAlX6Znvz6dnf5XcNjZz',1410707314,'test_id','2014-09-07 13:08:34','2014-09-07 13:08:34'),(142,'2Pgxji0zpCbHNUrWBiPpgsVrqjEk4Ihv07r0vRb1',1410707335,'test_id','2014-09-07 13:08:55','2014-09-07 13:08:55'),(143,'I52btMNhbWMmyo1BVFxXj3rsw13HK7l7jVj7OveM',1410707339,'test_id','2014-09-07 13:08:59','2014-09-07 13:08:59'),(144,'ut6PFhn92BGBXVSJhcofrSKCyDwrszmAHCsUVGW9',1410707357,'test_id','2014-09-07 13:09:17','2014-09-07 13:09:17'),(145,'SknWQE6OpXcgYShT0mv4dlMESXxUy0Z9SBC3v3f3',1410707490,'test_id','2014-09-07 13:11:30','2014-09-07 13:11:30'),(146,'7e2G44YcpYVTOJq1YA2CtMQXM5xoQYlYVcojZTHb',1410707907,'test_id','2014-09-07 13:18:27','2014-09-07 13:18:27'),(147,'P9Z8Yn7TnWXgCunL9s3MOQYWsGnoVA8kzuMxii4P',1410707916,'test_id','2014-09-07 13:18:36','2014-09-07 13:18:36'),(148,'qm1YTgG49vH6qXIhFXtnYw75qkgDpSSMdhDpeKME',1410708021,'test_id','2014-09-07 13:20:21','2014-09-07 13:20:21'),(149,'VkdeLhzohyZGztGEOR39Si5jNMdo0IzOnfOOXZlX',1410709559,'test_id','2014-09-07 13:45:59','2014-09-07 13:45:59'),(150,'FunT53fEt0bvO4qJoEwNye12tPhsQBKmTLyEqve6',1410709789,'test_id','2014-09-07 13:49:49','2014-09-07 13:49:49'),(151,'U1gLbAt8i5Sklm1moGfOp9RD9XUIU7yU46RgXc7U',1410709875,'test_id','2014-09-07 13:51:15','2014-09-07 13:51:15'),(152,'plq5B3TCHwWvi3EHTtn9YlyQqT5sHudoW1IvGxvp',1410709887,'test_id','2014-09-07 13:51:27','2014-09-07 13:51:27'),(153,'vfhXvpVx5FsRJxDAj4vgTQ0dYxoUZ0qmi5op6HRV',1410709894,'test_id','2014-09-07 13:51:34','2014-09-07 13:51:34'),(154,'vUmeqWaoKF9FPLSntfwTcWXt53WF4SN7RhoeRUI6',1410709899,'test_id','2014-09-07 13:51:39','2014-09-07 13:51:39'),(155,'lxpDsbgAuFhpq9h715041p0HU4Z8PljzipR9nECP',1410766086,'test_id','2014-09-08 05:28:06','2014-09-08 05:28:06'),(156,'vjtzr75kdqit8JjGkftF2WkhaNag8em5AU7swpdn',1410767003,'test_id','2014-09-08 05:43:23','2014-09-08 05:43:23'),(157,'JF8HnY4WxYRlJNdEF774Zz80VdHa6sGmqPJj5xfs',1410767852,'test_id','2014-09-08 05:57:32','2014-09-08 05:57:32'),(158,'QMa5OJjQzQQdwn5e5JO38mRgdKwBXDtaTBp6fHy4',1410767868,'test_id','2014-09-08 05:57:48','2014-09-08 05:57:48'),(159,'mKV6dyMJEYuw8W70niMsuJ6s7NCclpKYGuisjUTs',1410856339,'test_id','2014-09-09 06:32:19','2014-09-09 06:32:19'),(160,'OUBTMVFRkxkmSAuU8WYb2BFroMcT8X7tKlqiDFtI',1410857991,'test_id','2014-09-09 06:59:51','2014-09-09 06:59:51'),(161,'5srrwu1hJyJzDQMqtMl4uuXWTecv1qmkPBxspiLP',1410857998,'test_id','2014-09-09 06:59:58','2014-09-09 06:59:58'),(162,'p3zyeAQFqCHZluihltU4B01JW0fzCPC7lHUYnW2f',1410985702,'test_id','2014-09-10 18:28:22','2014-09-10 18:28:22'),(163,'vN8JFkBgBx6y51r3S2sTPqDC2oUAoBELJFqpK136',1410985828,'test_id','2014-09-10 18:30:28','2014-09-10 18:30:28'),(164,'lbl38L3uGJROExWom108qCxopG1qOEvdXI20Gnbq',1410985899,'test_id','2014-09-10 18:31:39','2014-09-10 18:31:39'),(165,'WKNdGidqEss5BwKVQMOyOSmCjtg6gCSVYEyz1JE2',1410985918,'test_id','2014-09-10 18:31:58','2014-09-10 18:31:58'),(166,'znqwCtVApYzg6n0vNBAbv9XiyJODm0vIyBdD5twL',1411031014,'test_id','2014-09-11 07:03:34','2014-09-11 07:03:34'),(167,'jNaV4yHSLS1saWaxRXoYxC6HHslh9vF3lBcg4xFa',1411055784,'test_id','2014-09-11 13:56:24','2014-09-11 13:56:24'),(168,'HBnHNXA25DQTTjfcRHhxHYDMUIPN8Mx1yiUXohXF',1411063266,'test_id','2014-09-11 16:01:06','2014-09-11 16:01:06'),(169,'eZIgEzeMC0cKVQwxYmYlVw8bUanCQLBTdXe59Sba',1411064262,'test_id','2014-09-11 16:17:42','2014-09-11 16:17:42'),(170,'RtRo4Pf3RWHmHZcFXAwcbVNCoTPYCO9EqQZRZJde',1411319595,'test_id','2014-09-14 15:13:15','2014-09-14 15:13:15'),(171,'yZaR6VlSIHsuAXmJ1uaFJySsssyWsiAVB0afD7xh',1411319621,'test_id','2014-09-14 15:13:41','2014-09-14 15:13:41'),(172,'4nWI4wCiDlDi2mC21UuDtfGZYG9wmzKpZtfrlVvu',1411319664,'test_id','2014-09-14 15:14:24','2014-09-14 15:14:24'),(173,'qdgP3VJqKfgnLsc2ZGhB4FDup2pZGl390YowmjM4',1411319726,'test_id','2014-09-14 15:15:26','2014-09-14 15:15:26'),(174,'0pAsd7ubALDIJxXjZj2mpbMVTIP2kVHeY3l4AZGh',1411333116,'test_id','2014-09-14 18:58:36','2014-09-14 18:58:36'),(175,'5gDf9ZBews5KGmPHBbkp8hmKajTv2wDfuLanlBH1',1411333212,'test_id','2014-09-14 19:00:12','2014-09-14 19:00:12'),(176,'LIV7yU8yYZ4BJYsVB6m2jhDck91AykcX5V2JJXqK',1411334182,'test_id','2014-09-14 19:16:22','2014-09-14 19:16:22'),(177,'BDvZBpxOQ7f6SGEBXH3ENWvYPEOQ4jNlJLeOX6nz',1411334185,'test_id','2014-09-14 19:16:25','2014-09-14 19:16:25'),(178,'jen93GtuImw2EXDjwlv6Nj8hGjSbvzqcpUFHvDjN',1411334202,'test_id','2014-09-14 19:16:42','2014-09-14 19:16:42'),(179,'3joZw0E19JtTVVgGC9ntRx7zOTUjZPhaldm9ZNTX',1411334286,'test_id','2014-09-14 19:18:06','2014-09-14 19:18:06'),(180,'D6Dd2Y9chDDPIn9DSTliU4297cl8FjXCkTI252Rm',1411334288,'test_id','2014-09-14 19:18:08','2014-09-14 19:18:08'),(181,'SfPzkKwf8OF0ckRkX2wo2mO4NNlYWPQSAiMZhXSg',1411399864,'test_id','2014-09-15 13:31:04','2014-09-15 13:31:04'),(182,'dWPU2lXeNt29J6cBgV51hQAR3pn5Q93oQTD1ENNO',1411402455,'test_id','2014-09-15 14:14:15','2014-09-15 14:14:15'),(183,'RvUm6fdPA5Lb1JITAee85er7juna5V5c8Dx2e2XT',1411402571,'test_id','2014-09-15 14:16:11','2014-09-15 14:16:11'),(184,'DDbQGv3Gf7UmwsocuTkV87BoOZ3JdDYvSUeC4Nwh',1411402735,'test_id','2014-09-15 14:18:55','2014-09-15 14:18:55'),(185,'Z4cmNHTvhsv6ayiBFYEG3p34I69rMN8opYBbrZC8',1411403112,'test_id','2014-09-15 14:25:12','2014-09-15 14:25:12');
/*!40000 ALTER TABLE `oauth_session_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_session_token_scopes`
--

DROP TABLE IF EXISTS `oauth_session_token_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_session_token_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_access_token_id` int(10) unsigned NOT NULL,
  `scope_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_session_token_scopes_satid_sid_unique` (`session_access_token_id`,`scope_id`),
  KEY `oauth_session_token_scopes_scope_id_index` (`scope_id`),
  CONSTRAINT `oauth_session_token_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `oauth_session_token_scopes_session_access_token_id_foreign` FOREIGN KEY (`session_access_token_id`) REFERENCES `oauth_session_access_tokens` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_session_token_scopes`
--

LOCK TABLES `oauth_session_token_scopes` WRITE;
/*!40000 ALTER TABLE `oauth_session_token_scopes` DISABLE KEYS */;
INSERT INTO `oauth_session_token_scopes` VALUES (1,1,1,'2014-08-31 13:03:59','2014-08-31 13:03:59'),(2,2,1,'2014-08-31 13:17:53','2014-08-31 13:17:53'),(3,3,1,'2014-08-31 13:19:46','2014-08-31 13:19:46'),(4,4,1,'2014-08-31 16:44:51','2014-08-31 16:44:51'),(5,5,1,'2014-08-31 16:45:58','2014-08-31 16:45:58'),(6,6,1,'2014-08-31 16:46:04','2014-08-31 16:46:04'),(7,7,1,'2014-08-31 16:46:10','2014-08-31 16:46:10'),(8,8,1,'2014-08-31 16:47:59','2014-08-31 16:47:59'),(9,9,1,'2014-08-31 16:49:03','2014-08-31 16:49:03'),(10,10,1,'2014-08-31 16:49:03','2014-08-31 16:49:03'),(11,11,1,'2014-08-31 16:49:04','2014-08-31 16:49:04'),(12,12,1,'2014-08-31 16:49:04','2014-08-31 16:49:04'),(13,13,1,'2014-08-31 16:49:05','2014-08-31 16:49:05'),(14,14,1,'2014-09-01 04:23:51','2014-09-01 04:23:51'),(15,15,1,'2014-09-01 04:38:51','2014-09-01 04:38:51'),(16,16,1,'2014-09-01 04:39:01','2014-09-01 04:39:01'),(17,17,1,'2014-09-01 04:39:09','2014-09-01 04:39:09'),(18,18,1,'2014-09-01 04:39:37','2014-09-01 04:39:37'),(19,19,1,'2014-09-01 04:39:46','2014-09-01 04:39:46'),(20,20,1,'2014-09-01 04:40:14','2014-09-01 04:40:14'),(21,21,1,'2014-09-01 04:40:22','2014-09-01 04:40:22'),(22,22,1,'2014-09-01 16:06:33','2014-09-01 16:06:33'),(23,23,1,'2014-09-01 16:11:28','2014-09-01 16:11:28'),(24,24,1,'2014-09-01 16:11:36','2014-09-01 16:11:36'),(25,25,1,'2014-09-03 07:09:27','2014-09-03 07:09:27'),(26,26,1,'2014-09-03 07:20:46','2014-09-03 07:20:46'),(27,27,1,'2014-09-03 07:20:52','2014-09-03 07:20:52'),(28,28,1,'2014-09-03 07:21:54','2014-09-03 07:21:54'),(29,29,1,'2014-09-03 07:22:59','2014-09-03 07:22:59'),(30,30,1,'2014-09-03 07:23:08','2014-09-03 07:23:08'),(31,31,1,'2014-09-03 07:29:15','2014-09-03 07:29:15'),(32,32,1,'2014-09-04 11:22:04','2014-09-04 11:22:04'),(33,33,1,'2014-09-04 11:22:07','2014-09-04 11:22:07'),(34,34,1,'2014-09-04 13:41:46','2014-09-04 13:41:46'),(35,35,1,'2014-09-04 13:54:08','2014-09-04 13:54:08'),(36,36,1,'2014-09-04 14:11:55','2014-09-04 14:11:55'),(37,37,1,'2014-09-05 08:43:26','2014-09-05 08:43:26'),(38,38,1,'2014-09-05 08:59:35','2014-09-05 08:59:35'),(39,39,1,'2014-09-05 08:59:55','2014-09-05 08:59:55'),(40,40,1,'2014-09-05 09:02:11','2014-09-05 09:02:11'),(41,41,1,'2014-09-05 09:05:16','2014-09-05 09:05:16'),(42,42,1,'2014-09-05 09:05:53','2014-09-05 09:05:53'),(43,43,1,'2014-09-05 11:14:26','2014-09-05 11:14:26'),(44,44,1,'2014-09-05 11:36:53','2014-09-05 11:36:53'),(45,45,1,'2014-09-05 11:37:42','2014-09-05 11:37:42'),(46,46,1,'2014-09-05 11:38:18','2014-09-05 11:38:18'),(47,47,1,'2014-09-05 12:06:52','2014-09-05 12:06:52'),(48,48,1,'2014-09-05 12:12:41','2014-09-05 12:12:41'),(49,49,1,'2014-09-05 12:33:04','2014-09-05 12:33:04'),(50,50,1,'2014-09-05 13:09:03','2014-09-05 13:09:03'),(51,51,1,'2014-09-05 16:03:09','2014-09-05 16:03:09'),(52,52,1,'2014-09-05 16:03:13','2014-09-05 16:03:13'),(53,53,1,'2014-09-05 16:05:44','2014-09-05 16:05:44'),(54,54,1,'2014-09-05 16:24:00','2014-09-05 16:24:00'),(55,55,1,'2014-09-05 16:25:06','2014-09-05 16:25:06'),(56,56,1,'2014-09-05 16:25:08','2014-09-05 16:25:08'),(57,57,1,'2014-09-05 16:25:12','2014-09-05 16:25:12'),(58,58,1,'2014-09-05 16:25:37','2014-09-05 16:25:37'),(59,59,1,'2014-09-05 16:25:46','2014-09-05 16:25:46'),(60,60,1,'2014-09-05 16:25:47','2014-09-05 16:25:47'),(61,61,1,'2014-09-05 16:25:49','2014-09-05 16:25:49'),(62,62,1,'2014-09-05 16:25:53','2014-09-05 16:25:53'),(63,63,1,'2014-09-05 16:25:56','2014-09-05 16:25:56'),(64,64,1,'2014-09-05 16:26:05','2014-09-05 16:26:05'),(65,65,1,'2014-09-05 16:26:12','2014-09-05 16:26:12'),(66,66,1,'2014-09-05 16:26:20','2014-09-05 16:26:20'),(67,67,1,'2014-09-05 16:26:58','2014-09-05 16:26:58'),(68,68,1,'2014-09-05 16:40:03','2014-09-05 16:40:03'),(69,69,1,'2014-09-05 16:50:52','2014-09-05 16:50:52'),(70,70,1,'2014-09-05 16:51:47','2014-09-05 16:51:47'),(71,71,1,'2014-09-05 16:51:58','2014-09-05 16:51:58'),(72,72,1,'2014-09-05 17:08:31','2014-09-05 17:08:31'),(73,73,1,'2014-09-05 17:09:30','2014-09-05 17:09:30'),(74,74,1,'2014-09-05 17:09:34','2014-09-05 17:09:34'),(75,75,1,'2014-09-05 17:09:44','2014-09-05 17:09:44'),(76,76,1,'2014-09-05 17:20:36','2014-09-05 17:20:36'),(77,77,1,'2014-09-05 17:20:47','2014-09-05 17:20:47'),(78,78,1,'2014-09-05 17:28:32','2014-09-05 17:28:32'),(79,79,1,'2014-09-07 06:47:09','2014-09-07 06:47:09'),(80,80,1,'2014-09-07 08:10:46','2014-09-07 08:10:46'),(81,81,1,'2014-09-07 08:11:50','2014-09-07 08:11:50'),(82,82,1,'2014-09-07 08:28:25','2014-09-07 08:28:25'),(83,83,1,'2014-09-07 08:28:33','2014-09-07 08:28:33'),(84,84,1,'2014-09-07 08:28:44','2014-09-07 08:28:44'),(85,85,1,'2014-09-07 08:32:31','2014-09-07 08:32:31'),(86,86,1,'2014-09-07 08:35:19','2014-09-07 08:35:19'),(87,87,1,'2014-09-07 08:35:24','2014-09-07 08:35:24'),(88,88,1,'2014-09-07 08:35:28','2014-09-07 08:35:28'),(89,89,1,'2014-09-07 08:35:50','2014-09-07 08:35:50'),(90,90,1,'2014-09-07 08:35:54','2014-09-07 08:35:54'),(91,91,1,'2014-09-07 08:36:03','2014-09-07 08:36:03'),(92,92,1,'2014-09-07 08:36:06','2014-09-07 08:36:06'),(93,93,1,'2014-09-07 08:36:12','2014-09-07 08:36:12'),(94,94,1,'2014-09-07 08:36:19','2014-09-07 08:36:19'),(95,95,1,'2014-09-07 08:36:24','2014-09-07 08:36:24'),(96,96,1,'2014-09-07 08:36:30','2014-09-07 08:36:30'),(97,97,1,'2014-09-07 08:36:37','2014-09-07 08:36:37'),(98,98,1,'2014-09-07 08:36:41','2014-09-07 08:36:41'),(99,99,1,'2014-09-07 08:36:44','2014-09-07 08:36:44'),(100,100,1,'2014-09-07 08:39:19','2014-09-07 08:39:19'),(101,101,1,'2014-09-07 08:42:09','2014-09-07 08:42:09'),(102,102,1,'2014-09-07 08:42:23','2014-09-07 08:42:23'),(103,103,1,'2014-09-07 08:42:26','2014-09-07 08:42:26'),(104,104,1,'2014-09-07 08:42:28','2014-09-07 08:42:28'),(105,105,1,'2014-09-07 08:42:29','2014-09-07 08:42:29'),(106,106,1,'2014-09-07 08:42:48','2014-09-07 08:42:48'),(107,107,1,'2014-09-07 08:44:38','2014-09-07 08:44:38'),(108,108,1,'2014-09-07 08:45:14','2014-09-07 08:45:14'),(109,109,1,'2014-09-07 09:36:11','2014-09-07 09:36:11'),(110,110,1,'2014-09-07 09:36:48','2014-09-07 09:36:48'),(111,111,1,'2014-09-07 09:38:42','2014-09-07 09:38:42'),(112,112,1,'2014-09-07 09:39:35','2014-09-07 09:39:35'),(113,113,1,'2014-09-07 09:40:03','2014-09-07 09:40:03'),(114,114,1,'2014-09-07 10:01:54','2014-09-07 10:01:54'),(115,115,1,'2014-09-07 10:02:04','2014-09-07 10:02:04'),(116,116,1,'2014-09-07 10:03:04','2014-09-07 10:03:04'),(117,117,1,'2014-09-07 10:04:22','2014-09-07 10:04:22'),(118,118,1,'2014-09-07 10:42:02','2014-09-07 10:42:02'),(119,119,1,'2014-09-07 10:48:45','2014-09-07 10:48:45'),(120,120,1,'2014-09-07 10:57:16','2014-09-07 10:57:16'),(121,121,1,'2014-09-07 12:27:11','2014-09-07 12:27:11'),(122,122,1,'2014-09-07 12:27:51','2014-09-07 12:27:51'),(123,123,1,'2014-09-07 12:28:26','2014-09-07 12:28:26'),(124,124,1,'2014-09-07 12:34:09','2014-09-07 12:34:09'),(125,125,1,'2014-09-07 12:37:12','2014-09-07 12:37:12'),(126,126,1,'2014-09-07 12:39:18','2014-09-07 12:39:18'),(127,127,1,'2014-09-07 12:40:06','2014-09-07 12:40:06'),(128,128,1,'2014-09-07 12:40:42','2014-09-07 12:40:42'),(129,129,1,'2014-09-07 12:41:18','2014-09-07 12:41:18'),(130,130,1,'2014-09-07 12:48:29','2014-09-07 12:48:29'),(131,131,1,'2014-09-07 12:53:40','2014-09-07 12:53:40'),(132,132,1,'2014-09-07 12:54:55','2014-09-07 12:54:55'),(133,133,1,'2014-09-07 12:55:00','2014-09-07 12:55:00'),(134,134,1,'2014-09-07 12:55:04','2014-09-07 12:55:04'),(135,135,1,'2014-09-07 12:55:54','2014-09-07 12:55:54'),(136,136,1,'2014-09-07 13:00:03','2014-09-07 13:00:03'),(137,137,1,'2014-09-07 13:00:12','2014-09-07 13:00:12'),(138,138,1,'2014-09-07 13:00:19','2014-09-07 13:00:19'),(139,139,1,'2014-09-07 13:04:32','2014-09-07 13:04:32'),(140,140,1,'2014-09-07 13:08:29','2014-09-07 13:08:29'),(141,141,1,'2014-09-07 13:08:34','2014-09-07 13:08:34'),(142,142,1,'2014-09-07 13:08:55','2014-09-07 13:08:55'),(143,143,1,'2014-09-07 13:08:59','2014-09-07 13:08:59'),(144,144,1,'2014-09-07 13:09:17','2014-09-07 13:09:17'),(145,145,1,'2014-09-07 13:11:30','2014-09-07 13:11:30'),(146,146,1,'2014-09-07 13:18:27','2014-09-07 13:18:27'),(147,147,1,'2014-09-07 13:18:36','2014-09-07 13:18:36'),(148,148,1,'2014-09-07 13:20:21','2014-09-07 13:20:21'),(149,149,1,'2014-09-07 13:45:59','2014-09-07 13:45:59'),(150,150,1,'2014-09-07 13:49:49','2014-09-07 13:49:49'),(151,151,1,'2014-09-07 13:51:15','2014-09-07 13:51:15'),(152,152,1,'2014-09-07 13:51:27','2014-09-07 13:51:27'),(153,153,1,'2014-09-07 13:51:34','2014-09-07 13:51:34'),(154,154,1,'2014-09-07 13:51:39','2014-09-07 13:51:39'),(155,155,1,'2014-09-08 05:28:06','2014-09-08 05:28:06'),(156,156,1,'2014-09-08 05:43:23','2014-09-08 05:43:23'),(157,157,1,'2014-09-08 05:57:32','2014-09-08 05:57:32'),(158,158,1,'2014-09-08 05:57:48','2014-09-08 05:57:48'),(159,159,1,'2014-09-09 06:32:19','2014-09-09 06:32:19'),(160,160,1,'2014-09-09 06:59:51','2014-09-09 06:59:51'),(161,161,1,'2014-09-09 06:59:58','2014-09-09 06:59:58'),(162,162,1,'2014-09-10 18:28:22','2014-09-10 18:28:22'),(163,163,1,'2014-09-10 18:30:28','2014-09-10 18:30:28'),(164,164,1,'2014-09-10 18:31:39','2014-09-10 18:31:39'),(165,165,1,'2014-09-10 18:31:58','2014-09-10 18:31:58'),(166,166,1,'2014-09-11 07:03:34','2014-09-11 07:03:34'),(167,167,1,'2014-09-11 13:56:24','2014-09-11 13:56:24'),(168,168,1,'2014-09-11 16:01:06','2014-09-11 16:01:06'),(169,169,1,'2014-09-11 16:17:42','2014-09-11 16:17:42'),(170,170,1,'2014-09-14 15:13:15','2014-09-14 15:13:15'),(171,171,1,'2014-09-14 15:13:41','2014-09-14 15:13:41'),(172,172,1,'2014-09-14 15:14:24','2014-09-14 15:14:24'),(173,173,1,'2014-09-14 15:15:26','2014-09-14 15:15:26'),(174,174,1,'2014-09-14 18:58:36','2014-09-14 18:58:36'),(175,175,1,'2014-09-14 19:00:12','2014-09-14 19:00:12'),(176,176,1,'2014-09-14 19:16:22','2014-09-14 19:16:22'),(177,177,1,'2014-09-14 19:16:25','2014-09-14 19:16:25'),(178,178,1,'2014-09-14 19:16:42','2014-09-14 19:16:42'),(179,179,1,'2014-09-14 19:18:06','2014-09-14 19:18:06'),(180,180,1,'2014-09-14 19:18:08','2014-09-14 19:18:08'),(181,181,1,'2014-09-15 13:31:04','2014-09-15 13:31:04'),(182,182,1,'2014-09-15 14:14:15','2014-09-15 14:14:15'),(183,183,1,'2014-09-15 14:16:11','2014-09-15 14:16:11'),(184,184,1,'2014-09-15 14:18:55','2014-09-15 14:18:55'),(185,185,1,'2014-09-15 14:25:12','2014-09-15 14:25:12');
/*!40000 ALTER TABLE `oauth_session_token_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_sessions`
--

DROP TABLE IF EXISTS `oauth_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `owner_type` enum('client','user') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `owner_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_sessions_client_id_owner_type_owner_id_index` (`client_id`,`owner_type`,`owner_id`),
  CONSTRAINT `oauth_sessions_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_sessions`
--

LOCK TABLES `oauth_sessions` WRITE;
/*!40000 ALTER TABLE `oauth_sessions` DISABLE KEYS */;
INSERT INTO `oauth_sessions` VALUES (1,'test_id','user','1','2014-08-31 13:03:59','2014-08-31 13:03:59'),(2,'test_id','user','1','2014-08-31 13:17:53','2014-08-31 13:17:53'),(3,'test_id','user','1','2014-08-31 13:19:46','2014-08-31 13:19:46'),(4,'test_id','user','1','2014-08-31 16:44:51','2014-08-31 16:44:51'),(5,'test_id','user','1','2014-08-31 16:45:58','2014-08-31 16:45:58'),(6,'test_id','user','1','2014-08-31 16:46:04','2014-08-31 16:46:04'),(7,'test_id','user','2','2014-08-31 16:46:10','2014-08-31 16:46:10'),(8,'test_id','user','2','2014-08-31 16:47:59','2014-08-31 16:47:59'),(9,'test_id','user','2','2014-08-31 16:49:03','2014-08-31 16:49:03'),(10,'test_id','user','2','2014-08-31 16:49:03','2014-08-31 16:49:03'),(11,'test_id','user','2','2014-08-31 16:49:04','2014-08-31 16:49:04'),(12,'test_id','user','2','2014-08-31 16:49:04','2014-08-31 16:49:04'),(13,'test_id','user','2','2014-08-31 16:49:05','2014-08-31 16:49:05'),(14,'test_id','user','1','2014-09-01 04:23:51','2014-09-01 04:23:51'),(15,'test_id','user','1','2014-09-01 04:38:51','2014-09-01 04:38:51'),(16,'test_id','user','1','2014-09-01 04:39:01','2014-09-01 04:39:01'),(17,'test_id','user','1','2014-09-01 04:39:09','2014-09-01 04:39:09'),(18,'test_id','user','1','2014-09-01 04:39:37','2014-09-01 04:39:37'),(19,'test_id','user','1','2014-09-01 04:39:46','2014-09-01 04:39:46'),(20,'test_id','user','1','2014-09-01 04:40:14','2014-09-01 04:40:14'),(21,'test_id','user','1','2014-09-01 04:40:22','2014-09-01 04:40:22'),(22,'test_id','user','1','2014-09-01 16:06:33','2014-09-01 16:06:33'),(23,'test_id','user','1','2014-09-01 16:11:28','2014-09-01 16:11:28'),(24,'test_id','user','1','2014-09-01 16:11:36','2014-09-01 16:11:36'),(25,'test_id','user','1','2014-09-03 07:09:27','2014-09-03 07:09:27'),(26,'test_id','user','1','2014-09-03 07:20:46','2014-09-03 07:20:46'),(27,'test_id','user','1','2014-09-03 07:20:52','2014-09-03 07:20:52'),(28,'test_id','user','1','2014-09-03 07:21:54','2014-09-03 07:21:54'),(29,'test_id','user','1','2014-09-03 07:22:59','2014-09-03 07:22:59'),(30,'test_id','user','1','2014-09-03 07:23:08','2014-09-03 07:23:08'),(31,'test_id','user','1','2014-09-03 07:29:15','2014-09-03 07:29:15'),(32,'test_id','user','1','2014-09-04 11:22:04','2014-09-04 11:22:04'),(33,'test_id','user','1','2014-09-04 11:22:07','2014-09-04 11:22:07'),(34,'test_id','user','1','2014-09-04 13:41:46','2014-09-04 13:41:46'),(35,'test_id','user','1','2014-09-04 13:54:08','2014-09-04 13:54:08'),(36,'test_id','user','1','2014-09-04 14:11:55','2014-09-04 14:11:55'),(37,'test_id','user','1','2014-09-05 08:43:26','2014-09-05 08:43:26'),(38,'test_id','user','1','2014-09-05 08:59:35','2014-09-05 08:59:35'),(39,'test_id','user','1','2014-09-05 08:59:54','2014-09-05 08:59:54'),(40,'test_id','user','1','2014-09-05 09:02:11','2014-09-05 09:02:11'),(41,'test_id','user','1','2014-09-05 09:05:16','2014-09-05 09:05:16'),(42,'test_id','user','1','2014-09-05 09:05:53','2014-09-05 09:05:53'),(43,'test_id','user','1','2014-09-05 11:14:26','2014-09-05 11:14:26'),(44,'test_id','user','1','2014-09-05 11:36:53','2014-09-05 11:36:53'),(45,'test_id','user','1','2014-09-05 11:37:42','2014-09-05 11:37:42'),(46,'test_id','user','1','2014-09-05 11:38:18','2014-09-05 11:38:18'),(47,'test_id','user','1','2014-09-05 12:06:52','2014-09-05 12:06:52'),(48,'test_id','user','1','2014-09-05 12:12:41','2014-09-05 12:12:41'),(49,'test_id','user','1','2014-09-05 12:33:04','2014-09-05 12:33:04'),(50,'test_id','user','1','2014-09-05 13:09:03','2014-09-05 13:09:03'),(51,'test_id','user','1','2014-09-05 16:03:09','2014-09-05 16:03:09'),(52,'test_id','user','1','2014-09-05 16:03:13','2014-09-05 16:03:13'),(53,'test_id','user','1','2014-09-05 16:05:44','2014-09-05 16:05:44'),(54,'test_id','user','1','2014-09-05 16:24:00','2014-09-05 16:24:00'),(55,'test_id','user','1','2014-09-05 16:25:05','2014-09-05 16:25:05'),(56,'test_id','user','1','2014-09-05 16:25:08','2014-09-05 16:25:08'),(57,'test_id','user','1','2014-09-05 16:25:12','2014-09-05 16:25:12'),(58,'test_id','user','1','2014-09-05 16:25:36','2014-09-05 16:25:36'),(59,'test_id','user','1','2014-09-05 16:25:46','2014-09-05 16:25:46'),(60,'test_id','user','1','2014-09-05 16:25:47','2014-09-05 16:25:47'),(61,'test_id','user','1','2014-09-05 16:25:49','2014-09-05 16:25:49'),(62,'test_id','user','1','2014-09-05 16:25:53','2014-09-05 16:25:53'),(63,'test_id','user','1','2014-09-05 16:25:56','2014-09-05 16:25:56'),(64,'test_id','user','1','2014-09-05 16:26:05','2014-09-05 16:26:05'),(65,'test_id','user','1','2014-09-05 16:26:12','2014-09-05 16:26:12'),(66,'test_id','user','1','2014-09-05 16:26:20','2014-09-05 16:26:20'),(67,'test_id','user','1','2014-09-05 16:26:58','2014-09-05 16:26:58'),(68,'test_id','user','1','2014-09-05 16:40:03','2014-09-05 16:40:03'),(69,'test_id','user','1','2014-09-05 16:50:52','2014-09-05 16:50:52'),(70,'test_id','user','1','2014-09-05 16:51:47','2014-09-05 16:51:47'),(71,'test_id','user','1','2014-09-05 16:51:58','2014-09-05 16:51:58'),(72,'test_id','user','1','2014-09-05 17:08:31','2014-09-05 17:08:31'),(73,'test_id','user','1','2014-09-05 17:09:30','2014-09-05 17:09:30'),(74,'test_id','user','1','2014-09-05 17:09:34','2014-09-05 17:09:34'),(75,'test_id','user','1','2014-09-05 17:09:44','2014-09-05 17:09:44'),(76,'test_id','user','1','2014-09-05 17:20:36','2014-09-05 17:20:36'),(77,'test_id','user','1','2014-09-05 17:20:47','2014-09-05 17:20:47'),(78,'test_id','user','1','2014-09-05 17:28:32','2014-09-05 17:28:32'),(79,'test_id','user','1','2014-09-07 06:47:09','2014-09-07 06:47:09'),(80,'test_id','user','1','2014-09-07 08:10:46','2014-09-07 08:10:46'),(81,'test_id','user','1','2014-09-07 08:11:50','2014-09-07 08:11:50'),(82,'test_id','user','1','2014-09-07 08:28:25','2014-09-07 08:28:25'),(83,'test_id','user','1','2014-09-07 08:28:33','2014-09-07 08:28:33'),(84,'test_id','user','1','2014-09-07 08:28:44','2014-09-07 08:28:44'),(85,'test_id','user','1','2014-09-07 08:32:31','2014-09-07 08:32:31'),(86,'test_id','user','1','2014-09-07 08:35:19','2014-09-07 08:35:19'),(87,'test_id','user','1','2014-09-07 08:35:24','2014-09-07 08:35:24'),(88,'test_id','user','1','2014-09-07 08:35:28','2014-09-07 08:35:28'),(89,'test_id','user','1','2014-09-07 08:35:50','2014-09-07 08:35:50'),(90,'test_id','user','1','2014-09-07 08:35:54','2014-09-07 08:35:54'),(91,'test_id','user','1','2014-09-07 08:36:03','2014-09-07 08:36:03'),(92,'test_id','user','1','2014-09-07 08:36:06','2014-09-07 08:36:06'),(93,'test_id','user','1','2014-09-07 08:36:12','2014-09-07 08:36:12'),(94,'test_id','user','1','2014-09-07 08:36:19','2014-09-07 08:36:19'),(95,'test_id','user','1','2014-09-07 08:36:24','2014-09-07 08:36:24'),(96,'test_id','user','1','2014-09-07 08:36:30','2014-09-07 08:36:30'),(97,'test_id','user','1','2014-09-07 08:36:37','2014-09-07 08:36:37'),(98,'test_id','user','1','2014-09-07 08:36:41','2014-09-07 08:36:41'),(99,'test_id','user','1','2014-09-07 08:36:44','2014-09-07 08:36:44'),(100,'test_id','user','1','2014-09-07 08:39:19','2014-09-07 08:39:19'),(101,'test_id','user','1','2014-09-07 08:42:09','2014-09-07 08:42:09'),(102,'test_id','user','1','2014-09-07 08:42:23','2014-09-07 08:42:23'),(103,'test_id','user','1','2014-09-07 08:42:26','2014-09-07 08:42:26'),(104,'test_id','user','1','2014-09-07 08:42:28','2014-09-07 08:42:28'),(105,'test_id','user','1','2014-09-07 08:42:29','2014-09-07 08:42:29'),(106,'test_id','user','1','2014-09-07 08:42:48','2014-09-07 08:42:48'),(107,'test_id','user','1','2014-09-07 08:44:38','2014-09-07 08:44:38'),(108,'test_id','user','1','2014-09-07 08:45:14','2014-09-07 08:45:14'),(109,'test_id','user','1','2014-09-07 09:36:11','2014-09-07 09:36:11'),(110,'test_id','user','1','2014-09-07 09:36:48','2014-09-07 09:36:48'),(111,'test_id','user','1','2014-09-07 09:38:42','2014-09-07 09:38:42'),(112,'test_id','user','1','2014-09-07 09:39:35','2014-09-07 09:39:35'),(113,'test_id','user','1','2014-09-07 09:40:03','2014-09-07 09:40:03'),(114,'test_id','user','1','2014-09-07 10:01:54','2014-09-07 10:01:54'),(115,'test_id','user','1','2014-09-07 10:02:04','2014-09-07 10:02:04'),(116,'test_id','user','1','2014-09-07 10:03:04','2014-09-07 10:03:04'),(117,'test_id','user','1','2014-09-07 10:04:22','2014-09-07 10:04:22'),(118,'test_id','user','1','2014-09-07 10:42:02','2014-09-07 10:42:02'),(119,'test_id','user','1','2014-09-07 10:48:45','2014-09-07 10:48:45'),(120,'test_id','user','1','2014-09-07 10:57:16','2014-09-07 10:57:16'),(121,'test_id','user','1','2014-09-07 12:27:11','2014-09-07 12:27:11'),(122,'test_id','user','1','2014-09-07 12:27:51','2014-09-07 12:27:51'),(123,'test_id','user','1','2014-09-07 12:28:26','2014-09-07 12:28:26'),(124,'test_id','user','1','2014-09-07 12:34:08','2014-09-07 12:34:08'),(125,'test_id','user','1','2014-09-07 12:37:12','2014-09-07 12:37:12'),(126,'test_id','user','1','2014-09-07 12:39:18','2014-09-07 12:39:18'),(127,'test_id','user','1','2014-09-07 12:40:06','2014-09-07 12:40:06'),(128,'test_id','user','1','2014-09-07 12:40:42','2014-09-07 12:40:42'),(129,'test_id','user','1','2014-09-07 12:41:18','2014-09-07 12:41:18'),(130,'test_id','user','1','2014-09-07 12:48:29','2014-09-07 12:48:29'),(131,'test_id','user','1','2014-09-07 12:53:40','2014-09-07 12:53:40'),(132,'test_id','user','1','2014-09-07 12:54:55','2014-09-07 12:54:55'),(133,'test_id','user','1','2014-09-07 12:55:00','2014-09-07 12:55:00'),(134,'test_id','user','1','2014-09-07 12:55:04','2014-09-07 12:55:04'),(135,'test_id','user','1','2014-09-07 12:55:54','2014-09-07 12:55:54'),(136,'test_id','user','1','2014-09-07 13:00:03','2014-09-07 13:00:03'),(137,'test_id','user','1','2014-09-07 13:00:12','2014-09-07 13:00:12'),(138,'test_id','user','1','2014-09-07 13:00:19','2014-09-07 13:00:19'),(139,'test_id','user','1','2014-09-07 13:04:32','2014-09-07 13:04:32'),(140,'test_id','user','1','2014-09-07 13:08:29','2014-09-07 13:08:29'),(141,'test_id','user','1','2014-09-07 13:08:34','2014-09-07 13:08:34'),(142,'test_id','user','1','2014-09-07 13:08:55','2014-09-07 13:08:55'),(143,'test_id','user','1','2014-09-07 13:08:59','2014-09-07 13:08:59'),(144,'test_id','user','1','2014-09-07 13:09:17','2014-09-07 13:09:17'),(145,'test_id','user','1','2014-09-07 13:11:30','2014-09-07 13:11:30'),(146,'test_id','user','1','2014-09-07 13:18:27','2014-09-07 13:18:27'),(147,'test_id','user','1','2014-09-07 13:18:36','2014-09-07 13:18:36'),(148,'test_id','user','1','2014-09-07 13:20:21','2014-09-07 13:20:21'),(149,'test_id','user','1','2014-09-07 13:45:59','2014-09-07 13:45:59'),(150,'test_id','user','1','2014-09-07 13:49:49','2014-09-07 13:49:49'),(151,'test_id','user','1','2014-09-07 13:51:15','2014-09-07 13:51:15'),(152,'test_id','user','1','2014-09-07 13:51:27','2014-09-07 13:51:27'),(153,'test_id','user','1','2014-09-07 13:51:34','2014-09-07 13:51:34'),(154,'test_id','user','1','2014-09-07 13:51:39','2014-09-07 13:51:39'),(155,'test_id','user','1','2014-09-08 05:28:06','2014-09-08 05:28:06'),(156,'test_id','user','1','2014-09-08 05:43:23','2014-09-08 05:43:23'),(157,'test_id','user','1','2014-09-08 05:57:32','2014-09-08 05:57:32'),(158,'test_id','user','1','2014-09-08 05:57:48','2014-09-08 05:57:48'),(159,'test_id','user','1','2014-09-09 06:32:19','2014-09-09 06:32:19'),(160,'test_id','user','1','2014-09-09 06:59:51','2014-09-09 06:59:51'),(161,'test_id','user','1','2014-09-09 06:59:58','2014-09-09 06:59:58'),(162,'test_id','user','1','2014-09-10 18:28:22','2014-09-10 18:28:22'),(163,'test_id','user','1','2014-09-10 18:30:28','2014-09-10 18:30:28'),(164,'test_id','user','1','2014-09-10 18:31:39','2014-09-10 18:31:39'),(165,'test_id','user','1','2014-09-10 18:31:58','2014-09-10 18:31:58'),(166,'test_id','user','1','2014-09-11 07:03:34','2014-09-11 07:03:34'),(167,'test_id','user','1','2014-09-11 13:56:24','2014-09-11 13:56:24'),(168,'test_id','user','1','2014-09-11 16:01:06','2014-09-11 16:01:06'),(169,'test_id','user','1','2014-09-11 16:17:42','2014-09-11 16:17:42'),(170,'test_id','user','1','2014-09-14 15:13:15','2014-09-14 15:13:15'),(171,'test_id','user','1','2014-09-14 15:13:41','2014-09-14 15:13:41'),(172,'test_id','user','1','2014-09-14 15:14:24','2014-09-14 15:14:24'),(173,'test_id','user','1','2014-09-14 15:15:26','2014-09-14 15:15:26'),(174,'test_id','user','1','2014-09-14 18:58:36','2014-09-14 18:58:36'),(175,'test_id','user','1','2014-09-14 19:00:12','2014-09-14 19:00:12'),(176,'test_id','user','1','2014-09-14 19:16:22','2014-09-14 19:16:22'),(177,'test_id','user','1','2014-09-14 19:16:25','2014-09-14 19:16:25'),(178,'test_id','user','1','2014-09-14 19:16:42','2014-09-14 19:16:42'),(179,'test_id','user','1','2014-09-14 19:18:06','2014-09-14 19:18:06'),(180,'test_id','user','1','2014-09-14 19:18:08','2014-09-14 19:18:08'),(181,'test_id','user','1','2014-09-15 13:31:04','2014-09-15 13:31:04'),(182,'test_id','user','1','2014-09-15 14:14:15','2014-09-15 14:14:15'),(183,'test_id','user','1','2014-09-15 14:16:11','2014-09-15 14:16:11'),(184,'test_id','user','1','2014-09-15 14:18:55','2014-09-15 14:18:55'),(185,'test_id','user','1','2014-09-15 14:25:12','2014-09-15 14:25:12');
/*!40000 ALTER TABLE `oauth_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serialized_tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `image_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_title_unique` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Zombies Made of Entire University Faculty.','A zombie outbreak has been confirmed on this college campus. The attack took place sometime between the hours of 5:00 and 10:00 am on March 31st, 2010. While most of the students escaped unscathed, thanks to the valiant efforts of the faculty, the unfortu','Automobiles, Transport, London, Retro','published',1,'0000-00-00 00:00:00','0000-00-00 00:00:00',''),(2,'Cupidatat Lorem qui nostrud sunt.','A zombie outbreak has been confirmed on this college campus. The attack took place sometime between the hours of 5:00 and 10:00 am on March 31st, 2010. While most of the students escaped unscathed, thanks to the valiant efforts of the faculty, the unfortu','Automobiles, Transport, London, Retro','unpublished',0,'0000-00-00 00:00:00','0000-00-00 00:00:00',''),(3,'Cupidatat Lorem qui nostrud sunt cupidatat nostrud sunt. Zombies Made of Entire University Faculty.','A zombie outbreak has been confirmed on this college campus. The attack took place sometime between the hours of 5:00 and 10:00 am on March 31st, 2010. While most of the students escaped unscathed, thanks to the valiant efforts of the faculty, the unfortu','Automobiles, Transport, London, Retro','published',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2014-09-15 18:41:51
