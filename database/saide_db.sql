-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2021 at 07:26 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saide_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `ISBN_NO` varchar(100) DEFAULT NULL,
  `Book_Title` varchar(200) DEFAULT NULL,
  `Book_Type` int(10) UNSIGNED DEFAULT NULL,
  `Author_Name` varchar(100) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Purchase_Date` date DEFAULT NULL,
  `Edition` varchar(40) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT 0.00,
  `Pages` int(11) DEFAULT NULL,
  `Publisher` varchar(140) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `ISBN_NO`, `Book_Title`, `Book_Type`, `Author_Name`, `Quantity`, `Purchase_Date`, `Edition`, `Price`, `Pages`, `Publisher`) VALUES
(1, '100', 'กระต่ายกับแต่ว', 1, 'Dr.ปีใหม่', 33, '2018-02-24', '1', '300.00', 120, 'คอนโดหล่อเท่'),
(2, '101', 'ทีเร็กกับเจอรี่', 2, 'ทีเร็ก', 1, '2018-02-24', NULL, '800.00', 138, 'คอนโดของคนหล่อเท่');

-- --------------------------------------------------------

--
-- Table structure for table `book_issue`
--

CREATE TABLE `book_issue` (
  `id` int(10) UNSIGNED NOT NULL,
  `Member` int(10) UNSIGNED DEFAULT NULL,
  `Number` int(10) UNSIGNED DEFAULT NULL,
  `Book_Number` int(10) UNSIGNED DEFAULT NULL,
  `Book_Title` int(10) UNSIGNED DEFAULT NULL,
  `Issue_Date` date DEFAULT NULL,
  `Return_Date` date DEFAULT NULL,
  `Status` varchar(40) DEFAULT NULL,
  `issue_id` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_issue`
--

INSERT INTO `book_issue` (`id`, `Member`, `Number`, `Book_Number`, `Book_Title`, `Issue_Date`, `Return_Date`, `Status`, `issue_id`) VALUES
(1, 1, 1, 1, 1, '2021-03-13', '2021-03-14', 'returned', '1');

-- --------------------------------------------------------

--
-- Table structure for table `magazines`
--

