CREATE DATABASE  IF NOT EXISTS `NBAD3NEW` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `NBAD3NEW`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: nbad3new
-- ------------------------------------------------------
-- Server version	5.6.27-enterprise-commercial-advanced-log

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

CREATE TABLE `answer` (
  `answerID` int(11) NOT NULL,
  `StudyID` varchar(40) NOT NULL DEFAULT '',
  `QuestionID` varchar(40) NOT NULL DEFAULT '',
  `UserName` varchar(40) NOT NULL DEFAULT '',
  `Choice` varchar(40) DEFAULT NULL,
  `DateSubmitted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`answerID`, `StudyID`, `QuestionID`, `UserName`, `Choice`, `DateSubmitted`) VALUES
(1, '100', '1000', 'revanth465@gmail.com', '3', '2016-04-01 20:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `QuestionID` varchar(40) NOT NULL DEFAULT '',
  `StudyID` varchar(40) DEFAULT NULL,
  `Question` varchar(50) DEFAULT NULL,
  `AnswerType` varchar(10) DEFAULT NULL,
  `Option1` varchar(40) DEFAULT NULL,
  `Option2` varchar(40) DEFAULT NULL,
  `Option3` varchar(40) DEFAULT NULL,
  `Option4` varchar(40) DEFAULT NULL,
  `Option5` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`QuestionID`, `StudyID`, `Question`, `AnswerType`, `Option1`, `Option2`, `Option3`, `Option4`, `Option5`) VALUES
('1000', '100', 'Computers are useful', 'choice', '1', '2', '3', '4', '5'),
('1001', '101', 'Environment should be protected', 'choice', '1', '2', '3', '4', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reported`
--

CREATE TABLE `reported` (
  `reportID` int(11) NOT NULL,
  `QuestionID` varchar(255) NOT NULL,
  `StudyID` varchar(40) NOT NULL DEFAULT '',
  `Date` datetime DEFAULT NULL,
  `Question` varchar(50) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `NumParticipants` int(15) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reported`
--

INSERT INTO `reported` (`reportID`, `QuestionID`, `StudyID`, `Date`, `Question`, `Username`, `NumParticipants`, `Status`) VALUES
(1, '1000', '101', '2016-04-01 19:15:32', 'Computers are useful', 'revanth465@gmail.com', 0, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `study`
--

CREATE TABLE `study` (
  `StudyID` varchar(40) NOT NULL DEFAULT '',
  `StudyName` varchar(40) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `ImageURL` varchar(50) DEFAULT NULL,
  `ReqParticipants` int(15) DEFAULT NULL,
  `ActParticipants` int(15) DEFAULT NULL,
  `SStatus` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `study`
--

INSERT INTO `study` (`StudyID`, `StudyName`, `Description`, `Username`, `DateCreated`, `ImageURL`, `ReqParticipants`, `ActParticipants`, `SStatus`) VALUES
('100', 'Technology', 'Related to Computers', 'revanth465@gmail.com', '2016-04-01 19:14:57', 'images/computer.jpg', 1, 1, 'start'),
('101', 'Enivironment', 'Related to Environment', 'revanth465@gmail.com', '2016-04-01 19:14:57', 'images/small_tree.jpg', 3, 0, 'start');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Username` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(255) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Studies` int(15) DEFAULT NULL,
  `Participation` int(15) DEFAULT NULL,
  `Coins` int(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Username`, `Password`, `Type`, `Studies`, `Participation`, `Coins`, `name`) VALUES
('kartikeya@gmail.com', '12345', 'Admin', 0, 0, 0, 'kartikeya mehta'),
('revanth465@gmail.com', '1234', 'Participant', 0, 0, 0, 'revanth malay');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`answerID`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`QuestionID`),
  ADD KEY `StudyID` (`StudyID`);

--
-- Indexes for table `reported`
--
ALTER TABLE `reported`
  ADD PRIMARY KEY (`reportID`),
  ADD KEY `QuestionID` (`QuestionID`),
  ADD KEY `reported_ibfk_2` (`StudyID`);

--
-- Indexes for table `study`
--
ALTER TABLE `study`
  ADD PRIMARY KEY (`StudyID`),
  ADD KEY `Username` (`Username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `answerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reported`
--
ALTER TABLE `reported`
  MODIFY `reportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`StudyID`) REFERENCES `study` (`StudyID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reported`
--
ALTER TABLE `reported`
  ADD CONSTRAINT `reported_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reported_ibfk_2` FOREIGN KEY (`StudyID`) REFERENCES `study` (`StudyID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `study`
--
ALTER TABLE `study`
  ADD CONSTRAINT `study_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
