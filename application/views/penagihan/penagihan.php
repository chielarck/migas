<div id="content">
    <div id="content-header">
        <div id="breadcrumb">
            <a href="#" style="font-size: 14px;">Data Penagihan</a>
            <a href="<?php echo base_url().'/'.$this->uri->segment(1); ?>" style="font-size: 14px;">Januari 2019</a>
        </div>
    </div>
    <div class="container-fluid">
      	<div class="row-fluid" style="margin: 0;">
	      	<div class="span12">
            <br>
            <div class="row-fluid" style="margin: 0;">
              <div class="span6">
                <form action="<?php echo base_url(); ?>Penagihan/filter_bulan" method="post">
                <select style="margin: 0;" name="bulan">
                  <option value="01">JANUARI</option>
                  <option value="02">FEBUARI</option>
                  <option value="03">MARET</option>
                  <option value="04">APRIL</option>
                  <option value="05">MEI</option>
                  <option value="06">JUNI</option>
                  <option value="07">JULI</option>
                  <option value="08">AGUSTUS</option>
                  <option value="09">SEPTEMBER</option>
                  <option value="10">OKTOBER</option>
                  <option value="11">NOVEMBER</option>
                  <option value="12">DESEMBER</option>
                </select>
                 <select style="margin: 0;" name="tahun">  
                      <?php
            for ($x=date("Y")-10; $x<=date("Y"); $x++)
              {
                echo'<option selected value="'.$x.'">'.$x.'</option>'; 
              } 
            ?> 
                </select>
                <button style="margin: 0;"  class="btn btn-primary">Tampilkan Data</button> 

            </div>

	 
		        <div class="widget-box">
		          <div class="widget-content nopadding">
                      <?php if($this->session->flashdata('success')) { ?>
                                      <div style="width:40%;" class="alert alert-success alert-dismissible fade in" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                        <?php echo $this->session->flashdata('success'); ?>
                                      </div> 
                   <?php } ?>

              </div>
                     
		            <table id="data2" class="table table-bordered data-table">
		              <thead>
		              	<tr>
                          <th>ID</th>
		              		<th>No</th>
		              		<th>Nama Perusahaan </th>
		              		<th>Jenis Perusahaan</th>
		              		<th>Jumlah Tagihan (Rp)</th>
                      <th>Tanggal</th>
		              	</tr>
		              </thead>
		              <tbody>
                    <?php
                                          $no = 1;
                                          foreach($penagihan->result_array() as $data) { ?>
		              	<tr id="<?php echo $data ['id_tagihan']; ?>">
                      <td><?php echo $data['id_tagihan']; ?></td>
                      <td><?php echo $no; ?></td>
                      <td><?php echo $data['nama_pt']; ?></td>
                      <td><?php echo $data['nama_jenis']; ?></td>
                      <td ><?php echo $data['jumlah_bayar']; ?></td>
                      <td ><?php echo $data['tanggal']; ?></td>
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