<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * For Blog purpose only
 */
class Arc extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		
		// only login users can access Account controller
		$this->verify_login();
		
		$this->load->library('form_builder');
		$this->push_breadcrumb('Arc');
	}

	public function index()
	{
		//redirect('student/item/1');
		redirect('arc/atcs');
		
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

	
	public function atcs()
	{
		$page = $this->input->get('p');
		$page = empty($page) ? 1 : $page;

		$this->load->model('cdac_atc_model', 'center');
		
		//TODO: get results for login user for ATC / ARC / CDAC
		//with clause is used to get mapped models 
		$results = $this->center->paginate($page);
		$centers = $results['data'];
		$counts = $results['counts'];
		
		// call render() from MY_Pagination
		$this->load->library('pagination');
		$pagination = $this->pagination->render($counts['total_num'], $counts['limit']);

		$this->mViewData['centers'] = $centers;
		$this->mViewData['counts'] = $counts;
		$this->mViewData['pagination'] = $pagination;
		$this->render('arc/atclist');
	}
	
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
		$this->render('arc/enquirylist');
	}
		
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
		$this->render('arc/registrationlist');
	}
	
}
