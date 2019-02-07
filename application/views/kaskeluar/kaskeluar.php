<div id="content">
    <div id="content-header">
        <div id="breadcrumb">
            <a href="#" style="font-size: 14px;">Master</a>
            <a href="<?php echo base_url().'/'.$this->uri->segment(1); ?>" style="font-size: 14px;">Data Kas Masuk/Keluar</a>
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
		              		<th>Tanggal</th>
                      <th>Jenis Kas</th>
		              		<th>Jumlah Biaya (Rp)</th>
		              		<th>Keterangan</th>
		              		<th></th>
		              	</tr>
		              </thead>
		              <tbody>
		              	<?php $no =1; foreach ($list_kas as $lk) {?>

		              	<tr>
		              		<td><?php echo $no; ?></td>
		              		<td><?php echo date_format(date_create($lk->tanggal),"d-m-Y"); ?></td>
<<<<<<< HEAD
                      <td style="text-align: center;"><?php echo $lk->jenis_kas; ?></td>
		              		<td class="rupiah"><?php echo $lk->jumlah_biaya; ?></td>
		              		<td><?php echo $lk->keterangan; ?></td>
		              		<td style="text-align: center;"><a class="btn btn-danger btn-mini ubah_dataKas" href="" data-toggle="modal" data-target="#modalUbah" data-idKas="<?php echo $lk->id_kaskeluar; ?>" data-jenisKas="<?php echo $lk->jenis_kas; ?>" data-keterangan="<?php echo $lk->keterangan; ?>" data-tanggal="<?php echo date_format(date_create($lk->tanggal),"d-m-Y"); ?>" data-jumlahKas="<?php echo $lk->jumlah_biaya; ?>" > Edit </a></td>
=======
		              		<td class="rupiah"><?php echo $lk->jumlah_biaya; ?></td>
		              		<td><?php echo $lk->keterangan; ?></td>
		              		<td style="text-align: center;"><a class="btn btn-danger btn-mini ubah_dataKas" href="" data-toggle="modal" data-target="#modalUbah" data-idKas="<?php echo $lk->id_kaskeluar; ?>" data-keterangan="<?php echo $lk->keterangan; ?>" data-tanggal="<?php echo date_format(date_create($lk->tanggal),"d-m-Y"); ?>" data-jumlahKas="<?php echo $lk->jumlah_biaya; ?>" > Edit </a></td>
>>>>>>> c31ac172c1342aed8f233ecfffbadfa362979a2c
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
        <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">TAMBAH DATA KAS KELUAR</h5>
      </div>
      <?php echo form_open_multipart('Kaskeluar/simpan'); ?>
      <input type="hidden" name="tipe" value="add">
      	<div class="modal-body">
	      	<div class="form-group">
      			<label> Tanggal </label>
      			<input style="width: 50%;" type="text"  class="form-control input-tanggal tgl" name="tanggal"  required>
      		</div>
              <div class="form-group">
            <label class="bmd-label-floating">Jenis Kas</label>
            <select  class="form-control" name="jenis_kas" required>
              <option value="KELUAR">KELUAR</option>
              <option value="MASUK">MASUK</option>
            </select>
          </div>
      		<div class="form-group">
      			<label> Jumlah Biaya (Rp) </label>
      			<input style="width: 80%;" type="text" class="form-control rupiah" name="jumlah_biaya"  required>
      		</div>
      		<div class="form-group">
      			<label> Keterangan </label>
      			<textarea style="width: 80%;" class="form-control " name="keterangan"  required></textarea>
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
        <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">UBAH DATA KAS KELUAR</h5>
      </div>
      <?php echo form_open_multipart('Kaskeluar/ubah'); ?>
      <input class="id_kas" type="hidden" name="id_kaskeluar" value="add">
      	<div class="modal-body">
	      	<div class="form-group">
      			<label> Tanggal </label>
      			<input style="width: 50%;" id="tanggal" type="text" placeholder="<?php echo date('d-m-Y'); ?>" class="form-control input-tanggal tanggal" name="tanggal"  required>
      		</div>
<<<<<<< HEAD
              <div class="form-group">
            <label class="bmd-label-floating">Jenis Kas</label>
            <select  class="form-control jenis_kas" name="jenis_kas" required>
              <option value="KELUAR">KELUAR</option>
              <option value="MASUK">MASUK</option>
            </select>
          </div>
=======
>>>>>>> c31ac172c1342aed8f233ecfffbadfa362979a2c
      		<div class="form-group">
      			<label> Jumlah Biaya (Rp) </label>
      			<input style="width: 80%;" type="text" class="form-control rupiah jumlah_kas" name="jumlah_biaya"  required>
      		</div>
      		<div class="form-group">
      			<label> Keterangan </label>
      			<textarea style="width: 80%;" class="form-control keterangan" name="keterangan"  required></textarea>
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
