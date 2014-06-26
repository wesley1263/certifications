<?php
class Default_HomeController extends Zend_Controller_Action {
    
    public function init()
    {
        $this->_auth = Zend_Auth::getInstance();
        $this->view->session =  $this->_auth->getStorage()->read();
        if(!$this->view->session){
            $this->_redirect('/');
        }
        
        $this->question = new Application_Model_DbTable_Question();
        $this->type = new Application_Model_DbTable_Type();
    }
    
    public function indexAction()
    {
        $this->view->type = $this->type->listAll();
    }
}
