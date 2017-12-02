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
	
    /*
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
     */

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
			
			$enqphone = $this->input->post('enquiry_phone');
			
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
				try
				{
					$smsATC="";
					$smsENQ="";
		            if($this->input->post('prospectus_number')!="")
		            {
		            	$smsATC=$this->input->post('first_name'). " $enqphone have enguired for ".$this->input->post('intended_course')." with prospectus ". $this->input->post('prospectus_number');	
		            }else 
		            {
						$smsATC=$this->input->post('first_name'). " $enqphone have enguired for ".$this->input->post('intended_course');
		            }
		            $smsENQ =$this->input->post('first_name'). " Thank you for enquiring with us. W \e would like to hear back from you soon"; 
		            $smsEnqURL="http://www.commnestsms.com/api/push.json?apikey=581c18a7bdf6d&route=transpromo&sender=HPIEHP&mobileno=$enqphone&text=$smsENQ";
		            $smsAtcURL="http://www.commnestsms.com/api/push.json?apikey=581c18a7bdf6d&route=transpromo&sender=HPIEHP&mobileno=9900514014&text=$smsATC";
		            $responseATC = file_get_contents($smsEnqURL);
		            $responseENQ = file_get_contents($smsAtcURL);
		            $responseSMS = $responseATC."\n \n" .$responseENQ;
		            //$email_message .= "SMS status: ".$responseSMS."\n";
		        }catch(Exception $e) {
		            //echo 'Message: ' .$e->getMessage();
		            //$email_message .= "SMS status: ".$responseSMS."\n";
		            $response = $response.$responseSMS.$e->getMessage(). "\r\n";
		        }
        		// send email
		        //$this->input->post('enquiry_email')
		         
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

    // Registratoin form for Students
    public function register() {
        // library from: application/libraries/Form_builder.php
        $formattributes = array('role' => 'form', 'class' => 'registration-form');

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
			
			/*	
			try
				{
					$smsATC="";
					$smsENQ="";
		            if($this->input->post('prospectus_number')!="")
		            {
		            	$smsATC=$this->input->post('first_name'). " $enqphone have enguired for ".$this->input->post('intended_course')." with prospectus ". $this->input->post('prospectus_number');	
		            }else 
		            {
						$smsATC=$this->input->post('first_name'). " $enqphone have enguired for ".$this->input->post('intended_course');
		            }
		            $smsENQ =$this->input->post('first_name'). " Thank you for enquiring with us. W \e would like to hear back from you soon"; 
		            $smsEnqURL="http://www.commnestsms.com/api/push.json?apikey=581c18a7bdf6d&route=transpromo&sender=HPIEHP&mobileno=$enqphone&text=$smsENQ";
		            $smsAtcURL="http://www.commnestsms.com/api/push.json?apikey=581c18a7bdf6d&route=transpromo&sender=HPIEHP&mobileno=9900514014&text=$smsATC";
		            $responseATC = file_get_contents($smsEnqURL);
		            $responseENQ = file_get_contents($smsAtcURL);
		            $responseSMS = $responseATC."\n \n" .$responseENQ;
		            //$email_message .= "SMS status: ".$responseSMS."\n";
		        }catch(Exception $e) {
		            //echo 'Message: ' .$e->getMessage();
		            //$email_message .= "SMS status: ".$responseSMS."\n";
		            $response = $response.$responseSMS.$e->getMessage(). "\r\n";
		        }
        		// send email
		        //$this->input->post('enquiry_email')
        	*/
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
			$data = array();
			
			if($this->input->post('highest_qualification')=="10")
			{
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
			}else if($this->input->post('highest_qualification')=="12")
			{
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
			}else if($this->input->post('highest_qualification')=="DIP")
			{
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
			}else if($this->input->post('highest_qualification')=="GRAD")
			{
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
			}else if($this->input->post('highest_qualification')=="POSTGRAD")
			{
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
			}
            $res_data = $this->add_document('qualification_doc', 'qualification_doc', array('jpeg', 'jpg', 'png'), $this->input->post('student_id'));
            if (isset($res_data['upload_data']) && $res_data['upload_data'] != '') 
	    {
                $this->load->model('atc_student_qualification_model', 'qualification');
                $qualification_id = $this->qualification->insert($data);
                $image_data = array('student_id' => $this->input->post('student_id'),
                    'document_name' => $res_data['upload_data']['file_name'],
                    'created_by' => $this->mUser->username,
                    'center_code' => $this->mUser->entity_code,
                    'document_type' => "Qualification Document");
                $this->load->model('atc_student_documents_model', 'atc_student_documents');
                $this->atc_student_documents->insert($image_data);
                if ($qualification_id) {
                    $this->system_message->set_success('Education Record Saved Successfully!');
                    //$this->system_message->set_success('Enquiry Record Saved Successfully! </br> The Enquiry ID is <b>'.$student_id.'</b>');
                } else {
                    $this->system_message->set_error('Error Saving Education Record');
                }
            } else {
                $this->system_message->set_error($res_data['error']);
            }

            refresh();
        }

		//$this->load->model('group_model', 'groups');
		//$this->mViewData['groups'] = $this->groups->get_all();
		
		$this->load->model('atc_student_registration_model', 'registrations');
		$this->load->model('cdac_category_model', 'qualifications');

		$this->mViewData['registrations'] = $this->registrations->order_by('student_id')->get_many_by("student_status !='D'"); // by atc_code
		$this->mViewData['qualifications'] = $this->qualifications->order_by('category_code')->get_many_by("category_type='EDU'and category_status='A'");
		
		// require reCAPTCHA script at page head
		$this->mScripts['head'][] = 'https://www.google.com/recaptcha/api.js';
		
		$this->mTitle = 'Education Qualificatoin Form';
		$this->mViewData['form'] = $form;
		$this->render('atc/qualificatoinform');
	}
	
