<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Selection extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	// Frontend User CRUD
	public function index()
	{
		$crud = $this->generate_crud('cdac_selections');
		//$crud->columns('center_code', 'center_name', 'center_address_line1', 'center_address_line2', 'center_address_city', 'center_address_postcode', 'center_contact_number', 'center_type', 'center_code', 'active');
			
		$crud->display_as('sel_name','Name');
		$crud->display_as('sel_state','State');
		$crud->display_as('sel_city','City');
		$crud->display_as('status','Status');
		
		$crud->set_relation('sel_state', 'cdac_states', 'state_name');
		$crud->set_relation('sel_city', 'cdac_cities', 'city_name');
		$this->load->library('gc_dependent_select');


		$crud->columns('sel_name', 'sel_state', 'sel_city','status');
		
		//$crud->set_relation('arc_address_state', 'cdac_states', 'state_name');
		//$crud->set_relation('arc_address_city', 'cdac_cities', 'city_name');
		
		
		//Relation with Status
		$crud->set_relation('status','cdac_status','{status_title}-{status_code}',array('status_group' => 'GEN', 'status_mode' => 'A', 'status' => 'A'), 'status_code, status_title ASC');
		
		
		$fields = array(
				// first field:
				'sel_state' => array( // first dropdown name
				'table_name' => 'cdac_states', // table of country
				'title' => 'state_name', // country title
				'relate' => null, // the first dropdown hasn't a relation
				'data-placeholder' => 'State Select' //dropdown's data-placeholder:
			),

				// second field
				'sel_city' => array( // second dropdown name
				'table_name' => 'cdac_cities', // table of state
				'title' => 'city_name', // state title
				'id_field' => 'city_id', // table of state: primary key
				'relate' => 'state_code', // fk of table of state:
				'data-placeholder' => 'Select City' //dropdown's data-placeholder:
			
			)
			);
			
			$cruClass = 'admin/selection';
			$curFunction = 'index'; 
			
			$config = array(
			'main_table' => 'cdac_selections',
			'main_table_primary' => 'row_id',
			"url" => base_url() . $cruClass . '/' . $curFunction . '/'
			);
			
			$categories = new gc_dependent_select($crud, $fields, $config);


		//Show only in ADD
		//$crud->add_fields('sel_name', 'sel_state', 'sel_city', 'status');
		
		//Show only for Update
		//$crud->edit_fields('sel_name', 'sel_state', 'sel_city', 'status');
		
		//$state = $crud->getState();
    	//$state_info = $crud->getStateInfo();
		
		// disable direct create / delete Frontend User
		//$crud->unset_add();
		//$crud->unset_delete();

		// first method:
		//$output = $categories->render();
		
		//$this->$categories->render();

		// the second method:
		$js = $categories->get_js();
		//$output = $crud->render();
		//$output->output.= $js;
		//print_r($js);
		$this->mPageTitle = 'Test';
		$this->render_dependent_crud($js);
		//$this->render_crud($js);
		
		
	}
	
}
