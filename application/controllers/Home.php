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
      $data = $this->Infra_model->get_data();;
      $this->data['data'] = $data;
      $this->data['num_complete'] = $this->Infra_model->count_complete();
      $this->data['num_incomplete'] = $this->Infra_model->count_incomplete();
      $this->render('home_view');



  }

  public function send_action()
  {
    $project_id = $this->input->post('project_id');

    if($x = $this->input->post('submit') == 'like')
    {
      $msg_result = $this->Infra_model->send_action($x, $project_id, $action = "like");
        
       redirect('Home','refresh');
    }
    elseif($y = $this->input->post('submit') == 'dislike')
    {
      $msg_result = $this->Infra_model->send_action($y, $project_id, $action = "dislike");

       redirect('Home','refresh');
    }
    else
    {
       redirect('Home','refresh');
    }
  }



}
