-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: express_food
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `categorie_produit`
--

DROP TABLE IF EXISTS `categorie_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie_produit` (
  `id_categorie_produit` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(48) NOT NULL,
  PRIMARY KEY (`id_categorie_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie_produit`
--

LOCK TABLES `categorie_produit` WRITE;
/*!40000 ALTER TABLE `categorie_produit` DISABLE KEYS */;
INSERT INTO `categorie_produit` VALUES (1,'Plat'),(2,'Dessert');
/*!40000 ALTER TABLE `categorie_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime NOT NULL,
  `statut` tinyint(4) DEFAULT NULL,
  `typePaiement` varchar(48) NOT NULL,
  `statutPaiment` tinyint(4) NOT NULL,
  `prix` decimal(5,2) NOT NULL,
  `id_commande_produit` int(11) DEFAULT NULL,
  `id_information_livraison` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `id_livreur` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `fk_commande_commandeProduit_idx` (`id_commande_produit`),
  KEY `fk_commande_informationLivraison_idx` (`id_information_livraison`),
  KEY `fk_commande_utilisateur_idx` (`id_utilisateur`),
  KEY `fk_commande_livreur_idx` (`id_livreur`),
  CONSTRAINT `fk_commande_commandeProduit` FOREIGN KEY (`id_commande_produit`) REFERENCES `commande_produit` (`id_commande_produit`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_commande_informationLivraison` FOREIGN KEY (`id_information_livraison`) REFERENCES `information_livraison` (`id_information_livraison`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_commande_livreur` FOREIGN KEY (`id_livreur`) REFERENCES `livreur` (`id_livreur`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_commande_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,'2021-03-18 13:48:23',0,'carte',1,7.00,1,1,1,2),(2,'2021-03-18 19:36:10',1,'paypal',0,13.99,2,2,2,1),(5,'2021-03-26 16:55:44',0,'carte',0,22.00,3,7,7,3),(6,'2021-03-26 16:56:42',0,'carte',0,22.00,3,7,7,3),(7,'2021-03-26 16:56:42',1,'carte',1,15.00,7,5,6,4),(8,'2021-03-26 16:56:42',1,'carte',1,34.99,6,5,5,5),(9,'2021-03-26 16:56:42',0,'carte',1,40.00,7,3,7,5);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande_produit`
--

DROP TABLE IF EXISTS `commande_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande_produit` (
  `id_commande_produit` int(11) NOT NULL AUTO_INCREMENT,
  `id_produit` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `detail` longtext NOT NULL,
  PRIMARY KEY (`id_commande_produit`),
  KEY `fk_commandeProduit_produit_idx` (`id_produit`),
  CONSTRAINT `fk_commandeProduit_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande_produit`
--

LOCK TABLES `commande_produit` WRITE;
/*!40000 ALTER TABLE `commande_produit` DISABLE KEYS */;
INSERT INTO `commande_produit` VALUES (1,1,2,'La commande est complète.'),(2,2,1,'La commande est complète.'),(3,1,4,'La commande est complète.'),(4,2,5,'La commande est complète.'),(5,2,3,'La commande est complète.'),(6,1,2,'La commande est complète.'),(7,1,3,'La commande est complète.');
/*!40000 ALTER TABLE `commande_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information_livraison`
--

DROP TABLE IF EXISTS `information_livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `information_livraison` (
  `id_information_livraison` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) DEFAULT NULL,
  `adresse` varchar(112) NOT NULL,
  `ville` varchar(48) NOT NULL,
  `codePostal` varchar(48) NOT NULL,
  `latitude` decimal(8,6) NOT NULL,
  `longitude` decimal(8,6) NOT NULL,
  PRIMARY KEY (`id_information_livraison`),
  KEY `fk_informationLivraison_utilisateur_idx` (`id_utilisateur`),
  CONSTRAINT `fk_informationLivraison_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information_livraison`
--

LOCK TABLES `information_livraison` WRITE;
/*!40000 ALTER TABLE `information_livraison` DISABLE KEYS */;
INSERT INTO `information_livraison` VALUES (1,1,'8 Avenue d\'Alery','Annecy','74000',45.900330,6.119690),(2,2,'32 Avenue de Genève','Annecy','74000',45.911110,6.455388),(3,8,'8 Rue de rumilly','Annecy','74000',46.918189,6.125627),(4,4,'5 Avenue de la république','Cran-gevrier','74960',45.451110,6.183803),(5,5,'56 Boulevard du fier','Seynod','74566',45.911999,6.123236),(6,6,'89 Boulevard de la rocade','Meytey','74960',45.465311,6.563570),(7,7,'3 Rue du président Favre','Poisy','74960',45.123456,6.177770);
/*!40000 ALTER TABLE `information_livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livreur` (
  `id_livreur` int(11) NOT NULL AUTO_INCREMENT,
  `statut` tinyint(4) NOT NULL,
  `latitude` decimal(8,6) NOT NULL,
  `longitude` decimal(8,6) NOT NULL,
  PRIMARY KEY (`id_livreur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livreur`
--

LOCK TABLES `livreur` WRITE;
/*!40000 ALTER TABLE `livreur` DISABLE KEYS */;
INSERT INTO `livreur` VALUES (1,1,45.895690,6.112230),(2,0,45.231490,6.025630),(3,0,45.568923,6.235689),(4,1,45.568989,6.123089),(5,1,45.568902,6.274564);
/*!40000 ALTER TABLE `livreur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL AUTO_INCREMENT,
  `id_categorie_produit` int(11) DEFAULT NULL,
  `nom` varchar(48) DEFAULT NULL,
  `description` longtext,
  `prix` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `fk_produit_categorieProduit_idx` (`id_categorie_produit`),
  CONSTRAINT `fk_produit_categorieProduit` FOREIGN KEY (`id_categorie_produit`) REFERENCES `categorie_produit` (`id_categorie_produit`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,1,'mousse au chocolat','Découvrez la mousse au chocolat onctueuse et légère qui ravira tout les passionnés de chocolat, des enfants aux plus grands gourmands.',6.50),(2,2,'blanquette de veau','Découvrez la Blanquette de veau traditionnelle, un classique du terroir qui fait l\'unanimité à chaque bouchée.',14.00),(3,1,'tiramisu','Découvrez l\'incontournable tiramisu, dessert italien crémeux et onctueux que personne ne veut jamais partager. À vos cuillères !',5.50);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'client'),(2,'livreur'),(3,'chef');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(11) NOT NULL,
  `nom` varchar(48) NOT NULL,
  `prenom` varchar(48) NOT NULL,
  `mail` varchar(48) NOT NULL,
  `telephone` varchar(48) NOT NULL,
  `motDePass` varchar(48) NOT NULL,
  PRIMARY KEY (`id_utilisateur`),
  KEY `fk_utilisateur_role_idx` (`id_role`),
  CONSTRAINT `fk_utilisateur_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,1,'Duterin','Jean','jeand@sfr.fr','0623598956','ct91857e9df90e27a6a555efecfc4yy5'),(2,2,'Guerin','Nicolas','guerinn@orange.fr','0612453689','yu91857e9df90ewvb5a516efecfc456'),(3,3,'Ducretet','Emilie','emilied@free.fr','0612897563','5891egye9df90eth66a576efcfc45t6g'),(4,1,'Martin','Edwige','martine@hotmail.fr','0656233564','db91957e9df90e2k66a576efecfc4bea'),(5,1,'Mugnier','Claire','mugnierc@hotmail.fr','0656270569','wpm5957e9df90e52d6a577efectcvbn'),(6,1,'Dunand','Pierre','mdunandp@hotmail.fr','0612230177','954f0dc43b30dc0f5c675611166a8251'),(7,1,'Jacquier','Anais','anaisj@hotmail.fr','0655645899','288dc043aa6c741078f0b07966d921e9'),(8,2,'Ducret','André','andred@hotmail.fr','0674102396','e9d4f7c36e2aa0d8e92b28cbb69fae30'),(9,2,'Rosset','Aurélie','aurelier@hotmail.fr','0614535645','d91bab566e8f5bed352cbb44b31fd468'),(10,2,'Favre','Diane','dianef@hotmail.fr','0645962348','3d3b46cb5d455781fe46386af8b70b7e'),(11,2,'Tissot','Eric','erict@hotmail.fr','0645759623','8f1570b80d3eb690753bfcc8ca52697b');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'express_food'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-26 17:00:16
