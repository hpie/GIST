<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Courier extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}
	
	public function cdac()
	{
		$crud = $this->generate_crud('cdac_couriers');
		$crud->display_as('docket_code','Docket Code');
		$crud->display_as('carrier_code','Carrier Code');
		//$crud->display_as('requesting_entity_type','Requester Type');
		$crud->display_as('requesting_entity_code','Requester Code');
		//$crud->display_as('requested_entity_type','Requested Entity Type');
		$crud->display_as('requested_entity_code','Requested Entity Code');
		$crud->display_as('package_sent_dt','Package Sent Date');
		$crud->display_as('package_content_details','Package Content Details');
		$crud->display_as('comments','Comments');
		$crud->display_as('package_received_dt','Package Received Date');
		
		
		$crud->columns('docket_code', 'carrier_code','requesting_entity_code', 'requested_entity_code',
				'processed_dt');
		
		$this->mPageTitle = 'Couriers';
		$this->render_crud();
	}
	
	public function arc()
	{
		$crud = $this->generate_crud('arc_book_request_logs');
		$crud->display_as('order_code','Order Code');
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
	
	public function atc()
	{
		$crud = $this->generate_crud('cdac_book_request_logs');
		
		$crud->display_as('order_code','Order Code');
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
