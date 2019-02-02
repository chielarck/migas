<!DOCTYPE html>
<html lang="en">
<head>
<title>Administrator | Hiswana Migas DPC Lampung</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<?php echo base_url(); ?>asset/css/bootstrap.min.css" />
<link rel="stylesheet" href="<?php echo base_url(); ?>asset/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<?php echo base_url(); ?>asset/css/fullcalendar.css" />
<link rel="stylesheet" href="<?php echo base_url(); ?>asset/css/select2.css" />
<link rel="stylesheet" href="<?php echo base_url(); ?>asset/css/uniform.css" />
<link rel="stylesheet" href="<?php echo base_url(); ?>asset/css/maruti-style.css" />
<link rel="stylesheet" href="<?php echo base_url(); ?>asset/css/maruti-media.css" class="skin-color" />

<script src="<?php echo base_url(); ?>asset/js/jquery.min.js"></script> 
<script src="<?php echo base_url(); ?>asset/js/jquery.ui.custom.js"></script> 
<script src="<?php echo base_url(); ?>asset/js/bootstrap.min.js"></script> 
<script src="<?php echo base_url(); ?>asset/js/jquery.uniform.js"></script> 
<script src="<?php echo base_url(); ?>asset/js/select2.min.js"></script> 
<script src="<?php echo base_url(); ?>asset/js/jquery.dataTables.min.js"></script> 
<script src="<?php echo base_url(); ?>asset/js/maruti.js"></script> 
<script src="<?php echo base_url(); ?>asset/js/maruti.tables.js"></script>
<script src="<?php echo base_url(); ?>asset/js/jquery.inputmask.bundle.js"></script>
<script src="<?php echo base_url(); ?>asset/js/jquery.dynamicTable-1.0.0.js"></script>

<style type="text/css">
  .table td {
    font-size: 12px;
    text-transform: uppercase;
  }

  .alert {
    margin-top: 15px;
    margin-bottom: 0;
  }

  .modal {
    margin-top: 5000px;
  }
</style>

</head>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="<?php echo base_url(); ?>">Administrator | Hiswana Migas DPC Lampung</a></h1>
</div>
<!--close-Header-part--> 


<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
   
    <li class=""><a title="" href="" data-toggle="modal" data-target="#modalPassword"><i class="icon icon-lock"></i> <span class="text">Ubah Password</span></a></li>
    <li class=""><a title="" href="<?php echo base_url(); ?>logout"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>

<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
  <ul>
     <li class="submenu"> <a href="#"><i class="icon icon-hdd"></i> <span>Data Master</span> <span><i class="icon-chevron-down"></i></span></a>
      <ul>
        <li><a href="<?php echo base_url(); ?>anggota">Master Anggota</a></li>
        <li><a href="<?php echo base_url(); ?>jenis">Master Jenis</a></li>
      </ul>
    </li>
    <li> <a href="<?php echo base_url(); ?>penagihan"><i class="icon icon-folder-close"></i> <span>Penagihan</span></a> </li>
    <li> <a href="<?php echo base_url(); ?>kaskeluar"><i class="icon icon-folder-close"></i> <span>Kas Keluar</span></a> </li>
    <li class="submenu"> <a href="#"><i class="icon icon-print"></i> <span>Laporan</span> <span><i class="icon-chevron-down"></i></span></a>
      <ul>
        <li><a href="#belumjadi">Laporan Penagihan</a></li>
        <li><a href="#belumjadi">Laporan Kas</a></li>
      </ul>
    </li>
  </ul>
</div>


<div class="modal fade" id="modalPassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">UBAH PASSWORD</h5>
      </div>
      <form action="" method="post">
      <input type="hidden" name="tipe" value="add">
        <div class="modal-body">
          <div class="form-group">
            <label class="bmd-label-floating"> Password Baru </label>
            <input style="width: 50%;" id="tgl" type="text" class="form-control" name="password"  required>
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