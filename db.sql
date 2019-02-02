/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.20 : Database - db_migas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
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
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_anggota` */

insert  into `tbl_anggota`(`id_anggota`,`no_pt`,`nama_pt`,`id_jenis`,`aktif`) values (1,'0040','PT.Harashi',1,'1'),(2,'0050','PT Jayapuro',1,'0'),(3,'0060','PT.Kalangkabud',2,'1'),(6,'0060','PT.Markobar',2,'1');

/*Table structure for table `tbl_jenis` */

DROP TABLE IF EXISTS `tbl_jenis`;

CREATE TABLE `tbl_jenis` (
  `id_jenis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_jenis` */

insert  into `tbl_jenis`(`id_jenis`,`nama_jenis`) values (1,'SPBU'),(2,'PSO'),(3,'SPBE');

/*Table structure for table `tbl_kaskeluar` */

DROP TABLE IF EXISTS `tbl_kaskeluar`;

CREATE TABLE `tbl_kaskeluar` (
  `id_kaskeluar` int(11) NOT NULL AUTO_INCREMENT,
  `keterangan` text,
  `tanggal` date DEFAULT NULL,
  `jumlah_biaya` float DEFAULT NULL,
  PRIMARY KEY (`id_kaskeluar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_kaskeluar` */

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_tagihan` */

insert  into `tbl_tagihan`(`id_tagihan`,`tanggal_event`,`id_anggota`,`jumlah_bayar`,`tanggal`) values (31,'2019-02-02 13:16:56',1,20000,NULL),(32,'2019-02-02 13:16:56',3,17000,'2018-01-01'),(33,'2019-03-02 13:16:56',6,90,'2018-01-11');

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`id_user`,`username`,`password`) values (1,'admin','admin');

/* Procedure structure for procedure `stored_bulanan` */

/*!50003 DROP PROCEDURE IF EXISTS  `stored_bulanan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `stored_bulanan`()
BEGIN
	DECLARE id,i,total,t INT;
	set t =(SELECT COUNT(*)  FROM tbl_tagihan WHERE MONTH(tanggal_event)=MONTH(NOW()) AND YEAR(tanggal_event)=YEAR(NOW()));
	IF (t<1) THEN	
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
        END IF;
    END */$$
DELIMITER ;

/*Table structure for table `vw_tagihan` */

DROP TABLE IF EXISTS `vw_tagihan`;

/*!50001 DROP VIEW IF EXISTS `vw_tagihan` */;
/*!50001 DROP TABLE IF EXISTS `vw_tagihan` */;

/*!50001 CREATE TABLE  `vw_tagihan`(
 `id_tagihan` int(11) ,
 `tanggal_event` timestamp ,
 `id_anggota` int(11) ,
 `nama_pt` varchar(150) ,
 `nama_jenis` varchar(15) ,
 `jumlah_bayar` float ,
 `tanggal` date 
)*/;

/*View structure for view vw_tagihan */

/*!50001 DROP TABLE IF EXISTS `vw_tagihan` */;
/*!50001 DROP VIEW IF EXISTS `vw_tagihan` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tagihan` AS select `tbl_tagihan`.`id_tagihan` AS `id_tagihan`,`tbl_tagihan`.`tanggal_event` AS `tanggal_event`,`tbl_tagihan`.`id_anggota` AS `id_anggota`,`tbl_anggota`.`nama_pt` AS `nama_pt`,`tbl_jenis`.`nama_jenis` AS `nama_jenis`,`tbl_tagihan`.`jumlah_bayar` AS `jumlah_bayar`,`tbl_tagihan`.`tanggal` AS `tanggal` from ((`tbl_tagihan` join `tbl_anggota` on((`tbl_tagihan`.`id_anggota` = `tbl_anggota`.`id_anggota`))) join `tbl_jenis` on((`tbl_jenis`.`id_jenis` = `tbl_anggota`.`id_jenis`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
