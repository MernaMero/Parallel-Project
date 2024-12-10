-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2024 at 04:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atmsimulator`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `accountID` int(11) NOT NULL,
  `holderName` varchar(255) NOT NULL,
  `balance` float NOT NULL,
  `bankID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`accountID`, `holderName`, `balance`, `bankID`) VALUES
(1, 'Mahmoud Diab', 5682590, 1),
(2, 'Sara Ahmed', 7500.5, 2),
(6, 'Alice Smith', 1000, 1),
(7, 'Alice Smith', 1000, 1),
(8, 'Jane Doe', 1500, 1),
(9, 'Jane Doe', 1500, 1),
(10, 'Jane Doe', 1500, 1),
(11, 'Jane Doe', 1500, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `passsword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `name`, `username`, `passsword`) VALUES
(1, 'Ahmed Khaled', 'ahmed1', 'ahmed1'),
(2, 'Nour El-Din', 'nour1', 'nour1'),
(3, 'marwan', 'marwan1', 'marwan1'),
(4, 'marwans', 'marwan2', 'marwan2');

-- --------------------------------------------------------

--
-- Table structure for table `atm`
--

CREATE TABLE `atm` (
  `atmID` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `bankID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `atm`
--

INSERT INTO `atm` (`atmID`, `location`, `bankID`) VALUES
(1, 'Cairo Branch', 1),
(2, 'Alexandria Branch', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bankID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bankID`, `name`, `location`) VALUES
(1, 'National Bank', 'Cairo'),
(2, 'Global Bank', 'Alexandria');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `cardNumber` varchar(16) NOT NULL,
  `pin` varchar(4) NOT NULL,
  `accountID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`cardNumber`, `pin`, `accountID`) VALUES
('1234567812345678', '1234', 1),
('9876543298765432', '5678', 2);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transactionID` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` float NOT NULL,
  `timestamp` datetime NOT NULL,
  `accountID` int(11) DEFAULT NULL,
  `atmID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transactionID`, `type`, `amount`, `timestamp`, `accountID`, `atmID`) VALUES
(1, 'Deposit', 1000, '2024-12-09 10:00:00', 1, 1),
(2, 'Withdrawal', 500, '2024-12-09 11:00:00', 2, 2),
(3, 'deposit', 50000, '2024-12-10 02:08:23', 1, 1),
(4, 'deposit', 50000, '2024-12-10 02:09:25', 1, 1),
(5, 'deposit', 50000, '2024-12-10 13:56:07', 1, 1),
(6, 'deposit', 50000, '2024-12-10 14:13:52', 1, 1),
(7, 'deposit', 50000, '2024-12-10 14:25:54', 1, 1),
(8, 'deposit', 50000, '2024-12-10 14:27:36', 1, 1),
(9, 'deposit', 50000, '2024-12-10 14:27:51', 1, 1),
(10, 'deposit', 50000, '2024-12-10 14:28:10', 1, 1),
(11, 'deposit', 50000, '2024-12-10 14:29:32', 1, 1),
(12, 'deposit', 50000, '2024-12-10 14:31:23', 1, 1),
(13, 'deposit', 50000, '2024-12-10 14:31:40', 1, 1),
(14, 'deposit', 50000, '2024-12-10 14:32:11', 1, 1),
(15, 'deposit', 50000, '2024-12-10 14:33:59', 1, 1),
(16, 'deposit', 50000, '2024-12-10 14:35:48', 1, 1),
(17, 'deposit', 50000, '2024-12-10 14:38:11', 1, 1),
(18, 'deposit', 50000, '2024-12-10 14:38:56', 1, 1),
(19, 'deposit', 50000, '2024-12-10 14:40:37', 1, 1),
(20, 'deposit', 50000, '2024-12-10 14:42:49', 1, 1),
(21, 'deposit', 50000, '2024-12-10 14:43:06', 1, 1),
(22, 'deposit', 50000, '2024-12-10 14:43:38', 1, 1),
(23, 'deposit', 50000, '2024-12-10 14:44:49', 1, 1),
(24, 'deposit', 50000, '2024-12-10 14:47:31', 1, 1),
(25, 'deposit', 50000, '2024-12-10 14:49:32', 1, 1),
(26, 'deposit', 0, '2024-12-10 14:50:55', 1, 1),
(27, 'deposit', 300000, '2024-12-10 14:59:58', 1, 1),
(28, 'deposit', 300000, '2024-12-10 15:01:05', 1, 1),
(29, 'deposit', 300000, '2024-12-10 15:02:05', 1, 1),
(30, 'deposit', 300000, '2024-12-10 15:02:32', 1, 1),
(31, 'deposit', 300000, '2024-12-10 15:06:29', 1, 1),
(32, 'deposit', 300000, '2024-12-10 15:14:15', 1, 1),
(33, 'deposit', 300000, '2024-12-10 15:16:42', 1, 1),
(34, 'deposit', 300000, '2024-12-10 15:21:37', 1, 1),
(35, 'deposit', 100000, '2024-12-10 15:22:55', 1, 1),
(36, 'withdraw', 100000, '2024-12-10 15:23:46', 1, 1),
(37, 'deposit', 100000, '2024-12-10 15:26:36', 1, 1),
(38, 'withdraw', 1, '2024-12-10 15:26:36', 1, 2),
(39, 'deposit', 1000000, '2024-12-10 17:11:24', 1, 1),
(40, 'withdraw', 1, '2024-12-10 17:11:24', 1, 2),
(41, 'deposit', 1000000, '2024-12-10 17:12:01', 1, 1),
(42, 'withdraw', 5000, '2024-12-10 17:12:01', 1, 2),
(43, 'deposit', 1000000, '2024-12-10 17:12:29', 1, 1),
(44, 'withdraw', 90000, '2024-12-10 17:12:29', 1, 2),
(45, 'withdraw', 1000000, '2024-12-10 17:12:55', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accountID`),
  ADD KEY `bankID` (`bankID`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `atm`
--
ALTER TABLE `atm`
  ADD PRIMARY KEY (`atmID`),
  ADD KEY `bankID` (`bankID`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bankID`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`cardNumber`),
  ADD KEY `accountID` (`accountID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionID`),
  ADD KEY `accountID` (`accountID`),
  ADD KEY `atmID` (`atmID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `accountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `atm`
--
ALTER TABLE `atm`
  MODIFY `atmID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bankID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`bankID`) REFERENCES `bank` (`bankID`) ON DELETE SET NULL;

--
-- Constraints for table `atm`
--
ALTER TABLE `atm`
  ADD CONSTRAINT `atm_ibfk_1` FOREIGN KEY (`bankID`) REFERENCES `bank` (`bankID`) ON DELETE CASCADE;

--
-- Constraints for table `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`) ON DELETE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`atmID`) REFERENCES `atm` (`atmID`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
