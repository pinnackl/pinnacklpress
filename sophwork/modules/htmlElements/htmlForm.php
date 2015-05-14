<?php

namespace sophwork\modules\htmlElements;

class htmlForm extends htmlElement{
	protected $data;
	protected $formName;
	protected $layout;
	
	public function __construct($data,$formName){
		$this->data = $data;
		$this->formName = $formName; 
	}

	public function createForm(){

		$layout = new htmlElement('div');
		$form = new htmlElement('form');
		$form->set('name',$this->formName);
		$form->set('method','POST');
		$form->set('action','/controller/controllers/listener/listeners.php');

		foreach ($this->data as $key => $value) {

			$line = new htmlElement('br');
			$form->inject($line);

			$input = new htmlElement('input');
			$input->set('type',$this->data[$key]['field_type']);
			$input->set('id',$this->data[$key]['field_id']);
			$input->set('class','field');
			$input->set('name',$this->data[$key]['field_name']);
			$input->set('placeholder',$this->data[$key]['field_name']);

			$form->inject($input);
		}
		$submit = new htmlElement('input');
		$submit->set('type','button');
		$submit->set('name','__'.$this->formName);
		$submit->set('value','Submit');
		$line = new htmlElement('br');
		$form->inject($line);
		$form->inject($submit);
		$layout->inject($form);

		return $layout;
	}
}