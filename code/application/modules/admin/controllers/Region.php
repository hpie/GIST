<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Region extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	// Frontend User CRUD
	public function index()
	{
		$crud = $this->generate_crud('cdac_regions');
		//$crud->columns('center_code', 'center_name', 'center_address_line1', 'center_address_line2', 'center_address_city', 'center_address_postcode', 'center_contact_number', 'center_type', 'center_code', 'active');
		$crud->columns('region_code', 'region_name', 'region_state_code', 'status');
		
		// Relation with States
		$crud->set_relation('region_state_code',' cdac_states','{state_name} - {state_code}',array('status' => 'A'), 'state_name, state_code ASC');
		
		//Relation with Status
		$crud->set_relation('status','cdac_status','{status_code}-{status_title}',array('status' => 'A'), 'status_code, status_title ASC');
		
		//Show only in ADD
		$crud->add_fields('region_code', 'region_name', 'region_state_code', 'status');
		
		//Show only for Update
		$crud->edit_fields('region_name', 'region_state_code', 'status'
		);
		
		$state = $crud->getState();
    	$state_info = $crud->getStateInfo();
		
		if ($state == 'add' || $state == 'insert_validation' || $state == 'insert')
		{
			//Mandatory Feilds
		$crud->required_fields('region_code', 'region_name', 'region_state_code', 'status');
			//$crud->getModel()->set_add_value('created_by', "system");	
			$crud->field_type('created_by', 'hidden', "system");
			//TODO
			// Make prospectus_number and mandatory if  enquiry_status == "P"
		}
		elseif ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			//Mandatory Feilds
			$crud->required_fields('region_code', 'region_name', 'region_state_code', 'status');
			$crud->field_type('region_code', 'readonly');
			//$crud->field_type('center_arc_code', 'readonly');
			$crud->field_type('modified_by', 'hidden', "system");
			// Modified the framework and added these two functions
			//$crud->getModel()->set_add_value('modified_dt', date("Y-m-d"));
			//$crud->getModel()->set_add_value('modified_by', "system");	
			//$this->grocery_crud->callback_add_field('modified_dt', function(){
            //    return date('y-m-d');
			//});
			/*	
			$crud->callback_add_field('modified_by', function(){
                return "system";
			});
			$crud->callback_add_field('modified_dt', function(){
                return date('y-m-d');
			});	
			*/
			
			/*
			if($crud->get(enquiry_status) != "P")
			{
				$crud->field_type('prospectus_number', 'readonly');
				$crud->field_type('prospectus_payment', 'readonly');
				$crud->field_type('enquiry_status', 'readonly');
			}
			*/
		}
		else
		{
			//$this->_example_output($output);
		}
		
		//$this->unset_crud_fields('ip_address', 'last_login');

		// only webmaster and admin can change member groups
		//if ($crud->getState()=='list' || $this->ion_auth->in_group(array('webmaster', 'admin', 'manager')))
		//{
		//	$crud->set_relation_n_n('groups', 'users_groups', 'groups', 'user_id', 'group_id', 'name');
	//	}

		// only webmaster and admin can reset user password
		//if ($this->ion_auth->in_group(array('webmaster', 'admin')))
		//{
		//	$crud->add_action('Reset Password', '', 'admin/user/reset_password', 'fa fa-repeat');
		//}

		// disable direct create / delete Frontend User
		//$crud->unset_add();
		$crud->unset_delete();

		$this->mPageTitle = 'Regions';
		$this->render_crud();
	}
	
}
