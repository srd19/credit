-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 25, 2014 at 04:52 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `creditcardfrauddetectiondb`
--
CREATE DATABASE IF NOT EXISTS `creditcardfrauddetectiondb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `creditcardfrauddetectiondb`;

-- --------------------------------------------------------

--
-- Table structure for table `customerdetails`
--

DROP TABLE IF EXISTS `customerdetails`;
CREATE TABLE IF NOT EXISTS `customerdetails` (
  `SrNo` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `ContactNo` varchar(255) NOT NULL,
  `DOB` varchar(255) NOT NULL,
  `EmailID` varchar(255) NOT NULL,
  `SecurityAnswer1` varchar(255) NOT NULL,
  `SecurityAnswer2` varchar(255) NOT NULL,
  `CreditCardNo1` int(11) NOT NULL,
  `CreditCardNo2` int(11) NOT NULL,
  `CreditCardNo3` int(11) NOT NULL,
  `CreditCardNo4` int(11) NOT NULL,
  `CCVNo` int(11) NOT NULL,
  `CardHolderName` varchar(255) NOT NULL,
  `ExpiryMonth` int(11) NOT NULL,
  `ExpiryYear` int(11) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `customerdetails`
--

INSERT INTO `customerdetails` (`SrNo`, `UserID`, `Password`, `UserName`, `Address`, `ContactNo`, `DOB`, `EmailID`, `SecurityAnswer1`, `SecurityAnswer2`, `CreditCardNo1`, `CreditCardNo2`, `CreditCardNo3`, `CreditCardNo4`, `CCVNo`, `CardHolderName`, `ExpiryMonth`, `ExpiryYear`) VALUES
(5, 'qqq', 'qqq', 'qqq', 'qqq', '1111111111', '01-JAN-2014', 'chinmay.asd@gmail.com', 'qqq', 'qqq', 1111, 1111, 1111, 1111, 111, 'qqq', 1, 2013);

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
CREATE TABLE IF NOT EXISTS `data` (
  `hmm` varchar(255) NOT NULL,
  `buildhmm` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kmeans`
--

