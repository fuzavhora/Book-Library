-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2025 at 10:30 AM
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
(1, 1, 4),
(2, 1, 4),
(3, 2, 4),
(4, 3, 4),
(5, 3, 4),
(6, 3, 4),
(7, 3, 5),
(8, 3, 5),
(9, 5, 5),
(10, 6, 5),
(11, 7, 5);

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
(2, 'Richard Templar', 'richard@author.com', '$2a$10$1fdMhHD..NPgoIByGgAa4eps8.wxXfm1vK5aCS3i3oYUMHGhoJ.zm', NULL, 2),
(3, 'Admin', 'admin@admin.com', '$2a$10$QrN1M7LuThzj1H8zSMzzZO8YlO8xB6Ck/bapnblsNr2ei1NDPWJ8y', NULL, 1),
(4, 'user1', 'user1@user.com', '$2a$10$QhjcXNwirZn9YQQe7ppii.LZ/lRUi6b5nTNBIPwU65PCxKc30cyFe', NULL, 3),
(5, 'user2', 'user2@user.com', '$2a$10$VsCzZbVF.xZXmrpA1Xje8OAn/texu/jXL/1Kogr7cFYNgU9W1gvHu', NULL, 3),
(6, 'user3', 'user3@user.com', '$2a$10$8dzx1/3L/Cz288J.sv7edeqYBYviZVJVC/Ce6F1/kMeqYJugaXJNe', NULL, 3),
(7, 'user5', 'user5@user.com', '$2a$10$b1uADAV4LfQ3UlPBIbBCke3yjMNVqcfSIJNWcf4hhkL9.pun1RWe2', NULL, 3),
(8, 'user4', 'user4@user.com', '$2a$10$LScxk/buPOXbmoZ7ivrr7uWt.T.Ogblyrs1RVW1sWDGhk0OcEhxji', NULL, 3),
(11, 'Author1', 'author1@author.com', '$2a$10$Q38VI4kOBhTGbtEn98xz7epXy9DTaK6NGZuwRvo0Il1J9.4F5165a', NULL, 2),
(12, 'Author2', 'author2@author.com', '$2a$10$6ivFk3IQ5l/g9xVos2j3welc021GigSrPOOKzx9eZkz.I4I8eIj7u', NULL, 2),
(13, 'Author3', 'author3@author.com', '$2a$10$hwUyJsIPxScv98V1bdZdfeTC05wHz2FT01eVuTlitqux.psV38mHK', NULL, 2),
(14, 'Author4', 'author4@author.com', '$2a$10$sbKszMgWA4tdBGG/ynNhOeOIi2GwLi/cpHFmqofV5hr0sw/n70b86', NULL, 2);

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
('3f0897ab-b0fe-49d0-b8b4-f1bb327475d1', '1a5b912b62c36efe3a319a0a054c94cfcafbc2246248bd4290dfdf3a490c763c', '2025-02-20 05:10:07.116', '20250210105543_init', NULL, NULL, '2025-02-20 05:10:07.066', 1),
('8075633d-7daf-40c2-8c0f-2b602d03e65c', 'a8b2390fb4a83b5f9a770649e2adedf57c17dd435ced80fbac73f8d5195688a1', '2025-02-20 05:10:07.055', '20250210063001_init', NULL, NULL, '2025-02-20 05:10:07.020', 1),
('8326bd12-0535-4c68-9899-54ed9caf9f29', 'e01f05ab92b1136d2507a0b56826ce1b6e31cfe83d7aea7c46779763df69eb6f', '2025-02-20 05:10:07.065', '20250210063934_init', NULL, NULL, '2025-02-20 05:10:07.056', 1),
('935bc00d-14c2-4c80-bfe4-9d73ed8c0cef', '0afd4b444f21cc50eaf2def8fee352c1d90f2ca8a921dd500579a742c3f9cda6', '2025-02-20 05:10:07.167', '20250213055305_init', NULL, NULL, '2025-02-20 05:10:07.148', 1),
('bb44a95e-07e9-4d38-a14f-7aefe1412151', '4823941b508510a1f0502dda2a5d7b21b7fe2c46192f0e5019e63055d63f900d', '2025-02-20 05:10:07.148', '20250212101306_init', NULL, NULL, '2025-02-20 05:10:07.122', 1),
('e5cc091f-4730-4c0f-a8ed-15571a3fc7f8', 'f8e7f6d7503ac7ae046d9870230024a7da53ebfc9393d40b8fd8cc969ee014a9', '2025-02-20 05:10:07.121', '20250212092050_init', NULL, NULL, '2025-02-20 05:10:07.117', 1),
('fbfaca60-52fa-4d1d-a735-fbd050670269', '111d7c28e985420014c9cd4abeb4b0e5ad95bcb1b18f0e65fe3bb6dc653a3f55', '2025-02-20 05:10:07.197', '20250220050204_init', NULL, NULL, '2025-02-20 05:10:07.168', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
