<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Laporan extends CI_Controller {

	public function __construct(){
		parent::__construct();
			$this->load->Model('Penagihan_model');
	}

	public function index() {
		redirect(base_url());
	}


	public function kaskeluar($bulan="",$tahun="") {
		if($this->session->userdata('username') != "") { 
			
			if(empty($tahun)) {
				$d['tahun'] = date("Y");
			} else {
				$d['tahun'] = $tahun;
			}

			if(empty($bulan)) {
				$d['bulan'] = date("m");
				$param = "WHERE MONTH(tanggal)='$d[bulan]' AND YEAR(tanggal)='$d[tahun]'";
			} else {
				$d['bulan'] = $bulan;
				$param = "WHERE MONTH(tanggal)='$d[bulan]' AND YEAR(tanggal)='$d[tahun]'";
			}


			$d['kaskeluar'] = $this->db->query("SELECT * FROM tbl_kaskeluar $param ORDER BY tanggal DESC");
			$this->load->view('top',$d);
			$this->load->view('laporan/kaskeluar');
			$this->load->view('bottom');
		} else {
			redirect("login");
		}
	}


	public function cari_kaskeluar(){
		if($this->session->userdata('username') != "") { 
			redirect("laporan/kaskeluar/".$this->input->post("bulan")."/".$this->input->post("tahun"));
		} else {
			redirect("login");
		}
	}

	public function kaskeluar_export($bulan="",$tahun="") {
		if($this->session->userdata('username') != "") { 
			
			if(empty($tahun)) {
				$d['tahun'] = date("Y");
			} else {
				$d['tahun'] = $tahun;
			}

			if(empty($bulan)) {
				$d['bulan'] = date("m");
				$param = "WHERE MONTH(tanggal)='$d[bulan]' AND YEAR(tanggal)='$d[tahun]'";
			} else {
				$d['bulan'] = $bulan;
				$param = "WHERE MONTH(tanggal)='$d[bulan]' AND YEAR(tanggal)='$d[tahun]'";
			}


			$d['kaskeluar'] = $this->db->query("SELECT * FROM tbl_kaskeluar $param ORDER BY tanggal DESC");
			$this->load->view('laporan/kaskeluar_export',$d);
		} else {
			redirect("login");
		}
	}


	public function penagihan($bulan="",$tahun="",$anggota="",$status="") {
		if($this->session->userdata('username') != "") { 
			
			if(empty($tahun)) {
				$d['tahun'] = date("Y");
			} else {
				$d['tahun'] = $tahun;
			}
			$d['combo_anggota'] = $this->Penagihan_model->get_combo_anggota($anggota);



			if(empty($bulan)) {
				$d['bulan'] = date("m");
				$param = "WHERE MONTH(tanggal_event)='$d[bulan]' AND YEAR(tanggal_event)='$d[tahun]'";
			} else {
				$d['bulan'] = $bulan;
				$param = "WHERE MONTH(tanggal_event)='$d[bulan]' AND YEAR(tanggal_event)='$d[tahun]'";
			}

			if($anggota == 'ALL' || empty($anggota)) {
				$param2 = '';
				$d['anggota'] = 'ALL';
			} else {
				$param2 = 'AND tbl_tagihan.id_anggota = '.$anggota;
				$d['anggota'] = $anggota;
			}

			if(empty($status)) {
				$d['status'] = '';
				$param3 = '';
			} else if($status == '2') {
				$d['status'] = '2';
				$param3 = 'AND tanggal IS NULL OR tanggal = 0';
			} else {
				$d['status'] = '1';
				$param3 = 'AND tanggal IS NOT NULL AND tanggal != 0';
			}

			$d['penagihan'] = $this->db->query("SELECT * FROM tbl_tagihan 
													INNER JOIN tbl_anggota ON tbl_tagihan.id_anggota = tbl_anggota.id_anggota
													INNER JOIN tbl_jenis ON tbl_anggota.id_jenis = tbl_jenis.id_jenis $param $param2 $param3 ORDER BY nama_jenis ASC");
			$this->load->view('top',$d);
			$this->load->view('laporan/penagihan');
			$this->load->view('bottom');
		} else {
			redirect("login");
		}
	}

	public function cari(){
		if($this->session->userdata('username') != "") { 
			redirect("laporan/penagihan/".$this->input->post("bulan")."/".$this->input->post("tahun")."/".$this->input->post("anggota")."/".$this->input->post("status"));
		} else {
			redirect("login");
		}
	}



	public function penagihan_export($bulan="",$tahun="",$anggota="",$status="") {
		if($this->session->userdata('username') != "") { 
			
			if(empty($tahun)) {
				$d['tahun'] = date("Y");
			} else {
				$d['tahun'] = $tahun;
			}
			$d['combo_anggota'] = $this->Penagihan_model->get_combo_anggota($anggota);



			if(empty($bulan)) {
				$d['bulan'] = date("m");
				$param = "WHERE MONTH(tanggal_event)='$d[bulan]' AND YEAR(tanggal_event)='$d[tahun]'";
			} else {
				$d['bulan'] = $bulan;
				$param = "WHERE MONTH(tanggal_event)='$d[bulan]' AND YEAR(tanggal_event)='$d[tahun]'";
			}

			if($anggota == 'ALL' || empty($anggota)) {
				$param2 = '';
				$d['anggota'] = 'ALL';
			} else {
				$param2 = 'AND tbl_tagihan.id_anggota = '.$anggota;
				$d['anggota'] = $anggota;
			}

			if(empty($status)) {
				$d['status'] = '';
				$param3 = '';
			} else if($status == '2') {
				$d['status'] = '2';
				$param3 = 'AND tanggal IS NULL OR tanggal = 0';
			} else {
				$d['status'] = '1';
				$param3 = 'AND tanggal IS NOT NULL AND tanggal != 0';
			}

			$d['penagihan'] = $this->db->query("SELECT * FROM tbl_tagihan 
													INNER JOIN tbl_anggota ON tbl_tagihan.id_anggota = tbl_anggota.id_anggota
													INNER JOIN tbl_jenis ON tbl_anggota.id_jenis = tbl_jenis.id_jenis $param $param2 $param3 ORDER BY nama_jenis ASC");
			
			$this->load->view('laporan/penagihan_export',$d);
		} else {
			redirect("login");
		}
	}
}