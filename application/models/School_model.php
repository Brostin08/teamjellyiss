<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class School_model extends CI_Model
{

		function __construct()
	  {
	    parent::__construct();
		$this->load->library('ion_auth');

	    
	  }

	public function get_school_year()
	{
		
			$this->db->select('sy_id,sy_description');
			$this->db->from('school_year');
			$query = $this->db->get();

			return $query->result();

	}

	public function get_active_school_year()
	{
		
			$this->db->select('sy_id,sy_start_year,sy_end_year');
			$this->db->from('school_year');
			$this->db->where('isactive','1');
			$this->db->limit(1);
			$query = $this->db->get();

			return $query->row();

	}


	public function get_term($term_id)
	{
		
			$this->db->select('*');
			$this->db->from('school_year sy');
			$this->db->join('quarter q', 'q.quarter_sy_id = sy.sy_id');
			$this->db->join('quarter_code qc', 'q.q_q_code = qc.quarter_code_id');
			$this->db->where('q.quarter_id',$term_id);
			
			$query = $this->db->get();

			return $query->row();
	}

	public function get_terms()
	{
		
			$this->db->select('*');
			$this->db->from('school_year sy');
			$this->db->join('quarter q', 'q.quarter_sy_id = sy.sy_id');
			$this->db->join('quarter_code qc', 'q.q_q_code = qc.quarter_code_id');
			$query = $this->db->get();

			return $query->result();
	}

	public function get_active_term()
	{
			$this->db->select('*');
			$this->db->from('quarter q');
			$this->db->join('school_year sy', 'q.quarter_sy_id = sy.sy_id');
			$this->db->join('quarter_code qc', 'q.q_q_code = qc.quarter_code_id');
			$this->db->where('is_active','1');
			$this->db->limit(1);
			$query = $this->db->get();

			return $query->row();
	}


	/*
	Deprecated function
	Useless
	*/
	public function set_school_year($sy_id)
	{
		$data = array(
        'isactive' => '0',
		);

		$this->db->update('school_year', $data);

				$this->db->set('isactive', '1', FALSE);
				$this->db->where('sy_id', $sy_id);
		$query = $this->db->update('school_year');

			if (!$query)
			{
			  $msg_result = $this->db->error(); // Has keys 'code' and 'message'
			}
			else
			{
			  $msg_result = "Success";
			}
			return $msg_result;
	}

	public function set_active_term($term_id)
	{	

		$sql1 = '
		UPDATE quarter q, school_year sy
		JOIN quarter qu
		ON qu.quarter_sy_id = sy.sy_id 
		SET q.is_active = 0 , sy.isactive = 0';



		$sql2 = '
		UPDATE quarter q, school_year sy
		JOIN quarter qu
		ON qu.quarter_sy_id = sy.sy_id 
		SET q.is_active = 1 , sy.isactive = 1
		WHERE q.quarter_id = '.$term_id;
		
		$query1 = $this->db->query($sql1);
		$query2 = $this->db->query($sql2);

		if (!$query1 AND !$query2)
			{
			  $msg_result = $this->db->error(); // Has keys 'code' and 'message'
			}
			else
			{
			  $msg_result = "Success";
			}
			return $msg_result;
	}


	public function get_levels()
	{
		$query = $this->db->get('levels');
		
			return $query->result_array();
	}

	public function register_parent($new_parent_id)
	{

      $this->db->trans_begin();

    	 $data = array(
		'parent_id'			=> $new_parent_id
		);

		$query = $this->db->insert('parents', $data);
      
      if ($this->db->affected_rows() == 0)
      {
          return $msg_result = 'No rows affected.';
      }

      if ($this->db->trans_status() === FALSE)
      {
        $this->db->trans_rollback();
          return $msg_result = 'Error adding to parents!';
      }

      $this->db->trans_commit();

      return $msg_result = 'Added to parents!';
	}

	public function register_teacher($new_teacher_id,$department_id = NULL)
	{

      $this->db->trans_begin();

    	 $data = array(
		'teacher_id'			=> $new_teacher_id,
        'teacher_dept_id'		=> $department_id
		);

		$query = $this->db->insert('teachers', $data);
      
      if ($this->db->affected_rows() == 0)
      {
          return $msg_result = 'No rows affected.';
      }

      if ($this->db->trans_status() === FALSE)
      {
        $this->db->trans_rollback();
          return $msg_result = 'Error adding to teachers!';
      }

      $this->db->trans_commit();

      return $msg_result = 'Added to teachers!';
	}
	public function register_student($new_student_id = NULL, $student_sect_id = NULL, $student_enrolled_sy = NULL, $student_parent_id = NULL)
	{ 

      $this->db->trans_begin();

    	 $data = array(
		'student_id'			=> $new_student_id,
        'student_sect_id'		=> $student_sect_id,
        'student_enrolled_sy' 	=> $student_enrolled_sy,
        'student_parent_id' 	=> $student_parent_id
		);

		$query = $this->db->insert('students', $data);
      
      if ($this->db->affected_rows() == 0)
      {
          return $msg_result = 'No rows affected.';
      }

      if ($this->db->trans_status() === FALSE)
      {
        $this->db->trans_rollback();
          return $msg_result = 'Error adding to students!';
      }

      $this->db->trans_commit();

      return $msg_result = 'Added to students!';

	}

	
	public function register_dephead($new_dephead_id,$department_id = NULL)
	{

      $this->db->trans_begin();

    	 $data = array(
		'department_head_id'			=> $new_dephead_id
		);

		$query = $this->db->insert('department_head', $data);
      
      if ($this->db->affected_rows() == 0)
      {
          return $msg_result = 'No rows affected.';
      }

      if ($this->db->trans_status() === FALSE)
      {
        $this->db->trans_rollback();
          return $msg_result = 'Error adding to department heads!';
      }

      //post add to department table
      if($this->assign_department_head($new_dephead_id,$department_id))
      {
      	$this->db->trans_commit();
      }

      else
      {
      	 $this->db->trans_rollback();
         return $msg_result = 'Error adding to department heads!';
      }

      return $msg_result = 'Added to department heads!';
	}

	public function assign_department_head($new_dephead_id,$department_id)
	{
		$data = array(
          	'depthead_id'    => $new_dephead_id
      		);

      $this->db->where('department_id', $department_id);

      $this->db->set($data);

      $query = $this->db->update('department');

        if (!$query)
        {
          return FALSE;
        }
        else
        {
          return TRUE;
        }

	}

	public function update_dephead_department($user_id, $department_id)
	{

      $data = array(
          'depthead_id'    => $user_id
      );

      $this->db->where('department_id', $department_id);

      $this->db->set($data);

      $query = $this->db->update('department');

        if (!$query)
        {
          $msg_result = $this->db->error()['message']; // Has keys 'code' and 'message'
        }
        else
        {
          $msg_result = "Success updating assigned department head!";
        }
        return $msg_result;

	}
	
	public function get_student_adviser($student_id = NULL)
	{
		if(!isset($student_id))
		{
			$student_id = $this->ion_auth->user()->row()->id;
		}
		else
		{
			$this->db->select('stud.first_name AS student_f_name,stud.last_name AS stud_l_name,adv.first_name,adv.last_name');
			$this->db->from('users stud');
			$this->db->join('advisers_students', 'stud.id=advisers_students.student_id');
			$this->db->join('users adv', 'adv.id = advisers_students.adviser_id');
			$query = $this->db->get();

			return $query->result_array();
		}
	}

	public function get_all_subjects()
	{
		
			$this->db->select('subj.id, subj.subject_name, subj.subject_desc, t.id, t.first_name as teacher_f_name, t.last_name as teacher_l_name, sect.section_name, d.id, d.name AS dept_name, d.dept_desc');
			$this->db->from('teachers t');
			$this->db->join('subject subj', 't.id = subj.teacher_id');
			$this->db->join('department d', 'subj.department_id = d.id');
			$this->db->join('sections sect', 'subj.sect_id = sect.section_id');
			$query = $this->db->get();

			return $query->result_array();
		
	}

	public function get_teacher_subjects($teacher_id = NULL)
	{

		if(!isset($teacher_id) OR empty($teacher_id))
		{
			$teacher_id = $this->ion_auth->user()->row()->id;
		}


		$this->db->select('s.subject_id ,scode.subject_code_id, scode.subject_name, scode.subject_description, sect.section_name');
		$this->db->from('subject s');
		$this->db->join('subject_code scode', 'scode.subject_code_id = s.subj_code_id');
		//$this->db->join('component compo', 'scode.subject_code_id = compo.component_id','left');
		//$this->db->join('levels l', 'scode.subject_level_id = l.level_id');
		$this->db->join('sections sect', 'sect.section_id = s.sect_id');
		//$this->db->join('groups g', 'g.id = sect.section_id');
		$this->db->where('s.subj_teacher_id', $teacher_id);

			$query = $this->db->get();

			return $query->result_array();

	}


	public function get_subject_codes()
	{
		
	}
	public function get_subject($subject_id = NULL)
	{

		if(!isset($subject_id) OR empty($subject_id))
		{
			return $query = 'NO SUBJECT ID SET!';
		}


		$this->db->select('s.subject_id,scode.subject_code_id, scode.subject_name, scode.subject_description, sect.section_name, s.sect_id AS section_id, s.subj_teacher_id AS teacher_id');
		$this->db->from('subject s');
		$this->db->join('subject_code scode', 'scode.subject_code_id = s.subj_code_id');
		//$this->db->join('component compo', 'scode.subject_code_id = compo.component_id','left');
		//$this->db->join('component_type ct', 'compo.compo_compo_type = ct.component_type_id');
		$this->db->join('sections sect', 'sect.section_id = s.sect_id');
		$this->db->join('levels l', 'sect.section_level_id = l.level_id');
		//$this->db->join('groups g', 'g.id = sect.section_id');
		$this->db->where('s.subject_id', $subject_id);

		$this->db->limit(1);
		$query = $this->db->get();
		$row = $query->row();
		return $row;

	}

	/*
	returns array of objects of students in particular subject
	*/
	public function get_students_in_subject($subject_id = NULL,$sy)
	{
		//add where quarter id is active

		$this->db->select('u.id,u.first_name,u.middle_name,u.last_name');
		$this->db->from('students stud');
		$this->db->join('users u', 'stud.student_id = u.id','left');
		$this->db->join('sections sec', 'stud.student_sect_id = sec.section_id','left');
		$this->db->join('subject sub', 'sub.sect_id = sec.section_id','left');
		$this->db->where('sub.subject_id', $subject_id);
		$this->db->where('stud.student_enrolled_sy', $sy);
		
		$query = $this->db->get();

		return $query->result();
	}
	/*
	Get teachers inside a department by its department head ID
	*/
	public function get_teachers_dephead($dephead_id = NULL)
	{

		if(!isset($dephead_id) OR empty($dephead_id))
		{
			$dephead_id = $this->ion_auth->user()->row()->id;
		}


		$this->db->select('u.id,u.first_name,u.middle_name,u.last_name,t.is_adviser,d.dept_name');
		$this->db->from('teachers t');
		$this->db->join('users u', 'u.id = t.teacher_id');
		$this->db->join('department d', 't.teacher_dept_id = d.department_id');
		//$this->db->join('groups g', 's.sect_id = g.id');
		$this->db->where('d.depthead_id', $dephead_id);

			$query = $this->db->get();

			return $query->result();

	}
	/*
	Get teachers*/
	public function get_all_teachers()
	{


		$this->db->select('u.id,u.first_name,u.middle_name,u.last_name,t.is_adviser,d.dept_name');
		$this->db->from('users u');
		$this->db->join('teachers t', 'u.id = t.teacher_id');
		$this->db->join('department d', 't.teacher_dept_id = d.department_id');
		//$this->db->join('groups g', 's.sect_id = g.id');

			$query = $this->db->get();

			return $query->result();

	}

	/*
	Get teacher*/
	public function get_teacher($teacher_id = NULL)
	{
		if(!$teacher_id)
		{
			$teacher_id = $this->ion_auth->user()->row()->id;
		}

		$this->db->select('u.id,u.first_name,u.middle_name,u.last_name,t.is_adviser,d.dept_name');
		$this->db->from('users u');
		$this->db->join('teachers t', 'u.id = t.teacher_id');
		$this->db->join('department d', 't.teacher_dept_id = d.department_id');
		$this->db->where('u.id', $teacher_id);
		//$this->db->join('groups g', 's.sect_id = g.id');

			$query = $this->db->get();

			return $query->row();

	}

	

	public function get_child($parent_id = NULL){
		//get id of parent
		//run join statement
		//return array of rows that contains student ids
		//run another functions that will get the subjects of each students
		$this->db->select('student_id,first_name AS stud_f_name,middle_name AS stud_m_name,last_name AS stud_l_name');
		$this->db->from('parents p');

		$this->db->join('students s', 'p.parent_id = s.student_parent_id');
		$this->db->join('users u', 'u.id = s.student_id');
		$this->db->where('p.parent_id', $parent_id);

		$query = $this->db->get();

		return $query->result_array();
	}

	public function get_subjects_of_student($student_id = NULL)
	{
		//join statements
		$this->db->select('subj.subject_id, subjcode.subject_name, subjcode.subject_description, u.first_name AS t_f_name,u.middle_name AS t_m_name,u.last_name AS t_l_name');
		$this->db->from('students s');
		$this->db->join('sections sect', 's.student_sect_id = sect.section_id','LEFT');
		$this->db->join('subject subj', 'sect.section_id = subj.sect_id','LEFT');
		$this->db->join('subject_code subjcode', 'subj.subj_code_id = subjcode.subject_code_id','LEFT');
		$this->db->join('teachers t', 'subj.subj_teacher_id = t.teacher_id','LEFT');
		$this->db->join('users u', 'u.id = t.teacher_id');
		$this->db->where('s.student_id', $student_id);

		$query = $this->db->get();

		return $query->result_array();
	}

	public function get_student($student_id = NULL)
	{
		$this->db->select('u.id, u.first_name, u.middle_name, u.last_name, sect.section_name, sect.section_description AS section_desc, l.level_name, l.level_description,d.dept_name');
			$this->db->from('students s');
			$this->db->join('users u', 's.student_id = u.id');
			$this->db->join('sections sect', 's.student_sect_id = sect.section_id');
			$this->db->join('levels l', 'l.level_id = sect.section_level_id');
			$this->db->join('department d', 'l.level_department_id = d.department_id');
			//$this->db->join('groups g', 'g.id = sect.section_id');
			$this->db->where('s.student_id',$student_id);
			$query = $this->db->get();

			return $query->row();
	}

	public function get_students()
	{
		$this->db->select('u.id, u.username, u.email, u.last_login, u.first_name,u.middle_name,u.last_name, up.first_name as pf_name, up.middle_name as pm_name, up.last_name as pl_name');
			$this->db->from('students s');
			$this->db->join('users u', 's.student_id = u.id');
			$this->db->join('parents p', 's.student_parent_id = p.parent_id', 'left');
			$this->db->join('users up', 'p.parent_id = up.id','left');
			//$this->db->join('groups g', 'g.id = sect.section_id');
			$query = $this->db->get();

			return $query->result();
	}

	public function sample_report()
	{

			$this->db->select('*');
			$this->db->from('school_year sy');
			$this->db->join('quarter q', 'q.quarter_sy_id = sy.sy_id');
			$this->db->join('quarter_code qc', 'q.q_q_code = qc.quarter_code_id');
			$query = $this->db->get();

			return $query;
	}



	public function get_department_by_dephead($dephead_id = NULL)
	{
		if(!$dephead_id)
		{
			$dephead_id = $this->ion_auth->user()->row()->id;
		}

		$this->db->select('*');
		$this->db->from('department d');
		$this->db->where('d.depthead_id', $dephead_id);
		$query = $this->db->get();

		return $query->row();

	}

	public function get_departments()
	{

		$this->db->select('*');
		$this->db->from('department d');
		//$this->db->where('d.depthead_id', $dephead_id);
		$query = $this->db->get();

		return $query->result();

	}


	//get the department of a user teacher
	public function get_department_of_teacher($teacher_id)
    {
      $query = $this->db->select('*')
                        ->from('teachers t')
                        ->join('department d','t.teacher_dept_id = d.department_id')
                        ->where('t.teacher_id',$teacher_id)
                        ->get();
      return $query->row();
    }

	//update teacher's department
	public function update_teacher_department($teacher_id = NULL, $department_id = NULL)
    {
      $data = array(
          'teacher_dept_id'    => $department_id
      );

      $this->db->where('teacher_id', $teacher_id);

      $this->db->set($data);

      $query = $this->db->update('teachers');

        if (!$query)
        {
          $msg_result = $this->db->error()['message']; // Has keys 'code' and 'message'
        }
        else
        {
          $msg_result = "Success editing section!";
        }
        return $msg_result;

    }

    public function get_parents()
    {
    	$this->db->select('u.id, u.username, u.email, u.last_login, u.first_name,u.middle_name,u.last_name');
			$this->db->from('parents p');
			$this->db->join('users u', 'p.parent_id = u.id');
			$query = $this->db->get();

			return $query->result();
    }

    public function link_student($student_id , $parent_id)
    {
				$this->db->set('student_parent_id', $parent_id, FALSE);
				$this->db->where('student_id', $student_id);
		$query = $this->db->update('students');

			if (!$query)
			{
			  $msg_result = $this->db->error(); // Has keys 'code' and 'message'
			}
			else
			{
			  $msg_result = "Success linking students";
			}
			return $msg_result;
    }
}
