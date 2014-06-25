<?php

class Robo_Form_Import extends Zend_Form
{

    public function init()
    {
       $this->setName('form_import');
       $this->setMethod('post');
       $this->setAction('/robo/index/import');
       $this->setAttrib('role','form' );
       
       $hostname = new Zend_Form_Element_Text('host');
       $hostname->setLabel('Host Name')
                ->setRequired(TRUE)
                ->setAttrib('required','required')
                ->setAttrib('class','form-control')
                ->setAttrib('placeholder','Host Name')
                ->addValidator('NotEmpty')
                ->addFilter('StripTags');
       
       
       $username = new Zend_Form_Element_Text('username');
       $username->setLabel('Username')
                ->setRequired(TRUE)
                ->setAttrib('required','required')
                ->setAttrib('class','form-control')
                ->setAttrib('placeholder','Username')
                ->addValidator('NotEmpty')
                ->addFilter('StripTags');
       
       
       $username = new Zend_Form_Element_Text('username');
       $username->setLabel('Username')
                ->setRequired(TRUE)
                ->setAttrib('required','required')
                ->setAttrib('class','form-control')
                ->setAttrib('placeholder','Username')
                ->addValidator('NotEmpty')
                ->addFilter('StripTags');  
       
                
       $password = new Zend_Form_Element_Password('password');
       $password->setLabel('Password')
                ->setRequired(TRUE)
                ->setAttrib('required','required')
                ->setAttrib('class','form-control')
                ->setAttrib('placeholder','Password')
                ->addValidator('NotEmpty')
                ->addFilter('StripTags');     
       
       
            
       
       $dbname = new Zend_Form_Element_Text('dbname');
       $dbname->setLabel('Dbname')
                ->setRequired(TRUE)
                ->setAttrib('required','required')
                ->setAttrib('class','form-control')
                ->setAttrib('placeholder','DB Name')
                ->addValidator('NotEmpty')
                ->addFilter('StripTags'); 
                
                
       $tablename = new Zend_Form_Element_Text('tablename');
       $tablename->setLabel('Table Name')
                ->setRequired(TRUE)
                ->setAttrib('required','required')
                ->setAttrib('class','form-control')
                ->setAttrib('placeholder','Table Name')
                ->addValidator('NotEmpty')
                ->addFilter('StripTags'); 
       
       $file = new Zend_Form_Element_File('file_csv');
       $file->setLabel('File Import')
            ->setRequired(TRUE)
            ->setAttrib('class','form-control')
            ->addValidator('Size',FALSE,'2048000')
            ->addValidator('Extension',FALSE,'csv,xls,xlsx');
            
            
       $submit = new Zend_Form_Element_Submit('submit');
       $submit->setLabel('Submit')
              ->setAttrib('class','btn btn-primary btn-lg');
              
              
      $this->addElements(array($hostname,$username,$password,$dbname,$tablename,$file,$submit));
    }


}

