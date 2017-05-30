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
		//$crud->columns('center_code', 'center_name', 'center_address_line1', 'center_address_line2', 'center_address_city', 'center_address_postcode', 'center_contact_number', 'center_type', 'center_code', 'active');
		$crud->columns('course_code', 'course_name', 'course_description', 'course_status');
		
		//$crud->set_relation('arc_address_state', 'cdac_states', 'state_name');
		//$crud->set_relation('arc_address_city', 'cdac_cities', 'city_name');
		
		//Relation with Status
		$crud->set_relation('course_status','cdac_status','{status_code}-{status_title}',array('status' => 'A'), 'status_code, status_title ASC');
		
		//Show only in ADD
		$crud->add_fields('course_code', 'course_name', 'course_description', 'course_status');
		
		//Show only for Update
		$crud->edit_fields('course_name', 'course_description', 'course_status');
		
		$crud->required_fields('course_code', 'course_name', 'course_status');
	
		// disable direct create / delete Frontend User
		//$crud->unset_add();
		$crud->unset_delete();

		$this->mPageTitle = 'CDAC Courses';
		$this->render_crud();
	}
	
}
