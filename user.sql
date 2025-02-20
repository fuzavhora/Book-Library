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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_key` (`email`),
  ADD KEY `user_role_id_fkey` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
