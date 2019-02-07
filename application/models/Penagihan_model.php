<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Penagihan_model extends CI_Model {
	public function cek($in) {
		$bulan = $in['bulan'];
		$tahun = $in['tahun'];
	
	$q = $this->db->query("SELECT * FROM vw_tagihan WHERE MONTH(tanggal_event)='$bulan' AND YEAR(tanggal_event)='$tahun' ORDER BY nama_jenis,nama_pt ASC");
		return $q;
	}
	public function get_penagihan() {
		$q = $this->db->query("SELECT * FROM vw_tagihan ORDER BY nama_jenis,nama_pt ASC");
		return $q;
	}

	public function get_combo_anggota($id="") {
		$hasil = "";
		$q = $this->db->query("SELECT * FROM tbl_anggota WHERE aktif = '1' ORDER BY nama_pt ASC");
		$hasil .= '<option selected="selected" value="ALL">[SEMUA ANGGOTA] </option>';
		foreach($q->result() as $h) {
			if($id == $h->id_anggota) {
				$hasil .= '<option value="'.$h->id_anggota.'" selected="selected">'.$h->nama_pt.'</option>';
			} else {
				$hasil .= '<option value="'.$h->id_anggota.'">'.$h->nama_pt.'</option>';
			}
		}
		return $hasil;
	}
}