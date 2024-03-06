-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2024 at 08:22 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_py`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `tipe` varchar(100) NOT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status` enum('Konfirmasi','Booking','Leave') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `nama`, `email`, `phone`, `tipe`, `checkin`, `checkout`, `jumlah`, `keterangan`, `status`) VALUES
(1, 'budi', 'budi@gmail.com', '0383737', 'Deluxe Room', '2024-02-16', '2024-02-17', 2, 'makanannya harus enak', 'Booking'),
(2, 'joko', 'joko@gmail.com', '0282874678', 'Single Room', '2024-02-20', '2024-02-21', 2, 'makan makan', 'Konfirmasi'),
(3, 'ind', 'inda@gmail.com', '932737', 'Superior Room', '2024-02-14', '2024-02-13', 2, 'lsmdl', 'Konfirmasi'),
(4, 'nie', 'nie@hi.com', '09387393', 'Single Room', '2024-02-15', '2024-02-16', 1, 'kdnkdk', 'Konfirmasi'),
(5, 'ki', 'ki@gmail.com', '90387398', 'Single Room', '2024-02-15', '2024-02-16', 2, 'lsojsj', 'Booking'),
(6, 'kiki', 'kiki@mui.com', '03483458', 'Superior Room', '2024-02-17', '2024-02-19', 1, ';lskdjknsdk', 'Booking'),
(11, 'Afandi', 'afandi@gmail.com', '949489484', 'Superior Room', '2024-02-19', '2024-02-20', 1, 'Makanannmya yang enak', 'Booking'),
(12, 'era', 'era@gmail.com', '99998', 'Single Room', '2024-02-16', '2024-02-17', 1, 'ACnya yang dingin ya', 'Booking'),
(14, 'Budi', 'budi@gmail.com', '0819336737`', 'Superior Room', '2024-03-08', '2024-03-08', 2, 'Yang Double bad ya', NULL),
(16, 'Budi', 'budi@gmail.com', '086454546', 'Deluxe Room', '2024-03-07', '2024-03-08', 2, 'Yang ada kulkas besar', NULL),
(17, 'Budi', 'budi@gmail.com', '083633635', 'Superior Room', '2024-03-14', '2024-03-15', 1, 'AC, Kulkas', NULL),
(18, 'nini', 'nini@gmail.com', '08746446', 'Deluxe Room', '2024-03-14', '2024-03-15', 2, 'Ac yang dingin', 'Konfirmasi');

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id`, `nama`, `harga`, `keterangan`, `gambar`) VALUES
(4, 'Standard Room', '450000', 'Tempat tidur\r\nAC\r\nSmart TV, \r\nBathroom\r\nAir minum', 'standar_room.jpg'),
(5, 'Superior Room', '500000', 'Tempat tidur\r\nAC\r\nSmart TV\r\nBath room\r\nAir minum\r\nTwin Bed/ Double Bed', 'Superior_Room.jpg'),
(6, 'Deluxe Room', '600000', 'Tempat tidur \r\nAC \r\nSmart TV \r\nBath room \r\nAir minum \r\nTwin Bed/ Double Bed\r\nKulkas Mini', 'Deluxe_Room.jpg'),
(7, 'Junior Suite Room', '750005', 'Tempat tidur \r\nAC \r\nSmart TV \r\nBath room Air minum \r\nTwin Bed/ Double Bed \r\nKulkas Mini\r\nRuang Tamu', 'Junior_Suite_Room.jpg'),
(8, 'Suite Room', '900000', 'Tempat tidur \r\nAC \r\nSmart TV \r\nBath room \r\nAir minum Twin Bed/ Double Bed \r\nKulkas Mini \r\nRuang Tamu, dapur', 'Suite_Room.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id` int(10) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `komentar_p` varchar(255) DEFAULT NULL,
  `date_p` datetime DEFAULT NULL,
  `namaadmin` varchar(255) DEFAULT NULL,
  `komentar_a` varchar(255) DEFAULT NULL,
  `date_a` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `email`, `nama`, `komentar_p`, `date_p`, `namaadmin`, `komentar_a`, `date_a`) VALUES
