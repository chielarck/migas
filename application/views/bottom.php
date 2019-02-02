

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
   </script>


</body>

</html>