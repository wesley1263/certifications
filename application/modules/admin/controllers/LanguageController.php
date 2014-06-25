<?php

class Admin_LanguageController extends Zend_Controller_Action
{

    public function init()
    {
       $this->_auth = Zend_Auth::getInstance();
       $this->view->session =  $this->_auth->getStorage()->read();
       if(!$this->view->session){
          $this->_redirect('/admin'); 
       }
       
       $this->model = new Application_Model_DbTable_Language();
    }

    public function indexAction()
    {
      $this->view->listAll = $this->model->listAll();
      $this->view->success = $this->_helper->FlashMessenger->getMessages('success');
      $this->view->error = $this->_helper->FlashMessenger->getMessages('error');
    }
    
    public function newAction()
    {
        $id = $this->_request->getParam('id');
        if($id){
            $this->view->listOnce = $this->model->listOnce($id);
        }
        
        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            $data['title_language'] = strtoupper($data['title_language']);
            if($data['id_language'] == null){
                if(count($this->model->verify($data)) == 0){
                    if($this->model->save($data)){
                        $this->_helper->FlashMessenger->addMessage('Data successfully saved.','success');
                        $this->_redirect('/admin/language');
                    }
                }else{
                    $this->_helper->FlashMessenger->addMessage('An error occurred while trying to save!','error');
                        $this->_redirect('/admin/language');
                }
            }else{
                if($this->model->alter($data)){
                        $this->_helper->FlashMessenger->addMessage('Data successfully updated.','success');
                        $this->_redirect('/admin/language');
                    }
            }
        }
        
        
    }
    
    public function removeAction()
    {
        $id = $this->_request->getParam('id');
        if($this->model->remove($id)){
            $this->_helper->FlashMessenger->addMessage('Data successfully removed.','success');
            $this->_redirect('/admin/language');
        }
    }


}

