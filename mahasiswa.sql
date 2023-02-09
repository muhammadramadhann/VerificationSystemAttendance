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
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelas` varchar(30) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama`, `kelas`, `jurusan`, `foto`) VALUES
('1202190178', 'Muhammad Ramadhan', 'SI-43-03', 'Sistem Informasi', '1202190178.jpeg'),
('1202190183', 'Andrian Firmansyah', 'SI-43-05', 'Sistem Informasi', '1202190183.jpeg'),
('1202190287', 'Ali Maulidi', 'SI-43-09', 'Sistem Informasi', '1202190287.jpeg'),
('1202190353', 'Reka Febina Tasya', 'SI-43-05', 'Sistem Informasi', '1202190353.jpg'),
('1202192189', 'Febrian Wulandari', 'SI-43-04', 'Sistem Informasi', '1202192189.jpg'),
('1202192192', 'Hanif Muflihul Anwar', 'SI-43-05', 'Sistem Informasi', '1202192192.jpeg'),
('1202193021', 'Jodi Rizky', 'SI-43-02', 'Sistem Informasi', '1202193021.jpeg'),
('1202193245', 'Dika Fajar', 'SI-43-03', 'Sistem Informasi', '1202193245.jpeg'),
('1202194018', 'Taufik Maulana Firdaus', 'SI-43-09', 'Sistem Informasi', '1202194018.jpeg'),
('1202194230', 'Muhammad Rifqi Kurnia', 'SI-43-04', 'Sistem Informasi', '1202194230.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
