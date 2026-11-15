-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2026 at 10:42 AM
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
-- Database: `online_clearance_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrative_users`
--

CREATE TABLE `administrative_users` (
  `administrative_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrative_users`
--

INSERT INTO `administrative_users` (`administrative_id`, `name`, `department`, `email`, `password`) VALUES
(2, 'Library Officer', 'Library', 'library@gmail.com', '12345'),
(3, 'Accounts Officer', 'Accounts', 'accounts@gmail.com', '12345'),
(4, 'Hostel Officer', 'Hostel', 'hostel@gmail.com', '12345'),
(5, 'Gym Officer', 'Gym', 'gym@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `name`, `email`, `password`) VALUES
(1, 'Admin', 'admin@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `clearance_requests`
--

CREATE TABLE `clearance_requests` (
  `request_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `comment` text DEFAULT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `clearance_type` varchar(100) DEFAULT 'Final Clearance',
  `department` varchar(100) DEFAULT 'All Departments',
  `reason` text DEFAULT NULL,
  `is_emergency` varchar(20) DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clearance_requests`
--

INSERT INTO `clearance_requests` (`request_id`, `student_id`, `status`, `comment`, `request_date`, `clearance_type`, `department`, `reason`, `is_emergency`) VALUES
(1, 1, 'Approved', 'okay', '2026-06-10 16:15:39', 'Final Clearance', 'All Departments', NULL, 'No'),
(2, 1, 'Pending', 'Waiting for review', '2026-06-11 15:00:10', 'Department Clearance', 'Library', 'approve this', 'No'),
(3, 1, 'Pending', 'Waiting for review', '2026-06-11 15:01:12', 'Emergency Clearance', 'Accounts', 'Need urgent clearance for job interview', 'Yes'),
(4, 1, 'Approved', '', '2026-06-11 15:18:15', 'MOI Certificate', 'Administration', 'for higher studies', 'No'),
(5, 2, 'Approved', '', '2026-06-11 18:04:04', 'Department Clearance', 'Library', 'cleared', 'No'),
(6, 2, 'Approved', '', '2026-06-11 18:08:32', 'Department Clearance', 'Accounts', 'clear', 'No'),
(7, 1, 'Approved', '', '2026-06-11 18:35:33', 'Department Clearance', 'Gym', 'approve this', 'No'),
(8, 2, 'Approved', 'okay', '2026-06-11 18:36:01', 'Department Clearance', 'Hall/Hostel', 'cleared', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `document_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `document_name` varchar(100) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `comment` text DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`document_id`, `student_id`, `document_name`, `file_name`, `status`, `comment`, `uploaded_at`) VALUES
(1, 1, 'Library Clearance', '1781107422_d2A.png', 'Rejected', '', '2026-06-10 16:03:42'),
(2, 1, 'Library Clearance', '1781107705_2.png', 'Approved', 'all ok', '2026-06-10 16:08:25'),
(3, 1, 'Library Clearance', '1781108978_d2A.png', 'Rejected', 'ok', '2026-06-10 16:29:38'),
(4, 1, 'Accounts Clearance', '1781115535_s6B.png', 'Pending', 'Waiting for review', '2026-06-10 18:18:55'),
(5, 1, 'Hall Clearance', '1781117933_s7B.png', 'Pending', 'Waiting for review', '2026-06-10 18:58:53'),
(6, 1, 'ID Card Copy', '1781119918_a2.png', 'Pending', 'Waiting for review', '2026-06-10 19:31:58');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `roll` varchar(50) NOT NULL,
  `department` varchar(100) NOT NULL,
  `batch` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `roll`, `department`, `batch`, `email`, `password`, `created_at`) VALUES
(1, 'Maliha Tasnim', '0112320', 'CSE', '232', 'maliha@gmail.com', '0987', '2026-06-10 15:55:44'),
(2, 'Fahad Ahammed', '01123201', 'CSE', '232', 'fahad@gmail.com', '12345', '2026-06-11 18:03:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrative_users`
--
ALTER TABLE `administrative_users`
  ADD PRIMARY KEY (`administrative_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `clearance_requests`
--
ALTER TABLE `clearance_requests`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrative_users`
--
ALTER TABLE `administrative_users`
  MODIFY `administrative_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clearance_requests`
--
ALTER TABLE `clearance_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
