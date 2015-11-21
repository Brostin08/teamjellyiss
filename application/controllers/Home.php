<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Home extends User_Controller
{
 
  function __construct()
  {
    parent::__construct();

  

    $this->load->model('Infra_model');
  }

  public function index()
  {

      $this->data['data'] = $this->Infra_model->get_data();
      $this->render('home_view');



  }



}
