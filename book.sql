-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2025 at 05:59 AM
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
(1, 'Living in the Light: A guide to personal transformation', 200, 'Live as if you were to die tomorrow. Learn as if you were to live forever.', 'Self Improvment', '2025-02-13 06:18:09.339', 1, 9),
(2, 'Cambridge IGCSE ICT 2nd Edition', 250, 'When you talk, you are only repeating what you already know. But if you listen, you may learn something new.', 'ICT', '2025-02-13 06:19:26.324', 1, 9),
(3, 'The Glass Castle: A Memoir by Jeannette Walls', 289, 'Love only grows by sharing. You can only have more for yourself by giving it away to others', 'Biography', '2025-02-13 06:25:18.520', 1, 10),
(4, ' Hillbilly Elegy: A Memoir of a Family and Culture in Crisis', 149, 'A memories of a Family and Culture in Crisis', 'Biography', '2025-02-13 06:27:23.271', 1, 10),
(5, 'How to Win Every Argument', 189, ' Don\'t fear change. The surprise is the only way to new discoveries. Be playful!', 'Buisness & Career', '2025-02-13 06:30:47.466', 1, 11),
(6, 'The Rules of Work: A Definitive Code for Personal Success', 249, 'If you want to become full, let yourself be empty.', 'Buisness & Career', '2025-02-13 06:33:13.598', 1, 12);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
