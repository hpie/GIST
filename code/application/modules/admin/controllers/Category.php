<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Category extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	// Frontend User CRUD
	public function index()
	{
		$crud = $this->generate_crud('cdac_categories');
		//$crud->columns('center_code', 'center_name', 'center_address_line1', 'center_address_line2', 'center_address_city', 'center_address_postcode', 'center_contact_number', 'center_type', 'center_code', 'active');
		$crud->columns('category_code', 'category_title', 'category_type', 'status_mode', 'category_description');
		
		//Show only in ADD
		$crud->add_fields('category_code', 'category_title', 'category_type', 'category_status', 'category_description');
		
		//Show only for Update
		$crud->edit_fields('category_title', 'category_type', 'category_status', 'category_description');
		
		$crud->required_fields('category_code', 'category_title', 'category_type');
	
		$crud->field_type('category_type','dropdown',
			array('EDU-QUA' => 'Education-Qualificatoin', 'ENR-TYP' => 'Enrollment-Type', 'ATC-GRD' => 'ATC-Grade'));
		
		$crud->field_type('category_status','dropdown',
			array('A' => 'Active', 'I' => 'In-Active'));
			
		// disable direct create / delete Frontend User
		//$crud->unset_add();
		$crud->unset_delete();

		$this->mPageTitle = 'Category Codes';
		$this->render_crud();
	}
	
}
