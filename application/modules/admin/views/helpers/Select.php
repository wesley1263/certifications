<?php 
class Zend_View_Helper_Select extends Zend_View_Helper_Abstract {
    
    public function select($name, array $data, $selected = null, $class = null)
    {
        $select = "<select name='$name' class='$class'>";
        foreach ($data as $key => $value) {
            if($selected == $key){
                $select .= "<option value='$key' selected='selected'>$value</option>";
            }else{
                $select .= "<option value='$key'>$value</option>";
            }
        }
        $select .= "</select>";
        
        return $select;
    }
}
