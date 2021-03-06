<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Course extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	// Frontend User CRUD
	public function index()
	{
		$crud = $this->generate_crud('cdac_courses');
		
		$crud->display_as('course_code','Course Code');
		$crud->display_as('course_name','Course Name');
		$crud->display_as('cdac_modules','Course Modules');
		$crud->display_as('course_description','Description');
		$crud->display_as('course_status','Status');
		
		
		//$crud->columns('center_code', 'center_name', 'center_address_line1', 'center_address_line2', 'center_address_city', 'center_address_postcode', 'center_contact_number', 'center_type', 'center_code', 'active');
		$crud->columns('course_code', 'course_name', 'cdac_modules', 'course_description', 'course_status');
		
		//$crud->set_relation('arc_address_state', 'cdac_states', 'state_name');
		//$crud->set_relation('arc_address_city', 'cdac_cities', 'city_name');
		
		//only webmaster and admin can change member groups
		//if ($crud->getState()=='list' || $this->ion_auth->in_group(array('webmaster', 'admin')))
		//{
			$crud->set_relation_n_n('cdac_modules', 'cdac_course_modules', 'cdac_modules', 'course_code', 'module_code', 'module_name');
		//}
		
		//Relation with Status
		$crud->set_relation('course_status','cdac_status','{status_code}-{status_title}',array('status' => 'A'), 'status_code, status_title ASC');
		
		//Show only in ADD
		$crud->add_fields('course_code', 'course_name', 'cdac_modules', 'course_description', 'course_status');
		
		//Show only for Update
		$crud->edit_fields('course_name', 'cdac_modules', 'course_description', 'course_status');
		
		$crud->required_fields('course_code', 'course_name', 'course_status');
	
		// disable direct create / delete Frontend User
		//$crud->unset_add();
		$crud->unset_delete();

		$this->mPageTitle = 'CDAC Courses';
		$this->render_crud();
	}
	
}
