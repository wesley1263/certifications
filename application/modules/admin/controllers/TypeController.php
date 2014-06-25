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
         $this->view->language = $this->language->listAll();
         $id = $this->_request->getParam('id');
         if($id){
             $this->view->listOnce = $this->model->listOnce($id);
         }
         
         if($this->_request->isPost()){
             $data = $this->_request->getPost();
             $data['title_type'] = strtoupper($data['title_type']);
             if($data['id_type'] == null){
                 if(count($this->model->verify($data)) == null){
                     if($this->model->save($data)){
                         $this->_helper->FlashMessenger->addMessage('Data successfully saved.','success');
                         $this->_redirect('/admin/type');
                     }
                 }else{
                     $this->_helper->FlashMessenger->addMessage('Type title already exists!','error');
                     $this->_redirect('/admin/type');
                 }
             }else{
                 if($this->model->alter($data)){
                         $this->_helper->FlashMessenger->addMessage('Data successfully updated.','success');
                         $this->_redirect('/admin/type');
                     }
             }
         }
    }
    
    public function removeAction()
    {
        $id = $this->_request->getParam('id');
        if($this->model->remove($id)){
            $this->_helper->FlashMessenger->addMessage('Data successfully removed','success');
            $this->_redirect('/admin/type');
        }
    }


}

