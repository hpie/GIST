<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends Admin_Controller {

	public function index()
	{

		$this->load->model('user_model', 'users');
		$this->load->model('group_model', 'groups');
		$this->load->model('cdac_arc_model', 'cdac_arcs');
		$this->load->model('cdac_atc_model', 'cdac_atcs');
		
		$this->mViewData['count'] = array(
			'users' => $this->users->count_all(),
			'groups' => $this->groups->count_all(),
			'cdac_arcs' => $this->cdac_arcs->count_all(),
			'cdac_atcs' => $this->cdac_atcs->count_all(),
		);
		

		
		$this->render('home');
	}
}
