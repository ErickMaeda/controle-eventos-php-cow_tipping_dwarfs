CREATE DATABASE  IF NOT EXISTS `cowyotte` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cowyotte`;
-- MySQL dump 10.14  Distrib 5.5.40-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cowyotte
-- ------------------------------------------------------
-- Server version	5.5.40-MariaDB

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
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `id_cidade` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) NOT NULL,
  `des_cidade` varchar(45) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_cidade`),
  KEY `fk_cidade_estado_idx` (`id_estado`),
  CONSTRAINT `fk_cidade_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (14,37,'ad',0),(17,37,'Salto',1),(18,37,'Cabreúva',0),(20,37,'Sorocaba',0),(22,25,'Curitiba',0),(23,37,'Campinas',1),(24,37,'Mombuca',0),(25,37,'São Paulo',1),(26,37,'Indaiatuba',1);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_cidade` varchar(45) DEFAULT NULL,
  `id_estado` varchar(45) DEFAULT NULL,
  `nome_cliente` varchar(45) DEFAULT NULL,
  `telefone_cliente` varchar(45) NOT NULL,
  `endereco_cliente` varchar(200) DEFAULT NULL,
  `codigo_uc` int(11) DEFAULT NULL,
  `codigo_nis` int(11) DEFAULT NULL,
  `cpf_cliente` varchar(45) NOT NULL,
  `rg_cliente` varchar(45) DEFAULT NULL,
  `dt_cadastro` datetime NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '1',
  `cracha_stat` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (32,'14','13','Daniel','6543654','gbbrebrqbyb',123543,5436543,'654334567','1237654','2016-02-18 14:55:29',0,0),(33,'14','13','Daniel 1','4754754','7475454745754',4754754,47574,'12364645','754745','2016-02-18 15:01:48',1,0),(34,'14','13','Daniel 2','364363','alameda dos zés',54543,63643,'235426346','123','2016-02-18 15:04:51',1,1),(35,'26','18','Daniel 3','2132112312','3121qwdawdadadw',12321312,2147483647,'12321321213','2132123123','2016-02-19 00:33:24',1,2);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `des_departamento` varchar(45) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (4,'Vendas',0),(5,'Compras',1),(6,'Recursos Humanos',1),(7,'Homem Biônico',1),(10,'Microsoft',0),(11,'Tecnologia',1);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `des_estado` varchar(45) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (10,'Acre',0),(13,'aAmazonas',0),(15,'Ceará',1),(16,'Distrito Federal',1),(17,'Espírito Santo',1),(18,'Goiás',1),(19,'Maranhão',1),(20,'Mato Grosso',1),(21,'Mato Grosso do Sul',1),(22,'Minas Gerais',1),(23,'Pará',1),(24,'Paraíba',1),(25,'Paraná',1),(26,'Pernambuco',1),(27,'Piauí',1),(28,'Rio de Janeiro',1),(29,'Rio Grande do Norte',1),(30,'Rio Grande do Sul',1),(31,'Rondônia',1),(32,'Roraima',1),(33,'Santa Catarina',1),(35,'Sergipe',1),(36,'Tocantins',1),(37,'São Paulo',1),(39,'Bahia',0),(41,'Bahia',1),(42,'aAaaa',0);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `id_cidade` int(11) NOT NULL,
  `des_evento` varchar(45) NOT NULL,
  `dt_cadastro` datetime NOT NULL,
  `status_evento` int(11) NOT NULL DEFAULT '1',
  `stat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_evento`),
  KEY `fk_evento_cidade_idx` (`id_cidade`),
  CONSTRAINT `fk_evento_cidade` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,14,'adasda','2016-02-18 08:51:10',1,0),(2,14,'asd','2016-02-18 09:02:58',2,0),(3,14,'Rave Party Muito Louca','2016-02-18 09:53:36',1,0),(4,14,'Passeio de Bicicleta Tandem','2016-02-18 09:55:44',1,0),(5,25,'Corrida de muletaaa','2016-02-18 10:30:50',2,0),(6,14,'Corrida de lesma','2016-02-18 10:33:37',2,0),(7,14,'Corrida de lesma','2016-02-18 15:05:19',1,0),(8,23,'Palestra sobre programação de microondas','2016-02-18 15:05:54',1,1),(9,17,'asd','2016-02-18 20:48:59',1,0),(10,25,'Heeeeey jow','2016-02-19 00:33:06',1,1),(11,23,'adwadwad','2016-02-19 01:47:32',1,1);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_cliente`
--

DROP TABLE IF EXISTS `evento_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento_cliente` (
  `id_evento_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_evento` int(11) NOT NULL,
  `dt_cadastro` datetime NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_evento_cliente`),
  KEY `fk_cliente_evento_cliente_idx` (`id_cliente`),
  KEY `fk_cliente_evento_evento_idx` (`id_evento`),
  CONSTRAINT `fk_evento_cliente_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_cliente_evento` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_cliente`
--

LOCK TABLES `evento_cliente` WRITE;
/*!40000 ALTER TABLE `evento_cliente` DISABLE KEYS */;
INSERT INTO `evento_cliente` VALUES (94,32,8,'2016-02-21 20:58:38',0),(95,32,8,'2016-02-21 20:58:52',0),(96,32,8,'2016-02-21 20:33:18',1),(97,33,8,'2016-02-21 20:33:52',1),(98,35,8,'2016-02-21 20:43:47',0);
/*!40000 ALTER TABLE `evento_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_fotos`
--

DROP TABLE IF EXISTS `evento_fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento_fotos` (
  `id_evento_cliente` int(11) NOT NULL,
  `caminho_file` varchar(200) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '1',
  KEY `fk_evento_fotos_evento_cliente_idx` (`id_evento_cliente`),
  CONSTRAINT `fk_evento_fotos_evento_cliente` FOREIGN KEY (`id_evento_cliente`) REFERENCES `evento_cliente` (`id_evento_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_fotos`
--

LOCK TABLES `evento_fotos` WRITE;
/*!40000 ALTER TABLE `evento_fotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento_fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_produto`
--

DROP TABLE IF EXISTS `evento_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento_produto` (
  `id_evento` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `qtd_produto` int(11) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '1',
  KEY `fk_evento_produto_produto_idx` (`id_produto`),
  KEY `fk_evento_produto_evento_cliente_idx` (`id_evento`),
  CONSTRAINT `fk_evento_produto_evento` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_produto_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_produto`
