-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: db_app_db2
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
-- Table structure for table `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca` (
  `biblioteca_id` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) DEFAULT NULL,
  `comentario` varchar(1500) DEFAULT NULL,
  `livro_id` int DEFAULT NULL,
  `leitor_id` int DEFAULT NULL,
  PRIMARY KEY (`biblioteca_id`),
  KEY `livro_id_biblio_fk` (`livro_id`),
  KEY `leitor_id_biblio_fk` (`leitor_id`),
  CONSTRAINT `leitor_id_biblio_fk` FOREIGN KEY (`leitor_id`) REFERENCES `leitor` (`leitor_id`),
  CONSTRAINT `livro_id_biblio_fk` FOREIGN KEY (`livro_id`) REFERENCES `livro` (`livro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES (1,'Romance','O tempo e o vento é uma coleção chiclete, daquelas que você não cosegue parar de ler. \n                                        Consigo entender porque deu origem a novelas e minisséries. Resumidamente, é uma história sobre várias gerações de mulheres fortes e homens machistas. \n                                        O Continente é a parte mais legal. Ana Terra é uma personagem forte e cativante. \n                                        E a história de amor dela é a mais bonita. Muitas pessoas amam Um Certo Capitão Rodrigo, talvez ele fosse popular no passado. \n                                        Eu achei um belo de um machista, que só me irritou.',1,2),(2,'Romance','O tempo e o vento é uma coleção chiclete, daquelas que você não cosegue parar de ler. \n                                        Consigo entender porque deu origem a novelas e minisséries. Resumidamente, é uma história sobre várias gerações de mulheres fortes e homens machistas. \n                                        O Continente é a parte mais legal.',2,3),(3,'Romance','Muitas pessoas amam Um Certo Capitão Rodrigo, talvez ele fosse popular no passado. \n                                        Eu achei um belo de um machista, que só me irritou.',3,3),(4,'Romance','Amei',3,2),(5,'Romance','Muito Bom!',4,3),(6,'Romance','Gostei bastante do livro',1,1),(7,'Romance','Esperava mais. Volume 1 foi muito melhor.',5,1);
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-11 20:08:04
