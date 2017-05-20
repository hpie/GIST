<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Student class.
 * 
 * @extends CI_Controller
 */
class Student extends CI_Controller {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function __construct() {
		
		parent::__construct();
		//$this->load->library(array('session'));
		
		$this->load->database();
		$this->load->helper(array('url'));
		
		$this->load->library('grocery_CRUD');
		
	}
	
	public function _example_output($output = null)
	{
		$this->load->view('example.php',(array)$output);
	}
	
	public function index() {
		
		//$this->load->view('welcome_message');
		$this->_example_output((object)array('output' => '' , 'js_files' => array() , 'css_files' => array()));
/*
		echo "<style type='text/css'>
				body
				{
				    font-family: Arial;
				    font-size: 14px;
				}
				a {
				    color: blue;
				    text-decoration: none;
				    font-size: 14px;
				}
				a:hover
				{
				    text-decoration: underline;
				}
		</style>";
        echo "<h1>Welcome to HPIE</h1>";//Just an example to ensure that we get into the function
		
		echo "
		    <div>
		        <a href=''>Home</a> |
		        <a href='student/enquiry'>T1</a> |
		        <a href='student/registe'>T2</a> |

		        <a href='enquiry'>Student Enquiery</a> |
		        <a href='register'>Reguster Student</a> |

		    </div>";
		die();
*/
		
	}
	
	/**
	 * enquiry function.
	 * 
	 * @access public
	 * @return void
	 */
	public function enquiry()
	{
		try{
			$crud = new grocery_CRUD();

			//$crud->set_theme('datatables');
			$crud->set_table('atc_student_enquiry');
			$crud->set_subject('Student Enquiery');
			
			//$crud->set_primary_key('ID','atc_student_enquiry');
			 
			// Custom Display Names
			$crud->display_as('enquiry_id','Enquiry No');
			$crud->display_as('first_name','First Name');
			$crud->display_as('last_name','Last Name');
			$crud->display_as('enquiry_dt','Enquiry Date');

		    // Mandatory Feilds
			//$crud->required_fields('enquiry_id');  // to be auto populated 
			//$crud->required_fields('first_name');
			//$crud->required_fields('last_name');
			//$crud->required_fields('center_code'); // ick list master table
			//$crud->required_fields('student_id');
			//$crud->required_fields('intended_course'); // decide vlaues for drop down master tables
			//$crud->required_fields('enquiry_dt');
			//$crud->required_fields('enquiry_status'); // decide vlaues for drop down ,aster tables
			//$crud->required_fields('prospectus_number');
			//$crud->required_fields('prospectus_payment');
			
			// Fields to be Displayed in Add Form
			$crud->add_fields('enquiry_id','first_name','last_name','center_code','intended_course', 'enquiry_status',
						'enquiry_dt', 'prospectus_number', 'prospectus_payment', 'created_by');
			
			// Fields to be Displayed in Edit Form
			$crud->edit_fields('enquiry_id','first_name','last_name','intended_course', 'enquiry_status',
							'prospectus_number', 'prospectus_payment', 'modified_by');
		
		// Hooks not working for hidden objects :( 
		// before insert 
		/*$crud->callback_before_insert(function ($post_array)  {
			if (empty($post_array['created_by'])) {
				$post_array['created_by'] = 'system';
				//$crud->required_fields('created_dt');
			}
			return $post_array;
    	});
		
		//before update
		$crud->callback_before_update(function ($post_array)  {
			if (empty($post_array['modified_by'])) {
				$post_array['modified_by'] = 'system';
				//$crud->required_fields('modified_dt')
			}
			return $post_array;
    	});*/
	
		//cunstom function can be called	
		//$crud->callback_before_update(array($this,'_callback_make_readonly($crud)'));
	   	
	    
			// Limit View Columns
			$crud->columns('enquiry_id','center_code','first_name','last_name','intended_course','enquiry_dt', 'prospectus_number');
			//$crud->columns('enquiry_id','first_name','last_name','intended_course','enquiry_dt');   //center code not required in case of ATC role
			
			
			$crud->field_type('enquiry_status','dropdown', array('E' => 'Enquired', 'P' => 'Prospectus Purchased', 'C' => 'Cancelled' ));
		
		
		//state base actions
		$state = $crud->getState();
    	$state_info = $crud->getStateInfo();
 
		if ($state == 'add' || $state == 'insert_validation' || $state == 'insert')
		{
			$crud->required_fields('enquiry_id','first_name','last_name','center_code','intended_course',
						'enquiry_dt', 'enquiry_status');
			//$crud->getModel()->set_add_value('created_by', "system");	
			$crud->field_type('created_by', 'hidden', "system");
			//TODO
			// Make prospectus_number and mandatory if  enquiry_status == "P"
		}
		elseif ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			//$primary_key = $state_info->primary_key;
			$crud->required_fields('first_name','last_name','intended_course', 'enquiry_dt', 'enquiry_status');
			$crud->field_type('enquiry_id', 'readonly');
			$crud->field_type('center_code', 'readonly');
			$crud->field_type('modified_by', 'hidden', "system");
			// Modified the framework and added these two functions
			//$crud->getModel()->set_add_value('modified_dt', date("Y-m-d"));
			//$crud->getModel()->set_add_value('modified_by', "system");	
			//$this->grocery_crud->callback_add_field('modified_dt', function(){
            //    return date('y-m-d');
			//});
			/*	
			$crud->callback_add_field('modified_by', function(){
                return "system";
			});
			$crud->callback_add_field('modified_dt', function(){
                return date('y-m-d');
			});	
			*/
			
			/*
			if($crud->get(enquiry_status) != "P")
			{
				$crud->field_type('prospectus_number', 'readonly');
				$crud->field_type('prospectus_payment', 'readonly');
				$crud->field_type('enquiry_status', 'readonly');
			}
			*/
		}
		else
		{
			//$this->_example_output($output);
		}
	
		
		//Role based actions
		//add not allowed
		//$crud->unset_add();
		//edit not allowed
		//$crud->unset_edit();
		//delete not allowed
		//$crud->unset_delete();
		//delete not allowed
		//$crud->unset_export();
		//delete not allowed
		//$crud->unset_list();
		//delete not allowed
		//$crud->unset_print();
		//delete not allowed
		//$crud->unset_read();
		//delete not allowed
		//$crud->unset_operations();
			
			$output = $crud->render();

			$this->_crud_enquiry_output($output);
			//$this->_example_output($output);

		}catch(Exception $e){
			show_error($e->getMessage().' --- '.$e->getTraceAsString());
		}
	}
	
	// Render View
    function _callback_make_readonly($crud = null)
	{
	        //$crud->field_type('first_name', 'readonly');
			//$crud->field_type('last_name', 'readonly');
//			$crud->load->view('student/enquiry.php',(array)$output);
			//$crud->required_fields('modified_by');
			//$crud->required_fields('modified_dt');
    }
	
	// Render View
    function _crud_enquiry_output($output = null)
	{
	        $this->load->view('student/enquiry.php',(array)$output);
    }
	
}
