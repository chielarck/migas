/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.16 : Database - db_migas
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
  `pengurus_pt` varchar(100) NOT NULL,
  `telepone_pt` varchar(15) NOT NULL,
  `email_pt` varchar(100) NOT NULL,
  `no_kta` varchar(100) NOT NULL,
  `alamat_pt` text NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_group` int(11) NOT NULL,
  `aktif` char(1) NOT NULL DEFAULT '1',
  `pemilik_pt` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_anggota` */

insert  into `tbl_anggota`(`id_anggota`,`no_pt`,`nama_pt`,`pengurus_pt`,`telepone_pt`,`email_pt`,`no_kta`,`alamat_pt`,`id_jenis`,`id_group`,`aktif`,`pemilik_pt`) values (1,'PT Abc','1','Udin','0823131','e@e.com','01231313','xxxx',1,1,'1','1'),(2,'123131313','PT CDA','Joko','014142342','eda','-','das',2,1,'1','Joko'),(3,'23456','qwertyui','wertyuio','wertyuio','qwert@mail.com','123456','wertydfghcvbnf dfghjkl',1,1,'1','qwertyui'),(4,'','dad','dad','qwe','adaqe','343','da',2,1,'1','sfs');

/*Table structure for table `tbl_group` */

DROP TABLE IF EXISTS `tbl_group`;

