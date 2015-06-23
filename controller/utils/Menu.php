<?php

namespace controller\utils;

use sophwork\core\Sophwork;
use sophwork\modules\kdm\SophworkDM;
use sophwork\modules\kdm\SophworkDMEntities;

class Menu extends \sophwork\app\controller\AppController {
	protected $menu;
	protected $menuContent;
	protected $pageLinks;
	protected $links;
	protected $permaLink;

	public function __construct(){
		parent::__construct();
		$this->menu = $this->KDM->create('pp_menu');
		$this->menuContent = $this->KDM->create('pp_menu_rs');
		$this->pageLinks = $this->KDM->create('pp_page');
		$this->links = [];
		$this->permaLink = $this->KDM->create('pp_option');
	}

	public function create($menu){
		$this->menu->findMenuStatus($menu);
		$this->menuContent->findMenuId($this->menu->getMenuId()[0]);
		$menuLinks = $this->menuContent->getData();
		foreach ($menuLinks['page_id'] as $key => $value) {
			$this->pageLinks->find($value);
			if(isset($this->links[$this->pageLinks->getPageOrder()[0]]))
				$this->links[$this->pageLinks->getPageOrder()[0]+1] = [
					'link' => Sophwork::getUrl() . $this->pageLinks->getPageTag()[0],
					'name' => $this->pageLinks->getPageName()[0]
				];
			else
				$this->links[$this->pageLinks->getPageOrder()[0]] = [
					'link' => Sophwork::getUrl() . $this->pageLinks->getPageTag()[0],
					'name' => $this->pageLinks->getPageName()[0]
				];
		}
		ksort ($this->links);
		return $this->links;
	}

	public function permaLink($page){
		$this->permaLink->findOptionName('permaLink');
		switch ($this->permaLink->getOptionValue()[0]){
			case 'd-m-Y':
				$d = date_create($page->getPageDate()[0]);
				$perma = date_format($d,"d-m-Y") . '/';
				break;
			case 'Y-m-d':
				$d = date_create($page->getPageDate()[0]);
				$perma = date_format($d,"Y-m-d") . '/';
				break;
			
			default:
				$perma = $this->permaLink->getOptionValue()[0] . '/';
				break;
		}
		if($page->getPageType()[0] == 'post'){
			Sophwork::redirect($perma . $page->getPageTag()[0]);
		}
		else{
			if($this->article)
				$page->findPageTag($this->article);
		}
	}
}