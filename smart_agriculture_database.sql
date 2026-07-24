-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2026 at 10:45 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartirrigationsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `crop`
--

CREATE TABLE `crop` (
  `CropID` int(11) NOT NULL,
  `CropName` varchar(100) DEFAULT NULL,
  `CropType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crop`
--

INSERT INTO `crop` (`CropID`, `CropName`, `CropType`) VALUES
(1, 'Wheat', 'Grain'),
(2, 'Tomato', 'Vegetable'),
(3, 'Date Palm', 'Fruit');

-- --------------------------------------------------------

--
-- Table structure for table `croprecord`
--

CREATE TABLE `croprecord` (
  `RecordID` int(11) NOT NULL,
  `FieldID` int(11) DEFAULT NULL,
  `CropID` int(11) DEFAULT NULL,
  `PlantingDate` date DEFAULT NULL,
  `HarvestDate` date DEFAULT NULL,
  `QuantityHarvested` float DEFAULT NULL,
  `EnvironmentalConditions` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `croprecord`
--

INSERT INTO `croprecord` (`RecordID`, `FieldID`, `CropID`, `PlantingDate`, `HarvestDate`, `QuantityHarvested`, `EnvironmentalConditions`) VALUES
(1, 1, 1, '2025-01-10', '2025-06-15', 500, 'Sunny, Low Wind'),
(2, 2, 2, '2025-02-01', '2025-05-20', 300, 'Humid, Warm');

-- --------------------------------------------------------

--
-- Table structure for table `farm`
--

CREATE TABLE `farm` (
  `FarmID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Area` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `farm`
--

INSERT INTO `farm` (`FarmID`, `Name`, `Area`) VALUES
(1, 'Al-Noor Farm', 150.5),
(2, 'Al-Salam Farm', 200);

-- --------------------------------------------------------

--
-- Table structure for table `farmer`
--

CREATE TABLE `farmer` (
  `FarmerID` int(11) NOT NULL,
  `Fname` varchar(50) DEFAULT NULL,
  `MinitID` char(1) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `farmer`
--

INSERT INTO `farmer` (`FarmerID`, `Fname`, `MinitID`, `Lname`, `Bdate`, `Address`, `PhoneNumber`) VALUES
(1, 'Ahmed', 'M', 'Al-Zahrani', '1985-03-15', 'Jazan', '0501234567'),
(2, 'Sara', 'A', 'Al-Ghamdi', '1990-07-22', 'Riyadh', '0557654321');

-- --------------------------------------------------------

--
-- Table structure for table `farmerscommunity`
--

CREATE TABLE `farmerscommunity` (
  `CommunityID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `MemberCount` int(11) DEFAULT NULL,
  `EstablishmentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field`
--

CREATE TABLE `field` (
  `FieldID` int(11) NOT NULL,
  `FarmID` int(11) DEFAULT NULL,
  `Area` float DEFAULT NULL,
  `SoilType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field`
--

INSERT INTO `field` (`FieldID`, `FarmID`, `Area`, `SoilType`) VALUES
(1, 1, 50, 'Clay'),
(2, 1, 75, 'Sandy'),
(3, 2, 100, 'Loamy');

-- --------------------------------------------------------

--
-- Table structure for table `plantedin`
--

CREATE TABLE `plantedin` (
  `FieldID` int(11) NOT NULL,
  `CropID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plantedin`
--

INSERT INTO `plantedin` (`FieldID`, `CropID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

CREATE TABLE `sensor` (
  `SensorID` int(11) NOT NULL,
  `SensorType` varchar(50) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `FieldID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sensor`
--

INSERT INTO `sensor` (`SensorID`, `SensorType`, `Location`, `FieldID`) VALUES
(1, 'Moisture', 'Field-1 North', 1),
(2, 'Temperature', 'Field-2 South', 2),
(3, 'Humidity', 'Field-3 East', 3);

-- --------------------------------------------------------

--
-- Table structure for table `smartirrigation`
--

CREATE TABLE `smartirrigation` (
  `IrrigationID` int(11) NOT NULL,
  `IrrigationType` varchar(50) DEFAULT NULL,
  `SensorID` int(11) DEFAULT NULL,
  `IrrigationDateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smartirrigation`
--

INSERT INTO `smartirrigation` (`IrrigationID`, `IrrigationType`, `SensorID`, `IrrigationDateTime`) VALUES
(1, 'Drip', 1, '2025-04-01 08:00:00'),
(2, 'Sprinkler', 2, '2025-04-02 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL,
  `Fname` varchar(50) DEFAULT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `EmailAddress` varchar(100) DEFAULT NULL,
  `ProductType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `Fname`, `Minit`, `Lname`, `PhoneNumber`, `EmailAddress`, `ProductType`) VALUES
(1, 'Khalid', 'S', 'Al-Otaibi', '0509876543', 'supplier@email.com', 'Seeds'),
(2, 'Mona', 'R', 'Al-Shehri', '0551234567', 'mona@email.com', 'Fertilizer');

-- --------------------------------------------------------

--
-- Table structure for table `weather`
--

CREATE TABLE `weather` (
  `WeatherID` int(11) NOT NULL,
  `Temperature` float DEFAULT NULL,
  `Humidity` float DEFAULT NULL,
  `WeatherCondition` varchar(100) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `FarmID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `weather`
--

INSERT INTO `weather` (`WeatherID`, `Temperature`, `Humidity`, `WeatherCondition`, `Date`, `Location`, `FarmID`) VALUES
(1, 38.5, 60, 'Sunny', '2025-04-01', 'Jazan', 1),
(2, 35, 75, 'Cloudy', '2025-04-02', 'Jazan', 2);

-- --------------------------------------------------------

--
-- Table structure for table `workswith`
--

CREATE TABLE `workswith` (
  `FarmerID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workswith`
--

INSERT INTO `workswith` (`FarmerID`, `SupplierID`) VALUES
(1, 1),
(2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crop`
--
ALTER TABLE `crop`
  ADD PRIMARY KEY (`CropID`);

--
-- Indexes for table `croprecord`
--
ALTER TABLE `croprecord`
  ADD PRIMARY KEY (`RecordID`),
  ADD KEY `FieldID` (`FieldID`),
  ADD KEY `CropID` (`CropID`);

--
-- Indexes for table `farm`
--
ALTER TABLE `farm`
  ADD PRIMARY KEY (`FarmID`);

--
-- Indexes for table `farmer`
--
ALTER TABLE `farmer`
  ADD PRIMARY KEY (`FarmerID`);

--
-- Indexes for table `farmerscommunity`
--
ALTER TABLE `farmerscommunity`
  ADD PRIMARY KEY (`CommunityID`);

--
-- Indexes for table `field`
--
ALTER TABLE `field`
  ADD PRIMARY KEY (`FieldID`),
  ADD KEY `FarmID` (`FarmID`);

--
-- Indexes for table `plantedin`
--
ALTER TABLE `plantedin`
  ADD PRIMARY KEY (`FieldID`,`CropID`),
  ADD KEY `CropID` (`CropID`);

--
-- Indexes for table `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`SensorID`),
  ADD KEY `FieldID` (`FieldID`);

--
-- Indexes for table `smartirrigation`
--
ALTER TABLE `smartirrigation`
  ADD PRIMARY KEY (`IrrigationID`),
  ADD KEY `SensorID` (`SensorID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`WeatherID`),
  ADD KEY `FarmID` (`FarmID`);

--
-- Indexes for table `workswith`
--
ALTER TABLE `workswith`
  ADD PRIMARY KEY (`FarmerID`,`SupplierID`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `croprecord`
--
ALTER TABLE `croprecord`
  ADD CONSTRAINT `croprecord_ibfk_1` FOREIGN KEY (`FieldID`) REFERENCES `field` (`FieldID`),
  ADD CONSTRAINT `croprecord_ibfk_2` FOREIGN KEY (`CropID`) REFERENCES `crop` (`CropID`);

--
-- Constraints for table `field`
--
ALTER TABLE `field`
  ADD CONSTRAINT `field_ibfk_1` FOREIGN KEY (`FarmID`) REFERENCES `farm` (`FarmID`);

--
-- Constraints for table `plantedin`
--
ALTER TABLE `plantedin`
  ADD CONSTRAINT `plantedin_ibfk_1` FOREIGN KEY (`FieldID`) REFERENCES `field` (`FieldID`),
  ADD CONSTRAINT `plantedin_ibfk_2` FOREIGN KEY (`CropID`) REFERENCES `crop` (`CropID`);

--
-- Constraints for table `sensor`
--
ALTER TABLE `sensor`
  ADD CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`FieldID`) REFERENCES `field` (`FieldID`);

--
-- Constraints for table `smartirrigation`
--
ALTER TABLE `smartirrigation`
  ADD CONSTRAINT `smartirrigation_ibfk_1` FOREIGN KEY (`SensorID`) REFERENCES `sensor` (`SensorID`);

--
-- Constraints for table `weather`
--
ALTER TABLE `weather`
  ADD CONSTRAINT `weather_ibfk_1` FOREIGN KEY (`FarmID`) REFERENCES `farm` (`FarmID`);

--
-- Constraints for table `workswith`
--
ALTER TABLE `workswith`
  ADD CONSTRAINT `workswith_ibfk_1` FOREIGN KEY (`FarmerID`) REFERENCES `farmer` (`FarmerID`),
  ADD CONSTRAINT `workswith_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
