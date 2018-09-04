-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018 年 9 月 04 日 01:55
-- サーバのバージョン： 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `individual_assessment`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `date` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `lessons`
--

INSERT INTO `lessons` (`id`, `title`, `date`) VALUES
(1, '??1', '0901'),
(2, '授業2', '0902'),
(3, '授業3', '0903'),
(4, '授業4', '0904'),
(5, '授業5', '0905'),
(6, '授業6', '0906'),
(7, '授業7', '0907'),
(8, '授業8', '0908'),
(9, '授業9', '0909'),
(10, '授業10', '0910'),
(11, '授業11', '0911'),
(12, '授業12', '0912');

-- --------------------------------------------------------

--
-- テーブルの構造 `response_data`
--

CREATE TABLE `response_data` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `per1` int(11) NOT NULL,
  `per2` int(11) NOT NULL,
  `per3` int(11) NOT NULL,
  `per4` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `response_data`
--

INSERT INTO `response_data` (`id`, `user_id`, `lesson_id`, `per1`, `per2`, `per3`, `per4`) VALUES
(1, 1, 1, 2, 3, 4, 5),
(2, 1, 2, 2, 3, 4, 2),
(3, 1, 3, 5, 4, 3, 2),
(4, 1, 4, 5, 3, 4, 2),
(5, 1, 5, 5, 4, 3, 2),
(6, 1, 6, 5, 3, 4, 2),
(7, 1, 7, 5, 4, 3, 2),
(8, 1, 8, 5, 3, 4, 2),
(9, 1, 9, 5, 4, 3, 2),
(10, 1, 10, 5, 3, 4, 2),
(11, 1, 11, 5, 4, 3, 2),
(12, 1, 12, 5, 3, 4, 2);

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` text CHARACTER SET utf8 NOT NULL,
  `password` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `user_id`, `password`) VALUES
(1, 'test1', 'test1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `response_data`
--
ALTER TABLE `response_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `response_data`
--
ALTER TABLE `response_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
