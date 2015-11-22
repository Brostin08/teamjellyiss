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

	public function send_action($action, $id, $action)
	{
		$stats = $this->get_current_stats($id);
		$counter = 0;
		if($action == 'like')
		{

		$counter = $stats->like_count;
		$counter++;

		}

		elseif($action == 'dislike')
		{

		$counter = $stats->dislike_count;
		$counter++;
		}

		else
		{
			return false;
		}


		$this->db->trans_start();

	    $array = array(
	        $action.'_count' => $counter
	    );

	    $this->db->set($array);

		$this->db->where('project_id',$id);

	    $this->db->update('data');

	    $this->db->trans_complete();

	          if ($this->db->trans_status() === FALSE)
	          {
	              $this->db->trans_rollback();
	                return $msg_result = "Failed sending".$action;

	          }

	          $this->db->trans_commit();


	          return $msg_result = "Success sending".$action;
	}

	private function get_current_stats($id)
	{
		$this->db->select('*');
		$this->db->from('data');
		$this->db->where('project_id',$id);
		$query = $this->db->get();

		return $query->row();
	}

}