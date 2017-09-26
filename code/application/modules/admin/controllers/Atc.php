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
		$crud = $this->generate_crud('cdac_entities');
		$crud->where("cdac_entities.entity_type ='ATC'");
		
		$crud->display_as('entity_code','ATC Code');
		$crud->display_as('entity_name','ATC Name');		
		$crud->display_as('cdac_regions','CDAC Region');
		$crud->display_as('entity_address_line1','Address Line1');
		$crud->display_as('entity_address_line2','Address Line2');
		$crud->display_as('entity_address_city','City');
		$crud->display_as('entity_address_postcode','PostCode');
		$crud->display_as('entity_contact_number','Contact Number');
		$crud->display_as('entity_contact_email','Email');
		$crud->display_as('entity_status','Status');
		
		//$crud->columns('atc_code', 'atc_name', 'atc_address_line1', 'atc_address_line2', 'atc_address_city', 'atc_address_postcode', 'atc_contact_number', 'atc_type', 'atc_code', 'active');
		$crud->columns('entity_code', 'entity_name', 'entity_parent_code', 'entity_address_line1', 'entity_address_line2', 'entity_address_city', 'entity_address_postcode', 'entity_contact_number', 'entity_contact_email', 'entity_type', 'entity_category');
		
		// Relation with ARC
		//$crud->set_relation('atc_arc_code',' cdac_arcs','{arc_code}-{arc_name}',array('status' => 'A'), 'arc_code, arc_name ASC');
		
		//Parent Entity Type
		//$crud->field_type('atc_patent','true_false',array('ARC','CDAC'));
		$crud->set_relation('entity_parent_code',' cdac_entities','{entity_code}-{entity_name}',array('entity_type <> ATC',  'entity_status' => 'A'), 'entity_code, entity_name ASC');
		
		//Relation with Cities
		$crud->set_relation('entity_address_city','cdac_cities','{state_code}-{city_name}',array('status' => 'A'), 'state_code, city_name ASC');
		
		//Relation with Status
		$crud->set_relation('entity_status','cdac_status','{status_title}-{status_code}',array('status_group' => 'ATC-STS', 'status_mode' => 'A', 'status' => 'A'), 'status_code, status_title ASC');
		//$crud->set_relation('status','cdac_status','{status_title}-{status_code}',array('status_group' => 'GEN', 'status_mode' => 'A', 'status' => 'A'), 'status_code, status_title ASC');
		
		//Relation with ATC Category : A B C D etc
		$crud->set_relation('entity_grade','cdac_categories','{category_code}-{category_title}',array('category_type' => 'GRD', 'category_status' => 'A'), 'category_code, category_title ASC');
		
		
		//Show only in ADD
		$crud->add_fields('entity_code', 'entity_name', 'entity_parent_code', 'entity_address_line1', 'entity_address_line2', 'entity_address_city',
						'entity_address_postcode', 'entity_contact_number','entity_contact_email', 'entity_grade', 'entity_status', 'created_by');
		
		//Show only for Update
		$crud->edit_fields('entity_code', 'entity_name', 'entity_parent_code', 'entity_address_line1', 'entity_address_line2', 'entity_address_city',
						'entity_address_postcode', 'entity_contact_number','entity_contact_email', 'entity_grade', 'entity_status', 'modified_by');
		
		$state = $crud->getState();
    	$state_info = $crud->getStateInfo();
		
		if ($state == 'add' || $state == 'insert_validation' || $state == 'insert')
		{
			//Mandatory Feilds
		$crud->required_fields('entity_code','entity_name', 'entity_parent_code', 'entity_address_city', 'entity_contact_number', 'entity_contact_email', 'entity_grade', 'entity_status');
			//$crud->getModel()->set_add_value('created_by', "system");	
			$crud->field_type('created_by', 'hidden', $this->mUser->username);
			//TODO
			// Make prospectus_number and mandatory if  enquiry_status == "P"
		}
		elseif ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			//Mandatory Feilds
			$crud->required_fields('entity_name','atc_arc_code', 'entity_parent_code', 'entity_address_city', 'entity_contact_number', 'entity_contact_email', 'entity_grade', 'entity_status');
			$crud->field_type('atc_code', 'readonly');
			//$crud->field_type('atc_arc_code', 'readonly');
			$crud->field_type('modified_by', 'hidden', $this->mUser->username);
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
