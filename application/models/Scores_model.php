<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Scores_model extends CI_Model
{
	function __construct()
	  {
	    parent::__construct();
		$this->load->library('ion_auth');
    	$this->load->model('School_model');
	  }
	/*
	returns scores of a student in one particular component id
	*/
	public function get_scores_per_compo($student_id = NULL, $compo_code = NULL, $subject_id = NULL, $quarter_id = NULL)
	{
		$this->db->select('*');
		$this->db->from('scores sc');

		$this->db->join('students s', 'sc.sc_stud_id = s.student_id');

		$this->db->join('component c', 'c.component_id = sc.sc_compo_id');
		$this->db->join('component_type ct', 'ct.component_type_id = c.compo_compo_type');

		$this->db->where('s.student_id', $student_id);
		$this->db->where('ct.compo_code', $compo_code);
		$this->db->where('sc.sc_subject_id', $subject_id);
		$this->db->where('sc.sc_quarter_id', $quarter_id);
		//add where quarter id where q id is active
		$this->db->order_by('sc.sc_number');
		$query = $this->db->get();

		return $query->result();
	}



	public function insert_weighted_component_scores($students = NULL,$compo_code = NULL,$subject_id = NULL)
	{
		$counter = 0;
		foreach($students as $stud)
		{
			
			$result_set_weighted = $this->set_final_scores($stud['id'],$stud['quarter'],$stud['WEIGHTED_SCORE'],$compo_code,$subject_id,$stud['PERCENTAGE_SCORE']);

			if(!$result_set_weighted)
			{
				$counter++;
			}

		}
		if($counter>0)
		{
			return FALSE;
		}
		else
			return TRUE;


	}

	public function has_final_score_record($student_id,$quarter,$subject_id)
	{
		if($this->get_final_scores($student_id,$quarter,$subject_id))
		{
			return TRUE;
		}
		else 
			return FALSE;
	}

	public function create_final_score_record($student_id,$quarter,$subject_id)
	{
		$array = array(
        'fs_student_id' => $student_id,
        'fs_quarter' => $quarter,
        'fs_subject_id' => $subject_id
		);

		$this->db->set($array);
		$this->db->insert('final_scores');
	}

	//sets the final score for the quarter of a student
	public function set_final_scores($student_id,$quarter,$component_weighted_score,$compo_code,$subject_id,$percentage_score){

		//PRE FUNCTION THAT WILL CHECK IF ROW FOR STDENT qUARtER and subject HAS BEEN CREATED,IF YES SKIP THE FOLLOWING FUNCTION
		if(!$this->has_final_score_record($student_id,$quarter,$subject_id))
		{
			$this->create_final_score_record($student_id,$quarter,$subject_id);
			
		}

		$data = array(
        'fs_'.$compo_code  => $component_weighted_score,
        'fs_'.$compo_code.'_percent'  => $percentage_score,
		);

		$this->db->where('fs_student_id', $student_id);
		$this->db->where('fs_quarter', $quarter);
		$this->db->where('fs_subject_id', $subject_id);

		$this->db->set($data);

		$query = $this->db->update('final_scores');

		if (!$query)
		{
		  //$msg_result = $this->db->error()['message']; // Has keys 'code' and 'message'
			return $msg_result = FALSE;
		}
			else
			{
				//POST FUNCTION THAT WILL UPDATE IG AND QG
				if($this->post_update_final_score($student_id,$quarter,$component_weighted_score,$compo_code,$subject_id))
				{

			  		return $msg_result = TRUE;
				}
				else

			  		return $msg_result = FALSE;
			}
	}

	//post function that will update ig and qg

	public function post_update_final_score($student_id,$quarter,$component_weighted_score,$compo_code,$subject_id)
	{

		$final_score = $this->get_final_scores($student_id,$quarter,$subject_id);

		//sum of all final components
		$fs_IG = (double)($final_score->fs_WW + $final_score->fs_PT + $final_score->fs_QA);

		//function that will calculate QG
		$fs_QG = $this->get_quarter_grade($fs_IG);
		$remark = $this->get_remark($fs_QG);


		$data = array(
        'fs_IG'  => $fs_IG,
        'fs_QG'  => $fs_QG,
        'remark' => $remark
		);

		$this->db->where('fs_student_id', $student_id);
		$this->db->where('fs_quarter', $quarter);
		$this->db->where('fs_subject_id', $subject_id);

		$this->db->set($data);

		$query = $this->db->update('final_scores');
	}

	//gets the final scores

	public function get_final_scores($student_id,$quarter,$subject_id)
	{
		$query = $this->db->select('*')

				->from('final_scores fs')
				->join('students stud', 'stud.student_id = fs.fs_student_id')
				->join('users u', 'stud.student_id = u.id')
                ->where('fs.fs_student_id', $student_id)
                ->where('fs.fs_quarter', $quarter)
				->where('fs.fs_subject_id', $subject_id)
                ->get();

			return $query->row();
	}

	//get all final scores of students in this subject

	public function get_all_final_scores($quarter,$subject_id)
	{

		$query = $this->db->select('*')

				->from('final_scores fs')
				->join('students stud', 'stud.student_id = fs.fs_student_id')
				->join('users u', 'stud.student_id = u.id')
                ->where('fs.fs_quarter', $quarter)
				->where('fs.fs_subject_id', $subject_id)
                ->get();

			return $query->result();

	}

	/*
	Returns object of latest score number in a component in a subject in a quarter *use ->maxnum
	*/
	public function get_max_num_of_released_type_of_compo($subject_id = NULL, $component_id = NULL,$quarter_id = NULL)
	{
		// $sql = 'SELECT MAX(sc.sc_number) AS maxnum, ct.compo_code ';
		// $sql .= 'from scores sc ';
		// $sql .= 'LEFT JOIN component c ON sc.sc_compo_id = c.component_id ';
		// $sql .= 'LEFT JOIN component_type ct ON ct.component_type_id = c.compo_compo_type ';
		// $sql .= 'WHERE sc.sc_subject_id = \''.$subject_id.'\' ';
		// $sql .= 'AND ct.compo_code= \''.$component.'\' ';
		// $sql .= 'AND sc.sc_quarter_id = \''.$quarter_id.'\' ';
		// $sql .= 'GROUP BY sc.sc_compo_id ';
		// $sql .= 'LIMIT 1';

		// $query = $this->db->query($sql);
		// $row = $query->row(1);
		// return $row;

		$query = $this->db->select('MAX(sc.sc_number) AS max_num, ct.compo_code AS max_compo_code')
							->from('scores sc')
							->join('component c', 'sc.sc_compo_id = c.component_id','left')
							->join('component_type ct', 'ct.component_type_id = c.compo_compo_type')
					        ->where('sc.sc_subject_id', $subject_id)
					        ->where('sc.sc_quarter_id', $quarter_id)
					        ->where('sc.sc_compo_id', $component_id)
					        ->group_by('sc.sc_compo_id')
					        ->get();

		return $query->row();
	}

	/*
	Returns the maximum value for sc_number for a specific subject id and component id
	usage: get_max_sc_number->max_sc_num
	DEPRECATED
	*/
	public function get_max_sc_number($subject_id = NULL , $component_id = NULL, $quarter_id = NULL)
	{
		$sql = 'SELECT MAX(sc.sc_number) AS max_sc_num
                
      
            FROM students stud
            
            LEFT JOIN users u
                ON stud.student_id = u.id
                
            LEFT JOIN sections sect
                ON stud.student_sect_id = sect.section_id
                
            LEFT JOIN subject subj
                ON subj.sect_id = sect.section_id


            LEFT JOIN scores sc
                ON stud.student_id = sc.sc_stud_id
                
            WHERE subj.subject_id = ?
            AND sc.sc_compo_id = ?';

	       	$sql .= ' AND sc.sc_quarter_id = ?';

	       	$sql .= ' GROUP BY sc.sc_stud_id';

			$query = $this->db->query($sql,array($subject_id, $component_id, $quarter_id));

			$row = $query->row();
			return $row;
	}

	/*
	Returns a generated score name based on passed paramters
	array
	keys:
	sc_name
	sc_number
	*/
	public function generate_sc_number($subject_id = NULL,$compo_id = NULL,$compo_code = NULL,$quarter_id)
	{
	if($compo_id)
	{ 
	    //catching no rows returned
	    if($x = $this->get_max_num_of_released_type_of_compo($subject_id, $compo_id,$quarter_id))
	    {
		    $getmax = $x;

		    $max_compo_code = $getmax->max_compo_code;
		    $max_sc_number = sprintf("%02d", $getmax->max_num);
	    }
	    else
	    {  
		    $getmax = 0;

		    $getmax = sprintf("%02d", $getmax);
		    $max_sc_number = $getmax;

		    $max_compo_code = $compo_code;
	    }

	    //return $sc_number = array('sc_name' => ((sprintf("%02d", $max_sc_number)+1).'_'.$max_compo_code),'sc_number' => );
		return ($max_sc_number+1);
	}
	else
	  return NULL;
	}

	
	/*
	Inserting scores from teacher inputs
	*/
	public function insert_scores($data = NULL)
	{

		/*
			$data = array(
            'scores_data' => $scores_data,
            'quarter_id' => $quarter_id,
            'student_id' => $student_id,
            'component_id' => $component_id
            );
		*/

		if(!$data OR !is_array($data))
		{
			return $msg_result = "Error inserting scores!";

		}
		else
		{
			// REPLACE INTO scores
			// (raw_score),
			// VALUES (3, 'Partially Inspected', 'Me', 'GP1234', 'A01');

			//Prepare data for brevity
			$scores_data_object = $data['scores_data'];
			$quarter_id = $data['quarter_id'];
			$student_id = $data['student_id'];
			$component_id = $data['component_id'];

			$sql1 = array();
			$count_data = count($scores_data_object);
			for($x = 0; $x <= $count_data-1 ; $x++)
			{
				//$sql2 = array(NULL,$s->id,$subject_id,$compo_id,NULL,$quarter_id,$score_name,$score_number);
				$sql1[$x] = 'UPDATE scores SET raw_score = '.$scores_data_object[$x]['raw_score'].' WHERE score_id = '.$scores_data_object[$x]['score_id'];
	 			//$sql2[] = '('.$d['score'].','.$d['max_score'].')';
	 			//$score_id = $d['score_id'];
			}
			//$sql1 = 'REPLACE INTO scores (raw_score, possible_score) VALUES '.implode(',', $sql2).' where sc.score_id = '$score_id'';

			$this->db->trans_start();
			foreach($sql1 as $sql)
			{
				$query = $this->db->query($sql);
			}
			$this->db->trans_complete(); 

			//$query = $this->db->query($sql1);
			if ($this->db->trans_status() === FALSE)
	        {
	            $this->db->trans_rollback();
	            return FALSE;
	        }

			if (!$query)
			{
			  $msg_result = $this->db->_error_message()['message']; // Has keys 'code' and 'message'
			}

			else
			{
			  $msg_result = "Success adding score!";
			}

			return $msg_result;

		}
		/*
		hook to update the counter for teacher violation
		*/





	}
	//SE FUNCTION
	public function update_error_table($subject_id,$error_reason)
	{	
		if($error_reason)
		{

		$now = NOW();
		$date = date('Y-m-d H:i:s', $now);
		//2015-10-20 10:00:00
		$sql = "INSERT INTO error (err_timestamp,err_reason,error_subject_id) VALUES ('$date', '$error_reason', '$subject_id')";

		$query = $this->db->query($sql);
		
			if (!$query)
			{
			  $msg_result = $this->db->_error_message()['message']; // Has keys 'code' and 'message'
			}
			else
			{
			  $msg_result = "Success logging error!";
			}
			return $msg_result;
		}
		else
		{

			return $msg_result = "no error";

		}
	}


	/*
	Deprecated function
	*/
	public function get_students_score_in_this_subject($subject_id = NULL, $compo_code = NULL)
	{
		//with score na ituu


		/*SELECT u.*, sc.*, asses.* FROM subject s
		JOIN sections sects ON sects.section_id = s.sect_id
		JOIN groups g ON g.id = sects.section_id
		JOIN users_groups ug ON g.id = ug.group_id
		JOIN users u ON u.id = ug.user_id

		LEFT JOIN scores sc ON sc.sc_stud_id = u.id



		WHERE s.subject_id = '1'*/

		$this->db->select('u.*');

		$this->db->from('subject s');

		$this->db->join('sections sects', 'sects.section_id = s.sect_id');
		$this->db->join('groups g', 'g.id = sects.section_id');
		$this->db->join('users_groups ug', 'g.id = ug.group_id');
		$this->db->join('users u', 'u.id = ug.user_id','right');
		$this->db->join('scores sc', 'sc.sc_stud_id = u.id');
		$this->db->join('component c', 'c.component_id = sc.sc_compo_id');
		$this->db->join('component_type ct', 'ct.component_type_id = c.compo_compo_type');

		if(isset($subject_id) AND isset($compo_code))
		{
			$this->db->where('s.subject_id', $subject_id);
			$this->db->where('ct.compo_code', $compo_code);
			$this->db->where('sc_number', '1');

		}

			$query = $this->db->get();

			return $query->result_array();
	}


	/*
	This function relies on the input in scores.sc_number,as it takes the max number to be used by other functions
	Take note that sc_number is KUNG PANG ILANG COMPONENT NA BA ANG SCORE ROW,EXAMPLE 1ST WRITTEN WORK eh dapat sc_number = 1
	Also take note of sc_name, dapat is consistent siya with sc_number  e.g 1st Written Work : 1
	
	sc_name format:
	[int]_[component_code]

	sc_number format:
	[int]
	*/

	/*
	Inserts new scores
        'students' => $students,
        'subject_id' => $subject_id,
        'compo_id' => $compo_id->component_id,
        'quarter_id' => $quarter,
        'score_name' =>  $this->input->post('component_code'),
        'score_number' => $sc_number
	*/
	public function insert_component($data = NULL)
	{
		/*
		'subject_id' => $real_subject_id,
          'compo_id' => $this->input->post('compo_id'),
          'quarter_id' => $active_term->quarter_id,
          'max_score' => $this->input->post('max_score'),
          'sc_description' => $this->input->post('sc_desc'),
          'compo_code' => $this->input->post('compo_code')
		*/

		$subject_id = $data['subject_id'];
		$compo_code = $data['compo_code'];
		$compo_id = $data['compo_id'];
		$quarter_id = $data['quarter_id'];
		$max_score =$data['max_score'];
		$sc_description = '\''.$data['sc_description'].'\'';

		//@todo: SCHOOL MODEL get all students in this subject via subject_id
		$term = $this->School_model->get_active_term();
		$stud = $this->School_model->get_students_in_subject($subject_id,$term->sy_id);
		//@todo: generate a score name and number this->generate_sc_name
		$score_number = $this->generate_sc_number($subject_id,$compo_id,$compo_code, $quarter_id);
		//$score_name = '\''.$score_name_number['sc_name'].'\'';
		$score_number = $score_number; 
		$score_name = sprintf("%02d", $score_number).'_'.$compo_code; 
		$score_name = '\''.$score_name.'\''; 
		/******TRANSACTION BEGIN************/

		$this->db->trans_begin();

			//statements
			foreach($stud as $s)
			{
				//$sql2 = array(NULL,$s->id,$subject_id,$compo_id,NULL,$quarter_id,$score_name,$score_number);
	 			$sql2[] = '('.'NULL'.', '.$s->id.', '.$subject_id.', '.$compo_id.', '.$quarter_id.', '.$score_name.', '.$sc_description.', '.$score_number.', '.'NULL'.', '.$max_score.')';
			}
			$sql1 = 'INSERT INTO scores (score_id, sc_stud_id, sc_subject_id, sc_compo_id, sc_quarter_id, sc_name,sc_description, sc_number, raw_score, possible_score) VALUES '.implode(',', $sql2);

			$query = $this->db->query($sql1);
			//end of statements

		if ($this->db->affected_rows() == 0)
		{
		    return $msg_result = 'No Scores Affected.';
		}

		if ($this->db->trans_status() === FALSE)
		{
			$this->db->trans_rollback();
		    return $msg_result = 'Error deleting scores!';
		}

		$this->db->trans_commit();

		/*********TRANSACTION END***********/
		
		return $msg_result = "Success adding new component!";
	}	

	public function delete_component_column($subject_id,$sc_name,$sc_number, $quarter_id, $compo_code)
	{
		$this->db->trans_begin();

		$this->db->delete('scores', array('sc_subject_id' => $subject_id, 'sc_name' => $sc_name, 'sc_quarter_id' => $quarter_id));

		
		if ($this->db->affected_rows() == 0)
		{
		    return $msg_result = 'No Scores Affected.';
		}

		if ($this->db->trans_status() === FALSE)
		{
			$this->db->trans_rollback();
		    return $msg_result = 'Error deleting scores!';
		}

		$this->db->trans_commit();
		//$post_delete = ;
		if($this->post_delete_component_column($subject_id,$sc_name,$sc_number, $quarter_id, $compo_code))
		{

				return $msg_result = 'Success deleting scores!';
		}


		return $msg_result = 'Success deleting scores!Not renamed';
		

	}

	function post_delete_component_column($subject_id,$sc_name,$sc_number, $quarter_id,$compo_code)
	{

		/*
		max_sc_number = 7
		 0 1 2 3 4 5 6
		 1 2 3 4 5 6 7

		 delete 4

		 for(x=4;x<=max_sc_number-1;x++)
		 {
			update column x's value with it's value minus one
			repeat lang.
		 }
		
		*/
	$component_id = $this->get_component_id($subject_id, $compo_code);
	if($max_sc_number = $this->get_max_sc_number($subject_id, $component_id->component_id, $quarter_id))
	{

			$max_sc_number = $max_sc_number->max_sc_num;	
	}
	else
	{
		$max_sc_number = 0;
	}
		
	
	//IF the deleted column is the last one,do not do the rest

	if($sc_number > $max_sc_number)
	{
		return TRUE;
	}
			$sql1 = array();
			//$count_data = count($data);
			$x = $sc_number;
			$new_sc_name_number = array('sc_name' => ('\''.($x).'_'.$compo_code).'\'','sc_number' => ($x));
			$sql1[$x] = 'UPDATE scores SET sc_name = '.$new_sc_name_number['sc_name'].', sc_number = '.$new_sc_name_number['sc_number'].' WHERE sc_subject_id = '.$subject_id.' AND sc_quarter_id = '.$quarter_id.' AND sc_name = '.'\''.($x+1).'_'.$compo_code.'\'';

			for($x = $sc_number+1 ; $x <= $max_sc_number+2 ; $x++)
			{
				//generate new score name and number
				$new_sc_name_number = array('sc_name' => ('\''.($x).'_'.$compo_code.'\''),'sc_number' => ($x));
				//$sql2 = array(NULL,$s->id,$subject_id,$compo_id,NULL,$quarter_id,$score_name,$score_number);
				$sql1[$x] = 'UPDATE scores SET sc_name = '.$new_sc_name_number['sc_name'].', sc_number = '.$new_sc_name_number['sc_number'].' WHERE sc_subject_id = '.$subject_id.' AND sc_name = '.'\''.($x+1).'_'.$compo_code.'\''.' AND sc_quarter_id = '.$quarter_id;
	 			//$sql2[] = '('.$d['score'].','.$d['max_score'].')';
	 			//$score_id = $d['score_id'];
			}
			//$sql1 = 'REPLACE INTO scores (raw_score, possible_score) VALUES '.implode(',', $sql2).' where sc.score_id = '$score_id'';

			$this->db->trans_start();
			foreach($sql1 as $sql)
			{
				$query = $this->db->query($sql);
			}
			$this->db->trans_complete(); 

			//$query = $this->db->query($sql1);
			if ($this->db->trans_status() === FALSE)
	        {
	            $this->db->trans_rollback();
	            return FALSE;
	        }

			if (!$query)
			{
			  return FALSE;
			}

			else
			{
			  return TRUE;
			}

			return TRUE;

		
		/*
		hook to update the counter for teacher violation
		*/

	}
	/*
	Returns array of rows from component table that has particular subject id and component code
	*/
	public function get_component_id($subject_id = NULL, $compo_code = NULL)
	{
		if($subject_id == NULL AND $compo_code == NULL)
		{	
			$msg_result = "ERROR";
			return $msg_result;
		}
		$sql = "SELECT * FROM `component` compo

		left join component_type ct
		on ct.component_type_id = compo.compo_compo_type

		left join subject_code subjcode
		on  subjcode.subject_code_id = compo.component_subject_code

		join subject s
		on s.subj_code_id = subjcode.subject_code_id

		where s.subject_id = ?
		and ct.compo_code = ? 
		LIMIT 1";

		$query = $this->db->query($sql, array($subject_id,$compo_code));

		return $query->row();
	}

	/*
	Get the student enrolled in a subject's grades per component
	Returns Array of grades and the number of fields and number of rows
	GRADES GENERATOR
	*/

	public function get_student_grades_per_component($subject_id, $compo_id, $quarter,$compo_code, $sc_name = NULL)
	{
		//if sc_name is specified
		if($sc_name)
		{

    		$number_in_sc_name = $sc_name[0].$sc_name[1];
    		$number_in_sc_name = sprintf('%02d', $number_in_sc_name);
			$n = 1;
		}
		//if no sc_name specified
		else
		{
		//get the max score number for the component id
			if($max_count_per_compo = $this->get_max_num_of_released_type_of_compo($subject_id, $compo_id,$quarter))
			{
				$n = (int)($max_count_per_compo->max_num);
				//will be used in the query return
				$max_num_scores = (int)($max_count_per_compo->max_num);
			}
			//no rows will be returned
			else
			{
				$n = 0;

				//will be used in the query return
				$max_num_scores = 0;

			}
		}


		//CHECK Subject controller under teacher folder before editing this!
		$sql = "SELECT u.id,u.last_name, u.first_name, u.middle_name, ";


		if(!$sc_name)
		{
			for ($x = 1; $x <= $n; $x++) {
		    $sql .="MAX(
			CASE 
			WHEN sc.sc_number = $x AND sc.sc_compo_id = '$compo_id' 
			THEN sc.score_id
			ELSE NULL 
			END
			) AS ";	
			//add trailingzero
			$sql .= sprintf('%02d', $x);
			$sql .="_";
			$sql .=$compo_code;
			$sql .="_id";
			$sql .=",";

		    $sql .="MAX(
			CASE 
			WHEN sc.sc_number = $x AND sc.sc_compo_id = '$compo_id'
			THEN sc.sc_description
			ELSE NULL 
			END
			) AS ";	
			//add trailingzero
			$sql .= sprintf('%02d', $x);
			$sql .="_";
			$sql .=$compo_code;
			$sql .="_";
			$sql .='description';
			$sql .=",";

		    $sql .="MAX(
			CASE 
			WHEN sc.sc_number = $x AND sc.sc_compo_id = '$compo_id'
			THEN c.component_weight
			ELSE NULL 
			END
			) AS ";	
			//add trailingzero
			$sql .= sprintf('%02d', $x);
			$sql .="_";
			$sql .=$compo_code;
			$sql .="_";
			$sql .='weight';
			$sql .=",";

		    $sql .="MAX(
			CASE 
			WHEN sc.sc_number = $x AND sc.sc_compo_id = '$compo_id'
			THEN sc.raw_score
			ELSE NULL 
			END
			) AS ";	
			//add trailingzero
			$sql .= sprintf('%02d', $x);
			$sql .="_";
			$sql .=$compo_code;
			$sql .=",";
			    
			$sql.="MAX(
			CASE 
			WHEN sc.sc_number = $x AND sc.sc_compo_id = '$compo_id'
			THEN sc.possible_score
			ELSE NULL 
			END
			) AS ";	
			$sql .= "MAX_SCORE_";
			//add trailingzero
			$sql .= sprintf('%02d', $x);
			$sql .="_";
			$sql .=$compo_code;
			$sql .=",";
			} 
		}

		//if sc_name is available
		else
		{
			//if()
			for ($x = (int)$number_in_sc_name; $x <= ((int)$number_in_sc_name); $x++) 
			{

		    $sql .="MAX(
			CASE 
			WHEN sc.sc_number = $x AND sc.sc_compo_id = '$compo_id'  AND sc.sc_name = '$sc_name'
			THEN sc.score_id
			ELSE NULL 
			END
			) AS ";	
			//add trailingzero
			$sql .= sprintf('%02d', $x);
			$sql .="_";
			$sql .=$compo_code;
			$sql .="_id";
			$sql .=",";

		    $sql .="MAX(
			CASE 
			WHEN sc.sc_number = $x AND sc.sc_compo_id = '$compo_id' AND sc.sc_name = '$sc_name'
			THEN sc.sc_description
			ELSE NULL 
			END
			) AS ";	
			//add trailingzero
			$sql .= sprintf('%02d', $x);
			$sql .="_";
			$sql .=$compo_code;
			$sql .="_";
			$sql .='description';
			$sql .=",";

		    $sql .="MAX(
			CASE 
			WHEN sc.sc_number = $x AND sc.sc_compo_id = '$compo_id' AND sc.sc_name = '$sc_name'
			THEN c.component_weight
			ELSE NULL 
			END
			) AS ";	
			//add trailingzero
			$sql .= sprintf('%02d', $x);
			$sql .="_";
			$sql .=$compo_code;
			$sql .="_";
			$sql .='weight';
			$sql .=",";

		    $sql .="MAX(
			CASE 
			WHEN sc.sc_number = $x AND sc.sc_compo_id = '$compo_id' AND sc.sc_name = '$sc_name'
			THEN sc.raw_score
			ELSE NULL 
			END
			) AS ";	
			//add trailingzero
			$sql .= sprintf('%02d', $x);
			$sql .="_";
			$sql .=$compo_code;
			$sql .=",";
			    
			$sql.="MAX(
			CASE 
			WHEN sc.sc_number = $x AND sc.sc_compo_id = '$compo_id' AND sc.sc_name = '$sc_name'
			THEN sc.possible_score
			ELSE NULL 
			END
			) AS ";	
			$sql .= "MAX_SCORE_";
			//add trailingzero
			$sql .= sprintf('%02d', $x);
			$sql .="_";
			$sql .=$compo_code;
			$sql .=",";

			} 
		}
		
		
		//rest of query

        //component_type<< component << scores << STUDENT >> sections >> subject 
        //STUDENT >> users
		$sql .=" sc.sc_quarter_id AS quarter 
			    
      
            FROM students stud
            
			LEFT JOIN users u
                ON stud.student_id = u.id
                
            LEFT JOIN sections sect
            	ON stud.student_sect_id = sect.section_id
                
            LEFT JOIN subject subj
            	ON subj.sect_id = sect.section_id

            LEFT JOIN scores sc
                ON stud.student_id = sc.sc_stud_id
             
            LEFT JOIN component c 
            	ON sc.sc_compo_id = c.component_id
                  
            LEFT JOIN component_type ct 
            	ON ct.component_type_id = c.compo_compo_type
			    
			WHERE subj.subject_id = ? 
			AND sc.sc_quarter_id = ? 
			AND sc.sc_compo_id = ? 
			GROUP BY sc.sc_stud_id
			ORDER BY 1";


		$query = $this->db->query($sql, array($subject_id,$quarter,$compo_id));


		//number of fields
		$num = $query->num_fields();

		//number of rows
		$numrows = $query->num_rows();

		$result = array('query'=>$query->result_array(),'numfields'=> $num, 'numrows' => $numrows, 'max_num_scores' => $max_num_scores, 'raw_query' => $query);

		return $result;
	}

	public function calculate_component($query,$compo_code = NULL)
	{
		/*
	 	[0]=> stdClass Object 
	 	(
	 	 [id] => 201500023 
	 	 [last_name] => Ang 
	 	 [first_name] => Baron 
	 	 [middle_name] => Go 
	 	 [01_WW_id] => 1 
	 	 [01_WW_description] => Try lang 
	 	 [01_WW_weight] => 0.3 
	 	 [01_WW] => 45 
	 	 [MAX_SCORE_01_WW] => 50 
	 	 [quarter] => 1 
	 	 [TOTAL_SCORE] => xxx 
	 	 [PERCENTAGE_score] => xxx 
	 	 [WEIGHTED SCORE] => xxx)
		*/
		$scores = $query['query'];
		$score_columns = $query['max_num_scores'];

                 
		$count_scores = count($scores);
		$array_scores = array();
		$array_max_scores = array();
		$weight = 0;
		$total_score = 0;
		$quarter_last = 0;
		for($y = 0;$y<$count_scores;$y++)
		{
			for($x = 1;$x <= $score_columns;$x++)
			{
				//prepare column names
	 			$formatted_x = sprintf('%02d', $x);
				$score_column = $formatted_x.'_'.$compo_code;
				$max_score_column = 'MAX_SCORE_'.$formatted_x.'_'.$compo_code;
				$weight_column = $formatted_x.'_'.$compo_code.'_weight';

				//get all the scores
				$array_scores[$x-1] = $scores[$y][$score_column];
				//get all possible scores
				$array_max_scores[$x-1] = $scores[$y][$max_score_column];
				//get the last weight
				$weight = (double)$scores[$y][$weight_column];
			}	
			//tally the scores
			$scores[$y]['TOTAL_SCORE'] = array_sum($array_scores);

			//tally the maximum scores
			$scores[$y]['MAX_TOTAL_SCORE'] = array_sum($array_max_scores);

			//formula for percentage score: total/max * 100

			$scores[$y]['PERCENTAGE_SCORE'] = round((((double)$scores[$y]['TOTAL_SCORE'] / (double)$scores[$y]['MAX_TOTAL_SCORE'])*100), 2, PHP_ROUND_HALF_UP);
			
			//formula for weighted score: percent score * weight score as 99 * .3 = 29.7
			$scores[$y]['WEIGHTED_SCORE'] = $scores[$y]['PERCENTAGE_SCORE'] * $weight;

			//get the last total score for the component
			$total_score = $scores[$y]['MAX_TOTAL_SCORE'];
			//get the last quarter_id for the component
			$quarter_last = $scores[$y]['quarter'];

		}



		return $pivot = array(
						'scores'		=> $scores,
						'score_columns' => $score_columns,
						'weight'		=> $weight,
						'total_score'	=> $total_score,
						'quarter'		=> $quarter_last,
						'compo_code'	=> $compo_code
						);

	}

	public function get_row_score_per_component($student_id, $component_id, $quarter_id)
	{

		$this->db->select('*');

		$this->db->from('scores sc');

		$this->db->join('students stud', 'stud.student_id = sc.sc_stud_id', 'left');

		$this->db->where('sc.sc_stud_id', $student_id);
		$this->db->where('sc.sc_quarter_id', $quarter_id);
		$this->db->where('sc.sc_compo_id', $component_id);

		$query = $this->db->get();

		return $query->result();
	}

	public function get_scores_via_compo($subject_id, $quarter_id, $compo_id)
	{
		//select distinct sc_name sc description
		//where blah blah
		//$this->db->select('');
		$this->db->select('*');
		$this->db->from('scores sc');
		$this->db->join('component c', 'c.component_id = sc.sc_compo_id');
		$this->db->join('component_type ct', 'ct.component_type_id = c.compo_compo_type');
		$this->db->where('sc.sc_subject_id', $subject_id);
		$this->db->where('sc.sc_quarter_id', $quarter_id);
		$this->db->where('sc.sc_compo_id', $compo_id);
		$this->db->group_by('sc.sc_name');
		$this->db->order_by('sc.sc_number');
		//$this->db->limit(10); 
		$query = $this->db->get();

		return $query->result();
	}

	public function get_quarter_grade($initial_grade)
  	{
	    if($initial_grade == 100)
	    {
	      $grade = 100;
	      return $grade;
	    }
	    elseif($initial_grade <= 99.99 AND $initial_grade >= 98.4 )
	    {
	      
	      $grade = 99;
	      return $grade;
	    }

	    elseif($initial_grade <= 98.39 AND $initial_grade >= 96.8 )
	    {
	      
	      $grade = 98;
	      return $grade;
	    }

	    elseif($initial_grade <= 96.79 AND $initial_grade >= 95.2)
	    {
	      
	      $grade = 97;
	      return $grade;
	    }

	    elseif($initial_grade <= 95.2 AND $initial_grade >= 93.6 )
	    {
	      
	      $grade = 96;
	      return $grade;
	    }

	    elseif($initial_grade <= 93.59 AND $initial_grade >= 92.0 )
	    {
	      
	      $grade = 95;
	      return $grade;
	    }

	    elseif($initial_grade <= 91.99 AND $initial_grade >= 90.4 )
	    {
	      
	      $grade = 94;
	      return $grade;
	    }

	    elseif($initial_grade <= 90.39 AND $initial_grade >= 88.80)
	    {
	      
	      $grade = 93;
	      return $grade;
	    }

	    elseif($initial_grade <= 88.79 AND $initial_grade >= 87.20)
	    {
	      
	      $grade = 92;
	      return $grade;
	    }

	    elseif($initial_grade <= 87.19 AND $initial_grade >= 85.60 )
	    {
	      
	      $grade = 91;
	      return $grade;
	    }

	    elseif($initial_grade <= 85.59 AND $initial_grade >= 84.0 )
	    {
	      
	      $grade = 90;
	      return $grade;
	    }
	    elseif($initial_grade <= 83.99 AND $initial_grade >= 82.4 )
	    {
	      
	      $grade = 89;
	      return $grade;
	    }

	    elseif($initial_grade <= 82.39 AND $initial_grade >= 80.80 )
	    {
	      
	      $grade = 88;
	      return $grade;
	    }

	    elseif($initial_grade <= 80.79 AND $initial_grade >= 79.2 )
	    {
	      
	      $grade = 87;
	      return $grade;
	    }

	    elseif($initial_grade <= 79.19 AND $initial_grade >= 77.6 )
	    {
	      
	      $grade = 86;
	      return $grade;
	    }

	    elseif($initial_grade <= 77.59 AND $initial_grade >= 76.0 )
	    {
	      
	      $grade = 85;
	      return $grade;
	    }

	    elseif($initial_grade <= 75.99 AND $initial_grade >= 74.40 )
	    {
	      
	      $grade = 84;
	      return $grade;
	    }

	    elseif($initial_grade <= 74.39 AND $initial_grade >= 72.80 )
	    {
	      
	      $grade = 83;
	      return $grade;
	    }

	    elseif($initial_grade <= 72.79 AND $initial_grade >= 71.20 )
	    {
	      
	      $grade = 82;
	      return $grade;
	    }

	    elseif($initial_grade <= 71.19 AND $initial_grade >= 69.60 )
	    {
	      
	      $grade = 81;
	      return $grade;
	    }

	    elseif($initial_grade <= 69.59 AND $initial_grade >= 68.0 )
	    {
	      
	      $grade = 80;
	      return $grade;
	    }
	    elseif($initial_grade <= 67.99 AND $initial_grade >= 66.40 )
	    {
	      
	      $grade = 79;
	      return $grade;
	    }

	    elseif($initial_grade <= 66.39 AND $initial_grade >= 64.80 )
	    {
	      
	      $grade = 78;
	      return $grade;
	    }
	    elseif($initial_grade <= 64.79 AND $initial_grade >= 63.20 )
	    {
	      
	      
	      $grade = 77;
	      return $grade;
	    }
	    elseif($initial_grade <= 63.19 AND $initial_grade >= 61.60 )
	    {
	      $grade = 76;
	      return $grade;
	    }

	    elseif($initial_grade <= 61.59 AND $initial_grade >= 60.0 )
	    {
	      
	      $grade = 75;
	      return $grade;
	    }

	    elseif($initial_grade <= 59.99 AND $initial_grade >= 56.0 )
	    {
	      
	      
	      $grade = 74;
	      return $grade;
	    }

	    elseif($initial_grade <= 55.99 AND $initial_grade >= 52.0 )
	    {
	      $grade = 73;
	      return $grade;
	    }

	    elseif($initial_grade <= 51.99 AND $initial_grade >= 48.0 )
	    {
	      
	      $grade = 72;
	      return $grade;
	    }

	    elseif($initial_grade <= 47.99 AND $initial_grade >= 44.0 )
	    {
	      
	      $grade = 71;
	      return $grade;
	    }

	    elseif($initial_grade <= 43.99 AND $initial_grade >= 40.00 )
	    {
	      
	      $grade = 70;
	      return $grade;
	    }

	    elseif($initial_grade <= 39.99 AND $initial_grade >= 36.0 )
	    {
	      
	      $grade = 69;
	      return $grade;
	    }
	    elseif($initial_grade <= 35.99 AND $initial_grade >= 32.0 )
	    {
	      
	      $grade = 68;
	      return $grade;
	    }

	    elseif($initial_grade <= 31.99 AND $initial_grade >= 28.0 )
	    {
	      
	      $grade = 67;
	      return $grade;
	    }

	    elseif($initial_grade <= 27.99 AND $initial_grade >= 24.0 )
	    {
	      
	      $grade = 66;
	      return $grade;
	    }

	    elseif($initial_grade <= 23.99 AND $initial_grade >= 20.0 )
	    {
	      $grade = 65;
	      return $grade;
	      
	    }

	    elseif($initial_grade <= 19.99 AND $initial_grade >= 16.0 )
	    {
	      
	      $grade = 64;
	      return $grade;
	    }

	    elseif($initial_grade <= 15.99 AND $initial_grade >= 12.0 )
	    {
	      $grade = 63;
	      return $grade;
	      
	    }

	    elseif($initial_grade <= 11.99 AND $initial_grade >= 8.0 )
	    {
	      
	      $grade = 62;
	      return $grade;
	    }

	    elseif($initial_grade <= 7.99 AND $initial_grade >= 4.0 )
	    {
	      
	      $grade = 61;
	      return $grade;
	    }

	    elseif($initial_grade <= 3.99 AND $initial_grade >= 0.0 )
	    {
	      
	      $grade = 60;
	      return $grade;
	    }


  	}

  	public function get_remark($quarter_grade = NULL, $threshold = NULL)
  	{
  		if(!$threshold)
  		{
  			$threshold = 75;

  		}

  		if($quarter_grade >= $threshold)
  		{
  			return TRUE;
  		}
  		else
  			return FALSE;
  	}

  	public function get_students_by_remark($subject_id, $quarter_id , $remark)
  	{
  		if(!$remark)
  		{
  			$remark = '0';
  		}

		$query = $this->db->select('*')
							->from('final_scores fs')
							->join('users u','fs.fs_student_id = u.id')
							->where('fs.fs_subject_id',$subject_id)
							->where('fs.fs_quarter',$quarter_id)
							->where('fs.remark',$remark)
							->order_by('fs.fs_QG','DESC')
							->limit('5')
							->get();

		return $query->result();
  	}

  	public function get_report_students_by_remark($subject_id, $quarter_id , $remark)
  	{
  		if(!$remark)
  		{
  			$remark = '0';
  		}

		$query = $this->db->select('*')
							->from('final_scores fs')
							->join('users u','fs.fs_student_id = u.id')
							->where('fs.fs_subject_id',$subject_id)
							->where('fs.fs_quarter',$quarter_id)
							->where('fs.remark',$remark)
							->order_by('fs.fs_QG','DESC')
							->limit('5')
							->get();

		return $query;
  	}
}