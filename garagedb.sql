-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: garagedb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `booking_services`
--

DROP TABLE IF EXISTS `booking_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_services` (
  `id_booking_service` int NOT NULL AUTO_INCREMENT,
  `booking_service_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_service_cost` double NOT NULL,
  PRIMARY KEY (`id_booking_service`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_services`
--

LOCK TABLES `booking_services` WRITE;
/*!40000 ALTER TABLE `booking_services` DISABLE KEYS */;
INSERT INTO `booking_services` VALUES (1,'Annual Service',160),(2,'Major Service',180),(3,'Repair/Fault',100),(4,'Major Repair',500);
/*!40000 ALTER TABLE `booking_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id_booking` int NOT NULL AUTO_INCREMENT,
  `id_vehicle` int NOT NULL,
  `id_status` int NOT NULL,
  `id_staff` int DEFAULT NULL,
  `date` date NOT NULL,
  `id_booking_service` int NOT NULL,
  `id_slots` int NOT NULL,
  PRIMARY KEY (`id_booking`),
  KEY `id_vehicle_idx` (`id_vehicle`),
  KEY `id_status_idx` (`id_status`),
  KEY `id_staff_idx` (`id_staff`),
  KEY `id_booking_service_idx` (`id_booking_service`),
  KEY `id_slots_idx` (`id_slots`),
  CONSTRAINT `id_booking_service` FOREIGN KEY (`id_booking_service`) REFERENCES `booking_services` (`id_booking_service`),
  CONSTRAINT `id_slots` FOREIGN KEY (`id_slots`) REFERENCES `slots` (`id_slots`),
  CONSTRAINT `id_staff` FOREIGN KEY (`id_staff`) REFERENCES `staffs` (`id_staff`),
  CONSTRAINT `id_status` FOREIGN KEY (`id_status`) REFERENCES `statuses` (`id_status`),
  CONSTRAINT `id_vehicle` FOREIGN KEY (`id_vehicle`) REFERENCES `vehicles` (`id_vehicle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,15,1,NULL,'2023-01-17',1,1),(2,17,1,NULL,'2023-01-19',3,3),(3,18,1,2,'2023-01-18',4,2);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costs`
--

DROP TABLE IF EXISTS `costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costs` (
  `id_booking` int NOT NULL,
  `id_part` int NOT NULL,
  PRIMARY KEY (`id_booking`,`id_part`),
  KEY `id_part_idx` (`id_part`),
  CONSTRAINT `id_booking` FOREIGN KEY (`id_booking`) REFERENCES `bookings` (`id_booking`),
  CONSTRAINT `id_part` FOREIGN KEY (`id_part`) REFERENCES `parts` (`id_part`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costs`
--

LOCK TABLES `costs` WRITE;
/*!40000 ALTER TABLE `costs` DISABLE KEYS */;
/*!40000 ALTER TABLE `costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine_types`
--

DROP TABLE IF EXISTS `engine_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engine_types` (
  `id_engine_type` int NOT NULL AUTO_INCREMENT,
  `engine_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_engine_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine_types`
--

LOCK TABLES `engine_types` WRITE;
/*!40000 ALTER TABLE `engine_types` DISABLE KEYS */;
INSERT INTO `engine_types` VALUES (1,'diesel'),(2,'petrol'),(3,'hybrid'),(4,'electric');
/*!40000 ALTER TABLE `engine_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `makes`
--

DROP TABLE IF EXISTS `makes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `makes` (
  `id_make` int NOT NULL AUTO_INCREMENT,
  `make_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_type_vehicle` int NOT NULL,
  PRIMARY KEY (`id_make`),
  KEY `id_type_vehicle_idx` (`id_type_vehicle`),
  CONSTRAINT `id_type-vehicle` FOREIGN KEY (`id_type_vehicle`) REFERENCES `type_vehicles` (`id_type_vehicle`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `makes`
--

LOCK TABLES `makes` WRITE;
/*!40000 ALTER TABLE `makes` DISABLE KEYS */;
INSERT INTO `makes` VALUES (1,'Yamaha',1),(2,'VW',2),(3,'VW',3),(4,'VW',4),(5,'BMW',1),(6,'BMW',2),(7,'Mercedes-Bens',2),(8,'Mercedes-Bens',3),(9,'Mercedes-Bens',4),(10,'Ford',2),(11,'Ford',3),(12,'Audi',2),(13,'Peogeot',2),(14,'Nissan',2),(15,'Nissan',3),(16,'Nissan',4),(17,'Toyota',2),(18,'Renaut',2),(19,'Renaut',3),(20,'Citroen',2),(21,'Chevrolet',2),(22,'Chevrolet',3),(23,'Chevrolet',4),(24,'Suzuki',1),(25,'Suzuki',2),(26,'Honda',1),(27,'Honda',2),(28,'Hyundai',2),(29,'Hyundai',3),(30,'Hyundai',4),(31,'Tesla',2),(32,'Ferrari',2),(33,'Other',1),(34,'Other',2),(35,'Other',3),(36,'Other',4);
/*!40000 ALTER TABLE `makes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts` (
  `id_part` int NOT NULL AUTO_INCREMENT,
  `part_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `part_price` double NOT NULL,
  PRIMARY KEY (`id_part`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` VALUES (1,'Car boot liner',24.32),(2,'Front Floor mat set',14.87),(3,'Rear Floor mat set',6.21),(4,'Steering wheel cover',6.52),(5,'CASTROL EDGE, LL 15669E',54.1),(6,'MOTUL HYBRID 107156',47.49),(7,'MOTUL HYBRID 107152',36.09),(8,'CASTROL EDGE Professional, LL IV FE 15A54C',14.64),(9,'CASTROL Magnatec, Stop-Start D 15D609',56.06),(10,'MANNOL LEGEND+ESTER MN7901-4 Engine Oil',27.61),(11,'ENEOS Sustina 63580546',18.94),(12,'Air Filter',5.02),(13,'Fuel Filter',12.16),(14,'Oil Filter',5.62),(15,'Pollen Filter',4.54),(16,'Air Intake System',451.11),(17,'Cover Oil Filter housing',46.19),(18,'Filter set',11.35),(19,'Dryer air conditioning',14.15),(20,'Seal oil Filter housing',4.59),(21,'Fuel Filter Spanner',38.1),(22,'Hydraulic Filter steering system',25.17),(23,'ABS Pump',326.11),(24,'Brake Disc',41.24),(25,'Brake pads set',11.03),(26,'Brake Caliper',41.08),(27,'Brake Sleeve Kit ',20.03),(28,'Wheel Brake Cylinder',6.76),(29,'ABS Sensor',15),(30,'Splash Panel Brake Disc',11.32),(31,'Hand Brake',24.3),(32,'Plug holder',23.11),(33,'Wheel trims',13.93),(34,'Snow Chains',24.55),(35,'Car stereo',23.9),(36,'Dash cam',43.18),(37,'Sachs Coil Spring',70),(38,'Corteco Crankshaft Seal',10.39),(39,'Sump Plug',6.77),(40,'Lion Motor Cycle Battery',44.98),(41,'Tyre Motorcycle',20.2),(42,'Frame',120.38),(43,'Scooter Variator kit',18.99),(44,'Rear Wheel Hugger Bracket',25.18);
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slots`
--

DROP TABLE IF EXISTS `slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slots` (
  `id_slots` int NOT NULL AUTO_INCREMENT,
  `slots_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_slots`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slots`
--

LOCK TABLES `slots` WRITE;
/*!40000 ALTER TABLE `slots` DISABLE KEYS */;
INSERT INTO `slots` VALUES (1,'08:00 AM - 10:00 AM'),(2,'10:00 AM - 00:00 PM'),(3,'01:00 PM - 03:00 PM'),(4,'03:00 PM - 05:00 PM');
/*!40000 ALTER TABLE `slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffs` (
  `id_staff` int NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_staff`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
INSERT INTO `staffs` VALUES (1,'Davison'),(2,'Paula'),(3,'Lucas'),(4,'Ivanilda');
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Booked'),(2,'In Service'),(3,'Completed'),(4,'Collected'),(5,'Unrepairable');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_vehicles`
--

DROP TABLE IF EXISTS `type_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_vehicles` (
  `id_type_vehicle` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_type_vehicle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_vehicles`
--

LOCK TABLES `type_vehicles` WRITE;
/*!40000 ALTER TABLE `type_vehicles` DISABLE KEYS */;
INSERT INTO `type_vehicles` VALUES (1,'motorbike'),(2,'car'),(3,'van'),(4,'small bus');
/*!40000 ALTER TABLE `type_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ger','$2a$08$cjdtgdivkVuaJLrvhTvN/eomDBonEJUbbWALsyrc7Fmh3gafWOtmO','gergarage','0861231234',1),(2,'Davison','$2a$08$CfRdIxGF4wtgP/amgtIEJObFzSQOspcEOD6ndEmtFw5a/ovG5MHtO','dodo','0839871234',0),(4,'Ana Paula','$2a$08$uCNKg.KvD9lZtO1lA2iYtuGgz.Cm2MO2nUZQQwe0huqp1L/Cd7.gK','anapaula','0875431235',0),(5,'Lucas','$2a$08$84JM/hslFQAgtpvtOL8v3ethqdhwU2/yABQ/VES2p1GfDsz.KbFIe','lucas','0830987654',0),(6,'Fabio','$2a$08$tbKrkyWLT.45iTL0JFbGn.nw2vt92D.oZbGd6HNIepKBVxgWsozNO','binho','0867641234',0),(8,'Ivanilda','$2a$08$xg0vust/iKILP/3eE6ilMuJNPrelxRepeyaEOHSOtJo9yfWQZmyiW','ivanilda','086764444',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `id_vehicle` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_make` int NOT NULL,
  `id_engine_type` int NOT NULL,
  `vehicle_comment` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_licence` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_vehicle`),
  UNIQUE KEY `vehicle_licence_UNIQUE` (`vehicle_licence`),
  KEY `id_engine_idx` (`id_engine_type`),
  KEY `id_user_idx` (`id_user`),
  KEY `id_make_idx` (`id_make`),
  CONSTRAINT `id_engine_type` FOREIGN KEY (`id_engine_type`) REFERENCES `engine_types` (`id_engine_type`),
  CONSTRAINT `id_make` FOREIGN KEY (`id_make`) REFERENCES `makes` (`id_make`),
  CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (15,5,32,3,'red car','10J1234567'),(17,5,9,2,'beautiful bus','23A1234567'),(18,8,27,2,'Fit car','FT12345676');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'garagedb'
--

--
-- Dumping routines for database 'garagedb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 21:23:27
