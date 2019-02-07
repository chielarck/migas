<div id="content">
    <div id="content-header">
        <div id="breadcrumb">
            <a href="#" style="font-size: 14px;">Master</a>
            <a href="<?php echo base_url().'/'.$this->uri->segment(1); ?>" style="font-size: 14px;">Data Anggota</a>
        </div>
    </div>
    <div class="container-fluid">
      	<div class="row-fluid" style="margin: 0;">
	      	<div class="span12">
	      		<div class="row-fluid" style="margin: 0;">
	      			<div class="span6">
	      				<a style="margin-top: 15px;" class="btn btn-primary" href="" data-toggle="modal" data-target="#modalAdd">Tambah Data</a>
	      			</div>
	      			<div class="span6">

	      				<!--TAMPIL PESAN ERROR / SUCCESS DISNI -->
			      		<?php if($this->session->flashdata('success')) { ?>
					      <div class="alert alert-success" >
					        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					          <i class="icon icon-remove"></i>
					        </button>
					        <span style="text-align: left;"><?php echo $this->session->flashdata('success'); ?></span>
					      </div>
					      <?php } ?>

					      <?php if($this->session->flashdata('error')) { ?>
					      <div class="alert alert-danger" >
					        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					          <i class="icon icon-remove"></i>
					        </button>
					        <span style="text-align: left;"><?php echo $this->session->flashdata('error'); ?></span>
					      </div>
					      <?php } ?>

					      <!-- -->
					</div>
				</div>
		        <div class="widget-box">
		          <div class="widget-content nopadding">
		            <table class="table table-bordered data-table">
		              <thead>
		              	<tr>
		              		<th>No</th>
		              		<th>Nomor PT </th>
                      <th>NO KTA</th>
		              		<th>Nama PT </th>
		              		<th>Jenis</th>
                      <th>Group</th>
                      <th>Pemilik PT</th>
                      <th>Pengurus PT</th>
                      <th>Telepon PT</th>
                      <th>Email PT</th>
		              		<th>Status</th>
                      <th>Alamat PT</th>
		              		<th>Aksi</th>
		              	</tr>
		              </thead>
		              <tbody>
		              	<?php $no = 1; foreach ($list_anggota as $la) {?>
		              	<tr>
		              		<td><?php echo $no; ?></td>
		              		<td><?php echo $la->no_pt; ?></td>
                      <td><?php echo $la->no_kta; ?></td>
		              		<td><?php echo $la->nama_pt; ?></td>
		              		<td style="text-align: center;">
		              			<?php $data = $this->db->get('tbl_jenis')->result();
      								foreach ($data as $jn) {
      									if($la->id_jenis == $jn->id_jenis){
      										echo $jn->nama_jenis;
      									}
      								}
      				 			?>
		              		</td>

                      <td style="text-align: center;">
                        <?php $data = $this->db->get('tbl_group')->result();
                      foreach ($data as $jn) {
                        if($la->id_group == $jn->id_group){
                          echo $jn->nama_group;
                        }
                      }
                    ?>
                      </td>
                        <td  style="text-align: center;"><?php echo $la->pemilik_pt; ?></td>
                        <td  style="text-align: center;"><?php echo $la->pengurus_pt; ?></td>
                        <td  style="text-align: center;"><?php echo $la->telepone_pt; ?></td>
                        <td  style="text-align: center;"><?php echo $la->email_pt; ?></td>
		              		<td style="text-align: center;">
		              			<?php

		              				if($la->aktif == '0'){
		              					echo "TIDAK AKTIF";
		              					
		              				}else{
		              					echo "AKTIF";
		              				}
		              			 ?>
		              		</td>
                      <td  style="text-align: center;"><?php echo $la->alamat_pt; ?></td>
		              		<td style="text-align: center;"><a class="btn btn-danger btn-mini ubah_dataAnggota" href="" data-toggle="modal" data-target="#modalUbah" data-idJenis="<?php echo $la->id_jenis; ?>" 
                      data-idGroup="<?php echo $la->id_group; ?>" 
                      data-idAnggota="<?php echo $la->id_anggota; ?>" 
                      data-noPt="<?php echo $la->no_pt; ?>" 
                      data-noKta="<?php echo $la->no_kta; ?>"  
                      data-namaPt="<?php echo $la->nama_pt; ?>"  
                      data-pemilikPt="<?php echo $la->pemilik_pt; ?>"
                      data-pengurusPt="<?php echo $la->pengurus_pt; ?>"
                      data-teleponePt="<?php echo $la->telepone_pt; ?>"   
                      data-emailPt="<?php echo $la->email_pt; ?>"    
                      data-alamatPt="<?php echo $la->alamat_pt; ?>"  
                      data-aktif="<?php echo $la->aktif; ?>" > Ubah </a></td>
		              	</tr>
		              	<?php  $no++; } ?>
		              </tbody>
		            </table>
		          </div>
		        </div>
      		</div>
    	</div>
    </div>
</div> 



