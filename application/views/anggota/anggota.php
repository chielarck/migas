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
		              		<th>Nama PT </th>
		              		<th>Jenis</th>
		              		<th>Status</th>
		              		<th></th>
		              	</tr>
		              </thead>
		              <tbody>
		              	<tr>
		              		<td>1</td>
		              		<td>52.4141.232</td>
		              		<td>PT Cemerlang Jaya</td>
		              		<td style="text-align: center;">SPBU</td>
		              		<td style="text-align: center;">Aktif</td>
		              		<td style="text-align: center;"><a class="btn btn-danger btn-mini edit-anggota" href="" data-toggle="modal" data-target="#modalAdd"> Ubah </a></td>
		              	</tr>
		              	<tr>
		              		<td>2</td>
		              		<td>52.4141.232</td>
		              		<td>PT Cemerlang Jaya</td>
		              		<td style="text-align: center;">SPBU</td>
		              		<td style="text-align: center;">Aktif</td>
		              		<td style="text-align: center;"><a class="btn btn-danger btn-mini edit-anggota" href="" data-toggle="modal" data-target="#modalAdd"> Ubah </a></td>
		              	</tr>
		              	<tr>
		              		<td>3</td>
		              		<td>52.4141.232</td>
		              		<td>PT Cemerlang Jaya</td>
		              		<td style="text-align: center;">SPBU</td>
		              		<td style="text-align: center;">Aktif</td>
		              		<td style="text-align: center;"><a class="btn btn-danger btn-mini edit-anggota" href="" data-toggle="modal" data-target="#modalAdd"> Ubah </a></td>
		              	</tr>
		              	<tr>
		              		<td>4</td>
		              		<td>52.4141.232</td>
		              		<td>PT Cemerlang Jaya</td>
		              		<td style="text-align: center;">SPBU</td>
		              		<td style="text-align: center;">Aktif</td>
		              		<td style="text-align: center;"><a class="btn btn-danger btn-mini edit-anggota" href="" data-toggle="modal" data-target="#modalAdd"> Ubah </a></td>
		              	</tr>
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
      <form action="" method="post">
      <input type="hidden" name="tipe" value="add">
      	<div class="modal-body">
	      	
      		<div class="form-group">
      			<label class="bmd-label-floating">Nomor PT</label>
      			<input style="width: 80%;" type="text" class="form-control" name="no_pt" maxlength="50" required>
      		</div>

      		<div class="form-group">
      			<label class="bmd-label-floating">Nama PT</label>
      			<input style="width: 80%;" type="text" class="form-control" name="nama_pt" maxlength="150" required>
      		</div>

      		<div class="form-group">
      			<label class="bmd-label-floating">Jenis Perusahaan</label>
      			<select  class="form-control" name="id_jenis" required>
      				<option value>PILIH</option>
      				<option value="SPBU">SPBU</option>
      				<option value="PSO">PSO</option>
      				<option value="HPSO">HPSO</option>
      				<option value="SPBE">SPBE</option>
      			</select>
      		</div>

      		<div class="form-group">
      			<label class="bmd-label-floating">Status</label>
      			<select  class="form-control" name="id_jenis" required>
      				<option value="1">AKTIF</option>
      				<option value="0">TIDAK AKTIF</option>
      			</select>
      		</div>
	    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
        <button  class="btn btn-primary">Simpan Data</button>
      </div>
	  </form>
    </div>
  </div>
</div>