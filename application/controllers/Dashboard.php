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


	

}