<div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">TAMBAH DATA ANGGOTA</h5>
      </div>
      <?php echo form_open_multipart('anggota/simpan'); ?>
      <input type="hidden" name="tipe" value="add">
      	<div class="modal-body">
	      	<?php echo form_open_multipart('jenis/ubah'); ?>
          <div class="form-group">
            <label class="bmd-label-floating">Jenis Perusahaan</label>
            <select  class="form-control" name="id_jenis" required>
              <option value= "">PILIH</option>
              <?php $data = $this->db->get('tbl_jenis')->result();
                foreach ($data as $jn) {
               ?>
              <option value="<?php echo $jn->id_jenis; ?>"><?php echo $jn->nama_jenis; ?></option>
              <?php } ?>
            </select>
          </div>

          <div class="form-group">
            <label class="bmd-label-floating">Group Perusahaan</label>
            <select  class="form-control" name="id_group" required>
              <option value= "">PILIH</option>
              <?php $data = $this->db->get('tbl_group')->result();
                foreach ($data as $jn) {
               ?>
              <option value="<?php echo $jn->id_group; ?>"><?php echo $jn->nama_group; ?></option>
              <?php } ?>
            </select>
          </div>
      		<div class="form-group">
      			<label class="bmd-label-floating">Nomor PT</label>
      			<input style="width: 80%;" type="text" class="form-control" name="no_pt" maxlength="50">
      		</div>

      		<div class="form-group">
      			<label class="bmd-label-floating">Nama PT</label>
      			<input style="width: 80%;" type="text" class="form-control" name="nama_pt" maxlength="150" required>
      		</div>

          <div class="form-group">
            <label class="bmd-label-floating">Pengurus PT</label>
            <input style="width: 80%;" type="text" class="form-control" name="pengurus_pt" maxlength="150" required>
          </div>

          <div class="form-group">
            <label class="bmd-label-floating">Telepone PT</label>
            <input style="width: 80%;" type="text" class="form-control" name="telepone_pt" maxlength="150" required>
          </div>

          <div class="form-group">
            <label class="bmd-label-floating">Email PT</label>
            <input style="width: 80%;" type="text" class="form-control" name="email_pt" maxlength="150" required>
          </div>

         <div class="form-group">
            <label class="bmd-label-floating">Pemilik PT</label>
            <input style="width: 80%;" type="text" class="form-control" name="pemilik_pt" maxlength="150" required>
          </div>

          <div class="form-group">
            <label class="bmd-label-floating">NO KTA</label>
            <input style="width: 80%;" type="text" class="form-control" name="no_kta" maxlength="150" required>
          </div>

          <div class="form-group">
            <label class="bmd-label-floating">Alamat PT</label>
            <textarea style="width: 80%;" type="text" class="form-control" name="alamat_pt" maxlength="150" required></textarea>
          </div>

      		<div class="form-group">
      			<label class="bmd-label-floating">Status</label>
      			<select  class="form-control" name="aktif" required>
      				<option value="1">AKTIF</option>
      				<option value="0">TIDAK AKTIF</option>
      			</select>
      		</div>
	    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
        <button  class="btn btn-primary">Simpan Data</button>
      </div>
	  <?php echo form_close();?>
    </div>
  </div>
</div>


<div class="modal fade" id="modalUbah" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">UBAH DATA ANGGOTA</h5>
      </div>
      <?php echo form_open_multipart('anggota/ubah'); ?>
      <input type="hidden" id="id_anggota" name="id_anggota" class="id_anggota">
      	<div class="modal-body">
          <div class="form-group">
            <label class="bmd-label-floating">Jenis Perusahaan</label>
            <select  class="form-control id_jenis" name="id_jenis" required>
              <option value= "">PILIH</option>
              <?php $data = $this->db->get('tbl_jenis')->result();
                foreach ($data as $jn) {
               ?>
              <option value="<?php echo $jn->id_jenis; ?>"><?php echo $jn->nama_jenis; ?></option>
              <?php } ?>
            </select>
          </div>
          <div class="form-group">
            <label class="bmd-label-floating">Group Perusahaan</label>
            <select  class="form-control id_group" name="id_group" required>
              <option value= "">PILIH</option>
              <?php $data = $this->db->get('tbl_group')->result();
                foreach ($data as $jn) {
               ?>
              <option value="<?php echo $jn->id_group; ?>"><?php echo $jn->nama_group; ?></option>
              <?php } ?>
            </select>
          </div>
	      	
      		<div class="form-group">
      			<label class="bmd-label-floating">Nomor PT</label>
      			<input style="width: 80%;" type="text" class="form-control no_pt" name="no_pt" maxlength="50">
      		</div>

      		<div class="form-group">
      			<label class="bmd-label-floating">Nama PT</label>
      			<input style="width: 80%;" type="text" class="form-control nama_pt" name="nama_pt" maxlength="150" required>
      		</div>      		
          <div class="form-group">
            <label class="bmd-label-floating">Pemilik PT</label>
            <input style="width: 80%;" type="text" class="form-control pemilik_pt" name="pemilik_pt" maxlength="150" required>
          </div>
          <div class="form-group">
            <label class="bmd-label-floating">Pengurus PT</label>
            <input style="width: 80%;" type="text" class="form-control pengurus_pt" name="pengurus_pt" maxlength="150" required>
          </div>

          <div class="form-group">
            <label class="bmd-label-floating">Telepone PT</label>
            <input style="width: 80%;" type="text" class="form-control telepone_pt" name="telepone_pt" maxlength="150" required>
          </div>

          <div class="form-group">
            <label class="bmd-label-floating">Email PT</label>
            <input style="width: 80%;" type="text" class="form-control email_pt" name="email_pt" maxlength="150" required>
          </div>
          <div class="form-group">
            <label class="bmd-label-floating">NO KTA</label>
            <input style="width: 80%;" type="text" class="form-control no_kta" name="no_kta" maxlength="150" required>
          </div>

          <div class="form-group">
            <label class="bmd-label-floating">Alamat PT</label>
            <textarea style="width: 80%;" type="text" class="form-control alamat_pt" name="alamat_pt" maxlength="150" required></textarea>
          </div>
      		<div class="form-group">
      			<label class="bmd-label-floating">Status</label>
      			<select  class="form-control aktif" name="aktif" required>
      				<option value="1">AKTIF</option>
      				<option value="0">TIDAK AKTIF</option>
      			</select>
      		</div>

	    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
        <button  class="btn btn-primary">Simpan Data</button>
      </div>
	  <?php echo form_close();?>
    </div>
  </div>
</div>