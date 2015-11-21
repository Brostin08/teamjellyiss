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

		return array(
				'result' => $query->result(),
				'num_rows' => $query->num_rows()
				);
	}

	public function count_complete()
	{
		$array_data = $this->get_data();
		$array_data = $array_data['result'];

		$counter = 0;
		foreach($array_data as $ad)
		{
			if($ad->status_percent == 100)
			$counter++;
		}

		return $counter;

	}

	public function count_incomplete()
	{
		$this->db->select('*');
		$this->db->from('data');
		
		$this->db->where_not_in('status_percent', '100');
		$query = $this->db->get();

		return $query->num_rows();

	}

}