// Qualification Form for Student
    public function enroll() 
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
				'course_code' => $this->input->post('course_code'),
				'start_dt' => $this->input->post('start_dt'),
				'end_dt' => $this->input->post('end_dt'),
				'enrollment_type' => $this->input->post('enrollment_type'),
				'status' => $this->input->post('status'),
				'created_by' => $this->mUser->username
			);
			
			$this->load->model('atc_student_course_model', 'enroll');
			$enrollment_id = $this->enroll->insert($data);
			
			// INSERT RECORD INTO atc_student_book_issue_logs
			//Fetching mobule and book information from enrolledcourse and pusing to book issue logs
			
			$this->load->model('cdac_course_module_model', 'modules');
			$coursemodules = $this->modules->get_many_by("course_code='".$this->input->post('course_code')."'"); 
			
			foreach ($coursemodules as $module)
			{
				$this->load->model('cdac_module_book_model', 'books');
				$modulebooks = $this->books->get_by("module_code='".$module->module_code."'");
				
				$data = array(
					'student_id' => $this->input->post('student_id'),
					'course_code' => $this->input->post('course_code'),
					'entity_code' => $this->mUser->entity_code,	
					'module_code' => $module->module_code,
					'book_code' => $modulebooks->book_code,
					'issue_status' => 'P',
					'created_by' => $this->mUser->username
				);
				
				$this->load->model('atc_student_book_issue_log_model', 'bookissue');
				
				$this->bookissue->insert($data);
				
			}
			
			try{
	            //$smsURL="http://sms.himit.in/api/push.json?apikey=58ce67b2a431e&route=transactional&sender=HIMITS&mobileno9900062922 &text=this is test SMS";
	            //$smsURL="http://sms.himit.in/api/push.json?apikey=59075efb3d25b&route=transactional&sender=VIDSML&mobileno=9900062922&text= $sname with contact detais $pmobile , $cmobile $email registered Please check.";
	            
	            //$smsURLMD="http://sms.himit.in/api/push.json?apikey=59075efb3d25b&route=transactional&sender=DORICM&mobileno=8679030006&text= $sname with contact detais $pmobile , $cmobile $email registered at your Vidyamandir website Please check.";
	            //$smsURLREG="http://sms.himit.in/api/push.json?apikey=59075efb3d25b&route=transactional&sender=DORICM&mobileno=$pmobile&text= Greetings from Vidyamandir. Thank you for your interest. Your request no is $lastId. We will getback to you soon.";
	            
	            //$responseMD = \Httpful\Request::put($smsURLMD)->send();
	            //$responseREG = \Httpful\Request::put($smsURLREG)->send();
	            //$responseSMS = $responseMD."\n \n" .$responseREG;
	            //$email_message .= "SMS status: ".$responseSMS."\n";
	        }catch(Exception $e) {
	            //echo 'Message: ' .$e->getMessage();
	            //$email_message .= "SMS status: ".$responseSMS."\n";
	            $response = $response.$responseSMS.$e->getMessage(). "\r\n";
	        }
			
			if($enrollment_id)
			{	
				$this->system_message->set_success('Student Enrollment Record Saved Successfully!');
				//$this->system_message->set_success('Enquiry Record Saved Successfully! </br> The Enquiry ID is <b>'.$student_id.'</b>');
			}
			else 
			{
				$this->system_message->set_error('Error Saving Enrolment Record');	
			}
			
			refresh();
		}

		$this->load->model('atc_student_registration_model', 'registrations');
		$this->load->model('cdac_course_model', 'courses');
		$this->load->model('cdac_category_model', 'categories');
		$this->load->model('cdac_statu_model', 'status');

		$this->mViewData['registrations'] = $this->registrations->order_by('student_id')->get_many_by("student_status !='D'"); // by atc_code
		$this->mViewData['courses'] = $this->courses->order_by('course_name')->get_many_by("course_status='A'");
		$this->mViewData['categories'] = $this->categories->order_by('category_title')->get_many_by("category_type='ENR' AND category_status='A'");
		$this->mViewData['statuses'] = $this->status->order_by('status_title')->get_many_by("status_group='ENR-STS' AND status='A'");
		
	
		// require reCAPTCHA script at page head
		$this->mScripts['head'][] = 'https://www.google.com/recaptcha/api.js';
		
		$this->mTitle = 'Enrollment Form';
		$this->mViewData['form'] = $form;
		$this->render('atc/enrollmentform');
		
	}
	
	