--

LOCK TABLES `evento_produto` WRITE;
/*!40000 ALTER TABLE `evento_produto` DISABLE KEYS */;
INSERT INTO `evento_produto` VALUES (9,10,123,1),(9,12,333,1),(5,9,4444,0),(8,9,12344,0),(8,9,33,0),(11,8,1111,1),(8,7,50,1);
/*!40000 ALTER TABLE `evento_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `id_departamento` int(11) NOT NULL,
  `qtd_produto` int(11) NOT NULL DEFAULT '0',
  `des_produto` varchar(200) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_produto`),
  KEY `fk_produto_departamento_idx` (`id_departamento`),
  CONSTRAINT `fk_produto_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (7,11,-488,'Xbox One',0),(8,6,-8876,'Microsoft Surface Pro',1),(9,11,-310,'Microsoft Lumia 950',1),(10,11,17777,'Motorola Defy',1),(11,11,500,'Lenovo Vibe',1),(12,7,123,'produto',1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificado do Usuario',
  `id_usuario_tipo` int(11) NOT NULL DEFAULT '2' COMMENT '1 - Administrador\n2 - Operador',
  `nome_usuario` varchar(45) DEFAULT NULL COMMENT 'Nome do usuario, que é opcional',
  `senha_usuario` varchar(45) NOT NULL COMMENT 'Senha do usuario Obrigatoria',
  `email_usuario` varchar(45) DEFAULT NULL COMMENT 'Email do usuario que deve ser unico',
  `stat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email_usuario_UNIQUE` (`email_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,2,'Erick Maeda','12345','erick.maeda26@gmail.com',1),(7,2,'Daniel Dias','1234','daniel@teste.com',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-22  7:49:41
