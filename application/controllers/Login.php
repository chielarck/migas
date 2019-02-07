<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function index() {
		if($this->session->userdata('hak_akses') == "") {
			$this->load->view('login');
		} else {
			redirect("dashboard");
		}
	}


	public function cobaLogin() {
		if($this->input->method(TRUE) == 'POST' && !empty($_POST)) {
			$in['username'] = $this->input->post('username');
			$in['password'] = $this->input->post('password');
			$this->Login_model->cek($in);
			
		} else {
			redirect(base_url());
		}
	}

}
