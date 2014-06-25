<?php

class Robo_Form_Crud extends Zend_Form
{

    public function init()
    {
         ########### Listar diretorios ###########
         define('B',DIRECTORY_SEPARATOR);
        $dir = glob(APPLICATION_PATH . B . 'modules/*', GLOB_ONLYDIR);
        foreach ($dir as $key => $value) {
            $value = explode('/', $value);
            $value = end($value);
            $directory[$value] = ucfirst($value);
        }
        ########### Listar diretorios ###########
            
        $this->setMethod('post');
        $this->setName('robo_discover');
        $this->setAction('/robo/index/new');
        $this->setAttrib('role','form' );
        // $this->setElementDecorators( array( 'ViewHelper', 'Label') );
        // $this->setElementDecorators( array(
        // 'ViewHelper',
            // array(
                // array('data'=>'HtmlTag'), 
                // array('tag' => 'td')
                 // ),
            // array('Label', 
                // array('tag' => 'td')
                 // ),
            // array(
                // array('row'=>'HtmlTag'),
                // array('tag'=>'tr')
                // )
              // )
            // );
        
        $controller = New Zend_Form_Element_Text('name_controller');
        $controller->setLabel('Controller Name')
                   ->setRequired(TRUE)
                   ->setAttrib('class','form-control')
                   ->setAttrib('placeholder','Nome do controller')
                   ->addValidator('NotEmpty')
                   ->addErrorMessage('Nome do controller deve ser preenchido!');
                   
        // $model = new Zend_Form_Element_Text('name_model');
        // $model->setLabel('Model Name')
              // ->setRequired(FALSE)
              // ->addValidator('NotEmpty')
              // ->AddErrorMessage('Nome do model deve ser preenchido!')
              // ->setAttrib('class','form-control')
              // ->setAttrib('placeholder','Nome do model');
//               
        // $table = new Zend_Form_Element_Text('name_table');
        // $table->setLabel('Table Name')
              // ->setRequired(FALSE)
              // ->addValidator('NotEmpty')
              // ->addErrorMessage('Nome da tabela deve ser preenchido!')
              // ->setAttrib('class','form-control')
              // ->setAttrib('placeholder','Nome da tabela do DB');
//               
        // $primary = New Zend_Form_Element_Text('primary');
        // $primary->setLabel('Primary key')
                // ->setRequired(FALSE)
                // ->addValidator('NotEmpty')
                // ->addErrorMessage('Chave primaria da tabela deve ser preenchida!')
                // ->setAttrib('class','form-control')
                // ->setAttrib('placeholder','Chave primária da table');
//                 
        $module = new Zend_Form_Element_Select('module_name');
        $module->setLabel('Módulo')
           ->setAttrib('class','form-control')
           ->addMultiOptions($directory);  
           
                 
        $submit = New Zend_Form_Element_Submit('submit');
        $submit->setLabel('Submit')
               ->setAttrib('class','btn btn-primary btn-lg');
        
        $this->addElements(array($controller,$module,$submit));
    }


}

