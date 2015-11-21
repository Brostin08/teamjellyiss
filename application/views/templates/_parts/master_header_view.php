<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
	 <title><?php echo $page_title;?></title>

    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="<?php echo base_url(); ?>assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME ICONS  -->
    <link href="<?php echo base_url(); ?>assets/css/font-awesome.min.css" rel="stylesheet" />

    <!-- CUSTOM STYLE  -->
    <link href="<?php echo base_url(); ?>assets/css/style.css" rel="stylesheet" />
     <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <link href="<?php echo base_url(); ?>assets/css/font-awesome-ie7.min.css" rel="stylesheet" />
    <![endif]-->
    <link href='http://fonts.googleapis.com/css?family=Ubuntu:500' rel='stylesheet' type='text/css'>


    <!-- Latest compiled and minified JavaScript -->
    <script src="<?php echo base_url(); ?>assets/js/jquery.js"></script><!--jquery 1.11.2-->

    <!--bootstrap js-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


    <!--<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/additional-methods.min.js"></script>-->


      <!--datatables-->
   <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css"/>
 
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>


    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.0.3/css/buttons.bootstrap.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.0.3/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.0.3/js/buttons.bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.0.3/js/buttons.html5.min.js"></script>

</head>


<body>
          <div class="container">
              <div class="row">
          
          <div class="col-sm-3"style="padding-top:0px;">
            <!--Mobile only button-->
            <button type="button" class="navbar-toggle navbar-toggle:focus pull-left" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
                    </button>
            <!--end mobile button-->
          </div>
              </div>
          </div>
        <!--put alert if not allowed to view groups-->

        <?php
        if($this->session->flashdata('message'))
        {
        ?>
              <div class="alert alert-info alert-dismissible container" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
          aria-hidden="true">&times;</span></button>
                <?php echo $this->session->flashdata('message');?>
              </div>
          <?php
          }
          ?>


        <section id="header" class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse">
                        <ul id="menu-top" class="nav navbar-nav navbar-left">
                            <li><a href="<?php if(isset($current_user_menu)) echo site_url($current_user_name.'/dashboard');?>"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                            <!--<li><a href="manage-grades.html"><span class="glyphicon glyphicon-list-alt"></span> Manage Grades</a></li>-->
                           
                            <li><a href="<?php echo site_url('/announcement');?>"><span class="glyphicon glyphicon-envelope"></span> </a></li>
                            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="false" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> <?php if(isset($first_name)) echo $first_name;?> <!--(<php echo $group_name;>)--><b class="caret"></b></a>
                              <ul class="dropdown-menu dropdown_color">
                              <li><a href="<?php echo site_url('Profile');?>">Edit Profile</a></li>
                              <li><a href="<?php echo site_url('User/logout');?>">Logout</a></li>
                              </ul>
                            </li>
              
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>

