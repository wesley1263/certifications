<?php

class Application_Model_DbTable_Type extends Zend_Db_Table_Abstract
{

    protected $_name = 'tbl_type';
    protected $_primary = 'id_type';
    
    
    public function listAll()
    {
        try{
            return $this->fetchAll()->toArray();
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
            return $this->update($data,$this->_primary.' = '.$data['id_type']);
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
        $select->where("title_type = '".$data['id_type']."'");
        $rs = $select->query();
        return $rs->fetchAll();
    }


}

