<div id="content">
    <div id="content-header">
        <div id="breadcrumb">
            <a href="#" style="font-size: 14px;">Master</a>
            <a href="<?php echo base_url().'/'.$this->uri->segment(1); ?>" style="font-size: 14px;">Data Saldo Perusahaan</a>
        </div>
    </div>
    <div class="container-fluid">
      	<div class="row-fluid" style="margin: 0;">
	      	<div class="span12">
	      		<div class="row-fluid" style="margin: 0;">
	      			<div class="span6">
	      				<!-- <a style="margin-top: 15px;" class="btn btn-primary" href="" data-toggle="modal" data-target="#modalAdd">Tambah Data</a> -->
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
		              		<th>Jumlah Saldo (Rp)</th>
		              		<th></th>
		              	</tr>
		              </thead>
		              <tbody>
		              	<?php $no = 1; foreach ($list_saldo as $lj) {?>
		              	<tr>
		              		<td class="rupiah" style="text-align: center;"><?php echo $lj->jumlah; ?></td>
		              		<td style="text-align: center;"><a class="btn btn-danger btn-mini ubah_data_saldo" href="" data-toggle="modal" data-target="#modalUbah" data-idsaldo="<?php echo $lj->id_saldoawal; ?>" data-jumlah="<?php echo $lj->jumlah; ?>" > Ubah </a></td>
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


<div class="modal fade" id="modalUbah" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">UBAH DATA SALDO PERUSAHAAN</h5>
      </div>
      <?php echo form_open_multipart('SaldoAwal/ubah'); ?>
      <input type="hidden" name="tipe" value="add">
      	<div class="modal-body">
	      	<input type="hidden" id="id_saldo" name="id_saldo" class="id_saldo">
      		<div class="form-SaldoAwal">
      			<label class="bmd-label-floating"> Saldo Perusahaan</label>
      			<input style="width: 80%;" type="text" class="form-control jumlah rupiah" name="jumlah" maxlength="15" required>
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