<?php
header("Content-type: application/vnd-ms-excel");
$tgl = date("d-m-Y");
$judul = "LAPORAN_KAS KELUAR_".$bulan."_".$tahun.".xls";
header("Content-Disposition: attachment; filename=$judul");

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

                <p>Laporan Kas Keluar <?php echo $bulan_arr[$bulan].' '.$tahun; ?></p>

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