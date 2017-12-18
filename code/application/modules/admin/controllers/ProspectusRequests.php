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
	
	public function cdacOrders()
	{
		$crud = $this->generate_crud('cdac_prospectus_orders');
		
		$crud->display_as('requesting_count','Requested count');
		$crud->display_as('range_from','Range from');
		$crud->display_as('range_to','Range To');
		$crud->display_as('requesting_dt','Requested Date');
		$crud->display_as('expected_dt','Expected Delivery Date');
		$crud->display_as('request_status','Request Status');
		$crud->display_as('dispatched_count','Dispatched Count');
		$crud->display_as('dispatched_dt','Dispatched Date');
		$crud->display_as('delivery_mode','Delivery Mode');
		$crud->display_as('delivery_reference','Delivery Reference');
		$crud->display_as('received_dt','Received Date');
		$crud->display_as('received_count','Received Count');
		$crud->display_as('reason_for_loss','Reason for Loss');
		$crud->display_as('comments','Comments');
		
		
		$crud->columns('requesting_count','range_from', 'range_to','requested_entity_type', 
				'requesting_dt', 'expected_dt', 'request_status', 'dispatched_count', 'dispatched_dt',
				'delivery_mode', 'delivery_reference', 'received_dt', 'received_count', 'reason_for_loss','comments');
		
		$crud->unset_delete();
		$this->mPageTitle = 'Prospectus Orders';
		$this->render_crud();
	}
}
