<?php

class Application_Model_DbTable_Role extends Zend_Db_Table_Abstract
{

    protected $_name = 'tbl_role';
    protected $_primary = 'id_role';
    
    public function listAll()
    {
        try{
            return $this->fetchAll();
        }catch(Zend_Exception $e){
            echo $e->getMessage();
        }
    }
    
    public function listOnce($id)
    {
        try{
            return $this->fetchRow($this->_primary.' = '.$id);
        }catch(Zend_Exception $e){
            echo $e->getMessage();
        }
    }
    
    public function save(array $data)
    {
        try{
            return $this->insert($data);
        }catch(Zend_Exception $e){
            echo $e->getMessage();
        }
    }
    
    public function alter(array $data)
    {
        try{
            return $this->update($data,$this->_primary.' = '.$data['id_role']);
        }catch(Zend_Exception $e){
            echo $e->getMessage();
        }
    }
    
    public function remove($id)
    {
        try{
            return $this->delete($this->_primary.' = '.$id);
        }catch(Zend_Exception $e){
            echo $e->getMessage();
        }
    }


}

