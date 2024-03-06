/*
 Navicat Premium Data Transfer

 Source Server         : MySQL_Koneksi
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : hotel_py

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 06/03/2024 07:45:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipe` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` enum('Konfirmasi','Booking','Leave') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'budi', 'budi@gmail.com', '0383737', 'Deluxe Room', '2024-02-16', '2024-02-17', 1, 'makanannya harus enak', 'Booking');
INSERT INTO `customer` VALUES (2, 'joko', 'joko@gmail.com', '0282874678', 'Single Room', '2024-02-20', '2024-02-21', 2, 'makan makan', 'Konfirmasi');
INSERT INTO `customer` VALUES (3, 'ind', 'inda@gmail.com', '932737', 'Superior Room', '2024-02-14', '2024-02-13', 2, 'lsmdl', 'Konfirmasi');
INSERT INTO `customer` VALUES (4, 'nie', 'nie@hi.com', '09387393', 'Single Room', '2024-02-15', '2024-02-16', 1, 'kdnkdk', 'Konfirmasi');
INSERT INTO `customer` VALUES (5, 'ki', 'ki@gmail.com', '90387398', 'Single Room', '2024-02-15', '2024-02-16', 2, 'lsojsj', 'Booking');
INSERT INTO `customer` VALUES (6, 'kiki', 'kiki@mui.com', '03483458', 'Superior Room', '2024-02-17', '2024-02-19', 1, ';lskdjknsdk', 'Booking');
INSERT INTO `customer` VALUES (11, 'Afandi', 'afandi@gmail.com', '949489484', 'Superior Room', '2024-02-19', '2024-02-20', 1, 'Makanannmya yang enak', 'Booking');
INSERT INTO `customer` VALUES (12, 'era', 'era@gmail.com', '99998', 'Single Room', '2024-02-16', '2024-02-17', 1, 'ACnya yang dingin ya', 'Booking');
INSERT INTO `customer` VALUES (14, 'Budi', 'budi@gmail.com', '0819336737`', 'Superior Room', '2024-03-08', '2024-03-08', 2, 'Yang Double bad ya', NULL);

-- ----------------------------
-- Table structure for kamar
-- ----------------------------
DROP TABLE IF EXISTS `kamar`;
CREATE TABLE `kamar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `harga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kamar
-- ----------------------------
INSERT INTO `kamar` VALUES (4, 'Standard Room', '450000', 'Tempat tidur\r\nAC\r\nSmart TV, \r\nBathroom\r\nAir minum', 'standar_room.jpg');
INSERT INTO `kamar` VALUES (5, 'Superior Room', '500000', 'Tempat tidur\r\nAC\r\nSmart TV\r\nBath room\r\nAir minum\r\nTwin Bed/ Double Bed', 'Superior_Room.jpg');
INSERT INTO `kamar` VALUES (6, 'Deluxe Room', '600000', 'Tempat tidur \r\nAC \r\nSmart TV \r\nBath room \r\nAir minum \r\nTwin Bed/ Double Bed\r\nKulkas Mini', 'Deluxe_Room.jpg');
INSERT INTO `kamar` VALUES (7, 'Junior Suite Room', '750005', 'Tempat tidur \r\nAC \r\nSmart TV \r\nBath room Air minum \r\nTwin Bed/ Double Bed \r\nKulkas Mini\r\nRuang Tamu', 'Junior_Suite_Room.jpg');
INSERT INTO `kamar` VALUES (8, 'Suite Room', '900000', 'Tempat tidur \r\nAC \r\nSmart TV \r\nBath room \r\nAir minum Twin Bed/ Double Bed \r\nKulkas Mini \r\nRuang Tamu, dapur', 'Suite_Room.jpg');

-- ----------------------------
-- Table structure for komentar
-- ----------------------------
DROP TABLE IF EXISTS `komentar`;
CREATE TABLE `komentar`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `komentar_p` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_p` datetime(0) NULL DEFAULT NULL,
  `namaadmin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `komentar_a` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_a` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of komentar
-- ----------------------------
INSERT INTO `komentar` VALUES (1, 'budi@gmail.com', 'budi', 'Hotel nya rame, kamarnya bersih', '2024-03-05 07:58:34', NULL, NULL, NULL);
INSERT INTO `komentar` VALUES (2, 'budi@gmail.com', 'Budi', 'Kamarnya besih dan Luas sekali', '2024-03-06 00:03:28', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` enum('Admin','Pelanggan') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'scrypt:32768:8:1$dAHCFPcFCcOlLncw$3a7e8dbba6a088e770f2318c4e054d0cbc6e83654c0072e99dee8e8c4f8a22defd2ecc2f1e2f8c0f2a715199a6c7ae2f2d96ce2186f9bed1f44ef0d78d8eaead', 'admin@gmail.com', 'Admin');
INSERT INTO `user` VALUES (3, 'joko', 'scrypt:32768:8:1$soIF6qiMza7yaKjQ$d3c0fc395f981f0f064aed7c16dda93f3f66c8f121c5b6691a21dd3693c066857f784160b17530b934cd306ec0cc1ea172e37421f67d896b7dc935b5a9ce5dbb', 'joko@hmi.clom', 'Pelanggan');
INSERT INTO `user` VALUES (4, 'petugas', 'scrypt:32768:8:1$3G8Q9lo9crKquNu8$c5fe6f67e8de858af356cf4a39e491353ee04d227cf0efdd4c74cbe3a69e7f4569d9a750dedb1e3ca82f57a355f5910e9aacd7f4d619a14cfe8ac05bb7a6b34b', 'petugas@ji.com', 'Pelanggan');
INSERT INTO `user` VALUES (5, 'huhu', 'scrypt:32768:8:1$GTRfy6hTy51zapMT$84b8587ddd64a84c2c6492273ec16860b8e4b1d2a1865c7c1daa89aae36eaf75a6f566f44135f1ba36356e9d77514b60330e1d1c16eaea1bdf11c06afa47fd21', 'huhu@gmail.com', 'Pelanggan');
INSERT INTO `user` VALUES (8, 'Budi', 'scrypt:32768:8:1$yWPyc0X9gyGNjMKF$59f50403eaab4f68c4b63308457446272342c0fffb4295879ac27208013449d4c3c1cb304745b2572037dee95f4bbaadaca6844e9418403d590c6c65facb08de', 'budi@gmail.com', 'Pelanggan');

SET FOREIGN_KEY_CHECKS = 1;
