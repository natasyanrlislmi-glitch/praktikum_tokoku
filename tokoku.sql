-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 22, 2026 at 08:33 AM
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
-- Database: `tokoku`
--

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kota` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `email`, `kota`, `tanggal_daftar`) VALUES
(1, 'Budi Santoso', 'budi@mail.com', 'Jember', '2025-01-10'),
(2, 'Siti Aminah', 'siti@mail.com', 'Surabaya', '2025-02-14'),
(3, 'Andi Pratama', NULL, 'Jember', '2025-03-05'),
(4, 'Dewi Lestari', 'dewi@mail.com', 'Malang', '2025-03-20'),
(5, 'Rizky Ramadhan', 'rizky@mail.com', 'Banyuwangi', '2025-04-02'),
(6, 'Putri Anggraini', NULL, 'Surabaya', '2025-05-18'),
(7, 'Agus Salim', 'agus@mail.com', 'Jember', '2025-06-01'),
(8, 'Nur Hidayah', 'nur@mail.com', 'Malang', '2025-07-09'),
(9, 'Budi Hartono', 'budi.h@mail.com', 'Jakarta', '2025-08-15'),
(10, 'Citra Dewi', 'citra@mail.com', 'Jember', '2025-09-22');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int NOT NULL,
  `pelanggan_id` int NOT NULL,
  `produk_id` int NOT NULL,
  `jumlah` int NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pesan` date NOT NULL,
  `catatan` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `pelanggan_id`, `produk_id`, `jumlah`, `status`, `tanggal_pesan`, `catatan`) VALUES
(1, 1, 2, 1, 'selesai', '2025-10-01', NULL),
(2, 2, 1, 1, 'selesai', '2025-10-03', 'Mohon dibungkus kardus tebal'),
(3, 3, 8, 2, 'dikirim', '2025-10-05', NULL),
(4, 4, 3, 1, 'diproses', '2025-10-07', NULL),
(5, 5, 4, 1, 'dibatalkan', '2025-10-08', 'Salah pilih ukuran'),
(6, 1, 9, 1, 'selesai', '2025-10-10', NULL),
(7, 6, 6, 2, 'dikirim', '2025-10-12', 'Kirim sebelum Jumat'),
(8, 7, 10, 1, 'diproses', '2025-10-13', NULL),
(9, 8, 2, 3, 'selesai', '2025-10-14', NULL),
(10, 9, 11, 1, 'dikirim', '2025-10-15', NULL),
(11, 10, 7, 1, 'diproses', '2025-10-16', 'Hadiah ulang tahun'),
(12, 3, 5, 4, 'selesai', '2025-10-17', NULL),
(13, 2, 8, 1, 'dibatalkan', '2025-10-18', NULL),
(14, 4, 1, 1, 'diproses', '2025-10-18', 'Tolong cek garansi'),
(15, 7, 12, 2, 'selesai', '2025-10-19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int NOT NULL,
  `nama_produk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int NOT NULL,
  `stok` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama_produk`, `kategori`, `harga`, `stok`) VALUES
(1, 'Laptop Asus Vivobook', 'Elektronik', 7500000, 15),
(2, 'Mouse Logitech M331', 'Aksesoris', 175000, 80),
(3, 'Keyboard Mekanik Rexus', 'Aksesoris', 450000, 35),
(4, 'Monitor LG 24 Inch', 'Elektronik', 1850000, 12),
(5, 'Flashdisk Sandisk 64GB', 'Aksesoris', 85000, 0),
(6, 'Headset Gaming Fantech', 'Aksesoris', 320000, 25),
(7, 'Webcam Logitech C270', 'Elektronik', 495000, 18),
(8, 'Buku Basis Data Dasar', 'Buku', 95000, 50),
(9, 'Buku Pemrograman Web', 'Buku', 120000, 40),
(10, 'SSD Kingston 480GB', 'Elektronik', 650000, 22),
(11, 'Laptop Lenovo IdeaPad', 'Elektronik', 6800000, 8),
(12, 'Mousepad Gaming XL', 'Aksesoris', 65000, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelanggan_id` (`pelanggan_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`),
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
