-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 02, 2019 at 07:49 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_migas`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_anggota`
--

CREATE TABLE `tbl_anggota` (
  `id_anggota` varchar(11) NOT NULL,
  `no_pt` varchar(50) DEFAULT NULL,
  `nama_pt` varchar(150) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `aktif` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_anggota`
--

INSERT INTO `tbl_anggota` (`id_anggota`, `no_pt`, `nama_pt`, `id_jenis`, `aktif`) VALUES
('756', '12345', 'SPBG', 554, '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenis`
--

CREATE TABLE `tbl_jenis` (
  `id_jenis` varchar(11) NOT NULL,
  `nama_jenis` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jenis`
--

INSERT INTO `tbl_jenis` (`id_jenis`, `nama_jenis`) VALUES
('293', 'SPBDD'),
('447', 'SPBED'),
('554', 'SPBG');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kaskeluar`
--

CREATE TABLE `tbl_kaskeluar` (
  `id_kaskeluar` int(11) NOT NULL,
  `keterangan` text,
  `tanggal` date DEFAULT NULL,
  `jumlah_biaya` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kaskeluar`
--

INSERT INTO `tbl_kaskeluar` (`id_kaskeluar`, `keterangan`, `tanggal`, `jumlah_biaya`) VALUES
(241, 'Buat beli tabung Mercon', '2019-12-10', 10000000),
(378, 'Buat beli tabung LPG', '2019-12-10', 10000000),
(476, 'Buat DP aplikasi', '2018-10-20', 30000000),
(711, 'Buat Beli Kucing', '2019-12-20', 30000000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saldo`
--

CREATE TABLE `tbl_saldo` (
  `saldo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tagihan`
--

CREATE TABLE `tbl_tagihan` (
  `id_tagihan` varchar(20) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `jumlah_bayar` float DEFAULT '0',
  `tanggal` date DEFAULT NULL,
  `bulan` char(2) NOT NULL,
  `tahun` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`) VALUES
(1, 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_anggota`
--
ALTER TABLE `tbl_anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `tbl_jenis`
--
ALTER TABLE `tbl_jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `tbl_kaskeluar`
--
ALTER TABLE `tbl_kaskeluar`
  ADD PRIMARY KEY (`id_kaskeluar`);

--
-- Indexes for table `tbl_tagihan`
--
ALTER TABLE `tbl_tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_kaskeluar`
--
ALTER TABLE `tbl_kaskeluar`
  MODIFY `id_kaskeluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=712;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
