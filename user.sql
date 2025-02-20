-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2025 at 05:58 AM
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
(4, 'admin', 'admin@test.com', '$2a$10$vJELSOG5JPPLK6G/iub5DuWJ9fR4Fr1Q1nAQoVAWq221vea8Rg9F6', NULL, 1),
(5, 'author', 'author@test.com', '$2a$10$GjGmSrhrIRjlPaoyaHA2curGAfZhN/2qO.8pgck3MJ/tH65aphwYG', NULL, 2),
(6, 'user1', 'user1@test.com', '$2a$10$c99kFlGEet0lqqM/jYm0iegMPpDLSFmg0RzQJbP/xawLkBE.2MWf.', NULL, 3),
(7, 'user2', 'user2@test.com', '$2a$10$H7jbdO/vAm3gLFmvJM7zE.n/NwgcoKY9gWg558piVY0sWNgbMIiC.', NULL, 3),
(8, 'user3', 'user3@test.com', '$2a$10$gtcpjV0/oxX8v47M6VBtCup6C6mqCF8JJhyM6RQQ1lGeXoXk5o8Qi', NULL, 3),
(9, 'David Sargent', 'david@author.com', '$2a$10$UT8XJBVMKM2BCYtitlkno.nELtVHRLj49tsqAA8dYyXvZ7XxQuQoS', NULL, 2),
(10, 'Brian Tracy', 'Brian@author.com', '$2a$10$KUtDoU/HY8osv4pYqFZX1ewYfGA.fQGYVsT5zCPr8ENxZ32pgDNKq', NULL, 2),
(11, 'Madsen Pirie', 'madsen@author.com', '$2a$10$MTqtvXk7ECckk2Z6qk6toeXVH3DZ4kTh/K12QYAZ3tZu0Sg.ojav6', NULL, 2),
(12, 'Richard Templar', 'richard@author.com', '$2a$10$vYDX3iscpdGA7z5/CZjVL.b6SI1TWBJFSQWp1J0gQsa9sAHezzTui', NULL, 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
