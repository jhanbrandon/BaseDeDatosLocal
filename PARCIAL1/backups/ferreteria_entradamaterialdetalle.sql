-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ferreteria
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `entradamaterialdetalle`
--

DROP TABLE IF EXISTS `entradamaterialdetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradamaterialdetalle` (
  `EntradaMaterialDetalleID` int NOT NULL AUTO_INCREMENT,
  `EntradaMaterialID` int DEFAULT NULL,
  `ProductoID` int DEFAULT NULL,
  `EntradaMaterialCantidad` int NOT NULL,
  `EntradaMaterialPrecio` decimal(10,2) NOT NULL,
  `EntradaMaterialImporte` decimal(10,2) NOT NULL,
  PRIMARY KEY (`EntradaMaterialDetalleID`),
  KEY `EntradaMaterialID` (`EntradaMaterialID`),
  KEY `ProductoID` (`ProductoID`),
  CONSTRAINT `entradamaterialdetalle_ibfk_1` FOREIGN KEY (`EntradaMaterialID`) REFERENCES `entradamaterial` (`EntradaMaterialID`),
  CONSTRAINT `entradamaterialdetalle_ibfk_2` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`ProductoID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradamaterialdetalle`
--

LOCK TABLES `entradamaterialdetalle` WRITE;
/*!40000 ALTER TABLE `entradamaterialdetalle` DISABLE KEYS */;
INSERT INTO `entradamaterialdetalle` VALUES (1,1,1,100,12.50,1250.00),(2,1,2,50,8.90,445.00),(3,1,3,200,0.10,20.00),(4,2,4,20,20.00,400.00),(5,2,5,100,3.50,350.00),(6,2,6,1000,0.05,50.00);
/*!40000 ALTER TABLE `entradamaterialdetalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-08 22:03:04
