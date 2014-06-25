<?php

class Application_Model_DbTable_User extends Zend_Db_Table_Abstract
{

    protected $_name = 'tbl_user';
    protected $_primary = 'id_user';
    
    
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
            return $this->update($data,$this->_primary.' = '.$data['id_user']);
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
    
    public function verify($data)
    {
        $select = $this->select();
        $select->where("login_user = '".$data['login_user']."'");
        $rs = $select->query();
        return $rs->fetchAll();
    }

}

