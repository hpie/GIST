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
		
		$crud->display_as('docket_code','Docket Code');
		$crud->display_as('carrier_code','Carrier Code');
		
		//these should be populated automatically based on the user
		$crud->display_as('requesting_entity_type','Requester Type');
		$crud->display_as('requesting_entity_code','Requester Code');
		
		//drop down
		$crud->display_as('requested_entity_type','Requested Entity Type');
		$crud->display_as('requested_entity_code','Requested Entity Code');
		
		$crud->display_as('package_sent_dt','Package Sent Date');
		$crud->display_as('package_content_details','Package Content Details');
		$crud->display_as('comments','Comments');
		$crud->display_as('package_received_dt','Package Received Date');
		
		
		$crud->columns('docket_code', 'carrier_code','requesting_entity_type','requesting_entity_code',
				'requested_entity_type','requested_entity_code','package_sent_dt',
				'package_content_details', 'package_received_dt','comments');
		
		//$crud->set_relation('atc_category','cdac_categories','{category_code}-{category_title}',array('category_type' => 'ATC-STS', 'category_status' => 'A'), 'category_code, category_title ASC');
		
		
		//Show only in ADD
		$crud->add_fields('docket_code', 'carrier_code', 'requesting_entity_type',
				'requesting_entity_code', 'requested_entity_type','requested_entity_code',
				'package_sent_dt', 'package_content_details', 'comments');
		
		$crud->field_type('requesting_entity_type','dropdown', array('ARC','ATC'));
		$crud->field_type('requested_entity_type','dropdown', array('CDAC','ARC','ATC'));
		
		//Show only for Update
		$crud->edit_fields('docket_code', 'carrier_code', 'requesting_entity_type',
				'requesting_entity_code', 'requested_entity_type','requested_entity_code',
				'package_sent_dt', 'package_content_details', 'comments', 'package_received_dt');
		
		//select entity code relation based on entity type
		$crud->set_relation('requesting_entity_code','cdac_arcs','{arc_code}-{arc_name}',array('status' => 'A'), 'arc_code, arc_name ASC');
		$crud->set_relation('requested_entity_code','cdac_atcs','{atc_code}-{atc_name}',array('status' => 'A'), 'atc_code, atc_name ASC');
		
		//how to add others? and create a new record if others
		$crud->set_relation('carrier_code','courier_carriers','{carrier_code}-{carrier_name}',array('carrier_status' => 'A'), 'carrier_code, carrier_name ASC');
		
		
		$state = $crud->getState();
		$state_info = $crud->getStateInfo();
		
		if ($state == 'add' || $state == 'insert_validation' || $state == 'insert')
		{
			//Mandatory Feilds
			$crud->required_fields('docket_code', 'carrier_code', 'requesting_entity_type',
					'requesting_entity_code', 'requested_entity_type','requested_entity_code',
					'package_sent_dt', 'package_content_details');
			
			$crud->field_type('created_by', 'hidden', "system");
		
		}
		elseif ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			//Mandatory Feilds
			$crud->required_fields('package_received_dt');
			
			//check user login = requested arc/ cdac then make it visible to edit
			if ( $this->ion_auth->in_group() )
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
