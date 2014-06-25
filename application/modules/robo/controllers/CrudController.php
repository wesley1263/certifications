<?php

class Robo_CrudController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        define('B',DIRECTORY_SEPARATOR);
        $form = new Robo_Form_Tables();
        $this->view->form = $form; 
        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            if($form->isValid($data)){
                unset($data['submit']);
                ########### Open Connetcion with db ############  
                      $db = Zend_Db::factory('Pdo_Mysql',$data);
                      $db->getConnection();
                ########### Open Connetcion with db ############  
                      
                      $tables = $db->fetchAll('SHOW TABLES');
                      foreach ($tables as $arrays) {
                          foreach ($arrays as $key => $value) {
                              $arrayDesc = $db->fetchAll("DESC $value");
                               
                                $_primary = $arrayDesc[0]['Field'];
                                $_model = ucfirst($value).'.php';
                                $_table = $value;
                                
                                if($this->createFileModel($_model)){
                                    if($this->writeFileModel($_model, $_table, $_primary)){
                                        $this->_helper->FlashMessenger->addMessage("Model $_model criado com sucesso.",'success');
                                    }
                                }else{
                                    $this->_helper->FlashMessenger->addMessage("Arquivo $_model já existes!",'error');
                                }
                          }
                      }
                      
                $this->_redirect('/robo/crud');
            }
        }
    }



    protected function createFileModel($file)
    {
        $folder = APPLICATION_PATH.B.'models';
        $_file = $folder.B.$file;
        if(!file_exists($_file)){
            $_file = fopen($_file, 'w');
            if($_file){
                chmod($_file, 0777);
                fclose($_file);
               return TRUE; 
            }else{
                return FALSE;
            }
        }else{
            return FALSE;
        }
    }
    
    
    
    private function writeFileModel($file, $table, $primary)
    {
         $class_model = ucfirst($table);
         $content = <<<MODEL
        
        <?php

class Application_Model_DbTable_{$class_model} extends Zend_Db_Table_Abstract
{

    protected \$_name = '$table';
    protected \$_primary = '$primary';
    
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
            return \$this->update(\$data,\$this->_primary.' = '.\$data['$primary']);
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


        $_file = APPLICATION_PATH.B.'models'.B.$file;
        if(file_exists($_file)){
            if(file_put_contents($_file, $content)){
                return TRUE;
            }else{
                return FALSE;
            }
        }else{
            return FALSE;
        }

    }


}

