-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2025 at 08:16 PM
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
-- Database: `yachtrentaldatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_username` varchar(50) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_phone` varchar(15) NOT NULL,
  `client_email` varchar(25) NOT NULL,
  `client_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `client_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_username`, `client_name`, `client_phone`, `client_email`, `client_address`, `client_password`) VALUES
('huy', 'Nhat Huy', '0782592184', 'huynhatnguyen1110@gmail.c', '18 Huynh Tan Phat', 'password123'),
('nguyen', 'Tan Nguyen', '0987654321', 'nguyentantran3330@gmail.c', '21  Huynh Tan Phat', 'password345'),
('trang', 'Thu Trang', '037692155', 'trangthunguyen2220@gmail.', '19 Huynh Tan Phat', 'password234');

-- --------------------------------------------------------

--
-- Table structure for table `clientyachts`
--

CREATE TABLE `clientyachts` (
  `yacht_id` int(20) NOT NULL,
  `client_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `clientyachts`
--

INSERT INTO `clientyachts` (`yacht_id`, `client_username`) VALUES
(1, 'huy'),
(3, 'huy'),
(7, 'huy'),
(8, 'huy'),
(9, 'huy'),
(11, 'huy'),
(12, 'huy'),
(2, 'trang'),
(4, 'trang'),
(5, 'trang'),
(6, 'trang'),
(10, 'trang'),
(13, 'trang'),
(14, 'trang');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_username` varchar(50) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_email` varchar(25) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `customer_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_username`, `customer_name`, `customer_phone`, `customer_email`, `customer_address`, `customer_password`) VALUES
('huy1', 'Nguyen Nhat Huy', '0782592184', 'huynhatnguyen1234@gmail.c', '18 Huynh Tan Phat', 'password1'),
('huy2', 'Nguyen Nhi Huy', '0782592185', 'huynhatnguyen2345@gmail.c', '20 Huynh Tan Phat', 'password2'),
('huy3', 'Nguyen Tam Huy', '0782592186', 'huynhatnguyen3456@gmail.c', '22 Huynh Tan Phat', 'password3'),
('huy4', 'Nguyen Tu Huy', '0782592187', 'huynhatnguyen4567@gmail.c', '24 Huynh Tan Phat', 'password4'),
('huy5', 'Nguyen Ngu Huy', '0782592188', 'huynhatnguyen5678@gmail.c', '26 Huynh Tan Phat', 'password5');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(20) NOT NULL,
  `driver_name` varchar(50) NOT NULL,
  `dl_number` varchar(50) NOT NULL,
  `driver_phone` varchar(15) NOT NULL,
  `driver_address` varchar(50) NOT NULL,
  `driver_gender` varchar(10) NOT NULL,
  `client_username` varchar(50) NOT NULL,
  `driver_availability` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `driver_name`, `dl_number`, `driver_phone`, `driver_address`, `driver_gender`, `client_username`, `driver_availability`) VALUES
(1, 'Huynh Vo Tuan', '0135792468 ', '9547863157', '36 Huynh Tan Phat', 'Male', 'huy', 'no'),
(2, 'Tran Quoc Khanh', '03191563155 ', '9147523684', '38 Huynh Tan Phat', 'Male', 'huy', 'yes'),
(3, 'Duong Tri Binh', '32346288078 ', '9147523682', '40 Huynh Tan Phat', 'Male', 'huy', 'yes'),
(4, 'Dang Tran Thuy Vy', '04316015965 ', '9187563240', '42 Huynh Tan Phat', 'Female', 'trang', 'no'),
(5, 'Nguyen Nhat Ha', '68799466631 ', '7584960123', '45 Huynh Tan Phat', 'Female', 'trang', 'yes'),
(6, 'Cao Tung Anh', '36740186040 ', '8421025476', '47 Huynh Tan Phat', 'Male', 'nguyen', 'yes'),
(7, 'Huynh Thanh Phong', '44919316260 ', '7541023695', '49 Huynh Tan Phat', 'Male', 'huy', 'yes'),
(8, 'Duong Nhat Cuong', '94592817723', '5215557850', '50 Huynh Tan Phat', 'Male', 'trang', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `name` varchar(20) NOT NULL,
  `e_mail` varchar(30) NOT NULL,
  `message` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`name`, `e_mail`, `message`) VALUES
('Barack Obama', 'nikhil@gmail.com', 'Yacht rất đẹp. Tôi rất hài lòng');

-- --------------------------------------------------------

--
-- Table structure for table `rentedyachts`
--

CREATE TABLE `rentedyachts` (
  `id` int(100) NOT NULL,
  `customer_username` varchar(50) NOT NULL,
  `yacht_id` int(20) NOT NULL,
  `driver_id` int(20) NOT NULL,
  `booking_date` date NOT NULL,
  `rent_start_date` date NOT NULL,
  `rent_end_date` date NOT NULL,
  `yacht_return_date` date DEFAULT NULL,
  `charge_type` varchar(25) NOT NULL DEFAULT 'days',
  `fare` double DEFAULT NULL,
  `quantity` int(50) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `return_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rentedyachts`
--

INSERT INTO `rentedyachts` (`id`, `customer_username`, `yacht_id`, `driver_id`, `booking_date`, `rent_start_date`, `rent_end_date`, `yacht_return_date`, `charge_type`, `fare`, `quantity`, `total_amount`, `return_status`) VALUES
(574681245, 'huy3', 4, 2, '2025-02-18', '2025-03-01', '2025-04-02', '2025-07-18', 'hour', 3.5, 1, 3.5, 'R'),
(574681246, 'huy4', 6, 6, '2025-02-18', '2025-03-01', '2025-04-28', '2025-07-18', 'day', 75, 1, 75, 'R'),
(574681247, 'huy1', 3, 1, '2025-02-18', '2025-03-19', '2025-04-22', '2025-07-20', 'day', 62, 3, 186, 'R'),
(574681248, 'huy3', 1, 2, '2025-02-20', '2025-03-28', '2025-04-29', '2025-07-20', 'hour', 2.5, 1, 2.5, 'R'),
(574681249, 'huy4', 5, 2, '2025-02-23', '2025-03-24', '2025-04-25', '2025-07-23', 'hour', 7, 1, 7, 'R'),
(574681250, 'huy5', 3, 2, '2025-02-23', '2025-03-23', '2025-04-24', '2025-07-23', 'day', 62, 1, 62, 'R'),
(574681251, 'huy4', 10, 1, '2025-02-23', '2025-03-25', '2025-04-30', '2025-07-23', 'hour', 20, 2, 40, 'R'),
(574681252, 'huy2', 11, 2, '2025-02-23', '2025-03-23', '2025-04-23', '2025-07-23', 'hour', 25, 3, 75, 'R'),
(574681253, 'huy2', 6, 7, '2025-02-23', '2025-03-23', '2025-04-03', '2025-07-23', 'day', 75, 5, 375, 'R'),
(574681254, 'huy3', 12, 5, '2025-02-23', '2025-03-23', '2025-04-26', '2025-07-23', 'day', 480, 2, 960, 'R'),
(574681255, 'huy2', 8, 5, '2025-02-23', '2025-03-23', '2025-08-08', '2025-07-23', 'day', 200, 5, 1000, 'NR'),
(574681257, 'huy4', 7, 4, '2025-08-11', '2025-08-13', '2025-08-17', NULL, 'hour', NULL, NULL, NULL, 'R'),
(574681258, 'huy5', 3, 1, '2025-03-24', '2025-03-24', '2025-03-25', '2025-03-24', 'day', 62, 1, 62, 'R'),
(574681259, 'huy5', 14, 8, '2025-03-24', '2025-03-24', '2025-03-26', '2025-03-24', 'day', 350, 2, 700, 'R'),
(574681260, 'huy1', 2, 5, '2025-04-22', '2025-04-22', '2025-04-24', '2025-04-22', 'hour', 3, 2, 15, 'R'),
(574681261, 'huy1', 2, 5, '2025-04-22', '2025-04-22', '2025-04-24', NULL, 'hour', 3, 2, NULL, 'NR'),
(574681262, 'huy1', 2, 5, '2025-04-22', '2025-04-22', '2025-04-24', NULL, 'hour', 3, 2, NULL, 'NR'),
(574681263, 'huy1', 2, 5, '2025-04-22', '2025-04-22', '2025-04-24', NULL, 'hour', 3, 2, NULL, 'NR'),
(574681264, 'huy1', 2, 8, '2025-04-22', '2025-04-22', '2025-04-24', NULL, 'hour', 3, 2, NULL, 'NR'),
(574681265, 'huy1', 3, 1, '2025-04-22', '2025-04-23', '2025-04-24', NULL, 'day', 62, 1, 62, 'NR');

-- --------------------------------------------------------

--
-- Table structure for table `yachts`
--

CREATE TABLE `yachts` (
  `yacht_id` int(20) NOT NULL,
  `yacht_name` varchar(50) NOT NULL,
  `yachttype_id` varchar(50) NOT NULL,
  `yacht_img` varchar(50) DEFAULT 'NA',
  `price_per_hour` double NOT NULL,
  `price_per_day` double NOT NULL,
  `engine_type` varchar(50) NOT NULL,
  `max_passengers` int(11) NOT NULL,
  `yacht_availability` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `yachts`
--

INSERT INTO `yachts` (`yacht_id`, `yacht_name`, `yachttype_id`, `yacht_img`, `price_per_hour`, `price_per_day`, `engine_type`, `max_passengers`, `yacht_availability`) VALUES
(1, 'Sea Breeze', 'OM111', 'assets/img/yachts/SeaBreeze.avif', 2.5, 40, 'Outboard Motor', 2, 'no'),
(2, 'Wave Runner', 'IM111', 'assets/img/yachts/waverunner.jpg', 3, 60, 'Inboard Motor', 6, 'yes'),
(3, 'Sun Seeker', 'OM222', 'assets/img/yachts/sunseeker.jpeg', 3.2, 62, 'Outboard Motor', 8, 'no'),
(4, 'Ocean Rider', 'IM222', 'assets/img/yachts/oceanrider.jpeg', 3.5, 65, 'Inboard Motor', 10, 'yes'),
(5, 'Royal Princess', 'TD222', 'assets/img/yachts/RoyalPricess.jpeg', 7, 130, 'Twin Diesel', 18, 'yes'),
(6, 'Blue Horizon', 'DE111', 'assets/img/yachts/bluehorizon.avif', 4, 75, 'Diesel Engine', 12, 'yes'),
(7, 'Star Voyager', 'DE222', 'assets/img/yachts/starfishvoyager.jpg', 6, 120, 'Diesel Engine', 15, 'no'),
(8, 'Platinum Voyager', 'TD111', 'assets/img/yachts/platinumvoyager.jpeg', 10, 200, 'Twin Diesel', 20, 'yes'),
(9, 'Ocean Majesty', 'TRD111', 'assets/img/yachts/Oceanmajesty.jpeg', 15, 300, ' Triple Diesel', 30, 'yes'),
(10, 'Titan Explorer', 'QD111', 'assets/img/yachts/TitanExplorer.jpeg', 20, 400, 'Quad Diesel', 50, 'yes'),
(11, 'Infinity Super', 'QD222', 'assets/img/yachts/InfinitySuper.jpeg', 25, 500, 'Quad Diesel', 60, 'yes'),
(12, 'Arctic Explorer', 'DE112', 'assets/img/yachts/ArcticExplorer.jpg', 24, 480, 'Diesel Electric', 40, 'yes'),
(13, 'Royal Legacy', 'DD111', 'assets/img/yachts/RoyalLegacy.jpeg', 30, 600, 'Dual Diesel', 80, 'yes'),
(14, 'Coastal Voyager', 'DE333', 'assets/img/yachts/CoastalVoyager.jpg', 15, 350, 'Diesel Engine', 25, 'yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_username`);