(1, 'budi@gmail.com', 'budi', 'Hotel nya rame, kamarnya bersih', '2024-03-05 07:58:34', NULL, NULL, NULL),
(2, 'budi@gmail.com', 'Budi', 'Kamarnya besih dan Luas sekali', '2024-03-06 00:03:28', NULL, NULL, NULL),
(4, 'budi@gmail.com', 'Budi', 'Hotel nya bersih', '2024-03-06 22:14:52', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `level` enum('Admin','Pelanggan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `level`) VALUES
(1, 'admin', 'scrypt:32768:8:1$dAHCFPcFCcOlLncw$3a7e8dbba6a088e770f2318c4e054d0cbc6e83654c0072e99dee8e8c4f8a22defd2ecc2f1e2f8c0f2a715199a6c7ae2f2d96ce2186f9bed1f44ef0d78d8eaead', 'admin@gmail.com', 'Admin'),
(3, 'joko', 'scrypt:32768:8:1$soIF6qiMza7yaKjQ$d3c0fc395f981f0f064aed7c16dda93f3f66c8f121c5b6691a21dd3693c066857f784160b17530b934cd306ec0cc1ea172e37421f67d896b7dc935b5a9ce5dbb', 'joko@hmi.clom', 'Pelanggan'),
(4, 'petugas', 'scrypt:32768:8:1$3G8Q9lo9crKquNu8$c5fe6f67e8de858af356cf4a39e491353ee04d227cf0efdd4c74cbe3a69e7f4569d9a750dedb1e3ca82f57a355f5910e9aacd7f4d619a14cfe8ac05bb7a6b34b', 'petugas@ji.com', 'Pelanggan'),
(5, 'huhu', 'scrypt:32768:8:1$GTRfy6hTy51zapMT$84b8587ddd64a84c2c6492273ec16860b8e4b1d2a1865c7c1daa89aae36eaf75a6f566f44135f1ba36356e9d77514b60330e1d1c16eaea1bdf11c06afa47fd21', 'huhu@gmail.com', 'Pelanggan'),
(8, 'Budi', 'scrypt:32768:8:1$yWPyc0X9gyGNjMKF$59f50403eaab4f68c4b63308457446272342c0fffb4295879ac27208013449d4c3c1cb304745b2572037dee95f4bbaadaca6844e9418403d590c6c65facb08de', 'budi@gmail.com', 'Pelanggan'),
(9, 'Moh. Afandi', 'scrypt:32768:8:1$MSEZbRkuDSAiEFgp$49ea0e38948f57908d0f1f8ed66a6c28c3d8f4d354e2c900f5dbc028daa0780aaf3fcd052b313d5fea48466bced18c2401c4e97b10b6b8dbe7a73cf2c77bd56d', 'fandi@gmail.com', 'Admin'),
(10, 'Budimantaro', 'scrypt:32768:8:1$w1HK5Wbx2hVurKLM$3b6e1db3de2140b67816ef2b432564ac81427e8c12f432ffeae46d4c8607912c7e2d8f3d43920329dbe4150f0bca44151a7200da59c383a62acc0a84c9588caf', 'budimntaro@gmail.com', 'Pelanggan'),
(11, 'indah', 'scrypt:32768:8:1$Q4QOUSyJouGqDHKL$ac0ce26f02f43a6b1d2e38669d41c91c092a92ca9c04862c54dae41265c0aaeaf2be2377f13cb4747c585b899e4cb2b5652596231ba4f1909c1899bf47c6d766', 'indah@gmail.com', 'Admin'),
(12, 'nini', 'scrypt:32768:8:1$0hKgCICGGAXGRwK9$a8137c082e8120e7ad735064b4b367c08828d60367d8a98f89fe8eb11a57596caad2ad834e0e3b581c3e1e4fc32b28f2b381987d3d80ff02827f266e31408649', 'nini@gmail.com', 'Pelanggan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
