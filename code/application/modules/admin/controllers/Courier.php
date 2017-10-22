<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Courier extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}
	
	public function sent()
	{
		$loggedInUSer = $this->mUser;
		$crud = $this->generate_crud('cdac_couriers');
		$crud->where('cdac_couriers.entity_code =\''.$this->mUser->entity_code."'");
				
		$crud->display_as('docket_code','Docket Code');
		$crud->display_as('carrier_code','Carrier Code');
		
		$crud->display_as('sending_to','Sent to');
		
		$crud->display_as('sent_dt','Package Sent Date');
		$crud->display_as('content_details','Package Content Details');
		$crud->display_as('comments','Comments (500 characters)');
		$crud->display_as('received_dt','Package Received Date');
		
		
		$crud->columns('docket_code', 'carrier_code','sending_to',
				'sent_dt','content_details', 'received_dt','comments');
		
		
		$crud->set_relation('carrier_code','courier_carriers','{carrier_code}-{carrier_name}',
				array('carrier_status' => 'A'), 'carrier_code, carrier_name ASC');
		
		$crud->set_relation('sending_to','cdac_entities','{entity_code}-{entity_name}',
				array('entity_status' => 'A'), 'entity_code, entity_name ASC');
		
		
		$state = $crud->getState();
		$state_info = $crud->getStateInfo();
		
		
		if ($state == 'add' || $state == 'insert_validation' || $state == 'insert')
		{
			//Show only in ADD
			$crud->add_fields('docket_code', 'carrier_code','entity_code', 'sending_to', 'courier_status',
					'sent_dt', 'content_details', 'comments');
			
			//Mandatory Feilds
			$crud->required_fields('docket_code', 'carrier_code', 'sent_dt', 'content_details');
						
			$crud->field_type('entity_code', 'hidden', $loggedInUSer->entity_code);
			$crud->field_type('courier_status', 'hidden', "SENT");
			
			$crud->field_type('created_by', 'hidden', $loggedInUSer->username);
		
		}
		elseif ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			$crud->edit_fields('docket_code', 'carrier_code','entity_code', 'sending_to','courier_status',
					'sent_dt', 'content_details', 'comments');
			
			
			$this->load->model('Cdac_courier_model', 'courier');
			$this->row = $this->courier->get_by('row_id', $pk);

			print_r($this->row);
			
			if($this->row->courier_status == "REC")
			{
				print_r($this->row);
				$crud->field_type('docket_code', 'readonly');
				$crud->field_type('carrier_code', 'readonly');
				$crud->field_type('sent_to', 'readonly');
				$crud->field_type('sent_dt', 'readonly');
				$crud->field_type('content_details', 'readonly');
			}		
			
			$crud->field_type('courier_status', 'hidden');
			$crud->field_type('modified_by', 'hidden', $loggedInUSer->username);
		}
		
		$crud->unset_delete();
		$this->mPageTitle = 'Couriers';
		$this->render_crud();
	}
	public function received()
	{
		$loggedInUSer = $this->mUser;
		$crud = $this->generate_crud('cdac_couriers');
		$crud->where('sending_to =\''.$this->mUser->entity_code."'");
		
		$crud->display_as('docket_code','Docket Code');
		$crud->display_as('carrier_code','Carrier Code');
		
		$crud->display_as('enitity_code','Received From');
		$crud->display_as('courier_status','Courier Status');
		
		$crud->display_as('sent_dt','Package Sent Date');
		$crud->display_as('content_details','Package Content Details');
		$crud->display_as('comments','Comments (500 characters)');
		$crud->display_as('received_dt','Package Received Date');
		
		
		$crud->columns('docket_code', 'carrier_code', 'courier_status','sending_to',
				'sent_dt','content_details', 'received_dt','comments');
		
		
		$state = $crud->getState();
		$state_info = $crud->getStateInfo();
		
		
		if ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			$crud->edit_fields('docket_code', 'carrier_code','entity_code', 'courier_status',
					'sent_dt', 'content_details', 'received_dt', 'comments');
			
			//Mandatory Feilds
			$crud->required_fields('received_dt');
			
			$crud->field_type('entity_code', 'readonly');
			$crud->field_type('docket_code', 'readonly');
			$crud->field_type('carrier_code', 'readonly');
			$crud->field_type('sent_dt', 'readonly');
			$crud->field_type('content_details', 'readonly');
			
			$crud->field_type('courier_status', 'hidden', "REC");
			$crud->field_type('modified_by', 'hidden', $loggedInUSer->username);
			
			$this->load->model('Cdac_courier_model', 'courier');
			$this->row = $this->courier->get_by('row_id', $pk);
			
			// requester cant edit request fields and responder's fields once the responder dispatches the request
			
			if($this->row->courier_status == 'REC')
			{
				$crud->field_type('received_dt', 'readonly');
			}
		}
		$crud->unset_add();
		$crud->unset_delete();
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