// List Enrollments for ATC
	public function enrollments()
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
    public function updatedoc() {
        if (isset($_FILES) && !empty($_FILES['qualification_doc']['name'])) {
            $doc_id = $this->input->post('doc_id');
            $this->load->model('atc_student_registration_model', 'atc_student_documents');
            $studentDocs = $this->atc_student_documents->getStudentDocsByDocId($doc_id);
            $res_data = $this->add_document('qualification_doc', 'qualification_doc', array('jpeg', 'jpg', 'png'), $studentDocs['student_id']);

            if (isset($res_data['upload_data']) && $res_data['upload_data'] != '') {

                $image_data = array(
                    'document_name' => $res_data['upload_data']['file_name']
                );
                $this->db->where('id', $doc_id);
                $this->db->update('atc_student_documents', $image_data);
                echo json_encode(array('success' => '1', 'msg' => 'Document Updated successfully'));
            } else {
                echo json_encode(array('success' => '0', 'msg' => $res_data['error']));
            }
        } else {
            echo json_encode(array('success' => '0', 'msg' => 'Please select image for profile'));
        }
    }

    public function getUploadDoc() {
        $document_id = $this->input->post('document_id');
        $this->load->view('atc/documentupload', array('document_id' => $document_id));
    }

    public function registrations() {
        $this->render('atc/registrationlist');
    }

    public function getStudent() {
        $this->load->model('atc_student_registration_model', 'registration');
        $registrations = $this->registration->getStudent($this->input->post('student_id'));
        $this->load->view('atc/student_info', array('registrations' => $registrations));
    }

    public function getStudentDocsImg() {
        $this->load->model('atc_student_registration_model', 'registration');
        $studentDocs = $this->registration->getStudentDocsImg($this->input->post('student_id'));
        $this->load->view('atc/student_docs_img', array('documentimg' => $studentDocs));
    }

    public function getStudentDocs() {
        $this->load->model('atc_student_registration_model', 'registration');
        $studentDocs = $this->registration->getStudentDocs($this->input->post('student_id'));
        $this->load->view('atc/student_docs', array('documentlist' => $studentDocs));
    }

    public function updateDocStatus() {
        $this->load->model('atc_student_registration_model', 'registration');
        $this->registration->updateDocStatus();
    }

    function loadRegistrationData() {
        $page = isset($_POST['page']) ? $_POST['page'] : 1; // get the requested page
        $limit = isset($_POST['rows']) ? $_POST['rows'] : 10; // get how many rows we want to have into the grid
        $sidx = isset($_POST['sidx']) ? $_POST['sidx'] : 'name'; // get index row - i.e. user click to sort
        $sord = isset($_POST['sord']) ? $_POST['sord'] : ''; // get the direction

        $start = $limit * $page - $limit; // do not put $limit*($page - 1)
        $start = ($start < 0) ? 0 : $start;  // make sure that $start is not a negative value

        $where = ""; //if there is no search request sent by jqgrid, $where should be empty
        $searchField = isset($_POST['searchField']) ? $_POST['searchField'] : false;
        $searchOper = isset($_POST['searchOper']) ? $_POST['searchOper'] : false;
        $searchString = isset($_POST['searchString']) ? $_POST['searchString'] : false;

        if ($_POST['_search'] == 'true') {
            $ops = array(
                'eq' => '=', //equal
                'ne' => '<>', //not equal
                'lt' => '<', //less than
                'le' => '<=', //less than or equal
                'gt' => '>', //greater than
                'ge' => '>=', //greater than or equal
                'bw' => 'LIKE', //begins with
                'bn' => 'NOT LIKE', //doesn't begin with
                'in' => 'LIKE', //is in
                'ni' => 'NOT LIKE', //is not in
                'ew' => 'LIKE', //ends with
                'en' => 'NOT LIKE', //doesn't end with
                'cn' => 'LIKE', // contains
                'nc' => 'NOT LIKE'  //doesn't contain
            );

            foreach ($ops as $key => $value) {
                if ($searchOper == $key) {
                    $ops = $value;
                }
            }
            if ($searchOper == 'eq')
                $searchString = $searchString;
            if ($searchOper == 'bw' || $searchOper == 'bn')
                $searchString .= '%';
            if ($searchOper == 'ew' || $searchOper == 'en')
                $searchString = '%' . $searchString;
            if ($searchOper == 'cn' || $searchOper == 'nc' || $searchOper == 'in' || $searchOper == 'ni')
                $searchString = '%' . $searchString . '%';

            $where = "$searchField $ops '$searchString' ";
        }

        if (!$sidx)
            $sidx = 1;


        $this->load->model('atc_student_registration_model', 'registration');

        $registrations = $this->registration->getRegistrations($start, $limit, $sidx, $sord, $where);

        $count = count($this->registration->getAllRegistrations());

        if ($count > 0) {
            $total_pages = ceil($count / $limit);    //calculating total number of pages
        } else {
            $total_pages = 0;
        }

        if ($page > $total_pages)
            $page = $total_pages;
        $response['page'] = $page;
        $response['total'] = $total_pages;
        $response['records'] = $count;
        foreach ($registrations as $key => $val) {
            $response['rows'][$key]['id'] = $val['student_id'];

            $response['rows'][$key]['cell'] = array($val['student_id'], $val['first_name'] . " " . $val['last_name'], $val['atc_code'], $val['student_status'], $val['registered_email'], $val['admission_dt']);
        }
        echo json_encode($response);
    }

    function loadRegistrationDataSingle() {
        $page = isset($_POST['page']) ? $_POST['page'] : 1; // get the requested page
        $limit = isset($_POST['rows']) ? $_POST['rows'] : 10; // get how many rows we want to have into the grid
        $sidx = isset($_POST['sidx']) ? $_POST['sidx'] : 'name'; // get index row - i.e. user click to sort
        $sord = isset($_POST['sord']) ? $_POST['sord'] : ''; // get the direction

        $start = $limit * $page - $limit; // do not put $limit*($page - 1)
        $start = ($start < 0) ? 0 : $start;  // make sure that $start is not a negative value

        $where = ""; //if there is no search request sent by jqgrid, $where should be empty
        $searchField = isset($_POST['searchField']) ? $_POST['searchField'] : false;
        $searchOper = isset($_POST['searchOper']) ? $_POST['searchOper'] : false;
        $searchString = isset($_POST['searchString']) ? $_POST['searchString'] : false;

        if (!$sidx)
            $sidx = 1;

        $this->load->model('atc_student_registration_model', 'registration');

        $registrations = $this->registration->getStudentSingle($_POST['student_id']);

        $response['page'] = 1;
        $response['total'] = 1;
        $response['records'] = 1;
        $i = 1;
        $j = 0;

        foreach ($registrations as $key => $val) {
            if ($i == 1) {
                $response['rows'][$j]['id'] = $_POST['student_id'] . "_" . $j;
            }

            $response['rows'][$j]['cell'][$i . "_label"] = ucfirst(str_replace('_', ' ', $key));
            $response['rows'][$j]['cell'][$i . "_val"] = $val;

            if (($i++ % 3) == 0) {
                $i = 1;
                $j++;
            }
        }
        //echo "==========>>>>>>>>>>> <pre>"; print_r($response); exit;
        echo json_encode($response);
    }

    public function updateRegistrationDataSingle() {
        $fields = $this->db->field_data('atc_student_registrations');
        $fields_names = array();
        foreach ($fields as $field) {
            $fields_names[] = $field->name;
        }

        $studentArr = explode('_', $_POST['id']); // get the student id and row number

        $student_id = $studentArr[0];
        $row = $studentArr[1];
        $first_col = $row * 3;

        $parameters = array();
        if (isset($_POST['1_val']))
            $parameters[$fields_names[$first_col]] = $_POST['1_val'];

        if (isset($_POST['2_val']))
            $parameters[$fields_names[$first_col + 1]] = $_POST['2_val'];

        if (isset($_POST['3_val']))
            $parameters[$fields_names[$first_col + 2]] = $_POST['3_val'];


        $this->db->where('student_id', $student_id);

        $this->db->update('atc_student_registrations', $parameters);
    }

    public function documents() {
        $this->render('atc/documentlist');
    }

    function loadDocumentsData() {

        $page = isset($_POST['page']) ? $_POST['page'] : 1; // get the requested page
        $limit = isset($_POST['rows']) ? $_POST['rows'] : 10; // get how many rows we want to have into the grid
        $sidx = isset($_POST['sidx']) ? $_POST['sidx'] : 'name'; // get index row - i.e. user click to sort
        $sord = isset($_POST['sord']) ? $_POST['sord'] : ''; // get the direction

        $start = $limit * $page - $limit; // do not put $limit*($page - 1)
        $start = ($start < 0) ? 0 : $start;  // make sure that $start is not a negative value

        $where = ""; //if there is no search request sent by jqgrid, $where should be empty

        $searchField = isset($_POST['searchField']) ? $_POST['searchField'] : false;
        $searchOper = isset($_POST['searchOper']) ? $_POST['searchOper'] : false;
        $searchString = isset($_POST['searchString']) ? $_POST['searchString'] : false;

        if ($_POST['_search'] == 'true') {
            $ops = array(
                'eq' => '=', //equal
                'ne' => '<>', //not equal
                'lt' => '<', //less than
                'le' => '<=', //less than or equal
                'gt' => '>', //greater than
                'ge' => '>=', //greater than or equal
                'bw' => 'LIKE', //begins with
                'bn' => 'NOT LIKE', //doesn't begin with
                'in' => 'LIKE', //is in
                'ni' => 'NOT LIKE', //is not in
                'ew' => 'LIKE', //ends with
                'en' => 'NOT LIKE', //doesn't end with
                'cn' => 'LIKE', // contains
                'nc' => 'NOT LIKE'  //doesn't contain
            );

            foreach ($ops as $key => $value) {
                if ($searchOper == $key) {
                    $ops = $value;
                }
            }
            if ($searchOper == 'eq')
                $searchString = $searchString;
            if ($searchOper == 'bw' || $searchOper == 'bn')
                $searchString .= '%';
            if ($searchOper == 'ew' || $searchOper == 'en')
                $searchString = '%' . $searchString;
            if ($searchOper == 'cn' || $searchOper == 'nc' || $searchOper == 'in' || $searchOper == 'ni')
                $searchString = '%' . $searchString . '%';

            $where = "$searchField $ops '$searchString' ";
        }

        if (!$sidx)
            $sidx = 1;


        $this->load->model('atc_student_registration_model', 'documents');

        $issuebook = $this->documents->getDocument($start, $limit, $sidx, $sord, $where);

        $count = count($this->documents->getAllDocuments($where));

        if ($count > 0) {
            $total_pages = ceil($count / $limit);    //calculating total number of pages
        } else {
            $total_pages = 0;
        }

        if ($page > $total_pages)
            $page = $total_pages;

        $response['page'] = $page;
        $response['total'] = $total_pages;
        $response['records'] = $count;


        foreach ($issuebook as $key => $val) {
            $response['rows'][$key]['id'] = $val->id;

            $response['rows'][$key]['cell'] = array($val->id, $val->student_id, $val->document_name, $val->document_type, $val->center_code, $val->status, $val->created_by);
        }

        echo json_encode($response);
        exit;
    }

    public function Document_update() {
        $this->db->where('id', $_POST['id']);
        $this->db->update('atc_student_documents', array('status' => $_POST['status']));
    }

    // Issued Books with the ATC
    public function book_issue_log() {
        $this->render('atc/bookissuelist');
    }

    public function book_issue_update() {
        $this->db->where('row_id', $_POST['id']);
        $this->db->update('atc_student_book_issue_logs', array('issue_status' => $_POST['issue_status']));
    }

    function loadBookIssueData() {

        $page = isset($_POST['page']) ? $_POST['page'] : 1; // get the requested page
        $limit = isset($_POST['rows']) ? $_POST['rows'] : 10; // get how many rows we want to have into the grid
        $sidx = isset($_POST['sidx']) ? $_POST['sidx'] : 'name'; // get index row - i.e. user click to sort
        $sord = isset($_POST['sord']) ? $_POST['sord'] : ''; // get the direction

        $start = $limit * $page - $limit; // do not put $limit*($page - 1)
        $start = ($start < 0) ? 0 : $start;  // make sure that $start is not a negative value

        $where = ""; //if there is no search request sent by jqgrid, $where should be empty

        $searchField = isset($_POST['searchField']) ? $_POST['searchField'] : false;
        $searchOper = isset($_POST['searchOper']) ? $_POST['searchOper'] : false;
        $searchString = isset($_POST['searchString']) ? $_POST['searchString'] : false;

        if ($_POST['_search'] == 'true') {
            $ops = array(
                'eq' => '=', //equal
                'ne' => '<>', //not equal
                'lt' => '<', //less than
                'le' => '<=', //less than or equal
                'gt' => '>', //greater than
                'ge' => '>=', //greater than or equal
                'bw' => 'LIKE', //begins with
                'bn' => 'NOT LIKE', //doesn't begin with
                'in' => 'LIKE', //is in
                'ni' => 'NOT LIKE', //is not in
                'ew' => 'LIKE', //ends with
                'en' => 'NOT LIKE', //doesn't end with
                'cn' => 'LIKE', // contains
                'nc' => 'NOT LIKE'  //doesn't contain
            );

            foreach ($ops as $key => $value) {
                if ($searchOper == $key) {
                    $ops = $value;
                }
            }
            if ($searchOper == 'eq')
                $searchString = $searchString;
            if ($searchOper == 'bw' || $searchOper == 'bn')
                $searchString .= '%';
            if ($searchOper == 'ew' || $searchOper == 'en')
                $searchString = '%' . $searchString;
            if ($searchOper == 'cn' || $searchOper == 'nc' || $searchOper == 'in' || $searchOper == 'ni')
                $searchString = '%' . $searchString . '%';

            $where = "$searchField $ops '$searchString' ";
        }

        if (!$sidx)
            $sidx = 1;


        $this->load->model('atc_student_book_issue_log_model', 'issuebook');

        $issuebook = $this->issuebook->getIssueBook($start, $limit, $sidx, $sord, $where);

        $count = count($this->issuebook->getAllIssueBooks($where));

        if ($count > 0) {
            $total_pages = ceil($count / $limit);    //calculating total number of pages
        } else {
            $total_pages = 0;
        }

        if ($page > $total_pages)
            $page = $total_pages;

        $response['page'] = $page;
        $response['total'] = $total_pages;
        $response['records'] = $count;


        foreach ($issuebook as $key => $val) {
            $response['rows'][$key]['id'] = $val->row_id;

            $response['rows'][$key]['cell'] = array($val->row_id, $val->student_id, $val->entity_code, $val->course_code, $val->module_code, $val->book_code, $val->issue_status, $val->book_issue_dt, $val->created_by, $val->created_dt, $val->modified_by, $val->modified_dt);
        }

        echo json_encode($response);
        exit;
    }

    // Student Enrollmentss with the ATC
