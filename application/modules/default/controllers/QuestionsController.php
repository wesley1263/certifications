<?php

class Default_QuestionsController extends Zend_Controller_Action
{

    public function init()
    {
        $this->_auth = Zend_Auth::getInstance();
        $this->view->session =  $this->_auth->getStorage()->read();
        
        $this->question = new Application_Model_DbTable_Question();
        $this->alternative = new Application_Model_DbTable_Alternative();
    }

    public function indexAction()
    {
    	$this->view->questions = $this->question->listLimit(20);
    	$this->view->alternatives = $this->alternative->listAll();
        // action body
    }
    
    public function validatorAction()
    {
    	if($this->_request->isPost()){
    		$data = $this->_request->getPost();
    		$questions = $this->question->listLimit($data['qtd_question']);
    		$contador = $data['qtd_question'];
    		############# Interando Questions ###############
    		foreach ($questions as $key => $value){
    				$id_question = $value['id_questions'];
    				$answer_question = $value['answer_question'];
    				$arrayQuestion['questions'][$id_question] = $answer_question;
    				$description['description'][$id_question] = $value['description_question'];
    		}
    		############# Interando Questions ###############
    		unset($data['qtd_question']);
    		
    	
    		############# Interando Data ###############
    		foreach($data as $key => $value){
    			if(is_array($value)){
    				$value = implode($value,',');
    				$arrayData['alternative'][$key] = $value;
    			}else{
    				$arrayData['alternative'][$key] = $value;
    			}
    		}
    		############# Interando Data ###############
    		
    		$certo = 0;
    		$errado = 0;
    		############## Comparando valores ##############
    		foreach ($arrayQuestion as $key => $value){
    			foreach ($value as $chave => $valor){
    				if($arrayData['alternative'][$chave] == $arrayQuestion['questions'][$chave]){
    					$certo++;
    				}else{
    					$errado++;
    					$arrayErrada['erradas'][$chave] = $description['description'][$chave];
    					$arrayCerta['certas'][$chave] = $valor;
    				}
    			}
    		}
    		
    		$porcentagemAcerto = ($certo * 100) / $contador;
    		$this->view->porcentagem = $porcentagemAcerto;
    		$this->view->certo = $certo;
    		$this->view->errado = $errado;
		if(isset($arrayErrada)){
		$this->view->questoes = $arrayErrada;
		$this->view->alternativas = $arrayCerta;		
		}
    		
    		
    	}
    }


}

