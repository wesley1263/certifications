<?php

class Robo_IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $this->_helper->layout->disableLayout();
        $form  = new Robo_Form_Crud();
       
        
        $this->view->form = $form;
        $this->view->success = $this->_helper->FlashMessenger->getMessages('success');
        $this->view->error   = $this->_helper->FlashMessenger->getMessages('error');
    }
    
    public function newAction()
    {
        $form = new Robo_Form_Crud();
        if($this->_request->isPost()){
            $data = $this->_request->getPost();
                if($form->isValid($data)){
                    unset($data['submit']);
                    // Zend_Debug::dump($data);
                    if($this->createController($data)){
                        $this->_helper->FlashMessenger->addMessage('Controller criado com sucesso','success');
                    }else{
                        $this->_helper->FlashMessenger->addMessage('Houve um erro ao tentar criar o controller','error');
                    }
                   
                }
                
             $this->_redirect('/robo');   
        }
    }
    
    protected function createController($data)
    {
        define('B',DIRECTORY_SEPARATOR);
        $file_controller = APPLICATION_PATH.B.'modules'.B.$data['module_name'].B.'controllers'.B.ucfirst($data['name_controller']).'Controller.php';
        if(file_exists($file_controller)){
            $this->_helper->FlashMessenger->addMessage('<h2>Controller <b>"'.ucfirst($data['']).'Controller.php</b>" no module "<b>'.$data[''].'</b>" ja existe!</h2>','error');
            }else{
            $controller = ucfirst($data['name_controller']);
            $module = ucfirst($data['module_name']);
            $id = $data['primary'];
            $model = ucfirst($data['name_model']);
            $content = <<<CONTROLLER
<?php
class {$module}_{$controller}Controller extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
        \$this->flashmessenger = \$this->_helper->FlashMessenger; 
        \$this->filter = new Application_Model_Validators();
    }

    public function indexAction()
    {
        \$this->view->success = \$this->flashmessenger->getMessages('success');
        \$this->view->error = \$this->flashmessenger->getMessages('error');
    } 
    
    public function newAction()
    {
        if(\$this->_request->isPost()){
            \$data = \$this->_request->getPost();
                \$this->filter->filterXSS(\$data);
            if(\$data['$id'] == null){
                if(\$this->model->save(\$data)){
                     \$this->flashmessenger->addMessage('Dados salvo com sucesso','success');
                     \$this->_redirect('/$module');
                }
            }else{
                 if(\$this->model->alter(\$data)){
                     \$this->flashmessenger->addMessage('Dados atualizado com sucesso','success');
                     \$this->_redirect('/$module');
                }
            }
        }
    }
    public function remove()
    {
        if(\$this->model->remove(\$this->_request->getParams($id))){
             \$this->flashmessenger->addMessage('Dados removido com sucesso','success');
             \$this->_redirect('/$module');
        }else{
            \$this->flashmessenger->addMessage('Ocorreu um error ao tentar remover!','error');
             \$this->_redirect('/$module');
        }
        
    }
}           
CONTROLLER;
            
            if(file_put_contents($file_controller, $content)){
                chmod($file_controller, 0777);
                $view = APPLICATION_PATH.B.'modules'.B.strtolower($module).B.'views'.B.'scripts'.B.strtolower($controller);
                mkdir($view);
                chmod($view,0777);
                
                ########## Create file index ##############
                $file_phtml = $view.B.'index.phtml';
                file_put_contents($file_phtml,'');
                chmod($file_phtml,0777);
                
                
                ########## Create file index ##############
                $file_phtml = $view.B.'new.phtml';
                file_put_contents($file_phtml,'');
                chmod($file_phtml,0777);
                
                ########## Create file index ##############
                $file_phtml = $view.B.'remove.phtml';
                file_put_contents($file_phtml,'');
                chmod($file_phtml,0777);
                
                return TRUE;
            }
        }
    }

    
    
    protected function createModel(array $data)
    {
        $class_model = ucfirst($data['name_model']);
        $table_name = $data['name_table'];
        $primary_key = $data['primary'];
        $directory = APPLICATION_PATH.B.'models/DbTable';
        
        
        $content = <<<MODEL
        
        <?php

class Application_Model_DbTable_{$class_model} extends Zend_Db_Table_Abstract
{

    protected \$_name = '$table_name';
    protected \$_primary = '$primary_key';
    
    public function listAll()
    {
        try{
            return \$this->fetchAll()->toArray();
        }catch(Zend_Exception \$e){
            echo \$e->getMessage();
        }
    }
    
    public function listOnce(\$id)
    {
        try{
            return \$this->fetchRow(\$this->_primary.' = '.\$id)->toArray();
        }catch(Zend_Exception \$e){
            echo \$e->getMessage();
        }
    }
    
    public function save(array \$data)
    {
        try{
            return \$this->insert(\$data);
        }catch(Zend_Exception \$e){
            echo \$e->getMessage();
        }
    }
    
    public function alter(array \$data)
    {
        try{
            return \$this->update(\$data,\$this->_primary.' = '.\$data['$primary_key']);
        }catch(Zend_Exception \$e){
            echo \$e->getMessage();
        }
    }
    
    
    public function remove(\$id)
    {
        try{
            return \$this->delete(\$this->_primary.' = '.\$id);
        }catch(Zend_Exception \$e){
            echo \$e->getMessage();
        }
    }


}
MODEL;
        $file_model = $directory.B.$class_model.'.php';
        if(file_exists($file_model)){
            $this->_helper->FlashMessenger->addMessage('Models: '.$class_model.' já existe!','error');
        }else{
            if(file_put_contents($file_model,$content)){
                chmod($file_model,0777);
                return true;
            }
        }
        
        
    }


    

    public function importAction()
    {
        set_time_limit(300);
        $form = new Robo_Form_Import();
        $this->view->form = $form;
        
        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            unset($data['submit']);
            if($form->isValid ($data)){
                    
                $upload = new Zend_File_Transfer_Adapter_Http();
                $upload->setDestination('/tmp');
               
                if($upload->isUploaded()){
                    $file = $upload->getFileInfo();
                    $name = $upload->getFileName();
                    $old = '/tmp/'.$file['file_csv']['name'];
                    $new = '/tmp/'.sha1($file['file_csv']['name'].time()).'.'.substr($file['file_csv']['name'],-3);
                    
                    if($upload->receive()){
                      
                      $tablename = $data['tablename'];
                      unset($data['tablename']);
                      
                      ########### Open Connetcion with db ############  
                      $db = Zend_Db::factory('Pdo_Mysql',$data);
                      $db->getConnection();
                      
                      
                      rename($old, $new);
                      $arquivo = file($new);
                      $rows = $db->fetchAll("DESC $tablename");
                      
                      
                      $cont = 0;
                      foreach ($rows as $value) {
                          $cont++;
                          $arrayRows[$cont] = $value['Field'];
                      }
                      $field = implode($arrayRows,',');
                      
                      
                      foreach ($arquivo as $value) {
                          $arrayValue = explode(',', $value);
                          $values = "'".implode($arrayValue, "','")."'";
                          $ok = $db->query("INSERT INTO $tablename ($field) VALUES ($values)");
                      }
                      
                      
                      if($ok){
                          $this->_redirect('/robo/index/import');
                      }
                       
                    }
                }
                
            }
        }
        
    }



    

}