//    public function enrollments() {
//        $this->render('atc/studentenrollmentlist');
//    }

    function enrolledCourseData() {

        $page = isset($_POST['page']) ? $_POST['page'] : 1; // get the requested page
        $limit = isset($_POST['rows']) ? $_POST['rows'] : 10; // get how many rows we want to have into the grid
        $sidx = isset($_POST['sidx']) ? $_POST['sidx'] : 'name'; // get index row - i.e. user click to sort
        $sord = isset($_POST['sord']) ? $_POST['sord'] : ''; // get the direction

        $start = $limit * $page - $limit; // do not put $limit*($page - 1)
        $start = ($start < 0) ? 0 : $start;  // make sure that $start is not a negative value

        $where = ""; //if there is no search request sent by jqgrid, $where should be empty

        $searchField = isset($_POST['searchField']) ? $_POST['searchField'] : false;
        $searchOper = isset($_POST['searchOper']) ? $_POST['searchOper'] : false;
        $searchString = isset($_POST['searchString']) ? $_POST['searchString'] : false;

        if ($_POST['_search'] == 'true') {
            $ops = array(
                'eq' => '=', //equal
                'ne' => '<>', //not equal
                'lt' => '<', //less than
                'le' => '<=', //less than or equal
                'gt' => '>', //greater than
                'ge' => '>=', //greater than or equal
                'bw' => 'LIKE', //begins with
                'bn' => 'NOT LIKE', //doesn't begin with
                'in' => 'LIKE', //is in
                'ni' => 'NOT LIKE', //is not in
                'ew' => 'LIKE', //ends with
                'en' => 'NOT LIKE', //doesn't end with
                'cn' => 'LIKE', // contains
                'nc' => 'NOT LIKE'  //doesn't contain
            );

            foreach ($ops as $key => $value) {
                if ($searchOper == $key) {
                    $ops = $value;
                }
            }
            if ($searchOper == 'eq')
                $searchString = $searchString;
            if ($searchOper == 'bw' || $searchOper == 'bn')
                $searchString .= '%';
            if ($searchOper == 'ew' || $searchOper == 'en')
                $searchString = '%' . $searchString;
            if ($searchOper == 'cn' || $searchOper == 'nc' || $searchOper == 'in' || $searchOper == 'ni')
                $searchString = '%' . $searchString . '%';

            $where = "$searchField $ops '$searchString' ";
        }

        if (!$sidx)
            $sidx = 1;


        $this->load->model('atc_student_course_model', 'cousre');

        $enrollcourse = $this->cousre->getEnrolledCourse($start, $limit, $sidx, $sord, $where);

        //echo "==============enrollcourse>>>>>>>>>>> <pre>"; print_r($enrollcourse); exit;

        $count = count($this->cousre->getAllEnrolledCourse($where));

        if ($count > 0) {
            $total_pages = ceil($count / $limit);    //calculating total number of pages
        } else {
            $total_pages = 0;
        }

        if ($page > $total_pages)
            $page = $total_pages;

        $response['page'] = $page;
        $response['total'] = $total_pages;
        $response['records'] = $count;


        foreach ($enrollcourse as $key => $val) {
            $response['rows'][$key]['id'] = $val->row_id;

            $response['rows'][$key]['cell'] = array($val->row_id, $val->student_id, $val->course_name, $val->course_description, $val->course_category, $val->course_category_description, $val->start_dt, $val->end_dt, $val->enrollment_type, $val->status, $val->created_by, $val->created_dt, $val->modified_by, $val->modified_dt);
        }
        echo json_encode($response);
        exit;
    }

    public function enrollment_update() {
        $this->db->where('row_id', $_POST['id']);
        $this->db->update('atc_student_courses', array('status' => $_POST['status']));
    }

    // Course with cdac
    public function courses() {
        $this->render('atc/courselist');
    }

    function coursesData() {

        $page = isset($_POST['page']) ? $_POST['page'] : 1; // get the requested page
        $limit = isset($_POST['rows']) ? $_POST['rows'] : 10; // get how many rows we want to have into the grid
        $sidx = isset($_POST['sidx']) ? $_POST['sidx'] : 'name'; // get index row - i.e. user click to sort
        $sord = isset($_POST['sord']) ? $_POST['sord'] : ''; // get the direction

        $start = $limit * $page - $limit; // do not put $limit*($page - 1)
        $start = ($start < 0) ? 0 : $start;  // make sure that $start is not a negative value

        $where = ""; //if there is no search request sent by jqgrid, $where should be empty

        $searchField = isset($_POST['searchField']) ? $_POST['searchField'] : false;
        $searchOper = isset($_POST['searchOper']) ? $_POST['searchOper'] : false;
        $searchString = isset($_POST['searchString']) ? $_POST['searchString'] : false;

        if ($_POST['_search'] == 'true') {
            $ops = array(
                'eq' => '=', //equal
                'ne' => '<>', //not equal
                'lt' => '<', //less than
                'le' => '<=', //less than or equal
                'gt' => '>', //greater than
                'ge' => '>=', //greater than or equal
                'bw' => 'LIKE', //begins with
                'bn' => 'NOT LIKE', //doesn't begin with
                'in' => 'LIKE', //is in
                'ni' => 'NOT LIKE', //is not in
                'ew' => 'LIKE', //ends with
                'en' => 'NOT LIKE', //doesn't end with
                'cn' => 'LIKE', // contains
                'nc' => 'NOT LIKE'  //doesn't contain
            );

            foreach ($ops as $key => $value) {
                if ($searchOper == $key) {
                    $ops = $value;
                }
            }
            if ($searchOper == 'eq')
                $searchString = $searchString;
            if ($searchOper == 'bw' || $searchOper == 'bn')
                $searchString .= '%';
            if ($searchOper == 'ew' || $searchOper == 'en')
                $searchString = '%' . $searchString;
            if ($searchOper == 'cn' || $searchOper == 'nc' || $searchOper == 'in' || $searchOper == 'ni')
                $searchString = '%' . $searchString . '%';

            $where = "$searchField $ops '$searchString' ";
        }

        if (!$sidx)
            $sidx = 1;


        $this->load->model('cdac_course_model', 'cousre');

        $course = $this->cousre->getCourse($start, $limit, $sidx, $sord, $where);

        $count = count($this->cousre->getAllCourse($where));

        if ($count > 0) {
            $total_pages = ceil($count / $limit);    //calculating total number of pages
        } else {
            $total_pages = 0;
        }

        if ($page > $total_pages)
            $page = $total_pages;

        $response['page'] = $page;
        $response['total'] = $total_pages;
        $response['records'] = $count;

        //echo "==============>>>>>>>>>>> <pre>"; print_r($course); exit;

        $i = 1;
        foreach ($course as $key => $val) {
            $response['rows'][$key]['id'] = $val->row_id;

            $response['rows'][$key]['cell'] = array($val->row_id, $val->entity_code, $val->course_name, $val->course_description, $val->course_status, $val->course_category, 'View Modules', $val->course_category_description);
        }

        //echo "==============>>>>>>>>>>> <pre>"; print_r($response); exit;

        echo json_encode($response);
        exit;
    }

    public function getCourseModules() {
        $this->load->model('cdac_course_model', 'course');
        $courseModules = $this->course->getCourseModules($this->input->post('id'));
        $this->load->view('atc/course_modules', array('modulelist' => $courseModules));
    }

    // Course with cdac
    public function couriers() {
        $this->render('atc/courierlist');
    }

    function courierData() {

        $page = isset($_POST['page']) ? $_POST['page'] : 1; // get the requested page
        $limit = isset($_POST['rows']) ? $_POST['rows'] : 10; // get how many rows we want to have into the grid
        $sidx = isset($_POST['sidx']) ? $_POST['sidx'] : 'name'; // get index row - i.e. user click to sort
        $sord = isset($_POST['sord']) ? $_POST['sord'] : ''; // get the direction

        $start = $limit * $page - $limit; // do not put $limit*($page - 1)
        $start = ($start < 0) ? 0 : $start;  // make sure that $start is not a negative value

        $where = ""; //if there is no search request sent by jqgrid, $where should be empty

        $searchField = isset($_POST['searchField']) ? $_POST['searchField'] : false;
        $searchOper = isset($_POST['searchOper']) ? $_POST['searchOper'] : false;
        $searchString = isset($_POST['searchString']) ? $_POST['searchString'] : false;

        if ($_POST['_search'] == 'true') {
            $ops = array(
                'eq' => '=', //equal
                'ne' => '<>', //not equal
                'lt' => '<', //less than
                'le' => '<=', //less than or equal
                'gt' => '>', //greater than
                'ge' => '>=', //greater than or equal
                'bw' => 'LIKE', //begins with
                'bn' => 'NOT LIKE', //doesn't begin with
                'in' => 'LIKE', //is in
                'ni' => 'NOT LIKE', //is not in
                'ew' => 'LIKE', //ends with
                'en' => 'NOT LIKE', //doesn't end with
                'cn' => 'LIKE', // contains
                'nc' => 'NOT LIKE'  //doesn't contain
            );

            foreach ($ops as $key => $value) {
                if ($searchOper == $key) {
                    $ops = $value;
                }
            }
            if ($searchOper == 'eq')
                $searchString = $searchString;
            if ($searchOper == 'bw' || $searchOper == 'bn')
                $searchString .= '%';
            if ($searchOper == 'ew' || $searchOper == 'en')
                $searchString = '%' . $searchString;
            if ($searchOper == 'cn' || $searchOper == 'nc' || $searchOper == 'in' || $searchOper == 'ni')
                $searchString = '%' . $searchString . '%';

            $where = "$searchField $ops '$searchString' ";
        }

        if (!$sidx)
            $sidx = 1;


        $this->load->model('cdac_courier_model', 'courier');

        $courier = $this->courier->getCourier($start, $limit, $sidx, $sord, $where);

        $count = count($this->courier->getAllCourier($where));

        if ($count > 0) {
            $total_pages = ceil($count / $limit);    //calculating total number of pages
        } else {
            $total_pages = 0;
        }

        if ($page > $total_pages)
            $page = $total_pages;

        $response['page'] = $page;
        $response['total'] = $total_pages;
        $response['records'] = $count;

        //echo "==============>>>>>>>>>>> <pre>"; print_r($courier); exit;

        $i = 1;
        foreach ($courier as $key => $val) {
            $response['rows'][$key]['id'] = $val->row_id;

            $response['rows'][$key]['cell'] = array($val->row_id, $val->docket_code, $val->carrier_name, $val->url, $val->requesting_entity_code, $val->requested_entity_code, $val->courier_status, $val->package_sent_dt, $val->package_content_details, $val->comments, $val->package_received_dt, $val->created_by);
        }

        //echo "==============>>>>>>>>>>> <pre>"; print_r($response); exit;

        echo json_encode($response);
        exit;
    }

    public function editCourier() {
        $this->db->where('row_id', $_POST['id']);
        $this->db->update('couriers', array('courier_status' => $_POST['courier_status'], 'package_received_dt' => date('Y-m-d'), 'modified_dt' => date('Y-m-d')));
    }
}
