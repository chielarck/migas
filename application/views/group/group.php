<div id="content">
    <div id="content-header">
        <div id="breadcrumb">
            <a href="#" style="font-size: 14px;">Master</a>
            <a href="<?php echo base_url().'/'.$this->uri->segment(1); ?>" style="font-size: 14px;">Data Group Perusahaan</a>
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
		              		<th>Group Perusahaan</th>
		              		<th></th>
		              	</tr>
		              </thead>
		              <tbody>
		              	<?php $no = 1; foreach ($list_group as $lj) {?>
		              	<tr>
		              		<td><?php echo $no;; ?></td>
		              		<td><?php echo $lj->nama_group; ?></td>
		              		<td style="text-align: center;"><a class="btn btn-danger btn-mini ubah_data_group" href="" data-toggle="modal" data-target="#modalUbah" data-idgroup="<?php echo $lj->id_group; ?>" data-namagroup="<?php echo $lj->nama_group; ?>" > Ubah </a></td>
		              	</tr>
		              	<?php $no++; } ?>
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
        <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">TAMBAH DATA group PERUSAHAAN</h5>
      </div>
      <?php echo form_open_multipart('group/simpan'); ?>
      <input type="hidden" name="tipe" value="add">
      	<div class="modal-body">
	      	
      		<div class="form-group">
      			<label class="bmd-label-floating"> Group Perusahaan</label>
      			<input style="width: 80%;" type="text" class="form-control" name="nama_group" maxlength="15" required>
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
        <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">UBAH DATA GROUP PERUSAHAAN</h5>
      </div>
      <?php echo form_open_multipart('group/ubah'); ?>
      <input type="hidden" name="tipe" value="add">
      	<div class="modal-body">
	      	<input type="hidden" id="id_group" name="id_group" class="id_group">
      		<div class="form-group">
      			<label class="bmd-label-floating"> Group Perusahaan</label>
      			<input style="width: 80%;" type="text" class="form-control nama_group" name="nama_group" maxlength="15" required>
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