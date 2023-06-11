-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2023 at 12:37 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maher`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` bigint(12) NOT NULL,
  `category` varchar(100) NOT NULL,
  `sub_cat` varchar(120) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` bigint(6) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `category`, `sub_cat`, `title`, `description`, `price`, `image`) VALUES
(35, 'Momo', 'Chicken Momo', 'Chicken Momo', 'Juicy Chicken Momo', 150, 'mimg/chicken-momo.jpg'),
(36, 'Momo', 'Veg Momo', 'Veg Momo', 'Vegetable Momo', 100, 'mimg/veg-momo.png'),
(37, 'Momo', 'Buff Momo', 'Buff Momo', 'Buff Momo', 125, 'mimg/buffmomo.jpg'),
(38, 'Chowmein', 'Chicken Chowmein', 'Chicken Chowmein', 'Chicken Chowmein', 150, 'mimg/chickenchowmein.jpg'),
(39, 'Chowmein', 'Thupka', 'Thupka', 'Thupka', 150, 'mimg/ThukpaI.jpg'),
(40, 'Dal Bhat', 'Dal Bhat', 'Sada Dal bhat', 'Sada Dal Bhat', 200, 'mimg/DalBhat.jpg'),
(41, 'Dal Bhat', 'Chicken Dal Bhat', 'Chicken Dal Bhat', 'Chicken Dal Bhat', 250, 'mimg/ChickenDalbhat.jpg'),
(42, 'Burger', 'Chicken Burger', 'Chicken Burger', 'Chicken Burger', 250, 'mimg/Chicken-Burgers-5.jpg'),
(43, 'Burger', 'Buff Burger', 'Buff Burger', 'Buff Burger', 220, 'mimg/Buffberger.jpg'),
(44, 'rise', 'Chicken Dal Bhat', 'Dal Bhat special', 'one of the Kind of special nepalese dal bhat', 300, 'mimg/blog-img-02.jpg'),
(45, 'rise', 'Chicken Dal Bhat', 'aalu', 'aalu', 12, 'mimg/avt-img.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
