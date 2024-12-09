
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `amazon_sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `date_awarded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Sample data for `awards`
INSERT INTO `awards` (`id`, `name`, `description`, `date_awarded`) VALUES
(1, 'Employee of the Month', 'Awarded for outstanding performance in September', '2024-09-30'),
(2, 'Top Seller', 'Awarded for highest sales in Q3', '2024-10-15');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Sample data for `contacts`
INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `message`, `created_at`) VALUES
(1, 'John Doe', 'john.doe@example.com', '123-456-7890', 'Inquiry about product availability.', '2024-09-15 10:30:00'),
(2, 'Jane Smith', 'jane.smith@example.com', '987-654-3210', 'Request for support regarding order #1024.', '2024-10-01 14:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `contact_request`
--

CREATE TABLE `contact_request` (
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `date_submitted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Sample data for `contact_request`
INSERT INTO `contact_request` (`request_id`, `user_id`, `message`, `date_submitted`) VALUES
(1, 1, 'I need assistance with my recent order.', '2024-09-20'),
(2, 2, 'How can I reset my password?', '2024-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Sample data for `items`
INSERT INTO `items` (`id`, `name`, `description`, `price`, `stock`, `created_at`) VALUES
(1, 'Wireless Mouse', 'Ergonomic wireless mouse with USB receiver.', 25.99, 100, '2024-09-10 09:00:00'),
(2, 'Mechanical Keyboard', 'RGB backlit mechanical keyboard with blue switches.', 79.99, 50, '2024-09-12 11:30:00'),
(3, 'USB-C Hub', '7-in-1 USB-C hub with HDMI and SD card reader.', 39.99, 200, '2024-09-15 13:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Sample data for `pages`
INSERT INTO `pages` (`id`, `title`, `content`) VALUES
(1, 'About Us', 'This is the About Us page content.'),
(2, 'Contact', 'This is the Contact page content.');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Sample data for `products`
INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `is_featured`) VALUES
(1, 'Mittens', 'Cold proof mitten', 2.34, 50, 0),
(2, 'Hat', 'Warm wool hat', 5.99, 100, 1),
(3, 'Scarf', 'Cozy winter scarf', 7.49, 75, 0);

--
-- AUTO_INCREMENT for tables
--

ALTER TABLE `awards` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `contacts` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `items` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
ALTER TABLE `pages` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `products` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

COMMIT;
