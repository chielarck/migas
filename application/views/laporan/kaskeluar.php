<?php
$bulan_arr = array(
                        '01' => 'JANUARI',
                        '02' => 'FEBRUARI',
                        '03' => 'MARET',
                        '04' => 'APRIL',
                        '05' => 'MEI',
                        '06' => 'JUNI',
                        '07' => 'JULI',
                        '08' => 'AGUSTUS',
                        '09' => 'SEPTEMBER',
                        '10' => 'OKTOBER',
                        '11' => 'NOVEMBER',
                        '12' => 'DESEMBER',
                );


?>


<div id="content">
    <div id="content-header">
        <div id="breadcrumb">
            <a href="#" style="font-size: 14px;">Laporan Kas Keluar</a>
            <a href="#" style="font-size: 14px;"><?php echo $bulan_arr[$bulan].' '.$tahun; ?></a>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row-fluid" style="margin: 0;">
          <div class="span12">
            <br>
            <div class="row-fluid" style="margin: 0;">
              <div class="span10">
                <form action="<?php echo base_url(); ?>laporan/cari_kaskeluar" method="post">
                <select style="margin: 0;" name="bulan">
                  <option value>PILIH BULAN</option>
                  <option value="01" <?php if($bulan == '01') echo 'selected'; ?>>JANUARI</option>
                  <option value="02"  <?php if($bulan == '02') echo 'selected'; ?>>FEBRUARI</option>
                  <option value="03" <?php if($bulan == '03') echo 'selected'; ?>>MARET</option>
                  <option value="04" <?php if($bulan == '04') echo 'selected'; ?>>APRIL</option>
                  <option value="05" <?php if($bulan == '05') echo 'selected'; ?>>MEI</option>
                  <option value="06" <?php if($bulan == '06') echo 'selected'; ?>>JUNI</option>
                  <option value="07" <?php if($bulan == '07') echo 'selected'; ?>>JULI</option>
                  <option value="08" <?php if($bulan == '08') echo 'selected'; ?>>AGUSTUS</option>
                  <option value="09" <?php if($bulan == '09') echo 'selected'; ?>>SEPTEMBER</option>
                  <option value="10" <?php if($bulan == '10') echo 'selected'; ?>>OKTOBER</option>
                  <option value="11" <?php if($bulan == '11') echo 'selected'; ?>>NOVEMBER</option>
                  <option value="12" <?php if($bulan == '12') echo 'selected'; ?>>DESEMBER</option>
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
                </form>
              </div>
              <div class="span2" style="text-align: right;">
                  <a class="btn btn-danger" href="<?php echo base_url().'laporan/kaskeluar_export/'.$bulan.'/'.$tahun; ?>" target="_blank">Export to Excel</a>
              </div>
            </div>

            <div class="widget-box">
              <div class="widget-content nopadding">
                     
              </div>
                     
                 <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>Tanggal</th>
                      <th>Keterangan</th>
                      <th>Jumlah Biaya (Rp)</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $total= 0; $no =1; foreach ($kaskeluar->result_array() as $data) { $total += $data['jumlah_biaya']; ?>

                    <tr>
                      <td><?php echo $no; ?></td>
                      <td><?php echo date_format(date_create($data['tanggal']),"d-m-Y"); ?></td>
                      <td><?php echo $data['keterangan']; ?></td>
                      <td class="rupiah" style="text-align: right;"><?php echo $data['jumlah_biaya']; ?></td>
                    </tr>
                    <?php $no++; } ?>
                    <tr>
                        <td colspan="3" style="text-align: right;font-weight: bold;">Total (Rp)</td>
                        <td style="text-align: right;font-weight: bold;" class="rupiah"><?php echo $total; ?></td>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
      </div>
    </div>
</div> 