<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {


	public function index() {
		if($this->session->userdata('username') != "") { 
			$d['judul'] = "Dashboard";
			$this->load->view('top',$d);
			$this->load->view('dashboard/dashboard');
			$this->load->view('bottom');
		} else {
			redirect("login");
		}
	}

	public function ubah_password(){
		if($this->session->userdata('username') != "") { 
			$username = $this->session->userdata("username");
			$password_lama = $this->input->post("password_lama");
			$cek = $this->db->query("SELECT * FROM tbl_user WHERE username = '$username' AND password = '$password_lama'");

			if($cek->num_rows() > 0) {
				 $rw = $cek->row();
				 $where['id_user'] = $rw->id_user;
				 $in['password'] = $this->input->post("password");
				 $this->db->update("tbl_user",$in,$where);
				 echo "<script>alert('Ubah Password Berhasil');window.location.href='".base_url()."';</script>";
			} else {
				echo "<script>alert('Gagal Ubah. Password Lama Salah');window.location.href='".base_url()."';</script>";
			}
		} else {
			redirect(base_url());
		}
	}
	

}
