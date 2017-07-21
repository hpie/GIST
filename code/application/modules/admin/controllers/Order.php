<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}


	// Frontend User CRUD
	public function index()
	{
		$crud = $this->generate_crud('cdac_book_orders');
		
		$crud->display_as('order_code','Order Code');
		$crud->display_as('book_code','Book Code');
		$crud->display_as('requested_count','Requested count');
		$crud->display_as('received_count','Received count');
		$crud->display_as('reason_for_loss','Reason for loss');
		$crud->display_as('comments','Comments');
		$crud->display_as('request_status','Request Status');
		$crud->display_as('expected_delivery_dt','Expected Delivery Date');
		$crud->display_as('actual_delivery_dt','Delivered On');
		
		$crud->columns('order_code','book_code', 'requested_count','expected_delivery_dt',
		'request_status', 'received_count',  'actual_delivery_dt', 'reason_for_loss', 'comments');
		

		//Relation with Book
		$crud->set_relation('book_code','cdac_books','{book_code}-{book_name}',array('book_status' => 'A'), 'book_code, book_name ASC');
		
		
		//Edit criteria
		$state = $crud->getState();
    	$state_info = $crud->getStateInfo();
		$pk = $state_info->primary_key;
		$crud->field_type('request_status','dropdown',
		array('O' => 'Ordered', 'R' => 'Received'));
		
		$crud->callback_column('request_status',array($this,'callback_check_request_status'));
		
		
		if ($state == 'add' || $state == 'insert_validation' || $state == 'insert')
		{
			//Show only in ADD
			$crud->add_fields('order_code','book_code', 'requested_count','expected_delivery_dt',
			'request_status');
			//Mandatory Feilds
			$crud->required_fields('order_code','book_code', 'requested_count',
		'	request_status');
			// get the user id	from ion_auth
			//$this->ion_auth->in_group(array('webmaster', 'admin')
			//$crud->getModel()->set_add_value('created_by', "system");
			$crud->field_type('created_by', 'hidden', "system");
		}
		elseif ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			//Mandatory Feilds
			//Show only for Update
			$crud->edit_fields('order_code','book_code', 'requested_count','expected_delivery_dt',
			'request_status', 'received_count',  'actual_delivery_dt', 'reason_for_loss', 'comments');
			// get status value
			//validate if status completed
				
				// if status received make received count etc mandatory
			
			// Make these readonly and also accessible for callback update_log_after_update
			$crud->field_type('order_code', 'hidden');
			$crud->field_type('book_code', 'hidden');
			
			//$crud->field_type('order_code_fk', 'invisible');
			//$crud->field_type('book_code_fk', 'invisible');	
			
			$crud->field_type('modified_by', 'hidden', "system");
			
			$this->load->model('Cdac_book_order_model', 'bookOrder');
			$row = $this->bookOrder->get_by('order_code', $pk);
			
			print_r($row);
			
			if($row->request_status == 'R')
			{
				$crud->field_type('order_code', 'readonly');
				$crud->field_type('book_code', 'readonly');
				$crud->field_type('requested_count', 'readonly');
				$crud->field_type('expected_delivery_dt', 'readonly');
				$crud->field_type('request_status', 'readonly');
				$crud->field_type('actual_delivery_dt', 'readonly');
				$crud->field_type('reason_for_loss', 'readonly');
				$crud->field_type('comments', 'readonly');
				$crud->field_type('received_count', 'readonly');
			}
			
		}
		
		$crud->callback_after_update(array($this, 'update_log_after_update')); 
		
		$crud->unset_delete();

		$this->mPageTitle = 'Book Orders';
		$this->render_crud();
	}
	
	function callback_check_request_status($value, $row)
	{
		if($value == 'R')
		{
			
		}	
	}
	
	function update_log_after_update($post_array, $primary_key)
	{
		print_r($post_array);
			if($post_array['request_status'] == 'R')
			{
				$data = array(
				'order_code' => $post_array['order_code'],
				'book_code' => $post_array['book_code'],
				'book_count' => $post_array['received_count'],
				'request_type' => 'printed',
				'requested_entity_type' => 'cdac',
				'requested_entity_code' => '1',
				'processed_dt' => $post_array['actual_delivery_dt']
				);
				
				$this->db->insert('cdac_book_request_logs',$data);
				
			}
	}
	
}
