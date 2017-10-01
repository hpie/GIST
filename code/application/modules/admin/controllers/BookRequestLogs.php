<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class BookRequestLogs extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	
	public function students()
	{
		$loggedinUser = $this->mUser;
		
		$crud = $this->generate_crud('atc_student_book_issue_logs');
		$crud->where('entity_code =\''.$loggedinUser->entity_code."'");
		
		$crud->display_as('student_id','Student ID');
		$crud->display_as('course_code','Course Code');
		$crud->display_as('module_code','Module Code');
		$crud->display_as('book_code','Book Code');
		$crud->display_as('issue_status','Issue Status');
		$crud->display_as('book_issue_dt','Book Issue Date');
		
		$crud->columns('student_id','course_code', 'module_code','book_code',
				'issue_status', 'book_issue_dt');
		
		$state = $crud->getState();
		$state_info = $crud->getStateInfo();
		
		if ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			//Mandatory Feilds
			
			//Show only for Update
			$crud->edit_fields('student_id','course_code','module_code',
					'book_code','issue_status', 'book_issue_dt');
			
			$crud->field_type('student_id', 'readonly');
			$crud->field_type('course_code', 'readonly');
			$crud->field_type('module_code', 'readonly');
			$crud->field_type('book_code', 'readonly');
			
			$crud->field_type('issue_status','dropdown', array('Requested' => 'Requested', 'Issued' => 'Issued'));
			
			$crud->field_type('modified_by', 'hidden', "system");
		}
		
		//$crud->unset_add();
		
		$crud->unset_delete();
		
		$this->mPageTitle = 'Student Book Issue Log';
		$this->render_crud();
	}
	
	public function requestedByMe()
	{
		$crud = $this->generate_crud('cdac_book_requests');
		$crud->where('entity_code =\''.$this->mUser->entity_code."'".' AND request_status = \'REC\'');
		
		$crud->display_as('book_code','Book Code');
		$crud->display_as('requesting_to','Requested To');
		$crud->display_as('requesting_count','Requested Count');
		$crud->display_as('requesting_dt','Requested On');
		$crud->display_as('dispatched_count','Dispatched Count');
		$crud->display_as('dispatched_dt','Dispatched Date');
		$crud->display_as('received_count','Received Count');
		$crud->display_as('received_dt','Received On');
		
		
		$crud->columns('book_code','requesting_count','requesting_to','requesting_dt',
				'dispatched_count','dispatched_dt','delivery_mode','delivery_reference','received_count','received_dt');
		
		$crud->unset_delete();
		$crud->unset_add();
		$crud->unset_edit();
		
		$this->mPageTitle = 'Book Request Logs';
		$this->render_crud();
	}
	
	public function requestedToMe()
	{
		$crud = $this->generate_crud('cdac_book_requests');
		$crud->where('requesting_to =\''.$this->mUser->entity_code."'".' AND request_status = \'REC\'');
		
		$crud->display_as('book_code','Book Code');
		$crud->display_as('entity_code','Requested By');
		$crud->display_as('requesting_count','Requested Count');
		$crud->display_as('requesting_dt','Requested On');
		$crud->display_as('dispatched_count','Dispatched Count');
		$crud->display_as('dispatched_dt','Dispatched Date');
		$crud->display_as('received_count','Received Count');
		$crud->display_as('received_dt','Received On');
		
		
		$crud->columns('book_code','requesting_count','entity_code','requesting_dt',
				'dispatched_count','dispatched_dt','delivery_mode','delivery_reference','received_count','received_dt');
		$crud->unset_delete();
		$crud->unset_add();
		$crud->unset_edit();
		
		$this->mPageTitle = 'Book Dispatch Logs';
		$this->render_crud();
	}
	
	public function cdac()
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
