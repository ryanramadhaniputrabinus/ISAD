-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2023 at 10:05 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tk3isad`
--

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_dokter`
--

CREATE TABLE `jadwal_dokter` (
  `nama_dokter` varchar(120) NOT NULL,
  `layanan` varchar(120) NOT NULL,
  `jam_praktek` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran_online`
--

CREATE TABLE `pendaftaran_online` (
  `no_antrian` int(120) NOT NULL,
  `nama_pasien` varchar(120) NOT NULL,
  `alamat` varchar(120) NOT NULL,
  `no_hp` int(15) NOT NULL,
  `email` varchar(120) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `layanan` varchar(120) NOT NULL,
  `nama_dokter` varchar(120) NOT NULL,
  `jaminan` varchar(120) NOT NULL,
  `tgl_book` date NOT NULL,
  `jam_praktek` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `no_antrian` int(120) NOT NULL,
  `nama_dokter` varchar(120) NOT NULL,
  `tgl_book` date NOT NULL,
  `jam_praktek` time NOT NULL,
  `tagihan` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jadwal_dokter`
--
ALTER TABLE `jadwal_dokter`
  ADD PRIMARY KEY (`nama_dokter`);

--
-- Indexes for table `pendaftaran_online`
--
ALTER TABLE `pendaftaran_online`
  ADD PRIMARY KEY (`no_antrian`),
  ADD KEY `nama_dokter` (`nama_dokter`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD KEY `no_antrian` (`no_antrian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pendaftaran_online`
--
ALTER TABLE `pendaftaran_online`
  MODIFY `no_antrian` int(120) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pendaftaran_online`
--
ALTER TABLE `pendaftaran_online`
  ADD CONSTRAINT `pendaftaran_online_ibfk_1` FOREIGN KEY (`nama_dokter`) REFERENCES `jadwal_dokter` (`nama_dokter`);

--
-- Constraints for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD CONSTRAINT `tagihan_ibfk_1` FOREIGN KEY (`no_antrian`) REFERENCES `pendaftaran_online` (`no_antrian`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
