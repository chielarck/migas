<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Penagihan_model extends CI_Model {
	public function cek($in) {
		$bulan = $in['bulan'];
		$tahun = $in['tahun'];
	
	$q = $this->db->query("SELECT * FROM vw_tagihan WHERE MONTH(tanggal_event)='$bulan' AND YEAR(tanggal_event)='$tahun' ORDER BY id_tagihan ASC");
		return $q;
	}
	public function get_penagihan() {
		$q = $this->db->query("SELECT * FROM vw_tagihan ORDER BY id_tagihan ASC");
		return $q;
	}
}