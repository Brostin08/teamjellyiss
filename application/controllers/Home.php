<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Home extends User_Controller
{
 
  function __construct()
  {
    parent::__construct();

  
    $this->load->library('form_validation');
    $this->load->helper('form');
    $this->load->helper('url');
    $this->load->helper('date');
  }

  public function index()
  {
      $this->render('home_view');

  }



}
