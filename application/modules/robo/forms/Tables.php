<?php

class Robo_Form_Tables extends Zend_Form {

    public function init() {
        $this -> setMethod('post');
        $this -> setAction('/robo/crud');
        $this->setAttrib('role','form');
        
        $dbname = new Zend_Form_Element_Text('dbname');
        $dbname -> setLabel('Database') 
                -> setAttrib('placeholder', 'Database') 
                -> setAttrib('class', 'form-control') 
                -> addValidator('NotEmpty') 
                -> addFilter('StripTags') 
                -> setRequired(TRUE);

        $host = new Zend_Form_Element_Text('host');
        $host -> setLabel('Hostname') 
              -> setAttrib('placeholder', 'Hostname')
              -> setAttrib('class', 'form-control') 
              -> addValidator('NotEmpty') 
              -> addFilter('StripTags') 
              -> setRequired(TRUE);

        $username = new Zend_Form_Element_Text('username');
        $username -> setLabel('Username ') 
                  -> setAttrib('placeholder', 'Username ') 
                  -> setAttrib('class', 'form-control')
                  -> addValidator('NotEmpty') 
                  -> addFilter('StripTags') 
                  -> setRequired(TRUE);

        $password = new Zend_Form_Element_Password('password');
        $password -> setLabel('Password') 
                  -> setAttrib('placeholder', 'Password') 
                  -> setAttrib('class', 'form-control')
                  -> addValidator('NotEmpty') 
                  -> addFilter('StripTags') 
                  -> setRequired(TRUE);

        $submit = new Zend_Form_Element_Button('submit');
        $submit -> setLabel('Criar')
                -> setAttrib('type','submit')
                -> setAttrib('class','btn btn-primary btn-lg');

        $this -> addElements(array($dbname, $host, $username, $password, $submit));
    }

}
