-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: covid
-- ------------------------------------------------------
-- Server version	8.0.14-cluster

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `age`
--

DROP TABLE IF EXISTS `age`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `age` (
  `age_groups` text,
  `deaths` bigint(20) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `age`
--

LOCK TABLES `age` WRITE;
/*!40000 ALTER TABLE `age` DISABLE KEYS */;
INSERT INTO `age` VALUES ('0-4',30,1),('35-44',3944,5),('5-14',28,2),('55-64',26930,7),('45-54',10976,6),('85+',74492,10),('75-84',59559,9),('25-34',1540,4),('65-74',46666,8),('15-24',284,3);
/*!40000 ALTER TABLE `age` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continent`
--

DROP TABLE IF EXISTS `continent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `continent` (
  `continent` text,
  `total_cases` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continent`
--

LOCK TABLES `continent` WRITE;
/*!40000 ALTER TABLE `continent` DISABLE KEYS */;
INSERT INTO `continent` VALUES ('Europe',2476107),('North America',3605792),('Africa',523546),('South America',2660911),('Oceania',10531),('Asia',2739535);
/*!40000 ALTER TABLE `continent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `datedata`
--

DROP TABLE IF EXISTS `datedata`;
/*!50001 DROP VIEW IF EXISTS `datedata`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `datedata` AS SELECT 
 1 AS `date`,
 1 AS `total_cases`,
 1 AS `new_cases`,
 1 AS `total_deaths`,
 1 AS `new_deaths`,
 1 AS `total_recovery`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `new_cases`
--

DROP TABLE IF EXISTS `new_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `new_cases` (
  `date` varchar(30) DEFAULT NULL,
  `new_cases` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_cases`
--

LOCK TABLES `new_cases` WRITE;
/*!40000 ALTER TABLE `new_cases` DISABLE KEYS */;
INSERT INTO `new_cases` VALUES ('01/17',17),('01/18',136),('01/19',20),('01/20',153),('01/21',142),('01/22',97),('01/23',266),('01/24',453),('01/25',673),('01/26',797),('01/27',1767),('01/28',1480),('01/29',1756),('01/30',2003),('01/31',2120),('02/01',2608),('02/02',2818),('02/03',3243),('02/04',3907),('02/05',3751),('02/06',3218),('02/07',3442),('02/08',2619),('02/09',2988),('02/10',2565),('02/11',2072),('02/12',15151),('02/13',4215),('02/14',2560),('02/15',2162),('02/16',2067),('02/17',1995),('02/18',1864),('02/19',532),('02/20',996),('02/21',1085),('02/22',1008),('02/23',527),('02/24',793),('02/25',865),('02/26',1109),('02/27',1269),('02/28',1848),('02/29',1819),('03/01',2094),('03/02',1833),('03/03',2281),('03/04',2316),('03/05',3033),('03/06',4135),('03/07',3932),('03/08',4178),('03/09',4753),('03/10',4990),('03/11',7662),('03/12',9186),('03/13',10049),('03/14',12185),('03/15',12386),('03/16',13933),('03/17',16715),('03/18',20130),('03/19',30726),('03/20',31554),('03/21',33966),('03/22',33895),('03/23',43880),('03/24',41555),('03/25',52755),('03/26',60422),('03/27',64804),('03/28',62260),('03/29',56791),('03/30',64233),('03/31',73405),('04/01',77084),('04/02',76813),('04/03',81225),('04/04',84258),('04/05',68342),('04/06',73155),('04/07',75090),('04/08',84871),('04/09',86409),('04/10',89955),('04/11',80442),('04/12',70142),('04/13',65610),('04/14',77639),('04/15',78919),('04/16',83394),('04/17',81952),('04/18',79414),('04/19',71301),('04/20',75694),('04/21',86020),('04/22',66130),('04/23',77494),('04/24',73072),('04/25',99903),('04/26',82453),('04/27',65982),('04/28',71488),('04/29',77796),('04/30',84525),('05/01',91461),('05/02',80969),('05/03',78244),('05/04',77474),('05/05',79478),('05/06',90103),('05/07',93972),('05/08',90030),('05/09',89810),('05/10',76636),('05/11',71121),('05/12',85841),('05/13',86074),('05/14',96645),('05/15',98027),('05/16',94020),('05/17',81003),('05/18',87167),('05/19',95094),('05/20',99566),('05/21',107730),('05/22',106564),('05/23',100915),('05/24',94002),('05/25',89150),('05/26',95964),('05/27',102619),('05/28',118710),('05/29',122977),('05/30',127721),('05/31',107834),('06/01',100430),('06/02',112609),('06/03',126718),('06/04',127753),('06/05',133536),('06/06',125802),('06/07',116257),('06/08',105787),('06/09',125655),('06/10',133440),('06/11',137529),('06/12',144502),('06/13',133967),('06/14',122126),('06/15',118849),('06/16',141488),('06/17',176540),('06/18',138777),('06/19',177322),('06/20',161994),('06/21',129892),('06/22',136276),('06/23',165851),('06/24',171332),('06/25',181580),('06/26',189259),('06/27',181386),('06/28',160233),('06/29',159962),('06/30',192563),('07/01',200215),('07/02',178389),('07/03',206544),('07/04',189605),('07/05',178979),('07/06',175445),('07/07',207024),('07/08',214930);
/*!40000 ALTER TABLE `new_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_deaths`
--

DROP TABLE IF EXISTS `new_deaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `new_deaths` (
  `date` varchar(30) DEFAULT NULL,
  `new_deaths` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_deaths`
--

LOCK TABLES `new_deaths` WRITE;
/*!40000 ALTER TABLE `new_deaths` DISABLE KEYS */;
INSERT INTO `new_deaths` VALUES ('01/17',0),('01/18',1),('01/19',0),('01/20',3),('01/21',11),('01/22',0),('01/23',9),('01/24',15),('01/25',15),('01/26',25),('01/27',25),('01/28',26),('01/29',38),('01/30',43),('01/31',46),('02/01',46),('02/02',57),('02/03',65),('02/04',66),('02/05',72),('02/06',73),('02/07',86),('02/08',89),('02/09',97),('02/10',108),('02/11',97),('02/12',255),('02/13',13),('02/14',144),('02/15',142),('02/16',106),('02/17',98),('02/18',139),('02/19',116),('02/20',119),('02/21',112),('02/22',104),('02/23',156),('02/24',79),('02/25',64),('02/26',38),('02/27',57),('02/28',64),('02/29',58),('03/01',67),('03/02',72),('03/03',84),('03/04',80),('03/05',102),('03/06',104),('03/07',97),('03/08',228),('03/09',209),('03/10',275),('03/11',324),('03/12',352),('03/13',444),('03/14',366),('03/15',757),('03/16',609),('03/17',822),('03/18',961),('03/19',1067),('03/20',1392),('03/21',1712),('03/22',1710),('03/23',1841),('03/24',2327),('03/25',2618),('03/26',2831),('03/27',3487),('03/28',3568),('03/29',3221),('03/30',3999),('03/31',4686),('04/01',4994),('04/02',5004),('04/03',6772),('04/04',6238),('04/05',4784),('04/06',5384),('04/07',7577),('04/08',6503),('04/09',7479),('04/10',7013),('04/11',6042),('04/12',5292),('04/13',5343),('04/14',7625),('04/15',10489),('04/16',8496),('04/17',8471),('04/18',6415),('04/19',5007),('04/20',5390),('04/21',7306),('04/22',6014),('04/23',7363),('04/24',5398),('04/25',6183),('04/26',3879),('04/27',4892),('04/28',6492),('04/29',6585),('04/30',5542),('05/01',5804),('05/02',4800),('05/03',3705),('05/04',3998),('05/05',5932),('05/06',6141),('05/07',5740),('05/08',5228),('05/09',4453),('05/10',3397),('05/11',3567),('05/12',5776),('05/13',5151),('05/14',5347),('05/15',5143),('05/16',4257),('05/17',2961),('05/18',3264),('05/19',5232),('05/20',4788),('05/21',5443),('05/22',4688),('05/23',3999),('05/24',797),('05/25',3391),('05/26',3938),('05/27',5168),('05/28',4690),('05/29',4773),('05/30',4059),('05/31',2918),('06/01',3578),('06/02',4655),('06/03',5649),('06/04',5175),('06/05',4777),('06/06',3819),('06/07',3499),('06/08',3227),('06/09',4931),('06/10',5236),('06/11',4765),('06/12',4729),('06/13',4199),('06/14',3133),('06/15',3374),('06/16',6857),('06/17',5243),('06/18',6322),('06/19',5014),('06/20',4218),('06/21',3978),('06/22',3425),('06/23',5577),('06/24',5198),('06/25',6719),('06/26',4709),('06/27',4633),('06/28',3047),('06/29',3712),('06/30',5732),('07/01',4931),('07/02',5143),('07/03',5122),('07/04',4344),('07/05',3380),('07/06',3854),('07/07',6091),('07/08',5370);
/*!40000 ALTER TABLE `new_deaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sex`
--

DROP TABLE IF EXISTS `sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sex` (
  `Sex` text,
  `covid_19_deaths` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sex`
--

LOCK TABLES `sex` WRITE;
/*!40000 ALTER TABLE `sex` DISABLE KEYS */;
INSERT INTO `sex` VALUES ('Male',59982),('Female',52241);
/*!40000 ALTER TABLE `sex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total`
--

DROP TABLE IF EXISTS `total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `total` (
  `country` text,
  `total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total`
--

LOCK TABLES `total` WRITE;
/*!40000 ALTER TABLE `total` DISABLE KEYS */;
INSERT INTO `total` VALUES ('\"Albania\"',3106),('\"Algeria\"',17348),('\"Andorra\"',855),('\"Anguilla\"',3),('\"Antigua and Barbuda\"',73),('\"Armenia\"',29820),('\"Aruba\"',105),('\"Bahamas\"',106),('\"Bangladesh\"',172134),('\"Belarus\"',64224),('\"Benin\"',1285),('\"Bosnia and Herzegovina\"',5869),('\"Botswana\"',314),('\"Brazil\"',1713160),('\"British Virgin Islands\"',8),('\"Bulgaria\"',6342),('\"Burkina Faso\"',1005),('\"Cambodia\"',141),('\"Canada\"',106422),('\"China\"',84950),('\"Costa Rica\"',5836),('\"Cote d\'Ivoire\"',11504),('\"Curacao\"',25),('\"Cyprus\"',1008),('\"Denmark\"',12900),('\"Djibouti\"',4889),('\"Dominica\"',18),('\"Dominican Republic\"',39588),('\"Ecuador\"',64221),('\"Egypt\"',78304),('\"El Salvador\"',8566),('\"Eritrea\"',215),('\"Estonia\"',2003),('\"Ethiopia\"',6774),('\"Finland\"',7265),('\"France\"',169473),('\"Gambia\"',63),('\"Germany\"',197783),('\"Gibraltar\"',179),('\"Greece\"',3622),('\"Greenland\"',13),('\"Grenada\"',23),('\"Guam\"',309),('\"Guatemala\"',25411),('\"Guinea\"',5697),('\"Guinea-Bissau\"',1790),('\"Haiti\"',6486),('\"Hungary\"',4210),('\"Iceland\"',1880),('\"Iran\"',248379),('\"Iraq\"',67442),('\"Ireland\"',25542),('\"Isle of Man\"',336),('\"Jordan\"',1169),('\"Kazakhstan\"',53021),('\"Kosovo\"',3886),('\"Kuwait\"',52007),('\"Laos\"',19),('\"Latvia\"',1141),('\"Lesotho\"',91),('\"Madagascar\"',3573),('\"Malaysia\"',8677),('\"Mali\"',2358),('\"Monaco\"',108),('\"Mongolia\"',227),('\"Montenegro\"',960),('\"Montserrat\"',11),('\"Morocco\"',14771),('\"Mozambique\"',1071),('\"Nepal\"',16423),('\"Netherlands\"',50691),('\"New Zealand\"',1190),('\"Niger\"',1097),('\"Afghanistan\"',33653),('\"Angola\"',386),('\"Argentina\"',83413),('\"Australia\"',8886),('\"Norway\"',8947),('\"Austria\"',18516),('\"Oman\"',50207),('\"Azerbaijan\"',21916),('\"Pakistan\"',240848),('\"Bahrain\"',30931),('\"Papua New Guinea\"',11),('\"Barbados\"',98),('\"Qatar\"',101553),('\"Belgium\"',62210),('\"Belize\"',30),('\"Rwanda\"',1194),('\"Bermuda\"',149),('\"Saint Kitts and Nevis\"',16),('\"Bhutan\"',80),('\"Saint Lucia\"',22),('\"Bolivia\"',42984),('\"Saint Vincent and the Grenadines\"',29),('\"Bonaire Sint Eustatius and Saba\"',7),('\"San Marino\"',713),('\"Brunei\"',141),('\"Sao Tome and Principe\"',724),('\"Burundi\"',191),('\"Sierra Leone\"',1584),('\"Cameroon\"',14916),('\"Slovakia\"',1798),('\"Cape Verde\"',1542),('\"Slovenia\"',1763),('\"Cayman Islands\"',201),('\"Somalia\"',3028),('\"Central African Republic\"',4109),('\"South Sudan\"',2106),('\"Chad\"',873),('\"Sudan\"',10084),('\"Chile\"',303083),('\"Colombia\"',128638),('\"Suriname\"',665),('\"Comoros\"',313),('\"Swaziland\"',1138),('\"Congo\"',1821),('\"Croatia\"',3325),('\"Tanzania\"',509),('\"Cuba\"',2399),('\"Thailand\"',3202),('\"Czech Republic\"',12814),('\"Timor\"',24),('\"Democratic Republic of Congo\"',7737),('\"Tunisia\"',1221),('\"Equatorial Guinea\"',3071),('\"Turks and Caicos Islands\"',55),('\"Faeroe Islands\"',188),('\"Ukraine\"',51224),('\"Falkland Islands\"',13),('\"United Kingdom\"',286979),('\"Fiji\"',21),('\"United States\"',3055004),('\"United States Virgin Islands\"',144),('\"French Polynesia\"',62),('\"Uruguay\"',974),('\"Gabon\"',5871),('\"Uzbekistan\"',11259),('\"Georgia\"',968),('\"Vietnam\"',369),('\"Ghana\"',22822),('\"Western Sahara\"',519),('\"Guernsey\"',252),('\"Yemen\"',1318),('\"Guyana\"',285),('\"Zimbabwe\"',885),('\"Honduras\"',25978),('\"Hong Kong\"',NULL),('\"India\"',767296),('\"Indonesia\"',68079),('\"Israel\"',33557),('\"Italy\"',242149),('\"Jamaica\"',751),('\"Japan\"',20174),('\"Jersey\"',325),('\"Kenya\"',8528),('\"Kyrgyzstan\"',8847),('\"Lebanon\"',1946),('\"Liberia\"',926),('\"Libya\"',1182),('\"Liechtenstein\"',85),('\"Lithuania\"',1854),('\"Luxembourg\"',4650),('\"Macedonia\"',7401),('\"Malawi\"',1929),('\"Maldives\"',2517),('\"Malta\"',673),('\"Mauritania\"',5024),('\"Mauritius\"',342),('\"Mexico\"',275003),('\"Moldova\"',18471),('\"Myanmar\"',318),('\"Namibia\"',593),('\"New Caledonia\"',21),('\"Nicaragua\"',2846),('\"Nigeria\"',30249),('\"Northern Mariana Islands\"',31),('\"Palestine\"',5567),('\"Panama\"',41251),('\"Paraguay\"',2554),('\"Peru\"',312911),('\"Philippines\"',50359),('\"Poland\"',36689),('\"Portugal\"',44859),('\"Puerto Rico\"',8904),('\"Romania\"',30175),('\"Russia\"',700792),('\"Saudi Arabia\"',220144),('\"Senegal\"',7657),('\"Serbia\"',17076),('\"Seychelles\"',91),('\"Singapore\"',45298),('\"Sint Maarten (Dutch part)\"',78),('\"South Africa\"',224665),('\"South Korea\"',13293),('\"Spain\"',252513),('\"Sri Lanka\"',2094),('\"Sweden\"',73858),('\"Switzerland\"',32413),('\"Syria\"',372),('\"Taiwan\"',449),('\"Tajikistan\"',6364),('\"Togo\"',695),('\"Trinidad and Tobago\"',133),('\"Turkey\"',208938),('\"Uganda\"',977),('\"United Arab Emirates\"',53045),('\"Vatican\"',12),('\"Venezuela\"',8010),('\"Zambia\"',1895),('\"World\"',12017118),('\"International\"',696);
/*!40000 ALTER TABLE `total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_cases`
--

DROP TABLE IF EXISTS `total_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `total_cases` (
  `date` varchar(30) DEFAULT NULL,
  `total_cases` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_cases`
--

LOCK TABLES `total_cases` WRITE;
/*!40000 ALTER TABLE `total_cases` DISABLE KEYS */;
INSERT INTO `total_cases` VALUES ('01/17',83),('01/18',219),('01/19',239),('01/20',392),('01/21',534),('01/22',631),('01/23',897),('01/24',1350),('01/25',2023),('01/26',2820),('01/27',4587),('01/28',6067),('01/29',7823),('01/30',9826),('01/31',11946),('02/01',14554),('02/02',17372),('02/03',20615),('02/04',24522),('02/05',28273),('02/06',31491),('02/07',34933),('02/08',37552),('02/09',40540),('02/10',43105),('02/11',45177),('02/12',60328),('02/13',64543),('02/14',67103),('02/15',69265),('02/16',71332),('02/17',73327),('02/18',75191),('02/19',75723),('02/20',76719),('02/21',77804),('02/22',78812),('02/23',79339),('02/24',80132),('02/25',80997),('02/26',82106),('02/27',83375),('02/28',85223),('02/29',87042),('03/01',89136),('03/02',90969),('03/03',93250),('03/04',95566),('03/05',98599),('03/06',102734),('03/07',106666),('03/08',110844),('03/09',115597),('03/10',120587),('03/11',128249),('03/12',137435),('03/13',147484),('03/14',159669),('03/15',172055),('03/16',185988),('03/17',202703),('03/18',222833),('03/19',253559),('03/20',285113),('03/21',319079),('03/22',352974),('03/23',396854),('03/24',438409),('03/25',491164),('03/26',551586),('03/27',616390),('03/28',678650),('03/29',735441),('03/30',799674),('03/31',873079),('04/01',950163),('04/02',1026976),('04/03',1108201),('04/04',1192459),('04/05',1260801),('04/06',1333956),('04/07',1409046),('04/08',1493917),('04/09',1580326),('04/10',1670281),('04/11',1750723),('04/12',1820865),('04/13',1886475),('04/14',1964114),('04/15',2043033),('04/16',2126427),('04/17',2208379),('04/18',2287793),('04/19',2359094),('04/20',2434788),('04/21',2520808),('04/22',2586938),('04/23',2664432),('04/24',2737504),('04/25',2837407),('04/26',2919860),('04/27',2985842),('04/28',3057330),('04/29',3135126),('04/30',3219651),('05/01',3311112),('05/02',3392081),('05/03',3470325),('05/04',3547799),('05/05',3627277),('05/06',3717380),('05/07',3811352),('05/08',3901382),('05/09',3991192),('05/10',4067828),('05/11',4138949),('05/12',4224790),('05/13',4310864),('05/14',4407509),('05/15',4505536),('05/16',4599556),('05/17',4680559),('05/18',4767726),('05/19',4862820),('05/20',4962386),('05/21',5070116),('05/22',5176680),('05/23',5277595),('05/24',5371597),('05/25',5460747),('05/26',5556711),('05/27',5659330),('05/28',5778040),('05/29',5901017),('05/30',6028738),('05/31',6136572),('06/01',6237002),('06/02',6349611),('06/03',6476329),('06/04',6604082),('06/05',6737618),('06/06',6863420),('06/07',6979677),('06/08',7085464),('06/09',7211119),('06/10',7344559),('06/11',7482088),('06/12',7626590),('06/13',7760557),('06/14',7882683),('06/15',8001532),('06/16',8143020),('06/17',8319560),('06/18',8458337),('06/19',8635659),('06/20',8797653),('06/21',8927545),('06/22',9063821),('06/23',9229672),('06/24',9401004),('06/25',9582584),('06/26',9771843),('06/27',9953229),('06/28',10113462),('06/29',10273424),('06/30',10465987),('07/01',10666202),('07/02',10844591),('07/03',11051135),('07/04',11240740),('07/05',11419719),('07/06',11595164),('07/07',11802188),('07/08',12017118);
/*!40000 ALTER TABLE `total_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_deaths`
--

DROP TABLE IF EXISTS `total_deaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `total_deaths` (
  `date` varchar(30) DEFAULT NULL,
  `total_deaths` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_deaths`
--

LOCK TABLES `total_deaths` WRITE;
/*!40000 ALTER TABLE `total_deaths` DISABLE KEYS */;
INSERT INTO `total_deaths` VALUES ('01/17',2),('01/18',3),('01/19',3),('01/20',6),('01/21',17),('01/22',17),('01/23',26),('01/24',41),('01/25',56),('01/26',81),('01/27',106),('01/28',132),('01/29',170),('01/30',213),('01/31',259),('02/01',305),('02/02',362),('02/03',427),('02/04',493),('02/05',565),('02/06',638),('02/07',724),('02/08',813),('02/09',910),('02/10',1018),('02/11',1115),('02/12',1370),('02/13',1383),('02/14',1527),('02/15',1669),('02/16',1775),('02/17',1873),('02/18',2012),('02/19',2128),('02/20',2247),('02/21',2359),('02/22',2463),('02/23',2619),('02/24',2698),('02/25',2762),('02/26',2800),('02/27',2857),('02/28',2921),('02/29',2979),('03/01',3046),('03/02',3118),('03/03',3202),('03/04',3282),('03/05',3384),('03/06',3488),('03/07',3585),('03/08',3813),('03/09',4022),('03/10',4297),('03/11',4621),('03/12',4973),('03/13',5417),('03/14',5783),('03/15',6540),('03/16',7149),('03/17',7971),('03/18',8932),('03/19',9999),('03/20',11391),('03/21',13103),('03/22',14813),('03/23',16654),('03/24',18981),('03/25',21599),('03/26',24430),('03/27',27917),('03/28',31485),('03/29',34706),('03/30',38705),('03/31',43391),('04/01',48385),('04/02',53389),('04/03',60161),('04/04',66399),('04/05',71183),('04/06',76567),('04/07',84144),('04/08',90647),('04/09',98126),('04/10',105139),('04/11',111181),('04/12',116473),('04/13',121816),('04/14',129441),('04/15',139930),('04/16',148426),('04/17',156897),('04/18',163312),('04/19',168319),('04/20',173709),('04/21',181015),('04/22',187029),('04/23',194392),('04/24',199790),('04/25',205973),('04/26',209852),('04/27',214744),('04/28',221236),('04/29',227821),('04/30',233363),('05/01',239167),('05/02',243967),('05/03',247672),('05/04',251670),('05/05',257602),('05/06',263743),('05/07',269483),('05/08',274711),('05/09',279164),('05/10',282561),('05/11',286128),('05/12',291904),('05/13',297055),('05/14',302402),('05/15',307545),('05/16',311802),('05/17',314763),('05/18',318027),('05/19',323259),('05/20',328047),('05/21',333490),('05/22',338178),('05/23',342177),('05/24',342974),('05/25',346365),('05/26',350303),('05/27',355471),('05/28',360161),('05/29',364934),('05/30',368993),('05/31',371911),('06/01',375489),('06/02',380144),('06/03',385793),('06/04',390968),('06/05',395745),('06/06',399564),('06/07',403063),('06/08',406290),('06/09',411221),('06/10',416457),('06/11',421222),('06/12',425951),('06/13',430150),('06/14',433283),('06/15',436657),('06/16',443514),('06/17',448757),('06/18',455079),('06/19',460093),('06/20',464311),('06/21',468289),('06/22',471714),('06/23',477291),('06/24',482489),('06/25',489208),('06/26',493917),('06/27',498550),('06/28',501597),('06/29',505309),('06/30',511041),('07/01',515972),('07/02',521115),('07/03',526237),('07/04',530581),('07/05',533961),('07/06',537815),('07/07',543906),('07/08',549276);
/*!40000 ALTER TABLE `total_deaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_recovery`
--

DROP TABLE IF EXISTS `total_recovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `total_recovery` (
  `date` text,
  `total_recovery` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_recovery`
--

LOCK TABLES `total_recovery` WRITE;
/*!40000 ALTER TABLE `total_recovery` DISABLE KEYS */;
INSERT INTO `total_recovery` VALUES ('01/22',28),('01/23',30),('01/24',36),('01/25',39),('01/26',52),('01/27',61),('01/28',107),('01/29',126),('01/30',143),('01/31',222),('02/01',284),('02/02',472),('02/03',623),('02/04',852),('02/05',1124),('02/06',1487),('02/07',2011),('02/08',2616),('02/09',3244),('02/10',3946),('02/11',4683),('02/12',5150),('02/13',6295),('02/14',8058),('02/15',9395),('02/16',10865),('02/17',12583),('02/18',14352),('02/19',16121),('02/20',18177),('02/21',18890),('02/22',22886),('02/23',23394),('02/24',25227),('02/25',27905),('02/26',30384),('02/27',33277),('02/28',36711),('02/29',39782),('03/01',42716),('03/02',45602),('03/03',48228),('03/04',51170),('03/05',53796),('03/06',55865),('03/07',58359),('03/08',60694),('03/09',62493),('03/10',64404),('03/11',67002),('03/12',68323),('03/13',70250),('03/14',72621),('03/15',76031),('03/16',78085),('03/17',80837),('03/18',83320),('03/19',84957),('03/20',87402),('03/21',91666),('03/22',97881),('03/23',98346),('03/24',107985),('03/25',113768),('03/26',122133),('03/27',130902),('03/28',139396),('03/29',148863),('03/30',164300),('03/31',177786),('04/01',192876),('04/02',209917),('04/03',225364),('04/04',245777),('04/05',259616),('04/06',276249),('04/07',299637),('04/08',328353),('04/09',353689),('04/10',375508),('04/11',401755),('04/12',421158),('04/13',448324),('04/14',473417),('04/15',510084),('04/16',540912),('04/17',567032),('04/18',590955),('04/19',622609),('04/20',644611),('04/21',679438),('04/22',709867),('04/23',738658),('04/24',788691),('04/25',816470),('04/26',845073),('04/27',872876),('04/28',906142),('04/29',948310),('04/30',1013281),('05/01',1051512),('05/02',1092429),('05/03',1124752),('05/04',1158816),('05/05',1195421),('05/06',1241339),('05/07',1280836),('05/08',1317358),('05/09',1370907),('05/10',1404501),('05/11',1451495),('05/12',1488530),('05/13',1544372),('05/14',1584107),('05/15',1632096),('05/16',1688687),('05/17',1729573),('05/18',1782471),('05/19',1834636),('05/20',1893549),('05/21',1944814),('05/22',2053465),('05/23',2108436),('05/24',2163876),('05/25',2227599),('05/26',2282813),('05/27',2346206),('05/28',2413063),('05/29',2490390),('05/30',2560862),('05/31',2637170),('06/01',2692065),('06/02',2796188),('06/03',2875330),('06/04',2945359),('06/05',3014515),('06/06',3086717),('06/07',3141810),('06/08',3293408),('06/09',3375668),('06/10',3454807),('06/11',3540696),('06/12',3620412),('06/13',3706353),('06/14',3777131),('06/15',3857338),('06/16',3955169),('06/17',4073955),('06/18',4155099),('06/19',4250107),('06/20',4365932),('06/21',4434628),('06/22',4526333),('06/23',4630391),('06/24',4746118),('06/25',4838921),('06/26',4945557),('06/27',5051864),('06/28',5140899),('06/29',5235813),('06/30',5353205),('07/01',5469134),('07/02',5754006),('07/03',5863847),('07/04',6059565),('07/05',6179006),('07/06',6302626),('07/07',6447656),('07/08',6605607);
/*!40000 ALTER TABLE `total_recovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `totalpermillion`
--

DROP TABLE IF EXISTS `totalpermillion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `totalpermillion` (
  `country` text,
  `total_per_million` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totalpermillion`
--

LOCK TABLES `totalpermillion` WRITE;
/*!40000 ALTER TABLE `totalpermillion` DISABLE KEYS */;
INSERT INTO `totalpermillion` VALUES ('Qatar',35248.484000000004),('San Marino',21008.87800000001),('Bahrain',18177.780000000002),('Chile',15854.767),('Vatican',14833.128000000004),('Kuwait',12178.020999999995),('Andorra',11065.801999999989),('Armenia',10063.326),('Oman',9831.743999999999),('Panama',9560.428000000004);
/*!40000 ALTER TABLE `totalpermillion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `datedata`
--

/*!50001 DROP VIEW IF EXISTS `datedata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datedata` AS select `total_cases`.`date` AS `date`,`total_cases`.`total_cases` AS `total_cases`,`new_cases`.`new_cases` AS `new_cases`,`total_deaths`.`total_deaths` AS `total_deaths`,`new_deaths`.`new_deaths` AS `new_deaths`,`total_recovery`.`total_recovery` AS `total_recovery` from ((((`total_cases` join `new_cases`) join `total_deaths`) join `new_deaths`) join `total_recovery`) where ((`total_cases`.`date` = `total_deaths`.`date`) and (`total_cases`.`date` = `new_cases`.`date`) and (`total_cases`.`date` = `new_deaths`.`date`) and (`total_cases`.`date` = `total_recovery`.`date`)) */;
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

-- Dump completed on 2020-07-10 10:06:24
