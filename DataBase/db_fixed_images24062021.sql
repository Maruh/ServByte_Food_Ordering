-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: sandwitchdatabase
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id_address` int NOT NULL AUTO_INCREMENT,
  `city` varchar(100) NOT NULL,
  `state` int NOT NULL,
  `street` varchar(100) NOT NULL,
  `zip_code` varchar(6) NOT NULL,
  PRIMARY KEY (`id_address`),
  KEY `id_state_idx` (`state`),
  CONSTRAINT `id_state` FOREIGN KEY (`state`) REFERENCES `state` (`id_state`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Address',0,'Abuja','12345'),(2,'Address',1,'Lagos','12345'),(3,'Address',2,'Ibadan','12345'),(4,'Address',3,'Uyo','12345'),(5,'Address',4,'Port Harcourt','12345'),(6,'Address',5,'Enugu','12345'),(7,'Address',6,'Asaba','12345'),(8,'Address',7,'Kano','12345'),(9,'Address',8,'Umuahia','12345'),(10,'Address',9,'Onitsha','12345'),(11,'Address',10,'Aba','12345'),(12,'Address',11,'Owerri','12345');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id_order_item` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `unit_price` decimal(19,2) NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id_order_item`),
  KEY `id_order_idx` (`order_id`),
  KEY `id_product_idx` (`product_id`),
  CONSTRAINT `id_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id_orders`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,10,100.00,1,1);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_orders` int NOT NULL AUTO_INCREMENT,
  `order_tracking_numer` varchar(255) NOT NULL,
  `total_price` decimal(19,2) NOT NULL,
  `total_quantity` int NOT NULL,
  `status` tinyint NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`id_orders`),
  KEY `id_user_idx` (`user_id`),
  KEY `id_address_idx` (`address_id`),
  CONSTRAINT `id_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id_address`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'rter345345345',100.00,10,0,'2022-01-22 00:00:00.000000',1,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `unit_price` decimal(13,2) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `available` tinyint NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `id_category_idx` (`category_id`),
  CONSTRAINT `id_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id_product_category`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Test','Test',10.00,'assets/images/hamburger.jpeg',1,1),(2,'Test','Test',5.50,'assets/images/frytki.jpg',1,1),(3,'Test','Test',6.00,'assets/images/hot-dog.jpg',1,1),(4,'Test','Test',7.50,'assets/images/cheeseburger.jpg',1,1),(5,'Test','Test',19.99,'assets/images/quesadilla.jpg',1,1),(6,'Test','Test',8.50,'assets/images/chickenburger.jpg',1,1),(7,'Test','Test',15.00,'assets/images/nachos.jpg',1,1),(8,'Test','Test',17.50,'assets/images/nachos-z-serem.jpg',1,1),(9,'Test','Test',10.00,'assets/images/kebab.jpg',1,1),(10,'Test','Test',18.00,'assets/images/kebab.jpg',1,1),(11,'Test','Test',15.00,'assets/images/qurrito.jpg',1,1),(12,'Test','Test',16.99,'assets/images/burrito.jpg',1,1),(13,'Test','Test',21.99,'assets/images/quesadilla.jpg',1,1),(14,'Test','Test',12.99,'assets/images/tortilla.jpg',1,1),(15,'Test','Test',10.99,'assets/images/salatka-grecka.jpg',1,1),(16,'Test','Test',10.99,'assets/images/salatka-meksykanska.jpg',1,1),(17,'Test','Test',9.99,'assets/images/nuggetsy.jpg',1,1),(18,'Test','Test',6.99,'assets/images/krazki-cebulowe.jpg',1,1),(19,'Test','Test',18.99,'assets/images/kubelek.png',1,1),(20,'Test','Test',16.99,'assets/images/hamburger.jpeg',1,1),(21,'Test','Test',7.99,'assets/images/hot-dog.jpg',1,1),(22,'Test','Test',12.99,'assets/images/salatka-cezar.jpg',1,1),(23,'Test','Test',12.99,'assets/images/chilli-con-corne.jpg',1,1),(24,'Test','Test',26.99,'assets/images/quesadilla.jpg',1,1),(25,'Test','Test',30.99,'assets/images/fajitas.jpg',1,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id_product_category` int NOT NULL AUTO_INCREMENT,
  `name` varchar(2555) NOT NULL,
  PRIMARY KEY (`id_product_category`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Drinks'),(2,'Swallows'),(3,'Pies'),(4,'Rice'),(5,'Soups');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id_state` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_state`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (0,'FCT'),(1,'Lagos'),(2,'Oyo'),(3,'Akwa Ibom'),(4,'Rivers'),(5,'Enugu'),(6,'Delta'),(7,'Kano'),(9,'Abia'),(10,'Onitsha'),(11,'Abia'),(1,'Imo');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `phone_number` int NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'First Name','Last Name','user1@gmail.com','customer',666666666),(2,'First Name','Last Name','user2@gfmail.com','admin',999999999),(3,'First Name','Last Name','user3@gmail','waiter',333333333);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

