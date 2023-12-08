-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2023 at 02:46 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hapag_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'BAKING GOODS'),
(6, 'BEVERAGES'),
(4, 'CANNED/JARRED GOODS'),
(5, 'DAIRY'),
(2, 'FROZEN FOODS'),
(8, 'MEAT'),
(3, 'PASTRY'),
(9, 'PRODUCE');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `file_name`, `file_type`) VALUES
(10, 'Big and Little Animals.jpg', 'image/jpeg'),
(11, 'Node JS.jpg', 'image/jpeg'),
(12, 'Wine.jpg', 'image/jpeg'),
(13, 'Soda.jpg', 'image/jpeg'),
(14, 'Coffee.jpg', 'image/jpeg'),
(15, 'Liquor.jpg', 'image/jpeg'),
(16, 'Orange Juice.jpg', 'image/jpeg'),
(17, 'Flaky.jpg', 'image/jpeg'),
(18, 'Shortcrust.jpg', 'image/jpeg'),
(19, 'puff.jpg', 'image/jpeg'),
(20, 'Choux.jpg', 'image/jpeg'),
(21, 'Filo.jpg', 'image/jpeg'),
(22, 'Vegetables.jpg', 'image/jpeg'),
(23, 'Spaghetti Sauce.jpg', 'image/jpeg'),
(24, 'Fillet.jpg', 'image/jpeg'),
(25, 'Sardines.jpg', 'image/jpeg'),
(26, 'Ketchup.jpg', 'image/jpeg'),
(27, 'Egg.jpg', 'image/jpeg'),
(28, 'Milk.jpg', 'image/jpeg'),
(29, 'Cheese.jpg', 'image/jpeg'),
(30, 'Butter.jpg', 'image/jpeg'),
(31, 'Yogurt.jpg', 'image/jpeg'),
(32, 'Flour.jpg', 'image/jpeg'),
(33, 'Pasta.jpg', 'image/jpeg'),
(34, 'Sugar.jpg', 'image/jpeg'),
(35, 'Salt.jpg', 'image/jpeg'),
(36, 'Baking Powder.jpg', 'image/jpeg'),
(37, 'Bacon.jpg', 'image/jpeg'),
(38, 'Ham.jpg', 'image/jpeg'),
(39, 'Chicken.jpg', 'image/jpeg'),
(40, 'Beef.jpg', 'image/jpeg'),
(41, 'Pork.jpg', 'image/jpeg'),
(42, 'Apples.jpg', 'image/jpeg'),
(43, 'Oranges.jpg', 'image/jpeg'),
(44, 'Cucumbers.jpg', 'image/jpeg'),
(45, 'Lettuce.jpg', 'image/jpeg'),
(46, 'Pineapple.jpg', 'image/jpeg'),
(47, 'Ice Cream.jpg', 'image/jpeg'),
(48, 'All Purpose Cream.jpg', 'image/jpeg'),
(49, 'Hotdog.jpg', 'image/jpeg'),
(50, 'Ham.gif', 'image/gif'),
(51, 'Special Ham.gif', 'image/gif'),
(52, 'Fried Chicken.jpg', 'image/jpeg'),
(53, 'Red Horse.jpg', 'image/jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `buy_price` decimal(25,2) DEFAULT NULL,
  `sale_price` decimal(25,2) NOT NULL,
  `categorie_id` int(11) UNSIGNED NOT NULL,
  `media_id` int(11) DEFAULT 0,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `quantity`, `buy_price`, `sale_price`, `categorie_id`, `media_id`, `date`) VALUES
