<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Infra_model extends CI_Model
{
	function __construct()
	  {
	    parent::__construct();
	  }
	/*
	return the data set from aggregated csv
	*/
	public function get_data()
	{
		$this->db->select('*');
		$this->db->from('data');
		$this->db->order_by('project_name');
		$query = $this->db->get();

		return $query->result();
	}

}