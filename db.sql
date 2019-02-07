/*
SQLyog Enterprise - MySQL GUI v7.14 
MySQL - 5.6.16 : Database - db_migas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_migas` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_migas`;

/*Table structure for table `tbl_anggota` */

DROP TABLE IF EXISTS `tbl_anggota`;

CREATE TABLE `tbl_anggota` (
  `id_anggota` int(11) NOT NULL AUTO_INCREMENT,
  `no_pt` varchar(50) DEFAULT NULL,
  `nama_pt` varchar(150) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `aktif` char(1) NOT NULL DEFAULT '1',
  `pemilik_pt` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_anggota`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_anggota` */

=======
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_anggota` */

insert  into `tbl_anggota`(`id_anggota`,`no_pt`,`nama_pt`,`id_jenis`,`aktif`) values (1,'56.1242.434','PT SEJAHTERA ABADI',1,'1'),(2,'4242.3453','PT SATRIA BAJA HITAM',2,'1'),(3,'3232','PT Abadi Jaya',3,'1');

>>>>>>> c31ac172c1342aed8f233ecfffbadfa362979a2c
/*Table structure for table `tbl_jenis` */

DROP TABLE IF EXISTS `tbl_jenis`;

CREATE TABLE `tbl_jenis` (
  `id_jenis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_jenis`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_jenis` */

insert  into `tbl_jenis`(`id_jenis`,`nama_jenis`) values (1,'SPBU'),(2,'PSO'),(3,'SPBE'),(4,'HPE'),(5,'TRANSPORTIR');
=======
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_jenis` */

insert  into `tbl_jenis`(`id_jenis`,`nama_jenis`) values (1,'SPBU'),(2,'PSO'),(3,'SPBE'),(4,'HPE');
>>>>>>> c31ac172c1342aed8f233ecfffbadfa362979a2c

/*Table structure for table `tbl_kaskeluar` */

DROP TABLE IF EXISTS `tbl_kaskeluar`;

CREATE TABLE `tbl_kaskeluar` (
  `id_kaskeluar` int(11) NOT NULL AUTO_INCREMENT,
  `keterangan` text,
  `tanggal` date DEFAULT NULL,
  `jumlah_biaya` float DEFAULT NULL,
  `jenis_kas` enum('MASUK','KELUAR') DEFAULT NULL,
  PRIMARY KEY (`id_kaskeluar`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=693 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_kaskeluar` */

insert  into `tbl_kaskeluar`(`id_kaskeluar`,`keterangan`,`tanggal`,`jumlah_biaya`,`jenis_kas`) values (118,'beli minyak di warung','2019-02-02',200000,'KELUAR'),(236,'Token Listrik PRO','2019-02-02',140000,'KELUAR'),(371,'kopi gratis\r\n','2019-02-20',20000,'MASUK'),(469,'siipp\r\n','2019-01-01',400000,'KELUAR'),(684,'BELI AYAM','2019-02-15',21000,'KELUAR'),(692,'THR','2019-02-28',180000,'MASUK');
=======
) ENGINE=InnoDB AUTO_INCREMENT=470 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_kaskeluar` */

insert  into `tbl_kaskeluar`(`id_kaskeluar`,`keterangan`,`tanggal`,`jumlah_biaya`) values (118,'beli minyak di warung','2019-02-02',200000),(236,'Token Listrik','2019-02-02',14000),(469,'siipp\r\n','2019-01-01',400000);
>>>>>>> c31ac172c1342aed8f233ecfffbadfa362979a2c

/*Table structure for table `tbl_saldo` */

DROP TABLE IF EXISTS `tbl_saldo`;

CREATE TABLE `tbl_saldo` (
  `saldo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_saldo` */

/*Table structure for table `tbl_tagihan` */

DROP TABLE IF EXISTS `tbl_tagihan`;

CREATE TABLE `tbl_tagihan` (
  `id_tagihan` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_event` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_anggota` int(11) NOT NULL,
  `jumlah_bayar` float DEFAULT '0',
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`id_tagihan`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_tagihan` */

