<!DOCTYPE html>
<html lang="en">
    
    <head>
        <title>Login | Hiswana Migas DPC Lampung</title><meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="<?php echo base_url(); ?>asset/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<?php echo base_url(); ?>asset/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="<?php echo base_url(); ?>asset/css/maruti-login.css" />
    </head>
    <body>
        <div id="loginbox">      
          <?php if($this->session->flashdata('error')) { ?>
          <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <i class="icon-remove"></i>
            </button>
            <span style="text-align: left;"><?php echo $this->session->flashdata('error'); ?> </span>
          </div>
          <?php } ?>      
            <form id="loginform" class="form-vertical" action="<?php echo base_url(); ?>login/cobaLogin" method="post">
            <div class="control-group normal_text"> <h3>Hiswana Migas DPC Lampung</h3></div>
                <div class="control-group"  style="padding-bottom: 0">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on"><i class="icon-user"></i></span><input type="text" placeholder="Username" name="username" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on"><i class="icon-lock"></i></span><input  type="password" placeholder="Password" name="password" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-right"><input type="submit" class="btn btn-info" value="Login" /></span>
                </div>
            </form>
            <form id="recoverform" action="#" class="form-vertical">
        
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on"><i class="icon-envelope"></i></span><input type="text" placeholder="E-mail address" />
                        </div>
                    </div>
               
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link btn btn-inverse" id="to-login">&laquo; Back to login</a></span>
                    <span class="pull-right"><input type="submit" class="btn btn-info" value="Recover" /></span>
                </div>
            </form>
        </div>
        
        <script src="<?php echo base_url(); ?>asset/js/jquery.min.js"></script>  
        <script src="<?php echo base_url(); ?>asset/js/maruti.login.js"></script> 
        <script src="<?php echo base_url(); ?>asset/js/bootstrap.min.js"></script> 
    </body>

</html>
