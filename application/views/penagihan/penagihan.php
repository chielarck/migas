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
            <a href="#" style="font-size: 14px;">Data Penagihan</a>
            <a href="<?php echo base_url().'/'.$this->uri->segment(1); ?>" style="font-size: 14px;"><?php echo $bulan_arr[$bulan].' '.$tahun; ?></a>
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
              <div class="span6" style="text-align: right;">
                <a class="btn btn-danger" href="<?php echo base_url(); ?>penagihan/generate">Buat Tagihan</a>
              </div>
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
                      <td ><?php echo number_format($data['jumlah_bayar']); ?></td>
                      <td ><?php if(!empty($data['tanggal']) && $data['tanggal'] != "0000-00-00") echo $data['tanggal']; ?></td>
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

<script type="text/javascript">
    $('#data2').Tabledit({
    deleteButton: false,
    editButton: false,      
    columns: {
      identifier: [0, 'id_tagihan'],                    
      editable: [[4, 'jumlah_bayar'], [5, 'tanggal']]
    },
    onDraw: function() {
      $('table tr td:nth-child(5) input').each(function() {
        $('.rupiah').inputmask('decimal', {allowMinus:false, autoGroup: true, groupSeparator: '.', rightAlign: false, autoUnmask: true, removeMaskOnSubmit: true});
        $(this).addClass("rupiah");
      });

      $('table tr td:nth-child(6) input').each(function() {
        $(this).datepicker({
          format: 'yyyy-mm-dd',
          todayHighlight: true,
          autoclose: true
        }).on('changeDate', function(ev){                 
          $(this).datepicker('hide');
        });
      });
    },
    hideIdentifier: true,
    url: '<?php echo base_url(); ?>penagihan/live'    
  });
</script>