=======
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_tagihan` */

insert  into `tbl_tagihan`(`id_tagihan`,`tanggal_event`,`id_anggota`,`jumlah_bayar`,`tanggal`) values (1,'2019-02-02 05:57:57',1,100000,'2019-02-04'),(2,'2019-02-02 05:57:57',2,0,NULL);

>>>>>>> c31ac172c1342aed8f233ecfffbadfa362979a2c
/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`id_user`,`username`,`password`) values (1,'admin','123');

/* Procedure structure for procedure `stored_bulanan` */

/*!50003 DROP PROCEDURE IF EXISTS  `stored_bulanan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `stored_bulanan`()
BEGIN
	DECLARE id,i,total,t,alt,xac INT;
	set t =(SELECT COUNT(*)  FROM tbl_tagihan WHERE MONTH(tanggal_event)=MONTH(NOW()) AND YEAR(tanggal_event)=YEAR(NOW()));
	IF (t<1 && t!=0) THEN	
	SET total=(SELECT id_anggota FROM tbl_anggota ORDER BY id_anggota DESC LIMIT 1);
	SET i=1;
	REPEAT
	SET id=(SELECT id_anggota FROM tbl_anggota WHERE id_anggota=i AND aktif='1');
	IF (id!=0) THEN
	INSERT INTO tbl_tagihan(id_anggota) VALUES (id);
	END IF;
	SET i = i + 1;
	UNTIL i>total
        END REPEAT;
	ELSE
	IF (t!=0) THEN
        SET total=(SELECT id_anggota FROM tbl_anggota ORDER BY id_anggota DESC LIMIT 1);
	SET i=1;
	REPEAT
	SET id=(SELECT id_anggota FROM tbl_anggota WHERE id_anggota=i AND aktif='1');
	IF (id!=0) THEN
	SET alt=(SELECT id_anggota FROM tbl_tagihan WHERE id_anggota=id AND MONTH(tanggal_event)=MONTH(NOW()) AND YEAR(tanggal_event)=YEAR(NOW()));
	IF (alt!=0) THEN
	SET xac=0;
	ELSE
	INSERT INTO tbl_tagihan(id_anggota) VALUES (id);
	END IF;	
	END IF;
	SET i = i + 1;
	UNTIL i>total
	END REPEAT;
	END IF;
        END IF;
    END */$$
DELIMITER ;

/*Table structure for table `view_kas` */

DROP TABLE IF EXISTS `view_kas`;

/*!50001 DROP VIEW IF EXISTS `view_kas` */;
/*!50001 DROP TABLE IF EXISTS `view_kas` */;

/*!50001 CREATE TABLE  `view_kas`(
 `kas` double 
)*/;

/*Table structure for table `vw_tagihan` */

DROP TABLE IF EXISTS `vw_tagihan`;

/*!50001 DROP VIEW IF EXISTS `vw_tagihan` */;
/*!50001 DROP TABLE IF EXISTS `vw_tagihan` */;

<<<<<<< HEAD
/*!50001 CREATE TABLE  `vw_tagihan`(
 `id_tagihan` int(11) ,
 `tanggal_event` timestamp ,
 `id_anggota` int(11) ,
 `nama_pt` varchar(150) ,
 `pemilik_pt` varchar(100) ,
 `nama_jenis` varchar(15) ,
 `jumlah_bayar` float ,
 `tanggal` date 
)*/;
=======
/*!50001 CREATE TABLE `vw_tagihan` (
  `id_tagihan` int(11) NOT NULL DEFAULT '0',
  `tanggal_event` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_anggota` int(11) NOT NULL,
  `nama_pt` varchar(150) NOT NULL,
  `nama_jenis` varchar(15) DEFAULT NULL,
  `jumlah_bayar` float DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;
>>>>>>> c31ac172c1342aed8f233ecfffbadfa362979a2c

/*View structure for view view_kas */

/*!50001 DROP TABLE IF EXISTS `view_kas` */;
/*!50001 DROP VIEW IF EXISTS `view_kas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_kas` AS select sum(`tbl_tagihan`.`jumlah_bayar`) AS `kas` from `tbl_tagihan` where (`tbl_tagihan`.`tanggal` <> 0) union select sum(`tbl_kaskeluar`.`jumlah_biaya`) AS `SUM(jumlah_biaya)` from `tbl_kaskeluar` where (`tbl_kaskeluar`.`jenis_kas` = 'KELUAR') union select sum(`tbl_kaskeluar`.`jumlah_biaya`) AS `SUM(jumlah_biaya)` from `tbl_kaskeluar` where (`tbl_kaskeluar`.`jenis_kas` = 'MASUK') */;

/*View structure for view vw_tagihan */

/*!50001 DROP TABLE IF EXISTS `vw_tagihan` */;
/*!50001 DROP VIEW IF EXISTS `vw_tagihan` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tagihan` AS select `tbl_tagihan`.`id_tagihan` AS `id_tagihan`,`tbl_tagihan`.`tanggal_event` AS `tanggal_event`,`tbl_tagihan`.`id_anggota` AS `id_anggota`,`tbl_anggota`.`nama_pt` AS `nama_pt`,`tbl_anggota`.`pemilik_pt` AS `pemilik_pt`,`tbl_jenis`.`nama_jenis` AS `nama_jenis`,`tbl_tagihan`.`jumlah_bayar` AS `jumlah_bayar`,`tbl_tagihan`.`tanggal` AS `tanggal` from ((`tbl_tagihan` join `tbl_anggota` on((`tbl_tagihan`.`id_anggota` = `tbl_anggota`.`id_anggota`))) join `tbl_jenis` on((`tbl_jenis`.`id_jenis` = `tbl_anggota`.`id_jenis`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
