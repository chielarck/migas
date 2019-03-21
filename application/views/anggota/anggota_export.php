<?php
header("Content-type: application/vnd-ms-excel");
$tgl = date("d-m-Y");
$judul = "LAPORAN_ANGGOTA_".$tgl.".xls";
header("Content-Disposition: attachment; filename=$judul");

?>
                <p>Laporan Data Anggota </p>
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
                      <th>Alamat PT</th>
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
		              		
                      <td  style="text-align: center;"><?php echo $la->alamat_pt; ?></td>
		              		
		              	</tr>
		              	<?php  $no++; } ?>
		              </tbody>
		            </table>