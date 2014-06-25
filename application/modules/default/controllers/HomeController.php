<?php
class Default_HomeController extends Zend_Controller_Action {
    
    public function init()
    {
        $this->_auth = Zend_Auth::getInstance();
        $this->view->session =  $this->_auth->getStorage()->read();
        if(!$this->view->session){
            $this->_redirect('/');
        }
    }
    
    public function indexAction()
    {
        
    }
}
