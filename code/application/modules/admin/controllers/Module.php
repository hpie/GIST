<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Module extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	// Frontend User CRUD
	public function index()
	{
		$crud = $this->generate_crud('cdac_modules');
		//$crud->columns('center_code', 'center_name', 'center_address_line1', 'center_address_line2', 'center_address_city', 'center_address_postcode', 'center_contact_number', 'center_type', 'center_code', 'active');
		$crud->columns('module_code', 'module_name', 'module_description', 'module_status');
		
		//$crud->set_relation('arc_address_state', 'cdac_states', 'state_name');
		//$crud->set_relation('arc_address_city', 'cdac_cities', 'city_name');
		
		//only webmaster and admin can change member groups
		//if ($crud->getState()=='list' || $this->ion_auth->in_group(array('webmaster', 'admin')))
		//{
			//$crud->set_relation_n_n('cdac_courses', 'cdac_course_modules', 'cdac_courses', 'module_code', 'course_code', 'course_name');
		//}
		
		//Relation with Status
		$crud->set_relation('module_status','cdac_status','{status_code}-{status_title}',array('status' => 'A'), 'status_code, status_title ASC');
		
		//Show only in ADD
		$crud->add_fields('module_code', 'module_name', 'module_description', 'module_status');
		
		//Show only for Update
		$crud->edit_fields('module_name', 'module_description', 'module_status');
		
		$crud->required_fields('module_code', 'module_name', 'module_status');
	
		// disable direct create / delete Frontend User
		//$crud->unset_add();
		$crud->unset_delete();

		$this->mPageTitle = 'CDAC Course Module';
		$this->render_crud();
	}
	
}
