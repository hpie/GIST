<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Faculty extends Admin_Controller {

	public function index()
	{
		$crud = $this->generate_crud('atc_faculties');
		
		$crud->display_as('faculty_code','Faculty Code');
		$crud->display_as('first_name','First Name');
		$crud->display_as('last_name','Last Name');
		$crud->display_as('faculty_joining_dt','Joining Date');
		$crud->display_as('faculty_leaving_dt','Leaving Date');
		$crud->display_as('center_code','ATC Code');
		$crud->display_as('cdac_modules','Modules');
		$crud->display_as('faculty_gender','Gender');
		$crud->display_as('faculty_mobile','Contact Number');
		$crud->display_as('faculty_email','Email ID');
		$crud->display_as('faculty_dob','Date Of Birth');
		$crud->display_as('faculty_status','Status');
		$crud->display_as('current_address_line1','Current Address Line 1');
		$crud->display_as('current_address_line2','Current Address Line 1');
		$crud->display_as('current_address_city','Current City');
		$crud->display_as('current_address_pincode','Current Address PostCode');
		$crud->display_as('permanent_address_line1','Permanent Address Line 1');
		$crud->display_as('permanent_address_line2','Permanent Address Line 2');
		$crud->display_as('permanent_address_city','Permanent Address City');
		$crud->display_as('permanent_address_pincode','Permanent Address PostCode');
		$crud->display_as('status','Status');
		
		//$crud->columns('center_code', 'center_name', 'center_address_line1', 'center_address_line2', 'center_address_city', 'center_address_postcode', 'center_contact_number', 'center_type', 'center_code', 'active');
		$crud->columns('faculty_code', 'first_name', 'last_name', 'atc_code', 'faculty_joining_dt', 'faculty_leaving_dt',
		'cdac_modules', 'faculty_gender', 'faculty_mobile', 'faculty_email', 'faculty_dob', 'faculty_status',
		'current_address_line1', 'current_address_line2', 'current_address_city', 'current_address_pincode', 
		'permanent_address_line1', 'permanent_address_line2', 'permanent_address_city', 'permanent_address_pincode', 'status');
		
		
		// only webmaster and admin can change member groups
		//if ($crud->getState()=='list' || $this->ion_auth->in_group(array('webmaster', 'admin')))
		//{
			$crud->set_relation_n_n('cdac_modules', 'atc_faculty_modules', 'cdac_modules', 'faculty_code', 'module_code', 'module_name');
		//}
		
		// Relation with ATC
		$crud->set_relation('atc_code',' cdac_atcs','{atc_code}-{atc_name}',array('status' => 'A'), 'atc_code, atc_name ASC');
		
		$crud->field_type('faculty_gender','dropdown',
		array('M' => 'Male', 'F' => 'Female', 'O' => 'Other'));
		
		$crud->field_type('faculty_status','dropdown',
		array('G' => 'Guest', 'P' => 'Permanent', 'T' => 'Trainee'));
		
		$crud->set_relation('current_address_city','cdac_cities','{state_code}-{city_name}',array('status' => 'A'), 'state_code, city_name ASC');
		
		$crud->set_relation('permanent_address_city','cdac_cities','{state_code}-{city_name}',array('status' => 'A'), 'state_code, city_name ASC');
		
		//Relation with Status
		$crud->set_relation('status','cdac_status','{status_title}-{status_code}',array('status' => 'A'), 'status_code, status_title ASC');
		
		
		//Show only in ADD
		$crud->add_fields('faculty_code', 'first_name', 'last_name', 'atc_code', 'faculty_joining_dt', 
		'cdac_modules', 'faculty_gender', 'faculty_mobile', 'faculty_email', 'faculty_dob', 'faculty_status',
		'current_address_line1', 'current_address_line2', 'current_address_city', 'current_address_pincode', 
		'permanent_address_line1', 'permanent_address_line2', 'permanent_address_city', 'permanent_address_pincode', 'status');
		
		//Show only for Update
		$crud->edit_fields('faculty_code', 'first_name', 'last_name', 'atc_code', 'faculty_joining_dt', 'faculty_leaving_dt',
		'cdac_modules', 'faculty_gender', 'faculty_mobile', 'faculty_email', 'faculty_dob', 'faculty_status',
		'current_address_line1', 'current_address_line2', 'current_address_city', 'current_address_pincode', 
		'permanent_address_line1', 'permanent_address_line2', 'permanent_address_city', 'permanent_address_pincode', 'status');
		
		$state = $crud->getState();
    	$state_info = $crud->getStateInfo();
		
		if ($state == 'add' || $state == 'insert_validation' || $state == 'insert')
		{
			//Mandatory Feilds
		$crud->required_fields('faculty_code', 'first_name', 'last_name', 'atc_code', 'faculty_joining_dt', 
		'faculty_gender', 'faculty_mobile', 'faculty_email', 'faculty_dob', 'faculty_status',
		'current_address_line1', 'current_address_line2', 'current_address_city', 'current_address_pincode', 
		'permanent_address_line1', 'permanent_address_line2', 'permanent_address_city', 'permanent_address_pincode', 'status');
			//$crud->getModel()->set_add_value('created_by', "system");	
			$crud->field_type('created_by', 'hidden', "system");
			//TODO
			// Make prospectus_number and mandatory if  enquiry_status == "P"
		}
		elseif ($state == 'edit' || $state == 'update_validation' || $state == 'update')
		{
			//Mandatory Feilds
			$crud->required_fields('first_name', 'last_name', 'atc_code', 
		'faculty_gender', 'faculty_mobile', 'faculty_email', 'faculty_dob', 'faculty_status',
		'current_address_line1', 'current_address_line2', 'current_address_city', 'current_address_pincode', 
		'permanent_address_line1', 'permanent_address_line2', 'permanent_address_city', 'permanent_address_pincode', 'status');
			$crud->field_type('faculty_code', 'readonly');
			$crud->field_type('faculty_joining_dt', 'readonly');
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
		
		//$this->unset_crud_fields('ip_address', 'last_login');

		// only webmaster and admin can change member groups
		//if ($crud->getState()=='list' || $this->ion_auth->in_group(array('webmaster', 'admin', 'manager')))
		//{
		//	$crud->set_relation_n_n('groups', 'users_groups', 'groups', 'user_id', 'group_id', 'name');
	//	}

		// only webmaster and admin can reset user password
		//if ($this->ion_auth->in_group(array('webmaster', 'admin')))
		//{
		//	$crud->add_action('Reset Password', '', 'admin/user/reset_password', 'fa fa-repeat');
		//}

		// disable direct create / delete Frontend User
		//$crud->unset_add();
		$crud->unset_delete();

		$this->mPageTitle = 'ATC Faculties';
		$this->render_crud();
		
		
	}

	// Grocery CRUD - Blog Posts
	public function post()
	{
		$crud = $this->generate_crud('blog_posts');
		$crud->columns('author_id', 'category_id', 'title', 'image_url', 'tags', 'publish_time', 'status');
		$crud->set_field_upload('image_url', UPLOAD_BLOG_POST);
		$crud->set_relation('category_id', 'blog_categories', 'title');
		$crud->set_relation_n_n('tags', 'blog_posts_tags', 'blog_tags', 'post_id', 'tag_id', 'title');
		
		$state = $crud->getState();
		if ($state==='add')
		{
			$crud->field_type('author_id', 'hidden', $this->mUser->id);
			$this->unset_crud_fields('status');
		}
		else
		{
			$crud->set_relation('author_id', 'admin_users', '{first_name} {last_name}');
		}

		$this->mPageTitle = 'Blog Posts';
		$this->render_crud();
	}

	// Grocery CRUD - Blog Categories
	public function category()
	{
		$crud = $this->generate_crud('blog_categories');
		$crud->columns('title');
		$this->mPageTitle = 'Blog Categories';
		$this->mViewData['crud_note'] = modules::run('adminlte/widget/btn', 'Sort Order', 'blog/category_sortable');
		$this->render_crud();
	}
	
	// Sortable - Blog Categories
	public function category_sortable()
	{
		$this->load->library('sortable');
		$this->sortable->init('blog_category_model');
		$this->mViewData['content'] = $this->sortable->render('{title}', 'blog/category');
		$this->mPageTitle = 'Blog Categories';
		$this->render('general');
	}

	// Grocery CRUD - Blog Tags
	public function tag()
	{
		$crud = $this->generate_crud('blog_tags');
		$this->mPageTitle = 'Blog Tags';
		$this->render_crud();
	}
}
