-- MySQL dump 10.13  Distrib 5.7.32, for Win64 (x86_64)
--
-- Host: localhost    Database: jsp_db
-- ------------------------------------------------------
-- Server version	5.7.32

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
-- Table structure for table `bonus`
--

DROP TABLE IF EXISTS `bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonus` (
  `ENAME` varchar(10) DEFAULT NULL,
  `JOB` varchar(9) DEFAULT NULL,
  `SAL` double DEFAULT NULL,
  `COMM` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus`
--

LOCK TABLES `bonus` WRITE;
/*!40000 ALTER TABLE `bonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cano` int(40) NOT NULL AUTO_INCREMENT,
  `id` varchar(100) NOT NULL,
  `pno` int(30) NOT NULL,
  `cnt` int(100) DEFAULT NULL,
  PRIMARY KEY (`cano`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'',0,3),(2,'',0,3),(3,'',0,3);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartre`
--

DROP TABLE IF EXISTS `cartre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartre` (
  `cano` int(40) NOT NULL AUTO_INCREMENT,
  `id` varchar(100) NOT NULL,
  `pno` int(30) NOT NULL,
  `pname` varchar(200) DEFAULT NULL,
  `cnt` int(100) DEFAULT NULL,
  `imgfile` varchar(500) DEFAULT NULL,
  `thumb` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`cano`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartre`
--

LOCK TABLES `cartre` WRITE;
/*!40000 ALTER TABLE `cartre` DISABLE KEYS */;
INSERT INTO `cartre` VALUES (1,'',8,NULL,3,NULL,NULL),(3,'',8,NULL,3,NULL,NULL),(4,'manager',9,NULL,3,NULL,NULL),(5,'manager',11,NULL,3,NULL,NULL),(8,'asdf',4,NULL,1,NULL,NULL),(9,'asdf',8,NULL,1,NULL,NULL),(10,'',9,NULL,1,NULL,NULL),(11,'',13,NULL,1,NULL,NULL),(12,'asdf',11,NULL,1,NULL,NULL),(13,'asdf',13,NULL,1,NULL,NULL),(14,'asdf',9,NULL,1,NULL,NULL),(18,'',4,NULL,1,NULL,NULL),(19,'',9,NULL,3,NULL,NULL),(20,'asdfasdfasdf',3,NULL,2,NULL,NULL),(21,'asdfasdfasdf',8,NULL,2,NULL,NULL),(22,'asdfasdf',3,NULL,1,NULL,NULL),(25,'asdfasdf',15,NULL,3,NULL,NULL);
/*!40000 ALTER TABLE `cartre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `cno` int(11) NOT NULL AUTO_INCREMENT,
  `pno` int(11) NOT NULL,
  `writer` varchar(100) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (3,8,'manager','댓글 삭제 이제 된다 와 이거 ','2020-12-30 05:54:00'),(4,8,'manager','진짜 되는거 맞나 ','2020-12-30 05:54:15'),(5,9,'manager','멍냥이 첫 댓글','2020-12-31 05:11:51'),(6,8,'asdfasdf','댓글 삭제가 또 뜨네요','2020-12-31 06:24:49'),(7,8,'asdfasdf','조회수 1등이에요\n아주좋아','2020-12-31 08:44:51'),(8,4,'asdf','코멘트 달아요','2021-01-01 14:34:50'),(9,10,'manager','이 상품은 곧 품절될 예정입니다!','2021-01-03 15:47:24');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `DEPTNO` int(11) NOT NULL,
  `DNAME` varchar(14) DEFAULT NULL,
  `LOC` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`DEPTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (10,'ACCOUNTING','NEW YORK'),(20,'RESEARCH','DALLAS'),(30,'SALES','CHICAGO'),(40,'OPERATIONS','BOSTON'),(97,'test3','Busan'),(98,'test2','SUWON'),(99,'test','SEOUL');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp` (
  `EMPNO` int(11) NOT NULL,
  `ENAME` varchar(10) DEFAULT NULL,
  `JOB` varchar(9) DEFAULT NULL,
  `MGR` int(11) DEFAULT NULL,
  `HIREDATE` date DEFAULT NULL,
  `SAL` double DEFAULT NULL,
  `COMM` double DEFAULT NULL,
  `DEPTNO` int(11) DEFAULT NULL,
  PRIMARY KEY (`EMPNO`),
  KEY `PK_EMP` (`DEPTNO`),
  CONSTRAINT `FK_EMP` FOREIGN KEY (`DEPTNO`) REFERENCES `dept` (`DEPTNO`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (1111,'test','MANAGER',7839,'2020-12-02',1111,0,99),(1112,'tester2','CLERK',0,'2020-12-04',1212,0,99),(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10),(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,NULL,20),(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20),(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10),(9997,'테느스','테느스_2',NULL,'2020-12-07',NULL,NULL,NULL),(9998,'test','test-2',NULL,'2020-12-07',NULL,NULL,NULL),(9999,'test','test-2',NULL,'2020-12-07',NULL,NULL,NULL);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(100) NOT NULL,
  `pwd` varchar(500) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `grade` tinyint(4) DEFAULT '0',
  `cpn` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('asdf','asdf','asdf',0,0),('asdfasdf','asdf','asdfasdf',0,0),('asdfasdfasdf','asdf','asdfasdfasdf',0,0),('manager','asdf','manager',101,0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordera`
--

DROP TABLE IF EXISTS `ordera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordera` (
  `ono` int(40) NOT NULL AUTO_INCREMENT,
  `id` varchar(100) DEFAULT NULL,
  `prdinfo` varchar(300) DEFAULT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(5) DEFAULT NULL,
  PRIMARY KEY (`ono`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordera`
--

LOCK TABLES `ordera` WRITE;
/*!40000 ALTER TABLE `ordera` DISABLE KEYS */;
INSERT INTO `ordera` VALUES (67,'asdf','4:1,8:1,11:1,13:1,9:1,12:3','2021-01-02 17:10:25',1),(68,'asdf','4:1,8:1,11:1,13:1,9:1,12:3','2021-01-03 01:35:41',1),(70,'asdf','10:1,8:1,11:1,13:1,9:1','2021-01-03 01:57:34',1),(71,'asdf','4:1,8:1,11:1,13:1,9:1,12:3','2021-01-03 02:29:16',1),(72,'asdf','4:1,8:1,11:1,13:1,9:1,12:3','2021-01-03 02:31:16',1),(73,'asdf','4:1,8:1,11:1,13:1,9:1,12:3','2021-01-03 02:32:44',1),(74,'asdfasdf','10:1,12:3','2021-01-03 09:26:01',1),(75,'asdfasdf','12:3','2021-01-03 09:26:30',1),(76,'asdfasdf','3:1,10:1,15:3','2021-01-03 09:32:51',1),(77,'manager','9:3,11:3','2021-01-03 16:47:09',1);
/*!40000 ALTER TABLE `ordera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pno` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `pname` varchar(200) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `price` int(12) DEFAULT '0',
  `imgfile` varchar(500) DEFAULT NULL,
  `thumb` varchar(500) DEFAULT NULL,
  `vcnt` decimal(9,0) DEFAULT '0',
  `ocnt` decimal(9,0) DEFAULT '0',
  PRIMARY KEY (`pno`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (3,'ss','3D 프린터 전용 물감 PLA ABS 채색 도료 물감 출력물 후가공 DNA물감','3D 프린터 전용 물감 PLA ABS 채색 도료 물감 출력물 후가공 DNA물감\r\n',3500,'draw02.JPG','s_draw02.JPG',10,0),(4,'ss','성인 어른 색칠공부 컬러링북 색연필 세트 명화색칠하기 집콕생활 놀이','성인 어른 색칠공부 컬러링북 색연필 세트 명화색칠하기 집콕생활 놀이\r\n',15400,'draw03.JPG','s_draw03.JPG',19,0),(8,'pm','미 해병대 전투기 집콕 프라모델 취미 수집 헬기 완구','미 해병대 전투기 집콕 프라모델 취미 수집 헬기 완구',19900,'eagle01.JPG','s_eagle01.JPG',18,8),(9,'ss','멍냥이 컬러링 키트 2021신년ver. 미술놀이 취미 집콕놀이 DIY 아동미술 아트토이','멍냥이 컬러링 키트 2021신년ver. 미술놀이 취미 집콕놀이 DIY 아동미술 아트토이',10500,'draw01.JPG','s_draw01.JPG',9,10),(10,'pm','마세라티모형 자동차조립 집콕 프라모델 아들 취미','마세라티모형 자동차조립 집콕 프라모델 아들 취미\r\n',35000,'car01.JPG','s_car01.JPG',7,0),(11,'lg','레고프렌즈 하트레이크 그랜드호텔 41101 생일선물 집콕놀이','레고프렌즈 하트레이크 그랜드호텔 41101 생일선물 집콕놀이\r\n',53000,'lego01.JPG','s_lego01.JPG',3,8),(12,'lg','레고시티 경찰서 고속추격전 세트 일석이조 호환블럭','레고시티 경찰서 고속추격전 세트 일석이조 호환블럭\r\n',59000,'lego02.JPG','s_lego02.JPG',2,0),(13,'lg','레고경찰서 레고 레고시티시리즈 항공배송 생일선물','레고경찰서 레고 레고시티시리즈 항공배송 생일선물\r\n',170000,'lego03.JPG','s_lego03.JPG',4,0),(14,'pg','노트르담 대성당 3D 입체퍼즐 세계 유명 건축물 건물 모형 조립 종이 초등 뜯어만들기','노트르담 대성당 3D 입체퍼즐 세계 유명 건축물 건물 모형 조립 종이 초등 뜯어만들기\r\n',8400,'puzzle01.JPG','s_puzzle01.JPG',0,6),(15,'pg','노이슈반슈타인 성 3D 입체퍼즐 세계 유명 건축물 건물 모형 조립 종이 초등 뜯어만들기','노이슈반슈타인 성 3D 입체퍼즐 세계 유명 건축물 건물 모형 조립 종이 초등 뜯어만들기',8400,'puzzle02.JPG','s_puzzle02.JPG',2,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qna` (
  `qno` int(11) NOT NULL AUTO_INCREMENT,
  `writer` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `readcount` int(8) NOT NULL DEFAULT '0',
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imagefile` varchar(1000) DEFAULT NULL,
  `thumbnail` varchar(1100) DEFAULT NULL,
  PRIMARY KEY (`qno`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'?','?','?',0,'2020-12-09 02:13:11','?',NULL),(3,'dd','dsf바꾼다 끝','test바꿈',0,'2020-12-09 02:27:17','',NULL),(8,'dd','dd','dd',0,'2020-12-09 02:44:18','',NULL),(10,'dd','dd','dd',0,'2020-12-09 02:46:45','',NULL),(12,'dd','dd','dddd',0,'2020-12-09 02:46:57','',NULL),(14,'dd','dd','dddd',0,'2020-12-09 02:47:05','',NULL),(15,'dd','dd','dddd',0,'2020-12-09 02:47:46','',NULL),(16,'222','222','222',0,'2020-12-09 02:48:29','',NULL),(20,'dd','dfk','skak',0,'2020-12-09 03:01:00','',NULL),(21,'dd','dfk','skak',0,'2020-12-09 03:37:12','',NULL),(22,'dd','dfk','skak',0,'2020-12-09 03:37:14','',NULL),(25,'15615','일단갑세','ㅇㅇㅇ',0,'2020-12-09 12:30:30','',NULL);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salgrade`
--

DROP TABLE IF EXISTS `salgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salgrade` (
  `GRADE` double DEFAULT NULL,
  `LOSAL` double DEFAULT NULL,
  `HISAL` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salgrade`
--

LOCK TABLES `salgrade` WRITE;
/*!40000 ALTER TABLE `salgrade` DISABLE KEYS */;
INSERT INTO `salgrade` VALUES (1,700,1200),(2,1201,1400),(3,1401,2000),(4,2001,3000),(5,3001,9999);
/*!40000 ALTER TABLE `salgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comment`
--

DROP TABLE IF EXISTS `tbl_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_comment` (
  `cno` int(11) NOT NULL AUTO_INCREMENT,
  `pno` int(11) NOT NULL,
  `writer` varchar(100) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comment`
--

LOCK TABLES `tbl_comment` WRITE;
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
INSERT INTO `tbl_comment` VALUES (1,9,'test1','testtest','2020-12-21 12:37:14'),(3,11,'asdf@asdf.asdf','asdfasdf','2020-12-21 14:20:58'),(4,9,'asdf@asdf.asdf','asdfasdfasdf','2020-12-21 14:31:11'),(5,11,'asdf@asdf.asdf','테스트 해봅니다','2020-12-21 14:31:39'),(6,11,'asdf@asdf.asdf','comment test','2020-12-21 14:35:22'),(7,11,'test3','dddd','2020-12-21 15:35:36'),(8,9,'test3','come to me','2020-12-21 15:36:42'),(9,9,'test3','dddd','2020-12-21 15:37:39');
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_member` (
  `email` varchar(100) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `pwd` varchar(500) NOT NULL,
  `grade` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_member`
--

LOCK TABLES `tbl_member` WRITE;
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
INSERT INTO `tbl_member` VALUES ('asdf','asdf','asdf',1),('asdf@asdf.asdf','admin','asdf',120),('asdfasdf@asdf.asdf','asdfasdf','asdf',0),('gold@asdf.asdf','goldddd','asdf',40),('newbee@asdf.asdf','newbeee','asdf',0),('silver@asdf.asdf','silverrrr','asdf',15),('test1@test.com','test1','asdf',0),('test2@test.com','test2','asdf',0),('test3@test.com','test3','asdf',0),('test4@test.com','asdff','asdf',0),('test5@test.com','asdfasdfasdf','asdf',0),('test6@test.com','asdf6','asdf',0),('vip@asdf.asdf','iamvip','asdf',99);
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product` (
  `pno` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `pname` varchar(200) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `price` double(9,2) DEFAULT '0.00',
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `moddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imgfile` varchar(500) DEFAULT NULL,
  `thumb` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`pno`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (9,'2','asdf2342','asdfasdfasdf',999.00,'2020-12-18 16:44:55','2020-12-18 16:44:55','http://hyeong5273pg.dothome.co.kr/jspimg/201219014454_img23.jpg','http://hyeong5273pg.dothome.co.kr/jspimg/s_201219014454_img23.jpg'),(11,'3','tset333','asdfasdfasd',525.00,'2020-12-21 14:16:04','2020-12-21 14:16:04','http://hyeong5273pg.dothome.co.kr/jspimg/201221231603_unnamed2.png','http://hyeong5273pg.dothome.co.kr/jspimg/s_201221231603_unnamed2.png'),(12,'1','asdfasd','asdfasdf',9999.00,'2020-12-28 03:14:18','2020-12-28 03:14:18','http://hyeong5273pg.dothome.co.kr/jspimg/201228121417_image-quality.png','http://hyeong5273pg.dothome.co.kr/jspimg/s_201228121417_image-quality.png');
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'jsp_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-05 16:56:57
