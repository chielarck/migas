<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class kaskeluar extends CI_Controller {

	public function index() {
		if($this->session->userdata('username') != "") { 
			$this->load->view('top');
			$data['list_kas'] = $this->db->query('SELECT * FROM tbl_kaskeluar ORDER BY tanggal DESC,id_kaskeluar DESC')->result();
			$this->load->view('kaskeluar/kaskeluar',$data);
			$this->load->view('bottom');
		} else {
			redirect("login");
		}
	}

	public function simpan(){
		if($this->session->userdata('username') != "") { 
		$data = array(
                'id_kaskeluar' => rand(1,9).rand(1,9).rand(1,9),
                'keterangan' => $this->input->post('keterangan'),
                'jumlah_biaya' => $this->input->post('jumlah_biaya'),
                'tanggal' => date_format(date_create( $this->input->post('tanggal')),"Y-m-d"),
                'jenis_kas' => $this->input->post('jenis_kas')
            );

		if($this->db->insert('tbl_kaskeluar', $data)){
			$this->session->set_flashdata("success","Input Berhasil");
            echo "<script>window.location.href='".base_url()."kaskeluar"."';</script>";
        }
		}
	}

	public function ubah(){
		if($this->session->userdata('username') != "") { 
		$data = array(
                'keterangan' => $this->input->post('keterangan'),
                'jumlah_biaya' => $this->input->post('jumlah_biaya'),
                 'jenis_kas' => $this->input->post('jenis_kas'),
                'tanggal' => date_format(date_create( $this->input->post('tanggal')),"Y-m-d")
            );

		if($this->db->update('tbl_kaskeluar', $data, array('id_kaskeluar' => $this->input->post('id_kaskeluar')))){
           $this->session->set_flashdata("success","Ubah Berhasil");
            echo "<script>window.location.href='".base_url()."kaskeluar"."';</script>";
         }
		}
	}


	public function hapus($id) {
		if($this->session->userdata('username') != "") {
			$where['id_kaskeluar'] = $id; 
			$this->db->delete("tbl_kaskeluar",$where);
			$this->session->set_flashdata("success","Hapus Berhasil");
            echo "<script>window.location.href='".base_url()."kaskeluar"."';</script>";
		} else {
			redirect(base_url());
		}
	}
}