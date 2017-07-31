<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * For Blog purpose only
 */
class Atc extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		
		// only login users can access Account controller
		$this->verify_login();
		
		$this->load->library('form_builder');
		$this->push_breadcrumb('Atc');
	}

	public function index()
	{
		//redirect('student/item/1');
		redirect('atc/enquiries');
		
	}

	public function item($blog_id)
	{
		$this->mViewData['blog_id'] = $demo_id;
		$this->render('student/item');
	}
	
	public function pagination()
	{
		// library from: application/libraries/MY_Pagination.php
		// config from: application/config/pagination.php
		$this->load->library('pagination');
		$this->mViewData['pagination'] = $this->pagination->render(200, 20);
		$this->render('common/pagination');
	}
	
	public function courses()
	{
		$page = $this->input->get('p');
		$page = empty($page) ? 1 : $page;

		$this->load->model('cdac_course_model', 'course');
		
		//TODO: get results for login user for ATC / ARC / CDAC
		//with clause is used to get mapped models 
		$results = $this->course->paginate($page);
		$courses = $results['data'];
		$counts = $results['counts'];
		
		// call render() from MY_Pagination
		$this->load->library('pagination');
		$pagination = $this->pagination->render($counts['total_num'], $counts['limit']);

		$this->load->model('cdac_module_model', 'modules');
		$this->mViewData['modules'] = $this->modules->order_by('module_name')->get_many_by("status='A'");;
		
		$this->mViewData['courses'] = $courses;
		$this->mViewData['counts'] = $counts;
		$this->mViewData['pagination'] = $pagination;
		$this->render('atc/courselist');
	}

	// Enquiries with the ATC
	public function enquiries()
	{
		$page = $this->input->get('p');
		$page = empty($page) ? 1 : $page;

		$this->load->model('atc_student_enquiry_model', 'enquiry');
		
		//TODO: get results for login user for ATC / ARC / CDAC
		//with clause is used to get mapped models 
		$results = $this->enquiry->with('center')->with('course')->paginate($page);
		$enquiries = $results['data'];
		$counts = $results['counts'];
		
		// call render() from MY_Pagination
		$this->load->library('pagination');
		$pagination = $this->pagination->render($counts['total_num'], $counts['limit']);

		$this->mViewData['enquiries'] = $enquiries;
		$this->mViewData['counts'] = $counts;
		$this->mViewData['pagination'] = $pagination;
		$this->render('atc/enquirylist');
	}
	
	// Enquiry Form for Student
	public function enquiry()
	{
		// library from: application/libraries/Form_builder.php
		$form = $this->form_builder->create_form();

		if ($form->validate())
		{
			// passed validation get from data
			//$data = array(
			//	$enquiry_id = $this->input->post('enquiry_id');
			//	$first_name = $this->input->post('first_name');
			//	$last_name = $this->input->post('last_name');
			//	$center_code = $this->input->post('center_code');
			//	$student_id = $this->input->post('student_id');
			//	$intended_course = $this->input->post('intended_course');
			//	$enquiry_dt = $this->input->post('enquiry_dt');
			//	$enquiry_status = $this->input->post('enquiry_status');
			//	$prospectus_number = $this->input->post('prospectus_number');
			//	$prospectus_payment = $this->input->post('prospectus_payment');	
			//	$email = $this->input->post('email');
			//	$message = $this->input->post('message');
			//);
			$this->load->model('atc_student_enquiry_model', 'enquiry');
			$row_count = $this->enquiry->count_all();
			$enquiry_id = "ENQ-".($row_count+1);
			
			$data = array(
				'enquiry_id' => $enquiry_id,
				'first_name' => $this->input->post('first_name'),
				'last_name' => $this->input->post('last_name'),
				'atc_code' => $this->input->post('atc_code'),
				//'student_id' => $this->input->post('student_id'),
				'intended_course' => $this->input->post('intended_course'),
				'enquiry_dt' => $this->input->post('enquiry_dt'),
				'enquiry_status' => $this->input->post('enquiry_status'),
				'prospectus_number' => $this->input->post('prospectus_number'),
				'prospectus_payment' => $this->input->post('prospectus_payment'),
				'enquiry_email' => $this->input->post('enquiry_email'),
				'enquiry_notes' => $this->input->post('enquiry_notes'),
				'created_by' => $this->mUser->username
			);
			
			$this->load->model('atc_student_enquiry_model', 'enquiry');
			$student_id = $this->enquiry->insert($data);
			
			//$data = array(
				//'Student_Name' => $this->input->post('dname'),
				//'Student_Email' => $this->input->post('demail'),
				//'Student_Mobile' => $this->input->post('dmobile'),
				//'Student_Address' => $this->input->post('daddress')
			//);
			//	Transfering data to Model
			//$this->insert_model->form_insert($data);
			if($student_id)
			{	
				$this->system_message->set_success('Enquiry Record Saved Successfully!');
				//$this->system_message->set_success('Enquiry Record Saved Successfully! </br> The Enquiry ID is <b>'.$student_id.'</b>');
			}
			else 
			{
				$this->system_message->set_error('Error Saving Enquiry Record');	
			}
			
			refresh();
		}

		//$this->load->model('group_model', 'groups');
		//$this->mViewData['groups'] = $this->groups->get_all();
		
		$this->load->model('cdac_atc_model', 'atcs');
		$this->load->model('cdac_course_model', 'courses');

		$this->mViewData['atcs'] = $this->atcs->order_by('atc_name')->get_many_by("status='A'");
		$this->mViewData['courses'] = $this->courses->order_by('course_name')->get_many_by("course_status='A'");
		
		// require reCAPTCHA script at page head
		$this->mScripts['head'][] = 'https://www.google.com/recaptcha/api.js';
		
		$this->mTitle = 'Enquiry Form';
		$this->mViewData['form'] = $form;
		$this->render('atc/enquiryform');
	}

	// Registratoins with the ATC
	public function registrations()
	{
		$page = $this->input->get('p');
		$page = empty($page) ? 1 : $page;

		$this->load->model('atc_student_registration_model', 'registration');
		
		//TODO: get results for login user for ATC / ARC / CDAC
		//with clause is used to get mapped models 
		$results = $this->registration->with('center')->with('course')->paginate($page);
		$registrations = $results['data'];
		$counts = $results['counts'];
		
		// call render() from MY_Pagination
		$this->load->library('pagination');
		$pagination = $this->pagination->render($counts['total_num'], $counts['limit']);

		$this->mViewData['registrations'] = $registrations;
		$this->mViewData['counts'] = $counts;
		$this->mViewData['pagination'] = $pagination;
		$this->render('atc/registrationlist');
	}
	
	// Registratoin form for Students
	public function register()
	{
		// library from: application/libraries/Form_builder.php
		$formattributes = array('role'=>'form', 'class'=>'registration-form');
		
		$form = $this->form_builder->create_form(NULL, FALSE, $formattributes);

		if ($form->validate())
		{
			$this->load->model('atc_student_registration_model', 'registration');
			$row_count = $this->registration->count_all();
			$registration_id = "PACE-".($row_count+1);
			
			$data = array(
				'student_id' => $registration_id,
				'first_name' => $this->input->post('first_name'),
				'middle_name' => $this->input->post('middle_name'),
				'last_name' => $this->input->post('last_name'),
			'father_first_name' => $this->input->post('father_first_name'),
				'father_middle_name' => $this->input->post('father_middle_name'),
				'father_last_name' => $this->input->post('father_last_name'),
			'mother_first_name' => $this->input->post('mother_first_name'),
				'mother_middle_name' => $this->input->post('mother_middle_name'),
				'mother_last_name' => $this->input->post('mother_last_name'),
			'atc_code' => $this->input->post('atc_code'),
				'admission_dt' => $this->input->post('admission_dt'),
			'gender' => $this->input->post('gender'),
				'contact_phone' => $this->input->post('contact_phone'),
				'registered_email' => $this->input->post('registered_email'),
				'date_of_birth' => $this->input->post('date_of_birth'),
				'student_status' => $this->input->post('student_status'),
			'current_address_line1' => $this->input->post('current_address_line1'),
				'current_address_line2' => $this->input->post('current_address_line2'),
				'current_address_city' => $this->input->post('current_address_city'),
				'current_address_dist' => $this->input->post('current_address_dist'),
				'current_address_state' => $this->input->post('current_address_state'),
				'current_address_pincode' => $this->input->post('current_address_pincode'),
			'permanent_address_line1' => $this->input->post('permanent_address_line1'),
				'permanent_address_line2' => $this->input->post('permanent_address_line2'),
				'permanent_address_city' => $this->input->post('permanent_address_city'),
				'permanent_address_dist' => $this->input->post('permanent_address_dist'),
				'permanent_address_state' => $this->input->post('permanent_address_state'),
				'permanent_address_pincode' => $this->input->post('permanent_address_pincode'),
				'created_by' => $this->mUser->username
			);
			
			$this->load->model('atc_student_registration_model', 'registration');
			$student_id = $this->registration->insert($data);
			
			//if($student_id)
			//{	
				//$this->system_message->set_success('Student Record Saved Successfully! </br> The Regisration ID is <b>'.$student_id.'</b>');
				$this->system_message->set_success('Student Record Saved Successfully!');
			//}
			//else 
			//{
				//print_r($data);
				//$this->system_message->set_error('Error Saving Student Record');	
			//}
			
			refresh();
		}

		$this->load->model('cdac_atc_model', 'atcs');
		$this->load->model('cdac_course_model', 'courses');

		$this->mViewData['atcs'] = $this->atcs->order_by('atc_name')->get_many_by("status='A'");
		$this->mViewData['courses'] = $this->courses->order_by('course_name')->get_many_by("course_status='A'");
		
		// require reCAPTCHA script at page head
		$this->mScripts['head'][] = 'https://www.google.com/recaptcha/api.js';
		
		$this->mTitle = 'Registration Form';
		$this->mViewData['form'] = $form;
		$this->render('atc/registrationform');
	}
	
	
	// Qualification Form for Student
	public function qualification()
	{
		// library from: application/libraries/Form_builder.php
		$form = $this->form_builder->create_form();

		if ($form->validate())
		{
			//$this->load->model('atc_student_qualification_model', 'qualification');
			//$row_count = $this->qualification->count_all();
			//$enquiry_id = "ENQ-".($row_count+1);
			
			$data = array(
				'student_id' => $this->input->post('student_id'),
				'highest_qualification' => $this->input->post('highest_qualification'),
				'10_max_marks' => $this->input->post('maximum_marks'),
				'10_obtained_marks' => $this->input->post('obtained_marks'),
				'10_passing_year' => $this->input->post('passing_year'),
				'10_institute_name' => $this->input->post('institute_name'),
				'10_board_name' => $this->input->post('board_name'),
				'created_by' => $this->mUser->username
			);
			
			$data = array(
				'student_id' => $this->input->post('student_id'),
				'highest_qualification' => $this->input->post('highest_qualification'),
				'12_max_marks' => $this->input->post('maximum_marks'),
				'12_obtained_marks' => $this->input->post('obtained_marks'),
				'12_passing_year' => $this->input->post('passing_year'),
				'12_institute_name' => $this->input->post('institute_name'),
				'12_board_name' => $this->input->post('board_name'),
				'created_by' => $this->mUser->username
			);
			
			$data = array(
				'student_id' => $this->input->post('student_id'),
				'highest_qualification' => $this->input->post('highest_qualification'),
				'diploma_max_marks' => $this->input->post('maximum_marks'),
				'diploma_obtained_marks' => $this->input->post('obtained_marks'),
				'diploma_passing_year' => $this->input->post('passing_year'),
				'diploma_institute_name' => $this->input->post('institute_name'),
				'diploma_board_name' => $this->input->post('board_name'),
				'created_by' => $this->mUser->username
			);
			
			
			$data = array(
				'student_id' => $this->input->post('student_id'),
				'highest_qualification' => $this->input->post('highest_qualification'),
				'graduate_max_marks' => $this->input->post('maximum_marks'),
				'graduate_obtained_marks' => $this->input->post('obtained_marks'),
				'graduate_passing_year' => $this->input->post('passing_year'),
				'graduate_institute_name' => $this->input->post('institute_name'),
				'graduate_board_name' => $this->input->post('board_name'),
				'created_by' => $this->mUser->username
			);
			
			
			$data = array(
				'student_id' => $this->input->post('student_id'),
				'highest_qualification' => $this->input->post('highest_qualification'),
				'post_graduate_max_marks' => $this->input->post('maximum_marks'),
				'post_graduate_obtained_marks' => $this->input->post('obtained_marks'),
				'post_graduate_passing_year' => $this->input->post('passing_year'),
				'post_graduate_institute_name' => $this->input->post('institute_name'),
				'post_graduate_board_name' => $this->input->post('board_name'),
				'created_by' => $this->mUser->username
			);
			
			$this->load->model('atc_student_qualification_model', 'qualification');
			$qualification_id = $this->qualification->insert($data);
			
			//$data = array(
				//'Student_Name' => $this->input->post('dname'),
				//'Student_Email' => $this->input->post('demail'),
				//'Student_Mobile' => $this->input->post('dmobile'),
				//'Student_Address' => $this->input->post('daddress')
			//);
			//	Transfering data to Model
			//$this->insert_model->form_insert($data);
			if($student_id)
			{	
				$this->system_message->set_success('Education Record Saved Successfully!');
				//$this->system_message->set_success('Enquiry Record Saved Successfully! </br> The Enquiry ID is <b>'.$student_id.'</b>');
			}
			else 
			{
				$this->system_message->set_error('Error Saving Education Record');	
			}
			
			refresh();
		}

		//$this->load->model('group_model', 'groups');
		//$this->mViewData['groups'] = $this->groups->get_all();
		
		$this->load->model('atc_student_registration_model', 'registrations');
		$this->load->model('cdac_category_model', 'qualifications');

		$this->mViewData['registrations'] = $this->registrations->order_by('student_id')->get_many_by("student_status='A'"); // by atc_code
		$this->mViewData['qualifications'] = $this->qualifications->order_by('category_code')->get_many_by("category_type='EDU'and category_status='A'");
		
		// require reCAPTCHA script at page head
		$this->mScripts['head'][] = 'https://www.google.com/recaptcha/api.js';
		
		$this->mTitle = 'Education Qualificatoin Form';
		$this->mViewData['form'] = $form;
		$this->render('atc/qualificatoinform');
	}
	
}
