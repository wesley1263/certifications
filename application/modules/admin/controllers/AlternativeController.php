<?php

class Admin_AlternativeController extends Zend_Controller_Action
{

    public function init()
    {

        $this->_auth = Zend_Auth::getInstance();
        $this->view->session =  $this->_auth->getStorage()->read();
        if(!$this->view->session){
          $this->_redirect('/admin'); 
        }
        
        $this->model = new Application_Model_DbTable_Alternative();
        $this->question = new Application_Model_DbTable_Question();
        
    }

    public function indexAction()
    {
        
        // action body
        $result = $this->model->listAll();
        $this->view->questions = $this->question->listAll();
        
        ##### Sistema de Paginação Zend ######
		Zend_Paginator::setDefaultScrollingStyle('Sliding');
		Zend_View_Helper_PaginationControl::setDefaultViewPartial('partials/paginator.phtml');

		#### Definindo primeira pagina com numero 1 do pagination ######
		$currentPage = $this -> getParam('page', 1);
		$paginator = Zend_Paginator::factory($result);

		##### Definindo o número de linhas por pagina #####
		$paginator -> setCurrentPageNumber($currentPage) -> setItemCountPerPage(15);

        $this->view->listAll = $paginator;
        $this->view->success = $this->_helper->FlashMessenger->getMessages('success');
        $this->view->error = $this->_helper->FlashMessenger->getMessages('error');
        
    }
    
    public function newAction()
    {
        $this->view->questions = $this->question->listAll();
        $id = $this->_request->getParam('id');
        if($id){
            $this->view->listOnce = $this->model->listOnce($id);
        }
        
        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            if($data['id_alternative'] == null){
                $option = array('1'=>'A','2'=>'B','3'=>'C','4'=>'D','5'=>'E','6'=>'F');
                $descriptionArray = explode('|', $data['description_alternative']);
                $cont = 0;
                $alterArray = array();
                foreach ($descriptionArray as $value) {
                    $cont++;
                    $alterArray[$cont]['id_alternative'] = $data['id_alternative'];
                    $alterArray[$cont]['id_questions'] = $data['id_questions'];
                    $alterArray[$cont]['option_alternative'] = $option[$cont];
                    $alterArray[$cont]['description_alternative'] = $value;
                    $alterArray[$cont]['form_alternative'] = $data['form_alternative'];
                    $alterArray[$cont]['status_alternative'] = $data['status_alternative'];
                }
                
                foreach ($alterArray as $value) {
                   $ok = $this->model->save($value);
                }

               if($ok){
                   $this->_helper->FlashMessenger->addMessage('Alternative success saved!','success');
                    $this->_redirect('/admin/alternative'); 
               }
            }else{
                if($this->model->alter($data)){
                   $this->_helper->FlashMessenger->addMessage('Alternative success updated!','success');
                    $this->_redirect('/admin/alternative'); 
               }
            }
        }
        
    }
    public function removeAction()
    {
        if($this->_request->getParam('id')){
            $this->_helper->FlashMessenger->addMessage('Alternative success removed!','success');
            $this->_redirect('/admin/alternative');
        }
    }


}

