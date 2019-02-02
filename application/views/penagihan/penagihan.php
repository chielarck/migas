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
                <form action="" method="post">
                <select style="margin: 0;" name="bulan">
                  <option value="01">JANUARI</option>
                  <option value="01">FEBUARI</option>
                  <option value="01">MARET</option>
                  <option value="01">APRIL</option>
                  <option value="01">DST...</option>
                </select>
                 <select style="margin: 0;" name="bulan">
                  <option value="2019">2019</option>
                  <option value="2018">2018</option>
                  <option value="2017">2017</option>
                  <option value="2016">2016</option>
                </select>
                <button style="margin: 0;" class="btn btn-primary">Tampilkan Data</button>
              </div>
            </div>
	 
		        <div class="widget-box">
		          <div class="widget-content nopadding">
		            <table class="table table-bordered data-table">
		              <thead>
		              	<tr>
		              		<th>No</th>
		              		<th>Nama Perusahaan </th>
		              		<th>Jenis Perusahaan</th>
		              		<th>Jumlah Tagihan (Rp)</th>
                      <th>Tanggal</th>
                      <th></th>
		              	</tr>
		              </thead>
		              <tbody>
		              	<tr>
                      <td>1</td>
                      <td>PT Cemerlang Jaya</td>
                      <td>SPBU</td>
                      <td contenteditable="">356,000</td>
                      <td contenteditable="">01-02-2019</td>
                      <td style="text-align: center;">
                          <a class="btn btn-danger btn-mini" href="#"> Simpan </a></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>PT Bintang Amin</td>
                      <td>PSO</td>
                      <td contenteditable="">356,000</td>
                      <td contenteditable="">01-02-2019</td>
                      <td style="text-align: center;">
                          <a class="btn btn-danger btn-mini" href="#"> Simpan </a></td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>PT Satria Bajahitam</td>
                      <td>SPBE</td>
                      <td contenteditable="">356,000</td>
                      <td contenteditable="">01-02-2019</td>
                      <td style="text-align: center;">
                          <a class="btn btn-danger btn-mini" href="#"> Simpan </a></td>
                    </tr>
		              </tbody>
		            </table>
		          </div>
		        </div>
      		</div>
    	</div>
    </div>
</div> 