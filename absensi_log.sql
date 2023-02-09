-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2023 at 02:05 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_akhir`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi_log`
--

CREATE TABLE `absensi_log` (
  `id_absensi_log` int(11) NOT NULL,
  `id_mahasiswa` varchar(10) NOT NULL,
  `status_kehadiran` varchar(30) NOT NULL DEFAULT 'Belum Melakukan Absen',
  `waktu_kehadiran` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `absensi_log`
--

INSERT INTO `absensi_log` (`id_absensi_log`, `id_mahasiswa`, `status_kehadiran`, `waktu_kehadiran`) VALUES
(56, '1202190178', 'Sudah melakukan absen', '2023-02-06 14:59:53'),
(59, '1202190183', 'Sudah melakukan absen', '2023-02-06 15:00:32'),
(67, '1202190287', 'Absensi tidak valid', '2023-02-06 15:03:32'),
(68, '1202190353', 'Sudah melakukan absen', '2023-02-06 15:02:55'),
(69, '1202192189', 'Absensi tidak valid', '2023-02-06 15:22:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi_log`
--
ALTER TABLE `absensi_log`
  ADD PRIMARY KEY (`id_absensi_log`),
  ADD KEY `fk_id_mahasiswa` (`id_mahasiswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi_log`
--
ALTER TABLE `absensi_log`
  MODIFY `id_absensi_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi_log`
--
ALTER TABLE `absensi_log`
  ADD CONSTRAINT `fk_id_mahasiswa` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
