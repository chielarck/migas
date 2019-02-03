<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class anggota extends CI_Controller {

	public function index() {
		if($this->session->userdata('username') != "") { 
			$this->load->view('top');
			$data['list_anggota'] = $this->db->query('SELECT * FROM tbl_anggota ORDER BY id_anggota DESC')->result();
			$this->load->view('anggota/anggota',$data);
			$this->load->view('bottom');
		} else {
			redirect("login");
		}
	}

	public function simpan(){
		if($this->session->userdata('username') != "") { 
		$data = array(
                'no_pt' => $this->input->post('no_pt'),
                'nama_pt' => $this->input->post('nama_pt'),
                'id_jenis' => $this->input->post('id_jenis'),
                'aktif' => $this->input->post('aktif')       
            );

		if($this->db->insert('tbl_anggota', $data)){
			$this->session->set_flashdata("success","Input Berhasil");
            echo "<script>window.location.href='".base_url()."anggota"."';</script>";
        }
		}
	}

	public function ubah(){
		if($this->session->userdata('username') != "") { 
		$data = array(
                'no_pt' => $this->input->post('no_pt'),
                'nama_pt' => $this->input->post('nama_pt'),
                'id_jenis' => $this->input->post('id_jenis'),
                'aktif' => $this->input->post('aktif')       
            );

		if($this->db->update('tbl_anggota', $data, array('id_anggota' => $this->input->post('id_anggota')))){
            $this->session->set_flashdata("success","Ubah Berhasil");
            echo "<script>window.location.href='".base_url()."anggota"."';</script>";
         }
		}
	}
}