CREATE TABLE `tbl_group` (
  `id_group` int(11) NOT NULL AUTO_INCREMENT,
  `nama_group` varchar(100) NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_group` */

insert  into `tbl_group`(`id_group`,`nama_group`) values (1,'Group 1 lagi'),(2,'Group ABCD');

/*Table structure for table `tbl_jenis` */

DROP TABLE IF EXISTS `tbl_jenis`;

CREATE TABLE `tbl_jenis` (
  `id_jenis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_jenis` */

insert  into `tbl_jenis`(`id_jenis`,`nama_jenis`) values (1,'SPBU'),(2,'PSO'),(3,'SPBE'),(4,'HPE'),(5,'TRANSPORTIR');

/*Table structure for table `tbl_kaskeluar` */

DROP TABLE IF EXISTS `tbl_kaskeluar`;

CREATE TABLE `tbl_kaskeluar` (
  `id_kaskeluar` int(11) NOT NULL AUTO_INCREMENT,
  `keterangan` text,
  `tanggal` date DEFAULT NULL,
  `jumlah_biaya` float DEFAULT NULL,
  `jenis_kas` enum('MASUK','KELUAR') DEFAULT NULL,
  PRIMARY KEY (`id_kaskeluar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_kaskeluar` */

/*Table structure for table `tbl_rekeningkoran` */

DROP TABLE IF EXISTS `tbl_rekeningkoran`;

CREATE TABLE `tbl_rekeningkoran` (
  `id_bukubesar` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `deskripsi` varchar(200) DEFAULT NULL,
  `debit` float DEFAULT '0',
  `kredit` float DEFAULT '0',
  `id_tagihan` int(11) DEFAULT NULL,
  `id_kaskeluar` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_bukubesar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_rekeningkoran` */

/*Table structure for table `tbl_saldo` */

DROP TABLE IF EXISTS `tbl_saldo`;

CREATE TABLE `tbl_saldo` (
  `saldo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_saldo` */

/*Table structure for table `tbl_saldoawal` */

DROP TABLE IF EXISTS `tbl_saldoawal`;

CREATE TABLE `tbl_saldoawal` (
  `id_saldoawal` int(11) NOT NULL AUTO_INCREMENT,
  `jumlah` float NOT NULL,
  PRIMARY KEY (`id_saldoawal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_saldoawal` */

insert  into `tbl_saldoawal`(`id_saldoawal`,`jumlah`) values (1,2500000);

/*Table structure for table `tbl_tagihan` */

DROP TABLE IF EXISTS `tbl_tagihan`;

CREATE TABLE `tbl_tagihan` (
  `id_tagihan` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_event` date NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `jumlah_bayar` float DEFAULT '0',
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`id_tagihan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_tagihan` */

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

/* Trigger structure for table `tbl_kaskeluar` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `kas` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `kas` AFTER INSERT ON `tbl_kaskeluar` FOR EACH ROW BEGIN
	IF (NEW.jenis_kas = 'KELUAR') THEN
	INSERT INTO tbl_rekeningkoran (debit,deskripsi,tanggal,id_kaskeluar) VALUES (NEW.jumlah_biaya,NEW.keterangan,NEW.tanggal,NEW.id_kaskeluar);
        END IF; 
        IF (NEW.jenis_kas = 'MASUK') THEN
	INSERT INTO tbl_rekeningkoran (kredit,deskripsi,tanggal,id_kaskeluar) VALUES (NEW.jumlah_biaya,NEW.keterangan,NEW.tanggal,NEW.id_kaskeluar);
        END IF; 
   END */$$


DELIMITER ;

/* Trigger structure for table `tbl_kaskeluar` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `kas_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `kas_update` AFTER UPDATE ON `tbl_kaskeluar` FOR EACH ROW BEGIN
	IF (NEW.jenis_kas = 'KELUAR') THEN
	UPDATE tbl_rekeningkoran SET debit = NEW.jumlah_biaya, kredit = 0, tanggal = NEW.tanggal, deskripsi = NEW.keterangan WHERE id_kaskeluar = NEW.id_kaskeluar; 
        END IF; 
        IF (NEW.jenis_kas = 'MASUK') THEN
	UPDATE tbl_rekeningkoran SET kredit = NEW.jumlah_biaya, debit = 0, tanggal = NEW.tanggal, deskripsi = NEW.keterangan WHERE id_kaskeluar = NEW.id_kaskeluar; 
        END IF; 
    END */$$


DELIMITER ;

/* Trigger structure for table `tbl_kaskeluar` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `kas_hapus` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `kas_hapus` AFTER DELETE ON `tbl_kaskeluar` FOR EACH ROW BEGIN
	DELETE FROM tbl_rekeningkoran WHERE id_kaskeluar = OLD.id_kaskeluar ;
    END */$$


DELIMITER ;

/* Trigger structure for table `tbl_tagihan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tagihan` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tagihan` AFTER UPDATE ON `tbl_tagihan` FOR EACH ROW BEGIN
	DECLARE ID_TAG,ID_NEW,ID_ANGGOTAX INT;
	DECLARE NAMA_ANGGOTA,ISI CHAR(100);
	SET ID_TAG=NEW.id_tagihan;
	SET ID_ANGGOTAX=NEW.id_anggota;
	IF(NEW.tanggal != 0 AND NEW.jumlah_bayar != 0) THEN
	SET @NAMA_ANGGOTA=(SELECT nama_pt FROM tbl_anggota WHERE id_anggota=ID_ANGGOTAX);
	SET @ISI=CONCAT('DANA KEMITRAAN ', @NAMA_ANGGOTA, ' BULAN ', MONTHNAME(NEW.tanggal_event), '-', YEAR(NEW.tanggal_event));
	SET @ID_NEW=(SELECT COUNT(*) FROM tbl_rekeningkoran WHERE id_tagihan=ID_TAG);
	IF(@ID_NEW=0) THEN
		INSERT INTO tbl_rekeningkoran (deskripsi,kredit,tanggal,id_tagihan) VALUES (@ISI,NEW.jumlah_bayar,NEW.tanggal,NEW.id_tagihan);
	ELSE
		UPDATE tbl_rekeningkoran SET deskripsi=@ISI,tanggal=NEW.tanggal,kredit=NEW.jumlah_bayar WHERE id_tagihan=NEW.id_tagihan;
	END IF; 
		END IF;
    END */$$


DELIMITER ;

/* Procedure structure for procedure `stored_bulanan` */

/*!50003 DROP PROCEDURE IF EXISTS  `stored_bulanan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `stored_bulanan`(IN `bulan` CHAR(20))
BEGIN
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
    END */$$
DELIMITER ;

/* Procedure structure for procedure `stored_rekening` */

/*!50003 DROP PROCEDURE IF EXISTS  `stored_rekening` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `stored_rekening`(IN `bulan` CHAR(20))
BEGIN
DECLARE sumall,debitx,saldo_awal INT DEFAULT 0;
set @csum := 0;
SET sumall=0;
SET saldo_awal=(SELECT COALESCE(SUM(jumlah),0) FROM tbl_saldoawal);
SET debitx=(SELECT COALESCE(SUM(debit),0) FROM tbl_rekeningkoran where tanggal BETWEEN '2019-01-01' AND bulan-INTERVAL 1 DAY);
SET sumall=(SELECT COALESCE(SUM(kredit),0) FROM tbl_rekeningkoran where tanggal BETWEEN '2019-01-01' AND bulan-INTERVAL 1 DAY);
SET @csum = saldo_awal+sumall-debitx;
SELECT *,(@csum := @csum + kredit - debit) AS saldo_akhir FROM tbl_rekeningkoran WHERE MONTH(tanggal)=MONTH(bulan) AND YEAR(tanggal)=YEAR(bulan) ORDER BY tanggal ASC;
    
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

/*!50001 CREATE TABLE  `vw_tagihan`(
 `id_tagihan` int(11) ,
 `tanggal_event` date ,
 `id_anggota` int(11) ,
 `nama_pt` varchar(150) ,
 `pemilik_pt` varchar(100) ,
 `nama_jenis` varchar(15) ,
 `jumlah_bayar` float ,
 `tanggal` date 
)*/;

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
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