CREATE TABLE `magazines` (
  `id` int(10) UNSIGNED NOT NULL,
  `Type` varchar(40) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Date_Of_Receipt` date DEFAULT NULL,
  `Date_Published` date DEFAULT NULL,
  `Pages` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT 0.00,
  `Publisher` varchar(140) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `membership_grouppermissions`
--

CREATE TABLE `membership_grouppermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `groupID` int(11) DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT 0,
  `allowEdit` tinyint(4) NOT NULL DEFAULT 0,
  `allowDelete` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_grouppermissions`
--

INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES
(1, 2, 'books', 1, 3, 3, 3),
(2, 2, 'NewsPapers', 1, 3, 3, 3),
(3, 2, 'Magazines', 1, 3, 3, 3),
(4, 2, 'Users', 1, 3, 3, 3),
(5, 2, 'Book_Issue', 1, 3, 3, 3),
(6, 2, 'Return_Book', 1, 3, 3, 3),
(7, 2, 'Types', 1, 3, 3, 3),
(8, 2, 'Return', 1, 3, 3, 3),
(30, 3, 'books', 0, 3, 0, 0),
(31, 3, 'NewsPapers', 0, 3, 0, 0),
(32, 3, 'Magazines', 0, 3, 0, 0),
(33, 3, 'Users', 0, 3, 0, 0),
(34, 3, 'Book_Issue', 0, 3, 0, 0),
(35, 3, 'Return_Book', 0, 3, 0, 0),
(36, 3, 'Types', 0, 3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `membership_groups`
--

CREATE TABLE `membership_groups` (
  `groupID` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `allowSignup` tinyint(4) DEFAULT NULL,
  `needsApproval` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_groups`
--

INSERT INTO `membership_groups` (`groupID`, `name`, `description`, `allowSignup`, `needsApproval`) VALUES
(1, 'anonymous', 'Anonymous group created automatically on 2018-02-24', 0, 0),
(2, 'Admins', 'Admin group created automatically on 2018-02-24', 0, 1),
(3, 'demo', 'demo users', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `membership_userpermissions`
--

CREATE TABLE `membership_userpermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `memberID` varchar(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT 0,
  `allowEdit` tinyint(4) NOT NULL DEFAULT 0,
  `allowDelete` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `membership_userrecords`
--

CREATE TABLE `membership_userrecords` (
  `recID` bigint(20) UNSIGNED NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `pkValue` varchar(255) DEFAULT NULL,
  `memberID` varchar(20) DEFAULT NULL,
  `dateAdded` bigint(20) UNSIGNED DEFAULT NULL,
  `dateUpdated` bigint(20) UNSIGNED DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_userrecords`
--

INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES
(1, 'Types', '1', 'admin', 1519466337, 1519466337, 2),
(2, 'Types', '2', 'admin', 1519466356, 1519466356, 2),
(3, 'Types', '3', 'admin', 1519466381, 1519466381, 2),
(4, 'books', '1', 'admin', 1519466456, 1519466456, 2),
(5, 'Users', '1', 'admin', 1519466500, 1519466500, 2),
(6, 'Book_Issue', '1', 'admin', 1519466549, 1615736623, 2),
(7, 'Return_Book', '1', 'admin', 1519466780, 1615738081, 2),
(8, 'Users', '2', 'admin', 1519468487, 1519468487, 2),
(9, 'books', '2', 'admin', 1519468656, 1519468656, 2),
(11, 'books', '3', 'admin', 1519479901, 1519479901, 2),
(12, 'NewsPapers', '1', 'admin', 1519479996, 1615738267, 2),
(16, 'Return_Book', '5', 'admin', 1615736515, 1615736531, 2),
(17, 'Users', '3', 'admin', 1615736566, 1615736578, 2);

-- --------------------------------------------------------

--
-- Table structure for table `membership_users`
--

CREATE TABLE `membership_users` (
  `memberID` varchar(20) NOT NULL,
  `passMD5` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  `groupID` int(10) UNSIGNED DEFAULT NULL,
  `isBanned` tinyint(4) DEFAULT NULL,
  `isApproved` tinyint(4) DEFAULT NULL,
  `custom1` text DEFAULT NULL,
  `custom2` text DEFAULT NULL,
  `custom3` text DEFAULT NULL,
  `custom4` text DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `pass_reset_key` varchar(100) DEFAULT NULL,
  `pass_reset_expiry` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_users`
--

INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', '2018-02-24', 2, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2018-02-24', NULL, NULL),
('demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'demo@demo.com', '2018-02-25', 3, 0, 1, 'demo user', 'demo', 'demo', 'demo', 'demo', NULL, NULL),
('guest', NULL, NULL, '2018-02-24', 1, 0, 1, NULL, NULL, NULL, NULL, 'Anonymous member created automatically on 2018-02-24', NULL, NULL),
('ronald', '02d62574863469f4f1ef99d8fc453a31', 'admin@admin.com', '2021-03-14', 2, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2021-03-14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `newspapers`
--

CREATE TABLE `newspapers` (
  `id` int(10) UNSIGNED NOT NULL,
  `Language` varchar(40) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Date_Of_Receipt` date DEFAULT NULL,
  `Date_Published` date DEFAULT NULL,
  `Pages` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT 0.00,
  `Type` varchar(40) DEFAULT NULL,
  `Publisher` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newspapers`
--

INSERT INTO `newspapers` (`id`, `Language`, `Name`, `Date_Of_Receipt`, `Date_Published`, `Pages`, `Price`, `Type`, `Publisher`) VALUES
(1, 'English', 'The Standard', '2021-03-01', '2021-03-03', 35, '100.00', 'newspaper', 'Standard Group Media');

-- --------------------------------------------------------

--
-- Table structure for table `return_book`
--

CREATE TABLE `return_book` (
  `id` int(10) UNSIGNED NOT NULL,
  `Book_Number` int(10) UNSIGNED DEFAULT NULL,
  `Book_Title` int(10) UNSIGNED DEFAULT NULL,
  `Issue_Date` date DEFAULT NULL,
  `Due_Date` int(10) UNSIGNED DEFAULT 1,
  `Return_Date` date DEFAULT NULL,
  `Member` int(10) UNSIGNED DEFAULT NULL,
  `Number` int(10) UNSIGNED DEFAULT NULL,
  `Fine` decimal(10,2) DEFAULT 0.00,
  `Status` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `return_book`
--

INSERT INTO `return_book` (`id`, `Book_Number`, `Book_Title`, `Issue_Date`, `Due_Date`, `Return_Date`, `Member`, `Number`, `Fine`, `Status`) VALUES
(1, 1, 1, '0000-00-00', 1, '2021-03-15', 1, 1, '50.00', 'cleared'),
(5, 1, 1, '0000-00-00', 1, '2021-03-14', 1, 1, '0.00', 'cleared');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `Name`) VALUES
(1, 'novel'),
(2, 'short stories'),
(3, 'science fiction');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `Membership_Number` varchar(40) DEFAULT NULL,
  `Name` varchar(140) DEFAULT NULL,
  `Contact` varchar(40) DEFAULT NULL,
  `ID_Number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Membership_Number`, `Name`, `Contact`, `ID_Number`) VALUES
(1, '16269', 'ธีระ', '0989503183', 16269),
(3, '12222', 'Trex', '191', 12222);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Book_Type` (`Book_Type`);

--
-- Indexes for table `book_issue`
--
ALTER TABLE `book_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Member` (`Member`),
  ADD KEY `Book_Number` (`Book_Number`);

--
-- Indexes for table `magazines`
--
ALTER TABLE `magazines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indexes for table `membership_groups`
--
ALTER TABLE `membership_groups`
  ADD PRIMARY KEY (`groupID`);

--
-- Indexes for table `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indexes for table `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  ADD PRIMARY KEY (`recID`),
  ADD UNIQUE KEY `tableName_pkValue` (`tableName`,`pkValue`),
  ADD KEY `pkValue` (`pkValue`),
  ADD KEY `tableName` (`tableName`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indexes for table `membership_users`
--
ALTER TABLE `membership_users`
  ADD PRIMARY KEY (`memberID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indexes for table `newspapers`
--
ALTER TABLE `newspapers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_book`
--
ALTER TABLE `return_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Book_Number` (`Book_Number`),
  ADD KEY `Member` (`Member`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
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
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `book_issue`
--
ALTER TABLE `book_issue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `magazines`
--
ALTER TABLE `magazines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  MODIFY `permissionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `membership_groups`
--
ALTER TABLE `membership_groups`
  MODIFY `groupID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  MODIFY `permissionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  MODIFY `recID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `newspapers`
--
ALTER TABLE `newspapers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `return_book`
--
ALTER TABLE `return_book`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
