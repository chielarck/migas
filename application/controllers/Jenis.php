<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class jenis extends CI_Controller {

	public function index() {
		if($this->session->userdata('username') != "") { 
			$data['list_jenis'] = $this->db->query('SELECT * FROM tbl_jenis ORDER BY id_jenis DESC')->result();
			$this->load->view('top');
			$this->load->view('jenis/jenis',$data);
			$this->load->view('bottom');
		} else {
			redirect("login");
		}
	}

	public function simpan(){
		if($this->session->userdata('username') != "") { 
		$data = array(
                'nama_jenis' => $this->input->post('nama_jenis')            
            );

		if($this->db->insert('tbl_jenis', $data)){
			$this->session->set_flashdata("success","Input Berhasil");
            echo "<script>window.location.href='".base_url()."jenis"."';</script>";
        }
		}
	}

	public function ubah(){
		if($this->session->userdata('username') != "") { 
		$data = array(
                'nama_jenis' => $this->input->post('nama_jenis')            
            );

		if($this->db->update('tbl_jenis', $data, array('id_jenis' => $this->input->post('id_jenis')))){
			$this->session->set_flashdata("success","Ubah Berhasil");
            echo "<script>window.location.href='".base_url()."jenis"."';</script>";
         }
		}
	}
}