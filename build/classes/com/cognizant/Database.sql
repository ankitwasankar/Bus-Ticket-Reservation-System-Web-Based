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



drop database btrs;
create database btrs;
use btrs;



--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `BookingId` varchar(20) NOT NULL,
  `UserId` varchar(20) DEFAULT NULL,
  `BusId` varchar(20) DEFAULT NULL,
  `DepartureDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DepartureTime` time DEFAULT NULL,
  PRIMARY KEY (`BookingId`),
  KEY `UserId` (`UserId`),
  KEY `BusId` (`BusId`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`BusId`) REFERENCES `bus` (`BusId`) on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookinghistory`
--

DROP TABLE IF EXISTS `bookinghistory`;
CREATE TABLE `bookinghistory` (
  `BookingHistoryId` varchar(20) NOT NULL,
  `UserHistoryId` varchar(20) DEFAULT NULL,
  `BusId` varchar(20) DEFAULT NULL,
  `DepartureDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DepartureTime` time not null
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
  CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`OperatorId`) REFERENCES `busoperator` (`OperatorId`) on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES ('bus1','SRM','AC-Sleeper','05:00:00','10:00:00','PUNE','CHENNAI',500,'O1',10);
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
  CONSTRAINT `busfrequency_ibfk_1` FOREIGN KEY (`BusId`) REFERENCES `bus` (`BusId`) on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `busfrequency`
--

LOCK TABLES `busfrequency` WRITE;
/*!40000 ALTER TABLE `busfrequency` DISABLE KEYS */;
INSERT INTO `busfrequency` VALUES ('busfrequency1','bus1','Sunday');
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
  `EMail` varchar(128) DEFAULT NULL,
  `City` varchar(128) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`OperatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `busoperator`
--

LOCK TABLES `busoperator` WRITE;
/*!40000 ALTER TABLE `busoperator` DISABLE KEYS */;
INSERT INTO `busoperator` VALUES ('O1','SRM','Chennai','a@gmail.com','Chennai',99,'srm');
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
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BookingId`) REFERENCES `booking` (`BookingId`) on delete cascade,
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`OperatorId`) REFERENCES `busoperator` (`OperatorId`) on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
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
  CONSTRAINT `seatallocation_ibfk_1` FOREIGN KEY (`BusId`) REFERENCES `bus` (`BusId`) on delete cascade,
  CONSTRAINT `seatallocation_ibfk_2` FOREIGN KEY (`BookingId`) REFERENCES `booking` (`BookingId`) on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seatallocation`
--

LOCK TABLES `seatallocation` WRITE;
/*!40000 ALTER TABLE `seatallocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `seatallocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserId` varchar(20) NOT NULL,
  `FirstName` varchar(64) DEFAULT NULL,
  `LastName` varchar(64) DEFAULT NULL,
  `Address` varchar(128) DEFAULT NULL,
  `City` varchar(128) DEFAULT NULL,
  `EMail` varchar(128) DEFAULT NULL,
  `PhoneNumber` varchar(50) DEFAULT NULL,
  `Password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('sdf','segf','segf','esf','segf','qeq',5678568,'sdgs');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userhistory`
--

DROP TABLE IF EXISTS `userhistory`;
CREATE TABLE `userhistory` (
  `UserHistoryId` varchar(20) NOT NULL,
  `FirstName` varchar(64) DEFAULT NULL,
  `LastName` varchar(64) DEFAULT NULL,
  `Address` varchar(128) DEFAULT NULL,
  `City` varchar(128) DEFAULT NULL,
  `EMail` varchar(128) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `ArchivedYear` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

create trigger beforeUserDelete before delete on user for each row insert into userhistory values(old.userid,old.firstname,
old.lastname,old.address,old.city,old.email,old.phonenumber,default);

create trigger beforeBookingDelete before delete on booking for each row insert into bookinghistory values(old.bookingid,old.userid,old.busid,old.departuredate,old.departuretime);


delete from user;
delete from userhistory;
delete from booking;
delete from bookinghistory;
delete from payment;
delete from bus;
delete from busfrequency;
delete from busoperator;
delete from  seatallocation;

insert into user values("user1","ankit","wasankar","hinjewadi","pune","ankit@gmail.com","9021154414","12345");
insert into booking values("booking1","ankit@gmail.com","bus1","2015-09-15","20:10");

use btrs;

create table admin (id int auto_increment primary key,userid varchar(40) not null,password varchar(40) not null,date timestamp);

 insert into admin values(default,"administrator","group4@btrs",default);

alter table busoperator modify email varchar(128) unique not null;

alter table user modify email varchar(128) unique not null;

alter table user modify userid varchar(128);

alter table booking modify userid varchar(128); 

alter table userhistory modify UserHistoryId varchar(128);

alter table bookinghistory modify bookinghistoryid varchar(128);

update admin set userid = 'ankit.wasankar@gmail.com';

 use btrs;