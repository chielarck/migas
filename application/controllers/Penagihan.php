<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class penagihan extends CI_Controller {

	public function index() {
		if($this->session->userdata('username') != "") { 
			$this->load->view('top');
			$this->load->view('penagihan/penagihan');
			$this->load->view('bottom');
		} else {
			redirect("login");
		}
	}
}