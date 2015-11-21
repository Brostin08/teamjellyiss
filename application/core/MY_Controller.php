<?php defined('BASEPATH') OR exit('No direct script access allowed');
 
class MY_Controller extends CI_Controller
{
  protected $data = array();
  function __construct()
  {
    parent::__construct();
    //edit this after development!!
    $this->data['page_title'] = 'PUT TITLE IN UR CONTROLLER!';
  }

  protected function render($the_view = NULL, $template = 'master')
  {
    if($template == 'json' || $this->input->is_ajax_request())
    {
      header('Content-Type: application/json');
      echo json_encode($this->data);
    }
    elseif(is_null($template))
    {
      $this->load->view($the_view,$this->data);
    }
    else
    {
      //gets the data from passed controller
      $this->data['the_view_content'] = (is_null($the_view)) ? '' : $this->load->view($the_view,$this->data, TRUE);
      //loads the corresponding view and data(from above line)
      $this->load->view('templates/'.$template.'_view', $this->data);
    }
  }
}

class User_Controller extends MY_Controller
{
 
  function __construct()
  {
    parent::__construct();

    //if controller has no title use this
    $this->data['page_title'] = 'SJCNI Portal';
  }
 
  protected function render($the_view = NULL, $template = 'master')//template='master' is the template name under views
  {
    parent::render($the_view, $template);
  }
}