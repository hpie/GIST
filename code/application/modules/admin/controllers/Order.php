<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}


	// Frontend User CRUD
	public function generate_my_crud($table_name)
	{
		
		$loggedinUser = $this->mUser->entity_code;
		print_r($loggedinUser);
		$crud = $this->generate_crud($table_name);
		
		$crud->display_as('order_code','Order Code');
		$crud->display_as('book_code','Book Code');
		$crud->display_as('requested_count','Requested Count');
		$crud->display_as('received_count','Received Count');
		$crud->display_as('reason_for_loss','Reason for Loss');
		$crud->display_as('comments','Comments');
		$crud->display_as('request_status','Request Status');
		$crud->display_as('expected_delivery_dt','Expected Delivery Date');
		$crud->display_as('actual_delivery_dt','Delivered On');
		$crud->display_as('requested_dt','Requested Date');
		$crud->display_as('expected_dt','Expected Delivery Date');
		$crud->display_as('dispatched_count','Dispatched Count');
		$crud->display_as('dispatched_dt','Dispatched Date');
		$crud->display_as('delivery_mode','Delivery Mode');
		$crud->display_as('delivery_reference','Delivery Reference');
		$crud->display_as('received_dt','Received Date');
		
		//$this->input->post('table_name') = $table_name;
		
		if($table_name == 'cdac_book_orders')
		{
			$crud->columns('order_code', 'book_code', 'requested_count','expected_delivery_dt',
					'request_status', 'received_count',  'actual_delivery_dt', 'reason_for_loss', 'comments');
		}
		else
		{
			$crud->columns('book_code', 'requested_count','requested_dt','expected_dt',
				'request_status', 'dispatched_count',  'dispatched_dt','delivery_mode','delivery_reference',
				'received_dt','received_count', 'reason_for_loss', 'comments');
		}
		
		//######################testing
		
	//	$crud->unset_edit();
	//	$crud->add_action('Edit', '',array($this,'just_a_test'));
	//	$crud->add_action('Edit','','ui-icon-pencil',array($this,'just_a_test'));
	
		
		
		//###############testing
		//Relation with Book
		$crud->set_relation('book_code','cdac_books','{book_code}-{book_name}',array('book_status' => 'A'), 'book_code, book_name ASC');
		
		//Relation with Status : for request_status
		$crud->set_relation('request_status','cdac_status','{status_code}-{status_title}',array('status_group' => 'ORD-STS', 'status' => 'A'), 'status_code, status_title ASC');
		
		//Relation with Status : for reason_for_loss
		$crud->set_relation('reason_for_loss','cdac_status','{status_code}-{status_title}',array('status_group' => 'ORD-RES', 'status' => 'A'), 'status_code, status_title ASC');
		
		$crud->unset_fields('request_status');
		$crud->unset_fields('reason_for_loss');
		
		//Edit criteria
		$state = $crud->getState();
		$state_info = $crud->getStateInfo();
		$pk = $state_info->primary_key;
		
		
		//$crud->field_type('request_status','dropdown',
		//array('O' => 'Ordered', 'R' => 'Received'));
		
		//$crud->callback_add_field('reason_for_loss',array($this,'add_reason_for_loss_callback'));
		//$crud->callback_edit_field('reason_for_loss',array($this,'edit_reason_for_loss_callback'));
		
		
		//$crud->callback_column('request_status',array($this,'callback_check_request_status'));
		
		
		if ($state == 'add' || $state == 'insert_validation' || $state == 'insert')
		{
			//Show only in ADD
			if($table_name == 'cdac_book_orders')
			{	
				$crud->add_fields('order_code','book_code', 'requested_count','expected_delivery_dt',
					'request_status');
			}
			
			elseif($table_name == 'arc_book_requests') 
			{
				$crud->add_fields('book_code', 'requested_count','requested_dt','expected_dt',
						'request_status');
				$crud->field_type('arc_code', 'hidden',$loggedinUser);
				//$crud->set_relation('arc_code','cdac_arcs','{arc_code}-{arc_name}',array('status' => 'A'), 'arc_code, arc_name ASC');
				
			}
			
			elseif($table_name == 'atc_book_requests')
			{
				$crud->add_fields('book_code', 'requested_count','requested_dt','expected_dt',
						'request_status');
				$crud->field_type('atc_code', 'hidden',$loggedinUser);
				
				//$crud->set_relation('atc_code','cdac_atcs','{atc_code}-{atc_name}',array('status' => 'A'), 'atc_code, atc_name ASC');
				
			}
			//Relation with Status : for request_status
			$crud->set_relation('request_status','cdac_status','{status_code}-{status_title}',array('status_group' => 'ORD-STS', 'status_mode' => 'C', 'status' => 'A'), 'status_code, status_title ASC');
			
			
			
			//Mandatory Feilds
			if($table_name == 'cdac_book_orders')
			{	
				$crud->required_fields('order_code','book_code', 'requested_count', 'request_status');
			}
			else 
			{
				$crud->required_fields('book_code', 'requested_count', 'request_status');
			}
			
			$crud->field_type('created_by', 'hidden', "system");
		
		}
		
		elseif ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			//Mandatory Feilds
			
			//Show only for Update
			if($table_name == 'cdac_book_orders')
			{
				
				$crud->edit_fields('order_code','book_code', 'requested_count','expected_delivery_dt',
									'request_status', 'received_count',  'actual_delivery_dt',
									'reason_for_loss', 'comments','table_name');
			}
			
			else if($table_name == 'arc_book_requests')
			{
				$crud->edit_fields('book_code', 'requested_count','expected_dt',
									'dispatched_count','dispatched_dt','delivery_mode','delivery_reference',
						'received_dt', 'received_count', 'reason_for_loss','comments','request_status','table_name');
				//$crud->field_type('atc_code', 'hidden',$loggedinUser);
				$crud->field_type('arc_code','hidden');
			}
			
			else if($table_name == 'atc_book_requests')
			{
				$crud->edit_fields('book_code', 'requested_count','expected_dt',
						'dispatched_count','dispatched_dt','delivery_mode','delivery_reference',
						'received_dt', 'received_count', 'reason_for_loss','comments','request_status','table_name');
				
				$crud->field_type('atc_code','hidden');
			}
			
			//Relation with Status : for request_status
			$crud->set_relation('request_status','cdac_status','{status_code}-{status_title}',
					array('status_group' => 'ORD-STS', 'status_mode' => 'E', 'status' => 'A'),
					'status_code, status_title ASC');
			
			//Relation with Status : for reason_for_loss
			$crud->set_relation('reason_for_loss','cdac_status','{status_code}-{status_title}',
					array('status_group' => 'ORD-RES', 'status_mode' => 'E', 'status' => 'A'), 
					'status_code, status_title ASC');
			
			// get status value
			//validate if status completed
			
			// if status received make received count etc mandatory
			
			$crud->field_type('table_name','invisible',$table_name);
					
			// Make these readonly and also accessible for callback update_log_after_update
			
			$crud->field_type('order_code', 'hidden');
			$crud->field_type('book_code', 'hidden');
			
			//$crud->field_type('order_code_fk', 'invisible');
			//$crud->field_type('book_code_fk', 'invisible');
			
			$crud->field_type('modified_by', 'hidden', "system");
			
			if($table_name == 'cdac_book_orders'){
				$this->load->model('Cdac_book_order_model', 'bookOrder');
				$this->row = $this->bookOrder->get_by('order_code', $pk);
			}
			elseif($table_name == 'arc_book_requests'){
				$this->load->model('Arc_book_request_model', 'bookRequest');
				$this->row = $this->bookRequest->get_by('id', $pk);
			}
			elseif($table_name == 'atc_book_requests'){
				$this->load->model('Atc_book_request_model', 'bookRequest');
				$this->row = $this->bookRequest->get_by('id', $pk);
			}
			
			
			//print_r($this->row);
			
			if($this->row->request_status == 'REC')
			{
				$crud->field_type('order_code', 'readonly');
				$crud->field_type('arc_code', 'readonly');
				$crud->field_type('atc_code', 'readonly');
				$crud->field_type('book_code', 'readonly');
				$crud->field_type('requested_count', 'readonly');
				$crud->field_type('expected_delivery_dt', 'readonly');
				$crud->field_type('expected_dt', 'readonly');
				$crud->field_type('request_status', 'readonly');
				$crud->field_type('actual_delivery_dt', 'readonly');
				$crud->field_type('reason_for_loss', 'readonly');
				$crud->field_type('comments', 'readonly');
				$crud->field_type('dispatched_count', 'readonly');
				$crud->field_type('received_count', 'readonly');
				$crud->field_type('received_dt', 'readonly');
				$crud->field_type('dispatched_dt', 'readonly');
				$crud->field_type('delivery_mode', 'readonly');
				$crud->field_type('delivery_reference', 'readonly');
				
			}
			
		}
		
		$crud->field_type('table_name', 'hidden', $table_name);
		$crud->callback_after_update(array($this, 'update_log_after_update'));
		
		//print_r($table_name);
		
		$crud->unset_delete();
		
		
		$this->mPageTitle = 'Book Orders';
		$this->render_crud();
	}
	
	public function cdac()
	{
		$this->generate_my_crud('cdac_book_orders');
	}
	
	public function arc()
	{
		$this->generate_my_crud('arc_book_requests');
			}
	
	public function atc()
	{
		 $this->generate_my_crud('atc_book_requests');
	}
	
	
	function add_reason_for_loss_callback($value, $row)
	{
		//Relation with Status : for reason_for_loss
			$crud->set_relation('reason_for_loss','cdac_status','{status_code}-{status_title}',array('status_group' => 'ORD-RES', 'status_mode' => 'C', 'status' => 'A'), 'status_code, status_title ASC');
	}
	
	
	function edit_reason_for_loss_callback($value, $row)
	{
		//Relation with Status : for reason_for_loss
			$crud->set_relation('reason_for_loss','cdac_status','{status_code}-{status_title}',array('status_group' => 'ORD-RES', 'status_mode' => 'E', 'status' => 'A'), 'status_code, status_title ASC');	
	}
	
	function callback_check_request_status($value, $row)
	{
		if($value == 'R')
		{
			
		}	
	}
	
	
	function update_log_after_update($post_array, $primary_key)
	{
			if($post_array['request_status'] == 'REC')
			{
				if($post_array['table_name'] == 'cdac_book_orders')
				{
					$data = array(
						'order_code' => $post_array['order_code'],
						'book_code' => $post_array['book_code'],
						'book_received_count' => $post_array['received_count'],
						'book_transaction_type' => 'IN',
						'requested_entity_type' => 'CDAC',
						'requested_entity_code' => 'CDAC',
						'processed_dt' => $post_array['actual_delivery_dt']
					);
					
					$this->db->insert('cdac_book_request_logs',$data);
				}
				elseif($post_array['table_name'] == 'arc_book_requests')
				{
					$data = array(
							'arc_code' => $post_array['arc_code'],
							'book_code' => $post_array['book_code'],
							'book_received_count' =>  $post_array['received_count'],
							'book_dispatched_count' =>  $post_array['dispatched_count'],
							'book_transaction_type' => 'IN',
							'requested_entity_code' => 'ARC',
							'processed_dt' => $post_array['received_dt']
					);
					
					$this->db->insert('arc_book_request_logs',$data);
				}
				elseif($post_array['table_name'] == 'atc_book_requests')
				{
					$data = array(
							'atc_code' => $post_array['atc_code'],
							'book_code' => $post_array['book_code'],
							'book_received_count' => $post_array['received_count'],
							'book_dispatched_count' => $post_array['dispatched_count'],
							'book_transaction_type' => 'IN',
							'requested_entity_code' => 'ATC',
							'processed_dt' => $post_array['received_dt']
					);
					
					$this->db->insert('atc_book_request_logs',$data);
				}
			}
	}
	
	function just_a_test($primary_key , $row)
	{
		if($row->order_code == 1){
			print_r("just_a_test");
			print_r($row);
		}
		return "";
		//return site_url("base_url().'assets/grocery_crud/themes/flexigrid/css/images/edit.png");
	}
	
}
