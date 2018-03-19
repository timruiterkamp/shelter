-- MySQL dump 10.13  Distrib 5.7.21, for osx10.13 (x86_64)
--
-- Host: localhost    Database: animals
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `animals`
--

DROP TABLE IF EXISTS `animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `type` text,
  `place` text,
  `shelterName` text,
  `description` text,
  `sex` text,
  `age` int(11) DEFAULT NULL,
  `size` text,
  `length` text,
  `weight` text,
  `vaccinated` tinyint(1) DEFAULT NULL,
  `declawed` tinyint(1) DEFAULT NULL,
  `coat` text,
  `primaryColor` text,
  `secondaryColor` text,
  `intake` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals`
--

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;
INSERT INTO `animals` VALUES (17,'Miller','dog','Manhattan Animal Care Center','Manhattan Animal Care Center','A volunteer writes: It\'s 5 o\'clock somewhere. But you don\'t have to wait for happy hour to turn that frown upside down. 5 year-old Miller will have you feeling giddy, light-headed, and tipsy with joy, and that\'s just at the sight of his face. Our little raisinette is utterly irresistible with one smoosh-able gorilla nose, two velvet ears just made for rubbing, and an infinite amount of forehead wrinkles designed to make everyone \\\"ooh\\\" and \\\"ahh.\\\" But the very best part of sweet, petite Miller would have to be, without question, his eyes. Brimming with soul - chock full of life\'s little nothings, wonderful somethings, and loves that have come and gone - Miller\'s eyes seem almost too big for his body, so much world on such a small frame. But no matter Miller\'s past he is all about the present. He is a lover of walks, of snacks, and of talks (well more of a listener, really), and to spend an afternoon with this chocolate firefly is to watch the time fly by. Miller is said previously to have lived with children ages 5 months to 14 years, and is described as playful, tolerant, and gentle when with them. Miller walks nicely on leash, takes his treats gently, and was exceptionally tolerant of being tethered for photos and wearing his warm, winter coat. Miller appears to be housebroken and has been social and tolerant of other dogs while at the shelter. It\'s 5 o\'clock somewhere, but there\'s one time of day guaranteed to leave your head feeling tipsy, your heart feeling full, and your home just bursting with love. That\'s Miller time. Miller is waiting in adoptions at Manhattan ACC.','male',5,'small','short','20',1,NULL,'smooth','Black','White','2018-01-20'),(19,'Medusa','rabbit','Manhattan Animal Care Center','Manhattan Animal Care Center','A volunteer writes: Medusa is cute as a button, playful as a puppy and ready to start adventuring as soon as you are! If her stunning smile doesn\'t win you over on the spot she\'s got lots of snuggles to offer too and enough energy to power the city for days so you\'ll never want for a playful sidekick. Fresh out of an adoring foster home, we\'re told Medusa was friendly to everyone she met, loved to cuddle on the couch and slept on her own bed every night. She would lay on her back on the floor and wiggle for 15 minutes at a time and to quote her foster Mom, if you\'re not giving her belly rubs by this point, you might want to check if you have a pulse at all! Medusa\'s a petite gal but very strong so a harness leash helps with walks and while she can\'t wait to engage with other pups, her enthusiastic manners can be a bit overwhelming for some dogs so a home with only very tolerant and playful siblings is a must. Medusa herself is extremely tolerant of others and when playing with a puppy she wasn\'t even bothered by his mouthing her ears and legs, all she wanted was to have fun! She loves toys and treats and already knows how to sit and wait for them too, not to mention posing like a pro for photos and everyone lucky enough to meet her leaves with a smile on their face almost as big as her own. Medusa\'s an all around great dog and with a little bit of basic training, she\'s going to be a beautiful pet who\'ll fill her new family\'s life with years of joyful, loyal companionship. Ask to meet her today!','female',3,'large','short','26',1,NULL,'smooth','Brown','white','2017-08-01'),(20,'Tony','cat','Staten Island Animal Care Center','Staten Island Animal Care Center','','male',1,'small','medium','3',1,0,'thick','Black','White','2018-02-22'),(21,'Burbon','cat','Brooklyn Animal Care Center','Brooklyn Animal Care Center','','male',4,'small','long','6',1,0,'smooth','White','Brown tabby','2018-02-26'),(22,'Ruby','rabbit','Brooklyn Animal Care Center','Brooklyn Animal Care Center','','female',5,'small','medium','3',1,NULL,'smooth','White','','2018-02-21'),(23,'Lago','cat','Manhattan Animal Care Center','Manhattan Animal Care Center','','female',3,'medium','medium','3',1,0,'smooth','Brown','','2018-02-27'),(24,'Marley','dog','Manhattan Animal Care Center','Manhattan Animal Care Center','','male',5,'medium','short','24',1,NULL,'smooth','White','','2018-02-24'),(25,'Selene','dog','Manhattan Animal Care Center','Manhattan Animal Care Center','','female',4,'small','short','4',1,NULL,'smooth','White','brown','2018-02-20');
/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shelter`
--

DROP TABLE IF EXISTS `shelter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shelter` (
  `shelterName` text,
  `City` text,
  `Address` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelter`
--

LOCK TABLES `shelter` WRITE;
/*!40000 ALTER TABLE `shelter` DISABLE KEYS */;
INSERT INTO `shelter` VALUES ('Manhattan Animal Care Center','Manhattan, New York','326 E 110th St, New York, NY 10029, USA'),('Staten Island Animal Care Center','Staten Islan, New York','3139 Veterans Rd W, Staten Island, NY 10309, USA'),('Brooklyn Animal Care Center','Brooklyn, New York','2336 Linden Blvd, Brooklyn, NY 11208, USA');
/*!40000 ALTER TABLE `shelter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-19 21:38:49
