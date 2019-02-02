<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login_model extends CI_Model {

	public function cek($in) {
		$username = $in['username'];
		$password = $in['password'];
	
		$q_admin = $this->db->query("SELECT * FROM tbl_user WHERE username = '$username' AND password = '$password'");


		if($q_admin->num_rows() > 0) {
			foreach($q_admin->result() as $data) {
				$session['username'] = $data->username;
				$this->session->set_userdata($session);
			}
			redirect("dashboard");
		}  else {
			$this->session->set_flashdata("error","Gagal Login. Username dan Password Salah");
			redirect("login");
		}
	}
}