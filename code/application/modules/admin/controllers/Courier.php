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
		//change table name to Couriers
		
		$crud = $this->generate_crud('couriers');
		
		print_r($this->mUser->entity_code);
		//$crud->set_table('couriers');
		$crud->where('requested_entity_code =',$this->mUser->entity_code);
		
		
		$crud->display_as('docket_code','Docket Code');
		$crud->display_as('carrier_code','Carrier Code');
		
		
		$crud->display_as('requesting_entity_type','Sent To');
		$crud->display_as('requesting_entity_code','Sent To Code');
		
		//drop down
		$crud->display_as('requested_entity_type','Sender Entity Type');
		$crud->display_as('requested_entity_code','Sender Entity Code');
		
		$crud->display_as('package_sent_dt','Package Sent Date');
		$crud->display_as('package_content_details','Package Content Details');
		$crud->display_as('comments','Comments');
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
				'package_sent_dt', 'package_content_details', 'comments', 'package_received_dt');
		
		//select entity code relation based on entity type
	//	$crud->set_relation('requested_entity_code','cdac_arcs','{arc_code}-{arc_name}',array('status' => 'A'), 'arc_code, arc_name ASC');
		$crud->set_relation('requesting_entity_code','cdac_atcs','{atc_code}-{atc_name}',array('status' => 'A'), 'atc_code, atc_name ASC');
		
		//how to add others? and create a new record if others
		$crud->set_relation('carrier_code','courier_carriers','{carrier_code}-{carrier_name}',array('carrier_status' => 'A'), 'carrier_code, carrier_name ASC');
		
		
		$state = $crud->getState();
		$state_info = $crud->getStateInfo();
		
		//print_r( $this->ion_auth->_cache_user_in_group);
		
		print_r( $this->mUser->entity_type);
		
		
		if ($state == 'add' || $state == 'insert_validation' || $state == 'insert')
		{
			//Mandatory Feilds
			$crud->required_fields('docket_code', 'carrier_code', 'requesting_entity_type',
					'requesting_entity_code', 'requested_entity_type','requested_entity_code',
					'package_sent_dt', 'package_content_details');
			
			
			$entity_type = $this->mUser->entity_type;
			$entity_code = $this->mUser->entity_code;
			
			$crud->field_type('requesting_entity_type','dropdown',array('CDAC'=>'CDAC','ARC'=>'ARC','ATC'=>'ATC'));
			$crud->set_relation('requesting_entity_code','cdac_atcs','{atc_code}-{atc_name}',array('status' => 'A'), 'atc_code, atc_name ASC');
			
			
			$crud->field_type('requested_entity_type','hidden',$entity_type);
			$crud->field_type('requested_entity_code','hidden',$entity_code);
			
			$crud->field_type('created_by', 'hidden', "system");
		
		}
		elseif ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			//Mandatory Feilds
			$crud->required_fields('package_received_dt');
			
			print_r($crud->columns());
			
			//check user login = requested arc/ cdac then make it visible to edit
			if ( $this->mUser->entity_code)
			{
				
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
	
}
