-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2016 at 03:51 PM
-- Server version: 5.6.22-log
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `de`
--

-- --------------------------------------------------------

--
-- Table structure for table `bought_by`
--

CREATE TABLE IF NOT EXISTS `bought_by` (
  `item_name` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bought_by`
--

INSERT INTO `bought_by` (`item_name`) VALUES
('iphone'),
('camera'),
('sony phone');

-- --------------------------------------------------------

--
-- Stand-in structure for view `mis_table`
--
CREATE TABLE IF NOT EXISTS `mis_table` (
`item_name` char(20)
);
-- --------------------------------------------------------

--
-- Table structure for table `sold_by`
--

CREATE TABLE IF NOT EXISTS `sold_by` (
  `item_name` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sold_by`
--

INSERT INTO `sold_by` (`item_name`) VALUES
('iphone'),
('sony phone');

-- --------------------------------------------------------

--
-- Structure for view `mis_table`
--
DROP TABLE IF EXISTS `mis_table`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mis_table` AS select `sold_by`.`item_name` AS `item_name` from `sold_by` where (not(`sold_by`.`item_name` in (select `a`.`item_name` from (`bought_by` `a` join `sold_by` `b`) where (`a`.`item_name` = `b`.`item_name`)))) union select `bought_by`.`item_name` AS `item_name` from `bought_by` where (not(`bought_by`.`item_name` in (select `a`.`item_name` from (`bought_by` `a` join `sold_by` `b`) where (`a`.`item_name` = `b`.`item_name`))));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
