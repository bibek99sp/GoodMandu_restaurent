-- phpMyAdmin SQL Dump

-- version 5.1.3

-- https://www.phpmyadmin.net/

--

-- Host: 127.0.0.1

-- Generation Time: Jun 12, 2023 at 10:46 AM

-- Server version: 10.4.22-MariaDB

-- PHP Version: 7.4.28

DROP DATABASE IF EXISTS `maher`;

CREATE DATABASE
    IF NOT EXISTS `maher` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;

USE `maher`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */

;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */

;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */

;

/*!40101 SET NAMES utf8mb4 */

;

--

-- Database: `maher`

--

-- --------------------------------------------------------

--

-- Table structure for table `addcart`

--

CREATE TABLE
    `addcart` (
        `id` bigint(12) NOT NULL,
        `p_id` bigint(12) NOT NULL,
        `u_id` varchar(50) NOT NULL,
        `price` bigint(12) NOT NULL,
        `qty` bigint(12) NOT NULL,
        `total` bigint(12) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--

-- Dumping data for table `addcart`

--

INSERT INTO
    `addcart` (
        `id`,
        `p_id`,
        `u_id`,
        `price`,
        `qty`,
        `total`
    )
VALUES (22, 40, 'abcd', 200, 1, 200);

-- --------------------------------------------------------

--

-- Table structure for table `admin`

--

CREATE TABLE
    `admin` (
        `adminid` varchar(50) NOT NULL,
        `password` varchar(50) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--

-- Dumping data for table `admin`

--

INSERT INTO
    `admin` (`adminid`, `password`)
VALUES ('admin', 'admin');

-- --------------------------------------------------------

--

-- Table structure for table `checkout`

--

CREATE TABLE
    `checkout` (
        `id` bigint(12) NOT NULL,
        `p_id` bigint(12) NOT NULL,
        `u_id` varchar(50) NOT NULL,
        `name` varchar(100) NOT NULL,
        `mobile` bigint(12) NOT NULL,
        `email` varchar(150) NOT NULL,
        `location` text NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--

-- Dumping data for table `checkout`

--

INSERT INTO
    `checkout` (
        `id`,
        `p_id`,
        `u_id`,
        `name`,
        `mobile`,
        `email`,
        `location`
    )
VALUES (
        88,
        38,
        'abcd',
        'samir',
        9818453551,
        'samirdotel1234@gmail.com',
        'Balaju'
    ), (
        89,
        40,
        'abcd',
        'samir',
        9818453551,
        'samirdotel1234@gmail.com',
        'Balaju'
    );

-- --------------------------------------------------------

--

-- Table structure for table `food_cat`

--

CREATE TABLE
    `food_cat` (
        `id` bigint(12) NOT NULL,
        `catnm` varchar(100) NOT NULL,
        `sub_cat` varchar(120) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--

-- Dumping data for table `food_cat`

--

INSERT INTO
    `food_cat` (`id`, `catnm`, `sub_cat`)
VALUES (
        72,
        'kathiyawadi',
        'Chicken Momo'
    ), (73, 'kathiyawadi', 'Veg Momo'), (74, 'kathiyawadi', 'Buff Momo'), (
        75,
        'kathiyawadi',
        'Fry Chicken Momo'
    ), (
        76,
        'kathiyawadi',
        'Fry Chicken C Momo'
    ), (
        77,
        'kathiyawadi',
        'Fry Buff Momo'
    ), (
        78,
        'rajsthani',
        'Chicken Chowmein'
    ), (83, 'rajsthani', 'Chop suey'), (84, 'rajsthani', 'Thupka'), (
        85,
        'rajsthani',
        'Buff Chowmein'
    ), (
        86,
        'rajsthani',
        'Veg Chowmein'
    ), (87, 'rise', 'Dal Bhat'), (88, 'rise', 'Chicken Dal Bhat'), (89, 'tava', 'Chicken Burger'), (90, 'tava', 'Buff Burger'), (91, 'kathiyawadi', 'Veg Momo');

-- --------------------------------------------------------

--

-- Table structure for table `food_parcel`

--

CREATE TABLE
    `food_parcel` (
        `id` bigint(12) NOT NULL,
        `name` varchar(100) NOT NULL,
        `mobile` bigint(12) NOT NULL,
        `email` varchar(150) NOT NULL,
        `address` text NOT NULL,
        `food_id` bigint(10) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- --------------------------------------------------------

--

-- Table structure for table `gallery`

--

CREATE TABLE
    `gallery` (
        `id` bigint(12) NOT NULL,
        `image` text NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--

-- Dumping data for table `gallery`

--

INSERT INTO
    `gallery` (`id`, `image`)
VALUES (8, 'img/thali.jpg'), (9, 'img/chines.jpg'), (10, 'img/abc.jpg');

-- --------------------------------------------------------

--

-- Table structure for table `menu`

--

CREATE TABLE
    `menu` (
        `id` bigint(12) NOT NULL,
        `category` varchar(100) NOT NULL,
        `sub_cat` varchar(120) NOT NULL,
        `title` varchar(100) NOT NULL,
        `description` text NOT NULL,
        `price` bigint(6) NOT NULL,
        `image` text NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--

-- Dumping data for table `menu`

--

INSERT INTO
    `menu` (
        `id`,
        `category`,
        `sub_cat`,
        `title`,
        `description`,
        `price`,
        `image`
    )
VALUES (
        35,
        'Momo',
        'Chicken Momo',
        'Chicken Momo',
        'Juicy Chicken Momo',
        150,
        'mimg/chicken-momo.jpg'
    ), (
        36,
        'Momo',
        'Veg Momo',
        'Veg Momo',
        'Vegetable Momo',
        100,
        'mimg/veg-momo.png'
    ), (
        37,
        'Momo',
        'Buff Momo',
        'Buff Momo',
        'Buff Momo',
        125,
        'mimg/buffmomo.jpg'
    ), (
        38,
        'Chowmein',
        'Chicken Chowmein',
        'Chicken Chowmein',
        'Chicken Chowmein',
        150,
        'mimg/chickenchowmein.jpg'
    ), (
        39,
        'Chowmein',
        'Thupka',
        'Thupka',
        'Thupka',
        150,
        'mimg/ThukpaI.jpg'
    ), (
        40,
        'Dal Bhat',
        'Dal Bhat',
        'Sada Dal bhat',
        'Sada Dal Bhat',
        200,
        'mimg/DalBhat.jpg'
    ), (
        41,
        'Dal Bhat',
        'Chicken Dal Bhat',
        'Chicken Dal Bhat',
        'Chicken Dal Bhat',
        250,
        'mimg/ChickenDalbhat.jpg'
    ), (
        42,
        'Burger',
        'Chicken Burger',
        'Chicken Burger',
        'Chicken Burger',
        250,
        'mimg/Chicken-Burgers-5.jpg'
    ), (
        43,
        'Burger',
        'Buff Burger',
        'Buff Burger',
        'Buff Burger',
        220,
        'mimg/Buffberger.jpg'
    ), (
        44,
        'rise',
        'Chicken Dal Bhat',
        'Dal Bhat special',
        'one of the Kind of special nepalese dal bhat',
        300,
        'mimg/blog-img-02.jpg'
    ), (
        45,
        'rise',
        'Chicken Dal Bhat',
        'aalu',
        'aalu',
        12,
        'mimg/avt-img.jpg'
    );

-- --------------------------------------------------------

--

-- Table structure for table `registration`

--

CREATE TABLE
    `registration` (
        `id` bigint(12) NOT NULL,
        `userid` varchar(50) NOT NULL,
        `password` varchar(50) NOT NULL,
        `email` varchar(150) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--

-- Dumping data for table `registration`

--

INSERT INTO
    `registration` (
        `id`,
        `userid`,
        `password`,
        `email`
    )
VALUES (
        1,
        'abcd',
        'xyz',
        'abc@yahoo.com'
    ), (2, 'aa', 'bb', 'cc@y.com'), (
        3,
        'nilkanth',
        'nilkanth',
        'aaabb@y.com'
    ), (
        4,
        'bibek',
        'bibek',
        'bibek@yahoo.com'
    ), (
        5,
        'abcde',
        'asdf',
        'abc@yahoo.com'
    );

-- --------------------------------------------------------

--

-- Table structure for table `review`

--

CREATE TABLE
    `review` (
        `id` bigint(12) NOT NULL,
        `name` varchar(100) NOT NULL,
        `review` varchar(100) NOT NULL,
        `description` text NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--

-- Dumping data for table `review`

--

INSERT INTO
    `review` (
        `id`,
        `name`,
        `review`,
        `description`
    )
VALUES (
        7,
        'Samir',
        'Exellent',
        'Nice restaurant'
    ), (8, 'Ram', 'Good', 'Nice Place'), (
        9,
        'Hari',
        'Exellent',
        'Good Foods'
    );




-- Indexes for dumped tables

--

--

-- Indexes for table `addcart`

--

ALTER TABLE `addcart` ADD PRIMARY KEY (`id`);

--

-- Indexes for table `admin`

--

ALTER TABLE `admin` ADD PRIMARY KEY (`adminid`);

--

-- Indexes for table `checkout`

--

ALTER TABLE `checkout` ADD PRIMARY KEY (`id`);

--

-- Indexes for table `food_cat`

--

ALTER TABLE `food_cat` ADD PRIMARY KEY (`id`);

--

-- Indexes for table `gallery`

--

ALTER TABLE `gallery` ADD PRIMARY KEY (`id`);

--

-- Indexes for table `menu`

--

ALTER TABLE `menu` ADD PRIMARY KEY (`id`);

--

-- Indexes for table `registration`

--

ALTER TABLE `registration` ADD PRIMARY KEY (`id`);

--

-- Indexes for table `review`

--

ALTER TABLE `review` ADD PRIMARY KEY (`id`);

--

-- AUTO_INCREMENT for dumped tables

--

--

-- AUTO_INCREMENT for table `addcart`

--

ALTER TABLE
    `addcart` MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 23;

--

-- AUTO_INCREMENT for table `checkout`

--

ALTER TABLE
    `checkout` MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 90;

--

-- AUTO_INCREMENT for table `food_cat`

--

ALTER TABLE
    `food_cat` MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 92;

--

-- AUTO_INCREMENT for table `gallery`

--

ALTER TABLE
    `gallery` MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 11;

--

-- AUTO_INCREMENT for table `menu`

--

ALTER TABLE
    `menu` MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 46;

--

-- AUTO_INCREMENT for table `registration`

--

ALTER TABLE
    `registration` MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 6;

--

-- AUTO_INCREMENT for table `review`

--

ALTER TABLE
    `review` MODIFY `id` bigint(12) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 10;

CREATE TABLE ratings (
    id bigint(12) NOT NULL AUTO_INCREMENT,
    userid bigint(12) NOT NULL,
    pid bigint(12) NOT NULL,
    rating INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (userid) REFERENCES registration(id),
    FOREIGN KEY (pid) REFERENCES menu(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET @sql = NULL;
SELECT GROUP_CONCAT(
    DISTINCT CONCAT(
      'COALESCE(MAX(IFNULL(CASE WHEN u.id = ',
      id,
      ' THEN r.rating END, 0)), 0) AS `',
      userid,
      '`'
    )
  ) INTO @sql
FROM registration;

SET @sql = CONCAT(
    'CREATE OR REPLACE VIEW product_ratings_view_no_book_name AS
SELECT ',
    @sql,
    '
FROM menu p
LEFT JOIN ratings r ON p.id = r.pid
LEFT JOIN registration u ON r.userid = u.id
GROUP BY p.id'
  );

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
-- RATING TABLE

-- Userid, productid, rating

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */

;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */

;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */

;