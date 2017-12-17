<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ProspectusRequests extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	public function requestedByMe()
	{
		$crud = $this->generate_crud('cdac_prospectus_requests');
		$crud->where('entity_code =\''.$this->mUser->entity_code."'".' AND request_status = \'REC\'');
		
		$crud->display_as('requesting_to','Requested To');
		$crud->display_as('requesting_count','Requested Count');
		$crud->display_as('requesting_dt','Requested On');
		$crud->display_as('dispatched_count','Dispatched Count');
		$crud->display_as('dispatched_dt','Dispatched Date');
		$crud->display_as('received_count','Received Count');
		$crud->display_as('received_dt','Received On');
		
		$crud->columns('requesting_count','requesting_to','requesting_dt',
				'dispatched_count','dispatched_dt','delivery_mode','delivery_reference','received_count','received_dt');
		
		$crud->unset_delete();
		$crud->unset_edit();
		
		$this->mPageTitle = 'Prospectus Request Logs';
		$this->render_crud();
	}
	
	public function requestedToMe()
	{
		$crud = $this->generate_crud('cdac_prospectus_requests');
		$crud->where('requesting_to =\''.$this->mUser->entity_code."'".' AND request_status = \'REC\'');
		
		$crud->display_as('entity_code','Requested By');
		$crud->display_as('requesting_count','Requested Count');
		$crud->display_as('requesting_dt','Requested On');
		$crud->display_as('dispatched_count','Dispatched Count');
		$crud->display_as('dispatched_dt','Dispatched Date');
		$crud->display_as('received_count','Received Count');
		$crud->display_as('received_dt','Received On');
		
		$crud->columns('requesting_count','entity_code','requesting_dt',
				'dispatched_count','dispatched_dt','delivery_mode','delivery_reference','received_count','received_dt');
		$crud->unset_delete();
		$crud->unset_add();
		$crud->unset_edit();
		
		$this->mPageTitle = 'Prospectus Dispatch Logs';
		$this->render_crud();
	}
	
	public function cdac()
	{
		$crud = $this->generate_crud('cdac_prospectus_orders');
		
		$crud->display_as('book_code','Book Code');
		$crud->display_as('book_transaction_type','Transaction Type');
		$crud->display_as('requested_entity_type','Requester');
		$crud->display_as('requested_entity_code','Requester Code');
		$crud->display_as('processed_dt','Processed Date');
		
		$crud->columns('order_code','book_code', 'book_transaction_type','requested_entity_type', 'requested_entity_code',
				'processed_dt');
		$crud->unset_delete();
		$crud->unset_add();
		$crud->unset_edit();
		
		$this->mPageTitle = 'Book Transaction Logs';
		$this->render_crud();
	}
}
