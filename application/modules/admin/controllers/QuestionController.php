<?php

class Admin_QuestionController extends Zend_Controller_Action
{

    public function init()
    {
        $this->model = new Application_Model_DbTable_Question();
        $this->type = new Application_Model_DbTable_Type();
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
        $this->view->listAll = $this->model->listAll();
        $this->view->type = $this->type->listAll();
        
    }
    
    public function newAction()
    {
        $this->view->types = $this->type->listAll();
        $id = $this->_request->getParam('id');
        if($id){
            $this->view->listOnce = $this->model->listOnce($id);
        }
        
    }
    
    public function removeAction()
    {
        
    }
    

}

