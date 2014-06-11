<?php

class Admin_IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
        $this->model = new Application_Model_DbTable_Question();
    }

    public function indexAction()
    {
        // $this->_helper->layout->disableLayout();
       $this->view->error = $this->_helper->FlashMessenger->getMessages('error');
        
        if($this->getRequest()->isPost()){
            $dados = $this->getRequest()->getPost();
            $login = $dados['login_user'];
            $senha = $dados['password_user'];
            
            try{
                #####  Pegando adaptador do banco   #####
            $adapter = Zend_Db_Table::getDefaultAdapter();
            
            ##### Instanciando e sincronizando banco com o plugin Zend_Auth #####
            $authAdapter = new Zend_Auth_Adapter_DbTable($adapter);
            
            ##### Informando as entidades de validação ######
            $authAdapter->setTableName('tbl_user')
                        ->setIdentityColumn('login_user')
                        ->setCredentialColumn('password_user')
                        ->setCredentialTreatment('MD5(?)');
            
            ###### Comparando entidades com os post submetidos ######           
            $authAdapter->setIdentity($login)
                        ->setCredential($senha);
                        
            
            ##### Autenticando os dados #####
            $auth = Zend_Auth::getInstance();
            $result = $auth->authenticate($authAdapter);
            
            
            if($result->isValid()){
                $info = $authAdapter->getResultRowObject(null,'password_user');
                $storage = $auth->getStorage();
                $storage->write($info);
                return $this->_redirect('/admin');
                
            }else{
                $this->_helper->FlashMessenger->addMessage('User or Password invalid!','error');
                $this->_redirect('/');
            }
            
            }catch(Zend_Exception $e){
                echo $e->getMessage();
            }
        }//End if getRequest()->isPost()
    }

    public function logoutAction()
    {
        $auth = Zend_Auth::getInstance();
        $auth->clearIdentity();
        $this->_redirect('/admin');
    }


}

