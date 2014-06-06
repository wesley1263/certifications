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
        
        if($this->_request->isPost()){
            $data = $this->_request->getPost();
           if($data['id_questions'] == null){
               if($this->model->save($data)){
                   $this->_helper->FlashMessenger->addMessage('New question success registred','success');
                   $this->_redirect('/admin/question');
               }
           }else{
               if($this->model->alter($data)){
                   $this->_helper->FlashMessenger->addMessage('Question success updated','success');
                   $this->_redirect('/admin/question');
               }
           }
           
           $this->view->success = $this->_helper->FlashMessenger->getMessages('success');
        }
        
    }
    
    public function removeAction()
    {
        $id = $this->_request->getParam('id');
        if($this->model->remove($id)){
            $this->_helper->FlashMessenger->addMessage('Question success removed','success');
            $this->_redirect('/admin/request');
        }
    }
    

}

