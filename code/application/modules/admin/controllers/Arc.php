<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Arc extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	// Frontend User CRUD
	public function index()
	{
		
		$crud = $this->generate_crud('cdac_entities');
		$crud->where("entity_type ='ARC'");
		//$crud->where('requested_entity_code =\''.$this->mUser->entity_code."' OR requesting_entity_code='".$this->mUser->entity_code."'");
		
		//$crud->columns('center_code', 'center_name', 'center_address_line1', 'center_address_line2', 'center_address_city', 'center_address_postcode', 'center_contact_number', 'center_type', 'center_code', 'active');
			
		$crud->display_as('entity_code','ARC Code');
		$crud->display_as('entity_name','ARC Name');		
		$crud->display_as('cdac_regions','CDAC Region');
		$crud->display_as('entity_address_line1','Address Line1');
		$crud->display_as('entity_address_line2','Address Line2');
		$crud->display_as('entity_address_city','City');
		$crud->display_as('entity_address_postcode','PostCode');
		$crud->display_as('entity_contact_number','Contact Number');
		$crud->display_as('entity_contact_email','Email');
		$crud->display_as('entity_status','Status');
		
		$crud->columns('entity_code', 'entity_name', 'cdac_regions', 'entity_address_line1', 'entity_address_line2', 'entity_address_city', 'entity_address_postcode', 'entity_contact_number', 'entity_contact_email', 'entity_status');
		
		//$crud->set_relation('arc_address_state', 'cdac_states', 'state_name');
		//$crud->set_relation('arc_address_city', 'cdac_cities', 'city_name');
		
	// only webmaster and admin can change member groups
		//if ($crud->getState()=='list' || $this->ion_auth->in_group(array('webmaster', 'admin')))
		//{
			$crud->set_relation_n_n('cdac_regions', 'arc_cdac_regions', 'cdac_regions', 'entity_code', 'region_code', 'region_name');
		//}
		
		$crud->set_relation('entity_address_city','cdac_cities','{state_code}-{city_name}',array('status' => 'A'), 'state_code, city_name ASC');
		
		//Relation with Status
		$crud->set_relation('entity_status','cdac_status','{status_title}-{status_code}',array('status_group' => 'GEN', 'status_mode' => 'A', 'status' => 'A'), 'status_code, status_title ASC');
		
		//Show only in ADD
		$crud->add_fields('entity_code', 'entity_name', 'entity_type', 'entity_parent_code', 'cdac_regions', 'entity_address_line1', 'entity_address_line2', 'entity_address_city',
		 'entity_address_postcode', 'entity_contact_number', 'entity_contact_email', 'entity_status', 'created_by');
		
		//Show only for Update
		$crud->edit_fields('entity_code', 'entity_name', 'cdac_regions', 'entity_address_line1', 'entity_address_line2', 'entity_address_city',
		 'entity_address_postcode', 'entity_contact_number', 'entity_contact_email', 'entity_status', 'modified_by');
		
		$state = $crud->getState();
    	$state_info = $crud->getStateInfo();
		
		if ($state == 'add' || $state == 'insert_validation' || $state == 'insert')
		{
			//Mandatory Feilds
		$crud->required_fields('entity_code', 'entity_name', 'entity_address_city', 'entity_address_postcode', 'entity_contact_number', 'entity_contact_email', 'entity_status');
			//$crud->getModel()->set_add_value('created_by', "system");
			$crud->field_type('entity_type', 'hidden', "ARC");
			$crud->field_type('entity_parent_code', 'hidden', "CDAC01");
			$crud->field_type('created_by', 'hidden', $this->mUser->username);
			//TODO
			// Make prospectus_number and mandatory if  enquiry_status == "P"
		}
		elseif ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			//Mandatory Feilds
			$crud->required_fields('entity_name', 'entity_address_city', 'entity_address_postcode', 'entity_contact_number', 'entity_contact_email', 'entity_status');
			$crud->field_type('entity_code', 'readonly');
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

		$this->mPageTitle = 'ARCs';
		$this->render_crud();
	}
	
}
