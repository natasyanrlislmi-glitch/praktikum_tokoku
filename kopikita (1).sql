-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 29, 2026 at 03:58 PM
-- Server version: 8.0.30
-- PHP Version: 8.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kopikita`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Kopi'),
(2, 'Teh'),
(3, 'Peralatan'),
(4, 'Camilan'),
(5, 'Merchandise');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joined_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `city`, `joined_at`) VALUES
(1, 'Andi', 'Jember', '2025-11-03'),
(2, 'Budi', 'Surabaya', '2025-12-15'),
(3, 'Citra', 'Jember', '2026-01-20'),
(4, 'Dewi', 'Malang', '2026-02-11'),
(5, 'Eko', NULL, '2026-03-05'),
(6, 'Fitri', 'Surabaya', '2026-04-18'),
(7, 'Gita', 'Jember', '2026-05-09'),
(8, 'Hadi', 'Banyuwangi', '2026-06-30'),
(9, 'Indah', 'Jember', '2026-07-14'),
(10, 'Joko', 'Malang', '2026-08-01');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `order_date` date NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_fee` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `status`, `shipping_fee`) VALUES
(1, 1, '2026-07-05', 'selesai', 15000.00),
(2, 2, '2026-07-12', 'selesai', 20000.00),
(3, 1, '2026-07-28', 'selesai', NULL),
(4, 3, '2026-08-03', 'selesai', 15000.00),
(5, 4, '2026-08-10', 'dibatalkan', 18000.00),
(6, 5, '2026-08-21', 'selesai', NULL),
(7, 2, '2026-08-30', 'selesai', 20000.00),
(8, 6, '2026-09-04', 'selesai', 20000.00),
(9, 3, '2026-09-15', 'selesai', 15000.00),
(10, 7, '2026-09-22', 'dikirim', 15000.00),
(11, 1, '2026-10-01', 'selesai', NULL),
(12, 8, '2026-10-06', 'selesai', 25000.00),
(13, 4, '2026-10-12', 'menunggu', 18000.00),
(14, 6, '2026-10-15', 'dikirim', 20000.00),
(15, 2, '2026-10-18', 'dikirim', 20000.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 1, 2, 80000.00),
(2, 1, 5, 1, 35000.00),
(3, 2, 7, 1, 250000.00),
(4, 3, 2, 3, 50000.00),
(5, 3, 10, 2, 25000.00),
(6, 4, 4, 2, 45000.00),
(7, 4, 5, 2, 35000.00),
(8, 5, 3, 1, 95000.00),
(9, 6, 8, 1, 175000.00),
(10, 6, 1, 1, 85000.00),
(11, 7, 2, 1, 55000.00),
(12, 7, 12, 3, 48000.00),
(13, 8, 9, 1, 120000.00),
(14, 8, 3, 2, 95000.00),
(15, 9, 1, 1, 85000.00),
(16, 9, 11, 2, 30000.00),
(17, 10, 7, 1, 250000.00),
(18, 10, 2, 1, 55000.00),
(19, 11, 4, 3, 45000.00),
(20, 11, 10, 5, 25000.00),
(21, 12, 8, 2, 175000.00),
(22, 12, 12, 2, 48000.00),
(23, 13, 6, 2, 40000.00),
(24, 14, 1, 2, 85000.00),
(25, 14, 3, 1, 95000.00),
(26, 15, 5, 4, 35000.00),
(27, 15, 10, 3, 25000.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `rating` decimal(2,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `category_id`, `price`, `stock`, `rating`) VALUES
(1, 'Kopi Arabika Gayo 250g', 1, 85000.00, 40, 4.8),
(2, 'Kopi Robusta Lampung 250g', 1, 55000.00, 60, 4.5),
(3, 'Kopi Toraja 250g', 1, 95000.00, 25, 4.7),
(4, 'Teh Hijau Premium', 2, 45000.00, 80, 4.3),
(5, 'Teh Melati', 2, 35000.00, 100, 4.1),
(6, 'Teh Hitam Kayu Aro', 2, 40000.00, 0, NULL),
(7, 'Coffee Grinder Manual', 3, 250000.00, 15, 4.6),
(8, 'French Press 600ml', 3, 175000.00, 20, 4.4),
(9, 'Dripper V60', 3, 120000.00, 0, NULL),
(10, 'Keripik Singkong', 4, 25000.00, 150, 4.0),
(11, 'Kacang Sangrai', 4, 30000.00, 90, NULL),
(12, 'Cookies Kopi', 4, 48000.00, 35, 4.2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `idx_orders_order_date` (`order_date`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
