-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 26 Ara 2019, 09:28:17
-- Sunucu sürümü: 10.4.8-MariaDB
-- PHP Sürümü: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `railway_reservation`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin_table`
--

CREATE TABLE `admin_table` (
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `admin_table`
--

INSERT INTO `admin_table` (`user_name`, `password`) VALUES
('ahmet', '827ccb0eea8a706c4c34a16891f84e7b'),
('mert', 'dbc4d84bfcfe2284ba11beffb853a8c4');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `train_id` int(11) NOT NULL,
  `stop_number` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `arrival_time` time NOT NULL,
  `departure_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `routes`
--

INSERT INTO `routes` (`id`, `train_id`, `stop_number`, `station_id`, `arrival_time`, `departure_time`) VALUES
(1, 40, 5, 5, '24:00:00', '16:55:00'),
(2, 45, 2, 2, '02:45:30', '08:12:45'),
(3, 41, 3, 6, '02:10:06', '14:00:00'),
(4, 44, 8, 8, '00:15:00', '17:00:00'),
(5, 50, 1, 1, '05:00:00', '14:00:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `station`
--

CREATE TABLE `station` (
  `staion_id` int(11) NOT NULL,
  `station_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `station`
--

INSERT INTO `station` (`staion_id`, `station_name`) VALUES
(1, 'izmir'),
(2, 'kütahya'),
(3, 'adana'),
(4, 'ankara'),
(5, 'kars'),
(6, 'konya'),
(7, 'buca'),
(8, 'konak'),
(9, 'denizli');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tickets`
--

CREATE TABLE `tickets` (
  `pnr` int(11) NOT NULL,
  `passenger_name` varchar(255) NOT NULL,
  `train_id` int(11) NOT NULL,
  `no_of_seats` int(11) NOT NULL,
  `train_status` varchar(100) NOT NULL,
  `booking_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `tickets`
--

INSERT INTO `tickets` (`pnr`, `passenger_name`, `train_id`, `no_of_seats`, `train_status`, `booking_date`) VALUES
(537472, 'mehmet', 44, 1, 'confirm', '0000-00-00 00:00:00'),
(693857, 'mert', 41, 2, 'confirm', '2016-12-10 00:00:00'),
(2147483647, 'ali', 45, 2, 'confirm', '2016-04-01 00:00:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `trains`
--

CREATE TABLE `trains` (
  `id` int(11) NOT NULL,
  `train_id` int(11) NOT NULL,
  `train_name` varchar(255) NOT NULL,
  `train_type` varchar(255) NOT NULL,
  `source_stn` varchar(255) NOT NULL,
  `destination_stn` varchar(255) NOT NULL,
  `source_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `trains`
--

INSERT INTO `trains` (`id`, `train_id`, `train_name`, `train_type`, `source_stn`, `destination_stn`, `source_id`, `destination_id`) VALUES
(1, 41, 'Toros Ekspress', 'Express', 'Konya', 'Adana', 6, 3),
(2, 45, 'Izmir-Denizli', 'Normal', 'Izmir', 'Denizli', 1, 9),
(3, 44, 'DEU Ekspress', 'Express', 'Buca', 'Konak', 7, 8),
(4, 40, 'Dogu Ekspress', 'Economic', 'Ankara', 'Kars', 4, 5),
(5, 50, 'Ankara-Izmir', 'Normal', 'Ankara', 'Izmir', 4, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `train_status`
--

CREATE TABLE `train_status` (
  `id` int(11) NOT NULL,
  `train_id` int(11) NOT NULL,
  `available_date` date NOT NULL,
  `booked_seats` int(11) NOT NULL,
  `available_seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `train_status`
--

INSERT INTO `train_status` (`id`, `train_id`, `available_date`, `booked_seats`, `available_seats`) VALUES
(1, 41, '2019-12-24', 100, 5),
(3, 44, '2019-12-18', 200, 10),
(5, 45, '2019-12-05', 2, 2),
(8, 50, '2019-12-21', 0, 40);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_log`
--

CREATE TABLE `user_log` (
  `log_id` int(11) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `mobile` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `changedat` datetime NOT NULL,
  `action` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `user_log`
--

INSERT INTO `user_log` (`log_id`, `email_id`, `password`, `fullname`, `gender`, `age`, `mobile`, `city`, `state`, `changedat`, `action`) VALUES
(1, 'mert@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'mert', 'M', 22, 2147483647, 'izmir', 'izmir', '2019-12-25 23:22:03', 'update'),
(2, 'dad@hotmail.com', '202cb962ac59075b964b07152d234b70', 'daddad', 'M', 45, 2147483647, 'antalya', 'izmir', '2019-12-25 23:36:23', 'insert');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_table`
--

CREATE TABLE `user_table` (
  `id` int(11) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `mobile` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `user_table`
--

INSERT INTO `user_table` (`id`, `email_id`, `password`, `fullname`, `gender`, `age`, `mobile`, `city`, `state`) VALUES
(12, 'mert@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'mert', 'M', 23, 2147483647, 'izmir', 'izmir'),
(13, 'atakan@hotmail.com', '96e79218965eb72c92a549dd5a330112', 'atakanarda', 'M', 22, 2147483647, 'izmir', 'izmir'),
(15, 'mehmetd@gmail.com', '93279e3308bdbbeed946fc965017f67a', 'mehmetd', 'M', 21, 2147483647, 'izmir', 'izmir'),
(16, 'dad@hotmail.com', '202cb962ac59075b964b07152d234b70', 'daddad', 'M', 45, 2147483647, 'antalya', 'izmir');

--
-- Tetikleyiciler `user_table`
--
DELIMITER $$
CREATE TRIGGER `after_user_table_update` AFTER INSERT ON `user_table` FOR EACH ROW INSERT INTO user_log
 SET action = 'insert',
     email_id = NEW.email_id,
     password= NEW.password,
     fullname=NEW.fullname,
     age = NEW.age,
     gender=NEW.gender,
     mobile=NEW.mobile,
     city=NEW.city,
     state=NEW.state,
     changedat = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_user_table_update` BEFORE UPDATE ON `user_table` FOR EACH ROW INSERT INTO user_log
 SET action = 'update',
     email_id = OLD.email_id,
     password = OLD.password,
     fullname =	OLD.fullname,
     gender =	OLD.gender,
     age =	OLD.age,
     mobile =	OLD.mobile,
     city =	OLD.city,
     state =	OLD.state,
     changedat = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `view1`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `view1` (
`train_id` int(11)
,`train_name` varchar(255)
,`train_type` varchar(255)
,`source_stn` varchar(255)
,`destination_stn` varchar(255)
);

-- --------------------------------------------------------

--
-- Görünüm yapısı `view1`
--
DROP TABLE IF EXISTS `view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1`  AS  select `trains`.`train_id` AS `train_id`,`trains`.`train_name` AS `train_name`,`trains`.`train_type` AS `train_type`,`trains`.`source_stn` AS `source_stn`,`trains`.`destination_stn` AS `destination_stn` from `trains` ;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`user_name`);

--
-- Tablo için indeksler `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`staion_id`);

--
-- Tablo için indeksler `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`pnr`);

--
-- Tablo için indeksler `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `train_status`
--
ALTER TABLE `train_status`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `tickets`
--
ALTER TABLE `tickets`
  MODIFY `pnr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- Tablo için AUTO_INCREMENT değeri `trains`
--
ALTER TABLE `trains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `train_status`
--
ALTER TABLE `train_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `user_log`
--
ALTER TABLE `user_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `user_table`
--
ALTER TABLE `user_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