DROP TABLE IF EXISTS `kmeans`;
CREATE TABLE IF NOT EXISTS `kmeans` (
  `UserID` varchar(255) NOT NULL,
  `SrNo` int(11) NOT NULL AUTO_INCREMENT,
  `LowMean` int(11) NOT NULL,
  `MediumMean` int(11) NOT NULL,
  `HighMean` int(11) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `kmeans`
--

INSERT INTO `kmeans` (`UserID`, `SrNo`, `LowMean`, `MediumMean`, `HighMean`) VALUES
('qqq', 20, 183, 425, 760);

-- --------------------------------------------------------

--
-- Table structure for table `mailinfo`
--

DROP TABLE IF EXISTS `mailinfo`;
CREATE TABLE IF NOT EXISTS `mailinfo` (
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mailinfo`
--

INSERT INTO `mailinfo` (`UserName`, `Password`) VALUES
('mailtesthmm100@gmail.com', 'mailtesthmm900');

-- --------------------------------------------------------

--
-- Table structure for table `observationsequence`
--

DROP TABLE IF EXISTS `observationsequence`;
CREATE TABLE IF NOT EXISTS `observationsequence` (
  `SrNo` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(255) NOT NULL,
  `OS1` varchar(25) NOT NULL,
  `OS2` varchar(25) NOT NULL,
  `OS3` varchar(25) NOT NULL,
  `OS4` varchar(25) NOT NULL,
  `OS5` varchar(25) NOT NULL,
  `OS6` varchar(25) NOT NULL,
  `OS7` varchar(25) NOT NULL,
  `OS8` varchar(25) NOT NULL,
  `OS9` varchar(25) NOT NULL,
  `OS10` varchar(25) NOT NULL,
  `OS11` varchar(25) NOT NULL,
  `OS12` varchar(25) NOT NULL,
  `OS13` varchar(25) NOT NULL,
  `OS14` varchar(25) NOT NULL,
  `OS15` varchar(25) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `observationsequence`
--

INSERT INTO `observationsequence` (`SrNo`, `UserID`, `OS1`, `OS2`, `OS3`, `OS4`, `OS5`, `OS6`, `OS7`, `OS8`, `OS9`, `OS10`, `OS11`, `OS12`, `OS13`, `OS14`, `OS15`) VALUES
(20, 'qqq', 'l', 'm', 'm', 'l', 'h', 'l', 'l', 'h', 'm', 'l', 'h', 'l', 'l', 'l', 'h');

-- --------------------------------------------------------

--
-- Table structure for table `productdetails`
--

DROP TABLE IF EXISTS `productdetails`;
CREATE TABLE IF NOT EXISTS `productdetails` (
  `SrNo` int(11) NOT NULL AUTO_INCREMENT,
  `ProdutcID` int(11) NOT NULL,
  `Price` varchar(255) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `productdetails`
--

INSERT INTO `productdetails` (`SrNo`, `ProdutcID`, `Price`) VALUES
(1, 1, '200'),
(2, 2, '250'),
(3, 3, '550'),
(4, 4, '1850'),
(5, 5, '550'),
(6, 6, '650'),
(7, 7, '400'),
(8, 8, '600'),
(9, 9, '1000');

-- --------------------------------------------------------

--
-- Table structure for table `purchasedetails`
--

DROP TABLE IF EXISTS `purchasedetails`;
CREATE TABLE IF NOT EXISTS `purchasedetails` (
  `SrNo` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(255) NOT NULL,
  `Produtc1ID` varchar(255) NOT NULL,
  `Price1` varchar(255) NOT NULL,
  `Image1` varchar(255) NOT NULL,
  `Produtc2ID` varchar(255) NOT NULL,
  `Price2` varchar(255) NOT NULL,
  `Image2` varchar(255) NOT NULL,
  `Produtc3ID` varchar(255) NOT NULL,
  `Price3` varchar(255) NOT NULL,
  `Image3` varchar(255) NOT NULL,
  `TransactionNo` varchar(255) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `purchasedetails`
--

INSERT INTO `purchasedetails` (`SrNo`, `UserID`, `Produtc1ID`, `Price1`, `Image1`, `Produtc2ID`, `Price2`, `Image2`, `Produtc3ID`, `Price3`, `Image3`, `TransactionNo`) VALUES
(5, 'www', '4', '1850', 'ring.png', '', '', '', '', '', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `transactionamount`
--

DROP TABLE IF EXISTS `transactionamount`;
CREATE TABLE IF NOT EXISTS `transactionamount` (
  `SrNo` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(255) NOT NULL,
  `Amount1` int(11) NOT NULL,
  `Amount2` int(11) NOT NULL,
  `Amount3` int(11) NOT NULL,
  `Amount4` int(11) NOT NULL,
  `Amount5` int(11) NOT NULL,
  `Amount6` int(11) NOT NULL,
  `Amount7` int(11) NOT NULL,
  `Amount8` int(11) NOT NULL,
  `Amount9` int(11) NOT NULL,
  `Amount10` int(11) NOT NULL,
  `Amount11` int(11) NOT NULL,
  `Amount12` int(11) NOT NULL,
  `Amount13` int(11) NOT NULL,
  `Amount14` int(11) NOT NULL,
  `Amount15` int(11) NOT NULL,
  `countno` int(11) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `transactionamount`
--

INSERT INTO `transactionamount` (`SrNo`, `UserID`, `Amount1`, `Amount2`, `Amount3`, `Amount4`, `Amount5`, `Amount6`, `Amount7`, `Amount8`, `Amount9`, `Amount10`, `Amount11`, `Amount12`, `Amount13`, `Amount14`, `Amount15`, `countno`) VALUES
(6, 'qqq', 800, 250, 400, 800, 450, 900, 200, 500, 950, 400, 200, 500, 250, 550, 650, 15);

-- --------------------------------------------------------

--
-- Table structure for table `verificationcode`
--

DROP TABLE IF EXISTS `verificationcode`;
CREATE TABLE IF NOT EXISTS `verificationcode` (
  `SrNo` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `verificationcode`
--

INSERT INTO `verificationcode` (`SrNo`, `code`) VALUES
(1, '3gbh7');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
