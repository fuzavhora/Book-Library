-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2025 at 01:33 PM
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
-- Table structure for table `addtocart`
--

CREATE TABLE `addtocart` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addtocart`
--

INSERT INTO `addtocart` (`id`, `book_id`, `user_id`) VALUES
(1, 6, 5),
(2, 7, 5),
(3, 6, 5),
(4, 7, 5);

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
(1, 'Book-1-1', 249, 'Authoer 1 book1 type1', 'type-1', '2025-02-20 09:43:27.782', 1, 1),
(2, 'Book-1-2', 249, 'Authoer 1 book2 type2', 'type-2', '2025-02-20 09:43:41.591', 1, 1),
(3, 'Book-1-3', 249, 'Authoer 1 book3 type3', 'type-3', '2025-02-20 09:43:58.864', 1, 1),
(4, 'Book-2-3', 249, 'Authoer 2 book3 type3', 'type-3', '2025-02-20 09:45:51.542', 1, 2),
(5, 'Book-2-2', 249, 'Authoer 2 book2 type2', 'type-3', '2025-02-20 09:46:02.392', 1, 2),
(6, 'Book-2-1', 249, 'Authoer 2 book1 type1', 'type-3', '2025-02-20 09:46:09.981', 1, 2),
(7, 'Book-3-1', 249, 'Authoer 3 book1 type1', 'type-1', '2025-02-20 09:46:48.870', 1, 3),
(8, 'Book-3-2', 249, 'Authoer 3 book2 type2', 'type-2', '2025-02-20 09:46:59.600', 1, 3),
(9, 'Book-3-3', 249, 'Authoer 3 book3 type3', 'type-3', '2025-02-20 09:47:11.244', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `name`) VALUES
(1, 'Admin'),
(2, 'Author'),
(3, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `img` varchar(191) DEFAULT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `img`, `role_id`) VALUES
(1, 'Author1', 'author1@author.com', '$2a$10$qG1x61Oz0AuRRBtOjpp6euxzpJcqKrCMlsoErbHwqRsN4COm7SN2u', NULL, 2),
(2, 'Author2', 'author2@author.com', '$2a$10$kYlHcS73LxYkDlq8rs2rq./9qoCoWX9yjuMIwU6bCCNXLMkVl8oqq', NULL, 2),
(3, 'Author3', 'author3@author.com', '$2a$10$dWES9dGU.DmxH1b54hGVuOxx3M/V.LxeE86WkkpcNJNNdgalvUJBW', NULL, 2),
(4, 'Author4', 'author4@author.com', '$2a$10$ml8getvWfkVLg.R6kZW8buxGiacUrrNKn8BFCE3.S3tLJCZbHyjzW', NULL, 2),
(5, 'Admin', 'admin@admin.com', '$2a$10$uj/3rb2MwhDoSojV0/8eguJVjIny7y9G.ngJccgu/1GbuzqrAQnfa', NULL, 1),
(6, 'User1', 'user1@user.com', '$2a$10$yZIz5o1iMwbYKVh54eoh6..lPj8WwxsLnqd4/bDgJTUiaC0nzlhuW', NULL, 3),
(7, 'User2', 'user2@user.com', '$2a$10$qVH1b3l.8gF9DCrVBuM2JO.WyPRTstmdbt/N6RN86NNfeEXgZgHmG', NULL, 3),
(8, 'User3', 'user3@user.com', '$2a$10$CkjHDvv48PokWWKULoVd8.2RkZfBZlEZpdlUU2Ysb8qbP6rnavuc2', NULL, 3),
(10, 'Admin2', 'admin2@admin.com', '$2a$10$kg1BtiSkIC5Bomla9km3n.bIPmJ6WsXKVMzMNZeue7kqqxvTVIHl.', NULL, 2),
(11, 'Admin2', '', '$2a$10$KhAd/uTYU7vSI3kuBDnuBO2K6xWlCxRWn5ZuXBtCUWU5O1JeQ2pmW', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('08ed79cc-4ab2-47cf-b151-6b7531e1cc5c', 'e01f05ab92b1136d2507a0b56826ce1b6e31cfe83d7aea7c46779763df69eb6f', '2025-02-20 09:40:23.256', '20250210063934_init', NULL, NULL, '2025-02-20 09:40:23.250', 1),
('20864a21-1dcc-4ef7-8959-b6b2ce788603', 'f8e7f6d7503ac7ae046d9870230024a7da53ebfc9393d40b8fd8cc969ee014a9', '2025-02-20 09:40:23.313', '20250212092050_init', NULL, NULL, '2025-02-20 09:40:23.308', 1),
('2b45d1b1-d429-43e3-b687-e632f63149ef', '4823941b508510a1f0502dda2a5d7b21b7fe2c46192f0e5019e63055d63f900d', '2025-02-20 09:40:23.335', '20250212101306_init', NULL, NULL, '2025-02-20 09:40:23.315', 1),
('7b6e38d3-bdca-4075-839c-216b7f4df6d4', '111d7c28e985420014c9cd4abeb4b0e5ad95bcb1b18f0e65fe3bb6dc653a3f55', '2025-02-20 09:40:23.373', '20250220050204_init', NULL, NULL, '2025-02-20 09:40:23.350', 1),
('ccf1a257-1d9d-428c-8c7f-8f93b43fcf2e', 'a8b2390fb4a83b5f9a770649e2adedf57c17dd435ced80fbac73f8d5195688a1', '2025-02-20 09:40:23.248', '20250210063001_init', NULL, NULL, '2025-02-20 09:40:23.220', 1),
('d77bc0c8-e4a0-4765-8cea-a721ba5f5fb2', '0afd4b444f21cc50eaf2def8fee352c1d90f2ca8a921dd500579a742c3f9cda6', '2025-02-20 09:40:23.349', '20250213055305_init', NULL, NULL, '2025-02-20 09:40:23.336', 1),
('f4eeb127-4a42-4286-8ae8-2a8b55614078', '1a5b912b62c36efe3a319a0a054c94cfcafbc2246248bd4290dfdf3a490c763c', '2025-02-20 09:40:23.308', '20250210105543_init', NULL, NULL, '2025-02-20 09:40:23.257', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addtocart`
--
ALTER TABLE `addtocart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addtocart_user_id_fkey` (`user_id`),
  ADD KEY `addtocart_book_id_fkey` (`book_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_author_fkey` (`author`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_key` (`email`),
  ADD KEY `user_role_id_fkey` (`role_id`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addtocart`
--
ALTER TABLE `addtocart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addtocart`
--
ALTER TABLE `addtocart`
  ADD CONSTRAINT `addtocart_book_id_fkey` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `addtocart_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_author_fkey` FOREIGN KEY (`author`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
