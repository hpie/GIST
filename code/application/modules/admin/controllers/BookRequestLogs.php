<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class BookRequestLogs extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	// Frontend User CRUD
	public function index()
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
