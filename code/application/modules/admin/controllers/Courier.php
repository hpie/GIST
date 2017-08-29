<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Courier extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}
	
	public function index()
	{
		$crud = $this->generate_crud('couriers');
		$crud->where('requested_entity_code =\''.$this->mUser->entity_code."' OR requesting_entity_code='".$this->mUser->entity_code."'");
				
		$crud->display_as('docket_code','Docket Code');
		$crud->display_as('carrier_code','Carrier Code');
		
		$crud->display_as('requesting_entity_type','Sent To Entity Type');
		$crud->display_as('requesting_entity_code','Sent To Entity Code');
		
		$crud->display_as('requested_entity_type','Sender Entity Type');
		$crud->display_as('requested_entity_code','Sender Entity Code');
		
		$crud->display_as('package_sent_dt','Package Sent Date');
		$crud->display_as('package_content_details','Package Content Details');
		$crud->display_as('comments','Comments (500 characters)');
		$crud->display_as('package_received_dt','Package Received Date');
		
		
		$crud->columns('docket_code', 'carrier_code','requesting_entity_type','requesting_entity_code',
				'requested_entity_type','requested_entity_code','package_sent_dt',
				'package_content_details', 'package_received_dt','comments');
		
		
		
		//Show only in ADD
		$crud->add_fields('docket_code', 'carrier_code', 'requesting_entity_type',
				'requesting_entity_code', 'requested_entity_type','requested_entity_code',
				'package_sent_dt', 'package_content_details', 'comments');
		
		
		
		//Show only for Update
		$crud->edit_fields('docket_code', 'carrier_code', 'requesting_entity_type',
				'requesting_entity_code', 'requested_entity_type','requested_entity_code',
				'package_sent_dt', 'package_content_details' , 'package_received_dt', 'comments');
		
		
		$crud->set_relation('carrier_code','courier_carriers','{carrier_code}-{carrier_name}',array('carrier_status' => 'A'), 'carrier_code, carrier_name ASC');
		
		
		$state = $crud->getState();
		$state_info = $crud->getStateInfo();
		
		
		if ($state == 'add' || $state == 'insert_validation' || $state == 'insert')
		{
			//Mandatory Feilds
			$crud->required_fields('docket_code', 'carrier_code', 'requesting_entity_type',
					'requesting_entity_code', 'requested_entity_type','requested_entity_code',
					'package_sent_dt', 'package_content_details');
			
			
			$entity_type = $this->mUser->entity_type;
			$entity_code = $this->mUser->entity_code;
			
			$crud->field_type('requesting_entity_type','dropdown',array('CDAC'=>'CDAC','ARC'=>'ARC','ATC'=>'ATC'));
			//make this dynamic instead of atc
			$crud->set_relation('requesting_entity_code','cdac_atcs','{atc_code}-{atc_name}',array('status' => 'A'),'atc_code,atc_name ASC');
			//dynamic part
			$return_value = $crud->callback_field('requesting_entity_type',array($this,'callback_set_custom_js'));
			
			//current user details who creates the courier record
			$crud->field_type('requested_entity_type','hidden',$entity_type);
			$crud->field_type('requested_entity_code','hidden',$entity_code);
			
			$crud->field_type('created_by', 'hidden', "system");
		
		}
		elseif ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			//Mandatory Feilds
			$crud->required_fields('package_received_dt');
			
			//remove hard coding
			//some callback function for custom js is needed here i guess
			if ($this->mUser->entity_code == 'ARC-1')
			{
				$crud->field_type('package_received_dt', 'readonly');
			}
			
				$crud->field_type('docket_code', 'readonly');
				$crud->field_type('carrier_code', 'readonly');
				$crud->field_type('requesting_entity_type', 'readonly');
				$crud->field_type('requesting_entity_code', 'readonly');
				$crud->field_type('requested_entity_type', 'readonly');
				$crud->field_type('requested_entity_code', 'readonly');
				$crud->field_type('package_sent_dt', 'readonly');
				$crud->field_type('package_content_details', 'readonly');
				
				
			$crud->field_type('modified_by', 'hidden', "system");
		}
		
		$this->mPageTitle = 'Couriers';
		$this->render_crud();
	}
	function callback_set_custom_js($value, $primary_key)
	{
		print_r($value);
		print_r($primary_key);
		
		return '+30 <input type="text" maxlength="50" value="'.$value.'" name="phone" style="width:462px">';
	}
	
}
