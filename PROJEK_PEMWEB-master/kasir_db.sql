-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 15, 2025 at 09:47 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nama`) VALUES
(1, 'Makanan'),
(2, 'Minuman'),
(3, 'Cemilan');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id` int NOT NULL,
  `pesanan_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `total_harga` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id`, `pesanan_id`, `product_id`, `jumlah`, `total_harga`) VALUES
(1, 9, 5, 3, 39000),
(2, 9, 6, 5, 50000),
(3, 9, 9, 1, 5000),
(4, 9, 12, 5, 35000),
(5, 10, 1, 1, 16000),
(6, 11, 1, 1, 16000),
(7, 12, 1, 1, 16000),
(8, 12, 5, 1, 13000),
(9, 12, 18, 1, 15000),
(10, 13, 2, 1, 14000),
(11, 16, 3, 1, 12000),
(12, 17, 21, 1, 10000),
(13, 18, 1, 1, 16000);

-- --------------------------------------------------------

--
-- Table structure for table `keranjangs`
--

CREATE TABLE `keranjangs` (
  `id` int NOT NULL,
  `jumlah` int NOT NULL,
  `total_harga` int NOT NULL,
  `keterangan` text,
  `product_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanans`
--

CREATE TABLE `pesanans` (
  `id` int NOT NULL,
  `total_bayar` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pesanans`
--

INSERT INTO `pesanans` (`id`, `total_bayar`, `created_at`) VALUES
(1, 30000, '2025-07-15 08:39:39'),
(2, 24000, '2025-07-15 08:42:34');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_detail`
--

CREATE TABLE `pesanan_detail` (
  `id` int NOT NULL,
  `pesanan_id` int NOT NULL,
  `product_id` int NOT NULL,
  `jumlah` int NOT NULL,
  `total_harga` int NOT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pesanan_detail`
--

INSERT INTO `pesanan_detail` (`id`, `pesanan_id`, `product_id`, `jumlah`, `total_harga`, `keterangan`) VALUES
(1, 1, 1, 1, 16000, NULL),
(2, 1, 2, 1, 14000, NULL),
(3, 2, 3, 2, 24000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int NOT NULL,
  `is_ready` tinyint(1) NOT NULL DEFAULT '1',
  `gambar` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `kode`, `nama`, `harga`, `is_ready`, `gambar`, `category_id`) VALUES
(1, 'K-01', 'Sate Ayam', 16000, 1, 'sate-ayam.jpg', 1),
(2, 'K-02', 'Nasi Goreng Telur', 14000, 1, 'nasi-goreng-telor.jpg', 1),
(3, 'K-03', 'Nasi Rames', 12000, 1, 'nasi-rames.jpg', 1),
(4, 'K-04', 'Lontong Opor Ayam', 18000, 1, 'lontong-opor-ayam.jpg', 1),
(5, 'K-05', 'Mie Goreng', 13000, 1, 'mie-goreng.jpg', 1),
(6, 'K-06', 'Bakso', 10000, 1, 'bakso.jpg', 1),
(7, 'K-07', 'Mie Ayam Bakso', 14000, 1, 'mie-ayam-bakso.jpg', 1),
(8, 'K-08', 'Pangsit 6 pcs', 5000, 1, 'pangsit.jpg', 3),
(9, 'K-09', 'Kentang Goreng', 5000, 1, 'kentang-goreng.jpg', 3),
(10, 'K-010', 'Cheese Burger', 15000, 1, 'cheese-burger.jpg', 3),
(11, 'K-011', 'Coffe Late', 15000, 1, 'coffe-late.jpg', 2),
(12, 'K-012', 'Es Jeruk', 7000, 1, 'es-jeruk.jpg', 2),
(13, 'K-013', 'Es Teh', 5000, 1, 'es-teh.jpg', 2),
(14, 'K-014', 'Teh Hangat', 3000, 1, 'teh-hangat.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(5, 'admin', '$2y$10$FPtpG36LiVqAYVvXEclQReseK01bTZUgR2YHIcv8uYI0hH2p.oN8a', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keranjangs`
--
ALTER TABLE `keranjangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `pesanans`
--
ALTER TABLE `pesanans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pesanan_id` (`pesanan_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `keranjangs`
--
ALTER TABLE `keranjangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `pesanans`
--
ALTER TABLE `pesanans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keranjangs`
--
ALTER TABLE `keranjangs`
  ADD CONSTRAINT `keranjangs_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  ADD CONSTRAINT `pesanan_detail_ibfk_1` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
