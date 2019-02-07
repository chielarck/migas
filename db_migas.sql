-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 07, 2019 at 04:25 AM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `stored_bulanan` (IN `bulan` CHAR(20))  BEGIN
	DECLARE id,i,total,t,alt,xac INT;
	declare tgl CHAR(20);
	DECLARE tanggal DATE;
	SET tgl=bulan;
	set t =(SELECT COUNT(*)  FROM tbl_tagihan WHERE MONTH(tanggal_event)=MONTH(tgl) AND YEAR(tanggal_event)=YEAR(tgl));
	IF (t<1) THEN	
	SET total=(SELECT id_anggota FROM tbl_anggota ORDER BY id_anggota DESC LIMIT 1);
	SET i=1;
	if (total!=0) THEN
	REPEAT
	SET id=(SELECT id_anggota FROM tbl_anggota WHERE id_anggota=i AND aktif='1');
	IF (id!=0) THEN
	INSERT INTO tbl_tagihan(id_anggota,tanggal_event) VALUES (id,tgl);
	END IF;
	SET i = i + 1;
	UNTIL i>total
        END REPEAT;
        END IF;
	ELSE
	
        SET total=(SELECT id_anggota FROM tbl_anggota ORDER BY id_anggota DESC LIMIT 1);
	SET i=1;
	IF (total!=0) THEN
	REPEAT
	SET id=(SELECT id_anggota FROM tbl_anggota WHERE id_anggota=i AND aktif='1');
	IF (id!=0) THEN
	SET alt=(SELECT id_anggota FROM tbl_tagihan WHERE id_anggota=id AND MONTH(tanggal_event)=MONTH(tgl) AND YEAR(tanggal_event)=YEAR(tgl));
	IF (alt!=0) THEN
	SET xac=0;
	ELSE
	INSERT INTO tbl_tagihan(id_anggota,tanggal_event) VALUES (id,tgl);
	END IF;	
	END IF;
	SET i = i + 1;
	UNTIL i>total
	END REPEAT;
	END IF;
        END IF;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_anggota`
--

CREATE TABLE `tbl_anggota` (
  `id_anggota` int(11) NOT NULL,
  `no_pt` varchar(50) DEFAULT NULL,
  `nama_pt` varchar(150) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `aktif` char(1) NOT NULL DEFAULT '1',
  `pemilik_pt` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_anggota`
--

