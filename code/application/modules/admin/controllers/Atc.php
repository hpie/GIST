<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Atc extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	// Frontend User CRUD
	public function index()
	{
		$crud = $this->generate_crud('cdac_atcs');
		//$crud->columns('atc_code', 'atc_name', 'atc_address_line1', 'atc_address_line2', 'atc_address_city', 'atc_address_postcode', 'atc_contact_number', 'atc_type', 'atc_code', 'active');
		$crud->columns('atc_code', 'atc_name', 'atc_arc_code', 'atc_address_line1', 'atc_address_line2', 'atc_address_city', 'atc_address_postcode', 'atc_contact_number', 'atc_contact_email', 'atc_type', 'atc_category');
		
		// Relation with ARC
		$crud->set_relation('atc_arc_code',' cdac_arcs','{arc_code}-{arc_name}',array('status' => 'A'), 'arc_code, arc_name ASC');
		
		//Parent Entity Type
		$crud->field_type('atc_patent','true_false',array('ARC','CDAC'));
		
		//Relation with Cities
		$crud->set_relation('atc_address_city','cdac_cities','{state_code}-{city_name}',array('status' => 'A'), 'state_code, city_name ASC');
		
		//Relation with Status
		$crud->set_relation('status','cdac_status','{status_title}-{status_code}',array('status_group' => 'ATC-STS', 'status_mode' => 'A', 'status' => 'A'), 'status_code, status_title ASC');
		//$crud->set_relation('status','cdac_status','{status_title}-{status_code}',array('status_group' => 'GEN', 'status_mode' => 'A', 'status' => 'A'), 'status_code, status_title ASC');
		
		//Relation with ATC Category : A B C D etc
		$crud->set_relation('atc_category','cdac_category','{category_code}-{category_title}',array('category_type' => 'ATC-STS', 'category_status' => 'A'), 'category_code, category_title ASC');
		
		
		//Show only in ADD
		$crud->add_fields('atc_code', 'atc_name', 'atc_arc_code', 'atc_patent', 'atc_address_line1', 'atc_address_line2', 'atc_address_city',
						'atc_address_postcode', 'atc_contact_number','atc_contact_email', 'atc_type', 'atc_category', 'status');
		
		//Show only for Update
		$crud->edit_fields('atc_code', 'atc_name', 'atc_arc_code', 'atc_patent', 'atc_address_line1', 'atc_address_line2', 'atc_address_city',
						'atc_address_postcode', 'atc_contact_number','atc_contact_email', 'atc_type', 'atc_category', 'status');
		
		$state = $crud->getState();
    	$state_info = $crud->getStateInfo();
		
		if ($state == 'add' || $state == 'insert_validation' || $state == 'insert')
		{
			//Mandatory Feilds
		$crud->required_fields('atc_code','atc_name','atc_arc_code','atc_address_city', 'atc_contact_number', 'atc_contact_email','status');
			//$crud->getModel()->set_add_value('created_by', "system");	
			$crud->field_type('created_by', 'hidden', "system");
			//TODO
			// Make prospectus_number and mandatory if  enquiry_status == "P"
		}
		elseif ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			//Mandatory Feilds
			$crud->required_fields('atc_name','atc_arc_code','atc_address_city', 'atc_contact_number', 'atc_contact_email','status');
			$crud->field_type('atc_code', 'readonly');
			//$crud->field_type('atc_arc_code', 'readonly');
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

		$this->mPageTitle = 'ATCs';
		$this->render_crud();
	}
	
}
