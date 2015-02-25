-- MySQL dump 10.12
--
-- Host: localhost    Database: btrs
-- ------------------------------------------------------
-- Server version	6.0.2-alpha-community-nt-debug

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
-- Table structure for table `admin`
--

create database btrs;
use btrs;

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'ankit.wasankar@gmail.com','group4@btrs','2014-11-26 06:33:36');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `BookingId` varchar(20) NOT NULL,
  `userid` varchar(128) DEFAULT NULL,
  `BusId` varchar(20) DEFAULT NULL,
  `DepartureDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DepartureTime` time DEFAULT NULL,
  PRIMARY KEY (`BookingId`),
  KEY `UserId` (`userid`),
  KEY `BusId` (`BusId`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`BusId`) REFERENCES `bus` (`BusId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES ('booking1','user1','bus1','2014-11-29 18:30:00','19:00:00'),('booking2','user1','bus1','2014-11-29 18:30:00','19:00:00'),('booking3','user1','bus4','2014-12-04 18:30:00','04:45:00');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `beforeBookingDelete` BEFORE DELETE ON `booking` FOR EACH ROW insert into bookinghistory values(old.bookingid,old.userid,old.busid,old.departuredate,old.departuretime) */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;

--
-- Table structure for table `bookinghistory`
--

DROP TABLE IF EXISTS `bookinghistory`;
CREATE TABLE `bookinghistory` (
  `bookinghistoryid` varchar(128) DEFAULT NULL,
  `UserHistoryId` varchar(20) DEFAULT NULL,
  `BusId` varchar(20) DEFAULT NULL,
  `DepartureDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DepartureTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookinghistory`
--

LOCK TABLES `bookinghistory` WRITE;
/*!40000 ALTER TABLE `bookinghistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookinghistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
CREATE TABLE `bus` (
  `BusId` varchar(20) NOT NULL,
  `BusName` varchar(128) DEFAULT NULL,
  `BusType` varchar(128) DEFAULT NULL,
  `DepartureTime` time DEFAULT NULL,
  `TravelTime` time DEFAULT NULL,
  `DepartureCity` varchar(128) DEFAULT NULL,
  `ArrivalCity` varchar(128) DEFAULT NULL,
  `cost` double NOT NULL,
  `OperatorId` varchar(20) DEFAULT NULL,
  `TotalSeats` int(3) DEFAULT NULL,
  PRIMARY KEY (`BusId`),
  KEY `OperatorId` (`OperatorId`),
  CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`OperatorId`) REFERENCES `busoperator` (`OperatorId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES ('bus1','SVR Travels','AC-Semi-Sleeper','12:00:00','19:00:00','Chennai','Pune',2100,'busoperator1',44),('bus2','Neeta Travels','Non-AC-Semi-Sleeper','18:00:00','08:00:00','Ahmedabad','Bangalore',1300,'busoperator1',56),('bus3','Long Road Travels','Non-AC-Non-Sleeper','06:00:00','16:15:00','Chennai','Coimbatore',650,'busoperator2',56),('bus4','KingFisher','AC-Sleeper','21:00:00','04:45:00','Delhi','Hyderabad',2600,'busoperator2',38);
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busfrequency`
--

DROP TABLE IF EXISTS `busfrequency`;
CREATE TABLE `busfrequency` (
  `FrequencyId` varchar(20) NOT NULL,
  `BusId` varchar(20) DEFAULT NULL,
  `FrequencyDays` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`FrequencyId`),
  KEY `BusId` (`BusId`),
  CONSTRAINT `busfrequency_ibfk_1` FOREIGN KEY (`BusId`) REFERENCES `bus` (`BusId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `busfrequency`
--

LOCK TABLES `busfrequency` WRITE;
/*!40000 ALTER TABLE `busfrequency` DISABLE KEYS */;
INSERT INTO `busfrequency` VALUES ('busfrequency1','bus1','Sunday'),('busfrequency10','bus2','Tuesday'),('busfrequency11','bus2','Wednesday'),('busfrequency12','bus2','Tuesday'),('busfrequency13','bus2','Friday'),('busfrequency14','bus2','Sunday'),('busfrequency15','bus3','Sunday'),('busfrequency16','bus3','Tuesday'),('busfrequency17','bus3','Wednesday'),('busfrequency18','bus3','Friday'),('busfrequency19','bus3','Sunday'),('busfrequency2','bus1','Monday'),('busfrequency20','bus4','Tuesday'),('busfrequency21','bus4','Friday'),('busfrequency3','bus1','Tuesday'),('busfrequency4','bus1','Wednesday'),('busfrequency5','bus1','Tuesday'),('busfrequency6','bus1','Friday'),('busfrequency7','bus1','Sunday'),('busfrequency8','bus2','Sunday'),('busfrequency9','bus2','Monday');
/*!40000 ALTER TABLE `busfrequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busoperator`
--

DROP TABLE IF EXISTS `busoperator`;
CREATE TABLE `busoperator` (
  `OperatorId` varchar(20) NOT NULL,
  `OperatorName` varchar(128) DEFAULT NULL,
  `Address` varchar(128) DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `City` varchar(128) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`OperatorId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `busoperator`
--

LOCK TABLES `busoperator` WRITE;
/*!40000 ALTER TABLE `busoperator` DISABLE KEYS */;
INSERT INTO `busoperator` VALUES ('busoperator1','Inayath','Avoor','inayathbe@gmail.com','Chennai','908978675','asdasd'),('busoperator2','ashraf','thenkasi','ashraf@gmail.com','tamilnadu','9182736451','zxczxc'),('busoperator3','akshita','kota','akshita@gmail.com','rajasthan','8562256252','gupta123'),('busoperator4','subramanian','chennai','kumar@gmail.com','tamilnadu','7644112324','kumarsubbu');
/*!40000 ALTER TABLE `busoperator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operatorhistory`
--

DROP TABLE IF EXISTS `operatorhistory`;
CREATE TABLE `operatorhistory` (
  `OperatorId` varchar(20) NOT NULL,
  `OperatorName` varchar(128) DEFAULT NULL,
  `Address` varchar(128) DEFAULT NULL,
  `EMail` varchar(128) DEFAULT NULL,
  `City` varchar(128) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `ArchivedYear` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`OperatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operatorhistory`
--

LOCK TABLES `operatorhistory` WRITE;
/*!40000 ALTER TABLE `operatorhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `operatorhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `PaymentId` varchar(20) NOT NULL,
  `BookingId` varchar(20) DEFAULT NULL,
  `TotalAmount` int(6) DEFAULT NULL,
  `PaymentDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `OperatorId` varchar(20) DEFAULT NULL,
  `TotalSeats` int(3) DEFAULT NULL,
  `Status` varchar(10) DEFAULT 'NOT PAID',
  PRIMARY KEY (`PaymentId`),
  KEY `BookingId` (`BookingId`),
  KEY `OperatorId` (`OperatorId`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BookingId`) REFERENCES `booking` (`BookingId`) ON DELETE CASCADE,
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`OperatorId`) REFERENCES `busoperator` (`OperatorId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('payment1','booking1',8400,'2014-11-26 09:48:55','busoperator1',4,'NOT PAID'),('payment2','booking2',4200,'2014-11-26 09:49:14','busoperator1',2,'NOT PAID'),('payment3','booking3',2600,'2014-11-26 09:50:10','busoperator2',1,'NOT PAID');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seatallocation`
--

DROP TABLE IF EXISTS `seatallocation`;
CREATE TABLE `seatallocation` (
  `SeatId` varchar(20) NOT NULL,
  `BookingId` varchar(20) DEFAULT NULL,
  `SeatType` varchar(10) DEFAULT NULL,
  `BusId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SeatId`),
  KEY `BusId` (`BusId`),
  KEY `BookingId` (`BookingId`),
  CONSTRAINT `seatallocation_ibfk_1` FOREIGN KEY (`BusId`) REFERENCES `bus` (`BusId`) ON DELETE CASCADE,
  CONSTRAINT `seatallocation_ibfk_2` FOREIGN KEY (`BookingId`) REFERENCES `booking` (`BookingId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seatallocation`
--

LOCK TABLES `seatallocation` WRITE;
/*!40000 ALTER TABLE `seatallocation` DISABLE KEYS */;
INSERT INTO `seatallocation` VALUES ('seatallocation1','booking1',NULL,'bus1'),('seatallocation2','booking1',NULL,'bus1'),('seatallocation3','booking1',NULL,'bus1'),('seatallocation4','booking1',NULL,'bus1'),('seatallocation5','booking2',NULL,'bus1'),('seatallocation6','booking2',NULL,'bus1'),('seatallocation7','booking3',NULL,'bus4');
/*!40000 ALTER TABLE `seatallocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(128) NOT NULL DEFAULT '',
  `FirstName` varchar(64) DEFAULT NULL,
  `LastName` varchar(64) DEFAULT NULL,
  `Address` varchar(128) DEFAULT NULL,
  `City` varchar(128) DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `PhoneNumber` varchar(50) DEFAULT NULL,
  `Password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('user1','ankit','wasankar','hinjewadi','pune','ankit@gmail.com','9021154414','12345'),('user2','munaf','basha','avur','tvmalai','hidayathmca@gmail.com','9158817142','asdasd'),('user3','mona','ramesh','chennai','chennai','monaramesh@gmail.com','9090909090','zxczxc'),('user4','muzamil','basha','karur','tamilnadu','mujju@gmail.com','9243456743','mujju'),('user5','nila','suriya','neyveli','tamilnad','nilas@gmail.com','7876571234','nilzpaapa'),('user6','sivakumar','madhumitha','chennai','tamilnadu','madhu@gmail.com','8989786786','madhuama');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `beforeUserDelete` BEFORE DELETE ON `user` FOR EACH ROW insert into userhistory values(old.userid,old.firstname,
old.lastname,old.address,old.city,old.email,old.phonenumber,default) */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;

--
-- Table structure for table `userhistory`
--

DROP TABLE IF EXISTS `userhistory`;
CREATE TABLE `userhistory` (
  `UserHistoryId` varchar(128) DEFAULT NULL,
  `FirstName` varchar(64) DEFAULT NULL,
  `LastName` varchar(64) DEFAULT NULL,
  `Address` varchar(128) DEFAULT NULL,
  `City` varchar(128) DEFAULT NULL,
  `EMail` varchar(128) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `ArchivedYear` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userhistory`
--

LOCK TABLES `userhistory` WRITE;
/*!40000 ALTER TABLE `userhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `userhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-26 10:10:52
