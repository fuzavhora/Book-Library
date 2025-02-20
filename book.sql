-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2025 at 10:36 AM
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
-- Database: `booklibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `price` int(11) NOT NULL,
  `des` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `public` tinyint(1) NOT NULL DEFAULT 1,
  `author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `name`, `price`, `des`, `type`, `createdAt`, `public`, `author`) VALUES
(1, 'The Rules of Work: A Definitive Code for Personal Success', 249, 'If you want to become full, let yourself be empty.', 'Buisness & Career', '2025-02-20 05:12:53.565', 1, 2),
(2, 'Book-1', 249, 'Authoer 1 book1 type1', 'type-1', '2025-02-20 06:03:40.557', 1, 11),
(3, 'Book-2', 249, 'Authoer 1 book2 type2', 'type-2', '2025-02-20 06:04:09.907', 1, 11),
(4, 'Book-3', 249, 'Authoer 1 book3 type3', 'type-3', '2025-02-20 06:04:21.457', 1, 11),
(5, 'Book-4', 249, 'Authoer 1 book4 type4', 'type-4', '2025-02-20 06:04:35.396', 1, 11),
(6, 'Book-2-2', 249, 'Authoer 2 book2 type2', 'type-2', '2025-02-20 06:05:47.028', 1, 12),
(7, 'Book-2-1', 249, 'Authoer 2 book1 type1', 'type-1', '2025-02-20 06:06:00.881', 1, 12),
(8, 'Book-2-3', 249, 'Authoer 2 book3 type3', 'type-3', '2025-02-20 06:06:12.468', 1, 12),
(9, 'Book-2-4', 249, 'Authoer 2 book4 type4', 'type-4', '2025-02-20 06:06:22.445', 1, 12),
(10, 'Book-3-1', 249, 'Authoer 2 book1 type1', 'type-1', '2025-02-20 06:07:29.662', 1, 13),
(11, 'Book-3-2', 249, 'Authoer 3 book2 type2', 'type-2', '2025-02-20 06:07:49.923', 1, 13),
(12, 'Book-3-3', 249, 'Authoer 3 book3 type3', 'type-3', '2025-02-20 06:08:00.821', 1, 13),
(13, 'Book-3-4', 249, 'Authoer 3 book4 type4', 'type-4', '2025-02-20 06:08:15.164', 1, 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_author_fkey` (`author`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_author_fkey` FOREIGN KEY (`author`) REFERENCES `user` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
