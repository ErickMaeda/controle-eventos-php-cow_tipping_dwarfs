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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (14,37,'ad',0),(17,37,'Salto',1),(18,37,'Cabreúva',0),(20,37,'Sorocaba',0),(22,25,'Curitiba',0),(23,37,'Campinas',1),(24,37,'Mombuca',0),(25,37,'São Paulo',1),(26,37,'Indaiatuba',1),(27,22,'Belo Horizonte',1),(28,37,'Mombuca',1),(29,15,'523352',0),(30,15,'A',1),(31,17,'TEA',1),(32,16,'ADWADDA',1),(33,21,'SADASD',1),(34,18,'FAWFWAF',1),(35,15,'AFSAFA',1),(36,17,'adawd',1),(37,15,'adw',1),(38,15,'dada',1),(39,18,'xaxa',1),(40,15,'wagawgaw',1),(41,15,'ADWawwad',1),(42,15,'Faa',1),(43,15,'caa',1),(44,15,'baa',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (32,'14','13','Daniel','6543654','gbbrebrqbyb',123543,5436543,'654334567','1237654','2016-02-18 14:55:29',0,0),(33,'14','10','Daniel','4754754','7475454745754',4754754,47574,'12364645','754745','2016-02-18 15:01:48',1,1),(34,'14','10','João','364363','alameda dos zés',54543,63643,'235426346','123','2016-02-18 15:04:51',1,1),(35,'26','18','Daniel 3','2132112312','3121qwdawdadadw',12321312,2147483647,'12321321213','2132123123','2016-02-19 00:33:24',0,1),(36,'17','17','Erick Maeda Lopes','11974049344','R. Ana Lúcia Lopes de Moraes',3,213123,'44089887828','406496407','2016-02-23 09:19:49',1,1),(37,'14','10','Alface','95028590280','Feira',5905480,849028390,'787349748875','54285280','2016-02-23 12:31:19',1,1),(38,'14','10','Tomate','498901301','Mercado',84174987,2147483647,'48274981','34789427893','2016-02-23 12:31:43',1,0),(39,'14','10','Cebola','98208532098','Quitanda',2147483647,840924809,'97525789275','4920844930','2016-02-23 12:32:08',1,1),(40,'17','15','Batata Frita','363463754','Geladeira',7446574,436574,'6363346','6343436','2016-02-23 14:59:51',1,0),(41,'17','15','dawdwa','21312321','iwodjaawdiojaw',21313,312123,'13213','12313','2016-02-23 21:00:44',1,0),(42,'17','15','dadawa','123123123','KADKASDA',12312,123123,'123123212','3123213211','2016-02-23 21:01:01',1,0),(43,'17','15','AWDWAD','1211231','CACASCACAS]',321,232,'123123','2131231','2016-02-23 21:01:13',1,0),(44,'23','16','adwwadwda','879789789','daidhiaius',98,789,'213213','1323189','2016-02-23 21:01:29',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (4,'Vendas',0),(5,'Compras',1),(6,'Recursos Humanos',1),(7,'Homem Biônico',1),(10,'Microsoft',0),(11,'Tecnologia',1),(12,'Diretoria',1),(14,'Teste',1),(15,'teste',1),(16,'afafa',1),(17,'fafa]',1),(18,'adlsdlad',1),(19,'sadsaf',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (10,'Acre',0),(13,'aAmazonas',0),(15,'Ceará',1),(16,'Distrito Federal',1),(17,'Espírito Santo',1),(18,'Goiás',1),(19,'Maranhão',1),(20,'Mato Grosso',1),(21,'Mato Grosso do Sul',1),(22,'Minas Gerais',1),(23,'Pará',1),(24,'Paraíba',1),(25,'Paraná',1),(26,'Pernambuco',1),(27,'Piauí',1),(28,'Rio de Janeiro',1),(29,'Rio Grande do Norte',1),(30,'Rio Grande do Sul',1),(31,'Rondônia',1),(32,'Roraima',1),(33,'Santa Catarina',1),(35,'Sergipe',1),(36,'Tocantins',1),(37,'São Paulo',1),(39,'Bahia',0),(41,'Bahia',0),(42,'aAaaa',0),(43,'Bahia',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,14,'adasda','2016-02-18 08:51:10',1,0),(2,14,'asd','2016-02-18 09:02:58',2,0),(3,14,'Rave Party Muito Louca','2016-02-18 09:53:36',1,0),(4,14,'Passeio de Bicicleta Tandem','2016-02-18 09:55:44',1,0),(5,25,'Corrida de muletaaa','2016-02-18 10:30:50',2,0),(6,14,'Corrida de lesma','2016-02-18 10:33:37',2,0),(7,14,'Corrida de lesma','2016-02-18 15:05:19',1,0),(8,23,'Palestra sobre programação de microondas','2016-02-18 15:05:54',1,1),(9,17,'asd','2016-02-18 20:48:59',1,0),(10,25,'Heeeeey jow','2016-02-19 00:33:06',1,1),(11,23,'adwadwad','2016-02-19 01:47:32',1,0),(12,23,'Desentupimento de privada','2016-02-23 09:48:39',1,1),(13,26,'Game JAM','2016-02-23 15:03:59',1,1),(14,23,'Dev JAM','2016-02-23 15:04:14',1,1),(15,17,'Como pentear macacos','2016-02-23 15:04:45',2,1),(16,17,'dawdawd','2016-02-23 21:28:29',1,1),(17,17,'sadsda','2016-02-23 21:28:34',1,1),(18,17,'faca','2016-02-23 21:28:38',1,1),(19,17,'na','2016-02-23 21:28:42',1,1),(20,17,'caveira','2016-02-23 21:28:47',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_cliente`
--

LOCK TABLES `evento_cliente` WRITE;
/*!40000 ALTER TABLE `evento_cliente` DISABLE KEYS */;
INSERT INTO `evento_cliente` VALUES (94,32,8,'2016-02-21 20:58:38',0),(95,32,8,'2016-02-21 20:58:52',0),(96,32,8,'2016-02-21 20:33:18',0),(97,33,8,'2016-02-21 20:33:52',0),(98,35,8,'2016-02-21 20:43:47',0),(99,35,8,'2016-02-23 08:07:46',0),(100,36,8,'2016-02-23 09:23:12',0),(101,36,12,'2016-02-23 09:48:58',0),(102,34,11,'2016-02-23 09:50:12',0),(103,32,12,'2016-02-23 09:52:15',0),(104,35,12,'2016-02-23 10:55:25',0),(105,36,10,'2016-02-23 11:27:27',0),(106,36,10,'2016-02-23 11:28:25',0),(107,35,11,'2016-02-23 12:19:32',0),(108,32,8,'2016-02-23 12:35:25',0),(109,38,12,'2016-02-23 12:38:13',0),(110,39,8,'2016-02-23 12:39:52',0),(111,39,12,'2016-02-23 12:40:14',0),(112,37,12,'2016-02-23 12:42:45',0),(113,33,12,'2016-02-23 12:45:06',0),(114,37,12,'2016-02-23 12:47:04',0),(115,38,12,'2016-02-23 12:54:54',1),(116,36,14,'2016-02-23 15:18:14',1),(117,40,15,'2016-02-23 15:18:36',1),(118,32,8,'2016-02-23 15:29:56',1);
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
INSERT INTO `evento_fotos` VALUES (99,'files/images/20160223080815.png',1),(99,'files/images/20160223080820.png',1),(101,'files/images/20160223094928.png',1),(102,'files/images/20160223095411.png',1),(104,'files/images/20160223105535.png',1);
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
INSERT INTO `evento_produto` VALUES (9,10,123,1),(9,12,333,1),(5,9,4444,0),(8,9,12344,0),(8,9,33,0),(11,8,1111,1),(8,7,50,1),(12,13,15,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (7,11,-938,'Xbox One',0),(8,6,-11098,'Microsoft Surface Pro',1),(9,11,-607,'Microsoft Lumia 950',1),(10,11,17777,'Motorola Defy',1),(11,11,500,'Lenovo Vibe',1),(12,11,123,'Xícara',1),(13,7,350,'Nokia 8910i',1),(14,5,20,'Mercedes-Benz SLS',0),(15,5,123,'dad',1),(16,5,13,'dawda',1),(17,5,132,'dawdwad',1),(18,5,111,'cacaca',1),(19,5,123,'afffs',1);
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
  `email_usuario` varchar(45) NOT NULL COMMENT 'Email do usuario que deve ser unico',
  `stat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,2,'Erick Maeda','12345','erick.maeda26@gmail.com',1),(7,2,'Daniel Dias','asdasd','daniel@teste.com',1),(18,1,'Comum','123456','comum@teste.com',1),(19,1,'Teste Teste','4321','teste@teste.com',1);
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

-- Dump completed on 2016-02-23 23:42:57
