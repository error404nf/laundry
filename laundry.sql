

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
--
-- Database: `laundry`
--

--

CREATE TABLE `laundry` (
  `laun_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `laun_priority` int(11) NOT NULL,
  `laun_weight` int(11) NOT NULL,
  `laun_date_received` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `laun_claimed` tinyint(4) NOT NULL DEFAULT '0',
  `laun_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--

INSERT INTO `laundry` (`laun_id`, `customer_name`, `laun_priority`, `laun_weight`, `laun_date_received`, `laun_claimed`, `laun_type_id`) VALUES
(7, 'Ashish', 7, 3, '2017-03-19 22:38:02', 1, 1),
(9, 'Kumar', 3, 2, '2017-03-19 22:43:23', 1, 1),
(10, 'John', 1, 2, '2017-03-19 22:43:23', 1, 2),
(11, 'Jimmy', 7, 3, '2017-03-19 23:53:36', 1, 1),
(12, 'Sonal', 2, 2, '2017-03-22 16:14:48', 1, 2),
(13, 'Kumar', 4, 10, '2017-03-22 16:15:33', 1, 1),
(14, 'Ram', 2, 2, '2017-04-18 03:59:57', 0, 1);

-- --------------------------------------------------------

--

--

CREATE TABLE `laundry_type` (
  `laun_type_id` int(11) NOT NULL,
  `laun_type_desc` varchar(50) NOT NULL,
  `laun_type_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--

--

INSERT INTO `laundry_type` (`laun_type_id`, `laun_type_desc`, `laun_type_price`) VALUES
(1, 'Blanket', 20),
(2, 'Clothes', 30);

-- --------------------------------------------------------

--

--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `sale_customer_name` varchar(100) NOT NULL,
  `sale_type_desc` varchar(50) NOT NULL,
  `sale_date_paid` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sale_laundry_received` datetime NOT NULL,
  `sale_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--

--

INSERT INTO `sales` (`sale_id`, `sale_customer_name`, `sale_type_desc`, `sale_date_paid`, `sale_laundry_received`, `sale_amount`) VALUES
(1, 'Ram', 'Blanket', '2017-03-18 22:38:02', '2017-03-20 00:00:00', 60),
(2, 'Kumar', 'Clothes', '2017-03-19 22:43:23', '2017-03-20 06:43:16', 60),
(3, 'Sonal', 'Blanket', '2017-03-19 22:43:23', '2017-03-20 06:42:58', 40),
(4, 'Kumar', 'Blanket', '2017-03-19 23:53:36', '2017-03-20 07:53:27', 60),
(5, 'John', 'Clothes', '2017-03-22 16:14:47', '2017-03-23 00:14:40', 60),
(6, 'Jimmy', 'Blanket', '2017-03-22 16:15:33', '2017-03-23 00:15:28', 200);

-- --------------------------------------------------------

--

--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_account` varchar(50) NOT NULL,
  `user_password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--

--

INSERT INTO `user` (`user_id`, `user_account`, `user_password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `laundry`
--
ALTER TABLE `laundry`
  ADD PRIMARY KEY (`laun_id`),
  ADD KEY `laun_type_id` (`laun_type_id`);

--
-- Indexes for table `laundry_type`
--
ALTER TABLE `laundry_type`
  ADD PRIMARY KEY (`laun_type_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `laundry`
--
ALTER TABLE `laundry`
  MODIFY `laun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `laundry_type`
--
ALTER TABLE `laundry_type`
  MODIFY `laun_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `laundry`
--
ALTER TABLE `laundry`
  ADD CONSTRAINT `laundry_ibfk_1` FOREIGN KEY (`laun_type_id`) REFERENCES `laundry_type` (`laun_type_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
