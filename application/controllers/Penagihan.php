<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class penagihan extends CI_Controller {
public function __construct(){
	parent::__construct();
		$this->load->Model('Penagihan_model');
}
	public function index() {

		if($this->session->userdata('username') != "") { 
			$d['bulan'] = date("m");
			$d['tahun'] = date("Y");
			$d['penagihan'] = $this->Penagihan_model->get_penagihan($d);
			$this->load->view('top',$d);
			$this->load->view('penagihan/penagihan');
			$this->load->view('bottom');
		} else {
			redirect("login");
		}
	}


	
	public function generate() {
		if($this->input->method(TRUE) == 'POST' && !empty($_POST)) {
			
			
			$in['bulan'] = $this->input->post('bulan');
			$in['tahun'] = $this->input->post('tahun');
			
			$d['penagihan']=$this->Penagihan_model->cek($in);
			$d['bulan'] = $this->input->post("bulan");
			$d['tahun'] = $this->input->post("tahun");
			$this->load->view('top',$d);
			$this->load->view('penagihan/penagihan');
			$this->load->view('bottom');
			
		} else {
			redirect(base_url());
		}
	}
		

	public function filter_bulan() {
		if($this->input->method(TRUE) == 'POST' && !empty($_POST)) {
			$in['bulan'] = $this->input->post('bulan');
			$in['tahun'] = $this->input->post('tahun');
			if($this->input->post("simpan") == 'buat') {
				$panggil = $in['tahun'].'-'.$in['bulan'].'-'.$in['bulan'];
				$this->db->query("CALL stored_bulanan('$panggil')");
			}
			$d['penagihan']=$this->Penagihan_model->cek($in);
			$d['bulan'] = $this->input->post("bulan");
			$d['tahun'] = $this->input->post("tahun");
			$this->load->view('top',$d);
			$this->load->view('penagihan/penagihan');
			$this->load->view('bottom');
			
		} else {
			redirect(base_url());
		}
	}
		public function live() {
			$input = filter_input_array(INPUT_POST);
			if ($input['action'] == 'edit') {	
			$update_field='';
			if(isset($input['jumlah_bayar'])) {
				$update_field.= "jumlah_bayar='".$input['jumlah_bayar']."'";
			} else if(isset($input['tanggal'])) {
				$update_field.= "tanggal='".$input['tanggal']."'";
			} 
			if($update_field && $input['id_tagihan']) {
				$this->db->query("UPDATE tbl_tagihan SET $update_field WHERE id_tagihan='" . $input['id_tagihan'] . "'");		
			}
			$in['id_tagihan'] = $input['id_tagihan'];
			$in['jumlah_bayar'] =  number_format($input['jumlah_bayar']);
			echo json_encode($in);
		}


	}

}