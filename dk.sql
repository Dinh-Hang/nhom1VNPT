-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: qldktc
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `ct_donghocphi`
--

DROP TABLE IF EXISTS `ct_donghocphi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ct_donghocphi` (
  `MASV` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `NIENKHOA` char(9) COLLATE utf8mb4_general_ci NOT NULL,
  `HOCKY` int(11) NOT NULL,
  `NGAYDONG` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SOTIENDONG` int(11) NOT NULL,
  PRIMARY KEY (`MASV`,`NIENKHOA`,`HOCKY`,`NGAYDONG`),
  CONSTRAINT `FK_CT_DONGHOCPHI_HOCPHI` FOREIGN KEY (`MASV`, `NIENKHOA`, `HOCKY`) REFERENCES `hocphi` (`MASV`, `NIENKHOA`, `HOCKY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ct_donghocphi`
--

LOCK TABLES `ct_donghocphi` WRITE;
/*!40000 ALTER TABLE `ct_donghocphi` DISABLE KEYS */;
INSERT INTO `ct_donghocphi` VALUES ('SV001','2023-2024',1,'2024-12-24 00:17:36',6000000),('SV002','2023-2024',1,'2024-12-24 00:17:36',6000000),('SV003','2023-2024',1,'2024-12-24 00:17:36',6000000);
/*!40000 ALTER TABLE `ct_donghocphi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dangky`
--

DROP TABLE IF EXISTS `dangky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dangky` (
  `MALTC` int(11) NOT NULL,
  `MASV` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `NGAYDANGKY` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MALTC`,`MASV`),
  KEY `FK_CTLTC_SINHVIEN` (`MASV`),
  CONSTRAINT `FK_CTLTC_SINHVIEN` FOREIGN KEY (`MASV`) REFERENCES `sinhvien` (`MASV`) ON UPDATE CASCADE,
  CONSTRAINT `FK_DANGKY_LOPTINCHI` FOREIGN KEY (`MALTC`) REFERENCES `loptinchi` (`MALTC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dangky`
--

LOCK TABLES `dangky` WRITE;
/*!40000 ALTER TABLE `dangky` DISABLE KEYS */;
INSERT INTO `dangky` VALUES (1,'SV001','2024-12-24 00:14:33'),(2,'SV002','2024-12-24 00:14:33'),(3,'SV003','2024-12-24 00:14:33');
/*!40000 ALTER TABLE `dangky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giangvien`
--

DROP TABLE IF EXISTS `giangvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giangvien` (
  `MAGV` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MAKHOA` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `HOTEN` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `HOCVI` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SDT` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CCCD` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`MAGV`),
  KEY `FK_GIANGVIEN_KHOA` (`MAKHOA`),
  CONSTRAINT `FK_GIANGVIEN_KHOA` FOREIGN KEY (`MAKHOA`) REFERENCES `khoa` (`MAKHOA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giangvien`
--

LOCK TABLES `giangvien` WRITE;
/*!40000 ALTER TABLE `giangvien` DISABLE KEYS */;
INSERT INTO `giangvien` VALUES ('GV001','CNTT','Nguyễn Văn A','Thạc sĩ','0123456789','123456789012'),('GV002','QTKD','Trần Thị B','Tiến sĩ','0987654321','987654321012'),('GV003','KT','Lê Văn C','Cử nhân','0234567890','456789012345');
/*!40000 ALTER TABLE `giangvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hocphi`
--

DROP TABLE IF EXISTS `hocphi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hocphi` (
  `MASV` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `NIENKHOA` char(9) COLLATE utf8mb4_general_ci NOT NULL,
  `HOCKY` int(11) NOT NULL DEFAULT '1',
  `HOCPHI` decimal(10,2) DEFAULT '6000000.00',
  PRIMARY KEY (`MASV`,`NIENKHOA`,`HOCKY`),
  CONSTRAINT `FK_HOCPHI_SINHVIEN` FOREIGN KEY (`MASV`) REFERENCES `sinhvien` (`MASV`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hocphi`
--

LOCK TABLES `hocphi` WRITE;
/*!40000 ALTER TABLE `hocphi` DISABLE KEYS */;
INSERT INTO `hocphi` VALUES ('SV001','2023-2024',1,6000000.00),('SV002','2023-2024',1,6000000.00),('SV003','2023-2024',1,6000000.00);
/*!40000 ALTER TABLE `hocphi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `status_id` (`status_id`),
  KEY `type_id` (`type_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`),
  CONSTRAINT `item_ibfk_3` FOREIGN KEY (`member_id`) REFERENCES `team_members` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Implement Project Apollo','Implement the results of Project Apollo',1,1,1),(2,'Project Apollo: PIR','Conduct a PIR of Project Apollo',2,2,2),(3,'Define tasks for Project Metro','Define project plan and Roadmap',4,2,3),(4,'Fix website bug','Test website using different browsers',3,4,4),(5,'5','nội dung',1,3,3),(8,'6','66',2,2,2);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoa` (
  `MAKHOA` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `TENKHOA` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`MAKHOA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` VALUES ('CNTT','Công nghệ thông tin'),('KT','Kinh tế'),('QTKD','Quản trị kinh doanh');
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lop`
--

DROP TABLE IF EXISTS `lop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lop` (
  `MALOP` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `TENLOP` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `KHOAHOC` char(9) COLLATE utf8mb4_general_ci NOT NULL,
  `MAKHOA` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`MALOP`),
  KEY `FK_LOP_KHOA` (`MAKHOA`),
  CONSTRAINT `FK_LOP_KHOA` FOREIGN KEY (`MAKHOA`) REFERENCES `khoa` (`MAKHOA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lop`
--

LOCK TABLES `lop` WRITE;
/*!40000 ALTER TABLE `lop` DISABLE KEYS */;
INSERT INTO `lop` VALUES ('CNTT1','Lớp CNTT 1','2023','CNTT'),('KT1','Lớp KT 1','2023','KT'),('QTKD1','Lớp QTKD 1','2023','QTKD');
/*!40000 ALTER TABLE `lop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loptinchi`
--

DROP TABLE IF EXISTS `loptinchi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loptinchi` (
  `MALTC` int(11) NOT NULL AUTO_INCREMENT,
  `NIENKHOA` char(9) COLLATE utf8mb4_general_ci NOT NULL,
  `HOCKY` int(11) NOT NULL,
  `MAMH` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MAGV` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MAKHOA` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `SOSV` int(11) NOT NULL,
  `HUYLOP` tinyint(1) NOT NULL DEFAULT '0',
  `NGAYBD` datetime NOT NULL,
  `NGAYKT` datetime NOT NULL,
  PRIMARY KEY (`MALTC`),
  KEY `FK_LOPTINCHI_GIANGVIEN` (`MAGV`),
  KEY `FK_LOPTINCHI_KHOA` (`MAKHOA`),
  KEY `FK_LOPTINCHI_MONHOC` (`MAMH`),
  CONSTRAINT `FK_LOPTINCHI_GIANGVIEN` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`) ON UPDATE CASCADE,
  CONSTRAINT `FK_LOPTINCHI_KHOA` FOREIGN KEY (`MAKHOA`) REFERENCES `khoa` (`MAKHOA`),
  CONSTRAINT `FK_LOPTINCHI_MONHOC` FOREIGN KEY (`MAMH`) REFERENCES `monhoc` (`MAMH`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loptinchi`
--

LOCK TABLES `loptinchi` WRITE;
/*!40000 ALTER TABLE `loptinchi` DISABLE KEYS */;
INSERT INTO `loptinchi` VALUES (1,'2023-2024',1,'CS101','GV001','CNTT',30,0,'2023-09-01 08:00:00','2023-12-15 10:00:00'),(2,'2023-2024',1,'QT301','GV002','QTKD',30,0,'2023-09-01 08:00:00','2023-12-15 10:00:00'),(3,'2023-2024',1,'KT201','GV003','KT',30,0,'2023-09-01 08:00:00','2023-12-15 10:00:00');
/*!40000 ALTER TABLE `loptinchi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monhoc`
--

DROP TABLE IF EXISTS `monhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monhoc` (
  `MAMH` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `TENMH` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `SOTC` int(11) NOT NULL,
  `SOTIET_TH` int(11) NOT NULL,
  `SOTIET_LT` int(11) NOT NULL,
  PRIMARY KEY (`MAMH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhoc`
--

LOCK TABLES `monhoc` WRITE;
/*!40000 ALTER TABLE `monhoc` DISABLE KEYS */;
INSERT INTO `monhoc` VALUES ('CS101','Cơ sở lập trình',3,30,15),('KT201','Kinh tế vĩ mô',3,30,15),('QT301','Quản trị chiến lược',3,30,15);
/*!40000 ALTER TABLE `monhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT '1',
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `status_id` (`status_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `team_members` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Project Metro','Increase productivity',3,1),(2,'Project Ivory','Reduce project time and cost',3,2),(3,'Project Apollo','Improve communication between teams',4,3),(14,'New Project',NULL,2,9);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinhvien`
--

DROP TABLE IF EXISTS `sinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinhvien` (
  `MASV` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `hoten` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GIOITINH` tinyint(1) NOT NULL DEFAULT '0',
  `diachi` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NGAYSINH` date DEFAULT NULL,
  `malop` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DANGHIHOC` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cccd` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `chuyennganh` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_role` int(11) DEFAULT '2',
  PRIMARY KEY (`MASV`),
  KEY `FK_SINHVIEN_LOP` (`malop`),
  KEY `FK_SINHVIEN_ROLE` (`id_role`),
  CONSTRAINT `FK_SINHVIEN_LOP` FOREIGN KEY (`malop`) REFERENCES `lop` (`MALOP`),
  CONSTRAINT `FK_SINHVIEN_ROLE` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinhvien`
--

LOCK TABLES `sinhvien` WRITE;
/*!40000 ALTER TABLE `sinhvien` DISABLE KEYS */;
INSERT INTO `sinhvien` VALUES ('ADMIN','ADMIN',0,NULL,NULL,NULL,0,'ADMIN',NULL,NULL,1),('SV001','Nguyễn Văn D',0,'Hà Nội','2002-01-01','CNTT1',0,'SV001','123456789012','Công nghệ thông tin',2),('SV002','Trần Thị E',1,'Hà Nội','2002-02-01','QTKD1',0,'SV002','987654321012','Quản trị kinh doanh',2),('SV003','Lê Văn F',0,'Hà Nội','2002-03-01','KT1',0,'SV003','456789012345','Kinh tế',2);
/*!40000 ALTER TABLE `sinhvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'To Do'),(2,'In Progress'),(3,'To Validate'),(4,'Done');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_members`
--

DROP TABLE IF EXISTS `team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_members` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_members`
--

LOCK TABLES `team_members` WRITE;
/*!40000 ALTER TABLE `team_members` DISABLE KEYS */;
INSERT INTO `team_members` VALUES (1,'John','Thompson','j.thompson@spring.com'),(2,'Mary','Johnson','m.johnson@spring.com'),(3,'Judy','Gordon','j.gordon@spring.com'),(4,'Frank','Williams','f.williams@spring.com'),(6,'Công Lý','Bùi','nb'),(7,NULL,NULL,NULL),(8,NULL,NULL,NULL),(9,NULL,NULL,NULL);
/*!40000 ALTER TABLE `team_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Task'),(2,'Study'),(3,'Support'),(4,'Bug');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-08 12:48:12