(14, 'Flaky', '0', '70.00', '90.00', 3, 17, '2022-10-31 12:36:52'),
(15, 'Shortcrust', '50', '100.00', '120.00', 3, 18, '2022-10-31 12:38:36'),
(16, 'Puff', '1', '100.00', '120.00', 3, 19, '2022-11-02 10:49:02'),
(17, 'Choux', '2', '50.00', '60.00', 3, 20, '2022-11-02 11:59:37'),
(18, 'Filo', '6', '90.00', '110.00', 3, 21, '2022-12-14 08:11:49'),
(19, 'Vegetables', '40', '50.00', '70.00', 4, 22, '2022-12-14 08:37:56'),
(20, 'Spaghetti Sauce', '30', '60.00', '80.00', 4, 11, '2022-12-18 10:27:26'),
(21, 'Wine', '20', '500.00', '700.00', 6, 12, '2022-12-19 07:01:39'),
(22, 'Coffee', '30', '200.00', '250.00', 6, 14, '2022-12-19 07:02:18'),
(23, 'Soda', '50', '100.00', '120.00', 6, 13, '2022-12-19 07:02:48'),
(24, 'Orange Juice', '50', '120.00', '150.00', 6, 16, '2022-12-19 07:04:02'),
(25, 'Ketchup', '30', '40.00', '60.00', 4, 26, '2022-12-19 07:24:24'),
(26, 'Fillet', '20', '150.00', '230.00', 4, 24, '2022-12-19 07:25:30'),
(27, 'Sardines', '50', '25.00', '35.00', 4, 25, '2022-12-19 07:26:01'),
(28, 'Liquor', '5', '200.00', '230.00', 6, 15, '2022-12-19 07:27:44'),
(29, 'Egg', '50', '250.00', '280.00', 5, 27, '2022-12-19 07:30:52'),
(30, 'Milk', '40', '50.00', '55.00', 5, 28, '2022-12-19 07:32:53'),
(31, 'Cheese', '55', '35.00', '40.00', 5, 29, '2022-12-19 07:36:03'),
(32, 'Butter', '30', '40.00', '45.00', 5, 30, '2022-12-19 07:36:40'),
(33, 'Yogurt', '50', '25.00', '28.00', 5, 31, '2022-12-19 07:37:28'),
(34, 'Flour', '50', '71.00', '75.00', 1, 32, '2022-12-19 07:41:07'),
(35, 'Pasta', '40', '120.00', '126.00', 1, 33, '2022-12-19 07:41:51'),
(36, 'Sugar', '50', '60.00', '68.00', 1, 34, '2022-12-19 07:42:23'),
(37, 'Salt', '50', '40.00', '43.00', 1, 35, '2022-12-19 07:42:54'),
(38, 'Baking Powder', '40', '20.00', '22.00', 1, 36, '2022-12-19 07:43:30'),
(39, 'Bacon', '30', '185.00', '190.00', 8, 37, '2022-12-19 07:49:01'),
(40, 'Ham', '25', '90.00', '110.00', 8, 38, '2022-12-19 07:49:31'),
(41, 'Chicken', '25', '180.00', '190.00', 8, 39, '2022-12-19 07:50:12'),
(42, 'Beef', '35', '250.00', '260.00', 8, 40, '2022-12-19 07:50:39'),
(43, 'Pork', '22', '180.00', '200.00', 8, 41, '2022-12-19 07:51:30'),
(44, 'Apples', '50', '20.00', '22.00', 9, 42, '2022-12-19 07:54:41'),
(45, 'Oranges', '50', '25.00', '30.00', 9, 43, '2022-12-19 07:55:03'),
(46, 'Cucumbers', '50', '25.00', '28.00', 9, 44, '2022-12-19 07:55:25'),
(47, 'Lettuce', '50', '35.00', '38.00', 9, 45, '2022-12-19 07:55:56'),
(48, 'Pineapple', '50', '40.00', '45.00', 9, 46, '2022-12-19 07:56:17'),
(49, 'Ice Cream', '33', '150.00', '250.00', 2, 47, '2022-12-19 11:09:57'),
(50, 'All Purpose Cream', '40', '45.00', '55.00', 2, 48, '2022-12-19 11:10:27'),
(51, 'Hotdog', '44', '120.00', '150.00', 2, 49, '2022-12-19 11:10:52'),
(54, 'Special Ham', '36', '700.00', '800.00', 2, 51, '2022-12-19 11:14:10'),
(55, 'Fried Chicken', '50', '100.00', '120.00', 2, 52, '2022-12-19 11:14:28'),
(56, 'Red Horse', '72', '50.00', '60.00', 6, 53, '2022-12-20 03:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(25,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `qty`, `price`, `date`) VALUES
(9, 15, 1, '450.00', '2022-10-31'),
(10, 14, 5, '1750.00', '2022-10-31'),
(11, 15, 2, '900.00', '2022-10-31'),
(12, 16, 1, '650.00', '2022-11-02'),
(13, 16, 3, '1950.00', '2022-11-02'),
(14, 14, 5, '1750.00', '2022-11-02'),
(15, 14, 5, '1750.00', '2022-11-02'),
(16, 15, 3, '1350.00', '2022-11-02'),
(17, 15, 2, '500.00', '2022-12-14'),
(18, 18, 3, '510.00', '2022-12-14'),
(19, 18, 5, '850.00', '2022-12-14'),
(20, 17, 5, '1750.00', '2022-12-14'),
(21, 20, 5, '7500.00', '2022-12-18'),
(22, 43, 1, '200.00', '2022-12-19'),
(23, 43, 2, '400.00', '2022-12-19'),
(24, 54, 4, '3200.00', '2022-12-19'),
(25, 28, 3, '690.00', '2022-12-20'),
(26, 56, 15, '900.00', '2022-12-20'),
(27, 31, 13, '520.00', '2023-04-17'),
(28, 14, 25, '2250.00', '2023-04-25'),
(29, 14, 26, '2340.00', '2023-04-25'),
(30, 14, 25, '2250.00', '2023-04-25'),
(31, 14, 26, '2340.00', '2023-04-25'),
(32, 18, 35, '3850.00', '2023-04-30'),
(33, 18, 1, '110.00', '2023-04-30'),
(34, 14, 51, '4590.00', '2023-04-30'),
(35, 18, 2, '220.00', '2023-04-30'),
(36, 17, 36, '2160.00', '2023-04-30'),
(37, 16, 16, '1920.00', '2023-04-30'),
(38, 28, 22, '5060.00', '2023-04-30'),
(39, 31, 20, '800.00', '2023-04-30'),
(40, 31, 20, '800.00', '2023-04-30'),
(41, 14, 6, '540.00', '2023-04-30'),
(42, 14, 6, '540.00', '2023-04-30'),
(43, 14, 7, '630.00', '2023-04-30'),
(44, 14, 4, '360.00', '2023-04-30'),
(45, 14, 3, '270.00', '2023-04-30'),
(46, 14, 4, '360.00', '2023-04-30'),
(47, 14, 3, '270.00', '2023-04-30'),
(48, 14, 5, '450.00', '2023-04-30'),
(49, 14, 2, '180.00', '2023-04-30'),
(50, 14, 4, '360.00', '2023-04-30'),
(51, 56, 3, '180.00', '2023-05-01'),
(52, 14, 1, '90.00', '2023-05-01'),
(53, 14, 1, '90.00', '2023-05-01'),
(54, 14, 1, '90.00', '2023-05-01'),
(55, 14, 3, '270.00', '2023-05-01'),
(56, 14, 3, '270.00', '2023-05-01'),
(57, 14, 3, '270.00', '2023-05-01'),
(58, 14, 5, '450.00', '2023-05-01'),
(60, 14, 0, '0.00', '2023-05-01'),
(61, 14, 2, '180.00', '2023-05-01'),
(62, 14, 4, '360.00', '2023-05-01'),
(63, 14, 4, '360.00', '2023-05-01'),
(64, 14, 4, '360.00', '2023-05-01'),
(65, 14, 4, '360.00', '2023-05-01'),
(66, 14, 4, '360.00', '2023-05-01'),
(67, 14, 4, '360.00', '2023-05-01'),
(68, 14, 4, '360.00', '2023-05-01'),
(69, 14, 4, '360.00', '2023-05-01'),
(70, 14, 5, '450.00', '2023-05-01'),
(71, 14, 5, '450.00', '2023-05-01'),
(72, 14, 4, '360.00', '2023-05-01'),
(73, 14, 1, '90.00', '2023-05-01'),
(74, 14, 4, '360.00', '2023-05-01'),
(75, 14, 2, '180.00', '2023-05-01'),
(76, 14, 6, '540.00', '2023-05-01'),
(77, 16, 1, '120.00', '2023-05-01'),
(78, 14, 2, '180.00', '2023-05-02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.jpg',
  `status` int(1) NOT NULL,
  `verify` int(11) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_level`, `image`, `status`, `verify`, `last_login`) VALUES
(3, 'Andrei Kevin', 'kevincasoco', '8cb2237d0679ca88db6464eac60da96345513964', 1, 'l61s4oqx3.jpg', 1, 0, '2023-04-17 18:30:05'),
(37, 'Andrei Kevin', 'andreikevincasoco@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 1, 'xfgj137b37.jpg', 1, 0, '2023-05-02 02:45:18'),
(38, 'Carlo Delos Santos', 'jcads4209@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 1, 'no_image.jpg', 1, 0, '2023-04-25 08:31:28'),
(51, 'ASDAA', 'kevs404official@gmail.com', 'b0399d2029f64d445bd131ffaa399a42d2f8e7dc', 1, 'no_image.jpg', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `group_level` int(11) NOT NULL,
  `group_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `group_name`, `group_level`, `group_status`) VALUES
(1, 'Admin', 1, 1),
(2, 'special', 2, 1),
(3, 'User', 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `categorie_id` (`categorie_id`),
  ADD KEY `media_id` (`media_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_level` (`user_level`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_level` (`group_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `SK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_level`) REFERENCES `user_groups` (`group_level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
