<?php

class Admin_TypeController extends Zend_Controller_Action
{

    public function init()
    {

       $this->_auth = Zend_Auth::getInstance();
       $this->view->session =  $this->_auth->getStorage()->read();
       if(!$this->view->session){
          $this->_redirect('/admin'); 
       }
       $this->model = new Application_Model_DbTable_Type();
       $this->language = new Application_Model_DbTable_Language();
    }

    public function indexAction()
    {
        $this->view->listAll = $this->model->listAll();
        $this->view->language = $this->language->listAll();
        $this->view->success = $this->_helper->FlashMessenger->getMessages('success');
        $this->view->error = $this->_helper->FlashMessenger->getMessages('error');
    }
    
    public function newAction()
    {
        
    }
    
    public function removeAction()
    {
        
    }


}

