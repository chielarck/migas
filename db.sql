/*
SQLyog Enterprise - MySQL GUI v7.14 
MySQL - 5.6.16 : Database - imc_sparepart
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`imc_sparepart` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `imc_sparepart`;

/*Table structure for table `kas_kecil` */

DROP TABLE IF EXISTS `kas_kecil`;

CREATE TABLE `kas_kecil` (
  `id_kaskecil` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_kaskecil` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jenis_kas` enum('MASUK','KELUAR') DEFAULT NULL,
  `keterangan_kas` varchar(250) DEFAULT NULL,
  `jumlah_kas` float DEFAULT NULL,
  `id_karyawan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kaskecil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kas_kecil` */

/*Table structure for table `mst_app` */

DROP TABLE IF EXISTS `mst_app`;

CREATE TABLE `mst_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_perusahaan` varchar(70) NOT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  `alamat` text,
  `nama_pimpinan` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `mst_app` */

insert  into `mst_app`(`id`,`nama_perusahaan`,`no_telepon`,`alamat`,`nama_pimpinan`) values (1,'APLIKASI SPAREPART','08221000000','Legundi, Bandar Lampung','Mr. XX');

/*Table structure for table `mst_barang` */

DROP TABLE IF EXISTS `mst_barang`;

CREATE TABLE `mst_barang` (
  `id_barang` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(10) NOT NULL,
  `kode_barcode` varchar(40) DEFAULT NULL,
  `nama_barang` varchar(70) NOT NULL,
  `alias1` varchar(70) DEFAULT NULL,
  `alias2` varchar(70) DEFAULT NULL,
  `alias3` varchar(70) DEFAULT NULL,
  `alias4` varchar(70) DEFAULT NULL,
  `jenis_barang` enum('SINGLE','SUB KOMPONEN') NOT NULL,
  `id_mobil` int(11) DEFAULT NULL,
  `tahun_mobil` char(4) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `id_sub_kategori1` int(11) DEFAULT NULL,
  `id_sub_kategori2` int(11) DEFAULT NULL,
  `id_sub_kategori3` int(11) DEFAULT NULL,
  `gambar` varchar(250) DEFAULT NULL,
  `aktif_barang` char(1) DEFAULT '1',
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `mst_barang` */

insert  into `mst_barang`(`id_barang`,`kode_barang`,`kode_barcode`,`nama_barang`,`alias1`,`alias2`,`alias3`,`alias4`,`jenis_barang`,`id_mobil`,`tahun_mobil`,`id_kategori`,`id_sub_kategori1`,`id_sub_kategori2`,`id_sub_kategori3`,`gambar`,`aktif_barang`) values (3,'bg1212',NULL,'RING','aa','bb','cc','ddd','SINGLE',2,'2018',1,1,2,2,NULL,'1'),(4,'abc123',NULL,'SPION','aa','re','ww','werw','SUB KOMPONEN',2,'2019',2,1,2,2,NULL,'1'),(7,'aa22424','','PINTU MOBIL','aab','','','','SUB KOMPONEN',1,'2018',1,0,0,0,NULL,'1'),(8,'nf23131','C06','BAUT','bb','','','','SINGLE',1,'2012',1,0,0,0,NULL,'1'),(9,'g4343','2323','afafa','araereere','rere','werwtw','qeqeqeqr','SINGLE',1,'2000',1,3,2,2,NULL,'1'),(10,'BG-911','','JOK','','','','','SINGLE',2,'2014',2,2,1,1,'acbc0e6034aab24ca3607bd6313f27bf.jpg','1');

/*Table structure for table `mst_barang_komponen` */

DROP TABLE IF EXISTS `mst_barang_komponen`;

CREATE TABLE `mst_barang_komponen` (
  `id_barang_komponen` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang` int(11) NOT NULL,
  `id_komponen` int(11) DEFAULT NULL,
  `qty_komponen` int(11) DEFAULT NULL,
  `aktif_barang_komponen` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_barang_komponen`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `mst_barang_komponen` */

insert  into `mst_barang_komponen`(`id_barang_komponen`,`id_barang`,`id_komponen`,`qty_komponen`,`aktif_barang_komponen`) values (15,9,8,2,'1'),(17,7,3,10,'1'),(18,9,3,2,'1'),(22,7,9,2,'1'),(27,4,8,25,'1'),(28,7,8,2,'1');

/*Table structure for table `mst_barang_supplier` */

DROP TABLE IF EXISTS `mst_barang_supplier`;

CREATE TABLE `mst_barang_supplier` (
  `id_barang_supplier` int(11) NOT NULL AUTO_INCREMENT,
  `id_supplier` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `harga_beli` float DEFAULT NULL,
  `tanggal_input` date DEFAULT NULL,
  PRIMARY KEY (`id_barang_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `mst_barang_supplier` */

insert  into `mst_barang_supplier`(`id_barang_supplier`,`id_supplier`,`id_barang`,`harga_beli`,`tanggal_input`) values (1,3,7,55000,NULL),(4,2,8,NULL,NULL),(9,3,8,10000,NULL),(11,3,4,65000,NULL),(12,1,9,NULL,NULL),(13,1,8,NULL,NULL),(14,1,7,NULL,NULL);

/*Table structure for table `mst_gudang` */

DROP TABLE IF EXISTS `mst_gudang`;

CREATE TABLE `mst_gudang` (
  `id_gudang` int(11) NOT NULL AUTO_INCREMENT,
  `nama_gudang` varchar(50) NOT NULL,
  `aktif_gudang` char(1) DEFAULT '1',
  PRIMARY KEY (`id_gudang`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `mst_gudang` */

insert  into `mst_gudang`(`id_gudang`,`nama_gudang`,`aktif_gudang`) values (1,'GUDANG ATAS','1'),(3,'GUDANG BAWAH','1');

/*Table structure for table `mst_harga` */

DROP TABLE IF EXISTS `mst_harga`;

CREATE TABLE `mst_harga` (
  `id_harga` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL,
  `file_import` text,
  `status_harga` enum('OK','BELUM SELESAI INPUT') NOT NULL,
  PRIMARY KEY (`id_harga`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mst_harga` */

/*Table structure for table `mst_harga_detail` */

DROP TABLE IF EXISTS `mst_harga_detail`;

CREATE TABLE `mst_harga_detail` (
  `id_harga_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang` int(11) NOT NULL,
  `harga_beli` float NOT NULL,
  `harga_jual` float NOT NULL,
  `tanggal_input` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_harga_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mst_harga_detail` */

/*Table structure for table `mst_kabupaten` */

DROP TABLE IF EXISTS `mst_kabupaten`;

CREATE TABLE `mst_kabupaten` (
  `id_kabupaten` int(11) NOT NULL AUTO_INCREMENT,
  `id_provinsi` int(11) DEFAULT NULL,
  `nama_kabupaten` varchar(25) NOT NULL,
  `aktif_kabupaten` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_kabupaten`,`nama_kabupaten`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Data for the table `mst_kabupaten` */

insert  into `mst_kabupaten`(`id_kabupaten`,`id_provinsi`,`nama_kabupaten`,`aktif_kabupaten`) values (1,1,'BANDAR LAMPUNG','1'),(2,1,'METRO','1'),(3,1,'MESUJI','1'),(4,1,'Kepulauan Seribu','1'),(5,1,'Jakarta Barat','1'),(6,1,'Jakarta Pusat','1'),(7,1,'Jakarta Selatan','1'),(8,1,'Jakarta Timur','1'),(9,1,'Jakarta Utara','1'),(32,1,'Lebak','1'),(33,1,'Serang','1'),(34,1,'Tangerang','1'),(35,1,'Pandeglang','1'),(36,1,'Tangerang Selatan','1'),(37,1,'Cilegon','1'),(39,1,'bb','1'),(40,2,'aac','1');

/*Table structure for table `mst_karyawan` */

DROP TABLE IF EXISTS `mst_karyawan`;

CREATE TABLE `mst_karyawan` (
  `id_karyawan` int(11) NOT NULL AUTO_INCREMENT,
  `id_posisi` int(11) NOT NULL,
  `nama_karyawan` varchar(70) NOT NULL,
  `no_ktp` varchar(20) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `no_hp2` varchar(15) DEFAULT NULL,
  `no_hp3` varchar(15) DEFAULT NULL,
  `gaji` float DEFAULT NULL,
  `uang_harian` float DEFAULT NULL,
  `aktif_karyawan` char(1) DEFAULT '1',
  PRIMARY KEY (`id_karyawan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `mst_karyawan` */

insert  into `mst_karyawan`(`id_karyawan`,`id_posisi`,`nama_karyawan`,`no_ktp`,`no_hp`,`no_hp2`,`no_hp3`,`gaji`,`uang_harian`,`aktif_karyawan`) values (1,1,'OWNER','','',NULL,NULL,0,0,'1'),(2,4,'SUSI','100313141','082281131334',NULL,NULL,5000000,150000,'1'),(3,5,'NANN','123132','131',NULL,NULL,100000,10000,'1'),(4,3,'Serly','12321','012313','01424214','012321414',323233,5550,'1');

/*Table structure for table `mst_kategori` */

DROP TABLE IF EXISTS `mst_kategori`;

CREATE TABLE `mst_kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(70) NOT NULL,
  `aktif_kategori` char(1) DEFAULT '1',
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `mst_kategori` */

insert  into `mst_kategori`(`id_kategori`,`nama_kategori`,`aktif_kategori`) values (1,'TEST 1','1'),(2,'TEST 2','1'),(3,'abc','1'),(4,'KAT TEST','1');

/*Table structure for table `mst_kecamatan` */

DROP TABLE IF EXISTS `mst_kecamatan`;

CREATE TABLE `mst_kecamatan` (
  `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT,
  `id_kabupaten` int(11) NOT NULL,
  `nama_kecamatan` varchar(50) NOT NULL,
  `aktif_kecamatan` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_kecamatan`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `mst_kecamatan` */

insert  into `mst_kecamatan`(`id_kecamatan`,`id_kabupaten`,`nama_kecamatan`,`aktif_kecamatan`) values (1,1,'Tanjung Karang','1'),(2,1,'Rajabasa','1'),(3,1,'Panjang','1'),(4,2,'XXX1YZ','1'),(5,2,'A','1'),(6,2,'SF','1'),(8,3,'ADA','1'),(9,16,'Kepulauan Seribu Utara','1'),(10,16,'Kepulauan Seribu Selatan','1'),(11,17,'Kembangan','1'),(12,18,'Kemayoran','1'),(13,21,'Kelapa Gading','1'),(14,17,'Kebon Jeruk','1'),(15,19,'Kebayoran Lama','1'),(16,19,'Kebayoran Baru','1'),(17,17,'Kalideres','1'),(18,18,'Johar Baru','1'),(19,20,'Jatinegara','1'),(20,19,'Jagakarsa','1'),(21,17,'Grogol Petamburan','1'),(22,18,'Gambir','1'),(23,20,'Duren Sawit','1'),(24,20,'Ciracas','1'),(25,20,'Cipayung','1'),(26,21,'Cilincing','1'),(27,19,'Cilandak','1'),(28,17,'Cengkareng','1'),(29,18,'Cempaka Putih','1'),(30,20,'Cakung','1'),(31,1,'AAAx','1'),(32,37,'adax','0');

/*Table structure for table `mst_kelurahan` */

DROP TABLE IF EXISTS `mst_kelurahan`;

CREATE TABLE `mst_kelurahan` (
  `id_kelurahan` int(11) NOT NULL AUTO_INCREMENT,
  `id_kecamatan` int(11) DEFAULT NULL,
  `nama_kelurahan` varchar(100) DEFAULT NULL,
  `aktif_kelurahan` char(1) DEFAULT '1',
  PRIMARY KEY (`id_kelurahan`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=latin1;

/*Data for the table `mst_kelurahan` */

insert  into `mst_kelurahan`(`id_kelurahan`,`id_kecamatan`,`nama_kelurahan`,`aktif_kelurahan`) values (1,1,'Kelurahan 1','1'),(2,1,'Kelurahan 2','1'),(3,1,'Kelurahan 3','1'),(4,2,'RAJABASA','1'),(5,2,'KEMILING','1'),(6,3,'TES','1'),(7,278,'Bukit Duri','1'),(8,278,'Kebon Baru','1'),(9,278,'Manggarai','1'),(10,278,'Manggarai Selatan','1'),(11,278,'Menteng Dalam','1'),(12,278,'Tebet Barat','1'),(13,278,'Tebet Timur','1'),(14,279,'Kebon Bawang','1'),(15,279,'Papanggo','1'),(16,279,'Sungai Bambu','1'),(17,279,'Sunter Agung','1'),(18,279,'Sunter Jaya','1'),(19,279,'Tanjung Priok','1'),(20,279,'Warakas','1'),(21,280,'Bendungan Hilir','1'),(22,280,'Gelora','1'),(23,280,'Kampung Bali','1'),(24,280,'Karet Tengsin','1'),(25,280,'Kebon Kacang','1'),(26,280,'Kebon Melati','1'),(27,280,'Petamburan','1'),(28,281,'Angke','1'),(29,281,'Duri Selatan','1'),(30,281,'Duri Utara','1'),(31,281,'Jembatan Besi','1'),(32,281,'Jembatan Lima','1'),(33,281,'Kali Anyar','1'),(34,281,'Krendang','1'),(35,281,'Pekojan','1'),(36,281,'Roa Malaka','1'),(37,281,'Tambora','1'),(38,281,'Tanah Sereal','1'),(39,282,'Glodok','1'),(40,282,'Keagungan','1'),(41,282,'Krukut','1'),(42,282,'Mangga Besar','1'),(43,282,'Maphar','1'),(44,282,'Pinangsia','1'),(45,282,'Taman Sari','1'),(46,282,'Tangki','1'),(47,283,'Guntur','1'),(48,283,'Karet','1'),(49,283,'Karet Kuningan','1'),(50,283,'Karet Semanggi','1'),(51,283,'Kuningan Timur','1'),(52,283,'Menteng Atas','1'),(53,283,'Pasar Manggis','1'),(54,283,'Setiabudi','1'),(55,284,'Bungur','1'),(56,284,'Kenari','1'),(57,284,'Kramat','1'),(58,284,'Kwitang','1'),(59,284,'Paseban','1'),(60,284,'Senen','1'),(61,285,'Gunung Sahari Utara','1'),(62,285,'Karang Anyar','1'),(63,285,'Kartini','1'),(64,285,'Mangga Dua Selatan','1'),(65,285,'Pasar Baru','1'),(66,286,'Cipinang','1'),(67,286,'Jati','1'),(68,286,'Jatinegara Kaum','1'),(69,286,'Kayu Putih','1'),(70,286,'Pisangan Timur','1'),(71,286,'Pulo Gadung','1'),(72,286,'Rawamangun','1'),(73,287,'Bintaro','1'),(74,287,'Pesanggrahan','1'),(75,287,'Petukangan Selatan','1'),(76,287,'Petukangan Utara','1'),(77,287,'Ulujami','1'),(78,288,'Kamal Muara','1'),(79,288,'Kapuk Muara','1'),(80,288,'Pejagalan','1'),(81,288,'Penjaringan','1'),(82,288,'Pluit','1'),(83,289,'Baru','1'),(84,289,'Cijantung','1'),(85,289,'Gedong','1'),(86,289,'Kalisari','1'),(87,289,'Pekayon','1'),(88,290,'Cilandak Timur','1'),(89,290,'Jati Padang','1'),(90,290,'Kebagusan','1'),(91,290,'Pasar Minggu','1'),(92,290,'Pejaten Barat','1'),(93,290,'Pejaten Timur','1'),(94,290,'Ragunan','1'),(95,291,'Cikoko','1'),(96,291,'Duren Tiga','1'),(97,291,'Kalibata','1'),(98,291,'Pancoran','1'),(99,291,'Pengadegan','1'),(100,291,'Rawa Jati','1'),(101,292,'Jatipulo','1'),(102,292,'Kemanggisan','1'),(103,292,'Kota Bambu Selatan','1'),(104,292,'Kota Bambu Utara','1'),(105,292,'Palmerah','1'),(106,292,'Slipi','1'),(107,293,'Ancol','1'),(108,293,'Pademangan Barat','1'),(109,293,'Pademangan Timur','1'),(110,294,'Cikini','1'),(111,294,'Gondangdia','1'),(112,294,'Kebon Sirih','1'),(113,294,'Menteng','1'),(114,294,'Pegangsaan','1'),(115,295,'Kayu Manis','1'),(116,295,'Kebon Manggis','1'),(117,295,'Pal Meriam','1'),(118,295,'Pisangan Baru','1'),(119,295,'Utan Kayu Selatan','1'),(120,295,'Utan Kayu Utara','1'),(121,296,'Bangka','1'),(122,296,'Kuningan Barat','1'),(123,296,'Mampang Prapatan','1'),(124,296,'Pela Mampang','1'),(125,296,'Tegal Parang','1'),(126,297,'Cipinang Melayu','1'),(127,297,'Halim Perdana Kusumah','1'),(128,297,'Kebon Pala','1'),(129,297,'Makasar','1'),(130,297,'Pinang Ranti','1'),(131,298,'Balekambang','1'),(132,298,'Batuampar','1'),(133,298,'Cawang','1'),(134,298,'Cililitan','1'),(135,298,'Dukuh','1'),(136,298,'Kampung Tengah','1'),(137,298,'Kramat Jati','1'),(138,299,'Koja (Utara, Selatan)','1'),(139,299,'Lagoa','1'),(140,299,'Rawa Badak Selatan','1'),(141,299,'Rawa Badak Utara','1'),(142,299,'Tugu Selatan','1'),(143,299,'Tugu Utara','1'),(144,256,'Pulau Harapan','1'),(145,256,'Pulau Kelapa','1'),(146,256,'Pulau Panggang','1'),(147,257,'Pulau Pari','1'),(148,257,'Pulau Tidung','1'),(149,257,'Pulau Untung Jawa','1'),(150,258,'Joglo','1'),(151,258,'Kembangan Selatan','1'),(152,258,'Kembangan Utara','1'),(153,258,'Meruya Selatan (Udik)','1'),(154,258,'Meruya Utara (Ilir)','1'),(155,258,'Srengseng','1'),(156,259,'Cempaka Baru','1'),(157,259,'Gunung Sahari Selatan','1'),(158,259,'Harapan Mulya','1'),(159,259,'Kebon Kosong','1'),(160,259,'Kemayoran','1'),(161,259,'Serdang','1'),(162,259,'Sumur Batu','1'),(163,259,'Utan Panjang','1'),(164,260,'Kelapa Gading Barat','1'),(165,260,'Kelapa Gading Timur','1'),(166,260,'Pegangsaan Dua','1'),(167,261,'Duri Kepa','1'),(168,261,'Kebon Jeruk','1'),(169,261,'Kedoya Selatan','1'),(170,261,'Kedoya Utara','1'),(171,261,'Kelapa Dua','1'),(172,261,'Sukabumi Selatan (Udik)','1'),(173,261,'Sukabumi Utara (Ilir)','1'),(174,262,'Cipulir','1'),(175,262,'Grogol Selatan','1'),(176,262,'Grogol Utara','1'),(177,262,'Kebayoran Lama Selatan','1'),(178,262,'Kebayoran Lama Utara','1'),(179,262,'Pondok Pinang','1'),(180,263,'Cipete Utara','1'),(181,263,'Gandaria Utara','1'),(182,263,'Gunung','1'),(183,263,'Kramat Pela','1'),(184,263,'Melawai','1'),(185,263,'Petogogan','1'),(186,263,'Pulo','1'),(187,263,'Rawa Barat','1'),(188,263,'Selong','1'),(189,263,'Senayan','1'),(190,264,'Kalideres','1'),(191,264,'Kamal','1'),(192,264,'Pegadungan','1'),(193,264,'Semanan','1'),(194,264,'Tegal Alur','1'),(195,265,'Galur','1'),(196,265,'Johar Baru','1'),(197,265,'Kampung Rawa','1'),(198,265,'Tanah Tinggi','1'),(199,266,'Bali Mester','1'),(200,266,'Bidaracina','1'),(201,266,'Cipinang Besar Selatan','1'),(202,266,'Cipinang Besar Utara','1'),(203,266,'Cipinang Cempedak','1'),(204,266,'Cipinang Muara','1'),(205,266,'Kampung Melayu','1'),(206,266,'Rawa Bunga','1'),(207,267,'Ciganjur','1'),(208,267,'Cipedak','1'),(209,267,'Jagakarsa','1'),(210,267,'Lenteng Agung','1'),(211,267,'Srengseng Sawah','1'),(212,267,'Tanjung Barat','1'),(213,268,'Grogol','1'),(214,268,'Jelambar','1'),(215,268,'Jelambar Baru','1'),(216,268,'Tanjung Duren Selatan','1'),(217,268,'Tanjung Duren Utara','1'),(218,268,'Tomang','1'),(219,268,'Wijaya Kusuma','1'),(220,269,'Cideng','1'),(221,269,'Duri Pulo','1'),(222,269,'Gambir','1'),(223,269,'Kebon Kelapa','1'),(224,269,'Petojo Selatan','1'),(225,269,'Petojo Utara','1'),(226,270,'Duren Sawit','1'),(227,270,'Klender','1'),(228,270,'Malaka Jaya','1'),(229,270,'Malaka Sari','1'),(230,270,'Pondok Bambu','1'),(231,270,'Pondok Kelapa','1'),(232,270,'Pondok Kopi','1'),(233,271,'Cibubur','1'),(234,271,'Ciracas','1'),(235,271,'Kelapa Dua Wetan','1'),(236,271,'Rambutan','1'),(237,271,'Susukan','1'),(238,272,'Bambu Apus','1'),(239,272,'Ceger','1'),(240,272,'Cilangkap','1'),(241,272,'Cipayung','1'),(242,272,'Lubang Buaya','1'),(243,272,'Munjul','1'),(244,272,'Pondok Rangon','1'),(245,272,'Setu','1'),(246,273,'Cilincing','1'),(247,273,'Kali Baru','1'),(248,273,'Marunda','1'),(249,273,'Rorotan','1'),(250,273,'Semper Barat','1'),(251,273,'Semper Timur','1'),(252,273,'Sukapura','1'),(253,274,'Cilandak Barat','1'),(254,274,'Cipete Selatan','1'),(255,274,'Gandaria Selatan','1'),(256,274,'Lebak Bulus','1'),(257,274,'Pondok Labu','1'),(258,275,'Cengkareng Barat','1'),(259,275,'Cengkareng Timur','1'),(260,275,'Duri Kosambi','1'),(261,275,'Kapuk','1'),(262,275,'Kedaung Kali Angke','1'),(263,275,'Rawa Buaya','1'),(264,276,'Cempaka Putih Barat','1'),(265,276,'Cempaka Putih Timur','1'),(266,276,'Rawasari','1'),(267,277,'Cakung Barat','1'),(268,277,'Cakung Timur','1'),(269,277,'Jatinegara','1'),(270,277,'Penggilingan','1'),(271,277,'Pulo Gebang','1'),(272,277,'Rawa Terate','1'),(273,277,'Ujung Menteng','1'),(274,5,'BBX','0');

/*Table structure for table `mst_mobil` */

DROP TABLE IF EXISTS `mst_mobil`;

CREATE TABLE `mst_mobil` (
  `id_mobil` int(11) NOT NULL AUTO_INCREMENT,
  `id_model` int(11) DEFAULT NULL,
  `nama_mobil` varchar(150) NOT NULL,
  `transmisi` varchar(20) DEFAULT NULL,
  `aktif_mobil` char(1) DEFAULT '1',
  PRIMARY KEY (`id_mobil`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `mst_mobil` */

insert  into `mst_mobil`(`id_mobil`,`id_model`,`nama_mobil`,`transmisi`,`aktif_mobil`) values (1,3,'JAZ 34','AUTOMATIC','1'),(2,1,'BRIO E.232','MANUAL','1'),(3,2,'AVANZA X.23','MANUAL','1'),(4,4,'X224','MANUAL','1');

/*Table structure for table `mst_model` */

DROP TABLE IF EXISTS `mst_model`;

CREATE TABLE `mst_model` (
  `id_model` int(11) NOT NULL AUTO_INCREMENT,
  `nama_model` varchar(50) DEFAULT NULL,
  `aktif_model` char(1) DEFAULT '1',
  PRIMARY KEY (`id_model`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `mst_model` */

insert  into `mst_model`(`id_model`,`nama_model`,`aktif_model`) values (1,'BRIO','1'),(2,'AVANZA','1'),(3,'JAZZ','1'),(4,'INOVA','1');

/*Table structure for table `mst_pelanggan` */

DROP TABLE IF EXISTS `mst_pelanggan`;

CREATE TABLE `mst_pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_pelanggan` enum('UMUM','VIP') NOT NULL,
  `nama_pelanggan` varchar(150) NOT NULL,
  `no_ktp` char(20) DEFAULT NULL,
  `no_hp` char(15) DEFAULT NULL,
  `no_telepon` char(15) DEFAULT NULL,
  `alamat` text,
  `id_kabupaten` int(11) DEFAULT NULL,
  `id_kecamatan` int(11) DEFAULT NULL,
  `id_kelurahan` int(11) DEFAULT NULL,
  `kodepos` char(7) DEFAULT NULL,
  `plafon` float DEFAULT NULL,
  `blacklist` char(1) DEFAULT '0',
  `aktif_pelanggan` char(1) DEFAULT '1',
  `status_transaksi` char(1) DEFAULT '0',
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mst_pelanggan` */

/*Table structure for table `mst_posisi` */

DROP TABLE IF EXISTS `mst_posisi`;

CREATE TABLE `mst_posisi` (
  `id_posisi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_posisi` varchar(70) NOT NULL,
  PRIMARY KEY (`id_posisi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `mst_posisi` */

insert  into `mst_posisi`(`id_posisi`,`nama_posisi`) values (1,'OWNER'),(2,'GUDANG'),(3,'KASIR'),(4,'PENJUALAN'),(5,'PEMBELIAN');

/*Table structure for table `mst_provinsi` */

DROP TABLE IF EXISTS `mst_provinsi`;

CREATE TABLE `mst_provinsi` (
  `id_provinsi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_provinsi` varchar(50) DEFAULT NULL,
  `aktif_provinsi` char(1) DEFAULT '1',
  PRIMARY KEY (`id_provinsi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `mst_provinsi` */

insert  into `mst_provinsi`(`id_provinsi`,`nama_provinsi`,`aktif_provinsi`) values (1,'LAMPUNG','1'),(2,'PALEMBANG','1');

/*Table structure for table `mst_rak` */

DROP TABLE IF EXISTS `mst_rak`;

CREATE TABLE `mst_rak` (
  `id_rak` int(11) NOT NULL AUTO_INCREMENT,
  `id_gudang` int(11) NOT NULL,
  `nama_rak` varchar(15) NOT NULL,
  `aktif_rak` char(1) DEFAULT '1',
  PRIMARY KEY (`id_rak`),
  UNIQUE KEY `NewIndex1` (`nama_rak`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `mst_rak` */

insert  into `mst_rak`(`id_rak`,`id_gudang`,`nama_rak`,`aktif_rak`) values (1,1,'C02','1');

/*Table structure for table `mst_sub_kategori1` */

DROP TABLE IF EXISTS `mst_sub_kategori1`;

CREATE TABLE `mst_sub_kategori1` (
  `id_sub_kategori1` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(11) DEFAULT NULL,
  `nama_sub1` varchar(70) NOT NULL,
  `aktif_sub1` char(1) DEFAULT '1',
  PRIMARY KEY (`id_sub_kategori1`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `mst_sub_kategori1` */

insert  into `mst_sub_kategori1`(`id_sub_kategori1`,`id_kategori`,`nama_sub1`,`aktif_sub1`) values (1,1,'sub1','1'),(2,2,'sub 11','1'),(3,1,'sudada','1'),(5,3,'tes 123','1'),(6,2,'xxx','1'),(7,4,'SUB KAT TEST 1','1');

/*Table structure for table `mst_sub_kategori2` */

DROP TABLE IF EXISTS `mst_sub_kategori2`;

CREATE TABLE `mst_sub_kategori2` (
  `id_sub_kategori2` int(11) NOT NULL AUTO_INCREMENT,
  `id_sub_kategori1` int(11) DEFAULT NULL,
  `nama_sub2` varchar(70) NOT NULL,
  `aktif_sub2` char(1) DEFAULT '1',
  PRIMARY KEY (`id_sub_kategori2`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `mst_sub_kategori2` */

insert  into `mst_sub_kategori2`(`id_sub_kategori2`,`id_sub_kategori1`,`nama_sub2`,`aktif_sub2`) values (1,2,'sub222','1'),(2,3,'sub2','1'),(3,5,'baba','1'),(4,2,'tes','1');

/*Table structure for table `mst_sub_kategori3` */

DROP TABLE IF EXISTS `mst_sub_kategori3`;

CREATE TABLE `mst_sub_kategori3` (
  `id_sub_kategori3` int(11) NOT NULL AUTO_INCREMENT,
  `id_sub_kategori2` int(11) DEFAULT NULL,
  `nama_sub3` varchar(70) NOT NULL,
  `aktif_sub3` char(1) DEFAULT '1',
  PRIMARY KEY (`id_sub_kategori3`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `mst_sub_kategori3` */

insert  into `mst_sub_kategori3`(`id_sub_kategori3`,`id_sub_kategori2`,`nama_sub3`,`aktif_sub3`) values (1,1,'sn3xx','1'),(2,2,'sub3','1'),(3,1,'sn3323','1'),(4,3,'vava','1');

/*Table structure for table `mst_supplier` */

DROP TABLE IF EXISTS `mst_supplier`;

CREATE TABLE `mst_supplier` (
  `id_supplier` int(11) NOT NULL AUTO_INCREMENT,
  `kode_supplier` varchar(15) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat_supplier` varchar(150) DEFAULT NULL,
  `no_telepon_supplier` varchar(15) NOT NULL,
  `no_telepon_supplier2` varchar(15) DEFAULT NULL,
  `no_telepon_supplier3` varchar(15) DEFAULT NULL,
  `no_fax` varchar(15) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `no_telepon_contact_person` varchar(15) DEFAULT NULL,
  `no_rekening` varchar(20) DEFAULT NULL,
  `nama_bank` varchar(25) DEFAULT NULL,
  `nama_rekening` varchar(50) DEFAULT NULL,
  `no_rekening2` varchar(20) DEFAULT NULL,
  `nama_bank2` varchar(25) DEFAULT NULL,
  `nama_rekening2` varchar(50) DEFAULT NULL,
  `no_rekening3` varchar(20) DEFAULT NULL,
  `nama_bank3` varchar(25) DEFAULT NULL,
  `nama_rekening3` varchar(50) DEFAULT NULL,
  `aktif_supplier` char(1) DEFAULT '1',
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `mst_supplier` */

insert  into `mst_supplier`(`id_supplier`,`kode_supplier`,`nama_supplier`,`alamat_supplier`,`no_telepon_supplier`,`no_telepon_supplier2`,`no_telepon_supplier3`,`no_fax`,`contact_person`,`no_telepon_contact_person`,`no_rekening`,`nama_bank`,`nama_rekening`,`no_rekening2`,`nama_bank2`,`nama_rekening2`,`no_rekening3`,`nama_bank3`,`nama_rekening3`,`aktif_supplier`) values (1,'SP1','SUZUKI','JL XXX','0721',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(2,'SP2','HONDA','AAA','08123131',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(3,'SP3','HINO','S','0721231',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(4,'MH232','TOYOTA','XXZZSS','023131','0151515','01421414','021331','JAKA','02424','012313','BNI','NANA','0131343','BCA','NINI','23232','BRI','YAYA','1');

/*Table structure for table `mst_user` */

DROP TABLE IF EXISTS `mst_user`;

CREATE TABLE `mst_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `NewIndex1` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `mst_user` */

insert  into `mst_user`(`id_user`,`id_karyawan`,`username`,`password`) values (1,1,'owner','123'),(3,2,'susi','123');

/*Table structure for table `mutasi_rak` */

DROP TABLE IF EXISTS `mutasi_rak`;

CREATE TABLE `mutasi_rak` (
  `id_mutasi_rak` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_rak` int(11) NOT NULL,
  `tanggal_mutasi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_mutasi` enum('BELUM SELESAI INPUT','DISETUJUI','MENUNGGU KONFIRMASI','DITOLAK') NOT NULL,
  PRIMARY KEY (`id_mutasi_rak`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mutasi_rak` */

/*Table structure for table `mutasi_rak_detail` */

DROP TABLE IF EXISTS `mutasi_rak_detail`;

CREATE TABLE `mutasi_rak_detail` (
  `id_mutasi_rak_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang` int(11) DEFAULT NULL,
  `qty_mutasi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mutasi_rak_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mutasi_rak_detail` */

/*Table structure for table `pembayaran` */

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_pembelian` int(11) DEFAULT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `jenis_bayar` enum('RETUR','NON RETUR') DEFAULT NULL,
  `id_retur_pembelian` int(11) DEFAULT NULL,
  `jumlah_bayar` float DEFAULT NULL,
  `id_karyawan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembayaran` */

/*Table structure for table `pembelian` */

DROP TABLE IF EXISTS `pembelian`;

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` int(11) NOT NULL,
  `no_pembelian` varchar(25) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `tanggal_pembelian` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_bayar` char(1) NOT NULL DEFAULT '0',
  `status_datang` char(1) DEFAULT '0',
  `ppn` float DEFAULT NULL,
  `jenis_diskon` enum('Rp','%') DEFAULT NULL,
  `diskon` float DEFAULT NULL,
  `input_beli` char(1) DEFAULT '0',
  PRIMARY KEY (`id_pembelian`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `pembelian` */

insert  into `pembelian`(`id_pembelian`,`id_karyawan`,`no_pembelian`,`id_supplier`,`tanggal_pembelian`,`status_bayar`,`status_datang`,`ppn`,`jenis_diskon`,`diskon`,`input_beli`) values (25,1,'NB-11',3,'2018-11-10 10:35:16','0','1',2.5,'%',1.5,'1'),(26,1,'NB-567',1,'2018-11-12 16:20:24','0','0',0,'',0,'1'),(27,1,'NB-4141414',3,'2018-11-24 18:05:53','0','0',1.3,'%',10,'1');

/*Table structure for table `pembelian_detail` */

DROP TABLE IF EXISTS `pembelian_detail`;

CREATE TABLE `pembelian_detail` (
  `id_pembelian_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_pembelian` int(11) DEFAULT NULL,
  `id_barang` int(11) NOT NULL,
  `qty_beli` int(11) NOT NULL,
  `qty_masuk` int(11) DEFAULT NULL,
  `rak` varchar(11) DEFAULT NULL,
  `harga_beli` float DEFAULT NULL,
  `diskon_beli` float DEFAULT NULL,
  `kode_barcode_add` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_pembelian_detail`),
  KEY `FK_pembelian_detail` (`id_pembelian`),
  CONSTRAINT `FK_pembelian_detail` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `pembelian_detail` */

insert  into `pembelian_detail`(`id_pembelian_detail`,`id_pembelian`,`id_barang`,`qty_beli`,`qty_masuk`,`rak`,`harga_beli`,`diskon_beli`,`kode_barcode_add`) values (27,25,4,70,70,'C02',65000,3.2,'1811101035SP3ABC123'),(28,25,8,50,50,'C02',10000,0,NULL),(29,25,7,20,20,'C02',55000,4,'1811101035SP3AA22424'),(30,26,7,44,NULL,NULL,10000,0,NULL),(31,26,8,22,22,'C02',15000,0,NULL),(32,27,4,40,28,'C02',65000,0,'1811240605SP3ABC123'),(33,27,8,30,4,'C02',10000,0,NULL),(34,27,7,10,NULL,NULL,0,0,NULL);

/*Table structure for table `retur_pembelian` */

DROP TABLE IF EXISTS `retur_pembelian`;

CREATE TABLE `retur_pembelian` (
  `id_retur_pembelian` int(11) NOT NULL AUTO_INCREMENT,
  `no_retur_pembelian` varchar(15) DEFAULT NULL,
  `id_pembelian` int(11) DEFAULT NULL,
  `id_karyawan` int(11) DEFAULT NULL,
  `tanggal_retur` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `input_retur` char(1) DEFAULT '0',
  `status_keluar` char(1) DEFAULT '0',
  PRIMARY KEY (`id_retur_pembelian`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `retur_pembelian` */

insert  into `retur_pembelian`(`id_retur_pembelian`,`no_retur_pembelian`,`id_pembelian`,`id_karyawan`,`tanggal_retur`,`input_retur`,`status_keluar`) values (7,'NR.181124.001',25,1,'2018-11-24 19:28:57','1','0');

/*Table structure for table `retur_pembelian_detail` */

DROP TABLE IF EXISTS `retur_pembelian_detail`;

CREATE TABLE `retur_pembelian_detail` (
  `id_retur_pembelian_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_retur_pembelian` int(11) DEFAULT NULL,
  `id_pembelian_detail` int(11) DEFAULT NULL,
  `qty_retur` float DEFAULT NULL,
  `harga_retur` float DEFAULT NULL,
  PRIMARY KEY (`id_retur_pembelian_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `retur_pembelian_detail` */

insert  into `retur_pembelian_detail`(`id_retur_pembelian_detail`,`id_retur_pembelian`,`id_pembelian_detail`,`qty_retur`,`harga_retur`) values (6,7,29,13,55000);

/*Table structure for table `stok` */

DROP TABLE IF EXISTS `stok`;

CREATE TABLE `stok` (
  `id_stok` int(11) NOT NULL AUTO_INCREMENT,
  `id_pembelian_detail` int(11) DEFAULT NULL,
  `rak` varchar(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `kode_barcode_stok` varchar(40) DEFAULT NULL,
  `input_stok` char(1) DEFAULT '0',
  PRIMARY KEY (`id_stok`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

/*Data for the table `stok` */

insert  into `stok`(`id_stok`,`id_pembelian_detail`,`rak`,`id_barang`,`stok`,`kode_barcode_stok`,`input_stok`) values (21,27,'C02',4,70,'1811101035SP3ABC123','1'),(23,29,'C02',7,20,'1811101035SP3AA22424','1'),(32,28,'C02',8,50,'C06','1'),(33,31,'C02',8,22,'C06','0'),(34,33,'C02',8,4,'C06','0'),(35,32,'C02',4,28,'1811240605SP3ABC123','0');

/*Table structure for table `stok_komponen` */

DROP TABLE IF EXISTS `stok_komponen`;

CREATE TABLE `stok_komponen` (
  `id_stok_komponen` int(11) NOT NULL AUTO_INCREMENT,
  `id_stok` int(11) DEFAULT NULL,
  `id_komponen` int(11) DEFAULT NULL,
  `stok_komponen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_stok_komponen`),
  KEY `FK_stok_komponen` (`id_stok`),
  CONSTRAINT `FK_stok_komponen` FOREIGN KEY (`id_stok`) REFERENCES `stok` (`id_stok`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

/*Data for the table `stok_komponen` */

insert  into `stok_komponen`(`id_stok_komponen`,`id_stok`,`id_komponen`,`stok_komponen`) values (42,21,8,15),(43,23,3,5),(44,23,8,6),(45,23,9,7),(46,35,8,25);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