--
-- Indexes for table `clientyachts`
--
ALTER TABLE `clientyachts`
  ADD PRIMARY KEY (`yacht_id`),
  ADD KEY `client_username` (`client_username`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_username`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD UNIQUE KEY `dl_number` (`dl_number`),
  ADD KEY `client_username` (`client_username`);

--
-- Indexes for table `rentedyachts`
--
ALTER TABLE `rentedyachts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_username` (`customer_username`),
  ADD KEY `yacht_id` (`yacht_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `yachts`
--
ALTER TABLE `yachts`
  ADD PRIMARY KEY (`yacht_id`),
  ADD UNIQUE KEY `yachttype_id` (`yachttype_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rentedyachts`
--
ALTER TABLE `rentedyachts`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=574681266;

--
-- AUTO_INCREMENT for table `yachts`
--
ALTER TABLE `yachts`
  MODIFY `yacht_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientyachts`
--
ALTER TABLE `clientyachts`
  ADD CONSTRAINT `clientyachts_ibfk_1` FOREIGN KEY (`client_username`) REFERENCES `clients` (`client_username`),
  ADD CONSTRAINT `clientyachts_ibfk_2` FOREIGN KEY (`yacht_id`) REFERENCES `yachts` (`yacht_id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`client_username`) REFERENCES `clients` (`client_username`);

--
-- Constraints for table `rentedyachts`
--
ALTER TABLE `rentedyachts`
  ADD CONSTRAINT `rentedyachts_ibfk_1` FOREIGN KEY (`customer_username`) REFERENCES `customers` (`customer_username`),
  ADD CONSTRAINT `rentedyachts_ibfk_2` FOREIGN KEY (`yacht_id`) REFERENCES `yachts` (`yacht_id`),
  ADD CONSTRAINT `rentedyachts_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
