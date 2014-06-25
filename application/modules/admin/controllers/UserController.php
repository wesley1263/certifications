<?php

class Admin_UserController extends Zend_Controller_Action
{

    public function init()
    {
       $this->_auth = Zend_Auth::getInstance();
       $this->view->session =  $this->_auth->getStorage()->read();
       if(!$this->view->session){
          $this->_redirect('/admin'); 
       }
       
       $this->model = new Application_Model_DbTable_User();
       $this->role = new Application_Model_DbTable_Role();

    }

    public function indexAction()
    {
        $this->view->listAll = $this->model->listAll();
        $this->view->role = $this->role->listAll();
        $this->view->success = $this->_helper->FlashMessenger->getMessages('success');
        $this->view->error = $this->_helper->FlashMessenger->getMessages('error');
    }

    public function newAction()
    {
        $this->view->role = $this->role->listAll();
        $id = $this->_request->getParam('id');
        if($id){
            $this->view->listOnce = $this->model->listOnce($id);
        }
        
        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            $data['password_user'] = md5($data['password_user']);
            if($data['id_user'] == null){
                if(count($this->model->verify($data)) == 0){
                    if($this->model->save($data)){
                        $this->_helper->FlashMessenger->addMessage('Data successfully saved.','success');
                        $this->_redirect('/admin/user');
                    }
                }else{
                    $this->_helper->FlashMessenger->addMessage('User already exists!','error');
                    $this->_redirect('/admin/user');
                }
            }else{
                if($data['password_user'] == null){
                   unset($data['password_user']);
                }
                if($this->model->alter($data)){
                        $this->_helper->FlashMessenger->addMessage('Data successfully updated.','success');
                        $this->_redirect('/admin/user');
                    }
            }
        }
    }

    public function removeAction()
    {
        $id = $this->_request->getParam('id');
        if($this->model->remove($id)){
            $this->_helper->FlashMessenger->addMessage('Data successfully removed.','success');
            $this->_redirect('/admin/user');
        }
    }


}

