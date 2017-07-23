<?php

/**
 * Config file for form validation
 * http://www.codeigniter.com/user_guide/libraries/form_validation.html (Under section "Creating Sets of Rules")
 */

$config = array(

	// Sign Up
	'auth/sign_up' => array(
		array(
			'field'		=> 'first_name',
			'label'		=> 'First Name',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'last_name',
			'label'		=> 'Last Name',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'email',
			'label'		=> 'Email',
			'rules'		=> 'required|valid_email|is_unique[users.email]',
		),
		array(
			'field'		=> 'password',
			'label'		=> 'Password',
			'rules'		=> 'required|min_length[8]',
		),
		array(
			'field'		=> 'retype_password',
			'label'		=> 'Retype Password',
			'rules'		=> 'required|matches[password]',
		),
	),

	// Login
	'auth/login' => array(
		array(
			'field'		=> 'email',
			'label'		=> 'Email',
			'rules'		=> 'required|valid_email',
		),
		array(
			'field'		=> 'password',
			'label'		=> 'Password',
			'rules'		=> 'required',
		),
	),

	// Forgot Password
	'auth/forgot_password' => array(
		array(
			'field'		=> 'email',
			'label'		=> 'Email',
			'rules'		=> 'required|valid_email',
		),
	),

	// Reset Password
	'auth/reset_password' => array(
		array(
			'field'		=> 'password',
			'label'		=> 'Password',
			'rules'		=> 'required|min_length[8]',
		),
		array(
			'field'		=> 'retype_password',
			'label'		=> 'Retype Password',
			'rules'		=> 'required|matches[password]',
		),
	),

	// Demo only
	'demo/form_basic' => array(
		array(
			'field'		=> 'name',
			'label'		=> 'Name',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'email',
			'label'		=> 'Email',
			'rules'		=> 'required|valid_email',
		),
		array(
			'field'		=> 'subject',
			'label'		=> 'Subject',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'message',
			'label'		=> 'Message',
			'rules'		=> 'required',
		),
	),
	'demo/form_bs3' => array(
		array(
			'field'		=> 'name',
			'label'		=> 'Name',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'email',
			'label'		=> 'Email',
			'rules'		=> 'required|valid_email',
		),
		array(
			'field'		=> 'subject',
			'label'		=> 'Subject',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'message',
			'label'		=> 'Message',
			'rules'		=> 'required',
		),
	),
	
	//Student Enquiry Form
	'student/enquiry' => array(
		array(
			'field'		=> 'first_name',
			'label'		=> 'First Name',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'last_name',
			'label'		=> 'Last Name',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'atc_code',
			'label'		=> 'ATC',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'intended_course',
			'label'		=> 'Course',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'enquiry_dt',
			'label'		=> 'Enquiry Date',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'enquiry_status',
			'label'		=> 'Enquiry Status',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'enquiry_email',
			'label'		=> 'Email',
			'rules'		=> 'required|valid_email',
		),
		array(
			'field'		=> 'enquiry_notes',
			'label'		=> 'Notes',
			'rules'		=> 'required',
		),
	),
	//Student Registration Form
	'student/register' => array(
		array(
			'field'		=> 'first_name',
			'label'		=> 'First Name',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'father_first_name',
			'label'		=> 'Father First Nameme',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'gender',
			'label'		=> 'Gender',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'contact_phone',
			'label'		=> 'Contact Phone',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'registered_email',
			'label'		=> 'Email',
			'rules'		=> 'required|valid_email',
		),
		array(
			'field'		=> 'date_of_birth',
			'label'		=> 'Date of Birth',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'current_address_line1',
			'label'		=> 'Current Address',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'permanent_address_line1',
			'label'		=> 'Permanent Address',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'atc_code',
			'label'		=> 'ATC',
			'rules'		=> 'required',
		),
		
		array(
			'field'		=> 'admission_dt',
			'label'		=> 'Admission Date',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'student_status',
			'label'		=> 'Status',
			'rules'		=> 'required',
		),
	)
	

);

/**
 * Google reCAPTCHA settings
 * https://www.google.com/recaptcha/
 */
//local
$config['recaptcha'] = array(
	'site_key'		=> '6Lc1MAYTAAAAAOdhZ0qvGMUFuBD-J6fJIP3DvX-b',
	'secret_key'	=> '6Lc1MAYTAAAAAEARt-nT1En9NBonssoo4vWI12Nl',
);

//hpie
//$config['recaptcha'] = array(
	//'site_key'		=> '6LdnvCQUAAAAAGmHBukXVzjs5NupVLlaIHJdpFWo',
	//'secret_key'	=> '6LdnvCQUAAAAAEyj_EroRm6QgbsZ58iau3sgWMTz',
//);

