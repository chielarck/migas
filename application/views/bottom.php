

    <div class="row-fluid">
      <div id="footer" class="span12"> Dibuat Oleh Al Falaq Project</div>
    </div>
  </body>

</html>

<script type="text/javascript">
  $("input").attr("autocomplete", "off");
  $('.rupiah').inputmask('decimal', {allowMinus:false, autoGroup: true, groupSeparator: '.', rightAlign: false, autoUnmask: true, removeMaskOnSubmit: true});
  $('.tgl').datepicker({
    format: "dd-mm-yyyy",
    todayHighlight: true,
    autoclose: true
  }).on('changeDate', function(ev){                 
        $('.tgl').datepicker('hide');
  });

  $('#modalView').on('show.bs.modal', function(e){
    $("#modalView").css("margin-top","0px");
  });
  $('#modalAdd').on('show.bs.modal', function(e){
    $("#modalAdd").css("margin-top","0px");
  });
  $('#modalUbah').on('show.bs.modal', function(e){
    $("#modalUbah").css("margin-top","0px");
  });
  $('#modalPassword').on('show.bs.modal', function(e){
    $("#modalPassword").css("margin-top","0px");
  });


 
 
</script>

<script type="text/javascript">
 
  $(".ubah_data").click(function() {
    $(".id_jenis").val($(this).attr('data-idJenis'));
    $(".nama_jenis").val($(this).attr('data-namaJenis'));
      // alert('aaa');
<<<<<<< HEAD
=======
    });

  $(".ubah_data_group").click(function() {
    $(".id_group").val($(this).attr('data-idgroup'));
    $(".nama_group").val($(this).attr('data-namagroup'));
      // alert('aaa');
>>>>>>> c31ac172c1342aed8f233ecfffbadfa362979a2c
    });

  $(".ubah_data_saldo").click(function() {
    $(".id_saldo").val($(this).attr('data-idsaldo'));
    $(".jumlah").val($(this).attr('data-jumlah'));
      // alert('aaa');
    });
  $(".ubah_dataAnggota").click(function() {
    $(".id_anggota").val($(this).attr('data-idAnggota'));
    $(".no_pt").val($(this).attr('data-noPt'));
    $(".nama_pt").val($(this).attr('data-namaPt'));
    $(".id_jenis").val($(this).attr('data-idJenis'));
    $(".aktif").val($(this).attr('data-aktif'));
<<<<<<< HEAD
    $(".pemilik_pt").val($(this).attr('data-pemilikPt'));
=======
>>>>>>> c31ac172c1342aed8f233ecfffbadfa362979a2c


      // alert('aaa');
    });

  $(".ubah_dataKas").click(function() {
    $(".id_kas").val($(this).attr('data-idKas'));
    $(".keterangan").val($(this).attr('data-keterangan'));
    $(".jumlah_kas").val($(this).attr('data-jumlahKas'));
    $(".tanggal").val($(this).attr('data-tanggal'));
<<<<<<< HEAD
    $(".jenis_kas").val($(this).attr('data-jenisKas'));
=======
>>>>>>> c31ac172c1342aed8f233ecfffbadfa362979a2c

    
      // alert('aaa');
    });
  </script>


</body>

</html>