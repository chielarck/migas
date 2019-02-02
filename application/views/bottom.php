

    <div class="row-fluid">
      <div id="footer" class="span12"> Dibuat Oleh Al Falaq Project</div>
    </div>
  </body>

</html>

  <script type="text/javascript">
    $("input").attr("autocomplete", "off");
    $('.rupiah').inputmask('decimal', {allowMinus:false, autoGroup: true, groupSeparator: '.', rightAlign: false, autoUnmask: true, removeMaskOnSubmit: true});

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
    $('#data2').Tabledit({
    deleteButton: false,
    editButton: false,      
    columns: {
      identifier: [0, 'id_tagihan'],                    
      editable: [[4, 'jumlah_bayar'], [5, 'tanggal']]
    },
    hideIdentifier: true,
    url: '<?php echo base_url(); ?>penagihan/live'    
  });
 $('.datepicker').each(function(){
        $(this).datepicker();
    });
   </script>


</body>

</html>