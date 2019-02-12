<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Penagihan_model extends CI_Model {
	public function cek($in) {
		$bulan = $in['bulan'];
		$tahun = $in['tahun'];
	
	$q = $this->db->query("SELECT * FROM vw_tagihan WHERE MONTH(tanggal_event)='$bulan' AND YEAR(tanggal_event)='$tahun' ORDER BY nama_jenis,nama_pt ASC");
		return $q;
	}
	public function get_penagihan($d) {
		$bulan = $d['bulan'];
		$tahun = $d['tahun'];
		$q = $this->db->query("SELECT * FROM vw_tagihan WHERE MONTH(tanggal_event)='$bulan' AND YEAR(tanggal_event)='$tahun' ORDER BY nama_jenis,nama_pt ASC");
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


	public function get_combo_group($id="") {
		$hasil = "";
		$q = $this->db->query("SELECT * FROM tbl_group  ORDER BY id_group ASC");
		$hasil .= '<option selected="selected" value="ALL">[SEMUA GROUP] </option>';
		foreach($q->result() as $h) {
			if($id == $h->id_group) {
				$hasil .= '<option value="'.$h->id_group.'" selected="selected">'.$h->nama_group.'</option>';
			} else {
				$hasil .= '<option value="'.$h->id_group.'">'.$h->nama_group.'</option>';
			}
		}
		return $hasil;
	}

	public function get_combo_jenis($id="") {
		$hasil = "";
		$q = $this->db->query("SELECT * FROM tbl_jenis  ORDER BY id_jenis ASC");
		$hasil .= '<option selected="selected" value="ALL">[SEMUA USAHA] </option>';
		foreach($q->result() as $h) {
			if($id == $h->id_jenis) {
				$hasil .= '<option value="'.$h->id_jenis.'" selected="selected">'.$h->nama_jenis.'</option>';
			} else {
				$hasil .= '<option value="'.$h->id_jenis.'">'.$h->nama_jenis.'</option>';
			}
		}
		return $hasil;
	}
}