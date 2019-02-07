<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Group extends CI_Controller {

	public function index() {
		if($this->session->userdata('username') != "") { 
			$data['list_group'] = $this->db->query('SELECT * FROM tbl_group ORDER BY id_group DESC')->result();
			$this->load->view('top');
			$this->load->view('group/group',$data);
			$this->load->view('bottom');
		} else {
			redirect("login");
		}
	}

	public function simpan(){
		if($this->session->userdata('username') != "") { 
		$data = array(
                'nama_group' => $this->input->post('nama_group')            
            );

		if($this->db->insert('tbl_group', $data)){
			$this->session->set_flashdata("success","Input Berhasil");
            echo "<script>window.location.href='".base_url()."group"."';</script>";
        }
		}
	}

	public function ubah(){
		if($this->session->userdata('username') != "") { 
		$data = array(
                'nama_group' => $this->input->post('nama_group')            
            );

		if($this->db->update('tbl_group', $data, array('id_group' => $this->input->post('id_group')))){
			$this->session->set_flashdata("success","Ubah Berhasil");
            echo "<script>window.location.href='".base_url()."group"."';</script>";
         }
		}
	}
}