INSERT INTO `tbl_anggota` (`id_anggota`, `no_pt`, `nama_pt`, `id_jenis`, `aktif`, `pemilik_pt`) VALUES
(1, '1', '1', 1, '1', '1'),
(2, '2', '2', 2, '1', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group`
--

CREATE TABLE `tbl_group` (
  `id_group` int(11) NOT NULL,
  `nama_group` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_group`
--

INSERT INTO `tbl_group` (`id_group`, `nama_group`) VALUES
(1, 'Group 1 lagi');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenis`
--

CREATE TABLE `tbl_jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jenis`
--

INSERT INTO `tbl_jenis` (`id_jenis`, `nama_jenis`) VALUES
(1, 'SPBU'),
(2, 'PSO'),
(3, 'SPBE'),
(4, 'HPE'),
(5, 'TRANSPORTIR');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kaskeluar`
--

CREATE TABLE `tbl_kaskeluar` (
  `id_kaskeluar` int(11) NOT NULL,
  `keterangan` text,
  `tanggal` date DEFAULT NULL,
  `jumlah_biaya` float DEFAULT NULL,
  `jenis_kas` enum('MASUK','KELUAR') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kaskeluar`
--

INSERT INTO `tbl_kaskeluar` (`id_kaskeluar`, `keterangan`, `tanggal`, `jumlah_biaya`, `jenis_kas`) VALUES
(118, 'beli minyak di warung', '2019-02-02', 200000, 'KELUAR'),
(236, 'Token Listrik PRO', '2019-02-02', 140000, 'KELUAR'),
(371, 'kopi gratis\r\n', '2019-02-20', 20000, 'MASUK'),
(469, 'siipp\r\n', '2019-01-01', 400000, 'KELUAR'),
(684, 'BELI AYAM', '2019-02-15', 21000, 'KELUAR'),
(692, 'THR', '2019-02-28', 180000, 'MASUK');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saldo`
--

CREATE TABLE `tbl_saldo` (
  `saldo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saldoawal`
--

CREATE TABLE `tbl_saldoawal` (
  `id_saldoawal` int(11) NOT NULL,
  `jumlah` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_saldoawal`
--

INSERT INTO `tbl_saldoawal` (`id_saldoawal`, `jumlah`) VALUES
(1, 10000000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tagihan`
--

CREATE TABLE `tbl_tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `tanggal_event` date NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `jumlah_bayar` float DEFAULT '0',
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tagihan`
--

INSERT INTO `tbl_tagihan` (`id_tagihan`, `tanggal_event`, `id_anggota`, `jumlah_bayar`, `tanggal`) VALUES
(4, '2019-01-01', 1, 0, NULL),
(5, '2018-01-01', 1, 0, NULL),
(6, '2018-05-01', 1, 0, NULL),
(7, '2019-04-04', 1, 0, NULL),
(8, '2019-04-10', 2, 0, NULL),
(9, '2019-02-10', 1, 150000, NULL),
(10, '2019-02-10', 2, 200000, '2019-02-07');

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
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_kas`
--
CREATE TABLE `view_kas` (
`kas` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_tagihan`
--
CREATE TABLE `vw_tagihan` (
`id_tagihan` int(11)
,`tanggal_event` date
,`id_anggota` int(11)
,`nama_pt` varchar(150)
,`pemilik_pt` varchar(100)
,`nama_jenis` varchar(15)
,`jumlah_bayar` float
,`tanggal` date
);

-- --------------------------------------------------------

--
-- Structure for view `view_kas`
--
DROP TABLE IF EXISTS `view_kas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_kas`  AS  select sum(`tbl_tagihan`.`jumlah_bayar`) AS `kas` from `tbl_tagihan` where (`tbl_tagihan`.`tanggal` <> 0) union select sum(`tbl_kaskeluar`.`jumlah_biaya`) AS `SUM(jumlah_biaya)` from `tbl_kaskeluar` where (`tbl_kaskeluar`.`jenis_kas` = 'KELUAR') union select sum(`tbl_kaskeluar`.`jumlah_biaya`) AS `SUM(jumlah_biaya)` from `tbl_kaskeluar` where (`tbl_kaskeluar`.`jenis_kas` = 'MASUK') ;

-- --------------------------------------------------------

--
-- Structure for view `vw_tagihan`
--
DROP TABLE IF EXISTS `vw_tagihan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tagihan`  AS  select `tbl_tagihan`.`id_tagihan` AS `id_tagihan`,`tbl_tagihan`.`tanggal_event` AS `tanggal_event`,`tbl_tagihan`.`id_anggota` AS `id_anggota`,`tbl_anggota`.`nama_pt` AS `nama_pt`,`tbl_anggota`.`pemilik_pt` AS `pemilik_pt`,`tbl_jenis`.`nama_jenis` AS `nama_jenis`,`tbl_tagihan`.`jumlah_bayar` AS `jumlah_bayar`,`tbl_tagihan`.`tanggal` AS `tanggal` from ((`tbl_tagihan` join `tbl_anggota` on((`tbl_tagihan`.`id_anggota` = `tbl_anggota`.`id_anggota`))) join `tbl_jenis` on((`tbl_jenis`.`id_jenis` = `tbl_anggota`.`id_jenis`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_anggota`
--
ALTER TABLE `tbl_anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `tbl_group`
--
ALTER TABLE `tbl_group`
  ADD PRIMARY KEY (`id_group`);

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
-- Indexes for table `tbl_saldoawal`
--
ALTER TABLE `tbl_saldoawal`
  ADD PRIMARY KEY (`id_saldoawal`);

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
-- AUTO_INCREMENT for table `tbl_anggota`
--
ALTER TABLE `tbl_anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_group`
--
ALTER TABLE `tbl_group`
  MODIFY `id_group` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_jenis`
--
ALTER TABLE `tbl_jenis`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_kaskeluar`
--
ALTER TABLE `tbl_kaskeluar`
  MODIFY `id_kaskeluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=693;
--
-- AUTO_INCREMENT for table `tbl_saldoawal`
--
ALTER TABLE `tbl_saldoawal`
  MODIFY `id_saldoawal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_tagihan`
--
ALTER TABLE `tbl_tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
