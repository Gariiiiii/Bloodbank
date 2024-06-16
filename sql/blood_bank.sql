-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2024 at 09:11 AM
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
-- Database: `blood_bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `bb_blood`
--

CREATE TABLE `bb_blood` (
  `blood_id` int(11) NOT NULL,
  `blood` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='data of all available blood group';

--
-- Dumping data for table `bb_blood`
--

INSERT INTO `bb_blood` (`blood_id`, `blood`, `detail`, `status`) VALUES
(1, 'A+', '', 1),
(2, 'A-', '', 1),
(3, 'B+', '', 1),
(4, 'B-', '', 1),
(5, 'AB+', '', 1),
(6, 'AB-', '', 1),
(7, 'O+', '', 1),
(8, 'O-', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bb_hospital`
--

CREATE TABLE `bb_hospital` (
  `hospital_id` int(11) NOT NULL,
  `hospital_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `datetime` datetime NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='store the details of hospital data';

--
-- Dumping data for table `bb_hospital`
--

INSERT INTO `bb_hospital` (`hospital_id`, `hospital_name`, `username`, `password`, `mobile`, `datetime`, `status`) VALUES
(1, 'AIIMS', 'hospitalxyz', 'pass456', 9876543210, '2024-06-13 19:14:22', 1),
(2, 'Max Super Specialty Hospital', 'communityhospital', 'abc123', 5551234567, '2024-06-13 19:14:22', 1),
(3, 'Shri Ganga Ram Hospital', 'citymedcenter', 'xyz789', 3339876543, '2024-06-13 19:14:22', 1),
(4, 'Apollo Hospital', 'countygeneral', 'password', 1112223333, '2024-06-13 19:14:22', 1),
(5, 'Safdarjung Hospital', 'metrohospital', 'secure123', 4445556666, '2024-06-13 19:14:22', 1),
(6, 'Primus Super Specialty Hospital', 'unitymedical', 'hospital123', 8889990000, '2024-06-13 19:14:22', 1),
(7, 'Manipal Hospital', 'sunrisehospital', 'sun123', 7778889999, '2024-06-13 19:14:22', 1),
(8, 'Dharamshila Narayan Hospital', 'hopemedical', 'hope456', 2223334444, '2024-06-13 19:14:22', 1),
(11, 'City Hospital', 'sharmi8n', '3652f360cb5771ca8c678e39b8dbbe22', 9310152246, '2024-06-13 21:19:45', 1),
(12, 'Ram Manohar Lohia Hospital', 'shivi', 'b29a2205cd481a9dcfbd98da8139b13f', 1234567897, '2024-06-13 21:24:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bb_request`
--

CREATE TABLE `bb_request` (
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `blood_id` int(11) NOT NULL,
  `volume` int(11) NOT NULL COMMENT 'in ml',
  `datetime` datetime NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='request detail by user to the hospital';

--
-- Dumping data for table `bb_request`
--

INSERT INTO `bb_request` (`request_id`, `user_id`, `hospital_id`, `blood_id`, `volume`, `datetime`, `status`) VALUES
(2, 5, 1, 2, 100, '2024-06-13 21:30:53', 1),
(3, 5, 3, 6, 300, '2024-06-14 14:02:23', 1),
(4, 5, 1, 1, 50, '2024-06-14 14:02:30', 1),
(5, 5, 3, 5, 150, '2024-06-14 14:02:35', 1),
(6, 5, 1, 1, 150, '2024-06-14 14:02:37', 1),
(7, 5, 2, 3, 200, '2024-06-14 15:58:41', 1),
(8, 5, 2, 3, 200, '2024-06-14 15:58:50', 1),
(9, 5, 3, 5, 100, '2024-06-14 16:25:00', 1),
(10, 5, 12, 3, 100, '2024-06-14 20:18:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bb_stock`
--

CREATE TABLE `bb_stock` (
  `stock_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `blood_id` int(11) NOT NULL,
  `volume` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='blood stock available in the hospital';

--
-- Dumping data for table `bb_stock`
--

INSERT INTO `bb_stock` (`stock_id`, `hospital_id`, `blood_id`, `volume`, `status`) VALUES
(3, 1, 1, 400, 1),
(4, 1, 2, 600, 1),
(5, 2, 3, 500, 1),
(6, 2, 4, 350, 1),
(7, 3, 5, 180, 1),
(8, 3, 6, 300, 1),
(9, 4, 7, 220, 1),
(10, 4, 8, 150, 1),
(11, 12, 3, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bb_user`
--

CREATE TABLE `bb_user` (
  `user_id` int(11) NOT NULL,
  `blood_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `datetime` datetime NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='all data of reciever';

--
-- Dumping data for table `bb_user`
--

INSERT INTO `bb_user` (`user_id`, `blood_id`, `first_name`, `last_name`, `username`, `password`, `mobile`, `datetime`, `status`) VALUES
(3, 1, 'user', 'user', 'user', 'e10adc3949ba59abbe56e057f20f883e', 9748277144, '2018-08-15 14:09:32', 1),
(4, 3, 'Ravina', 'rawar', 'raviii', '2b882400855082a1b1a97cedf64cb413', 1234567895, '2024-06-13 21:18:53', 1),
(5, 2, 'Garima', 'Rawat', 'garii', '2b882400855082a1b1a97cedf64cb413', 9310123345, '2024-06-13 21:21:47', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bb_blood`
--
ALTER TABLE `bb_blood`
  ADD PRIMARY KEY (`blood_id`);

--
-- Indexes for table `bb_hospital`
--
ALTER TABLE `bb_hospital`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `bb_request`
--
ALTER TABLE `bb_request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `bb_stock`
--
ALTER TABLE `bb_stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `bb_user`
--
ALTER TABLE `bb_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bb_blood`
--
ALTER TABLE `bb_blood`
  MODIFY `blood_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bb_hospital`
--
ALTER TABLE `bb_hospital`
  MODIFY `hospital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bb_request`
--
ALTER TABLE `bb_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bb_stock`
--
ALTER TABLE `bb_stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bb_user`
--
ALTER TABLE `bb_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
