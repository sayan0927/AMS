-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2022 at 05:40 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ams`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `admin_id` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `contact_no` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`first_name`, `last_name`, `admin_id`, `email`, `password`, `contact_no`, `address`) VALUES
('a', 'a', 'a', 'a@a.com', 'a', 'a', 'a'),
('sayan', 'paul', 'admin', 'sayanpaul0927@gmail.com', 'admin', '9163276862', 'kol');

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `applier_id` varchar(45) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `course_id` varchar(50) NOT NULL,
  `application_status` varchar(50) NOT NULL,
  `score` varchar(50) NOT NULL,
  `hostel_required` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`applier_id`, `first_name`, `last_name`, `email`, `contact`, `address`, `course_id`, `application_status`, `score`, `hostel_required`) VALUES
('arham', 'arham', 'arham', 'sayan_m210653ca@nitc.ac.in', '1', '1', 'MTECH-CSED', 'accepted', 'arham_scorecard.pdf', 'yes'),
('joel', 'joel', 'ralte', 'joel@gmail.com', '999', 'shimla', 'MTECH-ECED', 'pending', 'joel_scorecard.pdf', 'yes'),
('junaid', 'junaid', 'ansari', 'junaid@gmail.com', '999', 'uttarakhand', 'MCA', 'pending', 'junaid_scorecard.pdf', 'yes'),
('sayan', 'sayan', 'paul', 'sayanpaul0927@gmail.com', '9163276862', 'kolkata', 'MCA', 'pending', 'sayan_scorecard.pdf', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` varchar(50) NOT NULL,
  `course_level` varchar(50) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `offering_department` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_level`, `course_name`, `offering_department`) VALUES
('BTECH-CSED', 'Undergraduate', 'Btech in Computer Science Engineering', 'CSED'),
('BTECH-ECED', 'Undergraduate', 'Btech in Electronics And Communications Engineering', 'ECED'),
('MCA', 'Postgraduate', 'Master Of Computer Application', 'CSED'),
('MTECH-CSED', 'Postgraduate', 'Mtech in Computer Science Engineering', 'CSED'),
('MTECH-ECED', 'Postgraduate ', 'Mtech in Electronics And Communication Engineering ', 'ECED');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` varchar(50) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `hod_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `hod_id`) VALUES
('CSED', 'Computer Science And Engineering', '3'),
('ECED', 'Electronics And Communications Engineering', '4'),
('EED', 'Electrical Engineering', '5');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` varchar(50) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `department_id` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `firstname`, `lastname`, `email`, `contact`, `department_id`, `address`) VALUES
('1', 'Murali', 'Krishnan', 'murali', '999', 'CSED', 'calicut'),
('2', 'Jay', 'Raj', 'jay', '9', 'ECED', 'calicut'),
('3', 'Anu', 'Chacko', 'anu@gmail.com', '9', 'CSED', 'calicut'),
('4', 'K', 'Abdul Nazeer', 'kan@gmail.com', '9', 'ECED', 'calicut'),
('5', 'Jay ', 'Prakash', 'jay@gmail.com', '9', 'EED', 'kerala'),
('6', 'Lijiya', 'A', 'lijiya@gmail.com', '9', NULL, 'calicut'),
('7', 'Sudarshan', 'Chakra', 'sud@gmail.com', '1', NULL, 'c');

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `hostel_id` varchar(50) NOT NULL,
  `hostel_name` varchar(100) NOT NULL,
  `warden_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hostel`
--

INSERT INTO `hostel` (`hostel_id`, `hostel_name`, `warden_id`) VALUES
('a', 'A Hostel', '6'),
('b', 'B Hostel', '2'),
('mbh1', 'Mega Boys Hostel 1', '1'),
('mbh2', 'Mega Boys Hostel 2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `roll_name_conventions`
--

CREATE TABLE `roll_name_conventions` (
  `course_id` varchar(50) NOT NULL,
  `roll_prefix` varchar(50) NOT NULL,
  `roll_suffix` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roll_name_conventions`
--

INSERT INTO `roll_name_conventions` (`course_id`, `roll_prefix`, `roll_suffix`) VALUES
('BTECH-CSED', 'B', 'CS'),
('BTECH-ECED', 'B', 'EC'),
('MCA', 'M', 'CA'),
('MTECH-CSED', 'M', 'CS'),
('MTECH-ECED', 'M', 'EC');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `roll` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `pass` varchar(50) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `course_id` varchar(50) NOT NULL,
  `hostel_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`roll`, `first_name`, `last_name`, `email`, `contact`, `pass`, `address`, `course_id`, `hostel_id`) VALUES
('M220001CS', 'arham', 'arham', 'sayan_m210653ca@nitc.ac.in', '1', 'F0WpeJz4', '1', 'MTECH-CSED', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `contact_no` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `contact_no`, `address`) VALUES
('a', 'a', 'a', 'a@a.com', 'a', 'a', 'a'),
('arham', 'arham', 'arham', 'sayan_m210653ca@nitc.ac.in', 'arham', '1', '1'),
('deb', 'deb', 'deb', 'deb@deb.com', 'deb', 'deb', 'deb'),
('joel', 'joel', 'ralte', 'joel@gmail.com', 'joel', '999', 'shimla'),
('junaid', 'junaid', 'ansari', 'junaid@gmail.com', 'junaid', '999', 'uttarakhand'),
('sayan', 'sayan', 'paul', 'sayanpaul0927@gmail.com', 'sayan', '9163276862', 'kolkata'),
('subha', 'subha', 'subha', 's@p.com', 'subha', '991', '99');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`applier_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `offering_department` (`offering_department`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `department_ibfk_1` (`hod_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`hostel_id`),
  ADD KEY `warden_id` (`warden_id`);

--
-- Indexes for table `roll_name_conventions`
--
ALTER TABLE `roll_name_conventions`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`roll`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `hostel_id` (`hostel_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `application_ibfk_2` FOREIGN KEY (`applier_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`offering_department`) REFERENCES `department` (`department_id`) ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`hod_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `hostel`
--
ALTER TABLE `hostel`
  ADD CONSTRAINT `hostel_ibfk_1` FOREIGN KEY (`warden_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `roll_name_conventions`
--
ALTER TABLE `roll_name_conventions`
  ADD CONSTRAINT `roll_name_conventions_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`hostel_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
