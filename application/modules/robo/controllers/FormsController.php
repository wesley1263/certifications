<?php
class Robo_FormsController extends Zend_Controller_Action {
    
    
    public function init()
    {
        
    }
    
    public function indexAction()
    {
        if($this->_request->isPost()){
            $data = $this->_request->getPost();
            // Zend_Debug::dump($data);
           // exit;
            define('B',DIRECTORY_SEPARATOR);
            if($this->createFormFile($data)){
                $this->writeFormFile($data);
                $this->_helper->FlashMessenger->addMessage('Arquivo de formulário criado com sucesso.','success');
                $this->_redirect('/robo/forms');
            }else{
                $this->_helper->FlashMessenger->addMessage('Arquivo de form já existe!','error');
                $this->_redirect('/robo/forms');
            }
          
        }
        $this->view->error   = $this->_helper->FlashMessenger->getMessages('error');
        $this->view->success = $this->_helper->FlashMessenger->getMessages('success');
        
    }
    
    protected function createFormFile(array $data)
    {
        $module = APPLICATION_PATH.B.'modules'.B.$data['module_forms'];
        $file = $module.B.'forms'.B.ucfirst($data['name_form']).'.php';
        if(!file_exists($file)){
            $_file = file_put_contents($file, '');
            if($_file){
                chmod($file, 0777);
                return TRUE;
            }else{
                return FALSE;
            }
        }else{
            return FALSE;
        }
    }
    
    protected function writeFormFile(array $data)
    {
        $module = APPLICATION_PATH.B.'modules'.B.$data['module_forms'];
        $file = $module.B.'forms'.B.ucfirst($data['name_form']).'.php';
       
        $moduleName = ucfirst($data['module_forms']);
        $formName = ucfirst($data['name_form']);
        $method = $data['method_form'];
        $action = $data['action_form'];
        
         foreach ($data['labelInput'] as $key => $value) {
                $arrayInput[$key] = array(
                                   'label' => $value,
                                   'name' => $data['nameInput'][$key],
                                   'type' => $data['typeInput'][$key],
                                   'required' => $data['RequiredInput'][$key]
                                   ); 
         }
         
         
         ############## Montando a classe do formulário #############
         $form = '<?php'."\n\n";         
         $form .= "class {$moduleName}_Form_{$formName} extends Zend_Form"."\n";         
         $form .= '{'."\n\n";  
         $form .= 'public function init()'."\n\n";  
         $form .= '{'."\n";  
         $form .= "\$this->setMethod('$method');"."\n";  
         $form .= "\$this->setAction('$action');"."\n";  
         
         $arrayVar = array();       
         foreach ($arrayInput as $key => $value) {
             $arrayVar[$key] = '$'.$value['name'];
             $form .= '$'.$value['name'].' = new Zend_Form_Element_'.ucfirst($value['type'])."('".$value['name']."');\n";
             $form .= '$'.$value['name']."->setLabel('".$value['label']."')
                   ->setAttrib('placeholder','".$value['label']."')
                   ->addValidator('NotEmpty')
                   ->addFilter('StripTags')"."\n";
                   if(isset($value['required'])){
                    $form .= '->setRequired(TRUE);'."\n\n";  
                   }else{
                    $form .= ";\n\n";  
                   }
         }
            
         $form .= '$this->addElements(array('.implode($arrayVar, ',').'));'."\n"; 
         $form .= '}'."\n";  ########## End Method ###########
         $form .= '}'."\n";  ########## End Class ###########
         
         return file_put_contents($file, $form);
         
    }
    
}
