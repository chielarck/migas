<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class SaldoAwal extends CI_Controller {

	public function index() {
		if($this->session->userdata('username') != "") { 
			$data['list_saldo'] = $this->db->query('SELECT * FROM tbl_saldoawal ORDER BY id_saldoawal DESC')->result();
			$this->load->view('top');
			$this->load->view('saldoawal/saldoawal',$data);
			$this->load->view('bottom');
		} else {
			redirect("login");
		}
	}

	public function simpan(){
		if($this->session->userdata('username') != "") { 
		$data = array(
                'nama_saldoawal' => $this->input->post('nama_saldoawal')            
            );

		if($this->db->insert('tbl_saldoawal', $data)){
			$this->session->set_flashdata("success","Input Berhasil");
            echo "<script>window.location.href='".base_url()."saldoawal"."';</script>";
        }
		}
	}

	public function ubah(){
		if($this->session->userdata('username') != "") { 
		$data = array(
                'jumlah' => $this->input->post('jumlah')            
            );

		if($this->db->update('tbl_saldoawal', $data, array('id_saldoawal' => $this->input->post('id_saldo')))){
			$this->session->set_flashdata("success","Ubah Berhasil");
            echo "<script>window.location.href='".base_url()."SaldoAwal"."';</script>";
         }
		}
	}
}