-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Гру 25 2017 р., 21:42
-- Версія сервера: 10.1.26-MariaDB
-- Версія PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `admin`
--

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `LOGIN` varchar(20) NOT NULL,
  `PASSWORD` int(4) NOT NULL,
  `ROOT` varchar(5) NOT NULL,
  `NUMBER` varchar(13) NOT NULL,
  `CARD` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users';

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`USER_ID`, `LOGIN`, `PASSWORD`, `ROOT`, `NUMBER`, `CARD`) VALUES
(24, 'Nikita', 1212, 'ADMIN', '050-000-00-00', '0000-0000-0000-0000'),
(26, 'Dima', 4321, 'USER', '097-237-57-84', '1111-1111-1111-1111'),
(29, 'Kostya', 1111, 'USER', '097-123-12-12', '1234-1234-1234-1234');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
